set nu
"使用以下指令可以開啟vim的程式碼語法高亮功能
syntax enable
set sc
set clipboard=unnamedplus
if $TERM == "xterm" || $TERM == "rxvt" || $TERM == "xterm-256color" || $TERM == "rxvt-unicode" || &term =~ "builtin_gui" || $TERM == "dumb"
  set t_Co=256
endif
set t_Co=256
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

" ============================================
" 终端按键响应优化
" 解决：ESC退出延迟、[b等双键映射不跟手
" ============================================
set timeoutlen=300          " 映射序列超时（如 [b），默认1000ms太长
set ttimeoutlen=10          " 终端键码超时，根治 ESC 退出延迟
" 选配：若终端老旧/功能键异常，可改大 ttimeoutlen：
" set ttimeoutlen=100
" 选配：若常按错多键映射，可改大 timeoutlen：
" set timeoutlen=500

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
set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
"设置vim内部使用的编码为 UTF - 8，确保 Vim 在处理文本时使用统一的编码。
set encoding=utf-8
"指定了 Vim 在保存文件时使用 UTF - 8 编码.无论打开的文件是什么编码，保存时都会以 UTF - 8 格式保存
set fileencoding=utf-8
set termencoding=utf-8

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

Plug 'jacoborus/tender.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}
" coc-sh bash-languageserver
Plug 'prabirshrestha/vim-lsp'
call plug#end()

" ============================================
" fzf 浮动窗口布局配置（Vim 8.2+ 生效）
" 作用：竖屏下避免 split 占满半屏，ESC 直接消失无窗口恢复卡顿
" 低版本 Vim 自动回退到默认 split，不会报错
" ============================================
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Normal' } }
" 选配：圆形边框风格（需终端支持 popup 边框绘制）
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'border': 'rounded' } }
" 选配：全屏居中显示
" let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.8, 'highlight': 'Normal' } }
" 选配：若 Vim < 8.2 且想自定义 split 方向，改用下面之一：
" let g:fzf_layout = { 'down': '40%' }
" let g:fzf_layout = { 'right': '40%' }


""""""""""""""""""""""""""""""""""vim-instant-markdown start""""""""""""""""""""""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''

" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" use a custom location for images
let g:mkdp_images_path = '${HOME}/.markdown_images'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 0

" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1

" when vim on server, and markdown display on local client
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '10.81.10.3'
let g:mkdp_port = 8090
let g:mkdp_echo_preview_url = 1
let g:mkdp_browser = 'none'
" using lemonade to open url from linux client to macos/windows server
function! g:Open_browser(url)
    silent exe '!lemonade open 'a:url
endfunction
" or just to echo url from linux and open url manually on macos/windows
function! g:EchoUrl(url)
    :echo a:url
endfunction
"https://github.com/lemonade-command/lemonade/blob/master/README.md
let g:mkdp_browserfunc = 'g:Open_browser'
"let g:mkdp_browserfunc = 'g:EchoUrl'
nmap [d <Plug>MarkdownPreview
"nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle
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

"" pydocstring config
nmap <silent> gab <Plug>(coc-codeaction-line)
xmap <silent> gab <Plug>(coc-codeaction-selected)
nmap <silent> gab <Plug>(coc-codeaction)
""""""""""""""""""""""""""""""""""""for easy open :CocConfig end""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme molokai
colorscheme molokai_dark
"colorscheme molokai    "red+green+brown   "the previous used
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

let g:ag_prg="/opt/homebrew/bin/ag --vimgrep"
let g:ag_working_path_mode="r"

"clang_complete begin
" path to directory where library can be found
let g:clang_library_path="/opt/LLVM-22.1.0-macOS-ARM64/lib"
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
nnoremap [b :Buffers<CR>
nnoremap [w :Windows<CR>
nnoremap [m :Marks<CR>
nnoremap [j :Jumps<CR>
nnoremap [c :Colors<CR>
nnoremap [s :noautocmd Ag<space>
nnoremap <C-j> :TlistToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <c-U> :Ag <C-R><C-W>
"map <C-F12> :ctags -R --languages=c++ --langmap=c++:+.cc -h +.inl --c++-kinds=+px --fields=+iaKSz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc -f tags .<CR>
map <C-k> :!ctags -R --languages=c++ --langmap=c++:+.cc -h +.inl --c++-kinds=+px --fields=+iaKSz --extra=+q -f tags .<CR>
" <leader>默认是'\'键
" 希望替换 \t 时，自动匹配 Vim 的 tabstop 配置（比如 tabstop=4 就替换成 4 个空格），需要用 Vim 的表达式替换，而非固定写空格数
nnoremap <leader>c :%s/\t/\=repeat(' ', &tabstop)/ge<CR>:%s/\s\+$//e<CR>:noh<CR>

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


"""""""""""""""""""""""""""""For Vim 8 or later install the plugin prabirshrestha/vim-lsp and add the following configuration to .vimrc""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""begin:userd for coc-sh""""""""""""""""""""""""""""""""
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'allowlist': ['sh'],
        \ })
endif
"""""""""""""""""""""""""""""end:userd for coc-sh""""""""""""""""""""""""""""""""

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
hi Search term=bold,reverse,underline cterm=bold,underline ctermfg=0 ctermbg=121 gui=bold guifg=bg guibg=LightGreen


""""""""""""""""""""""""""""""""""新建文件增加注释begin"""""""""""""""""""""""""""""""""""""""""
" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
" autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()"
autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.java,*.py,*.sh,*.js exec ":call SetTitle()"
autocmd BufRead,BufNewFile *.lst set filetype=text
" 加入注释
func SetComment()
	call setline(1,"/*================================================================")
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
	call append(line(".")+1, "*")
	call append(line(".")+2, "*   File Name     ：".expand("%:t"))
	call append(line(".")+3, "*   Author        ：Wenbing.Wang")
	call append(line(".")+4, "*   Created Time  ：".strftime("%Y-%m-%d"))
	call append(line(".")+5, "*   Description   ：")
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/")
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc
" 加入js注释
func SetComment_js()
    call setline(1, "//================================================================")
    call setline(2, "//   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call setline(3, "//")
    call setline(4, "//   File Name      : ".expand("%:t"))
    call setline(5, "//   Author         : Wenbing.Wang")
    call setline(6, "//   Created Time   : ".strftime("%Y-%m-%d"))
    call setline(7, "//   Description    : ")
    call setline(8, "//")
    call setline(9, "//================================================================")
    call setline(10, "")
    call setline(11, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
	call setline(3, "#================================================================")
	call setline(4, "#   Copyright (C) ".strftime("%Y")." All rights reserved.")
	call setline(5, "#")
	call setline(6, "#   File Name      ：".expand("%:t"))
	call setline(7, "#   Author         ：Wenbing.Wang")
	call setline(8, "#   Created Time   ：".strftime("%Y-%m-%d"))
	call setline(9, "#   Description    ：")
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
endfunc
" 定义函数SetTitle，自动插入文件头
func SetTitle()
	if &filetype == 'make'
		call setline(1,"")
		call setline(2,"")
		call SetComment_sh()

	elseif &filetype == 'js'
		call SetComment_js()
	elseif &filetype == 'sh'
		call setline(1,"#! /bin/bash")
		call setline(2,"")
		call SetComment_sh()
	else
	     call SetComment()
	     if expand("%:e") == 'hpp'
		  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
		  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
		  call append(line(".")+12, "#ifdef __cplusplus")
		  call append(line(".")+13, "extern \"C\"")
		  call append(line(".")+14, "{")
		  call append(line(".")+15, "#endif")
		  call append(line(".")+16, "")
		  call append(line(".")+17, "#ifdef __cplusplus")
		  call append(line(".")+18, "}")
		  call append(line(".")+19, "#endif")
		  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H")

	     elseif expand("%:e") == 'h'
	  	call append(line(".")+10, "#pragma once")
	     elseif &filetype == 'c'
	  	call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
	     elseif &filetype == 'cpp'
	  	call append(line(".")+10, "#include \"".expand("%:t:r").".hpp\"")
	    elseif &filetype == 'cc'
            call append(line(".")+10, "#include \"".expand("%:t:r").".hpp\"")
        elseif &filetype == 'python'
            call setline(1, "\#coding=utf-8")
            call setline(2, "\"\"\"")
            call setline(3, "\# Author: Wenbing.Wang")
            call setline(4, "\# Created Time : ".strftime("%c"))
            call setline(5, "")
            call setline(6, "\# File Name: ".expand("%"))
            call setline(7, "\# Description:")
            call setline(8, "")
            call setline(9, "\"\"\"")
            call setline(10,"")
        elseif &filetype == 'java'
            call setline(1, "//coding=utf-8")
            call setline(2, "/*************************************************************************")
            call setline(3, "\ @Author: Wenbing.Wang")
            call setline(4, "\ @Created Time : ".strftime("%c"))
            call setline(5, "")
            call setline(6, "\ @File Name: ".expand("%"))
            call setline(7, "\ @Description:")
            call setline(8, "")
            call setline(9, " ************************************************************************/")
            call setline(10,"")
	    endif
	endif
endfunc
""""""""""""""""""""""""""""""""""新建文件增加注释end"""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""fzf colors change & load mark.vim start"""""""""""""""""""""""""""""""""""""""""
" 定义s:RGB 的函数
function! s:RGB(r, g, b)
  return a:r * 36 + a:g * 6 + a:b + 16
endfunction

" 创建一个函数，用于重新加载 mark.vim 的颜色配置
function! ReloadMarkVimColors()
    " default colors/groups
    " you may define your own colors in you vimrc file, in the form as below:
    if &t_Co < 256
        hi MarkWord1 guifg=White ctermfg=White guibg=#FF0000 ctermbg=Red
        hi MarkWord2 guifg=Black ctermfg=Black guibg=#FFD700 ctermbg=Yellow
        hi MarkWord3 guifg=Black ctermfg=Black guibg=#5FD700 ctermbg=Green
        hi MarkWord4 guifg=Black ctermfg=Black guibg=#00D7FF ctermbg=Cyan
        hi MarkWord5 guifg=White ctermfg=White guibg=#0087FF ctermbg=Blue
        hi MarkWord6 guifg=White ctermfg=White guibg=#AF00FF ctermbg=Magenta
        hi MarkWord7 guifg=Black ctermfg=Black guibg=#FF87AF ctermbg=LightGray
        hi MarkWord8 guifg=Black ctermfg=Black guibg=#FF5F00 ctermbg=LightGreen
        hi MarkWord9 guifg=White ctermfg=White guibg=#8700FF ctermbg=Brown
        hi MarkWord10 guifg=Black ctermfg=Black guibg=#5FAFFF ctermbg=LightBlue
    else
        exec "hi MarkWord1 guifg=White ctermfg=White guibg=#FF0000 ctermbg=".s:RGB(5,0,0)
        exec "hi MarkWord2 guifg=Black ctermfg=Black guibg=#FFD700 ctermbg=".s:RGB(5,4,0)
        exec "hi MarkWord3 guifg=Black ctermfg=Black guibg=#5FD700 ctermbg=".s:RGB(1,4,0)
        exec "hi MarkWord4 guifg=Black ctermfg=Black guibg=#00D7FF ctermbg=".s:RGB(0,4,5)
        exec "hi MarkWord5 guifg=White ctermfg=White guibg=#0087FF ctermbg=".s:RGB(0,2,5)
        exec "hi MarkWord6 guifg=White ctermfg=White guibg=#AF00FF ctermbg=".s:RGB(3,0,5)
        exec "hi MarkWord7 guifg=Black ctermfg=Black guibg=#FF87AF ctermbg=".s:RGB(5,1,3)
        exec "hi MarkWord8 guifg=Black ctermfg=Black guibg=#FF5F00 ctermbg=".s:RGB(5,2,0)
        exec "hi MarkWord9 guifg=White ctermfg=White guibg=#8700FF ctermbg=".s:RGB(2,0,5)
        exec "hi MarkWord10 guifg=Black ctermfg=Black guibg=#5FAFFF ctermbg=".s:RGB(1,3,5)
    endif
endfunction

" 监听颜色方案切换事件，在切换后重新加载 mark.vim 颜色配置
autocmd ColorScheme * call ReloadMarkVimColors()

" ============================================
" 搜索工具：优先使用 rg，回退到 ag/fd/find
" ============================================
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --smart-case '
        \ . '-g "!.git/" '
        \ . '-g "!.*tags" -g "!tags" -g "!TAGS" '
        \ . '-g "!__pycache__/" -g "!*.pyc" -g "!*.pyo" '
        \ . '-g "!.ccls-cache/" -g "!.ccls" '
        \ . '-g "!*.o" -g "!*.d" -g "!*.a" -g "!*.so" -g "!*.obj" -g "!*.elf" '
        \ . '-g "!*.swp" -g "!*.swo" -g "!*~" '
        \ . '-g "!build/" -g "!out/" -g "!dist/" '
        \ . '-g "!.cache/" -g "!.tmp/" '
        \ . '-g "!compile_commands.json" '
        \ . '-g "!node_modules/" -g "!*.egg-info"'

    " :Rg 文本搜索同样排除
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '
        \   . '-g "!*.o" -g "!*.d" -g "!build/" -g "!.cache/" -g "!*.swp" -g "!.ccls-cache/" '
        \   . shellescape(<q-args>), 1,
        \   fzf#vim#with_preview(), <bang>0)
else
    " 回退到 ag（上面方案一的配置放这里）
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --nocolor ...（同上）'
endif

" coc 文件搜索也同步排除，避免 :Files 干净了但 coc 还显示垃圾
if executable('rg')
    call coc#config('list.source.files', {
        \ 'command': 'rg',
        \ 'args': ['--files', '--hidden', '--follow'],
        \ 'excludePatterns': [
        \   '**/.git/**', '**/build/**', '**/out/**', '**/dist/**',
        \   '**/.cache/**', '**/.ccls-cache/**', '**/__pycache__/**',
        \   '**/node_modules/**', '**/*.egg-info/**',
        \   '**/*.o', '**/*.d', '**/*.a', '**/*.so', '**/*.obj',
        \   '**/*.swp', '**/*.swo', '**/*~', '**/*.pyc',
        \   '**/compile_commands.json', '**/tags', '**/TAGS'
        \ ]
        \ })
endif

" 修复 tmux/screen 粘贴阶梯缩进
if &term =~ "tmux" || &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    let &t_PS = "\e[200~"
    let &t_PE = "\e[201~"
endif

""""""""""""""""""""""""""""""""""fzf colors change & load mark.vim end"""""""""""""""""""""""""""""""""""""""""
"必须得放在所有设置主题的最后面，否则会不显示颜色
source ${HOME}/.vim/autoload/mark.vim
let g:mw_state = 1               " 确保启动时标记可见
let g:loaded_mark = 1            " 避免重复加载

