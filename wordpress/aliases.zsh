
# update wordpress to the latest version
[ -d $HOME/websites ] && {
  source ~/.private/wordpress/*
  
  update-wordpress () {
    ERRORLOG=/tmp/wordpress-update.$$.log
    rm -rf ${ERRORLOG}
    
    # backup current installation
    cd ${WORDPRESS_PATH}
    rm -f ../blog-backup.tar.gz
    echo -n "Creating blog backup..."
    tar czf ../blog-backup.tar.gz wp-config.php wp-content 2>${ERRORLOG}
    echo "done"
    [ -r ${ERRORLOG} ] && {
      echo "Errors:"
      cat ${ERRORLOG}
    }

    # perform update
    echo -n "Performing update..."
    curl -s https://de.wordpress.org/latest-de_DE.tar.gz | tar -xzf - --strip-components=1
    echo "done"
    cd - &>/dev/null
    rm -f ${ERRORLOG}
  }
}
