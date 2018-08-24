# Start a D-Bus session
# Source the below file only if you do not already use the default xinitrc skeleton. 
# Otherwise you will end up with multiple dbus sessions.
# source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
# export GPG_AGENT_INFO SSH_AUTH_SOCK
exec awesome
