let maplocalleader = ","
let mapleader = "\<Space>"

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

" Awesome Ctrl+P
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

" Regular Ctrl+P for guivims
Plug 'ctrlpvim/ctrlp.vim'

if has("gui_running")
  nnoremap <Leader>o :CtrlP<CR>
else 
  nnoremap <Leader>o :FZF<CR>
endif

" Really nice prompt
Plug 'itchyny/lightline.vim'

  let g:lightline = {
      \ 'colorscheme': 'seoul256',
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

" Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'

  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)

" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

  nnoremap \ :Ag!<SPACE>

" ag the current word
Plug 'Chun-Yang/vim-action-ag'

  let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'
  " use * to search current word in normal mode
  nmap * <Plug>AgActionWord
  " use * to search selected text in visual mode
  vmap * <Plug>AgActionVisual

Plug 'moll/vim-node', { 'for': 'javascript' }

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" File navigator
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

  let NERDTreeShowHidden=1
  silent! nmap <Tab><Tab> :NERDTreeToggle<CR>
  silent! nmap <Leader>f :NERDTreeFind<CR>

" File operations
Plug 'tpope/vim-eunuch'

" Comment code
Plug 'scrooloose/nerdcommenter'

" Better search tools
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/SmartCase'
Plug 'vim-scripts/gitignore'

" Colorschemes
Plug 'junegunn/seoul256.vim'

  set background=dark
  let g:seoul256_background = 234
  set t_ut= " makes this work in tmux

" Strip whitespace etc.
Plug 'editorconfig/editorconfig-vim'

" Distraction free mode
Plug 'junegunn/goyo.vim'

" Better PHP syntax
Plug 'StanAngeloff/php.vim'

" Autocomplete with tab
Plug 'ervandew/supertab'

" Linting
Plug 'scrooloose/syntastic'

  let g:syntastic_javascript_checkers = ['standard']
  let g:syntastic_php_checkers = ['php']
  let g:syntastic_jade_checkers = ['jade_lint']
  let g:syntastic_aggregate_errors = 1

Plug 'benjaminparnell/vim-switchblade'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

  nnoremap <Leader>b :Gblame<CR>

" JSON mode
Plug 'elzr/vim-json', { 'for': 'json' }

" Multiple cursors
"Plug 'terryma/vim-multiple-cursors'

" Start page
Plug 'mhinz/vim-startify'

  let g:startify_custom_header = map(split(system('echo Hare Krishna! | cowsay'), '\n'), '" ". v:val') + ['','']

" Markdown preview
Plug 'shime/vim-livedown', { 'for': 'markdown' }

" Show indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Move lines
Plug 'matze/vim-move'

  let g:move_key_modifier = 'C'

" Swap panes
Plug 'wesQ3/vim-windowswap'

" Show buffers as tabs
Plug 'ap/vim-buftabline'

" Go to file in terminal / finder
Plug 'justinmk/vim-gtfo'

" Copy current file path
Plug 'bag-man/copypath.vim'

  nnoremap cp :CopyRelativePath<CR>

" Close all buffers but the current one
Plug 'vim-scripts/BufOnly.vim'
nnoremap go :BufOnly<CR>

" Toggle booleans and dates with ctrl+a/x
Plug 'can3p/incbool.vim'
Plug 'tpope/vim-speeddating'

" Color hex codes and color names
Plug 'chrisbra/Colorizer'

  let g:colorizer_auto_filetype='css,html,stylus,jade,less,sass'

" :e file:108
Plug 'kopischke/vim-fetch'

" Edit your surroundings (e.g. change the surrounding double quotes to single)
Plug 'tpope/vim-surround'

" Add repeat support to more stuff
Plug 'tpope/vim-repeat'

" Detect spaces / tabs
Plug 'tpope/vim-sleuth'

" Autoload changes made outside vim (e.g. git)
Plug 'tmux-plugins/vim-tmux-focus-events'

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

  " replace native / with easymotion search
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)

" Manage TODOs in code
Plug 'vim-scripts/TaskList.vim'

  nmap <Leader>T <Plug>TaskList

" CamelCase word motions
Plug 'bkad/CamelCaseMotion'

  map <silent> w <Plug>CamelCaseMotion_w
  map <silent> b <Plug>CamelCaseMotion_b
  map <silent> e <Plug>CamelCaseMotion_e
  map <silent> ge <Plug>CamelCaseMotion_ge
  sunmap w
  sunmap b
  sunmap e
  sunmap ge

" Better session management
Plug 'tpope/vim-obsession'

call plug#end()

set autoread

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
" closes current buffer, but doesn't close the split that it is in
nnoremap <Leader>q :bp\|bd #<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" easy way to copy the current mocha test into the next pending one
nnoremap <silent> <Plug>TransposeCharacters {jf,vf{%y}jt)p
\:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cf <Plug>TransposeCharacters

" Tab fun
let g:lasttab = 1
nnoremap <Leader><Leader>t :tabnew<CR>
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
nmap tn :tabn<CR>
nmap tp :tabp<CR>
nmap tq :tabc<CR>

" Buffer fun

" Move to the previous buffer
nnoremap gh :bp<CR>
" Move to the next buffer
nnoremap gl :bn<CR>
" List all possible buffers
nnoremap gL :ls<CR>
" List all possible buffers and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

cmap w!! w !sudo tree > dev/null %

" Support resizing in tmux
if exists('$TMUX')
  set ttymouse=xterm2
endif

nnoremap H 0-
nnoremap L $

set encoding=utf-8
set colorcolumn=80,120
set clipboard=unnamed

" show invisibles
set list

" turn on ruler
set noruler
set nocursorline

" For more reliable indenting and performance
set foldmethod=indent
set fillchars="fold: "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" ctrl+c to toggle highlight
nnoremap <c-c> :noh<CR>

" turn off markdown folding. literally what.
let g:vim_markdown_folding_disabled=1

"silent! colorscheme wombat256mod
silent! colorscheme seoul256

" auto complete file paths
"inoremap <F10> <C-X><C-F>

" platform specific configs
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

" mor speed
set lazyredraw
set ttyfast

" macvim / gvim options

" no scrollbars
set guioptions-=r
set guioptions-=L

" font
set guifont=Inconsolata:h15
