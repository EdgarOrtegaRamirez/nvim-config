" undercurl support
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let g:better_whitespace_filetypes_blacklist = ['NvimTree', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']

" vim-plug start
call plug#begin('~/.local/share/nvim/plugged')

" start lua plugins statr
Plug 'folke/persistence.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'MunifTanjim/nui.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
" LSP
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'ray-x/cmp-treesitter'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'numToStr/Comment.nvim'
Plug 'ur4ltz/surround.nvim'
Plug 'folke/which-key.nvim'
Plug 'nathom/filetype.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
Plug 'alvarosevilla95/luatab.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'feline-nvim/feline.nvim'
Plug 'gelguy/wilder.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'luukvbaal/stabilize.nvim'
Plug 'nacro90/numb.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'beauwilliams/focus.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/git-conflict.nvim'
Plug 'echasnovski/mini.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'mortepau/codicons.nvim'
Plug 'lewis6991/impatient.nvim'
" end lua plugins

" Plug 'dstein64/vim-startuptime'
Plug 'pantharshit00/vim-prisma'
" Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'
Plug 'eugen0329/vim-esearch'
" Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
" Plug 'sainnhe/gruvbox-material'
" Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'tpope/vim-repeat'
Plug 'andymass/vim-matchup'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Initialize plugin system
call plug#end()

" " When a file has been detected to have been changed outside of Vim and it has
" " not been changed inside of Vim, automatically read it again.
" set autoread

" Add comma as leader
" :nmap , \


" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" Display vertical column at 120 characters
highlight ColorColumn ctermbg=8

" Terminal True Color Support
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Ack.vim
" use Ack! by default - alias ack and Ack
" cnoreabbrev Ack Ack!
" cnoreabbrev ack Ack!
if executable('ag')
  " use the_silver_searcher if available
  let g:ackprg = 'ag --vimgrep'
endif
" search for the word under the cursor
nnoremap <leader><bs> :Ack! '\b<c-r><c-w>\b'<cr>


" Spell check for Markdown and Git commit messages
autocmd FileType markdown,gitcommit setlocal spell

" Map window prefix to ommit W
" this seems to be not needed since we are using vim-tmux-navigator plugin
" TODO: verify
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" START vim-markdown (polyglot)
" disable conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_fenced_languages = ['ruby=ruby', 'javascript=js', 'python=py']
" END

" START esearch
" Use <c-f><c-f> to start the prompt, use <c-f>iw to pre-fill with the current word
" or other text-objects. Try <plug>(esearch-exec) to start a search instantly.
nmap <c-f><c-f> <plug>(esearch)
map  <c-f>      <plug>(operator-esearch-prefill)

let g:esearch = {}

" Use regex matching with the smart case mode by default and avoid matching text-objects.
" let g:esearch.regex   = 1
" let g:esearch.textobj = 0
let g:esearch.case    = 'smart'

" Set the initial pattern content using the highlighted search pattern (if
" v:hlsearch is true), the last searched pattern or the clipboard content.
let g:esearch.prefill = ['hlsearch', 'last', 'clipboard']

" Override the default files and directories to determine your project root. Set
" to blank to always use the current working directory.
let g:esearch.root_markers = ['.git', 'Makefile', 'node_modules', 'Gemfile', 'package.json']

" augroup lspsaga_filetypes
"   autocmd!
"   autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
" augroup END

lua << LUA
require('init')
LUA
