" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
""" Disable <C-Z> - suspend vim
map <C-Z> <NOP>
map! <C-Z> <NOP>
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif

set wildmenu
set wildmode=longest:full
set wildignore=*/CVS/*
set textwidth=0 
set history=75          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

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
  autocmd FileType text setlocal textwidth=0

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

  set expandtab                 " vÃ¤lilyÃ¶ntejÃ¤ tab-merkin sijaan
  set tabstop=4                 " vÃ¤liÃ¶yÃ¶ntien mÃ¤Ã¤rÃ¤
  set softtabstop=4
  set shiftwidth=4              " ??

  set clipboard=unnamed
  scriptencoding utf-8

  let html_no_rendering = 1 " paskat underlinet ja boldaus yms pois
  let g:ragtag_global_maps = 1 
  let g:html_indent_inctags = "tbody"

  set foldmethod=indent
  set foldnestmax=10
  let perl_include_pod = 1
  let perl_extended_vars = 1
  map <S-Space> ^<Space>
  set textwidth=0
  
  map <F7> :execute "!. /etc/default/epages6 && $PERL /srv/epages/eproot/Cartridges/DE_EPAGES/Object/Scripts/delete.pl -storename Store %"
  map <F8> :execute "!. /etc/default/epages6 && $PERL /srv/epages/eproot/Cartridges/DE_EPAGES/Object/Scripts/import.pl -storename Store %"
  map <F9> :execute "!. /etc/default/epages6 && $PERL /srv/epages/eproot/Cartridges/DE_EPAGES/Trigger/Scripts/import.pl -storename Store %"
  map <F6> :execute "!. /etc/default/epages6 && $PERL -cw %"
  map <F5> :execute "! /etc/init.d/epages6 restart_perl"
  map <F4> :execute "! /etc/init.d/epages6 restart_perl && rm -rf /srv/epages/eproot/Shared/Static/*"

  set background=dark   " musta tausta
  set encoding=utf-8
  set fileencoding=utf-8
  
  "let g:badwolf_darkgutter = 1
  colorscheme railscasts
  set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:.
"  hi Normal   guibg=NONE ctermbg=NONE
"  hi NonText  guibg=NONE ctermbg=NONE
"  hi Tag      guibg=NONE ctermbg=NONE

" Open original file if current one is override
if !exists(":DiffOverride")
  command DiffOverride vnew `=substitute(expand("%:p"),"FI_.\\+\\\(DE_EPAGES.\\+\\\)","\\1","")` | windo diffthis
endif
