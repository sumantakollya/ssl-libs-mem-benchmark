gcc -I/home/sumakoll/Git/ssl-libs-mem-benchmark/mbedtls/mbedtls-dependencies/include -L/home/sumakoll/Git/ssl-libs-mem-benchmark/mbedtls/mbedtls-dependencies/library mbedtls-server.c -o mbedtls_server -lmbedtls -lmbedx509 -lmbedcrypto
gcc -I/home/sumakoll/Git/ssl-libs-mem-benchmark/mbedtls/mbedtls-dependencies/include -L/home/sumakoll/Git/ssl-libs-mem-benchmark/mbedtls/mbedtls-dependencies/library mbedtls-client.c -o mbedtls_client -lmbedtls -lmbedx509 -lmbedcrypto

#valgrind --tool=massif --massif-out-file=server_massif ./mbedtls_server
#valgrind --tool=massif --massif-out-file=client_massif ./mbedtls_client