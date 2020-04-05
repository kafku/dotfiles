filetype plugin on
set tabstop=4
set shiftwidth=4
syntax on
set wildmenu
set showcmd
set backspace=indent,eol,start
set autoindent
set smartindent
function! s:ExCr()
	let l:a = getline('.')
	let l:cur_pos = col('.')
	if l:a[cur_pos-2] == '{' && l:a[cur_pos-1] == '}'
		return "\<CR>\<Up>\<End>\<CR>"
	else
		return "\<CR>"
	endif
endfunction

set nostartofline
set visualbell
set t_vb=
set ruler
"set mouse=a
set cmdheight=2
set number
set laststatus=2
set hidden
set cursorline
highlight cursorline term=reverse cterm=none ctermbg=234
set cursorcolumn
highlight cursorcolumn ctermbg=234
highlight LineNr ctermbg=235 ctermfg=248
highlight Pmenu ctermfg=7 ctermbg=238
highlight PmenuSel ctermfg=0 ctermbg=186
set ignorecase
set smartcase
set confirm
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set wildmode=list:longest
set nowrap

" better indentation
vnoremap < <gv
vnoremap > >gv

" remove trailing whitespace
autocmd BufWritePre *.py call TrimEndLines()

" remove empty lines / python
function TrimEndLines()
	let save_cursor = getpos(".")
	:silent! %s#\($\n\s*\)\+\%$##
	call setpos('.', save_cursor)
endfunction

if has('multi_byte_ime') || has('xim')
	highlight Cursor guifg=NONE guibg=White
	highlight CursorIM guifg=NONE guibg=DarkRed
endif

set nofoldenable
set foldmethod=manual
set list listchars=tab:\|\ |
highlight Specialkey ctermfg=233

map Y y$

" tab setting
autocmd FileType c,cpp  setlocal ts=2 sw=2 sts=2 et
autocmd FileType r,rnoweb,rdoc,rhelp,rrst,rmd  setlocal ts=2 sw=2 sts=2 et
autocmd BufRead,BufNewFile *.py,*.pyx setlocal tabstop=4 softtabstop=4 shiftwidth=4 et



if has('vim_starting')
	if !isdirectory(expand('~/.vim/bundle/neobundle.vim/'))
		echo 'installing neobundle'
		:call system('git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim')
	endif

	set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle_default_git_protocol = 'https'
if neobundle#load_cache()
	NeoBundleFetch 'Shougo/neobundle.vim'

	NeoBundle 'simeji/winresizer'
	NeoBundle 'w0ng/vim-hybrid'
	NeoBundle 'nanotech/jellybeans.vim'
	NeoBundle 'tomasr/molokai'
	NeoBundle 'vim-scripts/Wombat'
	NeoBundle 'ntpeters/vim-better-whitespace'
	NeoBundle 'ervandew/screen'
	NeoBundle 'benmills/vimux'
	"NeoBundle 'jgors/vimux-ipy'
	NeoBundle 'julienr/vim-cellmode'
	NeoBundleLazy 'junegunn/vim-easy-align', {
	  \ 'autoload': {
	  \   'commands' : ['EasyAlign'],
	  \   'mappings' : ['<Plug>(EasyAlign)'],
	  \ }}
	"NeoBundleLazy 'tpope/vim-endwise', {
	"  \ 'autoload' : { 'insert' : 1,}}
	NeoBundle 'tpope/vim-fugitive'
	NeoBundleLazy 'cohama/agit.vim', {
		\ 'autoload': {'commands': 'Agit'}
		\ }
	NeoBundleLazy 'idanarye/vim-merginal', {
		\ 'depends' : 'tpope/vim-fugitive',
		\ 'autoload': {'commands': 'Merginal'}
		\ }
	NeoBundle 'tpope/vim-surround'
	NeoBundleLazy 'The-NERD-tree', {
		\ 'autoload': {'commands': 'NERDTreeToggle'}
		\ }
	NeoBundle 'The-NERD-Commenter'
	NeoBundle 'easymotion/vim-easymotion'
	NeoBundle 'Lokaltog/powerline-fonts'
	NeoBundle 'L9'
	NeoBundleLazy 'cohama/lexima.vim', {
		\ 'autoload': {
		\  'insert': 1
		\}}
	NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'linux' : 'make',
	\     'unix' : 'gmake',
	\    },
	\ }
	NeoBundleLazy 'Shougo/unite.vim', {
				\ 'autoload': {
				\  'commands': ['Unite']
				\ }}
	NeoBundle 'Shougo/neomru.vim'
	NeoBundle 'prabirshrestha/asyncomplete.vim'
	NeoBundle 'prabirshrestha/async.vim'
	NeoBundle 'prabirshrestha/vim-lsp'
	NeoBundle 'mattn/vim-lsp-settings'
	NeoBundle 'prabirshrestha/asyncomplete-lsp.vim'
	NeoBundle 'prabirshrestha/asyncomplete-buffer.vim'
	NeoBundle 'prabirshrestha/asyncomplete-file.vim'
	NeoBundle 'ryanolsonx/vim-lsp-python'
	NeoBundleLazy 'Shougo/neosnippet', {
	  \ 'depends' : 'Shougo/neosnippet-snippets',
	  \ 'autoload' : {
	  \   'insert' : 1,
	  \   'filetypes' : 'snippet',
	  \ }}
	NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundleLazy 'Shougo/vimshell', {
	  \ 'depends' : 'Shougo/vimproc.vim',
	  \ 'autoload' : {
	  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
	  \                 'VimShellExecute', 'VimShellInteractive',
	  \                 'VimShellTerminal', 'VimShellPop'],
	  \   'mappings' : ['<Plug>(vimshell_switch)']
	  \
	  \ }}
	NeoBundle 'itchyny/lightline.vim'
	NeoBundle 'Yggdroot/indentLine'
	NeoBundle 'YankRing.vim'
	NeoBundle 'undotree.vim'
	NeoBundle 'easybuffer.vim'
	NeoBundle 'dense-analysis/ale'
	NeoBundle 'maximbaz/lightline-ale'
	NeoBundleLazy 'thinca/vim-quickrun', {
	  \ 'autoload' : {
	  \   'commands' : ['QuickRun']
	  \ }}
	NeoBundle 'majutsushi/tagbar'
	NeoBundle 'vim-scripts/TasKList.vim'
	NeoBundle 'tagexplorer.vim'
	NeoBundle 'szw/vim-tags'
	NeoBundle 'thinca/vim-splash'
	NeoBundleLazy 'vim-jp/cpp-vim', {
		\ 'autoload':{
		\  'filetypes': ['cpp', 'hpp', 'h']
		\}}
	NeoBundle 'mattn/quickrunex-vim'
	NeoBundle 'tyru/open-browser.vim'
	NeoBundle 'mattn/webapi-vim'
	NeoBundle 'osyo-manga/unite-boost-online-doc'
	NeoBundle 'cocopon/colorswatch.vim'
	NeoBundle 'terryma/vim-multiple-cursors'
	NeoBundle 'AndrewRadev/linediff.vim'
	NeoBundle 'AndrewRadev/switch.vim'
	NeoBundle 'godlygeek/tabular'
	NeoBundle 'cespare/vim-toml'
	NeoBundleLazy 'plasticboy/vim-markdown',{
		\ 'autoload': {
		\  'filetypes': ['markdown']
		\ }}
	NeoBundleLazy 'kannokanno/previm', {
		\ 'autoload': {
		\  'commands': ['PrevimOpen'],
		\  'filetypes': ['markdown']
		\ },
		\ 'build': {
		\  'mac': "pip install docutils"
		\ }}
	NeoBundleLazy 'Rip-Rip/clang_complete', {
		\ 'autoload': {
		\  'filetypes': ['cpp', 'c', 'h', 'hpp'],
		\ }}
	NeoBundleLazy 'alepez/vim-gtest', {
		\ 'autoload': {
		\  'filetypes': ['cpp', 'h', 'hpp'],
		\ }}
	NeoBundleLazy 'heavenshell/vim-pydocstring', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml']
		\}}
	NeoBundleLazy 'alfredodeza/pytest.vim', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml']
		\}}
	NeoBundleLazy 'python_ifold', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml']
		\}}
	NeoBundleLazy 'lambdalisue/vim-django-support', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml']
		\}}
	NeoBundleLazy 'alfredodeza/pytest.vim', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml']
		\}}
	NeoBundleLazy 'Vimjas/vim-python-pep8-indent', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml'],
		\ }}
	NeoBundleLazy "jmcantrell/vim-virtualenv", {
		\ "autoload": {
		\   "filetypes": ["python", "python3", "djangohtml"],
		\ }}
	NeoBundleLazy "wilywampa/vim-ipython", {
		\ "autoload": {
		\   "filetypes": ["python", "python3", "djangohtml"]
		\ }}
	NeoBundleLazy 'elzr/vim-json', {
		\ 'autoload':{
		\  'filteypes': ['json']
		\ }}
	"NeoBundle 'rbtnn/rabbit-ui.vim'
	"NeoBundle 'rbtnn/rabbit-ui-collection.vim'
	NeoBundleLazy 'ekalinin/Dockerfile.vim', {
		\ 'autoload': {
		\}}
	NeoBundle 'airblade/vim-rooter'
	NeoBundleLazy 'wesleyche/SrcExpl',{
		\ 'autoload':{
		\  'commands':['SrcExplToggle']
		\}}
	NeoBundleLazy 'jalvesaq/Nvim-R',{
		\ 'autoload': {
		\  'filetypes': ['r', 'rnoweb', 'rdoc', 'rhelp', 'rrst', 'rmd' ]
		\ }}
	NeoBundleLazy 'mattn/emmet-vim', {
		\ 'autoload' : {
		\   'filetypes' : ['html', 'html5', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
		\   'commands' : ['<Plug>ZenCodingExpandNormal']
		\ }}
	NeoBundleLazy 'severin-lemaignan/vim-minimap', {
		\ 'autoload' : {
		\  'commands' : ['Minimap']
		\}}
	NeoBundleLazy 'vim-ruby/vim-ruby', {
		\ 'autoload' : {
		\   'filetypes' : ['ruby', 'eruby']
		\ }}
	NeoBundleLazy 'thinca/vim-ref', {
		\ 'autoload' : {
		\   'commands' : ['Ref'],
		\   'filetypes' : ['ruby']
		\ }}
	NeoBundleLazy 'tpope/vim-rails', {
		\ 'autoload' : {
		\   'filetypes' : ['ruby']
		\  }}
	NeoBundleLazy 'hail2u/vim-css3-syntax', {
		\ 'autoload' : {
		\  'filtypes' : ['css']
		\ }}
	NeoBundle 'othree/html5.vim'
	NeoBundle 'moll/vim-node'
	NeoBundleLazy 'pangloss/vim-javascript', {
		\ 'autoload' : {
		\  'fietypes' : ['javascript']
		\}}
	NeoBundle 'tmux-plugins/vim-tmux'
	NeoBundle 'tpope/vim-obsession'
	NeoBundleLazy 'chiphogg/vim-prototxt', {
		\ 'autoload' : {
		\  'fietypes' : ['prototxt']
		\ }}
	NeoBundle 'vim-scripts/DoxygenToolkit.vim'
	NeoBundle 'luochen1990/rainbow'
	NeoBundle 'embear/vim-localvimrc'
	"NeoBundle 'cjrh/vim-conda'

	NeoBundleSaveCache
endif
call neobundle#end()
filetype plugin indent on




"setups for colorscheme
colorscheme jellybeans
set colorcolumn=80
highlight ColorColumn ctermbg=234

"setups for each plugin follows
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
"inoremap <C-l> <RIGHT>
inoremap <C-h> <BackSpace>
nnoremap ; :


"setup for ervandew/screen ==================================================
"function! s:ScreenShellListener()
"  if g:ScreenShellActive
"    nmap <C-CR> :ScreenSend<cr>
"    nmap <C-CR> :ScreenQuit<cr>
"  else
"    nmap <C-CR> :ScreenShell<cr>
"  endif
"endfunction

"nmap <C-CR> :ScreenShell<cr>
"augroup ScreenShellEnter
"  autocmd User * call <SID>ScreenShellListener()
"augroup END
"augroup ScreenShellExit
"  autocmd User * call <SID>ScreenShellListener()
"augroup END

"setup for benmills/vimux ==================================================

"setup for NERD-tree =========================================================
nmap <F6> :NERDTreeToggle<CR>

"setup for lightline ==========================================================
let g:lightline = {
	\ 'colorscheme' : 'jellybeans',
	\ 'active':{
	\	'left' : [ ['mode', 'paste'], ['readonly', 'fugitive', 'filename', 'modified'], ['currenttag'] ],
	\	'right' : [ ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
	\  },
	\ 'component_function' : {
	\ 	'fugitive' : 'MyFugitive',
	\ 	'readonly' : 'MyReadonly',
	\ 	'modified' : 'MyModified',
	\ 	'currenttag' : 'MyCurrenttag'
	\  },
	\ 'component_expand' :{
	\ 	'linter_checking': 'lightline#ale#checking',
	\ 	'linter_infos': 'lightline#ale#infos',
	\ 	'linter_warnings': 'lightline#ale#warnings',
	\ 	'linter_errors': 'lightline#ale#errors',
	\ 	'linter_ok': 'lightline#ale#ok'
	\ },
	\ 'component_type' : {
	\ 	'linter_checking': 'right',
	\ 	'linter_infos': 'right',
	\ 	'linter_warnings': 'warning',
	\ 	'linter_errors': 'error',
	\ 	'linter_ok': 'right',
	\ }
\}

function! MyModified()
	if &filetype == "help"
		return ""
	elseif &modified
		return "+"
	elseif &modifiable
		return ""
	else
		return ""
	endif
endfunction

function! MyReadonly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return "RO"
	else
		return ""
	endif
endfunction

function! MyFugitive()
	if exists("*fugitive#head")
		let_ = fugitive#head()
		return strlen(_) ? ''._ : ''
	endif
	return ''
endfunction

function! MyCurrenttag()
	return tagbar#currenttag('%s',"no tag")
endfunction


if !has('gui_running')
	set t_Co=256
endif

"setup for indentLine ========================================================
let g:indentLine_color_term=237
let g:indentLine_char='|'
autocmd Filetype json let g:indentLine_setConceal = 0

"setup for easymotion ========================================================
set nohlsearch "disable hlsearch for usage of easymotion
let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
let g:EasyMotion_smartcase=1
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"setup for YankRing ==========================================================
set clipboard+=unnamedplus,unnamed
nmap ,y :YRShow<CR>

"setup for undotree ==========================================================
nmap <F5> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitLocation = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = 'UnderLined'

"setup for tagbar ============================================================
let g:tagbar_type_r = {
	\ 'ctagstype' : 'r',
	\ 'kinds'     : [
		\ 'f:Functions',
		\ 'g:GlobalVariables',
		\ 'v:FunctionVariables',
	\ ]
\ }
let g:tagbar_type_make = {
	\ 'kinds':[
		\ 'm:macros',
		\ 't:targets'
	\ ]
\}
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }
let g:tagbar_type_proto = {
	\ 'ctagstype' : 'protobuf',
	\ 'kinds' : [
		\ 'm:message',
		\ 'v:variable'
	\ ]
\ }
let g:tagbar_type_css = {
	\ 'ctagstype' : 'css',
	\ 'kinds' : [
		\ 'c:classes',
		\ 't:tags',
		\ 'i:identities',
		\ 'm:medias'
	\ ]
\ }
nmap <F8> :TagbarToggle<CR>
nnoremap <C-]> g<C-]>

"setup for quickrun ==========================================================

"set up for TaskList =========================================================
nmap <leader>T <Plug>TaskList

"set up for vim-lsp  =========================================================

let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

"set up for ALE ==============================================================
let g:ale_linters = {
	\ 'sh': ['shell'],
	\ 'r': ['lintr'],
	\ 'vim': ['vint'],
	\ 'python': ['pylint', 'frosted', 'pep8', 'pep257'],
	\ 'javascript': ['eslint'],
\}

let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': ['eslint']
\}

"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'

let g:ale_open_list = 0
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0 "use asyncomplete instead

"set up for asyncomplete ======================================================
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<UP>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<DOWN>"
inoremap <expr><C-y> asyncomplete#close_popup()
inoremap <expr><C-e> asyncomplete#cancel_popup()."\<ESC>"
inoremap <expr><C-[> asyncomplete#cancel_popup()."\<C-[>"

let g:asyncomplete_auto_popup = 1

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

"set up for asyncomplete-buffer ===============================================
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

let g:asyncomplete_buffer_clear_cache = 1

"set up for asyncomplete-file ===============================================
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

"setupfor vim-quickrun ========================================================
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
			\ 'outputter' : 'quickfix',
			\ 'runner' : 'vimproc'
			\}
let g:quickrun_config.cpp = {
			\ 'command' : 'g++',
			\ 'cmdopt' : '-Wall -Wextra',
			\ 'hook/quickrunex/enable' : 1
			\}
let g:quickrun_config['cpp11'] = {
			\ 'command' : 'g++',
			\ 'cmdopt' : '-std=c++11 -Wall -Wextra',
			\ 'hook/quickrunex/enable' : 1
			\}

"setup for unite-boost-online-doc =============================================
augroup cpp-unite
	autocmd!
	autocmd FileType cpp nnoremap <Space>ub :<C-u>UniteWithCursorWord boost-online-doc
augroup END

"setupforNERDTree =============================================================
nmap <F7> :NERDTreeToggle<CR>


"Makevars as makefile =========================================================
autocmd BufNewFile,BufRead {Makevars*} set filetype=make

"setup for vim-markdown =======================================================
".md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"disable highlight italic in Markdown
autocmd FileType markdown hi! def link markdownItalic LineNr"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1


"setup for clang_complete =====================================================
let s:hooks = neobundle#get_hooks('clang_complete')
function! s:hooks.on_source(bundle)
	let g:clang_complete_auto = 0
	let g:clang_auto_select = 0
	let g:clang_default_keymappings = 0
	let g:clang_usr_options = '-std=c++11'
	"let g:clang_use_library = 1
endfunction

"setup for vim-rooter =========================================================
let g:rooter_use_lcd = 1
let g:rooter_patterns = ['tags', '.git', '.git/',
			\'Makefile', 'OMakeroot',
			\'CMakeLists.txt', '.svn', '.hg', $HOME]

"setup for SrcExpl ============================================================
nmap <F9> :SrcExplToggle<CR>
let s:hooks = neobundle#get_hooks('SrcExpl')
function! s:hooks.on_source(bundle)
	let g:SrcExpl_refreshTime = 100
	let g:SrcExpl_isUpdateTags = 0
	let g:SrcExpl_winHeight = 11
	let g:SrcExpl_jumpKey = '<CR>'
	let g:SrcExpl_gobackKey = '<SPACE>'
	let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R ./'
	let g:SrcExpl_pluginList = [
		\ '__Tagbar__',
		\ 'NERD_TREE_1',
		\ 'undotree_2',
		\ 'diffpanel_3'
	\ ]
endfunction

"setupfor emmet-vim ===========================================================
let g:user_emmet_leader_key = '<C-m>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"setup for vim-easy-align =====================================================
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"setup for lexima.vim ========================================================
let s:hooks = neobundle#get_hooks('lexima.vim')
function! s:hooks.on_source(bundle)
	""call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
	""call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})
endfunction

"setup for Nvim-R  =======================================================
let s:hooks = neobundle#get_hooks('Nvim-R')
function! s:hooks.on_source(bundle)
	let g:R_wait = 5000
	let g:R_in_buffer = 0
	let g:R_applescript = 0
	let g:R_tmux_split = 1
	let g:R_vsplit = 0
	"let g:ScreenShellInitialFocus = 'shell'
	let g:R_notmuxconf = 1
	"let g:vimrplugin_tmux_title = "Vim-R"
	"let g:vimrplugin_screenplugin = 1
	"let g:vimrplugin_conqueplugin = 0
	"let g:vimrplugin_map_r = 0
	let g:R_nvimpager = 'no'
	"let g:R_term = 'gnome-terminal'
	nmap <F2> <Plug>RStart
	nmap <C-m> <Plug>RDSendLine
	vmap <C-m> <Plug>RDSendSelection
endfunction

"setup for vim-django-support ================================================
let s:hooks = neobundle#get_hooks('vim-quickrun')
function! s:hooks.on_source(bundle)
	let g:quickrun_no_default_key_mappings = 1
endfunction

"setup for vim-django-support ================================================
"invoke :DjangoSupportActive to activate plugin
let g:django_support#auto_activate = 0
let g:django_support#auto_activate_on_filetype = 0

"setup for rainbow
let g:rainbow_active = 1
