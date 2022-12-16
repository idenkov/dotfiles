" usage: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Then run :PluginInstall

set nocompatible              " required
filetype off                  " required

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline'
Plugin 'pearofducks/ansible-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

syntax on
color dracula

set cursorline              " highlight current line
set list
if v:version < 800
  set listchars=eol:¬,tab:🠂\ ,nbsp:_              " old versions can't list space
else
  set listchars=eol:¬,tab:🠂\ ,space:·,nbsp:_      " but newer do
endif

set tabstop=4
set softtabstop=4
"new split
nnoremap <S-v> :vs<CR>
nnoremap <S-h> :sp<CR>

"split navigations
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

"resize windows
nnoremap <S-up> :res +5<CR>
nnoremap <S-down> :res -5<CR>
nnoremap <S-right> :vertical resize +5<CR>
nnoremap <S-left> :vertical resize -5<CR>


" Tab navigation 
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-w> :tabclose<CR>

"Toggle line numbers
nnoremap <F2> :set nonumber!<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

highlight BadWhitespace ctermbg=brown guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

nnoremap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1 " show hidden files

" Automatically save the session when leaving Vim
" autocmd! VimLeave * mksession .vim_session
" Automatically load the session when entering vim
" autocmd! VimEnter * source .vim_session

" Jump to your last position when reopen a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
