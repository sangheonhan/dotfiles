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

map <F5> :!make<CR>
map <F8> :!%:p<CR>

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
IndentGuidesEnable

let g:sql_type_default = 'mysql'
