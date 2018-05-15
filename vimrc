"""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""Settings"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn
set colorcolumn=100
set nowrap
set clipboard=unnamed
set expandtab
set number
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set splitright

set fillchars=stl:-,stlnc:-,vert:│
set wildmenu
set wildignore+=node_modules/*
set wildmode=longest:list,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set relativenumber
"set backspace=indent,eol,start	 " more powerful backspacing
set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels
set termguicolors " enable true colors support (plug ayu-vim)
set autoindent
set hlsearch
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set laststatus=2 " Powerline

set rtp+=/usr/local/bin/fzf

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on
syntax enable
"set syntax=javaScript

" folding
"set foldmethod=indent
"set foldlevelstart=1
"let javaScript_fold=1
"set foldnestmax=2
"set nofoldenable
"set foldlevel=2

let NERDTreeShowHidden=1

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP<CR>'
let g:ctrlp_max_files=20000 
let g:ctrlp_custom_ignore='.git$|node_modules$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"
map <c-p> :CtrlP<CR>

set background=dark
colorscheme solarized8_high

"set background=dark
"colorscheme palenight

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

augroup vimrc
   autocmd!
   autocmd ColorScheme * highlight VertSplit term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE guibg=bg guifg=grey | highlight StatusLine term=NONE cterm=NONE gui=NONE guibg=bg guifg=grey | highlight StatusLineNC term=NONE cterm=NONE gui=NONE guibg=bg guifg=grey 
augroup END

"""""""""""""""Macros""""""""""""""
map <C-e> :%s/\s\+$//e <CR> " kill all bad whitespace in the file
map <S-f> :Files <CR>
map <C-q> :q <CR> " Quit file
map <C-s> :w<CR> :echo "Saved" <CR> " Save file
map <C-h> <S-^>
map <C-l> <S-$>
map <C-]> :OnlineThesaurusCurrentWord <CR>
map <C-n> :let @+ = expand("%") <CR> " copy current relative file path

imap <C-s> <Esc> :w<CR> :echo "Saved" <CR> " Save file
imap <C-@> <C-Space>
" imap <C-m> <CR><Esc>O

"vmap <C-c> y:call system("pbcopy", getreg("\""))<CR> " Copy
"vnoremap <C-Space> <ESC>

"nmap <C-V> :call setreg("\"",system("pbpaste"))<CR>p " Paste

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Constants """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
  set undodir=~/.vim/tmp 
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
