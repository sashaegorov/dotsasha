# Вывод определённого цвета, если текущий каталог доступен пользователю на запись.
function colpwd() {
  if [ -w "${PWD}" ]; then
    echo -en ${COLK}
  else
    echo -en ${COLR}
  fi
}
# Вывод root более заметным образом.
function coluser() {
  if [ $USER = 'root' ]; then
    echo -en ${BLDR}
  else
    echo -en ${BLDW}
  fi
}
# Вывод текущей ветки разработки для GIT
function colgit() {
  local GITBRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' -e 's/[\(\)]//g' -e 's/HEAD detached at //'`
  if [ -z "${GITBRANCH}" ]; then
    return
  elif [[ "${GITBRANCH}" =~ rebasing ]]; then
    echo -en ${BLDR}
  else
    echo -en ${BLDM}
  fi
}

function gitbranch() {
  local GITBRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' -e 's/[\(\)]//g' -e 's/HEAD detached at //'`
  if [ -z "${GITBRANCH}" ]; then
    return
  elif [ "${GITBRANCH}" = 'master' ]; then
    echo -n "/"
  elif [[ "${GITBRANCH}" =~ rebasing ]]; then
    echo -n "◆"
  else
    echo -n "/${GITBRANCH}"
  fi
}

# Git status functions
# Inspired by
# https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt
function gitstatuscol() {
  local status="$(git status 2> /dev/null)"
  if [[ $status =~ "Your branch is ahead of" ]]; then
    echo -en "${COLY}"
  elif [[ $status =~ "Changes to be committed" ]]; then
    echo -en "${COLY}"
  elif [[ $status =~ "Changes not staged for commit" ]]; then
    echo -en "${COLR}"
  elif [[ $status =~ "nothing added to commit but untracked files present" ]]; then
    echo -en "${COLY}"
  elif [[ $status =~ "nothing to commit, working directory clean" ]]; then
    echo -en "${COLG}"
  fi
}
function gitstatussign() {
  local status="$(git status 2> /dev/null)"
  if [[ $status =~ "Your branch is ahead of" ]]; then
    echo -n "❉"
  elif [[ $status =~ "Changes to be committed" ]]; then
    echo -n "◆"
  elif [[ $status =~ "Changes not staged for commit" ]]; then
    echo -n "◆"
  elif [[ $status =~ "nothing added to commit but untracked files present" ]]; then
    echo -n "•"
  elif [[ $status =~ "nothing to commit, working directory clean" ]]; then
    echo -n "•"
  fi
}

# Тестирование цветов терминала
function color256 () {
  # Оригинальный скрипт Todd Larason <jtl@molehill.org>
  perl -e 'for ($red = 0; $red < 6; $red++) {for ($green = 0; $green < 6; $green++) {for ($blue = 0; $blue < 6; $blue++) {printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",16 + ($red * 36) + ($green * 6) + $blue,($red ? ($red * 40 + 55) : 0),($green ? ($green * 40 + 55) : 0),($blue ? ($blue * 40 + 55) : 0));}}}for ($gray = 0; $gray < 24; $gray++) {$level = ($gray * 10) + 8;printf("\x1b]4;%d;rgb:%2.2x/%2.2x/%2.2x\x1b\\",232 + $gray, $level, $level, $level);}print "System colors:\n";for ($color = 0; $color < 8; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n";for ($color = 8; $color < 16; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n\n";print "Color cube, 6x6x6:\n";for ($green = 0; $green < 6; $green++) {for ($red = 0; $red < 6; $red++) {for ($blue = 0; $blue < 6; $blue++) {$color = 16 + ($red * 36) + ($green * 6) + $blue;print "\x1b[48;5;${color}m  ";}print "\x1b[0m ";}print "\n";}print "Grayscale ramp:\n";for ($color = 232; $color < 256; $color++) {print "\x1b[48;5;${color}m  ";}print "\x1b[0m\n";';
}

function color16 () {
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
