" Liam Cain
" .vimrc

syntax on
set nocompatible

"Required for fish and vim to play together
if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

filetype plugin indent off
filetype indent off

" Basics {{{ "
set nohlsearch
set incsearch
set modelines=0
set expandtab
set tabstop=4
set history=1000
set clipboard=unnamed
set wrap
set linebreak
set shiftwidth=4
set encoding=utf-8
set scrolloff=3
set cpoptions+=cpo-$
set autoindent
set noshowmode
set showcmd
set hidden
set wildmenu
set cursorline
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set ttimeout
set ttimeoutlen=100
set relativenumber 
set number
let mapleader = " "
let localleader="\\"
set ignorecase
set smartcase
set smarttab
set formatoptions+=j
set formatoptions-=cro
set foldmethod=marker
set foldcolumn=0
set wildignore+=*/tmp/*,*.so,*.pyc,*pdf,*docx,*.swp,*.zip,*.indd,*.psd,*mp3,*.png,*jpg
set wildignore+=$HOME./Library/*
let g:netrw_list_hide =  '\.png$,\.jpg$,\.png$'
set virtualedit=block
" }}} Basics "
" Extras {{{ "
" Resize splits when the window is resized
au VimResized * :wincmd =
set splitbelow
set splitright
set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add
autocmd BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md set filetype=pandoc
au BufEnter * silent! lcd %:p:h
" }}} Extras "
" Terminal {{{1 "
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#268BD2'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#268BD2'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
" }}} "
" Appearance {{{ "
set guioptions-=r
set guifont=Fira\ Mono:h14
set linespace=2
colorscheme iceberg
" colorscheme gotham
" }}} Appearance "
" Backups {{{1 "
set undofile
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
" 1}}} "
" Plugins {{{1 "
call plug#begin()
" TPope {{{2 "
Plug 'tpope/vim-fugitive'        " for git in status bar
Plug 'tpope/vim-surround'        " add motions to add/change/remove quotes and braces
Plug 'tpope/vim-commentary'      " gcc
Plug 'tpope/vim-unimpaired'      " add [ movements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'         " makes netrw a lot better
" 1}}} "
Plug 'SirVer/ultisnips'          " SNIPPETS
Plug 'honza/vim-snippets'        " the snippets themselves
Plug 'osyo-manga/vim-over'       " Visual find/replace %s
Plug 'shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'scrooloose/syntastic'      " error highlighting
" Plug 'mattn/emmet-vim'         " for html/css
Plug 'ajh17/VimCompletesMe'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'         " For distraction-free writing
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'   " Press enter in visual mode...Magic
" Plug 'sheerun/vim-polyglot'      " language pack
Plug 'kchmck/vim-coffee-script'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'simnalamburt/vim-mundo'
Plug 'airblade/vim-gitgutter'    " Adds the symbols to the sidebar for git stuff
" Plug 'suan/vim-instant-markdown' " Preview .md in browser
Plug 'troydm/zoomwintab.vim'     " Press ` to toggle zoom
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'KabbAmine/vCoolor.vim'
Plug 'chrisbra/Colorizer'
Plug 'reedes/vim-colors-pencil'
call plug#end()
" 2}}} "
" Mappings {{{ "
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk

" Better home/end keys - synonymous to normal movement
nnoremap H ^
nnoremap L $
nnoremap ; :
nnoremap : ;
nnoremap Y y$
inoremap jk <ESC>
inoremap kj <ESC>
nnoremap Q @q

" Uses 'very magic' regex search
nnoremap / /\v
vnoremap / /\v
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
"
" smarter 'Comment', 'String' paste
imap <D-V> ^O"+p

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <Space><space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <space><space> zf<F37>

" for when you forget to sudo
cmap w!! w !sudo tee >/dev/null %

" better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-h> <C-w>h
vnoremap <C-j> <C-w>j
vnoremap <C-k> <C-w>k
vnoremap <C-l> <C-w>l
if has('nvim')
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-l> <c-\><c-n><c-w>l
  au WinEnter *pid:* call feedkeys('i')

  nnoremap <leader>t :term fish<CR>
  tnoremap jk <c-\><c-n> 
  tnoremap kj <c-\><c-n> 
endif
" Mappings}}} "
" Plugins Settings/Mappings {{{ "
" Unite {{{2 "
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
endif
function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()
let g:unite_prompt='» '
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom#profile('default', 'context', {
      \ 'direction': 'top'
      \ })
nnoremap <leader>e :<C-u>Unite -no-split -silent -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>r :<C-u>Unite -no-split -silent -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -silent -buffer-name=yank    history/yank<cr>
nnoremap <leader>f :<C-u>Unite -no-split -silent -buffer-name=buffer  buffer<cr>
nnoremap <Leader>/ :<C-u>Unite -no-split -silent -buffer-name=ag grep:.<CR>
" }}} Unite "
" Lightline {{{2 "
let g:lightline = {
      \ 'colorscheme': 'refresh',
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode'
      \ }
\ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return '' "winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}} "
" Easy-Align {{{ "
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = []
" }}} Easy-Align "
" Goyo {{{ "
function! s:goyo_enter()
  set linespace=5
  set nocursorline
  colorscheme pencil
  Limelight
endfunction
function! s:goyo_leave()
  set linespace=2
  set cursorline
  colorscheme iceberg
  Limelight!
endfunction
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()
nnoremap <leader>g :Goyo<CR>
" }}} Goyo "
" Syntastic {{{ "
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" }}} Syntastic "
" UltiSnips {{{ "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsEnableSnipMate=0
nnoremap <localleader>e :UltiSnipsEdit<CR>
" }}} UltiSnips "
" Vim-Session {{{2 "
let g:session_autosave='yes'

" Misc Plugins {{{2 "
nnoremap <Leader>u :GundoToggle<CR>
nnoremap ``> :ZoomWinTabToggle<CR>
let g:tex_flavor='latex'
let g:pencil_terminal_italics = 1
let g:pandoc#folding#fdc = 0
let g:vcoolor_disable_mappings = 1
let g:colorizer_auto_filetype='css,html,vim'
nnoremap <silent><Leader>c :VCoolor<CR>
" }}} Misc Plugins "
" }}} Plugins Settings/Mappings "
