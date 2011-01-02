" Будем цветными!
set t_Co=256

" Будем модными новаторами
set nocompatible
syntax on
filetype plugin indent on
" Настройки цветовой схемы
let g:molokai_original = 1
colorscheme molokai

" Настройки отображения
set backspace=2      " Фикс Backspace
set number           " Включить нумерацию строк
set numberwidth=4    " Ширина колонки с номерами строк
set textwidth=0      " Не переносить по словам при вводе
set nowrap           " Не переносить по словам при просмотре
set showcmd          " Отображать последнюю введенную команду
set showmatch        " Отображать совпадающие скобки и т.д.
set ruler            " Линейка
set wildmenu         " Продвинутое автозавершение команд
set visualbell       " Визуальный звонок вместо звукового
set laststatus=2     " Всегда показывать строку статуса

" Отступы и табы, стрелки и точки
set listchars=eol:¶,tab:>·,trail:·
set nolist

" Управление отступами и табами
set ts=4             " Количество пробелов в табуляторе
set sw=4             " Количество пробелов в отступе
set et               " Заменять табулятор пробелами

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
set nospell
set spelllang=ru,en
" Меню проверки орфографии
set wcm=<Tab>
menu Spl.Suggest z=
menu Spl.Next ]s
menu Spl.Prev [s
menu Spl.Add zg
menu Spl.Ignore zG
menu Spl.Wrong zw
menu Spl.Info <Esc>:spellinfo<CR>
imap <F7> <Esc>:set spell!<CR>
nmap <F7> :set spell!<CR>
imap <F8> <Esc>:emenu Spl.<TAB>
nmap <F8> :emenu Spl.<TAB>

" MiniBufferExplorer
map <Leader>t :TMiniBufExplorer<CR>
map <F9> :TMiniBufExplorer<CR>
imap <F9> <Esc>:TMiniBufExplorer<CR>
