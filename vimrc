execute pathogen#infect()
set backspace=indent,eol,start
set clipboard=unnamedplus
set number
set history=700
"set tabstop=4
"set shiftwidth=4
"set expandtab
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
set ai
set si
set wrap
set t_Co=256
syntax on
syntax enable
let g:airline#extensions#syntastic#enabled = 1
filetype plugin indent on
inoremap jk <esc>
inoremap jj <C-n>
nnoremap ; :
map <C-n> :NERDTreeToggle<CR>
let g:user_emmet_leader_key='<C-E>'
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
"colorscheme koehler
colorscheme evolution
let g:JSHintHighlightErrorLine=0
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
"au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
let g:syntastic_javascript_checkers=['eslint'] " js error checker
let g:syntastic_rust_checkers = ['cargo'] " rust error checker
set hls
highlight LineNr ctermfg=14
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

" ==== Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

"set tabspace to 4 only for html files
autocmd FileType html setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType js setlocal tabstop=4 shiftwidth=4 softtabstop=4

"setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
" ==== End Terminal Function

" enable auto import when pressing ENTER after auto complete with pyright
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Note these 2 settings below need to both be enabled to format on save
" Enable auto formatting of files that have "@format" or "@prettier" tag
let g:prettier#autoformat = 1
" Allow auto formatting for files without "@format" or "@prettier" tag
let g:prettier#autoformat_require_pragma = 0

" Note on coc-tslint-plugin: install with :CocInstall coc-tsserver coc-tslint-plugin
