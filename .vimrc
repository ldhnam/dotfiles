"========================================================
" INSTALL PLUGINS
"========================================================
call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    Plug 'arcticicestudio/nord-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'sheerun/vim-polyglot'
    Plug 'easymotion/vim-easymotion'
    Plug 'jiangmiao/auto-pairs'
    Plug 'w0rp/ale'
    Plug 'morhetz/gruvbox'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'mattn/emmet-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc-denite'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'preservim/nerdcommenter'
    Plug 'alvan/vim-closetag'
    " Display source outline
    Plug 'liuchengxu/vista.vim'
call plug#end()

"========================================================
" EDITOR CONFIGS
"========================================================
syntax on
filetype on
filetype indent on
filetype plugin on
set backspace=2   " Backspace deletes like most programs in insert mode
set noswapfile
set hlsearch
set ai
set ruler
set linespace=1
set breakindent
set nofoldenable
set splitright
set splitbelow
set lazyredraw
set laststatus=2
set encoding=utf8
set background=dark
set autoindent
set smartindent
set number
set nosmd
set showcmd
set termguicolors
set autoread

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Copy to clipboard
set clipboard=unnamed

au CursorHold * checktime

" Some custom style
highlight EasyMotionTargetDefault guifg=#ffb400

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

"Map
let mapleader = "\<Space>"
inoremap jj <ESC>
inoremap jk <Esc>
"nnoremap <Leader>\ :vsplit<CR>
"nnoremap <Leader>/ :split<CR>

colorscheme gruvbox

"========================================================
" MAPPING FZF
"========================================================
map <silent> <leader>/ <ESC>:BLines<CR>
map <leader>ag <ESC>:Ag<space>
let g:fzf_preview_source=" --preview='bat {}'"
map <c-p> <ESC>:call fzf#vim#files('.', {'options': g:fzf_preview_source})<CR>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
nnoremap <C-k> /<C-R><C-W><CR>
nnoremap K :Ag <C-R><C-W><CR>
nnoremap \ :Ag<SPACE>

"========================================================
"" MAPPING NERDTree
"========================================================
map <C-e> :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'

"" Map key
" close buffer
nmap qq :bd<cr>

"Quit all
nmap qa :qa<cr>

" Fix iterm display
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Vista.vim config
autocmd User CocStatusChange,CocDiagnosticChange,BufWritePost,TextChanged,TextChangedI call lightline#update()
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'cocstatus' ], [ 'filename', 'nearmethod' ] ],
      \   'right': [ [ 'icongitbranch', 'percent', 'lineinfo', 'filetype' ] ]
      \ },
      \ 'component': { 'lineinfo': 'ÓÇ° %3l:%-2v' },
      \ 'component_function': {
      \   'icongitbranch': 'DrawGitBranchInfo',
      \   'iconline': 'DrawLineInfo',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \   'nearmethod': 'NearestMethodOrFunction'
      \ },
      \ }

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{StatusDiagnostic()}

function! NearestMethodOrFunction() abort
  return  "\u0192 " . get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = parent . '/' . s
    elseif i == 1
      let name = s
    else
      let name = parent . '/' . strpart(s, 0, 10)
    endif
    let i += 1
  endfor
  return name
endfunction

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? "ÓÇ† " . branch : ""
endfunction

" Custom icon for coc.nvim statusline
let g:coc_status_error_sign="ÔÜà "
let g:coc_status_warning_sign="ÔÅ± "

function! DescribeFace(count) abort
  if a:count
    let name = get(FaceNames(), a:count-1, '')
    if name !=# ''
      return 'syntax list '.name
    endif
  else
    echo join(FaceNames(), ' ')
  endif
  return ''
endfunction

"========================================================
" CONFIG COC.nvim
"========================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2


" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use L to highlight the symbol under the cursor
nnoremap <silent> L :call CocActionAsync('highlight')<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nnoremap <leader>rn <Plug>(coc-rename)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    NERDTree
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

let NERDTreeShowHidden=1

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

set showtabline=2

"Setup for Go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'go': ['gopls', 'goimports'],
\}

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
noremap <C-D> :bdelete<CR>

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Some custom style
highlight EasyMotionTargetDefault guifg=#ffb400

"========================================================
" MAPPING EASYMOTION
"========================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" make emmet behave well with JSX in JS and TS files
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

" Prettier
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
let g:jsx_ext_required = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
set conceallevel=1

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let g:closetag_filenames = '*.html,*.js,*.jsx,*.vue'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx'
