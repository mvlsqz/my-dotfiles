" ======================================================================================================================
" Author : Martin Toma
" ======================================================================================================================
" Date created : Tue Nov 12 14:14:56 CET 2013
" VIMRC Config focused on RAILS development
" ======================================================================================================================

" ======================================================================================================================
" :help this_vimrc.txt
" ======================================================================================================================
"
" # Section 1. - The basics
"
"
"
" # Section 2. - File navigation
"
"
"
" # Section 3. - Navigation in code
"
"
"
" # Section 4. - Code manipulation
"
"
"
" # Section 5. - Look and feel
"
"
"
" # Section 6. - Other tweaks
"
"
" ======================================================================================================================

" ======================================================================================================================
" TODO SECTION
" ======================================================================================================================
"
" 1. Refactor all panel(window) opening shortcuts, possible to use F keys
" 2. Start writing this vimrc help file.
" 3. Refactor vimrc into more specifi files (https://github.com/thoughtbot/dotfiles/blob/master/vimrc)
"
" ======================================================================================================================

" ======================================================================================================================
" Bundler setting
" ======================================================================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------------------------------------------------------------------------------------------------------------
" Plugin list
" ---------------------------------------------------------------------------------------------------------------------

" Let Vundle manage Vundle, REQUIRED!
Plugin 'gmarik/Vundle.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Language/Framework support improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Rails vim plugin
Plugin 'tpope/vim-rails'
" Basic ruby related features
Plugin 'vim-ruby/vim-ruby'
" Slim templating syntax highliting
Plugin 'slim-template/vim-slim.git'
" Better JSON syntax
Plugin 'elzr/vim-json'
" Automatically inserts 'end' wisely
Plugin 'tpope/vim-endwise'
" HAML support for vim
Plugin 'tpope/vim-haml'
" Coffescript support for vim
Plugin 'kchmck/vim-coffee-script'
" Better javascript support
Plugin 'jelera/vim-javascript-syntax'
" CSS color highlighter
Plugin 'ap/vim-css-color'

" Needs linters to be install to work properly (see https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers)
" Syntax checking plugin
Plugin 'scrooloose/syntastic'

" The ulti snips engine. Makes possible to define custom snippets.
Plugin 'SirVer/ultisnips'
" Snippets for python, js, html, ruby...
Plugin 'honza/vim-snippets'
" Emmet for fast html prototyping
Plugin 'mattn/emmet-vim'

" ---------------------------------------------------------------------------------------------------------------------
" Vim motion/navigation improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Fuzzy file, buffer, MRU finder (CTRL-P)
Plugin 'kien/ctrlp.vim'
" Easily move around file (easy motion)
Plugin 'Lokaltog/vim-easymotion'
" Sneak, easy motion for long lines
Plugin 'justinmk/vim-sneak'

" ---------------------------------------------------------------------------------------------------------------------
" Vim interface improving plugins
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plugin 'scrooloose/nerdtree'
" Airline (improved statusline)
Plugin 'bling/vim-airline'
" History tree visualizer
Plugin 'sjl/gundo.vim'

" ---------------------------------------------------------------------------------------------------------------------
" Git/Github support plugins
" ---------------------------------------------------------------------------------------------------------------------

" Git wrapper
Plugin 'tpope/vim-fugitive'
" Git changes displayer
Plugin 'airblade/vim-gitgutter'
" Github gist plugin
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" ---------------------------------------------------------------------------------------------------------------------
" Other plugins
" ---------------------------------------------------------------------------------------------------------------------

" Change surroundings characters
Plugin 'tpope/vim-surround'
" Trailing spaces deleter (:FixWhitespaces)
Plugin 'bronson/vim-trailing-whitespace'
" Supertab for tab triggering completion (integrates with snippets, etc.)
Plugin 'ervandew/supertab'
" Autoclosing brackets and quotes
Plugin 'Raimondi/delimitMate'
" YANK history management
Plugin 'YankRing.vim'
" AG search from vim
Plugin 'ervandew/ag'
" Matchit better textobj support
Plugin 'tmhedberg/matchit'
" Custom textobj creation support
Plugin 'kana/vim-textobj-user'
" Ruby block text object
Plugin 'nelstrom/vim-textobj-rubyblock'
" Alignment on specific regex (:Tabularize \=)
Plugin 'godlygeek/tabular'

" ---------------------------------------------------------------------------------------------------------------------
" Colorscheme plugins
" ---------------------------------------------------------------------------------------------------------------------

" Hybrid light and dark color schemes
Plugin 'w0ng/vim-hybrid'
" Tomorrow theme
Plugin 'chriskempson/vim-tomorrow-theme'

" ---------------------------------------------------------------------------------------------------------------------
" End of plugin declaration
" ---------------------------------------------------------------------------------------------------------------------
call vundle#end()

" ======================================================================================================================
" Basic settings
" ======================================================================================================================

set shell=/bin/bash         " Setting vim shell to bash
set nocompatible            " No compatible with vi mode
set number                  " Line numbers
set noignorecase            " Don't ignore cases
set laststatus=2            " Always show status line
set showmode                " Always show mode
set wildmenu                " Better auto-complete of ex commands
set textwidth=120           " Text widht is 120 chars
set autoread                " Automatically reload change files on disk
set bg=dark                 " Dark background setting (dark theme version of current color)
set cursorline              " Set default cursor line (highlighting is done by color scheme)
set cmdheight=1             " Command line height
set pumheight=10            " Completion window max size
set iskeyword-=_            " Set underscore is a word separator
set timeoutlen=200          " Setting ESC timeout
set hlsearch                " Highlight search
set incsearch               " Incremental search
set hidden                  " Enables to switch between unsaved buffers and keep undo history
set undolevels=100          " How many undo commands to remember
set clipboard+=unnamed      " Use system clipboard
set history=256             " Number of things to remember in history
set nohlsearch              " Don't highlight after search
set mat=2                   " How many tenths of a second to blink when matching brackets
set lazyredraw              " Don't redraw while executing macros (good performance config)
set magic                   " For regular expressions turn magic on
set showmatch               " Show matching brackets when text indicator is over them
set encoding=utf8           " Set utf8 as standard encoding and en_US as the standard language
set pastetoggle=<F3>        " Toggle between paste and nopaste
set list                    " To display chars listed in listchars below
set spelllang=en_us         " Set language to us english
set spellfile=~/.vim/dictionary.utf-8.add

" -----------------------------------------------------
" Intedation settings (2 spaces tabs)
" -----------------------------------------------------
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" -----------------------------------------------------
" Split settings.
" -----------------------------------------------------
set splitbelow
set splitright

" -----------------------------------------------------
" Turn backup off, since most stuff is in git
" -----------------------------------------------------
set nobackup
set nowb
set noswapfile

" -----------------------------------------------------
" Highlight whitespaces
" -----------------------------------------------------
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" -----------------------------------------------------
" Filetype settings
" -----------------------------------------------------
syntax on
filetype off
filetype plugin on
filetype indent on

" -----------------------------------------------------
" Folding settings, by default is disabled, use zi
" -----------------------------------------------------
set foldmethod=syntax
set foldlevelstart=2
set fillchars="fold: "
set nofoldenable

" -----------------------------------------------------
" Enable omni completion. (Ctrl-X Ctrl-O)
" -----------------------------------------------------
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \         setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif

" -----------------------------------------------------
" Completion ignore list
" -----------------------------------------------------
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ======================================================================================================================
" Mapping settings
" ======================================================================================================================

" Setting leader
let mapleader="\<space>"
let g:mapleader="\<space>"

" Disabling arrow keys, space key, exmode enter with Q key
map <up> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map <Space> <nop>
nnoremap Q <nop>

" Toggle spellign on and off
nmap <silent> <F4> :set spell!<CR>
" Source vimrc, so new setting will be applied
nmap <silent> <F5> :source $MYVIMRC<CR>
" Open my vimrc in new tab
nmap <silent> <F6> :tabedit $MYVIMRC<CR>

" When jump to next match also center screen
noremap n nzz
" Write read only files with w!!
cmap w!! w !sudo tee % >/dev/null
" Easily switch between the last two files
nnoremap <leader><leader> <c-^>
" Remap VIM 0 to first non-blank character
nnoremap 0 ^
nnoremap ^ 0

" Window resizing keys
nnoremap <silent> = :vertical resize +5<CR>
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> _ :resize -5<CR>

" Map save to ctrl-s
nmap <silent> <c-s> :w<CR>
imap <silent> <c-s> <Esc>:w<CR>

" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines
vmap <C-j> xp`[V`]
vmap <C-k> xkP`[V`]

" ======================================================================================================================
" Color and highligting settings
" ======================================================================================================================

" Xterm 256 colors
if $TERM == 'xterm-256color' || 'screen-256color'
    set t_Co=256
    " Set colorcolumn
    let &colorcolumn=121
endif

" Color scheme
colorscheme Tomorrow-Night
" Airline theme
let g:airline_theme='tomorrow'

" Git gutter settings (signcolumn color)
highlight clear SignColumn
" Remove underline in folded lines
hi Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" ======================================================================================================================
" Plugin settings
" ======================================================================================================================

" -----------------------------------------------------
" Airline settings
" -----------------------------------------------------
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0

" -----------------------------------------------------
" Nerdtree setting
" -----------------------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" -----------------------------------------------------
" CTRL-P settings
" -----------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_cmd = 'CtrlPMixed'

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches - so that appctrl will find application controller
let g:ctrlp_by_filename = 1

" -----------------------------------------------------
" Ultisnips settings
" -----------------------------------------------------
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-n>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" -----------------------------------------------------
" Supertab settings TODO: Think about c-p
" -----------------------------------------------------
let g:SuperTabDefaultCompletionType = '<c-p>'

" -----------------------------------------------------
" Syntastic settings
" -----------------------------------------------------
let g:syntastic_ruby_checkers = ['mri']
" mark syntax errors with :signs
let g:syntastic_enable_signs=1
" automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" show the error list automatically
let g:syntastic_auto_loc_list=1
" don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}
" check on open as well as save
let g:syntastic_check_on_open=1

" -----------------------------------------------------
" Gundo settings
" -----------------------------------------------------
let g:gundo_right = 1
let g:gundo_preview_height = 30

" -----------------------------------------------------
" Easy motion settings
" -----------------------------------------------------
let g:EasyMotion_keys='asdfjkoweriop'

" ---------------------------------------------------------------------------------------------------------------------
" Plugin mapping and other settings
" ---------------------------------------------------------------------------------------------------------------------

" Show nerdtree panel
nnoremap <silent> <F1> :NERDTreeToggle<CR>

" Show gundo panel
nnoremap <silent> <F2> :GundoToggle<CR>

" CTRL-P mapping
let g:ctrlp_map = '<Leader>p'
nnoremap <silent> <Leader>t :CtrlPBufTagAll<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" Easy motion mapping
let g:EasyMotion_leader_key = 'm'

" Tabs switching and closing mapping
nnoremap td :tabclose<CR>
nnoremap tn :tabnext<CR>
nnoremap tb :tabprevious<CR>

" Yankring mapping
map <Leader>y :YRShow<CR>

" Surround vim shortcut for quotes toggle
nmap cq cs"'
nmap cQ cs'"

" ======================================================================================================================
" Setting abbrevations to automatically repair mistakes
" ======================================================================================================================

ab teh the

" ======================================================================================================================
" END OF VIMRC
" ======================================================================================================================
