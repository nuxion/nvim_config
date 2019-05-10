" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"encoding for representing and for writing files
set encoding=utf-8
set fileencoding=utf-8

 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch


"-----------------
" Usability options
"
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

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=r

" tags config
set tags=./tags;,tags;

" Display line numbers on the left
"set number
set relativenumber
" The space of column number
set numberwidth=3
set nu

"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
let mapleader = ","
map Y y$

"----------------------------
" Plugin manager
" https://github.com/tpope/vim-pathogen
execute pathogen#infect() 
execute pathogen#helptags()

"----------
" Airline config
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme='dark'
set t_Co=256 "export TERM=xterm-256color
" Color scheme 
"set background=dark
"colorscheme solarized
"colorscheme murphy
" https://draculatheme.com/vim/
"colorscheme dracula
let g:dracula_colorterm = 0
" https://github.com/dracula/vim/issues/96
" check echo $COLORTERM for truecolor response.
set termguicolors
color dracula
"colorscheme flatcolor LAST
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
" Neovim
let g:deoplete#enable_at_startup = 1


"------------------
" setting tagbar
" https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt
"
"nmap <F8> :TagbarOpen jf<CR>
"nmap <F8> :TagbarOpenAutoClose<CR>

"------------------------
" === Pymode configs ===
"------------------------
" Python-Mode has folding by default
" Disabling
set foldlevelstart=10
"-- Generic
" Turn off plugin's warnings  
let g:pymode_warnings = 1
let g:pymode_options_max_line_length = 79
" Automatic virtualenv detection
let g:pymode_virtualenv = 1
"-- Error checking:
" turn on:
let g:pymode_lint = 1
" check when save file:
" let g:pymode_lint_unmodified = 0
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_lint_ignore = ["W","CC","E265","E121","E128","E711","E301","E261","E241","E124","E126","E721"]
let g:pymode_lint_message = 1
"-- Debug
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_lint_select = 'EE'
"-- runcode
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
"-- Autocompletion
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope = 1
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Space>'
"Extended autocompletion (rope could complete objects which have not been
"imported
"let g:pymode_rope_autoimport = 0

" *********** "
" HTML config
" *********** "

" Close tags
" ==========
" https://github.com/alvan/vim-closetag
"
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"autoenable auto completiontags html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 

"************************"
" Nerdtree configuration "
"************************"

" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Mapping
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

" Managging windows

" Buffers
nnoremap <leader><Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Splits VIM
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
" Search items with vim
command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
" replace: :vimgrep /SearchItem/ **/*.scss
" https://benfrain.com/learning-vim-front-end-coding-month/ 
" ALE ale Ale configuration 
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
map <leader>a :ALEToggle <cr>
map <leader>p :CtrlPTag<cr>


" === Javascript ===
let g:javascript_plugin_jsdoc = 1
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
" :verbose setlocal shiftwidth? tabstop? softtabstop? expandtab?
" tabstop is the size of actual tab characters in the buffer
" shiftwidth is the size of indents
" softtabstop is the number of "spaces" inserted when hitting the tab key
autocmd FileType javascript setlocal omnifunc=tern#Complete shiftwidth=2 tabstop=2  softtabstop=0 expandtab
autocm FileType vue setlocal omnifunc=tern#Complete shiftwidth=2 tabstop=2  softtabstop=0 expandtab

"=== jsbeatufy ===
"map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
let g:editorconfig_Beautifier=expand('$HOME/.editorconfig')
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>



" === Autocomplete ===
"let g:ycm_python_binary_path = '/usr/bin/python3'
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" autocomplete close
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Don't show YCM's preview window [ I find it really annoying ]
"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt = 0

" === vim-ident-guides ===
" https://github.com/nathanaelkane/vim-indent-guides
let g:ident_guides_start_level = 2
let g:ident_guides_guide_size = 1


" unite
" https://github.com/Shougo/unite.vim.git
" nnoremap <C-p> :Unite file_rec/async<cr> 
" vim-gitgutter
let g:gitgutter_max_signs = 500 
map <leader>g :GitGutterLineHighlightsToggle
" ctrlp
nnoremap <leader>p :CtrlPTag
"nnoremap <C-t>p :CtrlPTag
nnoremap <C-p> :CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*,*pyc

" tagbar
nmap <F8> :TagbarToggle<CR>

" snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
