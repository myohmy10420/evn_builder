let g:python_host_prog = $HOME . '/.asdf/installs/python/2.7.18/bin/python'
let g:python3_host_prog = $HOME . '/.asdf/installs/python/3.6.9/bin/python'
let g:ruby_host_prog = $HOME . '/.asdf/installs/ruby/2.7.0/bin/ruby'

"  載入Plugin 
"===========================================
" Vundle, plugins 在 ~/.vim/bundle
"===========================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " nvim 需要有這行
Plugin 'tpope/vim-rails' " 有:A, gf 等指令可以用
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim' " 收尋檔案
Plugin 'vim-airline/vim-airline' " 加強下方 statusline 和上方 tabline
Plugin 'ycm-core/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'mg979/vim-visual-multi' " ctrl n 跟 vscode crtl d 一樣效果
Plugin 'tpope/vim-surround' " c = change, d = delete, y = add, 後面 + s(surround) 開始使用
Plugin 'tomtom/tcomment_vim' " gc comment
Plugin 'nathanaelkane/vim-indent-guides' " 辨識縮排
Plugin 'junegunn/vim-easy-align' " 指定某個字元自動對齊

call vundle#end()
filetype plugin indent on




" 漣Setting 漣
let mapleader="," " 設定 leader key

set wrap " 字數過長時換行。
set linebreak " 換行時不會切斷單字
" set hidden
" set titlestring=%F
set list listchars=trail:· " tab 和空白顯示的標誌
set autoindent " 自動縮排
set wildchar=<Tab> wildmenu wildmode=full
set number " 顯示行號
set noswapfile " disable .swp files creation in vim
set showtabline=2
let tabMinWidth = 0 " 最小分頁寬度（0: 不限）
let tabMaxWidth = 40 " 最大分頁寬度（0: 不限）
let tabMinWidthResized = 15 " 設定 tabDivideEquel 有效時，採用的最小分頁寬度
let tabScrollOff = 5 " 目前分頁左右至少顯示幾個分頁
let tabEllipsis = '…' " 分頁過長而被截短時，要顯示的替代文字
let tabDivideEquel = 0 " 分頁總長超出畫面時，是否自動均分各分頁寬度

"===========================================
" Short Cut
"===========================================
nnoremap <leader>v :ls<CR>:b 


"===========================================
" Tab <Tab> 相關
"===========================================
set shiftwidth=2 " tab 和 delete 一次增加或刪除2個空白
set expandtab "tab 變空白
nnoremap <silent> <tab> :bn<cr>
nnoremap <silent> <s-tab> :bp<cr>


"===========================================
" NERDTreeFind 相關
"===========================================
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1 " 打開檔案後關閉 Nerdtree
let NERDTreeShowHidden=1 " 隱藏檔案也看得到, 例如 .gitignore
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree if opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


"===========================================
" vim-gitgutter 相關
"===========================================
set updatetime=100 " default 4000 是 4 秒才更新
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gb <Plug>(GitGutterPrevHunk)


"===========================================
" ale 相關
"===========================================
let g:ale_sign_column_always = 1


"===========================================
" indent_guides 相關
"===========================================
let g:indent_guides_enable_on_vim_startup = 1


"===========================================
" vim-easy-align 相關
"===========================================
vmap <Enter> <Plug>(EasyAlign)


"  Color 相關 
source ~/.config/nvim/color.vim


"===========================================
" indent_guides 相關
"===========================================
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=#484848 ctermbg=484848
hi IndentGuidesEven guibg=#6d6d6d ctermbg=6d6d6d
