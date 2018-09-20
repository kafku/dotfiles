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
autocmd BufWritePre *.py :%s/\s\+$//ge

" remove empty lines / python
function TrimEndLines()
	let save_cursor = getpos(".")
	:silent! %s#\($\n\s*\)\+\%$##
	call setpos('.', save_cursor)
endfunction

autocmd BufWritePre *.py call TrimEndLines()

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
	if has('lua')
		NeoBundleLazy 'Shougo/neocomplete.vim', {
		\ 'depends' : 'Shougo/vimproc.vim',
		\ 'autoload': {'insert':1,},
		\ }
	endif
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
	NeoBundle 'scrooloose/syntastic', {
		\ 'build':{
		\  'mac': 'pip install frosted pep8'
		\}}
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
	NeoBundleLazy 'andviro/flake8-vim', {
		\ 'autoload': {
		\  'command': ['PyFlake', 'PyFlakeAuto'],
		\  'filetypes': ['python', 'python3', 'djangohtml'],
		\ }}
	NeoBundleLazy 'Vimjas/vim-python-pep8-indent', {
		\ 'autoload': {
		\  'filetypes': ['python', 'python3', 'djangohtml'],
		\ }}
	NeoBundleLazy "davidhalter/jedi-vim", {
		\ "autoload": {
		\   "filetypes": ["python", "python3", "djangohtml"],
		\ }}
	NeoBundleLazy "jmcantrell/vim-virtualenv", {
		\ "autoload": {
		\   "filetypes": ["python", "python3", "djangohtml"],
		\ }}
	:""NeoBundleLazy "lambdalisue/vim-pyenv", {
	:""	\ "depends": ['davidhalter/jedi-vim'],
	:""	\ "autoload": {
	:""	\   "filetypes": ["python", "python3", "djangohtml"]
	:""	\ }}
	NeoBundleLazy "wilywampa/vim-ipython", {
		\ "autoload": {
		\   "filetypes": ["python", "python3", "djangohtml"]
		\ }}
	NeoBundleLazy "python-rope/ropevim", {
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
	NeoBundle 'thinca/vim-localrc'

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
	\	'right' : [ ['syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
	\  },
	\ 'component_function' : {
	\ 	'fugitive' : 'MyFugitive',
	\ 	'readonly' : 'MyReadonly',
	\ 	'modified' : 'MyModified',
	\ 	'currenttag' : 'MyCurrenttag'
	\  },
	\ 'component_expand' :{
	\ 	'syntastic' : 'SyntasticStatuslineFlag'
	\ },
	\ 'component_type' : {
	\	'syntastic' : 'error'
	\  }
	\ }

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

augroup AutoSyntastic
	  autocmd!
	    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
	  SyntasticCheck
		call lightline#update()
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

"set up for syntastic =========================================================
set statusline+=%{SyntasticStatuslineFlag()}

" C lang
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_c_check_header = 1

" C++
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 0
let g:syntastic_no_default_include_dirs = 1
let g:syntastic_cpp_include_dirs = [
	\ '/usr/include/c++/'.system('g++ -dumpversion'),
	\ '/usr/include',
	\ '/usr/local/include']
"	\ $VIM_R_INCLUDE_DIR,
"	\ $VIM_R_PKG_PATH.'/Rcpp/include',
"	\ $VIM_R_PKG_PATH.'/RcppArmadillo/include']
let g:syntastic_cpp_compiler_options = '-std=c++11'

" python
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_python_exec = $HOME.'/.pyenv/shims/python'
let g:syntastic_python_checkers = ['pylint', 'frosted', 'pep8', 'pep257']

" R lang : 'install.packages("lintr")'
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

" VimL : 'pip install vim-vint #not vint'
let g:syntastic_vim_checkers = ['vint']

"set up for neocomplete =======================================================
let s:hooks = neobundle#get_hooks('neocomplete.vim')
function! s:hooks.on_source(bundle)
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_syntax_length = 3
	let g:neocomplete#lock_name_pattern = '\*ku\*'

	let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'./.gosh_completions'
				\}

	if !exists('g:neocompletei#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	inoremap <expr><C-g> neocomplete#undo_completion()
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return pumvisible() ? neocomplete#close_popup() : s:ExCr()
	endfunction

	"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
	"        \ <SID>check_back_space() ? "\<TAB>" :
	"        \ neocomplete#start_manual_complete()
	"function! s:check_back_space()
	"	let col = col('.') - 1
	"	return !col || getline('.')[col - 1]  =~ '\s'
	"endfunction
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<UP>"
	inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<DOWN>"
	inoremap <expr><C-l> pumvisible() ? neocomplete#close_popup()."\<RIGHT>" : "\<RIGHT>"
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y> neocomplete#close_popup()
	inoremap <expr><C-e> neocomplete#cancel_popup()."\<ESC>"
	" NOTE: the flollowing line seems not working
	inoremap <expr><C-[> neocomplete#cancel_popup()."\<C-[>""
	inoremap <expr><Space> pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"

	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType xml setlocal omnifunc=xmlcomplete#completeTags
	autocmd FileType python setlocal omnifunc=jedi#completions
	"autocmd FileType r,rnoweb,rdoc,rhelp,rrst,rmd setlocal omnifunc=rcomplete#CompleteR

	"if !exists('g:neocomplete#sources#omni#functions')
	"	let g:neocomplete#sources#omni#functions = {}
	"endif
	"let g:neocomplete#sources#omni#functions.r = 'rcomplete#CompleteR'

	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns = {}
	endif
	let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplete#sources#omni#input_patterns.c = '\[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplete#sources#omni#input_patterns.cpp = '\[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	let g:neocomplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'

	" use clang_complete for cpp and c
	if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.c =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
	let g:neocomplete#force_omni_input_patterns.cpp =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
	let g:neocomplete#force_omni_input_patterns.objc =
		  \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
	let g:neocomplete#force_omni_input_patterns.objcpp =
		  \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
	let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
	let g:neocomplete#force_omni_input_patterns.r = '\h\w*::\w*\|\h\w*:::\w*\|\h\w*\$\w*\|[^.[:digit:] *\t]\.\w*'
endfunction

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

"setup for jedi-vim ===========================================================
let s:hooks = neobundle#get_hooks('jedi-vim')
function! s:hooks.on_source(bundle)
	autocmd FileType python setlocal completeopt-=preview
	let g:jedi#completions_enabled = 0
	let g:jedi#auto_vim_configuration = 0
	let g:jedi#smart_auto_mappings = 0
	let g:jedi#popup_select_first = 0
	let g:jedi#show_call_signatures = 1
	let g:jedi#rename_command = '<Leader>R'
	let g:jedi#goto_assignments_command = '<Leader>G'
endfunction

"setup for vim-pyenv ===========================================================
let s:hooks = neobundle#get_hooks('vim-pyenv')
function! s:hooks.on_source(bundle)
	if jedi#init_python()
		function! s:jedi_auto_force_py_version() abort
			let major_version = pyenv#python#get_internal_major_version()
			call jedi#force_py_version(major_version)
		endfunction
		augroup vim-pyenv-custom-group
			autocmd! *
			autocmd User vim-pyenv-activate-post call s:jedi_auto_force_py_version()
			autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
		augroup END
	endif
endfunction

"define Jq command ============================================================
"command! -nargs=? Jq call s:Jq(<f-args>)
"function! s:Jq(...)
"	if 0 == a:0
"		let l:arg = "."
"	else
"		let l:arg = a:1
"	endif
"	execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
"endfunction

"setup for vim-rooter =========================================================
let g:rooter_use_lcd = 1
let g:rooter_patterns = ['tags', '.git', '.git/',
			\'Makefile', 'OMakeroot',
			\'CMakeLists.txt', '.svn', '.hg']

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

"setup for flake8-vim =========================================================
let s:hooks = neobundle#get_hooks('flake8-vim')
function! s:hooks.on_source(bundle)
	let g:PyFlakeOnWrite = 0
	let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
	let g:PyFlakeDefaultComplexity = 10
	let g:PyFlakeCWindow = 6
	let g:PyFlakeSigns = 1
	let g:PyFlakeSignStart = 1
endfunction

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
