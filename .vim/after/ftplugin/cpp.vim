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
setlocal tags=./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
setlocal keywordprg=man

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

map <Leader>m :!make<CR>
map <Leader>r :!g++ -Wall -std=c++11 -o %:r % && ./%:r<CR>
