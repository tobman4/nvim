" Looks and nav
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set backspace=indent,eol,start
set cursorline
set incsearch
set hlsearch
set nowrap
set number
set nocompatible
set mouse=""

set encoding=utf8
set relativenumber
" set completeopt=menu,menuone,noselect,longest

set splitright
set splitbelow

set nobackup
set nowritebackup
set updatetime=300

let g:python3_host_prog = '/usr/bin/python3.9'
let g:python_recommended_style=0

" let g:airline_statusline_ontop=1

filetype plugin on

autocmd FileType help wincmd L

" Vimspector: {{{

  let g:vimspector_enable_mappings = 'HUMAN'

" }}}

" COOL_KEYS: {{{

map <A-Left> :vertical resize -5<CR>
map <A-Right> :vertical resize +5<CR>
map <A-Up> :horizontal resize +5<CR>
map <A-Down> :horizontal resize -5<CR>

map <C-/> :noh<CR>
map <S-Left> ^
map <S-Right> $

map <C-R> :so ~/.config/nvim/init.vim<CR>

" }}}

call plug#begin()

" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'dracula/vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Plug 'vn-ki/coc-clap'
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" Plug 'flazz/vim-colorschemes'
" Plug 'puremourning/vimspector'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'mhinz/vim-signify'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'APZelos/blamer.nvim'
" Plug 'tpope/vim-fugitive'
" Plug 'dense-analysis/ale'
" Plug 'tpope/vim-fugitive'
" Plug 'preservim/nerdtree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Provider: {{{

  runtime! plugged/tl/**.vim

" }}}

colorscheme catppuccin-frappe

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
