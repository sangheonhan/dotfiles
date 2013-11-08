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
setlocal keywordprg=perldoc

map <Leader>m :!make %:p<CR>
map <Leader>r :!perl %:p<CR>

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
if exists("*IndentGuidesEnable")
    IndentGuidesEnable
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
