" 目前 daily 參考同事的, 一些自己想習慣的 config 和 color 從這個檔案 copy 過去

Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides' " 辨識縮排


"===========================================
" Short Cut
"===========================================
nnoremap <leader>v :ls<CR>:b 
nnoremap <leader>e :e<space>
nnoremap <leader>c :
nnoremap <leader>ag<space> :!ag<space>
nnoremap <leader>agf "ayiw:!ag<space><c-r>a<space>
nnoremap <leader>agd "ayiw:!ag<space>'def<space><c-r>a'<space>


"===========================================
" vim-gitgutter 相關
"===========================================
set updatetime=100 " default 4000 是 4 秒才更新
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gb <Plug>(GitGutterPrevHunk)


"===========================================
" indent_guides 相關
"===========================================
let g:indent_guides_enable_on_vim_startup = 1


"  Color 相關 
source ~/.config/nvim/color.vim


"===========================================
" indent_guides 相關
"===========================================
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=#484848 ctermbg=484848
hi IndentGuidesEven guibg=#6d6d6d ctermbg=6d6d6d
