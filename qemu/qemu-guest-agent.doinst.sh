config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    rm $NEW
  fi
}

preserve_perms() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ -e $OLD ]; then
    cp -a $OLD ${NEW}.incoming
    cat $NEW > ${NEW}.incoming
    mv ${NEW}.incoming $NEW
  fi
  config $NEW
}

preserve_perms etc/rc.d/rc.qemu-ga.new

# Update rc.local so that QEMU Guest Agent will be started on boot:
if ! grep "rc.qemu-ga" etc/rc.d/rc.local 1>/dev/null 2>&1 ; then
  cat <<_EOM_ >> etc/rc.d/rc.local

if [ -x /etc/rc.d/rc.qemu-ga ]; then
  # Start QEMU Guest Agent:
  echo "Starting QEMU Guest Agent:    /etc/rc.d/rc.qemu-ga start"
  /etc/rc.d/rc.qemu-ga start
fi
_EOM_
fi


