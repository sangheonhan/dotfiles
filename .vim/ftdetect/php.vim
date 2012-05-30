au BufRead,BufNewFile *.php set ai ci si ts=4 sw=4 et fdm=marker
set tags=.,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
set keywordprg=pman
map <F5> :!make %:p<CR>
map <F6> :!php -l %:p<CR>
map <F7> :!phpunit %:p<CR>
map <F8> :!php %:p<CR>
