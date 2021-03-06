# -*- mode: sh; -*-
# /etc/zsh/zprofile
# $Header: /var/cvsroot/gentoo-x86/app-shells/zsh/files/zprofile,v 1.4 2007/05/07 06:51:11 usata Exp $

# Load environment settings from profile.env, which is created by
# env-update from the files in /etc/env.d
if [ -e /etc/profile.env ] ; then
    . /etc/profile.env
fi

#077 would be more secure, but 022 is generally quite realistic
umask 022

# Set up PATH depending on whether we're root or a normal user.
# There's no real reason to exclude sbin paths from the normal user,
# but it can make tab-completion easier when they aren't in the
# user's PATH to pollute the executable namespace.
#
# It is intentional in the following line to use || instead of -o.
# This way the evaluation can be short-circuited and calling whoami is
# avoided.
if [ "$EUID" = "0" ] || [ "$USER" = "root" ] ; then
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${ROOTPATH}"
else
    PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"
fi
export PATH
unset ROOTPATH

# Extract the value of EDITOR
[ -z "$EDITOR" ] && EDITOR="`. /etc/rc.conf 2>/dev/null; echo $EDITOR`"
[ -z "$EDITOR" ] && EDITOR="/bin/nano"
export EDITOR

shopts=$-
setopt nullglob
for sh in /etc/profile.d/*.sh ; do
    if [ -r "$sh" ] ; then
	. "$sh"
    fi
done
unsetopt nullglob
set -$shopts
unset sh shopts
