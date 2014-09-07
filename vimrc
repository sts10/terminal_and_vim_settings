" Use Pathogen package control (https://github.com/tpope/vim-pathogen) 
execute pathogen#infect()

" Control + n to toggle NERDTree sidebar
map <C-n> :NERDTreeToggle<CR>

" Allows you to quit vim if the only window left open is a NERDTree (https://github.com/scrooloose/nerdtree) 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Screen scrolls 3 lines in front of the cursor 
:set scrolloff=3

" Have Vim break lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
:set linebreak

" set tab as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Press i to enter insert mode, and ii to exit.
:imap ii <Esc>

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor 
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" for color schemes
colorscheme mustard
set background=dark

" Turn syntax highlighting on 
syntax on

" Some stuff everyone says you need
filetype on
filetype plugin on
filetype indent on
