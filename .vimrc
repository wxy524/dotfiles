set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
"
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'rodjek/vim-puppet'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.




" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" " Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
"
"
" " Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.
"
set pastetoggle=<F2>
set clipboard=unnamed
"
"
" " Mouse and backspace
" "" set mouse=a  " on OSX press ALT and click
" "" set bs=2     " make backspace behave like normal again
"
"
" " Rebind <Leader> key
" " I like to have it here becuase it is easier to reach than the default and
" " it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ";"
"
"
" " Bind nohl
" " Removes highlight of your last search
" " ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl <CR>
"vnoremap <C-n> :nohl <CR>
"inoremap <C-n> :nohl <CR>
"
" ctrl + t: open NERDTree
map <C-t> :NERDTreeToggle<CR>

"
" " Quicksave command
" Since I do not set leader key, I can type \s in normal mode to save current
" file
noremap <Leader>s :update<CR>
" Quit current window
noremap <Leader>q :quit<CR>
" Quit all windows
noremap <Leader>Q :qa!<CR>
" "noremap <C-Z> :update <CR>
" "vnoremap <C-Z> <C-C>:update<CR>
" "inoremap <C-Z> <C-O>:update<CR>
"
"
" " Quick quit command
" "" noremap <Leader>e :quit<CR>  " Quit current window
" "" noremap <Leader>E :qa!<CR>   " Quit all windows
"
"
" " bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"
"
" " easier moving between tabs
""map <Leader>n <esc>:tabprevious<CR>
""map <Leader>m <esc>:tabnext<CR>
"
"
"move around tabs
map <c-h> :tabp<CR>
map <c-l> :tabn<CR>
"nmap <F9> :tabp <CR>
"nmap <F12> :tabn <CR>
"
" " map sort function to a key
" "" vnoremap <Leader>s :sort<CR>
"
"
" " easier moving of code blocks
" " Try to go into visual mode (v), thenselect several lines of code here and
" " then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv
"
"
" " Show whitespace
" " MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
"
"
" " Color scheme
"mkdir -p ~/.vim/colors && cd ~/.vim/colors
"wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod
"
"
" " Enable syntax highlighting
" " You need to reload this file for the change to apply
syntax on
"
"
" " Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
"
"
" " easier formatting of paragraphs
" "" vmap Q gq
" "" nmap Q gqap
"
"
" " Useful settings
set history=700
set undolevels=700
set showmode
set showcmd
set visualbell
set noswapfile


"set backupdir=~/.vim/tmp/backup//

"Make those folders automatically if they don't already exist.
"if !isdirectory(expand(&backupdir))
"    call mkdir(expand(&backupdir), "p")
"endif


" convenience mappings
" ignore help key
noremap  <F1> <nop>
inoremap <F1> <nop>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
"


"
"
" " Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
"set autoindent
"
" " Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"
"
" " Disable stupid backup and swap files - they trigger too many events
" " for file system watchers
set nobackup
set nowritebackup
set noswapfile
"
"
" " Setup Pathogen to manage your plugins
" " mkdir -p ~/.vim/autoload ~/.vim/bundle
" " curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" " Now you can install any plugin into a .vim/bundle/plugin-name/ folder
" "" call pathogen#infect()
"
"
" Tell vm to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "  "100 :  will save up to 100 lines for each register
"  "  :20  :  up to 20 lines of command-line history will be remembered
"  "  %    :  saves and restores the buffer list
"  "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
   if line("'\"") <= line("$")
		   normal! g`"
		   return 1
   endif
endfunction

augroup resCur
		autocmd!
		autocmd BufWinEnter * call ResCur()
augroup END

" "
" ============================================================================
" " Python IDE Setup
" "
" ============================================================================
"
"
" " Settings for vim-powerline
" " cd ~/.vim/bundle
" " git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
"
"
" " Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
" "" let g:ctrlp_max_height = 30
" "" set wildignore+=*.pyc
" "" set wildignore+=*_build/*
" "" set wildignore+=*/coverage/*
"
"
" " Settings for python-mode
" " Note: I'm no longer using this. Leave this commented out
" " and uncomment the part about jedi-vim instead
" " cd ~/.vim/bundle
" " git clone https://github.com/klen/python-mode
" "" map <Leader>g :call RopeGotoDefinition()<CR>
" "" let ropevim_enable_shortcuts = 1
" "" let g:pymode_rope_goto_def_newwin = "vnew"
" "" let g:pymode_rope_extended_complete = 1
" "" let g:pymode_breakpoint = 0
" "" let g:pymode_syntax = 1
" "" let g:pymode_syntax_builtin_objs = 0
" "" let g:pymode_syntax_builtin_funcs = 0
" "" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" " Settings for jedi-vim
" " cd ~/.vim/bundle
" " git clone git://github.com/davidhalter/jedi-vim.git
" " let g:jedi#related_names_command = "<leader>z"
" " let g:jedi#popup_on_dot = 0
" " let g:jedi#popup_select_first = 0
" " map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" " Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" "" set completeopt=longest,menuone
" "" function! OmniPopup(action)
" ""     if pumvisible()
" ""         if a:action == 'j'
" ""             return "\<C-N>"
" ""         elseif a:action == 'k'
" ""             return "\<C-P>"
" ""         endif
" ""     endif
" ""     return a:action
" "" endfunction
"
" "" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" "" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
"
"
" " Python     folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
set foldmethod=syntax
set foldnestmax=10
set foldlevel=1
"
"

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

"Vim Tips
"
"<C+n> or <C+p> : word completion in insert mode
"<C+x><C+l>     : line completion in insert mode
"/<C+r><C+w>    : put word which in under cursor into search
"guu            : lowcase current line
"gUU            : uppercase current line
"~              : invert case of current character
"`.             : jump to exact spot in last modification line
"Ctrl+Shift+v   : copy from your system clipboard
"gcc            : comment current line(plugin Tcommnet)
"gc             : commnet block in visual mode(plugin Tcomment)
"*              : search word which cursor is currently in
"


