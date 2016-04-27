setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smartindent
setlocal formatoptions=croql
setlocal foldmethod=marker
setlocal tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
setlocal keywordprg=pman
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

map <Leader>m :make<CR>
map <Leader>l :!php -l %:p<CR>
map <Leader>u :!phpunit %:p<CR>
map <Leader>r :!php %:p<CR>

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
