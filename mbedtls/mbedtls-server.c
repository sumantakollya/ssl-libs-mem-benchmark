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
#define PRIVATE_KEY_FILE_NAME "key.pem"

#define SERVER_RESPONSE "HTTP/1.1 200 OK"

#define PORT_NUMBER 12349

static int create_socket(int port) {
    int s;
    struct sockaddr_in addr;

    addr.sin_family = AF_INET;
    addr.sin_port = htons(port);
    addr.sin_addr.s_addr = htonl(INADDR_ANY);

    s = socket(AF_INET, SOCK_STREAM, 0);
    if (s < 0) {
        perror("Unable to create socket\n");
        exit(EXIT_FAILURE);
    }

    if (bind(s, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        perror("Unable to bind\n");
        exit(EXIT_FAILURE);
    }

    if (listen(s, 1) < 0) {
        perror("Unable to listen\n");
        exit(EXIT_FAILURE);
    }

    return s;
}

int main() {
    int ret;
    int sock = -1;
    int client = -1;
    mbedtls_ssl_context ssl;
    mbedtls_ssl_config conf;
    mbedtls_x509_crt srvcert;
    mbedtls_pk_context pkey;
    mbedtls_ctr_drbg_context ctr_drbg;
    mbedtls_entropy_context entropy;
    char buf[1024];
    const char *pers = "ssl_server";

    mbedtls_ssl_init(&ssl);
    mbedtls_ssl_config_init(&conf);
    mbedtls_x509_crt_init(&srvcert);
    mbedtls_pk_init(&pkey);
    mbedtls_ctr_drbg_init(&ctr_drbg);
    mbedtls_entropy_init(&entropy);

    if ((ret = mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func, &entropy, (const unsigned char *)pers, strlen(pers))) != 0) {
        printf("mbedtls_ctr_drbg_seed returned %d\n", ret);
        goto exit;
    }

    if ((ret = mbedtls_x509_crt_parse_file(&srvcert, CERTIFICATE_FILE_NAME)) != 0) {
        printf("mbedtls_x509_crt_parse_file returned %d\n", ret);
        goto exit;
    }
     
    if ((ret = mbedtls_pk_parse_keyfile(&pkey, PRIVATE_KEY_FILE_NAME, NULL, mbedtls_ctr_drbg_random, &ctr_drbg)) != 0) {
        printf("mbedtls_pk_parse_keyfile returned %d\n", ret);
        goto exit;
    }

    // Manually create the socket
    sock = create_socket(PORT_NUMBER);

    if ((ret = mbedtls_ssl_config_defaults(&conf, MBEDTLS_SSL_IS_SERVER, MBEDTLS_SSL_TRANSPORT_STREAM, MBEDTLS_SSL_PRESET_DEFAULT)) != 0) {
        printf("mbedtls_ssl_config_defaults returned %d\n", ret);
        goto exit;
    }

    mbedtls_ssl_conf_authmode(&conf, MBEDTLS_SSL_VERIFY_OPTIONAL);
    mbedtls_ssl_conf_ca_chain(&conf, &srvcert, NULL);
    mbedtls_ssl_conf_rng(&conf, mbedtls_ctr_drbg_random, &ctr_drbg);
    mbedtls_ssl_conf_own_cert(&conf, &srvcert, &pkey);

    if ((ret = mbedtls_ssl_setup(&ssl, &conf)) != 0) {
        printf("mbedtls_ssl_setup returned %d\n", ret);
        goto exit;
    }

    // Handle connections
    while (1) {
        client = accept(sock, NULL, NULL);
        if (client < 0) {
            perror("Unable to accept.\n");
            exit(EXIT_FAILURE);
        }

        mbedtls_ssl_set_bio(&ssl, &client, mbedtls_net_send, mbedtls_net_recv, NULL);

        if ((ret = mbedtls_ssl_handshake(&ssl)) != 0) {
            printf("mbedtls_ssl_handshake returned -0x%x\n", -ret);
            goto exit;
        }

        printf("New SSL connection accepted.\n");
        if ((ret = mbedtls_ssl_write(&ssl, (unsigned char *)SERVER_RESPONSE, strlen(SERVER_RESPONSE))) < 0) {
            printf("mbedtls_ssl_write returned %d\n", ret);
            goto exit;
        }

        mbedtls_ssl_session_reset(&ssl);
        close(client);
        client = -1;
    }

exit:
    mbedtls_ssl_free(&ssl);
    mbedtls_ssl_config_free(&conf);
    mbedtls_x509_crt_free(&srvcert);
    mbedtls_pk_free(&pkey);
    mbedtls_ctr_drbg_free(&ctr_drbg);
    mbedtls_entropy_free(&entropy);
    close(sock);

    return ret != 0;
}