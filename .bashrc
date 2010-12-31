# Файл пользовательских настроек ~/.bashrc
# Исполняется bash(1) для интерктивных сеансов.

# Если сеанс неинтерактивный, ничего не делаем
[ -z "$PS1" ] && return

# Переменная окружения PATH
# Erlang Erlang R14B01
export PATH=${PATH}:/opt/erl14/bin/

# Настройка истории комманд
# Убивать дубликаты истории самым жестоким образом
export HISTCONTROL=ignoreboth:erasedups
# Размер истории комманд
export HISTFILESIZE=65536
export HISTSIZE=32768
# Формат времени истории комманд (2010-12-09 02:34:01 MSK)
export HISTTIMEFORMAT='%F %T %Z '
# Игнорировать все двухбуквенные комманды
export HISTIGNORE='??'

# Настройки оболчки
# Дописывать историю, не удалять
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Важные переменные окружения
export EDITOR='vi'

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# "Шпаргалка" цветов
# Всё это пока в глобалоном простанстве имён.
# Придумаю лучше - изменю, но скорее всего так и останется:)

export COLD="\033[00m"   # Сброс цвета/фона

# Обычные цвета
export COLK="\033[0;30m" # Чёрный
export COLR="\033[0;31m" # Красный
export COLG="\033[0;32m" # Зелёный
export COLY="\033[0;33m" # Жёлтый
export COLB="\033[0;34m" # Синий
export COLM="\033[0;35m" # Пурпурный
export COLC="\033[0;36m" # Голубой
export COLW="\033[0;37m" # Белый

# Жирные
export BLDK="\033[1;30m"
export BLDR="\033[1;31m"
export BLDG="\033[1;32m"
export BLDY="\033[1;33m"
export BLDB="\033[1;34m"
export BLDM="\033[1;35m"
export BLDC="\033[1;36m"
export BLDW="\033[1;37m"

# Фон
export BCGK="\033[40m"
export BCGR="\033[41m"
export BCGG="\033[42m"
export BCGY="\033[43m"
export BCGB="\033[44m"
export BCGM="\033[45m"
export BCGC="\033[46m"
export BCGW="\033[47m"

# Вывод определённого цвета, если текущий каталог доступен пользователю на запись.
function pwdcol() {
    if [ -w ${PWD} ]; then
        echo -e ${COLW}
    else
        echo -e ${BLDR}
    fi
}

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # Оригинальное приглашение
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

    # Управляющие последовательности всегда следует отбивать с помощью \[...\],
    # чтобы не поломать приглашение при возврате длинных команд.
    # Вызов функций или команд не редко должен осуществляться в \$(...),
    # чтобы изменяемые значения изменялись в самом приглашении.
    PS1="\u@\h:\[\$(pwdcol)\]\w\[${COLD}\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Для терминалов, поддерживающих эту возможность, можно установать заголовк окна/вкладки
case "$TERM" in
xterm*|rxvt*)
    # Оригинальное приглашение
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Некоторые полезные алиасы
# `ls' and it's options
alias l='ls -U1F'	# Простой вывод одной колонкой
alias ll='ls -lhFrt'   	# Полный вывод
alias la='ls -lUFa'    	# Полный вывод всех файлов
alias lh='ls -lUFad .*'	# Полный вывод скрытых файлов
alias lld='ls -lUd */' 	# Полный вывод каталогов

# Навигация по каталогам
alias ..='cd ..'
alias ...='cd ../..'

# Обезболиватели
alias cp='cp -i'
alias mv='mv -i'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Пользовательские функции
# Настолько полезная штука, что это просто не передать словами - одни эмоции
pgrep () { ps auxww | egrep --color=always "$1" | grep -v "egrep.*$1"; }

# Создать каталог и перейти в него
md () { mkdir -p "$1" && cd "$1"; }

# Уникальные позиции истории комманд
# Функция с учётом того, что в истории имеется временная метка
huniq () { history | awk '{print $5}' | grep -e $1 | sort -s | uniq -c; }

# Функция перемещения конфигурационных файлов в Git-репозиторий
dotsasha () { mv -i $1 dotsasha/ && ln -s dotsasha/$1 . && ls -lR */$1 $1; }

# Тестирование цветов терминала
# Оригинальный скрипт Todd Larason <jtl@molehill.org>
color256 () { perl -e 'for ($red = 0; $red < 6; $red++) {for ($green = 0; $green < 6; $green++) {for ($blue = 0; $blue < 6; $blue++) {printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",16 + ($red * 36) + ($green * 6) + $blue,($red ? ($red * 40 + 55) : 0),($green ? ($green * 40 + 55) : 0),($blue ? ($blue * 40 + 55) : 0));}}}for ($gray = 0; $gray < 24; $gray++) {$level = ($gray * 10) + 8;printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",232 + $gray, $level, $level, $level);}print "System colors:\n";for ($color = 0; $color < 8; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n";for ($color = 8; $color < 16; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n\n";print "Color cube, 6x6x6:\n";for ($green = 0; $green < 6; $green++) {for ($red = 0; $red < 6; $red++) {for ($blue = 0; $blue < 6; $blue++) {$color = 16 + ($red * 36) + ($green * 6) + $blue;print "\x1b[48;5;${color}m  ";}print "\x1b[0m ";}print "\n";}print "Grayscale ramp:\n";for ($color = 232; $color < 256; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n";'; }

# Полезные алиасы для Git
alias gits='git status'
alias gitd='git diff'
alias gitc='git commit'
alias gita='git add --interactive'
alias giti='git instaweb'
alias gitl='git log'

# Полезные алиасы для перезапуска служб
alias ngs='sudo /etc/init.d/nginx status'
alias ngr='sudo /etc/init.d/nginx restart'

# Полезные алиасы для RVM.
alias rvi='rvm info ruby,homes'
alias rvl='rvm list'
alias rvlk='rvm list known'
alias rvg='rvm use 1.9.2@global'
alias rvr='rvm use 1.9.2@rails3'
alias rvgl='rvm gemset list'
alias rvgd='rvm gemset gemdir'

# полезные алиасы для RubGems
alias gec='gem cleanup'
alias gei='gem install'
alias gel='gem list'
alias geu='gem update'
alias geus='gem update --system'
alias ges='gem search --remote'

# Enable Ruby Environment Manager (RVM).
# This should be done at the end of file.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

