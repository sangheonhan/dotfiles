let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

autocmd VimEnter * if exists('g:loaded_indent_guides') | IndentGuidesEnable | endif
