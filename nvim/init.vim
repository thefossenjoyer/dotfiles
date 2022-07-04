source $HOME/.config/nvim/vim-plug/plugins.vim
"source $HOME/.config/nvim/onedark.vim

set noshowmode
set number

set tabstop=4 softtabstop=4
set smartindent
set shiftwidth=4
set expandtab
set termguicolors

set mouse=a

highlight Normal guibg=None

" colorscheme aura
colorscheme horizon

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'background': 'dark',
    \ }

" mapping
let mapleader = " "

" I mean, who doesn't like comments
nnoremap <C-/> :AutoInLineComment
vnoremap <C-/> :AutoInLineComment

" Saving, like imagine doing this in vim.
" nnoremap <C-s> :w <CR> 
" nnoremap <C-s><C-q> :wq <CR>

" Quick launch some files
nnoremap <C-e>i :e /home/tux/.config/nvim/init.vim <CR>
nnoremap <C-e>v :e /home/tux/.config/nvim/vim-plug/plugins.vim <CR>

