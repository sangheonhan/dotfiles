setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smartindent
setlocal formatoptions=croql
setlocal foldmethod=marker
setlocal tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
setlocal keywordprg=pman
setlocal makeprg=ruby\ -c\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

map <Leader>m :make<CR>
map <Leader>l :!ruby -c %:p<CR>
map <Leader>r :!ruby %:p<CR>
