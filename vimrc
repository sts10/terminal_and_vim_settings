" Use Pathogen package control (https://github.com/tpope/vim-pathogen) 
execute pathogen#infect()

" Control + n to toggle NERDTree sidebar
map <C-n> :NERDTreeToggle<CR>

" Allows you to quit vim if the only window left open is a NERDTree (https://github.com/scrooloose/nerdtree) 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Screen scrolls 3 lines in front of the cursor 
set scrolloff=3

" Have Vim break lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set linebreak

" Display line numbers
" :set number

" set tab as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" set font for gui vim
set guifont=DejaVu\ Sans\ Mono:h17

" Press i to enter insert mode, and ii to exit.
imap ii <Esc>

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor 
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" When searching, center the result in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv

" H to beginning of line, L to the end
noremap H ^
noremap L $

" D deletes to the end of the line, as it should
noremap D d$

" J and K move up and down 10 lines
noremap J 10j
noremap K 10k

" for color scheme
colorscheme mustard
set background=dark

" Turn syntax highlighting on 
syntax on

" Some stuff everyone says you need
filetype on
filetype plugin on
filetype indent on

" Turn on auto-complete for various languages, plus re map tab to Ctrl+P
" (auto-complete command)
set omnifunc=syntaxcomplete#Complete

" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" imap <Tab> <C-P>

