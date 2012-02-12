# Файл пользовательских настроек ~/.bashrc
# Исполняется bash(1) для интерактивных сеансов.

# Если сеанс не интерактивный, ничего не делаем
[ -z "$PS1" ] && return

# Переменная окружения PATH
# Vim 7.3 
export PATH=$PATH:/opt/vim73/bin
# Erlang Erlang R14B01
export PATH=$PATH:/opt/erl14/bin
# Redis 2.2.6
export PATH=$PATH:/opt/redis24
# JDK 1.6
export PATH=$PATH:/opt/jdk16/bin
export JAVA_HOME=/opt/jdk16
# Node JS
export PATH=$PATH:/opt/nodejs/bin

# Настройка истории команд
# Убивать дубликаты истории самым жестоким образом
export HISTCONTROL=ignoreboth:erasedups
# Размер истории команд
export HISTFILESIZE=65536
export HISTSIZE=32768
# Формат времени истории команд (2010-12-09 02:34:01 MSK)
export HISTTIMEFORMAT='%F %T %Z '
# Игнорировать все двух буквенные команды
export HISTIGNORE='??'

# Настройки оболочки
# Дописывать историю, не удалять
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Важные переменные окружения
# Важно vim, а не vi
export EDITOR='vim'
export RUBYOPT=''

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# "Шпаргалка" цветов
# Всё это пока в глобальном пространстве имён.
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
colpwd() {
  if [ -w ${PWD} ]; then
    echo -en ${COLW}
  else
    echo -en ${BLDR}
  fi
}

# Вывод root более заметным образом.
coluser() {
  if [ $USER = 'root' ]; then
    echo -en ${BLDR}
  elif [ $USER = 'postgres' ]; then
    echo -en ${BLDG}
  else
    echo -en ${BLDW}
  fi
}

# Вывод текущей ветки разработки для GIT
colgit() {
  local GITBRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ -z ${GITBRANCH} ]; then
    return
  else
    echo -en ${BLDM}
  fi
}

gitbranch() {
  local GITBRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ -z ${GITBRANCH} ]; then
    return
  elif [ ${GITBRANCH} = 'master' ]; then
    echo -n "/"
  else
    echo -n "/${GITBRANCH}"
  fi

}

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm) color_prompt=yes;;
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
  # Необходимо особо отметить, что между \[...\]
  # должна быть только управляющая последовательность.
  # Вызов функций или команд не редко должен осуществляться в \$(...),
  # чтобы изменяемые значения изменялись в самом приглашении.
  # Эталонный рабочий вариант где ничего не поломано:,
  # PS1="\[\$(coluser)\]\u\[${COLD}\]@\h:\[\$(colpwd)\]\w\[${COLD}\]\\$ "
  # PS1="\[\$(coluser)\]\u\[$COLD\]@\h:\[\$(colpwd)\]\w\[$COLD\]\\$ "
  PS1="\[\$(coluser)\]\u\[$COLD\]@\h:\[\$(colpwd)\]\w\[\$(colgit)\]\$(gitbranch)\[$COLD\]\\$ "
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Для терминалов, поддерживающих эту возможность, можно установить заголовок окна/вкладки
case "$TERM" in
  xterm*|rxvt*)
    # Оригинальное приглашение
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e]0;\u@\h:\w\a\]$PS1"
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

# Ну это тоже надо куда-то деть...
alias su='sudo su'

# Алиасы для VIM
alias vi='vim'

# Некоторые полезные алиасы
# `ls' and it's options
alias l='ls -U1F'       # Простой вывод одной колонкой
alias ll='ls -lhFrt'    # Полный вывод
alias la='ls -lUFa'     # Полный вывод всех файлов
alias lh='ls -lUFad .*' # Полный вывод скрытых файлов
alias lld='ls -lUd */'  # Полный вывод каталогов
alias lsln='ls -laF --color=always | grep lrwxrwxrwx'

# Навигация по каталогам
alias ..='cd ..'
alias ...='cd ../..'

# Обезболиватели
alias cp='cp -i'
alias mv='mv -i'

# Перезапуск "служб".
# Nginx
alias ngr='sudo /etc/init.d/nginx restart'
alias ngk='sudo /etc/init.d/nginx stop'
# PostgreSQL
alias pgr='sudo /etc/init.d/postgresql restart'
alias pgk='sudo /etc/init.d/postgresql stop'
# Apache2
alias apr='sudo /etc/init.d/apache2 restart'
alias apk='sudo /etc/init.d/apache2 stop'
# MySQL
alias myr='sudo /etc/init.d/mysql restart'
alias myk='sudo /etc/init.d/mysql stop'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Автозавершение для Rake
# https://github.com/ai/rake-completion/blob/master/rake
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
_rakecomplete() {
  if [ -f Rakefile ]; then
    recent=`ls -t tmp/aux/.rake_tasks Rakefile **/*.rake 2> /dev/null | head -n 1`
    if [ ! -d tmp/aux ]; then
      mkdir -p tmp/aux
    fi
    if [[ $recent != 'tmp/aux/.rake_tasks' ]]; then
      rake --silent --tasks | cut -d " " -f 2 > tmp/aux/.rake_tasks
    fi
    COMPREPLY=($(compgen -W "`cat tmp/aux/.rake_tasks`" -- ${COMP_WORDS[COMP_CWORD]}))
    return 0
  fi
}

complete -o default -o nospace -F _rakecomplete rake

# TODO:
# Нечто похожее можно сделать для gem
# gem help commands | egrep "^ " | awk '{print $1}'
# Кешировать надо в ~/.bashcomplete/KEY
# где, KEY это что-то вроде:
# pwd | md5sum | awk '{print $1}'

# Пользовательские функции
# Настолько полезная штука, что это просто не передать словами - одни эмоции
psgrep () { ps auxww | egrep --color=always "$1" | grep -v "egrep.*$1"; }

# Создать каталог и перейти в него
md () { mkdir -p "$1" && cd "$1"; }

# Уникальные позиции истории команд
# Функция с учётом того, что в истории имеется временная метка
huniq () { history | awk '{print $5}' | grep -e $1 | sort -s | uniq -c; }

# Функция перемещения конфигурационных файлов в Git-репозиторий
dotsasha () { mv -i $1 dotsasha/ && ln -s dotsasha/$1 . && ls -lR */$1 $1; }

# Тестирование цветов терминала
color256 () {
  # Оригинальный скрипт Todd Larason <jtl@molehill.org>
  perl -e 'for ($red = 0; $red < 6; $red++) {for ($green = 0; $green < 6; $green++) {for ($blue = 0; $blue < 6; $blue++) {printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",16 + ($red * 36) + ($green * 6) + $blue,($red ? ($red * 40 + 55) : 0),($green ? ($green * 40 + 55) : 0),($blue ? ($blue * 40 + 55) : 0));}}}for ($gray = 0; $gray < 24; $gray++) {$level = ($gray * 10) + 8;printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",232 + $gray, $level, $level, $level);}print "System colors:\n";for ($color = 0; $color < 8; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n";for ($color = 8; $color < 16; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n\n";print "Color cube, 6x6x6:\n";for ($green = 0; $green < 6; $green++) {for ($red = 0; $red < 6; $red++) {for ($blue = 0; $blue < 6; $blue++) {$color = 16 + ($red * 36) + ($green * 6) + $blue;print "\x1b[48;5;${color}m  ";}print "\x1b[0m ";}print "\n";}print "Grayscale ramp:\n";for ($color = 232; $color < 256; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n";';
}

color16 () {
  # Copyright (C) 2009 Wolfgang Frisch <xororand@unfoog.de>
  echo
  echo Table for 16-color terminal escape sequences.
  echo Replace ESC with \\033 in bash.
  echo
  echo "Background | Foreground colors"
  echo "---------------------------------------------------------------------"
  for((bg=40;bg<=47;bg++)); do
    for((bold=0;bold<=1;bold++)) do
      echo -en "\033[0m"" ESC[${bg}m   | "
      for((fg=30;fg<=37;fg++)); do
        if [ $bold == "0" ]; then
          echo -en "\033[${bg}m\033[${fg}m [${fg}m  "
        else
          echo -en "\033[${bg}m\033[1;${fg}m [1;${fg}m"
        fi
      done
      echo -e "\033[0m"
    done
    echo "--------------------------------------------------------------------- "
  done
  echo
}

# А вот не надо расслабляться...
genpass () {
  local l=$1
  for i in {1..5}; do
    [ "$l" == "" ] && l=16
    tr -cd 'A-Za-z0-9_#!$%^&*' < /dev/urandom | head -c ${l} | xargs echo
  done
} 

# Алаисы для Rails 2/3
# http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs
alias r='rails'

# Консоль
rc () {
  if [ -f ./script/rails ]; then 
    rails c $@
  else
    ./script/console $@
  fi
}

# Генератор
rg () {
  if [ -f ./script/rails ]; then
    rails g $@
  else
    ./script/generate $@
  fi
}

# Сервер
rs () {
  if [ -f ./script/rails ]; then 
    rails s $@
  else
    ./script/server $@
  fi
}

# Сервер в боевом режиме
rsp () {
  if [ -f ./script/rails ]; then 
    sudo rails s -p80 $@
  else
    sudo ./script/server -p80 $@
  fi
}

# Миграция базы
alias rkdbm='rake db:migrate'
# Тесты
alias rksp='rake spec'

# Полезные алиасы для Git
alias gits='git status --short'
alias gitss='git status'
alias gitd='git diff'
alias gitdc='git diff --cached'
alias gitc='git commit'
alias gita='git add'
alias gitai='git add --interactive'
alias giti='git instaweb'
alias gitl='git log'
alias gitlo='git log --oneline'
alias gitla='git log --pretty --stat HEAD^..HEAD'
alias gitck='git checkout'
# Не знаю, как сделать так, чтобы Git показывал
# неотслеживаемые файлы, а не только каталоги. :-p
# Вывод неотслеживаемых файлов
gitu () {
  local UNTRACKED
  for UNTRACKED in `git status -s | awk '{print $2}'`; do
    if [ -d ${UNTRACKED} ]; then
      git status -s ${UNTRACKED};
    fi;
  done
}
# Удаление неотслеживаемых файлов
gitud () {
  local UNTRACKED_FILE
  for UNTRACKED_FILE in `gitu`; do
    rm -i ${UNTRACKED_FILE};
  done
}

# Полезные алиасы для перезапуска служб
alias ngs='sudo /etc/init.d/nginx status'
alias ngr='sudo /etc/init.d/nginx restart'

# Полезные алиасы для RVM.
alias rvi='rvm info ruby,homes'
alias rvl='rvm list'
alias rvlk='rvm list known'
alias rvg='rvm use 1.9.3-p0@global'
alias rvr='rvm use 1.9.3-p0@rails3'
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
[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

