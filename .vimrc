if empty(glob('~/.vim/autoload/plug.vim'))                                                                                                                                                                  
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" For Mac/Linux users
call plug#begin('~/.vim/bundle')
Plug 'wakatime/vim-wakatime'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhartington/oceanic-next'
call plug#end()

" Theme
syntax enable
" for vim 8
if (has("termguicolors"))
  set termguicolors
endif
let g:oceanic_next_terminal_bold = 1 
let g:oceanic_next_terminal_italic = 1 

colorscheme OceanicNext

let g:javascript_plugin_jsdoc = 1 

syntax enable " enable syntax processing
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " indents will have a width of 2
set expandtab " tabs are spaces!!
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when need to
set showmatch " highlight matching parens

set incsearch " search as characters are entered
set hlsearch " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" for adding a new line below the selection without
" exiting the command mode
map <CR> o<Esc>k
