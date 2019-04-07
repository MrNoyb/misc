" Vim Plug - Plugin Management
call plug#begin('~/.local/share/nvim/plugged')

" NeoSolarized
Plug 'iCyMind/NeoSolarized'

" Vim Surround
Plug 'tpope/vim-surround'

" Vim Fugitive
Plug 'tpope/vim-fugitive'

" Vim Commentary
Plug 'tpope/vim-commentary'

" Vim Rails
Plug 'tpope/vim-rails'

" Vim Bundler
Plug 'tpope/vim-bundler'

" Vim Endwise
Plug 'tpope/vim-endwise'

" NERD tree
Plug 'scrooloose/nerdtree'

" NERD tree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" ALE (Asynchronous Lint Engine)
Plug 'w0rp/ale'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
\ }

" Deoplete (Asynchronous Completion Framework)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Options
" -------
"
"  General
set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
"
" NERD tree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif
let NERDTreeShowBookmarks=1
"
" NeoSolarized
set termguicolors
colorscheme NeoSolarized
"
" LanguageClient
set hidden
let g:LanguageClient_serverCommands = {
	\ 'c': [ 'ccls' ],
	\ 'cpp': [ 'ccls' ],
	\ 'ruby': [ 'solargraph',  'stdio' ],
\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"
" Deoplete
let g:deoplete#enable_at_startup = 1
