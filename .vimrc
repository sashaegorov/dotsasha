" Будем цветными и юникодными! 
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8

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
set statusline=%F:%n%*%y%*%3.3(%m%)%r\%w\%h%-12.16(%*%3p%%%*\ %l/%L\:%c%)\ &#%04.4b\ &#x%04.4B\ %a
set updatetime=1000  " Глобальный интервал обновления

" Отключить всякого рода файлы-артефакты
set nobackup
set nowritebackup
set noswapfile

" Отступы и табы, стрелки и точки
set listchars=eol:¶,tab:>·,trail:·
set nolist

" Управление отступами и табами
set tabstop=2        " Количество пробелов в табуляторе
set softtabstop=2
set shiftwidth=2     " Количество пробелов в отступе
set expandtab        " Заменять табулятор пробелами
set autoindent       " Включить автоматические отступы
set smarttab         " Умные отступы

" Фолдинг
set nofoldenable      " Выключить фолдинг. Юзаем zi...
set foldmethod=indent " Метод фолдинга по отступам. Python;)
set foldnestmax=3     " Максимальная вложенность 3 уровня
set foldopen=all      " Автораскрытие при наведении курсора
set foldclose=all     " ... и автозакрытие

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

" Minibuffer Explorer Settings
map <Leader>tt :TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Настройка Command-T
" Открывать по Ctrl-T и сразу чистить:
map <C-t> :CommandT<CR><Tab><C-u><Tab>
imap <C-t> <Esc>:CommandT<CR><Tab><C-u><Tab>
nmap <silent> <Leader>t :CommandT<CR><Tab><C-u><Tab>
let g:CommandTCancelMap=['<C-t>']     " ...и закрывать также
let g:CommandTAcceptSelectionTabMap=['<CR>']  " Всё открываемые файлы по умолчанию открывать в табах
let g:CommandTMaxHeight=20                     " Максимальная высота окна
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

" Сброс подсветки результатов поиска
map <silent> <Esc>h :set hlsearch!<CR>

" Управление табами
nmap <F5> :tabprevious<CR>
imap <F5> <Esc>:tabprevious<CR>i<Right>
nmap <F6> :tabnext<CR>
imap <F6> <Esc>:tabnext<CR>i<Right>

" Настройка Tlist
map <silent> <F9> :TlistToggle<CR>
imap <silent> <F9> <Esc>:TlistToggle<CR>
let Tlist_Auto_Open=0
let Tlist_Auto_Update=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Compact_Format=1
let Tlist_Close_On_Select=0
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_WinWidth=24
let Tlist_Enable_Fold_Column=0

" Настройка NERDTree
map <silent> <F10> :NERDTreeToggle<CR>
imap <silent> <F10> <Esc>:NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDChristmasTree=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=24
let NERDTreeChDirMode=2

" Настройка NERDCommenter
let g:NERDSpaceDelims=1

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1
set statusline+=\ %#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
