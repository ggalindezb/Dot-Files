" vimrc custom configuration file
" Maintainer:	Gerardo Galindez
" Created:	    10/Sep/2012
" Last Updated: 07/Feb/2015
" Version:      0.5
" Sections:
"    -> General                    [GEN]
"    -> Packages                   [PKG]
"    -> Keymaps                    [KEY]
"    -> Vim UI                     [VUI]
"    -> Files                      [FIL]
"    -> Editing                    [EDT]
"    -> Autocmds and lang specific [AUT]
"    -> Helpers                    [HLP]
"    -> Plugin configuration       [PKC]
" References:
"    -> Amix vimrc    [http://amix.dk/vim/vimrc.html]
"    -> VimCasts      [http://vimcasts.org]
"    -> Gary Berhardt [https://github.com/garybernhardt/dotfiles/blob/master/.vimrc]
"    -> Andrew Radev  [http://andrewradev.com]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General [GEN]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" Use Vim settings
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden

" Remember stuff
set history=256
set undolevels=512

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Packages [PKG]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Plug if it's not available
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/autoload'
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'tomtom/tlib_vim'                  " tlib - for vim-asciidoc
Plug 'dahu/Asif'                        " asif - for vim-asciidoc
Plug 'vim-scripts/SyntaxRange'          " SyntaxRange - for vim-asciidoc

" Vim interface extensions
Plug 'fholgado/minibufexpl.vim'         " Elegant buffer explorer
Plug 'airblade/vim-gitgutter'           " Git diff in the gutter
Plug 'bling/vim-airline'                " Lean and mean status/tabline
Plug 'tpope/vim-fugitive'               " Git wrapper so awesome, it should be illegal
" Plug 'benmills/vimux'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'wellle/tmux-complete.vim'
" Plug 'scrooloose/syntastic'

" File handling
Plug 'kien/ctrlp.vim'                   " Fuzzy file/buffer finder
Plug 'mileszs/ack.vim'                  " Wrapper for ack, beyond grep
" Plug 'rking/ag.vim'
" Plug 'scrooloose/nerdtree'

" Motion
Plug 'tmhedberg/matchit'                " Extended % matching
" Plug 'Lokaltog/vim-easymotion'
" Plug 'justinmk/vim-sneak'
" Plug 'tpope/vim-repeat'

" Text wrangling
Plug 'tpope/vim-commentary'             " Comment stuff out
Plug 'godlygeek/tabular'                " Text filtering and alignment
Plug 'kien/rainbow_parentheses.vim'     " Better Rainbow Parentheses
Plug 'ntpeters/vim-better-whitespace'   " Fix whitespace
" Plug 'tpope/vim-surround'
" Plug 'maxbrunsfeld/vim-yankstack'

" Text objects / Operators
" Plug 'kana/vim-textobj-user'
" Plug 'wellle/targets.vim'
" Plug 'kana/vim-textobj-fold'

" Completion
" Plug 'Valloric/YouCompleteMe'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'                  " Emmet expanding abbreviations
" Plug 'ervandew/supertab'

" Filetype
Plug 'vim-ruby/vim-ruby'                " Vim support of Ruby
Plug 'tpope/vim-rails'                  " Vim support for Rails
" Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'         " Vim support for Coffeescript
Plug 'othree/html5.vim'                 " Vim support for HTML5
Plug 'tpope/vim-haml'                   " Vim support for HAML
Plug 'dahu/vim-asciidoc'                " Vim support for Asciidoc
Plug 'plasticboy/vim-markdown'          " Vim support for Markdown

" Colorschemes
Plug 'Heldraug/vim-megara'              " Colorscheme focused on template
Plug 'tomasr/molokai'                   " Port of the monokai
Plug 'altercation/vim-colors-solarized' " Precision colorscheme

call plug#end()

" Unused plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Keymaps [KEY]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""
" Vim keymaps
""""""""""""""
" Use spacebar to repeat last command
nore <Space> .
" Use . as :
nore . :
let mapleader = ","

" Paste from the clipboard without indenting
set pastetoggle=<Leader>p

" Navigation keymaps
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Buffer keymaps
map <Leader>bn :bnext<cr>
map <Leader>bN :bprevious<cr>
map <Leader>bd :bdelete<cr>

" Window keymaps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab keymaps
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Dismiss search highlight
nmap <Leader><Space> :nohl<cr>

" Giga save. Handle with care
nmap <leader>ww :wall!<cr>
nmap <leader>wq :wqall!<cr>
nmap <leader>qq :qall!<cr>

"""""""""""""""""
" Plugin keymaps
"""""""""""""""""
""""""""""
" NERDTree
""""""""""
nmap <leader>nt :NERDTreeToggle<cr>

""""""""""""""""""""
" Commentary keymaps
""""""""""""""""""""
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>CommentaryUndo

"""""""""
" Switch
"""""""""
nnoremap - :Switch<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim UI [VUI]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing position aid
set number
set numberwidth=4
set ruler
set cul
set showmatch
set backspace=indent,eol,start " Allow backspacing over everything

" Vim command line and Wildmenu
set wildmenu
set wildignore=*~,*.swp
set showcmd
set cmdheight=1

" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch		" Real time match
set magic           " Regex magic

" Don't redraw while executing macros
" Note: Dooesn't looks as cool
set lazyredraw

" Bells are ugly
set novisualbell
set noerrorbells
set t_vb=

syntax on
colorscheme megara
set t_Co=256        " 256 color term

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files [FIL]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't write anything but the file
set nobackup
set nowb
set noswapfile

" Blowfish encryption
setlocal cryptmethod=blowfish

" Filetypes
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
augroup vimrcEx
au!

" Return to last edit position
" autocmd BufReadPost *
     " \ if line("'\"") > 1 && line("'\"") <= line("$") |
     " \   exe "normal! g`\"" |
     " \ endif

" Remember info about open buffers on close
" set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing [EDT]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 4-space tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Use spaces for tabs
set expandtab
set smarttab

" Indent
set autoindent
set smartindent
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Autocmds and lang specific [AUT]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd!

" Set [...] to 2-space indent
autocmd WinEnter,FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sts=2 ts=2 sw=2

" Text -> Git, Asciidoc
autocmd FileType text setlocal textwidth=80
autocmd FileType asciidoc setlocal textwidth=80

" Set SASS to SASS. Duh
autocmd! BufRead,BufNewFile *.sass setfiletype sass

" Set F# lex to F#
autocmd! BufRead,BufNewFile *.fsl setfiletype fsharp
autocmd! BufRead,BufNewFile *.fsy setfiletype fsharp

" Don't change tabs for spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.txt :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Helpers [HLP]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
" By VimCasts
nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Package configuration [PKC]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""
" CtrlP
""""""""""
" When opening multiple files, open them in the background
let g:ctrlp_open_multiple_files = 'i'

""""""""""""
" Airline
""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'

"""""""""""""""""""""""
" Rainbow Parentheses
"""""""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3']]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
