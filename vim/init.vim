" Vim Plug {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'valloric/youcompleteme'
Plug 'sbdchd/neoformat'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
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
"set autoindent
set grepprg=grep\ -nH\ $*
if executable('ag')
  " Use ag over grep
  " set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag\ --vimgrep\ $* 
  set grepformat=%f:%l:%c:%m
endif
let g:tex_flavor = "latex"
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
"set incsearch           " search as characters are entered
"set hlsearch            " highlight all matches
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
nnoremap <leader>a :Ag 
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
nnoremap <leader>x :call system('xclip', @0)<CR>
map <leader>ss :setlocal spell!<cr>
vnoremap <leader>s :sort<CR>
vnoremap <leader>y "+y
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>
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
" }}}
" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
" }}}
" Vimtex {{{
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
" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif 
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
" }}}
" Neosnippet {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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
