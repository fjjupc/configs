set encoding=utf-8

syntax on

set guifont=Courier_New:h15:cANSI
set guioptions-=T

colorscheme elflord

" Plugins
call plug#begin()

Plug 'junegunn/vim-easy-align'

Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-preview'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'vim-scripts/taglist.vim'

Plug 'ludovicchabant/vim-gutentags'

Plug 'mhinz/vim-signify'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Yggdroot/LeaderF'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete-clangx'

call plug#end()


let g:python3_host_prog = 'C:\Users\Carl\AppData\Local\Programs\Python\Python37\python.exe'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('clangx', 'clang_binary', 'C:\Program Files\LLVM\bin\clang.exe')
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')

set hlsearch

set cscopetag
set cscopeprg='gtags-cscope'
set cscopequickfix=s-,c-,d-,i-,t-,e-
" gtags.vim
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1


set tags=./.tags;,.tags

let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = 'C:\Program Files\gtags\share\gtags\gtags.conf'

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
" nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"Tag list(ctags)
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
