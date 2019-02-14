# fix curl for Linuxbrew on CentOS 6
# see: https://github.com/Linuxbrew/homebrew-core/issues/236#issuecomment-218055065
export CURL_CA_BUNDLE=$(brew --prefix)/etc/openssl/cert.pem
