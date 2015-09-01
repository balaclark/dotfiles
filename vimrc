let mapleader = "\<Space>"
let maplocalleader = ","

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" auto generate ctags
" Plug 'grassdog/tagman.vim'

" Really nice prompt
Plug 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Press v over and over again to expand selection
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Awesome autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" Lightning fast :Ag searcher
Plug 'rking/ag.vim'

" Expand / wrap hashes etc.
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

Plug 'moll/vim-node', { 'for': 'javascript' }

" Navitate freely between tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" File navigator
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
silent! nmap <F9> :NERDTreeToggle<CR>
silent! nmap <F10> :NERDTreeFind<CR>

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
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
"let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_php_checkers = ['php']

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JSON mode
Plug 'elzr/vim-json', { 'for': 'json' }

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Start page
Plug 'mhinz/vim-startify'
let g:startify_custom_header = map(split(system('echo Hare Krishna! | cowsay'), '\n'), '" ". v:val') + ['','']

Plug 'shime/vim-livedown', { 'for': 'markdown' }

Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

nmap <Leader><Leader> V

nnoremap <Leader>o :FZF<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :Sayonara<CR>
" nnoremap <Leader>c :Sayonara!<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" Tab fun
let g:lasttab = 1
nnoremap <Leader><Leader>t :tabnew<CR>
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


cmap w!! w !sudo tree > dev/null %

" Remove trailing whitespaces
" nnoremap <silent> <Leader><BS> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

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

" turn off markdown folding. literally what.
let g:vim_markdown_folding_disabled=1

"silent! colorscheme wombat256mod
silent! colorscheme seoul256

command! -bar Tags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ })
