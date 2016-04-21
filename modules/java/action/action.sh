post_install() {
  JAVA_BASE="$HOME/dev/java/"
  JDK_VERSION="$(get version)"
  JDK_VERSION_SHORT="$(get version_short)"
  JDK_DOWNLOAD_URL=$(printf $(get url_tpl) $JDK_VERSION $JDK_VERSION_SHORT)
  JDK_DOWNLOAD_NAME=jdk-${JDK_VERSION_SHORT}-linux-x64.tar.gz

  [ -r $JDK_DOWNLOAD_NAME ] || {
    aria2c \
      --header "Cookie: oraclelicense=accept-securebackup-cookie" \
      "$JDK_DOWNLOAD_URL" -o "$JDK_DOWNLOAD_NAME"
  }
  tar xf "$JDK_DOWNLOAD_NAME"
}
