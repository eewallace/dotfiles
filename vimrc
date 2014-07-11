set nocompatible
set term=builtin_ansi
set timeoutlen=200
set ttimeoutlen=1000
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'pydiction'
Plugin 'ivanov/vim-ipython'
call vundle#end()
filetype plugin indent on
syntax on
let g:pydiction_location = '/home/eric/.vim/ftplugin/pydiction-1.2/complete-dict'
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
"imap <S-CR> <Plug>CapsLockToggle
inoremap <CR><CR> <Esc>
highlight comment guifg=#aaaaff
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd BufRead *.py set smarttab
"autocmd BufRead *.py,*.lisp,*.cl,*.hs set expandtab
"autocmd BufRead *.py,*.hs highlight BadWhitespace ctermbg=red guibg=red
"autocmd BufRead *.py,*.hs match BadWhitespace /^\t\+/
"autocmd BufRead *.py,*.hs match BadWhitespace /\s\+$/
"autocmd BufRead *.lisp,*.cl set shiftwidth=2
"autocmd BufRead *.lisp,*.cl set tabstop=2
"autocmd BufRead *.lisp,*.cl set softtabstop=2
