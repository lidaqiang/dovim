"/2let s:ProjectDir="my-project-tags"
let s:ProjectDir="."

if filereadable(s:ProjectDir."/project-setting.vim") "工程配置文件的名字
    exec "source ".s:ProjectDir."/project-setting.vim"
endif

let g:useYCM=1

"vim: set fenc=utf-8:
set nocompatible
filetype off                  " required!

"set rtp=$HOME/work/.vim/,$VIM/vimfiles/,$VIMRUNTIME/,$VIM/vimfiles/after/,$HOME/work/vimfiles/after/

"set backup
"set backupdir=$HOME/work/.vim/tmp/backup/ " backups
"set backupskip=/tmp/*,/private/tmp/*"
"set viewdir=$HOME/work/.vim/tmp/views/ " view files
"set directory=$HOME/work/.vim/tmp/swap/ " swap files

"set rtp+=~/work/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'Align'
Bundle 'Colour-Sampler-Pack'
Bundle 'DoxygenToolkit.vim'
Bundle 'Mark--Karkat'
Bundle 'matchit.zip'
Bundle 'YankRing.vim'
Bundle 'justinmk/vim-syntax-extra'
" Bundle 'Rainbow-Parentheses-Improved-and2'
Bundle 'luochen1990/rainbow'
Bundle 'lookupfile'
Bundle 'genutils'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rdnetto/YCM-Generator'
Bundle 'Lokaltog/vim-easymotion'
Bundle "tdcdev/ycm_simple_conf"
" ================================================================
" let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" map <Leader><leader>h <Plug>(easymotion-linebackward)
" map <Leader><Leader>j <Plug>(easymotion-j)
" map <Leader><Leader>k <Plug>(easymotion-k)
" map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)"

" ===================================================================
if g:useYCM
     "let s:cur_dir = getcwd()."/"
     "let g:ycm_global_ycm_extra_conf = "".s:cur_dir.".ycm_extra_conf.py"
     "let g:ycm_filepath_completion_use_working_dir = 1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_register_as_syntastic_checker = 1

    let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
    let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
    let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
    let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
    let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
    " let g:ycm_key_list_select_completion = ['<Down>', '<Enter>']
    nmap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'scrooloose/syntastic'
endif

if !g:useYCM
    Bundle 'Shougo/vimproc.vim'
endif

Bundle 'yegappan/grep'
Bundle 'kien/ctrlp.vim'
Bundle 'FelikZ/ctrlp-py-matcher'
" ctrlp插件1 - 不用ctag进行函数快速跳转
Bundle 'tacahiroy/ctrlp-funky'



Bundle 'ggreer/the_silver_searcher'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'

"Bundle 'msanders/snipmate.vim'

"supertab
"let g:SuperTabRetainCompletionType = 2
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

if 0
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle "garbas/vim-snipmate"
else
    Bundle "SirVer/ultisnips"
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-h>"
endif

" Optional:
Bundle "honza/vim-snippets"

"Bundle 'file:///Users/gmarik/path/to/plugin'
"Bundle 'snipMate_HW'

" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

if has("gui_running")
    " set encoding=chinese
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
    if has("win32")
        set fileencoding=chinese
    else
        " set fileencoding=utf-8
    endif

    let &termencoding=&encoding

    " 解决菜单乱码
    " set langmenu=zh_CN.utf-8
    " source $VIMRUNTIME/delmenu.vim
    " source $VIMRUNTIME/menu.vim

    " 解决consle输出乱码
    language messages en_US.utf-8
    set background=dark
    set lines=58 columns=218
else

    if has("win32")
        set encoding=cp936
    else
        set encoding=utf-8
    endif
    
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
    if has("win32")
        set fileencoding=cp936
        set termencoding=cp936
    else
        set fileencoding=utf-8
        set termencoding=utf-8
    endif

    " let g:solarized_contrast = "normal"
     " let g:solarized_degrade = 1
    " let g:solarized_contrast = "high"
    " let g:solarized_visibility= "high"
    set t_Co=256
    " let g:solarized_termcolors=16
    " set background=dark
    " set background=light
    " let g:solarized_style="light"
    " colorscheme desert256
    " colorscheme solarized
     colorscheme xoria256 
     " colorscheme summerfruit256
     " colorscheme calmar256-light
    " colorscheme jellybeans
    " map <ESC>[32~ <S-F8> "let <S-F8> work for me
endif

"let &termencoding=&encoding
if has("gui_running")
   " set gfn=Monaco\ 11
   " set gfn=YaHei\ Consolas\ Hybrid\ 11
    "set gfn=YaheiMono\ 10
   " set gfn=Liberation\ Mono\ 11
   " set gfn=Ubuntu\ Mono\ 12
   set gfn=Bitstream\ Vera\ Sans\ Mono\ 11
   " set gfn=WenQuanYi\ Micro\ Hei\ Mono\ 10
   " set gfn=DejaVu\ Sans\ Mono\ 10
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set wildmode=longest,list
set wildmenu

"最大化
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

autocmd BufEnter * :syntax sync fromstart

"去掉鼠标功能
set mouse-=a
"光标不闪
set gcr=a:blinkon0

"设置','为leader快捷键
let mapleader = ","
let g:mapleader = ","

filetype off
"Enable filetype plugin
filetype plugin indent on

"custom file type
au BufNewFile,BufRead *.inc set filetype=C
au BufNewFile,BufRead *.cfg set filetype=javascript
au BufNewFile,BufRead *.INC set filetype=C
au BufNewFile,BufRead *.MK  set filetype=make
au BufNewFile,BufRead *.mk  set filetype=make

"remove spaces
nmap <f12> :%s= *$==<cr>

nmap <leader>o :only<cr>

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wa :wa<cr>
nmap <silent> <leader>WW :w<cr>
nmap <silent> <leader>wf :w!<cr>
nmap <silent> <leader>WF :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :cclose<cr>:q<cr>
nmap <silent> <leader>qa :qa<cr>

"search
vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"Fast remove highlight search
nmap <silent> <SPACE> :nohl<cr>

"Fast redraw
nmap <silent> <leader>rr :redraw!<cr>

set nolinebreak
set wrap
set number
set so=1
set sidescrolloff=1
set sidescroll=1
set makeprg=make
set tabstop=4
set softtabstop=4
set shiftwidth=4
syn on
compiler gcc
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=i
set guioptions-=m
set guioptions+=c
set fileformat=unix
"set fileformats=unix
set cindent
set autoindent
set nocompatible
set expandtab
set smarttab
set linespace=0
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff
set fsync
set laststatus=2
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%03v][%p%%]\ [LEN=%L]
"set statusline=%F%m%r%h%w%=%k\ [FORMAT=%{&ff}]\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ [POS=%04l,%03v][%p%%]\ [LEN=%L]
set nocursorline
set nocursorcolumn
set undolevels=1000
set history=1000
set nobackup
set noswapfile
"set updatecount=1000
set sessionoptions+=unix,slash
set hlsearch
set incsearch
"set ignorecase
set noerrorbells
set pastetoggle=<F2>
nnoremap j gj
nnoremap k gk
cmap w!! w !sudo tee % >/dev/null

set modelines=10
set modeline

"Favorite filetypes
set ffs=unix,dos
nmap <leader>fd :se ff=dos<cr>
" nmap <leader>fu :se ff=unix<cr>

" Hide the mouse when typing text
set mousehide
set hidden

"nnoremap <C-H> <C-W>h 
"nnoremap <C-J> <C-W>j 
"nnoremap <C-K> <C-W>k 
"nnoremap <C-L> <C-W>l
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
smap <C-J> <Plug>snipMateTrigger
imap <C-J> <Plug>snipMateTrigger


"Quickfix
nmap <leader>cd :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :botright copen<cr>
nmap <leader>cq :cclose<cr>
nmap <leader>lq :lclose<cr>
nmap <leader>rg :Rgrep<cr>
"nmap <leader>gc :G /\<<c-r>=expand("<cword>")<cr>\>/<cr>
"nmap <leader>ga :Grep /\<<c-r>=expand("<cword>")<cr>\><cr>
nmap <leader>cb :botright cwindow<cr>

nmap <leader>qo :QFix<CR>

nmap <leader>ft :call QFixToggle(1)<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
 
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            botright copen
        endif
    endif
endfunction
 
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

function! s:Loadtags(ctags, cscope)
    let s:cur_dir = getcwd()."/"

    if a:ctags == 1
        if filereadable(s:ProjectDir."/tags")
            exec "set tags=".s:cur_dir.s:ProjectDir."/tags"
        else
            exec "set tags=filenametags"
        endif
    endif

    if a:cscope == 1
        if filereadable(s:ProjectDir."/GTAGS")                "设置tag文件的名字
            set csprg=gtags-cscope
            exec "cs add ".s:cur_dir.s:ProjectDir."/GTAGS"
        elseif filereadable(s:ProjectDir."/cscope.out")                "设置tag文件的名字
            set csprg=cscope
            exec "cs add ".s:cur_dir.s:ProjectDir."/cscope.out"
        endif
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    " set csto=1
    set csto=0
    " set nocst
    set cst

    "set nocsverb
    "set csverb
    call s:Loadtags(0, 1)
endif
"set cscopequickfix=s-!,c-!,d-!,i-!,t-!,e-!,g-!,f-!
" set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
"

nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
" nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>

function! DisplayTagInLeftWin()
    let s:cur_world = expand("<cword>")
    "execute "wincmd L"

    " Reuse or create new buffer. Based on code in Decho
    " http://www.vim.org/scripts/script.php?script_id=120
    "if exists("g:rrbufnr") && bufwinnr(g:rrbufnr) > 0
    if exists("g:rrbufnr")
        "echomsg "already has window!"
        "exe "keepjumps ".bufwinnr(g:rrbufnr)."wincmd W"
        exe "keepjumps ".bufwinnr('-TagResults_')." wincmd w"
        "exe 'normal ggdG' "clean buffer
    else
        "echomsg "new window!"
        "exe "keepjumps silent! vs"
        exe 'keepjumps silent! vs -TagResults-'
        let g:rrbufnr=bufnr('%')
    end

    execute "tag ".s:cur_world
endfunction
set splitright
nmap <S-F8> :call DisplayTagInLeftWin()<CR>

" nmap <F7> :pop<CR>
" nmap <F8> :tag <C-R>=expand("<cword>")<CR><CR>

"nmap <C-t> :colder<CR>:cc<CR>
"nmap <F3> :cclose<cr>:botright copen<cr><C-W>k


"set complete
set completeopt=longest,menuone
" set completeopt=menuone,menu,longest

"compview
let g:cvWindowPosition = 0

"Doxygen
"let g:DoxygenToolkit_briefTag_pre="@Descripton "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="******************************************"
"let g:DoxygenToolkit_blockFooter="******************************************"
let g:doxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_authorName="xuyufeng"
let g:DoxygenToolkit_licenseTag="ifreecomm"

"补全映射
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <SPACE>       pumvisible()?"\<C-Y>":"\<SPACE>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
"set fen
set fdl=9999
"nmap <silent> <leader>zo zO
"vmap <silent> <leader>zo zO
"nmap <silent> <leader>zc zC
"vmap <silent> <leader>zc zC

""设置语法折叠
"set foldmethod=syntax
"set foldcolumn=1 "设置折叠区域的宽度
"set foldclose=all "设置为自动关闭折叠
"
"" 用空格键来开关折叠
"set foldenable
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"autocmd FileType c,cpp  setl fdm=syntax | setl fen

"supertab
"let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-U>"

" Buf Explorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufEnter \[BufExplorer\] :set number

""""""""""""""""""""""""""""""
"fuzzy finder,
""""""""""""""""""""""""""""""
" let g:LookupFile_TagExpr = '"./my-project-tags/filenametags"'
let g:LookupFile_TagExpr = '"./filenametags"'
"let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'tag', 'taggedfile']
let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'tag' ]
let g:fuf_infoFile = ''
let g:fuf_enumeratingLimit = 30
let g:my_enumeratingLimit = 500

let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

"在指定目录生成filenametags，并使lookupfile将这个文件作为查找源
function SetRootOfTheProject(path)
    " 进入指定目录
    exe 'cd '.a:path
    " 生成索引
    exe '!Gencscope'
    " 生成文件标签
    exe '!genfiletags'
    "获取标签文件的路径
    let tagFilePath = genutils#CleanupFileName(a:path.'/filenametags')
    "设置LookupFile插件的全局变量，使之以上面生成的标签文件作为查找源
    exe "let g:LookupFile_TagExpr='\"".tagFilePath."\"'"
endfunction

" 设置当前位置为工程的根目录
function SetHereTheRoot()
    call SetRootOfTheProject('.')
endfunction

nmap <leader>root :call SetHereTheRoot()<CR>

" 从用户的输入获取指定路径，并设置为工程的根目录
function SetSpecifiedPathTheRoot()
    call SetRootOfTheProject(input('请输入工程根目录的路径：'))
endfunction
nmap <leader>xroot :call SetSpecifiedPathTheRoot()<CR>

" 使用LookupFile打开文件
nmap <leader>o :LookupFile<CR>
"映射LookupFile为,lk
nmap <silent> <leader>lk <Plug>LookupFile<cr> 
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>            
if 0
    "nmap <F2> :AutoComplPopDisable<cr>:FufFile<cr>
    nmap <leader>tt :AutoComplPopDisable<cr>:FufBufferTag<cr>
    "nmap <leader>ff :AutoComplPopDisable<cr>:FufQuickfix<cr>
    nmap <leader>jj :AutoComplPopDisable<cr>:FufJumpList<cr>
    nmap <leader>bb :AutoComplPopDisable<cr>:FufBuffer<cr>
    nmap <F5> :AutoComplPopDisable<cr>:FufTaggedFile<cr>
    " nmap <F6> :FufFile<cr>
else
    if exists(':FufBufferTag') "Added by xyf
        nmap <leader>tt :FufBufferTag<cr>
        "nmap <leader>ff :FufQuickfix<cr>
        nmap <leader>jj :FufJumpList<cr>
        nmap <leader>bb :FufBuffer<cr>
        " nmap <F6> :FufFile<cr>
        nmap <leader>ff :FufTaggedFile<cr>
        nmap <F5> :FufTaggedFile<cr>
    else
        nmap <leader>tt :CtrlPBufTag<cr>
        "nmap <leader>ff :CtrlPQuickfix<cr>
        nmap <leader>bb :CtrlPBuffer<cr>
        nmap <leader>ff :FufTaggedFile<cr>
        nmap <leader>jj :FufJumpList<cr>
        nmap <F5> :CtrlPTag<cr>
        nmap <F6> :FufFile<cr>
    endif
endif

function! My_bufferGrep()
    let l:current_word = expand("<cword>")
    " If the word is too big then blank it out
    if strlen(l:current_word) > 80
        let l:current_word = ""
    endif

    " Ask to verify the word
    echohl Search
    let l:search_word = input(l:current_word.",/")
    echohl None

    " If no new word was given use the one we picked up.
    if strlen(l:search_word) == 0
        let l:search_word = l:current_word
    endif

    " If only \c was passed then append it to the beginning
    if l:search_word == "\\c"
        let l:search_word = l:search_word.l:current_word
    endif

    if exists(':Unite')
        exec "Unite grep:%::".l:search_word
    else
        exec "GrepBuffer ".l:search_word
    endif
endfunction

" noremap <leader>v :Unite grep:%::<C-r><C-w>
noremap <leader>v :call My_bufferGrep()<CR>
" let g:ctrlp_by_filename = 1
let g:ctrlp_tagfile_mode = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:100'
"ToggleFocus orig s-tab
" let g:ctrlp_prompt_mappings = {
    " \ 'PrtBS()':              ['<bs>', '<c-]>'],
    " \ 'PrtDelete()':          ['<del>'],
    " \ 'PrtDeleteWord()':      ['<c-w>'],
    " \ 'PrtClear()':           ['<c-u>'],
    " \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
    " \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
    " \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    " \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    " \ 'PrtSelectMove("u")':   ['<c-b>', '<PageUp>', '<kPageUp>'],
    " \ 'PrtSelectMove("d")':   ['<c-f>', '<PageDown>', '<kPageDown>'],
    " \ 'PrtHistory(-1)':       ['<c-j>'],
    " \ 'PrtHistory(1)':        ['<c-k>'],
    " \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    " \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    " \ 'AcceptSelection("t")': ['<c-t>'],
    " \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    " \ 'ToggleFocus()':        ['<s-tab>'],
    " \ 'ToggleRegex()':        ['<c-r>'],
    " \ 'ToggleByFname()':      ['<c-d>'],
    " \ 'ToggleType(1)':        ['<c-up>'],
    " \ 'ToggleType(-1)':       ['<c-down>'],
    " \ 'PrtExpandDir()':       ['<tab>'],
    " \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    " \ 'PrtInsert()':          ['<c-\>'],
    " \ 'PrtCurStart()':        ['<c-a>'],
    " \ 'PrtCurEnd()':          ['<c-e>'],
    " \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    " \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    " \ 'PrtClearCache()':      ['<F5>'],
    " \ 'PrtDeleteEnt()':       ['<F7>'],
    " \ 'CreateNewFile()':      ['<c-y>'],
    " \ 'MarkToOpen()':         ['<c-z>'],
    " \ 'OpenMulti()':          ['<c-o>'],
    " \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    " \ }
" PyMatcher for CtrlP
"if !has('python')
"    echo 'In order to use pymatcher plugin, you need +python compiled vim'
"else
"    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"endif

" Set delay to prevent extra search
"let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
" let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

"command-t
" nmap <leader>ct :CommandT<CR>
" set wildignore+=*.o,*.obj,.git,.svn,*.a,*.obj,*.cmd,*png,*so
" let g:CommandTMaxFiles=30000

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_WinWidth = 35 
let Tlist_Display_Prototype = 0
call s:Loadtags(1, 0)
" map <f10> :TlistToggle<cr>
set updatetime=100
map <f10> :TagbarToggle<cr>


"nmap <silent> <leader>lv :vimgrep /<c-r>=expand("<cword>")<cr>/ %<cr>:botright open<cr>


if has("win32")
    "grep setting
    "nnoremap <silent> <F4> :Grep<CR>
    nnoremap <silent> <F4> :Rgrep<CR> 
    "let Grep_Default_Filelist = '*.c *.cpp *.hpp *.h *.s *.inc *.INC *.C *.S'
    let Grep_Path =  'D:/cygwin/bin/grep.exe'
    let Fgrep_Path = 'D:/cygwin/bin/fgrep.exe'
    let Egrep_Path = 'D:/cygwin/bin/egrep.exe'
    let Agrep_Path = 'D:/cygwin/bin/agrep.exe'
    let Grep_Find_Path = 'D:\cygwin\bin\find.exe'
    let Grep_Xargs_Path = 'D:\cygwin\bin\xargs.exe'
    let Grep_Default_Options = '-i'
    let Grep_Shell_Quote_Char = "'" 
    "let Grep_Shell_Escape_Char = '"' 
endif
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .project lib obj linux_lsp linux_devkit'
let Grep_Skip_Files = '*.bak *.o *.a *.obj *.out *.oe674 *.pch *.sem3 *.oem3 *.map *.apk GTAGS GRTAGS GPATH filenametags cscope*'
"fix grep on C/CPP with Binary file xxx matches for ArchLinux grep 2.21
" let g:Grep_Default_Options="-a"

function! SaveSession()
    exec "set sessionoptions-=curdir"
    exec "set sessionoptions+=sesdir"
    exec "mksession! ".s:ProjectDir."/project.vim"
    exec "wviminfo! ".s:ProjectDir."/project.viminfo"
endfunction

function! LoadSession()
    exec "source ".s:ProjectDir."/project.vim"
    exec "rviminfo ".s:ProjectDir."/project.viminfo"
    call s:Loadtags(1, 1)
endfunction

"session
nmap <leader>ss :call SaveSession()<cr>
" nmap <leader>ss :set sessionoptions-=curdir<cr>:set sessionoptions+=sesdir<cr>:mksession! eval(s:ProjectDir)."/project.vim"<cr>:wviminfo! eval(s:ProjectDir)."project.viminfo"<cr>
"nmap <silent> <leader>ls :source project.vim<cr>:rviminfo project.viminfo<cr>:cs add cscope.out<cr>:set tags=tags<cr>:let g:LookupFile_TagExpr = '"./filenametags"'<cr>:source $VIMRUNTIME/../vimfiles/plugin/mark.vim<cr>
"nmap <leader>ls :source project.vim<cr>:rviminfo project.viminfo<cr>:cs add cscope.out<cr>:set tags=tags<cr>:let g:LookupFile_TagExpr = '"./filenametags"'<cr>:source $HOME/.vim/bundle/mark/plugin/mark.vim<cr>
nmap <leader>ls :call LoadSession()<cr>

"nmap <leader>sp :set paste<cr>
"nmap <leader>np :set nopaste<cr>

if has("win32")
    map <silent> <leader>s :source $HOME/_vimrc<cr>
    map <silent> <leader>e :e $HOME/_vimrc<cr>
else
    "Fast reloading of the _vimrc
    map <silent> <leader>s :source $HOME/.vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>e :e $HOME/.vimrc<cr>
endif

if has("win32")
    autocmd! bufwritepost .vimrc source $HOME/_vimrc
else
    "When vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source $HOME/.vimrc
endif

map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <leader>bd :Bclose<cr>
"map <leader>bd :bd<cr>
vnoremap <leader>y "+y
nmap <leader>yw "+yw
nmap <leader>p "+p

"yankring
nnoremap <silent> <leader>ys :YRShow<CR>
" let g:yankring_history_file = './work/yankring_history'
"
function! UpdateDateTags()

    echomsg "update ...!"
    if filereadable(s:ProjectDir."/tags")
        echomsg "update tags...!"
        " exec ":silent !ctags -L ".s:ProjectDir."/cscope.files -f ".s:ProjectDir."/tags"
        exec ":silent !ctags -L ".s:ProjectDir."/cscope.files -f ".s:ProjectDir."/tags"
    exec ":silent !ctags --c++-kinds=+p --fields=+iaS --extra=+q -L ".s:ProjectDir."/cscope.files -f ".s:ProjectDir."/tags"
        exec ":redraw!"
    endif

    if filereadable(s:ProjectDir."/GTAGS")
        echomsg "update gtags"
        exec ":silent !gtags -f ".s:ProjectDir."/cscope.files -i ".s:ProjectDir
        exec ':silent cs reset'
        exec ":redraw!"
    elseif filereadable(s:ProjectDir."/cscope.out")
        echomsg "update cscope"
        exec ":silent !mv ".s:ProjectDir."/cscope.* ./"
        exec ":silent !cscope -bkq -i cscope.files"
        echomsg "!mv cscope.* ".s:ProjectDir
        exec ":redraw!"
        exec ":silent !mv cscope.* ".s:ProjectDir
        exec ':silent cs reset'
        exec ":redraw!"
    endif
endfunction

" nmap <F9> :call UpdateDateTags()<CR>
nmap <F9> :!cscope -bkq -i cscope.files -f cscope.out<CR>:cs reset<CR>
"nmap <F9> :!gtags -f cscope.files -i<CR>:cs reset<CR>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"Mark
nmap <Leader>M <Plug>MarkToggle 
nmap <Leader><SPACE> <Plug>MarkAllClear

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
"nmap <silent> <leader>mk :MarksBrowser<cr>
"
""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

let g:clang_complete_auto=1 "don't auto do clang_complete
let g:clang_hl_errors = 0
if !filereadable(s:ProjectDir."/project-setting.vim") "工程配置文件的名字
    let g:clang_use_library = 1 "applications
endif
let g:clang_auto_select = 1

" let g:clang_library_path = '/usr/lib/llvm'
" let g:clang_library_path = '/usr/lib'
let g:clang_library_path = '/usr/lib/llvm-3.4/lib'
" let g:clang_library_path = '/usr/local/lib'
let g:clang_complete_copen = 1 
let g:clang_complete_macros = 0
let g:clang_complete_patterns = 0
let g:clang_sort_algo = ''
let g:clang_auto_user_options = '.clang_complete'
nmap <silent> <leader>Q :call g:ClangUpdateQuickFix()<cr>
nmap <silent> <leader>C :let g:clang_complete_auto=!g:clang_complete_auto<cr>

augroup filetypedetect
    au BufNewFile,BufRead *.bld setf javascript
augroup END

augroup filetypedetect
    au BufNewFile,BufRead *.make setf make
augroup END
"let g:clang_user_options = '|| exit 0"'
"if has("win32")
    "let g:clang_user_options = '2> NUL || exit 0"'
"else
    "let g:clang_user_options = '2> /dev/null || exit 0"'
"endif

" let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1

let g:rainbow_active = 1 
let g:rainbow_guifgs = ['DarkOrchid3', 'RoyalBlue3', 'SeaGreen3', 'DarkOrange3', 'FireBrick',]
let g:rainbow_ctermfgs = [
            \ 'Lightgray', 'Lightblue', 'Lightmagenta',
            \'Lightcyan', 'Lightred', 'Lightgreen', ]
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['Lightgray', 'Lightblue', 'Lightmagenta', 'Lightcyan'],
	\	'operators': '_,_',
	\	'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
	\	'separately': {
	\		'*': {},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\			'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
	\		},
	\		'html': {
	\			'parentheses': [['(',')'], ['\[','\]'], ['{','}'], ['<\a[^>]*[^/]>\|<\a>','</[^>]*>']],
	\		},
	\		'tex': {
	\			'operators': '',
	\			'parentheses': [['(',')'], ['\[','\]']],
	\		},
	\	}
	\}
" rainbow_parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"Align
map <Leader>fa <Plug>AM_afnc
map <Leader>dc <Plug>AM_adec
map <Leader>df <Plug>AM_adef
map <Leader>dt <Plug>AM_tt
map <leader>dm <Plug>AM_m=

"自动补全括号
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
nmap <F8> :%s/$//g <CR>
"------------------------------------------
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1 

let g:ctrlp_extensions = ['funky']
"------------------------------------------
