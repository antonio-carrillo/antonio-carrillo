" Plugins location
if has('win32') || has('win64')
    let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
    let g:plugged_home = '~/.vim/plugged'
endif

" Plugins List
call plug#begin(g:plugged_home)
    " Themes
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ayu-theme/ayu-vim'
    Plug 'chriskempson/base16-vim'
    Plug 'artanikin/vim-synthwave84'
    Plug 'ghifarit53/tokyonight-vim'
    " UI
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    " Hotkeys
    Plug 'tpope/vim-unimpaired'
    " Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Syntax check
    Plug 'w0rp/ale'
    " Completion, documentation, and typification (CoC)
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    "   For configuration file run the command: :CocConfig
    "   Installed with CocInstall:
    "     coc-css
    "     coc-jedi
    "     coc-json
    "     coc-phpls
    "     coc-react-refactor
    "     coc-tailwindcss
    "     coc-tsserver
    " C/C++
    Plug 'Shougo/deoplete.nvim'
    Plug 'zchee/deoplete-clang'
    " Python
    "   Docstrings
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
    "   PEP8 identation
    Plug 'Vimjas/vim-python-pep8-indent'
    " JavaScript / TypeScript
    Plug 'alvan/vim-closetag'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'elzr/vim-json'
    Plug 'GutenYe/json5.vim'
    Plug 'mxw/vim-jsx'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'millermedeiros/vim-esformatter'
    Plug 'prettier/vim-prettier'
call plug#end()

" Behaviours
set nobackup
set nolazyredraw
set noswapfile
set nowritebackup
set ignorecase  " ignore case when searching
set smartcase   " smartcase when searching

" Tab and indentation
filetype plugin indent on
set expandtab
set smartindent
set tabstop=2
set shiftwidth=0
set softtabstop=2
autocmd FileType
    \ markdown,python,vim
    \ setlocal expandtab
    \ tabstop=4 softtabstop=4

" Font
set guifontwide=Noto_Sans_Mono


" UI configuration
syntax on
syntax enable
set number
set relativenumber
set hidden
set colorcolumn=80
set cursorline
set noshowmode
set splitbelow
set splitright

"   True Color
if has('termguicolors')
    set termguicolors
endif
if has('gui_running')
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

"   Airline
let g:airline_left_sep  = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '㏑'
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = ''
let airline#extensions#ale#warning_symbol = 'W:'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '/'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0
let airline#extensions#tabline#middle_click_preserves_windows = 1

"   IdentLine
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" Themes
"   Airline
" let base16colorspace=256
" colorscheme base16-gruvbox-dark-hard
" hi Normal guibg=NONE ctermbg=NONE
"   Ayu
let ayucolor='dark'
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
highlight Comment cterm=italic gui=italic
"   TokyoNight
" colorscheme tokyonight
" let g:tokyonight_style = 'storm'
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_cursor = 'green'
"   Synthwave 84
" let base16colorspace=256
" colorscheme synthwave84
" hi Normal guibg=NONE ctermbg=NONE
" highlight Comment cterm=italic gui=italic

" Closetag
let g:closetag_shortcut = '<leader>>'
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.vue,*xhtml,*.xml,*.php,*.js'
let g:closetag_filetypes =
  \ 'html,xhtml,phtml,javascriptreact,typescriptreact,php,javascript'
let g:closetag_regions = {
  \   'typescript.tsx': 'jsxRegion,tsxRegion',
  \   'javascript.jsx': 'jsxRegion',
  \ }

" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
    \ b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \   'Modified'  : '~',
    \   'Staged'    : '+',
    \   'Untracked' : '?',
    \   'Renamed'   : '→',
    \   'Unmerged'  : '=',
    \   'Deleted'   : '-',
    \   'Dirty'     : 'd',
    \   'Clean'     : 'c',
    \   'Ignored'   : 'i',
    \   'Unknown'   : 'u',
    \ }
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-T> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_user_command = ['.git',
    \ 'cd %s && git ls-files -co --exclude-standard']

" CoC
augroup COC
    " Use tab for trigger completion with characters ahead and navigate.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-N>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<C-H>"
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    " Use <C-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <C-space> coc#refresh()
    else
        inoremap <silent><expr> <C-@> coc#refresh()
    endif
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use <C-K> to show documentation in preview window.
    nnoremap <silent> <C-K> :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    " Remap <C-F> and <C-B> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-F> coc#float#has_scroll() ?
            \ coc#float#scroll(1) : "\<C-F>"
        nnoremap <silent><nowait><expr> <C-B> coc#float#has_scroll() ?
            \ coc#float#scroll(0) : "\<C-B>"
        inoremap <silent><nowait><expr> <C-F> coc#float#has_scroll() ?
            \ "\<C-R>=coc#float#scroll(1)\<CR>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-B> coc#float#has_scroll() ?
            \ "\<C-R>=coc#float#scroll(0)\<CR>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-F> coc#float#has_scroll() ?
            \ coc#float#scroll(1) : "\<C-F>"
        vnoremap <silent><nowait><expr> <C-B> coc#float#has_scroll() ?
            \ coc#float#scroll(0) : "\<C-B>"
    endif
augroup END

" Python
"   Docstrings
let g:pydocstring_formatter = 'numpy'
nmap <silent> <F4> <Plug>(pydocstring)

" Linter
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'c': ['clang-format'],
    \   'cpp': ['clang-format'],
    \   'css': ['prettier'],
    \   'html': ['tidy'],
    \   'javascript': ['eslint', 'prettier'],
    \   'json': ['eslint', 'prettier'],
    \   'json5': ['eslint', 'prettier'],
    \   'php': ['php_cs_fixer'],
    \   'python': ['autopep8'],
    \   'typescript': ['eslint', 'prettier'],
    \   'typescriptreact': ['eslint', 'prettier'],
    \ }
let g:ale_linters = {
    \   'c': ['clang'],
    \   'cpp': ['clang'],
    \   'html': ['tidy'],
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
    \   'typescriptreact': ['eslint'],
    \   'python': ['flake8'],
    \ }
nmap <silent> <F3> <Plug>(ale_fix)

" Git
"   Marks
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
"   Colors
highlight SignifySignAdd
    \ ctermfg=black ctermbg=green
    \ guifg=#000000 guibg=#00ff00
highlight SignifySignDelete
    \ ctermfg=black ctermbg=red
    \ guifg=#ffffff guibg=#aa0000
highlight SignifySignChange
    \ ctermfg=white ctermbg=yellow
    \ guifg=#ffffff guibg=#aa5500
"   Navigation through hunks
nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)
nmap ]H 9999]h
nmap [H 9999[h

" TIAH

" CoC Remaps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

" Fix markdown files not displaying code
let g:indentLine_fileTypeExclude = ['markdown']
let g:indentLine_concealcursor = 'n'
" Clear search with Ctrl+L
nmap <silent> <C-L> :noh<CR>
" Delete on letters on edit mode
inoremap <C-L> <Del>
" Replace selected text
vnoremap <C-R> "hy:%s/<C-R>h//gc<left><left><left>
" Higlight Tags
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo',
        \ 'TODO\|FIXME\|DEBUG\|HACK\|TEST\|NOTE\|DEV\|TIAH\|<<<\|>>>',
        \ -1)
augroup END

" Paste and select pasted
noremap <silent> gp p`[v`]
noremap <silent> gP P`[v`]

" Navigation through tabs
noremap <silent> [t :tabprev<CR>
noremap <silent> ]t :tabnext<CR>
noremap <silent> [T :1tabnext<CR>
noremap <silent> ]T :$tabnext<CR>
noremap <silent> [<C-T> :-tabmove<CR>
noremap <silent> ]<C-T> :+tabmove<CR>

" Auto-close quotes and parenthesis
ino <leader><leader> <leader>
ino <leader>" ""<left>
ino <leader>' ''<left>
ino <leader>« «»<left>
ino <leader>< <><left>
ino <leader>` ``<left>
ino <leader>( ()<left>
ino <leader>[ []<left>
ino <leader>{ {}<left>

ino <leader>[<CR> [<CR>]<ESC>O
ino <leader>(<CR> (<CR>)<ESC>O
ino <leader>{<CR> {<CR>}<ESC>O

ino <leader><CR> <CR><ESC>O

" Lorem ipsum
ino /lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
    \ eiusmod tempor incididunt ut labore et dolore magna aliqua.
