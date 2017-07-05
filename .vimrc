set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set title           " show title in console title bar
set number          " show line numbers
set ttyfast         " smoother changes
syntax on           " syntax highlighing
set backspace=indent,eol,start  " backspace for dummies
set backspace=2
set nowrap                      " wrap long lines
set showmatch		" highlight matching brace
set comments=sl:/*,mb:\ *,elx:\ */ " Highlight intelligent comments
set ls=2

set shiftwidth=4    " numbers of spaces to (auto)indent
set smartindent
set textwidth=80
set wrapmargin=80
set cindent
set ai
set ignorecase
set tabstop=4		"set the tabsize to 4
set expandtab      "spaces for tabs
"Enable mouse movements"
set mouse=a

filetype on

set list
set listchars=tab:\|\ 
hi Search guibg=LightBlue
hi Search cterm=NONE ctermfg=lightgreen ctermbg=blue

filetype on
"source cscope_maps.vim

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>
imap <F2> pr_err("------------> %s %d <------------\n", __func__, __LINE__);
imap <F3> dprintf(CRITICAL, "------------> %s %d <------------\n", __func__, __LINE__);
imap <F5> LOG_INFO("SAA:%s:%d  \n", __func__, __LINE__); 
" WARNINGS in red if over 80 characters long. 
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>79v.\+/

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
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set list
set listchars=tab:\|\ 

"Key remaps
"nnoremap <silent> <C-Right> <c-w>l
"nnoremap <silent> <C-Left> <c-w>h
"nnoremap <silent> <C-Up> <c-w>k
"nnoremap <silent> <C-Down> <c-w>j
map <C-J> <C-W>Up<15C-W>_
map <C-K> <C-W>k<15C-W>



set nocompatible
set wildmenu "visual autocomplete for command menu

