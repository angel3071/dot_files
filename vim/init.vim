" Vim Plug {{{
call plug#begin('~/.local/share/nvim/plugged')
" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
" Utitlities
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
" Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
" Plug 'ludovicchabant/vim-gutentags'
" Latex
Plug 'lervag/vimtex'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Python
Plug 'zchee/deoplete-jedi'
" JavaScript
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs'
" Plug 'moll/vim-node'
" TypeScript
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/deoplete-typescript'
call plug#end()
" }}}
" Colors {{{
colorscheme codedark
hi Visual term=reverse cterm=reverse guibg=Grey
let g:airline_theme = 'codedark'
set colorcolumn=80
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set textwidth=80
set modelines=1
" filetype indent on
" filetype plugin on
set autoindent
set grepprg=grep\ -nH\ $*
if executable('ag')
  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag\ --vimgrep\ $* 
  set grepformat=%f:%l:%c:%m
endif
" }}}
" xclip {{{
smap <F7> :w !xclip<CR><CR>
vmap <F7> "+y
map <S-F7> :r!xclip -o<CR>
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set ruler
"set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}
" Git commnets {{{
autocmd FileType gitcommit setlocal spell spelllang=es_mx
autocmd FileType gitcommit set spell
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set smartcase
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=99    " start with fold level of 1
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :bn<CR>
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>d :Make! 
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>g :call RunGoFile()<CR>
nnoremap <leader>h :A<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>q :close<CR>
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>x :call system('xclip', @0)<CR>
map <leader>ss :setlocal spell!<cr>
vnoremap <leader>s :sort<CR>
vnoremap <leader>y "+y
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>
" }}}
" NERDTree {{{
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" }}}
" Powerline {{{
"set encoding=utf-8
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h15
"let g:Powerline_symbols = "fancy"
"set laststatus=2
"set t_Co=256
"set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
" }}}
" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
" }}}
" neomake {{{
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['jscs']
" }}}
" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
" }}}
" Vimtex {{{
let g:tex_flavor = "latex"
let g:vimtex_fold_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
" }}}
" Deoplete {{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#option('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
" Old config
" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif 
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
" let g:tsuquyomi_javascript_support = 1
" " let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " omnifuncs
" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=tsuquyomi#complete "javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" augroup end
" " tern
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif
" }}}
" Neosnippet {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_completed_snippet = 1

"" SuperTab like snippets behavior.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <expr><TAB>
"" \ pumvisible() ? "\<C-n>" :
"" \ neosnippet#expandable_or_jumpable() ?
"" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif
" }}}
" vim-notes {{{
let g:notes_directories = ['~/Notes']
" }}}
"" Tmux {{{
if exists('$TMUX') " allows cursor change in tmux mode
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"" }}}
"" Another {{{
xmap ga <Plug>(EasyAlign)   " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)   " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap <C-p> :FZF<CR>
" }}}
" Backups {{{

set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup
" }}}

" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" A super cool function just to format some shitty jsons
function! FormatJSON()
    %!python -m json.tool
endfunc

" }}}
" vim:foldmethod=marker:foldlevel=0
