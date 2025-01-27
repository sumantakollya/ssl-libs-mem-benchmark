#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <arpa/inet.h>

#include <openssl/ssl.h>
#include <openssl/err.h>

/* openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem */
#define CERTIFICATE_FILE_NAME "cert.pem"
#define PRIVATE_KEY_FILE_NAME "key.pem"

#define SERVER_RESPONSE "HTTP/1.1 200 OK"

#define PORT_NUMBER 12348

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

    int sock = -1;
    SSL_CTX *ctx = NULL;
    SSL* ssl = NULL;
    int client = -1;

    //create SSL_CTX
    const SSL_METHOD *method;
    method = TLS_server_method();
    ctx = SSL_CTX_new(method);

    if (!ctx) {
        perror("Unable to create SSL context\n");
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }

    if (SSL_CTX_use_certificate_file(ctx, CERTIFICATE_FILE_NAME, SSL_FILETYPE_PEM) <= 0)
    {
        perror("Unable to read cert.pem.\n");
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }

    if (SSL_CTX_use_PrivateKey_file(ctx, PRIVATE_KEY_FILE_NAME, SSL_FILETYPE_PEM) <= 0)
    {
        perror("Unable to read key.pem.\n");
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }

    //memory footprint
    SSL_CTX_set_options(ctx, SSL_OP_NO_COMPRESSION | SSL_MODE_RELEASE_BUFFERS);

    //create socket
    sock = create_socket(PORT_NUMBER);

    //handle connection
    while(1)
    {
        client = accept(sock, NULL, NULL);
        if (client < 0)
        {
            perror("Unable to accept.\n");
            exit(EXIT_FAILURE);
        }

        ssl = SSL_new(ctx);

        SSL_set_fd(ssl, client);

        if (SSL_accept(ssl) <= 0)
        {
            perror("Unable to SSL accept.\n");
            ERR_print_errors_fp(stderr);
        }
        else
        {
            printf("New SSL connection accepted.\n");
            SSL_write(ssl, SERVER_RESPONSE, strlen(SERVER_RESPONSE));
        }

        SSL_free(ssl);
        ssl = NULL;

        close(client);
        client = -1;
    }

    //Cleanup
    close(sock);
    sock = -1;

    SSL_CTX_free(ctx);
    ctx = NULL;

    return 0;
}