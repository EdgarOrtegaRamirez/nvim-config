" Display vertical column at 120 characters
highlight ColorColumn ctermbg=8

" Spell check for Markdown and Git commit messages
autocmd FileType markdown,gitcommit setlocal spell

lua << LUA
require('init')
LUA
