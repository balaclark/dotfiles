"" Basics
  let maplocalleader = ","
  let mapleader = "\<Space>"

  " Disable strange Vi defaults.
  set nocompatible

  " Turn on filetype plugins (:help filetype-plugin).
  filetype plugin indent on

  syntax enable
  set autoindent

  " Allow backspace in insert mode.
  set backspace=indent,eol,start

  " Disable octal format for number processing.
  set nrformats-=octal

  " Allow for mappings including `Esc`, while preserving
  " zero timeout after pressing it manually.
  set ttimeout
  set ttimeoutlen=100

  " Enable highlighted case-insensitive incremential search.
  set incsearch

  " Use `Ctrl-L` to clear the highlighting of :set hlsearch.
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

  " Always show window statuses, even if there's only one.
  set laststatus=2

  " Show the line and column number of the cursor position.
  set ruler

  " Show the size of block one selected in visual mode.
  set showcmd

  " Autocomplete commands using nice menu in place of window status.
  " Enable `Ctrl-N` and `Ctrl-P` to scroll through matches.
  set wildmenu

  " When 'wrap' is on, display last line even if it doesn't fit.
  set display+=lastline

  " Set default whitespace characters when using `:set list`
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

  " Delete comment character when joining commented lines
  if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
  endif

  " Search upwards for tags file instead only locally
  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif

  " Reload unchanged files automatically.
  set autoread

  " Support all kind of EOLs by default.
  set fileformats+=mac

  " Increase history size to 1000 items.
  set history=1000

  " Allow for up to 50 opened tabs on Vim start.
  set tabpagemax=50

  " Always save upper case variables to viminfo file.
  set viminfo^=!

  " Enable backup and undo files by default.
  let s:dir = has('win32') ? '$APPDATA/Vim' : isdirectory($HOME.'/Library') ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
  let &backupdir = expand(s:dir) . '/backup//'
  let &undodir = expand(s:dir) . '/undo//'
  set undofile

  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
  endif

  " Y yanks from the cursor to the end of line as expected. See :help Y.
  nnoremap Y y$

  " Automatically create directories for backup and undo files.
  if !isdirectory(expand(s:dir))
    call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
  end

  " Highlight line under cursor. It helps with navigation.
  set cursorline

  " Keep 8 lines above or below the cursor when scrolling.
  set scrolloff=8

  " Keep 15 columns next to the cursor when scrolling horizontally.
  set sidescroll=1
  set sidescrolloff=15

  " If opening buffer, search first in opened windows.
  set switchbuf=usetab

  " Hide buffers instead of asking if to save them.
  set hidden

  " Wrap lines by default
  set wrap linebreak
  set showbreak=" "

  " Allow easy navigation between wrapped lines.
  vmap j gj
  vmap k gk
  nmap j gj
  nmap k gk

  nnoremap <CR> G
  nnoremap <BS> gg

  " For autocompletion, complete as much as you can.
  set wildmode=longest,full

  " Show line numbers on the sidebar.
  set number

  " Disable any annoying beeps on errors.
  set noerrorbells
  set visualbell

  " Don't parse modelines (google "vim modeline vulnerability").
  set nomodeline

  " Do not fold by default. But if, do it up to 3 levels.
  set foldmethod=indent
  set foldnestmax=3
  set nofoldenable

  " Enable mouse for scrolling and window resizing.
  set mouse=a

  " Disable swap to prevent annoying messages.
  set noswapfile

  " Enable search highlighting.
  set hlsearch

  " Show mode in statusbar, not separately.
  set noshowmode

  " Ignore case when searching.
  set ignorecase

  " Don't ignore case when search has capital letter
  " (although also don't ignore case by default).
  set smartcase

  " Use dash as word separator.
  set iskeyword+=-

  " Auto center on matched string.
  noremap n nzz
  noremap N Nzz

  " Set window title by default.
  set title

  " Always focus on split window.
  set splitright
  set splitbelow

  " copy/paste to system clipboard
  set clipboard=unnamed
  vnoremap <silent> y y`]
  vnoremap <silent> p p`]
  nnoremap <silent> p p`]

  set colorcolumn=80,120

  nnoremap H ^
  nnoremap L $

  nnoremap <Leader>w :w<CR>
  " closes current buffer, but doesn't close the split that it is in
  nnoremap <Leader>q :bp\|bd #<CR>

  " buffer fun
  nnoremap gh :bp<CR>
  nnoremap gl :bn<CR>
  nnoremap <Leader>i :b

  " show invisible charactars
  set list

  " Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %

  " mor speed
  set lazyredraw
  set ttyfast

"" Saved Macros
  " select function
  let @c = 'vf{%'

"" Platform Specific
  if has("unix")
    let s:uname = system("uname -s")

    " OS X
    if s:uname == "Darwin\n"
      map <Leader>, :!gitup<CR><CR>
    endif

    " Linux
    if s:uname == "Linux"
      map <Leader>, :!meld<CR><CR>
    endif

  endif

"" Neovim
  if has('nvim')

    " Terminal Keymappings
    nnoremap <a-j> <c-w>j
    nnoremap <a-k> <c-w>k
    nnoremap <a-h> <c-w>h
    nnoremap <a-l> <c-w>l
    vnoremap <a-j> <c-\><c-n><c-w>j
    vnoremap <a-k> <c-\><c-n><c-w>k
    vnoremap <a-h> <c-\><c-n><c-w>h
    vnoremap <a-l> <c-\><c-n><c-w>l
    inoremap <a-j> <c-\><c-n><c-w>j
    inoremap <a-k> <c-\><c-n><c-w>k
    inoremap <a-h> <c-\><c-n><c-w>h
    inoremap <a-l> <c-\><c-n><c-w>l
    cnoremap <a-j> <c-\><c-n><c-w>j
    cnoremap <a-k> <c-\><c-n><c-w>k
    cnoremap <a-h> <c-\><c-n><c-w>h
    cnoremap <a-l> <c-\><c-n><c-w>l
    tnoremap <Leader><Esc> <c-\><c-n>
    tnoremap <a-j> <c-\><c-n><c-w>j
    tnoremap <a-k> <c-\><c-n><c-w>k
    tnoremap <a-h> <c-\><c-n><c-w>h
    tnoremap <a-l> <c-\><c-n><c-w>l
    au WinEnter *pid:* call feedkeys('i')
  endif

"" Plugins
  call plug#begin()

  " Language support
  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go'

  " Fuzzy file search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'

    map <c-x><c-k> <Plug>(fzf-complete-word)
    imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <Plug>(fzf-complete-line)

    nnoremap <silent> <C-  map <c-x><c-k> <Plug>(fzf-complete-word)
    imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <Plug>(fzf-complete-line)

    nnoremap <silent> <Leader><Enter> :Buffers<CR>p> :Files<CR>
    nnoremap <silent> <Leader><Enter> :Buffers<CR>

    " Use FZF to fuzzy find tags
    command! -bar Tags if !empty(tagfiles()) | call fzf#run({
    \   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
    \   'sink':   'tag',
    \ })
    nnoremap <leader>. :Tags<cr>
    nnoremap <Leader>o :FZF<CR>

  " Find in project
  Plug 'rking/ag.vim'

    nnoremap \ :Ag!<SPACE>

  " Better nodejs support
  Plug 'moll/vim-node', { 'for': 'javascript' }

  " File navigator
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'

    let NERDTreeShowHidden=1
    silent! nmap <Tab><Tab> :NERDTreeToggle<CR>
    silent! nmap <Leader>f :NERDTreeFind<CR>

  " Comment code
  Plug 'scrooloose/nerdcommenter'

  " wildignore gitignored files
  Plug 'vim-scripts/gitignore'

  " Strip whitespace etc.
  Plug 'editorconfig/editorconfig-vim'

  " Better PHP syntax
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }

  " Linting
  if has('nvim')
    Plug 'neomake/neomake'

      " make neomake warnings look more like syntastic ones
      let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'ErrorMsg',
      \ }
      hi MyWarningMsg ctermbg=3 ctermfg=0
      let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'MyWarningMsg',
      \ }

      " lint as often as we can
      "autocmd BufWinEnter,InsertLeave,TextChanged,BufReadPre,FileReadPre * update | Neomake
      autocmd! BufEnter,BufWritePost * Neomake

      let g:neomake_javascript_enabled_makers = ['standard']
      let g:neomake_html_enabled_makers = ['htmlhint']

    Plug 'balaclark/vim-switchblade'
  endif

  " Autocomplete
  if has('nvim')
    " https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
    Plug 'Shougo/deoplete.nvim'
    "Plug 'zchee/deoplete-go'
    "Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

      let g:deoplete#enable_at_startup = 1
      let g:deoplete#file#enable_buffer_path = 1
      if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
      endif
      " let g:deoplete#disable_auto_complete = 1
      autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

      " omnifuncs
      augroup omnifuncs
        autocmd!
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
      augroup end

      " Tab autocomplete
      inoremap <silent><expr> <Leader><Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
  endif

  " JS code intell
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }

    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript nnoremap <silent> <buffer> tf :TernDef<CR>
    autocmd FileType javascript nnoremap <silent> <buffer> tr :TernRefs<CR>
    autocmd FileType javascript nnoremap <silent> <buffer> tR :TernRename<CR>
    autocmd FileType javascript setlocal omnifunc=tern#Complete

  " Git integration
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

    nnoremap <Leader>b :Gblame<CR>

  " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'

  " Move lines
  Plug 'matze/vim-move'

  let g:move_key_modifier = 'C'

  " Show buffers as tabs
  Plug 'ap/vim-buftabline'

  let g:buftabline_numbers = 1

  " Copy current file path
  Plug 'bag-man/copypath.vim'

    nnoremap cp :CopyRelativePath<CR>

  " :e file:108
  Plug 'kopischke/vim-fetch'

  " Faster keyboard nav within files
  Plug 'easymotion/vim-easymotion'

    "let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1

    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)

    " search whole file
    nmap s <Plug>(easymotion-w)

  " cd to the project root
  Plug 'airblade/vim-rooter'

  " colorscheme
  Plug 'NLKNguyen/papercolor-theme'

  " Really nice prompt
  Plug 'itchyny/lightline.vim'

  " Add '.' powers to plugins
  Plug 'tpope/vim-repeat'

  " Edit surrounding quotes, etc.
  Plug 'tpope/vim-surround'

    let g:lightline = {
        \ 'colorscheme': 'PaperColor',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component': {
        \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
        \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
      \ }

  " Close all other buffers
  Plug 'schickling/vim-bufonly'

    nnoremap go :BufOnly<CR>

  call plug#end()

"" Set colorscheme
  set background=dark
  colorscheme PaperColor

