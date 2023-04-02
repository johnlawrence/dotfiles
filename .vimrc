set nocompatible

set encoding=utf-8
set binary

" ### presentation settings ###
set nonumber              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmenu            " enhanced command completion
set laststatus=2        " always show the status lines
set list listchars=tab:>-
syntax on               " enable syntax highlighting

" ### behavior ###
set shell=$SHELL        " use current shell for shell commands
set backspace=indent,eol,start " set what we can backspace over
set nocindent noautoindent nosmartindent indentexpr= "disable autoindents
set tabstop=4           " number of spaces in a tab
set shiftwidth=4        " number of spaces for indent
set expandtab           " expand tabs into spaces
set smarttab
set mouse=r             " use the mouse
set autoindent
set smartindent

" ### search settings ###
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" ### user commands ###
let mapleader=","
" turn line numbers on/off
nmap <silent> <leader>n :set nonu!<CR>
" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Read-only .doc through antiword
autocmd BufReadPre *.doc silent set ro
autocmd BufReadPost *.doc silent %!antiword "%"

" Read-only pdf through pdftotext
autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78
