# wal -R

neofetch

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

force_color_prompt=yes

dDefault='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

dcustom1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][\[\033[01;36m\]\d \t\[\033[01;31m\]]\[\033[01;36m\]\u\[\033[01;31m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

dcustom2='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[01;31m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1=$dcustom2
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

if [ -f ./.bash_aliases ]; then
    . ./.bash_aliases
fi

if [ -f ./.bash_customs ]; then
    . ./.bash_customs
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export HISTCONTROL=ignoreboth

export PATH=$PATH:/home/alex/.spicetify

# Created by `pipx` on 2025-07-27 16:41:37
#export PATH="$PATH:/home/alex/.local/bin"
