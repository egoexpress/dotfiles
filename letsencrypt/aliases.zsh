#!/usr/bin/env zsh

[ -d $HOME/.private/letsencrypt ] && source ~/.private/letsencrypt/*

[ -d /usr/local/etc/dehydrated ] && {

  letsencrypt-update-dehydrated() {
    # refresh certificates
    sudo dehydrated -c

    CERTDIR=${DEHYDRATED_CERTDIR}

    # update cert information for weechat
    cd $HOME/.weechat/ssl
    sudo cat ${CERTDIR}/privkey.pem ${CERTDIR}/cert.pem > relay.pem
    sudo chown $USER:$USER relay.pem
    sudo service apache24 restart
    echo "Make sure to run /relay sslcertkey in WeeChat"
    cd - >/dev/null
  }
}

[ -x /usr/local/bin/letsencrypt ] && {
  # update Let's Encrypt certificates on Uberspace servers
  letsencrypt-update-uberspace() {

    _CERT_LIFETIME=`uberspace-list-certificates | grep "will be removed" | grep -Po '\d+'`
    if [ $? -eq 1 ]; then
      _CERT_LIFETIME=0
    fi

    if [ ${_CERT_LIFETIME} -lt 14 ]; then
      LE_PATH=$HOME/.config/letsencrypt

      [ -r $LE_PATH/cli.ini ] || uberspace-letsencrypt
      letsencrypt certonly
      [ $? -eq 0 ] && {
        uberspace-add-certificate -k ${UBERSPACE_CERTDIR}/privkey.pem \
          -c ${UBERSPACE_CERTDIR}/cert.pem
      }
    fi
    unset _CERT_LIFETIME
  }
}

