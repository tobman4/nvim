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
set completeopt=menu,menuone,noselect,longest

set splitright
set splitbelow

set nobackup
set nowritebackup
set updatetime=300

let g:ale_disable_lsp = 1

" Vimspector: {{{

  let g:vimspector_enable_mappings = 'HUMAN'

" }}}

" COOL_KEYS: {{{

map <A-Left> :vertical resize -5<CR>
map <A-Right> :vertical resize +5<CR>
map <A-Up> :horizontal resize +5<CR>
map <A-Down> :horizontal resize -5<CR>

" map F :Telescope find_files<CR>
" map F :Clap files<CR>
" map C :Clap command<CR>

map <C-R> :so ~/.config/nvim/init.vim<CR>

" }}}

call plug#begin()

Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Plug 'vn-ki/coc-clap'
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'flazz/vim-colorschemes'
Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'APZelos/blamer.nvim'
" Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Provider: {{{

  runtime! plugged/tl/**.vim

" }}}

colorscheme Tomorrow-Night-Eighties

let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

" Clap: {{{

  let g:clap_preview_direction = 1
  let g:clap_layout = { 'relative': 'editor' }
	let g:clap_open_action = { 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-s': 'vsplit' }

  " map <C-p> :Clap providers<CR>

" }}}

" NERD TREE: {{{

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>

" }}}

" Blame: {{{

map <C-b> :BlamerToggle<CR>

" }}}

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'


let g:ale_set_highlights = 0

highlight ALEWarning ctermbg=DarkMagenta

let g:ale_linters = {
\		'cs': ['OmniSharp']
\ }
let g:ale_fixers = {
\ "c#": [  "dotnet-format" ],
\ "*": [ "trim_whitespace", "remove_trailing_lines" ]
\ }

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" }}}
