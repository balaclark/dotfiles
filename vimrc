let mapleader = "\<Space>"
let maplocalleader = ","

call plug#begin()

Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" auto generate ctags
" Plug 'grassdog/tagman.vim'

" auto complete as you type
Plug 'Shougo/neocomplete.vim'

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

"Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

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
let NERDTreeShowHidden=1
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
let g:syntastic_jade_checkers = ['jade_lint']

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
nnoremap <Leader>b :Gblame<CR>

" JSON mode
Plug 'elzr/vim-json', { 'for': 'json' }

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

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

" Vim sessions
Plug 'tpope/vim-obsession'

" Toggle booleans and dates with ctrl+a/x
Plug 'can3p/incbool.vim'
Plug 'tpope/vim-speeddating'

" Color hex codes and color names
Plug 'chrisbra/Colorizer'
let g:colorizer_auto_filetype='css,html,stylus,jade,less,sass'

" :e file:108
Plug 'bogado/file-line'

" Edit your surroundings (e.g. change the surrounding double quotes to single)
Plug 'tpope/vim-surround'

" Add repeat support to more stuff
Plug 'tpope/vim-repeat'

" File explorer
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimfiler.vim'

call plug#end()

nmap <Leader><Leader> V

nnoremap <Leader>o :FZF<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
" closes current buffer, but doesn't close the split that it is in
nnoremap <Leader>q :bp\|bd #<CR>
"nnoremap <Leader>q :Sayonara<CR>
" nnoremap <Leader>c :Sayonara!<CR>
nnoremap <Leader>s :wq<CR>
nnoremap <Leader>v V
nnoremap <Leader>g gf

" easy way to copy the current mocha test into the next pending one
nnoremap <silent> <Plug>TransposeCharacters {jt,lv$%y}jt)pj^
\:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cf <Plug>TransposeCharacters

" Tab fun
let g:lasttab = 1
nnoremap <Leader><Leader>t :tabnew<CR>
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Buffer fun

" Move to the previous buffer
nnoremap gp :bp<CR>
" Move to the next buffer
nnoremap gn :bn<CR>
" List all possible buffers
nnoremap gl :ls<CR>
" List all possible buffers and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" ctrl+c to toggle highlight.
"let hlstate=0
"nnoremap <c-c> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
nnoremap <c-c> :noh<CR>

" turn off markdown folding. literally what.
let g:vim_markdown_folding_disabled=1

"silent! colorscheme wombat256mod
silent! colorscheme seoul256

command! -bar Tags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ })

" makes ctrl+x ctrl+f work as expected, even in project subfolders
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" auto complete file paths
inoremap <F10> <C-X><C-F>

