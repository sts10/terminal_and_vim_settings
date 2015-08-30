" Control + n to toggle NERDTree sidebar
noremap <C-n> :NERDTreeToggle<CR>
" Allows you to quit vim if the only window left open is a NERDTree (https://github.com/scrooloose/nerdtree) 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Allows NERDTree to display hidden files
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['.DS_Store', '.git/']


" vim multiple cursors plugin (https://github.com/terryma/vim-multiple-cursors)
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-g>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'



" ii to leave insert mode and return to normal mode 
"imap ii <Esc>
"
"
function CleanAndTweet()

    let lineText = getline('.')
    "let escapedLine = substitute(lineText, "\"", "\\\"", "g")
    "let escapedLine = substitute(lineText, "'", "\'", "g")
    "nmap <leader>t :exec '!t update"'escapedLine'"'
    "return escapedLine
    let tweet = lineText 
    "execute '!t update "'escapedLine'"'
    execute "!t update '" tweet "'"
endfunction

"nmap <leader>tweet :call CleanAndTweet() 



nnoremap <D-v> "*P
inoremap <D-V> <Esc>"*Pi"
