set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=/usr/local/opt/fzf

set guifont=Source\ Code\ Pro\ Regular\

set runtimepath+=~/.vim-plugins/LanguageClient-neovim

let mapleader = "\<Space>"

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

noremap <Up> <NOP>
noremap <DOWN> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

language en_US

call vundle#rc()

  "NerdTree
  Bundle 'gmarik/vundle'
  Bundle 'scrooloose/nerdtree'
  Bundle 'Xuyuanp/nerdtree-git-plugin'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'jistr/vim-nerdtree-tabs'
  Bundle 'tyok/nerdtree-ack'
  autocmd StdinReadPre * let s:std_in=1
  map <C-e> :NERDTreeToggle<CR>
  autocmd VimEnter * wincmd p

  Bundle 'ctrlpvim/ctrlp.vim'
  Bundle 'tacahiroy/ctrlp-funky'
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/publish/*,*/dist/*,*/node_modules/*,*/bower_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.swo,*.DS_Store
  nmap <leader>o :CtrlP<cr>
  nmap <leader>c :CtrlPClearCache<cr>
  let g:ctrlp_working_path_mode = 'wa'

  Bundle 'easymotion/vim-easymotion'
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)

  Bundle 'tpope/vim-surround'

  Bundle 'terryma/vim-multiple-cursors'
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

  let g:NERDSpaceDelims = 2
  let g:NERDCompactSexyComs = 2
  let g:NERDDefaultAlign = 'left'
  let g:NERDTrimTrailingWhitespace = 1

  "Bundle 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
   Bundle 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
   Bundle 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

  Bundle 'junegunn/vim-easy-align'
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  Bundle 'jiangmiao/auto-pairs'

  Bundle 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = '<C-n>'

  Bundle 'Shougo/deoplete.nvim'
  Bundle 'roxma/nvim-yarp'
  Bundle 'roxma/vim-hug-neovim-rpc'

  Bundle 'honza/vim-snippets'

  "Golang
  Bundle 'zchee/deoplete-go', { 'do': 'make'}

  "Javascript
  Bundle 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
  Bundle 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install && npm install -g tern' }
  Bundle 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Bundle 'posva/vim-vue'
  Bundle 'leafgarland/typescript-vim'
  Bundle 'Shougo/neosnippet.vim'
  Bundle 'Shougo/neosnippet-snippets'
  Bundle 'maksimr/vim-jsbeautify'
  Bundle 'elzr/vim-json'

  "CSS
  Bundle 'ap/vim-css-color'
  Bundle 'cakebaker/scss-syntax.vim'
  let g:solarized_termcolors=256
  let base16colorspace=256

  Bundle 'vim-airline/vim-airline'
  Bundle 'vim-airline/vim-airline-themes'
  Bundle 'alvan/vim-closetag'

  "Git
  Bundle 'airblade/vim-gitgutter'
  Bundle 'tpope/vim-git'
  Bundle 'sjl/gundo.vim'
  Bundle 'tpope/vim-fugitive'
  Bundle 'ntpeters/vim-better-whitespace'

  "Tmux
  Bundle 'erikw/tmux-powerline'
  Bundle 'christoomey/vim-tmux-navigator'
  Bundle 'wellle/tmux-complete.vim'
  Bundle 'Yggdroot/indentLine'
  Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Bundle 'junegunn/fzf.vim', { 'depends': 'fzf' }
  Bundle 'vim-scripts/git-time-lapse'
  Bundle 'pangloss/vim-javascript'

  Bundle 'w0rp/ale'
  Bundle 'chriskempson/base16-vim'
  Bundle 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Bundle 'tmhedberg/SimpylFold'
  Bundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}

  "Docker
  Bundle 'ekalinin/Dockerfile.vim'

  syntax on
  set background=dark
  colorscheme base16-eighties
call vundle#end()

filetype plugin indent on

nnoremap <Leader>w :w<CR>
nmap <leader>q :q!<cr>
nmap <leader>l :noh<cr>

set termguicolors
set clipboard=unnamed
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000
set expandtab
set tabstop=4
set laststatus=4
set shiftwidth=4
set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines"
set number
set ignorecase
set hlsearch
set ruler
autocmd BufWritePre * :%s/\s\+$//e
set cursorline!
nmap <leader>y "+y
nmap <leader>p "+p
nmap gb :e#<CR>
nmap <leader>f :e!<CR>
set backspace=indent,eol,start
set mousehide
set cursorline!

nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>

set autoread
set autowrite
set history=50

let g:auto_ctags = 1
set breakindent
set nofoldenable
set foldmethod=indent
set foldlevel=99

set expandtab
set autoindent
set clipboard=unnamed
set splitright
set splitbelow
set ttyfast
set lazyredraw
set laststatus=2
set encoding=utf8

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Use deoplete.
" Autocomplete using deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp = 1
let g:deoplete#enable_yarp = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose |
let g:tern_request_timeout = 1
let g:tern#filetypes = ['js', 'jsx', 'vue']
"Go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
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
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

"Gutter
let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'

" Auto pair
let g:AutoPairsMultilineClose = 0
let g:indentLine_enabled = 0
" Tmux navigation
let g:tmux_navigator_no_mappings = 1

"Fzf
map <c-p> <ESC>:Files<CR>
map <c-o> <ESC>:Tags<CR>
map <c-h> <ESC>:History<CR>
map <silent> <leader>/ <ESC>:BLines<CR>
map <leader>ag <ESC>:Ag<space>
map <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
map <silent> <leader>mm <ESC>:Commands<CR>

"Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-w)

"Ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '‼️'
let g:ale_sign_warning = '⚠️'

" Closetag
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.vue'

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

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Setup for ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --smart-case --color=never --ignore-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"let g:LanguageClient_serverCommands = { 'php': ['~/.composer', 'php', 'vendor/felixfbecker/language-server/bin/php-language-server.php'] }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:PHP_outdentphpescape = 0
