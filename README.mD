# .vimrc file

```vimL

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""    VUNDLE CONFIGURATION   """""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-latex/vim-latex'
Plugin 'flazz/vim-colorschemes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""    VIM-LATEX CONFIGURATION """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on    " required
filetype plugin on
let g:tex_flavor='latex'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""    OTHER CONFIGURATION """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set relativenumber
set mouse=a
set ruler
set shiftwidth=4
set tabstop=4
set noexpandtab
syntax enable
colo cobalt
			
let mapleader=","

map <F10> :noh<CR>:pc<CR>

set hlsearch
set incsearch

" Always display file name
set laststatus=2


" To enable Folding in GAMS .lst file
au BufRead,BufNewFile *.gms set filetype=gams
so ~/.vim/syntax/gamslist.vim
au FileType gams so ~/.vim/plugins/gams.vim

" Loading any special features for Latex
au FileType tex,plaintex so ~/.vim/plugins/latex.vim

au FileType cpp so ~/.vim/plugins/cpp.vim
au FileType c so ~/.vim/plugins/c.vim
set runtimepath^=~/.vim/bundle/vim-gencode-cpp

" Delete trailing space
function! Trail()
%s/\s\+$//g
endfunction


inoremap jk <Esc>

inoremap <leader>a <Esc>mzA
inoremap <leader>i <Esc>mzI

"" Insert mode motion
" Go visual one line up or down in insert mode: <leader>+j/k
inoremap <leader>j <Esc>gja
inoremap <leader>k <Esc>gka
" Move by w/b/e in insert mode: <leader>+w/b/e
inoremap <leader>w <Esc>lwi
inoremap <leader>b <Esc>lbi
inoremap <leader>e <Esc>ea
inoremap <leader>W <Esc>lWi
inoremap <leader>B <Esc>lBi
inoremap <leader>E <Esc>Ea
" Open new line above or below in the insert mode <leader>+o/O
inoremap <leader>o <Esc>mzo<Esc>`za
inoremap <leader>O <Esc>mzO<Esc>`za

"" Normal mode maps
" Open new line above or below in the normal mode WITHOUT exiting normal mode <leader>+o/O
nnoremap <leader>o mzo<Esc>`z
nnoremap <leader>O mzO<Esc>`z
```
