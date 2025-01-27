#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <arpa/inet.h>

#include <openssl/ssl.h>
#include <openssl/err.h>

#define CERTIFICATE_FILE_NAME "cert.pem"

#define PORT_NUMBER 12348

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

    int sock = -1;
    SSL_CTX *ctx = NULL;
    SSL* ssl = NULL;
    char buf[1024];
    int bytes;

    //create SSL_CTX
    const SSL_METHOD *method;
    method = TLS_client_method();
    ctx = SSL_CTX_new(method);

    if (!ctx) {
        perror("Unable to create SSL context\n");
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }

    //reducing memory footprint
    SSL_CTX_set_options(ctx, SSL_OP_NO_COMPRESSION | SSL_MODE_RELEASE_BUFFERS);

    //load ca cert
    SSL_CTX_load_verify_locations(ctx, CERTIFICATE_FILE_NAME, NULL);

    //set ciphersuite
    SSL_CTX_set_ciphersuites(ctx, "TLS_CHACHA20_POLY1305_SHA256");

    //create socket
    sock = create_socket(PORT_NUMBER);

    //create ssl
    ssl = SSL_new(ctx);

    //attach the fd to ssl
    SSL_set_fd(ssl, sock);

    //connect to server
    if (SSL_connect(ssl) != 1) {
        perror("Error: Could not build a SSL session.\n");
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }
    else {
        printf("Successfully enabled SSL/TLS session to localhost.\n");
        printf("Ciphersuite used %s\n", SSL_get_cipher(ssl));
    }

    //read the server response
    bytes = SSL_read(ssl, buf, sizeof(buf));
    buf[bytes] = 0;
    if (bytes)
        printf("Received: \"%s\"\n", buf);

    SSL_free(ssl);
    SSL_CTX_free(ctx);
    close(sock);

    return 0;
}