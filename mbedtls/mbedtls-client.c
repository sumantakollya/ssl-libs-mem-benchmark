#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <arpa/inet.h>

#include "mbedtls/net_sockets.h"
#include "mbedtls/ssl.h"
#include "mbedtls/entropy.h"
#include "mbedtls/ctr_drbg.h"
#include "mbedtls/error.h"

#define CERTIFICATE_FILE_NAME "cert.pem"
#define PORT_NUMBER 12349

static int create_socket(int port) {
    int s;
    struct sockaddr_in srv_addr;

    srv_addr.sin_family = AF_INET;
    srv_addr.sin_port = htons(port);
    srv_addr.sin_addr.s_addr = htonl(INADDR_ANY);

    s = socket(AF_INET, SOCK_STREAM, 0);
    if (s < 0) {
        perror("Unable to create socket\n");
        exit(EXIT_FAILURE);
    }

    if (connect(s, (struct sockaddr *) &srv_addr, sizeof(struct sockaddr)) == -1) {
        perror("Error: Cannot connect to localhost.\n");
        exit(EXIT_FAILURE);
    }

    return s;
}

int main() {
    int ret;
    int sock = -1;
    mbedtls_ssl_context ssl;
    mbedtls_ssl_config conf;
    mbedtls_x509_crt cacert;
    mbedtls_ctr_drbg_context ctr_drbg;
    mbedtls_entropy_context entropy;
    char buf[1024];
    const char *pers = "ssl_client";

    mbedtls_ssl_init(&ssl);
    mbedtls_ssl_config_init(&conf);
    mbedtls_x509_crt_init(&cacert);
    mbedtls_ctr_drbg_init(&ctr_drbg);
    mbedtls_entropy_init(&entropy);

    if ((ret = mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func, &entropy, (const unsigned char *)pers, strlen(pers))) != 0) {
        printf("mbedtls_ctr_drbg_seed returned %d\n", ret);
        goto exit;
    }

    if ((ret = mbedtls_x509_crt_parse_file(&cacert, CERTIFICATE_FILE_NAME)) != 0) {
        printf("mbedtls_x509_crt_parse_file returned %d\n", ret);
        goto exit;
    }

    // Manually create the socket
    sock = create_socket(PORT_NUMBER);

    if ((ret = mbedtls_ssl_config_defaults(&conf, MBEDTLS_SSL_IS_CLIENT, MBEDTLS_SSL_TRANSPORT_STREAM, MBEDTLS_SSL_PRESET_DEFAULT)) != 0) {
        printf("mbedtls_ssl_config_defaults returned %d\n", ret);
        goto exit;
    }

    mbedtls_ssl_conf_authmode(&conf, MBEDTLS_SSL_VERIFY_OPTIONAL);
    mbedtls_ssl_conf_ca_chain(&conf, &cacert, NULL);
    mbedtls_ssl_conf_rng(&conf, mbedtls_ctr_drbg_random, &ctr_drbg);

    if ((ret = mbedtls_ssl_setup(&ssl, &conf)) != 0) {
        printf("mbedtls_ssl_setup returned %d\n", ret);
        goto exit;
    }

    // Set the file descriptor manually
    mbedtls_ssl_set_bio(&ssl, &sock, mbedtls_net_send, mbedtls_net_recv, NULL);

    if ((ret = mbedtls_ssl_handshake(&ssl)) != 0) {
        printf("mbedtls_ssl_handshake returned -0x%x\n", -ret);
        goto exit;
    }

    printf("Successfully enabled SSL/TLS session to localhost.\n");
    printf("Ciphersuite used %s\n", mbedtls_ssl_get_ciphersuite(&ssl));

    if ((ret = mbedtls_ssl_read(&ssl, (unsigned char *)buf, sizeof(buf) - 1)) < 0) {
        printf("mbedtls_ssl_read returned %d\n", ret);
        goto exit;
    }

    buf[ret] = '\0';
    printf("Received: \"%s\"\n", buf);

exit:
    mbedtls_ssl_free(&ssl);
    mbedtls_ssl_config_free(&conf);
    mbedtls_x509_crt_free(&cacert);
    mbedtls_ctr_drbg_free(&ctr_drbg);
    mbedtls_entropy_free(&entropy);
    close(sock);

    return ret != 0;
}