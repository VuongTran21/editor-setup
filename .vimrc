syntax enable
set backspace=indent,eol,start                                                  "Make backspace behave like every other editor.
let mapleader = ','								"The default leader is \, but a  comma is much better.
set number									"Let's activate line numbers.





"---------------Visuals-----------------"
colorscheme atom-dark

set t_CO=256									"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h17
set linespace=15								"Macvim-specific line-height.

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R





"---------------Search-----------------"
"Highlight your search keyword after hit enter.
set hlsearch

"Highlight search immediately after typing.
set incsearch





"---------------Split Management-----------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>






"---------------Mappings-----------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>





"---------------Auto-Command-----------------"
"Automatically source the Vimrc file on save.
augroup autosourcing								"Autocmd will run every single time + 1, use augroup to prevent it.
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
