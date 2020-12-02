"We want the latest Vim settings/options
set nocompatible

"All plugins
so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start

set number

set relativenumber

" Disable bell sound!!!!
set noerrorbells visualbell t_vb=

" Automatically save file when change buffer
" set autowriteall

" Set autocompletion to current, window, buffer, and unload buffer
set complete=.,w,b,u

" Search all text in lower case
set ignorecase

" Linespace only work for GUI like macvim for Gvim
set linespace=15

" Tabstop
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

let mapleader=','

"---------------Visuals---------------"

colorscheme gruvbox

set bg=dark

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

"/ cTags
" List method in class
nmap <C-r> :CtrlPBufTag<cr>

" Most recently used files
nmap <C-e> :CtrlPMRUFiles<cr>

"/ NERDTree
let NERDTreeHijackNetrw=0
" Show hidden files
let g:ctrlp_show_hidden = 1

"/ Greplace.vim
" Use Ag.vim for search
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"/ PHP Document for VIM
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nmap <buffer> <Leader>d :call pdv#DocumentWithSnip()<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/ vim-php-cs-fixer.vim
let g:php_cs_fixer_path=$HOME ."/.config/composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_config_file =$HOME ."/.phpcsfixer"
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "/usr/bin/php"
nnoremap <silent><Leader>pf :call PhpCsFixerFixFile()<cr>

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
nmap <Leader>w :bufdo bd!<cr>

" Close single tab
nmap <C-w> :tabc<cr>

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
" - :sbuffer <buffer-index>: open buffer in spit window
" - Ctrl + i or Ctrl + o to go back and forth between poiter
" - Ctrl + n, default autocompletion for vim -> related to complete setting
" ,n -> import namespace php
" ,nf -> import full namespace
