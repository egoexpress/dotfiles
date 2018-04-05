
glowing-bear() {
  python -c 'import BaseHTTPServer as bhs, SimpleHTTPServer as shs; bhs.HTTPServer(("127.0.0.1", 8000), shs.SimpleHTTPRequestHandler).serve_forever()'
}

weechat-backup-config() {
  for FILE in $(find ~/.private/weechat/weechat.relative -name "*.conf" -type f);
  do
    FILENAME=$(basename $FILE)
    cp /opt/weechat/.weechat/$FILENAME $FILE
  done

  for FILE in $(find ~/.dotfiles/weechat/weechat.symlink -name "*.conf" -type f);
  do
    FILENAME=$(basename $FILE)
    cp /opt/weechat/.weechat/$FILENAME $FILE
  done
}
