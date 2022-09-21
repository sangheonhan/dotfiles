set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

if exists("g:neovide")
    let g:neovide_refresh_rate=60
    let g:neovide_refresh_rate_idle=5
    let g:neovide_remember_window_size = v:true
    let g:neovide_hide_mouse_when_typing = v:false
    let g:neovide_cursor_animation_length=0
endif
