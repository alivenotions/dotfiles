if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" For Mac/Linux users
call plug#begin('~/.vim/bundle')
Plug 'wakatime/vim-wakatime'
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'mhartington/oceanic-next'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

" Theme
syntax enable
" for vim 8
if (has("termguicolors"))
  set termguicolors
endif

color space-vim-dark

let g:javascript_plugin_jsdoc = 1
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"

" netrw settings
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_alto=1
let g:netrw_liststyle=3

syntax enable " enable syntax processing
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " indents will have a width of 2
set laststatus=2
set expandtab " tabs are spaces!!
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when need to
set showmatch " highlight matching parens
let g:rustfmt_autosave = 1 " for rust formatting on save

" autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" configure signify
" set updatetime=500
" let g:signify_realtime = 1

set incsearch " search as characters are entered
set hlsearch " highlight matches

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
nnoremap .. :w<CR>

map <CR> o<Esc>k
