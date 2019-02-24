set nocompatible              " required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'davidhalter/jedi-vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'morhetz/gruvbox'
"Plugin 'chriskempson/tomorrow-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Python indentataion plugin
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " requiredset nu


" mapping key combinations to jump between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" For python tabstops
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 | 
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Flag unncessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 encoding
set encoding=utf-8

" The former line ensures that the autocomplete window goes away when you’re
" done with it, and the latter defines a shortcut for goto definition.

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

""python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this).read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" Pretty code
let python_highlight_all=1
syntax on

" Select color scheme based on vim mode
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"colorscheme zenburn
colorscheme Tomorrow-Night-Bright
highlight LineNr ctermfg=grey

"colorscheme tomorrow-theme
"endif

set nu
set relativenumber

" Powerline fonts and airline theme
let g:airline_powerline_fonts = 1
set guifont=Inconsolata\ for\ Powerline
let g:airline_theme='powerlineish'
set laststatus=2

if &diff
    colorscheme mycolorsheme
endif

" Enable transparency
" https://stackoverflow.com/questions/21572179/vim-color-scheme-overriding-the-background-settings-in-gnome-terminal
hi Normal ctermbg=none
highlight NonText ctermbg=none

" popup at bottom
set splitbelow

" NERDTree at startup
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Use space to enter a single character in escape mode
nnoremap <Space> i_<Esc>r
