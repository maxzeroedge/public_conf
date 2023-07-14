call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'iamcco/coc-tailwindcss'
Plug 'evanleck/vim-svelte'
"Substituting with ncm2
"Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'brooth/far.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'mfussenegger/nvim-jdtls'
call plug#end()

"====LanguageClient-neovim Config Starts===="
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_autoStart = 1
" Use the location list instead of the quickfix list to show linter warnings
let g:LanguageClient_diagnosticsList = "Location"
let g:LanguageClient_rootMarkers = {
    \ 'java': ['.git']
    \ }
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'java': ['java -Declipse.application=org.eclipse.jdt.ls.core.id1 -Dosgi.bundles.defaultStartLevel=4 -Declipse.product=org.eclipse.jdt.ls.core.product -Dlog.level=ALL -noverify -Xmx1G -jar ./plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar -configuration ./config_linux -data /path/to/data --add-modules=ALL-SYSTEM --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED']
    \ }

nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <buffer> <silent> F5 :call LanguageClient_contextMenu()<CR>
nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <buffer> <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <buffer> <silent> <leader>fs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <buffer> <silent> <a-CR> :call LanguageClient_textDocument_codeAction()<CR>
"====LanguageClient-neovim Config Ends===="

set nu


"=====NCM2 Config Starts ===="
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'css',
    \ 'priority': 9,
    \ 'subscope_enable': 1,
    \ 'scope': ['css','scss'],
    \ 'mark': 'css',
    \ 'word_pattern': '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    \ })
"====NCM2 Config Ends===="
set encoding=UTF-8
let g:python3_host_prog = '/usr/bin/python3'
set ts=4 sw=4
:AirlineTheme bubblegum
