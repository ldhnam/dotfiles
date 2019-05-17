"========================================================
" INSTALL PLUGINS
"========================================================
filetype off
call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern'  }
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'iamcco/markdown-preview.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'chriskempson/base16-vim'
    Plug 'posva/vim-vue'
    Plug 'tpope/vim-fugitive'
    Plug 'w0rp/ale'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'sheerun/vim-polyglot'
    Plug 'easymotion/vim-easymotion'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mattn/emmet-vim'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'mxw/vim-jsx'
    Plug 'joshdick/onedark.vim'

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()


"========================================================
" EDITOR CONFIGS
"========================================================
syntax on
filetype on
filetype indent on
filetype plugin on
set hlsearch
set ai
set ruler
set linespace=1
let g:auto_ctags = 1
set breakindent
set nofoldenable
set number
set expandtab
set autoindent
set smartindent
set clipboard=unnamed
set nohlsearch
set splitright
set splitbelow
set lazyredraw
set encoding=utf8
set background=dark
set bs=2 tabstop=4 shiftwidth=4 softtabstop=4
set showcmd
if (has("termguicolors"))
 set termguicolors
endif
colorscheme onedark
let mapleader = "\<Space>"
set autoread
au CursorHold * checktime

" Fix iterm display
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"========================================================
" MAPPING FZF
"========================================================
map <silent> <leader>/ <ESC>:BLines<CR>
map <leader>ag <ESC>:Ag<space>
let g:fzf_preview_source=" --preview='bat {}'"
map <c-p> <ESC>:call fzf#vim#files('.', {'options': g:fzf_preview_source})<CR>

"" Map key
" close buffer
nmap qq :bd<cr>

"Quit all
nmap qa :qa<cr>

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

" This is the default extra key bindings
" let g:fzf_action = {
      " \ 'ctrl-v': 'vsplit' }

"========================================================
"" MAPPING NERDTree
"========================================================
map <C-e> :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'

"========================================================
"" CONFIG PYTHON
"========================================================
let g:python3_host_prog = '/usr/local/bin/python3.7'
let g:python2_host_prog = '/usr/local/bin/python2.7'

"========================================================
"" CONFIG DEOPLETE
"========================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:tern_request_timeout = 1
let g:tern#filetypes = ['js', 'jsx', 'vue']
let g:tern#command = ['tern']

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:phpcd_php_cli_executable = 'php7.0'

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/deoplete-go'
let g:go_def_mode = "guru"

if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
  endif
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer','tag']
let g:neosnippet#enable_completed_snippet = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

"========================================================
" MAPPING EASYMOTION
"========================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"========================================================
" CONFIG ALE
"========================================================
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_keep_list_window_open = 0
let g:ale_sign_column_always = 1

" use nice symbols for errors and warnings
let g:ale_sign_error = '‚ÄºÔ∏è'
let g:ale_sign_warning = '‚ö†Ô∏è'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Prettier
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"

" Fast moving tab airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" make emmet behave well with JSX in JS and TS files
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_template_tags = ['html', 'raw']
let g:vim_jsx_pretty_colorful_config = 1


au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
