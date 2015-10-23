
" Use Vundle to handle plugins
set nocompatible
filetype off " temporarily turn this off so Vundle works correctly
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin for a GitHub repo:
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sickill/vim-pasta'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-vinegar'
Plugin 'ervandew/supertab'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'

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


" set leader to comma
let mapleader = ","

"""""""""""""""""""""""""""""""
" PLUG-IN SETTINGS            "
"""""""""""""""""""""""""""""""

" Ctrl- P mapping and two custom split keymappings (https://github.com/kien/ctrlp.vim)
let g:ctrlp_map = '<c-p>'
nmap <c-n>s :split<CR><c-w>j<c-p>
nmap <c-n>v :vsplit<CR><c-w>l<c-p>

" map comment and uncomment from NERDCommenter (https://github.com/scrooloose/nerdcommenter)
nmap <C-l> <Leader>c<Space>
vmap <C-l> <Leader>c<Space>gv
imap <C-l> <ESC><Leader>c<Space>a

" vim unimpaired mappings for moving lines (https://github.com/tpope/vim-unimpaired)
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" git@github.com:terryma/vim-smooth-scroll.git
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>


" Markdown to HTML 
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

""""""""""""""""""""""""""""
" NeoVim Specific          "
""""""""""""""""""""""""""""

if has("nvim")
  set t_Co=256
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"""""""""""""""""""""""""""""
" Standard Set Up           "
"""""""""""""""""""""""""""""

" More colors
if !has('gui_running')
  "set t_Co=256
endif

" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set nu!
" Keep the line number gutter narrow
set numberwidth=2

" no line numbers in markdown files
autocmd FileType markdown setlocal norelativenumber
autocmd FileType markdown setlocal nonumber

" Screen scrolls 3 lines in front of the cursor 
set scrolloff=5

" by default don't wrap lines
set nowrap 

" show two status lines
set laststatus=2

" But do wrap on these types of files...
autocmd FileType markdown setlocal wrap
autocmd FileType html setlocal wrap
autocmd FileType css setlocal wrap
autocmd FileType txt setlocal wrap

" And when Vim down wrap lines, have it break the lines on spaces and punctuation only (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set linebreak

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos. 
" Pretty sure you need to mkdir backup, swap, and undo first to make this work
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" set font for gui vim
set guifont=DejaVu\ Sans\ Mono:h20
" for color scheme
colorscheme mustard
set background=dark

" Turn syntax highlighting on 
syntax on

" show command as you type them
set sc

" specify backspace to work as you'd expect (http://vim.wikia.com/wiki/Backspace_and_delete_problems)
set backspace=2

" set tab as 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

" tabs are 4 spaces for python files, cuz lol python
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4

" auto indent
set autoindent
set smartindent 

" turn on the wildmenu cuz everyone says to
set wildmenu
" search characters as they're entered
set incsearch
" have vim re-load files when they're changed outside of vim
set autoread

" set search case to a good configuration http://vim.wikia.com/wiki/Searching 
set ignorecase
set smartcase

" turn off error bells/sounds
set visualbell

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

"nnoremap <space> za

" Some stuff everyone says you need
filetype on
filetype plugin on
filetype indent on

" turn on spell check for markdown files
autocmd FileType markdown setlocal spell spelllang=en_us
" add the spelling dictionary to the end of the list of sources to check for
" auto completion
autocmd FileType markdown setlocal complete+=kspell 

" Turn on auto-complete for various languages
set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


"imap <Tab> <C-P>


"""""""""""""""""""""""""""""""""
" My Re-Mappings                "
"""""""""""""""""""""""""""""""""

" Enter gives a new line when in command mode without entering insert mode. Likewise, shift+enter gives a new line
" above the cursor 
nmap <CR> o<Esc>
nmap <S-Enter> O<Esc>

" When searching, center the result in the middle of the screen
"nnoremap n nzzzv
"nnoremap N Nzzzv

" j and k don't skip over wrapped lines
autocmd FileType html nnoremap j gj
autocmd FileType markdown nnoremap j gj
autocmd Filetype html nnoremap k gk
autocmd Filetype markdown nnoremap k gk

" H to beginning of line, L to the end
noremap H ^
noremap L $

"noremap <c-a> ^
"noremap <c-e> $
inoremap <c-a> <Esc>I
inoremap <c-e> <Esc>A

" J and K move up and down 10 lines
"noremap J 10j
"noremap K 10k

" Tab and Shift tab to indent and un-indent (turning this off considering I'm
" using SuperTab plugin now?)
"nnoremap <Tab> >>
"nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" In markdown files, Control + a surrounds highlighted text with square
" brackets, then dumps system clipboard contents into parenthesis
autocmd FileType markdown vnoremap <c-a> <Esc>`<i[<Esc>`>la](<Esc>"*]pa)<Esc>

" D deletes to the end of the line, as it should
nnoremap D d$

" X removes line without placing it in the default registry
nmap X "_dd

" In visual mode, X removes selection without placing it in the default registry
vmap X "_d
vmap x "_d

" 0 is the 'yank register', and the ] formats it to indent you're pasting into. This command does all that with control + p (from http://vimcasts.org/episodes/meet-the-yank-register/)
"nmap <c-p> "0]P

" Make the * command a bit more like Sublime's Multiple Cursor
"nmap * *viw<Esc>NNgn
vmap * <Esc>ngn
" remap * to stay at first match
"nmap * *N 

" use leader to interact with the system clipboard 
nnoremap <Leader>p "*]p
nnoremap <Leader>P "*]P
nnoremap <Leader>v "*]p
nnoremap <Leader>V "*]P

nnoremap <Leader>y ma^"*y$`a
nnoremap <Leader>c ^"*c$
nnoremap <Leader>d ^"*d$

vnoremap <Leader>y "*y
vnoremap <Leader>c "*c
vnoremap <Leader>d "*d

" place whole file on the system clipboard (and return cursor to where it was)
nmap <Leader>a maggVG"*y`a

" space for window management, plus some methods of expanding a window quickly
nnoremap <Space> <C-w>
nnoremap <Space>t <C-w>5+
nnoremap <Space>f <C-w>5>
"nnoremap <Space>T <C-w>5-
"nnoremap <Space>F <C-w>5<

"map <Leader>t for tab navigation
nmap <Leader>t gt
nmap <Leader>T gT

" Allow some of the emacs motions on the vim command line.
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

function UrlToArticle()
  let url = getline('.')
  read(!ruby /Users/samschlinkert/Documents/code/em/url_to_article.rb getline('.'))
  " this works when run in command mode: 
  " :read !ruby /Users/samschlinkert/Documents/code/em/url_to_article.rb http://samschlinkert.com
  "let @a = read \"!ruby /Users/samschlinkert/Documents/code/em/url_to_article.rb " url 
  "put a
endfunction

"nmap <leader>l :call UrlToArticle()


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

"autocmd FileType ruby imap <buffer> <CR> <C-R>=RubyEndToken()<CR>


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
