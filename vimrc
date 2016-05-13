"============================================
"                   General
"============================================

"history长度
set history=1000

"检测文件类型
filetype on

set nocompatible  	" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
set autoread          	" 文件修改之后自动载入。
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示

set nobackup		"取消备份
set nowb
set noswapfile

set paste		"粘贴时保持格式

set nu	 		"显示行号
set nowrap		"取消换行

set hlsearch		"高亮搜索的文本
set ignorecase		"搜索忽略大小写
set incsearch		"键入时即开始搜索

set tabstop=4           " 设置Tab键的宽度        [等同的空格个数]  
set shiftwidth=4  
set expandtab           " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
set softtabstop=4  	" 按退格键时可以一次删掉 4 个空格

set showcmd         "在状态栏显示正在输入的命令 

set so=10  " Set 10 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
  
syntax enable  "开启语法高亮
syntax on   

"配色方案 三种,选一个
"colorscheme darkblue       " 深蓝色配色方案。   
colorscheme desert         " 经典配色方案。  
"set background=dark  

"============================================
"                   File Encode
"============================================

"设置文件编码为utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


"============================================
"               Plugin Manager
"============================================

set nocompatible                " be iMproved
"filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
"
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'
Bundle 'Valloric/YouCompleteMe'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on



"============================================
"               File Header
"============================================

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: lewin") 
        call append(line(".")+2, "\# mail: lewin@xiyoulinux.org || lilinhan1303@gmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: lewin") 
        call append(line(".")+2, "    > Mail: lewin@xiyoulinux.org || lilinhan1303@gmail.com") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


"============================================
"               YCM Setting
"============================================
" 寻找全局配置文件
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"] 
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
"let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
"关键字补全
"let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
" let g:ycm_use_ultisnips_completer=0
"
