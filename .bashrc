#!/bin/bash -x
# Файл пользовательских настроек ~/.bashrc
# Исполняется bash(1) для интерактивных сеансов.
# На Mac может потребоваться добавить
# ln -s .bashrc .bash_profile

# Небольшой хелпер помогающий определить каталог в котором лежит скрипт
# Источник: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
__SOURCE="${BASH_SOURCE[0]}"
__DIR="$( dirname "$__SOURCE" )"
while [ -h "$__SOURCE" ]
do 
  __SOURCE="$(readlink "$__SOURCE")"
  [[ $__SOURCE != /* ]] && __SOURCE="$__DIR/$__SOURCE"
  __DIR="$( cd -P "$( dirname "$__SOURCE"  )" && pwd )"
done
REAL_DIR="$( cd -P "$( dirname "$__SOURCE" )" && pwd )"

# Подгрузка всякого полезного
. $REAL_DIR/colors.sh     # Определение цветов
. $REAL_DIR/aliases.sh    # Алиасы
. $REAL_DIR/services.sh   # Сервисы

# Автозавершения комманд Bash
# Необходим `brew install bash-completion`
# Это можно не делать, если автозавершения загружаются из /etc/
if [ -f /usr/local/etc/bash_completion ]; then
. /usr/local/etc/bash_completion
fi
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
if [ -x /usr/local/bin/brew ]; then
  source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

# Если сеанс не интерактивный, ничего не делаем
[ -z "$PS1" ] && exit

# Переменная окружения PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm*) COLOR_TERM=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#FORCE_COLOR_TERM=yes

if [ -n "$FORCE_COLOR_TERM" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    COLOR_TERM=yes
  else
    COLOR_TERM=
  fi
fi

if [ "$COLOR_TERM" = yes ]; then
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

# Ну это тоже надо куда-то деть...
alias su='sudo su'

# Алиасы для VIM
alias vi='vim'

# Некоторые полезные алиасы
# Включить условный цветной вывод для команд

# Команды по умолчанию
_LS="ls"
_DIRCOLORS="dircolors"

# Необхомо для Mac с установленными coreutils
if [ `uname`=="Darvin" ]; then
  [ -x /usr/local/bin/gls ] && _LS="gls"
  [ -x /usr/local/bin/gdircolors ] && _DIRCOLORS="gdircolors"
fi

if [ -x `which ${_DIRCOLORS}` ]; then
  eval "`${_DIRCOLORS} -b`"
fi

if [ "$COLOR_TERM" = yes ]; then
  # До определить аргументы ls
  # Выбрать правильный аргумент в зависимости от ls
  if [ `uname`=="Darvin" -a ${_LS} = "ls" ]; then
    _LS="${_LS} -G"
  else
    _LS="${_LS} --color=auto --group-directories-first"
  fi
	
  alias ls="${_LS}"
  # Прочее
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias l="${_LS} -U1F"       # Простой вывод одной колонкой
alias ll="${_LS} -lhFrt"    # Полный вывод
alias la="${_LS} -lUFa"     # Полный вывод всех файлов
alias lh="${_LS} -lUFad .*" # Полный вывод скрытых файлов
alias lld="${_LS} -lUd */"  # Полный вывод каталогов
alias lsln="${_LS} -laF --color=always | grep lrwxrwxrwx"

# Навигация по каталогам
alias ..='cd ..'
alias ...='cd ../..'

# Обезболиватели
alias cp='cp -i'
alias mv='mv -i'

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

# А вот не надо расслабляться...
genpass () {
  # FIXME Broken on Mac's `tr`
  local l=$1
  for i in {1..5}; do
    [ "$l" == "" ] && l=16
    # FIXME: gtr hardcoded
    gtr -cd 'A-Za-z0-9_#!$%^&*' < /dev/urandom | head -c ${l} | xargs echo
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

# Enable Ruby Environment Manager (RVM).
# Add RVM to PATH for scriptirg
PATH=$PATH:$HOME/.rvm/bin
# This should be done at the end of file.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

[[ -s /Users/sashaegorov/.nvm/nvm.sh ]] && . /Users/sashaegorov/.nvm/nvm.sh # This loads NVM