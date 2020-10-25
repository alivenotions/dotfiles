" Theme
syntax on

" for vim 8
if (has("termguicolors"))
  set termguicolors
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" For Mac/Linux users
call plug#begin('~/.vim/bundle')
Plug 'wakatime/vim-wakatime'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'mhartington/oceanic-next'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/space-vim-dark'
Plug 'zivyangll/git-blame.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'evanleck/vim-svelte'
Plug 'liuchengxu/vim-which-key'
Plug 'francoiscabrol/ranger.vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" color space-vim-dark
" colorscheme sublimemonokai
colorscheme codedark

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
set number relativenumber " show hybrid line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when need to
set showmatch " highlight matching parens
let g:rustfmt_autosave = 1 " for rust formatting on save

" autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" split tabs and windows
set splitbelow splitright

" remap navigating splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set incsearch " search as characters are entered
set hlsearch " highlight matches

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

" save the file 
nnoremap ,, :w<CR>

" fuzzy search
nnoremap <space>f :GFiles<CR>
nnoremap <space>F :Files<CR>

" diffs with signify
nnoremap <space>d :SignifyDiff<CR>
nnoremap <space>h :SignifyHunkDiff<CR>

" don't use navigation keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" buffers
" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
" toggle between buffers
nnoremap <space><space> <C-^>

" paste from the yank register
nnoremap <space>p "0p

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

nnoremap <F5> :MundoToggle<CR>

" Enter an empty line below the current line
map <CR> o<Esc>k

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" coc config https://github.com/neoclide/coc.nvim

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

nmap <leader>rn <Plug>(coc-rename)
hi CocFloating ctermbg=0

if executable('ocamlmerlin') && has('python3')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
