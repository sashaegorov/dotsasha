" Будем цветными!
set t_Co=256

" Будем модными новаторами
set nocompatible
syntax on
filetype plugin on
filetype indent on

" Настройки цветовой схемы
let g:molokai_original = 1
colorscheme molokai

" Настройки отображения
set backspace=2      " Фикс Backspace
set number           " Включить нумерацию строк
set numberwidth=5    " Ширина колонки с номерами строк
set textwidth=0      " Не переносить по словам при вводе
set nowrap           " Не переносить по словам при просмотре
set showcmd          " Отображать последнюю введенную команду
set showmatch        " Отображать совпадающие скобки и т.д.
set ruler            " Линейка
set wildmenu         " Продвинутое автозавершение команд
set visualbell       " Визуальный звонок вместо звукового
set laststatus=2     " Всегда показывать строку статуса
set statusline=%F\%1*%y%*%m%r:%n\ %w\%h\ %-14.18(%2*%3p%%%*\ %l/%L\:%c%)\ &#%04.4b\ &#x%04.4B\ %a

" Отключить всякого рода файлы-артефакты
set nobackup
set nowritebackup
set noswapfile

" Отступы и табы, стрелки и точки
set listchars=eol:¶,tab:>·,trail:·
set nolist

" Управление отступами и табами
set tabstop=2             " Количество пробелов в табуляторе
set sw=2             " Количество пробелов в отступе
set expandtab        " Заменять табулятор пробелами
set autoindent       " Включить автоматические отступы

" Настройка прокрутки и позиции курсора
set scrolloff=12     " Держаться от краёв на расстоянии 12 строк

" Настройки мыши
if has("mouse")
    set mouse=a      " Включить мышь
    set mousehide    " Скрыть курсор в режиме добавления
    set mousemodel=popup
endif

" Настройки поиска 
set incsearch        " Искать инкрементально
set hlsearch         " ...подсвечивать результаты,
set ignorecase       " ...игнорируя регистр
set smartcase        " ...ну почти игнорируя...

" Настройка орфографии
" А это для проверки работы орфографии: ёлка, осёл, бНОПНЯ - в идеале должно быть только бНОПНЯ.
set nospell
set spelllang=ru,en

" Меню проверки орфографии
set wcm=<Tab>
menu Spell.Suggest\ (z=) z=
menu Spell.Next\ (]s) ]s
menu Spell.Prev\ ([s) [s
menu Spell.Add\ (zg) zg
menu Spell.Ignore\ (zG) zG
menu Spell.Wrong\ (zw) zw
menu Spell.Info <Esc>:spellinfo<CR>
imap <F7> <Esc>:set spell!<CR>
nmap <F7> :set spell!<CR>
map <Leader>za :emenu Spell.<TAB>

" MiniBufferExplorer
map <Leader>tt :TMiniBufExplorer<CR>
map <F9> :TMiniBufExplorer<CR>
imap <F9> <Esc>:TMiniBufExplorer<CR>

" Настройка Command-T
" Открывать по Ctrl-T и сразу чистить:
map <C-t> :CommandT<CR><Tab><C-u><Tab>
imap <C-t> <Esc>:CommandT<CR><Tab><C-u><Tab>
nmap <silent> <Leader>t :CommandT<CR><Tab><C-u><Tab>
let g:CommandTCancelMap=['<C-x>', '<C-c>']     " ...и закрывать также
let g:CommandTAcceptSelectionTabMap=['<C-t>']  " Всё открываемые файлы по умолчанию открывать в табах
let g:CommandTMaxHeight=15                     " Максимальная высота окна
let g:CommandTAlwaysShowDotFiles=1             " Показывать дот-файлы
let g:CommandTScanDotDirectories=1             " Сканировать дот-каталоги

" Автоматическое закрытие скобок
" http://jenyay.net/Programmg/Vim
imap [ []<Left>
imap ( ()<Left>
imap { {}<Left>

" Чтобы не ебануться на отличненко, при вводе на русском вперемешку с английским,
" это пожалуй самое главное:
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

nmap <F5> :tabprevious<CR>
imap <F5> <Esc>:tabprevious<CR>i<Right>
nmap <F6> :tabnext<CR>
imap <F6> <Esc>:tabnext<CR>i<Right>
