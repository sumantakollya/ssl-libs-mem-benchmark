MBEDTLS VS OPENSSL BASIC BENCHMARK
==================================
This repo contains basic benchmark of mbedtls and openssl.

> Used psrecord and valgrind massif tool to record the cpu and memory usage.

 mbedtls version used : 3.4.9
 openssl version used : 1.1.1w

 MBEDTLS memory results 1 session
 ===============
 mbedtls client
 ![image](https://github.com/user-attachments/assets/dbf4708c-9a2c-4eff-bac1-eaf74beb277b)
 mbedtls server
 ![image](https://github.com/user-attachments/assets/2f6f5f9d-2aec-47fa-b191-2977f7addb92)

 OPENSSL memory results 1 session
 ===============
openssl client
![image](https://github.com/user-attachments/assets/0b2e1940-35ef-4ca2-8249-63ad9445e3e5)
openssl server
![image](https://github.com/user-attachments/assets/afb55c85-ad54-41c2-9eaa-4e00bf746c19)

CPU results
===========
mbedtls 100 client 1 server
![image](https://github.com/user-attachments/assets/275ac4b5-fef1-4094-aa13-e3f419ef4578)

openssl 100 client 1 server
![image](https://github.com/user-attachments/assets/0f856b4d-fdf1-427d-bae8-33adef643992)

