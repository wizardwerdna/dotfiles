" Vimscript file settings ---------------------- {{{

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

filetype plugin on
au BufRead,BufNewFile *.ts setlocal filetype=typescript
set rtp+=/usr/local/lib/node_modules/typescript-tools/ftplugin/typescript_tss.vim
" Vundle settings -------------------------------- {{{
" set rtp+=~/.vim/bundle/Vundle.vim/
" filetype off                   " required!
" call vundle#begin()
" Plugin 'gmarik/vundle.vim'

" Plugin 'scrooloose/nerdtree'
" Plugin 'vim-scripts/textutil.vim'
call plug#begin('~/.vim/plugged')

Plug 'kannokanno/previm'
Plug 'icholy/typescript-tools'
Plug 'leafgarland/typescript-vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'blockle.vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlp.vim'
Plug 'EasyMotion'
Plug 'FuzzyFinder'
Plug 'Gist.vim'
Plug 'godlygeek/tabular'
Plug 'IndexedSearch'
Plug 'Jasmine-snippets-for-snipMate'
Plug 'jiangmiao/auto-pairs'
Plug 'jQuery'
Plug 'L9'
Plug 'lambdalisue/shareboard.vim'
Plug 'lfilho/cosco.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'othree/html5-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-tmux'
Plug 'rizzatti/dash.vim'
Plug 'rizzatti/funcoo.vim'
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'rking/ag.vim'
Plug 'StanAngeloff/php.vim'
Plug 'Quramy/tsuquyomi'
"  Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'sickill/vim-pasta'
Plug 'skalnik/vim-vroom'
"Plug 'suan/vim-instant-markdown'
Plug 'scrooloose/syntastic'
"Plug 'Syntastic'
Plug 'Shougo/vimproc.vim'
Plug 'timcharper/textile.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'vimux'
Plug 'vim-scripts/vimwiki'
Plug 'vividchalk.vim'
Plug 'yearofmoo/Vim-Darkmate'
Plug 'zirrostig/vim-schlepp'

call plug#end()
" call vundle#end()            " required
" filetype plugin indent on    " required

"}}}

syntax on
filetype plugin indent on     " required!

" Vimsettings -------------------------------- {{{

set autoread
set backspace=indent,eol,start
set backup              " keep a backup file
set backupdir=~/.vim/backups
set clipboard=unnamed
set completeopt=menu,menuone,preview
set expandtab
set foldlevelstart=99
set foldmethod=syntax
set helpheight=1000
set history=100         " keep 50 lines of command line history
set hlsearch
set incsearch           " do incremental searching
set laststatus=2
set listchars=tab:>-,trail:-
set nocompatible
set nopaste
set number
set printfont=Courier:h11
set printoptions=paper:letter,left:10pc,right:5pc,top:5pc,bottom:5pc,header:2,syntax:y,duplex:off
set ruler               " show the cursor position all the time
set runtimepath^=~/.vim/bundle/ctrlp.vim
set shiftwidth=2
set splitright
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%{fugitive#statusline()} "git status info"

set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset
set tabstop=2
set timeout timeoutlen=3000 ttimeoutlen=50 "Command-T hack" 
set wildmode=longest,list:longest
" Order of the following is significant.  Must set winheight to 5 first
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
setlocal numberwidth=3

" backupts and swapfiles ----------{{{
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}

if version >= 703 
   set conceallevel=0 
   autocmd FileType * setlocal conceallevel=0 
endif
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
if has("gui_running")
  set lines=80 
  set columns=120 
  set number
endif
if has("gui_macvim")
  " write on pretty much any event (including :q) 
  set autowriteall
  set tabpagemax=100
  set guifont=Monofur:h20
endif
" }}}

" Vim lettings --------------------------------- {{{
let &colorcolumn=join(range(81,81),",")

let g:previm_open_cmd = "say foomio; open -a 'Google Chrome'"
let g:previm_show_header = 0

let g:typescript_compiler_options = '-sourcemap'

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:acp_ignorecaseOption = 0

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

let g:instant_markdown_autostart = 0

let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_auto_select = 1

let g:rails_menu=2

let g:shareboard_command = "pandoc --webtex -sS -t html --highlight-style=espresso --toc -H ~/.pandoc/buttondown.html"

let g:SuperTabCrClosePreview = 1
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

let g:surround_40 = "(\r)"
let g:surround_60 = "<\r>"
let g:surround_91 = "[\r]"

let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_html_checkers = [] 
"['tidy', 'w3']"
let g:syntastic_sass_checkers = []
let g:syntastic_scss_checkers = []
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
" }}}

" Vim abbreviations --------------------------- {{{
ab fuction function
" }}}

" Vim mappings -------------------------------- {{{

vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight

xnoremap s <Plug>VSurround
noremap <leader>X c$_extracted_$();<cr>function $_extracted_$(){<cr><cr>};<esc>kVpgv>kV$%
noremap <leader>z cfunction $_extracted_$(){<cr><cr>};<esc>o$_extracted_$();<esc>kkVpgv>kV$%
noremap <leader>k :CoffeeCompile vert watch<cr>

nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>
" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

" For Tern <leader> t
noremap <leader>td :TernDef<cr>
noremap <leader>tn :TernRename<cr>
noremap <leader>tr :TernRefs<cr>
noremap <leader>t? :TernDoc<cr>
noremap <leader>tb :TernDocBrowse<cr>

" For profile leader sv, ev
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <leader><leader> :w<cr>:!clear; rspec spec<cr>
nnoremap <leader>] :w<cr>:call VimuxRunCommand('npm test')<cr> 
nnoremap <leader>} :w<cr>:call VimuxRunCommand('grunt server')<cr>
nnoremap <leader>[ :w<cr>:call VimuxRunCommand('coffee')<cr> 
nnoremap <leader>gq :VimuxCloseRunner<cr>
nnoremap <leader>gw :VimuxInspectRunner<cr>
inoremap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" let g:neosnippet#snippets_directory = "~/.vim/bundle/Jasmine-snippets-for-snipMate"
let g:neosnippet#snippets_directory = "~/.vim/snippets/,~/.vim/plugged/Jasmine-snippets-for-snipMate"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

vnoremap gl :<C-U>!blame <C-R>=expand("%:p") <CR> <C-R>=line("'<") <CR> <C-R>=line("'>") <CR> <CR>
vnoremap # :TComment<CR>
nnoremap <C-m> :nohl<cr>

" Make j/k move to next visual line instead of physical line
" http://yubinkim.com/?p=6
nnoremap k  gk
nnoremap j  gj
nnoremap gk k
nnoremap gj j

nnoremap <leader>js O'use strict';<esc>ji

noremap <leader>pm :CtrlPMRU<cr>
noremap <leader>pp :w<cr>:!pandoc % -o %:r.pdf -V geometry:margin=1in --highlight-style=espresso; open %:r.pdf<cr>

noremap gb <C-^>
noremap  <leader>gb :CtrlPBuffer<cr>
noremap  <leader>ga :CtrlP app<cr>
noremap  <leader>gi :topleft :split app/index.html<cr>
noremap  <leader>gg :GitGutterToggle<cr> 
nnoremap <leader><leader> :w<cr>:!clear; rspec spec<cr>
" }}}

" Autocommands -------------------------------- {{{
au BufNewFile,BufRead *.css set fdm=marker fmr={,}
au BufNewFile,BufRead *.ejs set filetype=js
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.js set filetype=javascript-jasmine.javascript 

au BufEnter * set completeopt-=preview " disable tern preview buffer

au BufNewFile,BufRead *.md setlocal spell
au BufNewFile,BufReadPost *.md set filetype=markdown
au FileType javascript,css,YOUR_LANG nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
au FileType javascript,css,YOUR_LANG inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()<CR>a
au FileType javascript,css,YOUR_LANG inoremap <silent> ;; <ESC>:call cosco#commaOrSemiColon()<CR>a
" For local identifier replace
au FileType javascript,css,YOUR_LANG nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>
" For global identifier replace
au FileType tocmdjavascript,css,YOUR_LANG nnoremap gR gD:%s/<C-R>///gc<left><left><left>
"}}}

" Colorschmes/Highlighting ---- {{{
hi IncSearch term=reverse gui=underline guibg=Blue  guifg=Yellow
hi Pmenu      guifg=White guibg=Blue
hi PmenuSbar  ctermbg=Black guibg=Grey
hi PmenuSel   gui=italic guifg=Yellow guibg=Blue
hi PmenuThumb guifg=Yellow guibg=Black
hi Visual term=reverse ctermbg=9 guibg=#555577 guifg=Black
set t_Co=256
set background=dark
syntax enable
let g:solarized_termcolors=256
let g:solarized_contrast="high"
" set background=light
colorscheme solarized
"colorscheme vividchalk
"colorscheme darkmate
"hi Search cterm=reverse ctermbg=240 ctermfg=green gui=underline guibg=Black guifg=Yellow
"hi Search cterm=underline ctermbg=Yellow ctermfg=Black gui=underline guibg=Black guifg=Yellow
hi Todo term=bold cterm=bold ctermfg=DarkYellow guifg=Blue guibg=Yellow
" THIS IS THE BACKGROUND COLOR FOR SOLARIZED: 234
hi ColorColumn ctermbg=235 
hi SignColumn  ctermbg=235
hi GitGutterAdd          cterm=bold ctermfg=Green ctermbg=235
hi GitGutterChange       cterm=bold ctermfg=Yellow ctermbg=235
hi GitGutterDelete       cterm=bold ctermfg=Red ctermbg=235 
hi GitGutterChangeDelete cterm=bold ctermfg=Red ctermbg=235

" Environment ------ {{{
set mouse=a
" }}}
