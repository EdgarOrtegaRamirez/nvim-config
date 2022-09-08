" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" Display vertical column at 120 characters
highlight ColorColumn ctermbg=8

" Spell check for Markdown and Git commit messages
autocmd FileType markdown,gitcommit setlocal spell

" Map window prefix to ommit W
" this seems to be not needed since we are using vim-tmux-navigator plugin
" TODO: verify
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" START esearch
" Use <c-f><c-f> to start the prompt, use <c-f>iw to pre-fill with the current word
" or other text-objects. Try <plug>(esearch-exec) to start a search instantly.
nmap <c-f><c-f> <plug>(esearch)
map  <c-f>      <plug>(operator-esearch-prefill)

lua << LUA
require('init')
LUA
