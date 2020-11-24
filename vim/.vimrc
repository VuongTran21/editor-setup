"We want the latest Vim settings/options
set nocompatible

"All plugins
so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start

set number

" Disable bell sound!!!!
set noerrorbells visualbell t_vb=

" Search all text in lower case
set ignorecase

" Linespace only work for GUI like macvim for Gvim
set linespace=15

let mapleader=','

"---------------Visuals---------------"
colorscheme atom-dark-256
" Force terminal use color 256
set t_CO=256

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Hide gvim menu
set guioptions-=m
set guioptions-=T

" Disable GUI tabs
set guioptions-=e

" Set colors for line number
hi LineNr guibg=bg

" Fake a custom left padding for each window
set foldcolumn=1
hi foldcolumn guibg=bg

" Set color for split border
hi vertsplit guifg=bg guibg=bg

"---------------Splits---------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"---------------Plugins Settings---------------"
"/ CtrlP
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" List method in class
nmap <C-r> :CtrlPBufTag<cr>

" Most recently used files
nmap <C-e> :CtrlPMRUFiles<cr>

"/ NERDTree
let NERDTreeHijackNetrw=0

"/ Greplace.vim
" Use Ag.vim for search
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"---------------Mappings---------------"

" Edit vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Turn of highligh
nmap <Leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle
nmap <C-b> :NERDTreeToggle<cr>

" Search method in all project with ctags
nmap <Leader>f :tag<space>

" Close all buffers
nmap <Leader>ww :bufdo bd!<cr>

" Close single tab
nmap <Leader>w :tabc<cr>

" Paste from system clipboard
nmap <Leader>v "+p

" Copy to system clipboard
vmap <Leader>c "+y

"---------------Search---------------"
set hlsearch
set incsearch
set mouse=a

"---------------Auto commands---------------"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" For vim-php-namespace plugin
" Import namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Import full namespace
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" Notes and tips
" - zz to instantly center line
" - Ctrl + ^ to back to previous buffer, or exit vinager
" - Ctrl + ] to go to defination
" - Ctrl + w + | to expand full screen of current split where the pointer is
" - Ctrl + w + = to equally split screen
