set nu
"使用以下指令可以開啟vim的程式碼語法高亮功能
syntax enable
set sc

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
filetype off
"基本配置
set wildmenu
"增强模式中的命令行自动完成操作
set foldmethod=manual
"实现C程序的缩进
set sw=4
"设计(自动) 缩进使用4个空格
set sta
"插入时使用'shiftwidth'
set backspace=2
"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
"設定vim記錄已執行指令的數量上限
"set history=1000

"set nocp
set rtp+=~/.vim/bundle/Vundle.vim
"開啟指令暫存提示之後，vim才可以在底部顯示目前使用的操作模式是一般、插入、取代還是選取模式
set showmode
"開啟指令暫存提示之後，vim就可以在右下角顯示使用者之前輸入的指令
set showcmd
"開啟自動換行之後，若一行的文字長度超過vim所能顯示的範圍，就會換行顯示。建議與顯示行號功能一起使用
set wrap
"開啟自動存檔之後，當vim編輯器失去焦點，就會自動存檔
"set autowrite
"set autoindent
"set smartindent
set cindent
set tabstop=4
set softtabstop=4
"將TAB擴展功能開啟之後，在vim插入的「TAB」字元就可以被擴展成一個或是多個空格
"如果要插入原本的「TAB」字元，可以先按下Ctrl + v，再按下Tab鍵
set expandtab
"如果要設定原本自動縮排產生的字元寬度，則需要使用「shiftwidth」這個環境變數來決定其「TAB」字元和用來擴展的空格字元所組合而成的字元寬度
set shiftwidth=4
"vim可以透過「backspace」環境變數，設定其在編輯模式下，鍵盤上「backspace」鍵的功能
"indent」表示允許使用「backspace」鍵來刪除縮排；「eol」表示允許使用「backspace」來刪除換行字元，使其可以退回至上一行；「start」表示允許使用「ctrl+w」和「ctrl+u」快速鍵來刪除獨立詞語和同類字元(縮排、非縮排字元)
"set backspace=indent,eol,start
"上面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
set copyindent
set number
set showmatch
"使用以下指令可以開啟vim的忽略大小寫搜尋
set ignorecase
"如果「smartcase」和「ignorecase」都被開啟，此時搜尋「the」，則「THE」、「tHE」、「The」...等子字串都算是符合搜尋條件；但搜尋「The」，則只有「The」符合搜尋條件。
set smartcase
set smarttab
set scrolloff=4
set virtualedit=all
"使用以下指令可以開啟vim的搜尋結果高亮提示
set hlsearch
"輸入搜尋樣本的期間就會開始進行搜尋了，不用等到樣本全部輸入完成
set incsearch
"set fileencodings=utf-8,gb18030,utf-16,big5
set laststatus=2
set cursorline
set cursorcolumn
"使用以下指令可以開啟vim的右下角游標座標顯示
set ruler
set re=1
set ttyfast
set lazyredraw
set background=dark
"vim可以透過「fileencodings」環境變數，設定其在開啟文字檔時要優先使用什麼字元編碼方式來開啟。但前提是它在編譯前要先設定好有支援「multi_byte」功能。可以在「.vimrc」檔案中撰寫以下判斷式來判斷vim有無支援「multi_byte」功能
if has("multi_byte")

else
    echoerr "If +multi_byte is not included, you should compile Vim with big features."
endif
"用"+y 代替y将选中的内容复制到系统剪贴板，效果和ctrl-c一致。
"用"+p代替p将剪贴板内容复制到指定位置，也可以用ctrl-v
"如果想偷懒用y直接把内容复制到系统剪贴板，需要到vim配置文件.vimrc里加一行属性。用下面命令开始配置
set clipboard=unnamed

""""""""""""""""""""""""""""""开启vim 24-bit真彩色"""""""""""""""""""""""""""
if has("termguicolors")
    " fix bug for vim
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
endif
""""""""""""""""""""""""""""""开启vim 24-bit真彩色"""""""""""""""""""""""""""

"我們可以依照自己經常接觸的字元編碼和它們個別涵蓋的字元範圍及嚴謹程度來排列出嘗試解碼的順序，並設定給「fileencodings」環境變數儲存
"set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1

"colorscheme slate
"colorscheme ron
"colorscheme peachpuff
"colorscheme murphy
"colorscheme koehler
"colorscheme elflord
"colorscheme default
"colorscheme torte

imap jk <esc>
nmap == :normal gg=G <CR><CR>
"nmap -- :CtrlSF<CR>
nmap -- :Ag <c-r>=expand("<cword>")<cr>
packloadall
silent! helptags ALL
autocmd FileType make,txt set noexpandtab
"set noexpandtab

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
    " else add the database pointed to by environment
    " variable
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"vim可以透過「statusline」環境變數，設定其狀態列的文字格式。
"其中，「%t」代表檔案名稱；「%F」代表檔案路徑；「%y」代表檔案類型；
"「%=」代表左右分隔；「%c」代表目前游標所在的行號；「%l」代表目前游標所在的列號；
"「%L」代表總列數；「%p」代表目前瀏覽位置的進度百分比
set statusline=[%{expand('%:p')}][%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%{FileSize()}%{IsBinary()}%=%c,%l/%L\ [%3p%%]

function IsBinary()
    if (&binary == 0)
        return ""
    else
        return "[Binary]"
    endif
endfunction

function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

















" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/taglist.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'flazz/vim-colorschemes'
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'w0rp/ale'

Plug 'dyng/ctrlsf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'

Plug 'Shougo/unite.vim'
Plug 'nvie/vim-flake8'
"插件管理器 plug
"补全框架
"安装coc.nvim 依赖 vim 8.0 或者 noevim
"主页 https://github.com/neoclide/coc.nvim Plug 'neoclide/coc.nvim', {'branch': 'release'}
"lsp for c family : ccls Ubuntu 安装
"sudo apt update
"sudo apt install snapd
"sudo sanp install ccls --classic
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" if your vim version < 8.0
Plug 'tpope/vim-dispatch'
" if you don't have an :Ack (or :Ag) liked command
"Plug 'mileszs/ack.vim'

"Plug 'lyuts/vim-rtags'
" Initialize plugin system

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

" (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'
Plug 'flazz/vim-colorschemes'
Plug 'rking/ag.vim'
Plug 'Rip-Rip/clang_complete'
"
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'jacoborus/tender.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
call plug#end()


""""""""""""""""""""""""""""""""""vim-instant-markdown start""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8876
"let g:instant_markdown_python = 1
let g:instant_markdown_browser = "google-chrome --new-window"
""""""""""""""""""""""""""""""""""vim-instant-markdown end""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""for easy open :CocConfig start""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"To enable highlight current symbol on CursorHold, add:
"To disable coc provide color highlight, add:
""coc.preferences.colorSupport": false,
"to your settings.json.
"To pick a different color, use command:   call CocAction('pickColor')
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc, To get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
" cannon: if set yes, there will be another empty column beside the "set
" number" column, it will lead an inconvenience to copy multi-line from vim
" editor using mouse. If set yes, you'd better copy vim multi-lines use
" ("+$nyy) to copy it to paster, therefore, I'd like to set it to "no"
set signcolumn=no

"""""""""""""""""""使用tab补全""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"""""""""""""""""""使用tab补全""""""""""""""""""""""""""""

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-\> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
"跳转到上一个错误处
nmap <silent> [g <Plug>(coc-diagnostic-prev)
"跳转到下一个错误处
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
nmap grn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
xmap gf  <Plug>(coc-format-selected)
nmap gf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
"nmap gac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_start_at_startup=1
""""""""""""""""""""""""""""""""""""for easy open :CocConfig end""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme molokai
colorscheme molokai    "red+green+brown   "the previous used
"colorscheme default "red+green+brown
"colorscheme torte
"
"""""""""""""""""tender colorscheme""""""""""""""""""""""""""""
"colorscheme tender
"" set lighline theme inside lightline config
"let g:lightline = { 'colorscheme': 'tender' }
"" set airline theme
"let g:airline_theme = 'tender'
"let macvim_skip_colorscheme=1
"""""""""""""""""tender colorscheme""""""""""""""""""""""""""""

let Tlist_Ctags_Cmd="ctags"

let g:ag_prg="/usr/bin/ag --vimgrep"
let g:ag_working_path_mode="r"

"clang_complete begin
" path to directory where library can be found
let g:clang_library_path="/opt/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04/lib"
 " or path directly to the library file
 "clang_complete end
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'

"let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:ackprg = 'ag --nogroup --column'

"let g:LanguageClient_loadSettings = 1
"let g:LanguageClient_diagnosticsEnable = 0
"let g:LanguageClient_settingsPath = expand('~/.vim/languageclient.json')
"let g:LanguageClient_selectionUI = 'quickfix'
"let g:LanguageClient_diagnosticsList = v:null
"let g:LanguageClient_hoverPreview = 'Never'
"let g:LanguageClient_serverCommands = {}
"let g:LanguageClient_serverCommands.c = ['cquery']
"let g:LanguageClient_serverCommands.cpp = ['cquery']
"noremap <leader>rd :call LanguageClient#textDocument_definition()<cr>
"noremap <leader>rr :call LanguageClient#textDocument_references()<cr>
"noremap <leader>rv :call LanguageClient#textDocument_hover()<cr>

nnoremap <C-p> :Files<CR>
nnoremap <C-j> :TlistToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <c-U> :Ag<space>
"nnoremap <c-U> :Ag <C-R><C-W>
"map <C-F12> :ctags -R --languages=c++ --langmap=c++:+.cc -h +.inl --c++-kinds=+px --fields=+iaKSz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc -f tags .<CR>
map <C-k> :!ctags -R --languages=c++ --langmap=c++:+.cc -h +.inl --c++-kinds=+px --fields=+iaKSz --extra=+q -f tags .<CR>

" 用于最大模拟vim最大化窗口的
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        "restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <C-w>z :call Zoom()<CR>

"""""""""""""""""""""""""""""智能判断光标就近位置""""""""""""""""""""""""""""""""
"这个实现的是像emacs那样智能切换光标在窗口中的位置(上/中/下)，
"其实就是根据光标在窗口中的当前位置，就近的选择上中下，执行对应的命令zt/zz/zb
fun! Redraw()
  let l = winline()
  let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
  return cmd
endf

nnoremap <expr><c-l> Redraw()
"""""""""""""""""""""""""""""智能判断光标就近位置""""""""""""""""""""""""""""""""

"""""""""""""""""""""""翻转set nu/setnonu begin"""""""""""""""""""""""""""""""""""""
noremap <silent> <F12> :set number!<CR>
"""""""""""""""""""""""翻转set nu/setnonu end"""""""""""""""""""""""""""""""""""""

" 補齊括弧
" 語法
" inoremap  triger_char  mapping_str
" 映射指令     觸發字元     映射字串
"
" 註：<LEFT> 為向右鍵字元
"小括號補齊，並將輸入游標左移一個字元
" inoremap ( ()<LEFT>
"inoremap ( ()<ESC>i
"中括號補齊，並將輸入游標左移一個字元
"inoremap [ []<ESC>i
"大括號補齊，並將輸入游標左移一個字元
"inoremap{ {}<ESC>i<CR><ESC>O
"inoremap{ {}<ESC>i
"單引號補齊，並將輸入游標左移一個字元
" inoremap ' ''<LEFT>
"雙引號補齊，並將輸入游標左移一個字元
" inoremap " ""<LEFT>





"注意「highlight」或是「hi」指令應寫在「colorscheme」之後!!!!!!!!!!!!!!
"hi CursorLine cterm=none ctermbg=Black ctermfg=White
hi CursorLine cterm=none ctermbg=DarkGray ctermfg=White
"hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
"hi CursorLine cterm=none ctermbg=DarkRed ctermfg=White
"hi CursorLine cterm=none ctermbg=Red ctermfg=White
"hi CursorLine cterm=none ctermbg=Magenta ctermfg=White
"hi CursorLine cterm=none ctermbg=DarkBlue ctermfg=White
"

" show trailing white spaces
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" set vim background 透明
" 切记不必设置colorscheme中的任何内容，只需将以下内容添加到.vimrc中,
" 也就是关闭colorschema设置, vim透明背景才能生效
hi Normal ctermfg=252 ctermbg=none
"hi Normal guibg=NONE ctermbg=NONE

"必须得放在所有设置主题的最后面，否则会不显示颜色
source /home/cannon/.vim/autoload/mark.vim

