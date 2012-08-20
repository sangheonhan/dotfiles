au BufRead,BufNewFile *.c set ai ci si ts=4 sw=4 et fdm=marker
au BufRead,BufNewFile *.h set ai ci si ts=4 sw=4 et fdm=marker
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
set keywordprg=man
map <F5> :!make %:p<CR>
map <F8> :!%:p<CR>
