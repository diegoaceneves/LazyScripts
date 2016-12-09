""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc - Vim/GVim Configuration File
" Diego Neves - https://github.com/diegoaceneves/LazyScripts/dotfiles/vim
" Official docs @ http://vimdoc.sourceforge.net/htmldoc/usr_toc.html
"
"
" "THE BEER-WARE LICENSE" (Revision 42):
" <phk@FreeBSD.ORG> wrote this file. As long as you retain this notice you
" can do whatever you want with this stuff. If we meet some day, and you think
" this stuff is worth it, you can buy me a beer in return Poul-Henning Kamp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Configure syntax to on 
syntax on

"Disable mouse usage
set mouse=r

"set colorscheme
colorscheme desert

"Configure tabs 
if (&filetype=='html' || &filetype=='htm' || &filetype=='xhtm')
    set tabstop=1
    set shiftwidth=1
    set softtabstop=1
    set expandtab
endif

if (&filetype=='py' || &filetype=='css')
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
endif

if (&filetype=='php'||&filetype=='conf')
    set tabstop=8
    set shiftwidth=8
    set softtabstop=8
endif

"remove compatible with vi
set nocompatible

"set enconde to utf8
set encoding=utf8

"configure indentation
filetype plugin indent on
set autoindent
set smartindent

"Show number
set number
set showcmd
set showmode


set backspace=start,eol,indent

"Configure backupdir
set backupdir=/tmp//
set directory=/tmp//
set udir=/tmp//
