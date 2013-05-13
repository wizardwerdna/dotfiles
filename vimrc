au BufNewFile,BufRead *.ejs set filetype=js
au BufNewFile,BufRead *.ejs set filetype=html


map <leader>k :CoffeeCompile vert watch<cr>

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
set runtimepath^=~/.vim/bundle/ctrlp.vim

nmap <leader><leader> :w<cr>:!clear; rspec spec<cr>
nmap <leader>] :w<cr>:call VimuxRunCommand('npm test')<cr>
nmap <leader>} :w<cr>:call VimuxRunCommand('npm run-script browserTest')<cr>
nmap <leader>[ :w<cr>:call VimuxRunCommand('coffee')<cr>
nmap <leader>gq :VimuxCloseRunner<cr>
nmap <leader>gw :VimuxInspectRunner<cr>
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

" nocomplcache stuff
let g:neocomplcache_enable_at_startup = 1
" Snippets still don't work the way I want - tab doesn't jump to next
"s placeholder.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_enable_auto_select = 0

set nocompatible
set autoread

let g:rails_menu=2
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Better surround
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
let g:surround_60 = "<\r>"

let g:acp_ignorecaseOption = 0

let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrClosePreview = 1

set backspace=indent,eol,start

set backup              " keep a backup file
set backupdir=~/.vim/backups
set history=100         " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set incsearch           " do incremental searching
set expandtab
set shiftwidth=2
set tabstop=2
set helpheight=1000

set completeopt=menu,menuone,preview
set wildmode=longest,list:longest

setlocal numberwidth=3

map gb <C-^>
vmap gl :<C-U>!blame <C-R>=expand("%:p") <CR> <C-R>=line("'<") <CR> <C-R>=line("'>") <CR> <CR>
vmap # :TComment<CR>
map - :Tabularize hash
map <C-l> :nohl
map <leader>a :Tabularize /=>\?<cr>

" Make j/k move to next visual line instead of physical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

set hlsearch
set listchars=tab:>-,trail:-
hi IncSearch term=reverse gui=underline guibg=Blue  guifg=Yellow
hi    Search term=reverse gui=underline guibg=Black guifg=Yellow
hi    Visual term=reverse cterm=reverse ctermbg=9 guibg=#555577 guifg=Black

hi Pmenu      guifg=White guibg=Blue
hi PmenuSel   gui=italic guifg=Yellow guibg=Blue
hi PmenuSbar  ctermbg=Black guibg=Grey
hi PmenuThumb guifg=Yellow guibg=Black

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

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset

autocmd BufNewFile,BufRead *.css set fdm=marker fmr={,}

" Fuck tpope
xmap s <Plug>VSurround

" from my old gvimrc"

colorscheme vividchalk
" syntax enable
" set background=dark
" colorscheme solarized


map <leader>t :CommandTFlush<cr>\|:CommandT .<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT .<cr>
map <leader>p :CommandTFlush<cr>\|:CommandT .<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT test<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gi :CommandTFlush<cr>\|:CommandT src/interactors<cr>
map <leader>ge :CommandTFlush<cr>\|:CommandT src/entities<cr>
map <leader>gb :CommandTFlush<cr>\|:CommandT src/boundaries<cr>

" map <leader>] :w<cr>:!(sleep 0.5; open http://localhost:9292) & (rackup config.ru)<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>P :PromoteToLet<cr>

nmap <leader><leader> :w<cr>:!clear; rspec spec<cr>
