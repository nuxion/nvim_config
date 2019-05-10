""" ==== starting ==== """
" plugin manager
execute pathogen#infect()
execute pathogen#helptags()

""" ==== generics ==== """
syntax on
set encoding=utf-8
set fileencoding=utf-8
let mapleader = ","
" close a file without lose the buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"let g:python_host_prog = '/usr/bin/python3'
"let g:python3_host_prog = '/usr/bin/python2.7'


""" ==== usability ==== """
" Use case insensitive search, except when using capital letters
"set ignorecase
set smartcase
" Disable arrow movement, resize splits instead.
"let g:elite_mode=1
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif
nnoremap <silent> <Leader>+ :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" close preview windows
set completeopt-=preview

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Display line numbers on the left
"set number
"set relativenumber
" The space of column number
set numberwidth=3
set nu

""" ==== filetypes ==== """
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

""" ==== theme ==== """
set t_Co=256 "export TERM=xterm-256color
set termguicolors
color dracula
let g:dracula_colorterm = 0

""" ==== Plugins ==== """
"" => denite
" following:
" https://medium.freecodecamp.org/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2
"    ;        - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
"" => Airline config
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme='dark'

"" ==> ALE ale 
map <leader>a :ALEToggle <cr>
let g:ale_completion_enabled = 0

"" => isort
" order python imports
let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'

"" ==> CtrlP
map <leader>p :CtrlPTag<cr>


"" ==> nerdtree 
" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


nmap <F7> :NERDTreeToggle <CR> 
" icons
 let g:NERDTreeIndicatorMapCustom = {
             \ "Modified"  : "✹",
             \ "Staged"    : "✚",
             \ "Untracked" : "✭",
             \ "Renamed"   : "➜",
             \ "Unmerged"  : "═",
             \ "Deleted"   : "✖",
             \ "Dirty"     : "✗",
             \ "Clean"     : "✔︎",
         \ 'Ignored'   : '☒',
             \ "Unknown"   : "?"
             \ }

"" => deoplate
let g:deoplete#enable_at_startup = 1

""" ==== LANGS ==== """
"" ==> Python
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
let g:ale_linters = {'python': ['flake8']}
" from http://liuchengxu.org/posts/use-vim-as-a-python-ide/
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\   'autopep8',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'yapf',
\]
"" => pymode config
" rope turn off
let g:pymode = 1
let g:pymode_rope = 0
" sort pylint errors
let g:pymode_lint = 0
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_ignore = ["W"]
"let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = $VIRTUAL_ENV
