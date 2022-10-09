"---- vim-plug setup  ----
"
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')

else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----

set nocompatible

call plug#begin('~/.config/nvim/plugged')

" Sensible default
Plug 'tpope/vim-sensible'
Plug 'tomtom/tcomment_vim'

" Color schemes
Plug 'sainnhe/edge'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'

" File explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'nvim-lualine/lualine.nvim'

Plug 'simnalamburt/vim-mundo'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vimwiki/vimwiki'
Plug 'preservim/vim-pencil'
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'simrat39/rust-tools.nvim'

Plug 'tpope/vim-fugitive'
Plug 'pechorin/any-jump.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'ntpeters/vim-better-whitespace'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'svermeulen/vim-yoink'
Plug 'rhysd/git-messenger.vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

if has('termguicolors')
  set termguicolors
endif

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

" remap leader
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" tnoremap <Esc> <C-\><C-n>
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf,rg tunmap <Esc>
endif

" colorscheme edge
" colorscheme embark
colorscheme tokyonight-moon

syntax on

filetype plugin indent on

" vim pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,md call pencil#init()
  autocmd FileType text call pencil#init()
  autocmd FileType vimwiki call pencil#init()
augroup end

" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex,vimwiki DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
let g:ditto_min_repetitions = 4
let g:ditto_min_word_length = 5

" Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set cmdheight=2
set updatetime=50
set signcolumn=yes

set relativenumber
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " indents will have a width of 2
set laststatus=2 " always show the bar
set expandtab " tabs are spaces!!
set smartindent
set showcmd " show command in bottom bar
set cursorline " dont highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when need to
set showmatch " highlight matching parens
set visualbell " no sounds
set undofile
set undodir=~/.vim/undo
set ignorecase
set smartcase
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

set clipboard=unnamed,unnamedplus

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

set completeopt=menu,menuone,noselect

" Syntax
lua <<EOF
require'nvim-tree'.setup {}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
EOF

" -------------------- LSP ---------------------------------
lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightGrey guifg=Black
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightGrey guifg=Black
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightGrey guifg=Black
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
  end

  -- Setup nvim-cmp.
  local cmp = require 'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  nvim_lsp['tsserver'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
  }
  nvim_lsp['rust_analyzer'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
  }
  require('lualine').setup()
EOF

lua require('lspfuzzy').setup {}
lua require('gitsigns').setup()

lua <<EOF
require'nvim-web-devicons'.setup {
  default = true;
}
EOF

" File explorer
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tn :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

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
" Tell FZF to use RG - so we can skip .gitignore files even if not using
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" If you want gitignored files:
"let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
nnoremap <space>F :GFiles<CR>
nnoremap <space>f :Files<CR>

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
" Look at buffers and prepare for a number to be put in
nnoremap <space>b :ls<CR>:b<Space>

" paste from the yank register
nnoremap <space>p "0p

nnoremap <F5> :MundoToggle<CR>

" Enter an empty line below the current line
map <CR> o<Esc>k

" fugitive
nmap <space>gh :diffget //3<CR>
nmap <space>gf :diffget //2<CR>
nmap <space>gs :G<CR>

" yoink history
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)
