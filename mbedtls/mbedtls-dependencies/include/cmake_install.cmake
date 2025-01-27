# Install script for directory: /home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/aes.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/aria.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/asn1.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/asn1write.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/base64.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/bignum.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/block_cipher.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/build_info.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/camellia.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ccm.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/chacha20.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/chachapoly.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/check_config.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/cipher.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/cmac.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/compat-2.x.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_adjust_legacy_crypto.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_adjust_legacy_from_psa.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_adjust_psa_from_legacy.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_adjust_psa_superset_legacy.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_adjust_ssl.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_adjust_x509.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/config_psa.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/constant_time.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ctr_drbg.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/debug.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/des.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/dhm.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ecdh.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ecdsa.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ecjpake.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ecp.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/entropy.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/error.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/gcm.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/hkdf.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/hmac_drbg.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/lms.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/mbedtls_config.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/md.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/md5.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/memory_buffer_alloc.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/net_sockets.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/nist_kw.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/oid.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/pem.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/pk.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/pkcs12.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/pkcs5.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/pkcs7.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/platform.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/platform_time.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/platform_util.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/poly1305.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/private_access.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/psa_util.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ripemd160.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/rsa.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/sha1.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/sha256.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/sha3.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/sha512.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ssl.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ssl_cache.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ssl_ciphersuites.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ssl_cookie.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/ssl_ticket.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/threading.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/timing.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/version.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/x509.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/x509_crl.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/x509_crt.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/mbedtls/x509_csr.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/build_info.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_adjust_auto_enabled.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_adjust_config_dependencies.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_adjust_config_key_pair_types.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_adjust_config_synonyms.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_builtin_composites.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_builtin_key_derivation.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_builtin_primitives.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_compat.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_config.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_driver_common.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_driver_contexts_composites.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_driver_contexts_key_derivation.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_driver_contexts_primitives.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_extra.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_legacy.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_platform.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_se_driver.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_sizes.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_struct.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_types.h"
    "/home/sumakoll/Git/ssl-libs-binaries/mbedtls/mbedtls-3.6.2/include/psa/crypto_values.h"
    )
endif()

