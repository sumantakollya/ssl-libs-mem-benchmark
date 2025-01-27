#https://aticleworld.com/ssl-server-client-using-openssl-in-c/
#https://fm4dd.com/openssl/sslconnect.shtm
#https://gist.github.com/amir-saniyan/5c90f0098b171c5fc01fa143c1dc43ad
gcc -I/home/sumakoll/Git/ssl-libs-mem-benchmark/openssl/openssl-1.1.1w-dependencies/include -L/home/sumakoll/Git/ssl-libs-mem-benchmark/openssl/openssl-1.1.1w-dependencies/lib openssl-server.c -o openssl_server -lssl -lcrypto
gcc -I/home/sumakoll/Git/ssl-libs-mem-benchmark/openssl/openssl-1.1.1w-dependencies/include -L/home/sumakoll/Git/ssl-libs-mem-benchmark/openssl/openssl-1.1.1w-dependencies/lib openssl-client.c -o openssl_client -lssl -lcrypto

#valgrind --tool=massif --massif-out-file=server_massif ./openssl_server
#valgrind --tool=massif --massif-out-file=client_massif ./openssl_client