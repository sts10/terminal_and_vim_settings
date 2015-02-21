" Use Pathogen package control (https://github.com/tpope/vim-pathogen) 
execute pathogen#infect()

" set leader to comma
let mapleader = ","

"""""""""""""""""""""""""""""""
" PLUG-IN SETTINGS            "
"""""""""""""""""""""""""""""""

" Control + n to toggle NERDTree sidebar
map <C-n> :NERDTreeToggle<CR>

" Allows you to quit vim if the only window left open is a NERDTree (https://github.com/scrooloose/nerdtree) 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" map comment and uncomment from NERDCommenter (https://github.com/scrooloose/nerdcommenter)
nmap <C-l> <Leader>c<Space>
vmap <C-l> <Leader>c<Space>gv
imap <C-l> <ESC><Leader>c<Space>a
nmap <Leader>k <Leader>cc 
nmap <Leader>u <Leader>cu

" vim unimpaired mappings for moving lines (https://github.com/tpope/vim-unimpaired)
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv


"""""""""""""""""""""""""""""
" Standard Set Up           "
"""""""""""""""""""""""""""""

" Display line numbers
" set number

" Screen scrolls 3 lines in front of the cursor 
set scrolloff=3

" Have Vim break lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set linebreak

" set font for gui vim
set guifont=DejaVu\ Sans\ Mono:h17
" for color scheme
colorscheme mustard
set background=dark

" Turn syntax highlighting on 
syntax on

" show command as you type them
set sc

" specify backspace to work as you'd expect (http://vim.wikia.com/wiki/Backspace_and_delete_problems)
set backspace=2

" set tab as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" auto indent
set autoindent
" turn on the wildmenu cuz everyone says to
set wildmenu
" search characters as they're entered
set incsearch
" have vim re-load files when they're changed outside of vim
set autoread

" turn off error bells/sounds
set visualbell

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

nnoremap <space> za

" Some stuff everyone says you need
filetype on
filetype plugin on
filetype indent on

" Turn on auto-complete for various languages, plus re map tab to Ctrl+P
" (auto-complete command)
set omnifunc=syntaxcomplete#Complete

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
imap <Tab> <C-P>


"""""""""""""""""""""""""""""""""
" My Re-Mappings                "
"""""""""""""""""""""""""""""""""

" ii to leave insert mode and return to normal mode 
imap ii <Esc>

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor 
nmap <CR> o<Esc>
nmap <S-Enter> O<Esc>

" When searching, center the result in the middle of the screen
"nnoremap n nzzzv
"nnoremap N Nzzzv

" j and k don't skip over wrapped lines
nnoremap j gj
nnoremap k gk

" H to beginning of line, L to the end
noremap H ^
noremap L $

noremap <c-a> ^
noremap <c-e> $

" J and K move up and down 10 lines
noremap J 10j
noremap K 10k

" Tab and Shift tab to indent and un-indent
nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" D deletes to the end of the line, as it should
noremap D d$

" X removes line without placing it in the default registry
nmap X "_dd
" In visual mode, X removes selection without placing it in the default registry
vmap X "_d

" Control + p pastes from the 'yank register', and the ] formats it to indent you're pasting into (http://vimcasts.org/episodes/meet-the-yank-register/)
nmap <c-p> "0]P

" use leader to interact with the system clipboard 
nnoremap <Leader>p "*]P
nnoremap <Leader>v "*]P
vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

"nnoremap <D-v> "*P
"inoremap <D-V> <Esc>"*Pi

" place whole file on the system clipboard (and return cursor to where it was)
nmap <Leader>a maggVG"*y`a


if !exists( "*RubyEndToken" )
    function RubyEndToken()
        let current_line = getline( '.' )
        let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
        let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
        let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

        if match(current_line, braces_at_end) >= 0
            return "\<CR>}\<C-O>O"
        elseif match(current_line, stuff_without_do) >= 0
            return "\<CR>end\<C-O>O"
        elseif match(current_line, with_do) >= 0
            return "\<CR>end\<C-O>O"
        else
            return "\<CR>"
        endif
    endfunction
endif

autocmd FileType ruby imap <buffer> <CR> <C-R>=RubyEndToken()<CR>


if !exists( "*BracesEndToken" )
    function BracesEndToken()
        let current_line = getline( '.' )
        let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

        if match(current_line, braces_at_end) >= 0
            return "\<CR>}\<C-O>O"
        else
            return "\<CR>"
        endif
    endfunction
endif

autocmd FileType javascript imap <buffer> <CR> <C-R>=BracesEndToken()<CR>
autocmd FileType css imap <buffer> <CR> <C-R>=BracesEndToken()<CR>
