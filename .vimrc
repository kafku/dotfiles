set tabstop=4
set shiftwidth=4
set nocompatible
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

if has('multi_byte_ime') || has('xim') 
	highlight Cursor guifg=NONE guibg=White
	highlight CursorIM guifg=NONE guibg=DarkRed
endif

"set foldmethod=syntax
set list listchars=tab:\|\ 
highlight Specialkey ctermfg=233

map Y y$

filetype off
if has('vim_starting')
	if !isdirectory(expand('~/.vim/bundle/neobundle.vim/'))
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif

	set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vimr/bundle/'))
let g:neobundle_default_git_protocol = 'https'
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rails.vim'
NeoBundle 'railscasts' 
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'L9'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
if has('lua')
	NeoBundleLazy 'Shougo/neocomplete', {
	\ 'depends' : 'Shougo/vimproc',
	\ 'autolaod' : {'insert': 1,}
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
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ 
  \ }}
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'https://github.com/Yggdroot/indentLine'
NeoBundle 'YankRing.vim'
NeoBundle 'undotree.vim'
NeoBundle 'easybuffer.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic' 
NeoBundleLazy 'thinca/vim-quickrun', {
  \ 'autoload' : {
  \   'mappings' : [['n', '\r']],
  \   'commands' : ['QuickRun']
  \ }}
NeoBundle 'vim-scripts/TasKList.vim'
NeoBundle 'tagexplorer.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'python_ifold'
NeoBundle 'thinca/vim-splash'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'mattn/quickrunex-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'osyo-manga/unite-boost-online-doc'
NeoBundle 'cocopon/colorswatch.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm' 
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'Flake8-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundleLazy "davidhalter/jedi-vim", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"],
  \ },
  \ "build" : {
  \   "mac"  : "pip install jedi",
  \   "unix" : "pip install jedi",
  \ }}
NeoBundle 'elzr/vim-json'
NeoBundle 'rbtnn/rabbit-ui.vim'
NeoBundle 'rbtnn/rabbit-ui-collection.vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'severin-lemaignan/vim-minimap'
call neobundle#end()
filetype plugin indent on

"setups for each plugin follows
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>
inoremap <C-h> <LEFT>
nnoremap ; :

"setup for NERD-tree
nmap <F6> :NERDTreeToggle<CR> 

"setup for lightline
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

"setup for indentLine
let g:indentLine_color_term=233
let g:indentLine_char='|'

"setup for easymotion
set nohlsearch "disable hlsearch for usage of easymotion
let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
let g:EasyMotion_smartcase=1
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"setup for YankRing
set clipboard+=unnamedplus,unnamed
nmap ,y :YRShow<CR>

"setup for undotree
nmap <F5> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitLocation = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

"setup for tagbar
nmap <F8> :TagbarToggle<CR>
nnoremap <C-]> g<C-]>

"setup for quickrun

"set up for TaskList
nmap <leader>T <Plug>TaskList

"set up for syntastic
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh = 1
let g:syntastic_cpp_include_dirs = [
	\ '/usr/include',
	\ '/usr/local/include', 
	\ $HOME.'/include', 
	\ $R_INCLUDE_DIR,
	\ $R_PKG_PATH.'/Rcpp/include',
	\ $R_PKG_PATH.'/RcppArmadillo/include']
"let g:syntastic_cpp_complier_option = '-std=c++11'
let g:loaded_syntastic_python_pylint_checker = 0
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

"set up for neocomplete
let g:acp_enebleAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_syntax_length = 3
let g:neocompllete#lock_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'./.gosh_completions'
			\}

if !exists('g:neocompletei#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><G-g> neocomplete#undo_completion()
inoremap <expr><G-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplete#close_popup() : s:ExCr()
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
inoremap <expr><C-[> neocomplete#cancel_popup()."\<ESC>"
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascritp setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#completeTags

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '\[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '\[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"setupfor vim-quickrun
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
			\ 'outputter' : 'quickfix',
			\ 'runner' : 'vimproc'
			\}
let g:quickrun_config.cpp = {
			\ 'commadn' : 'g++',
			\ 'cmdopt' : '-Wall -Wextra',
			\ 'hook/quickrunex/enable' : 1
			\}
let g:quickrun_config['cpp11'] = {
			\ 'command' : 'g++-4.8',
			\ 'cmdopt' : '-std=c++11 -Wall -Wextra',
			\ 'hook/quickrunex/enable' : 1
			\} 
"setup for unite-boost-online-doc
augroup cpp-unite
	autocmd!
	autocmd FileType cpp nnoremap <Space>ub :<C-u>UniteWithCursorWord boost-online-doc
augroup END

"setupforNERDTree
nmap <F7> :NERDTreeToggle<CR> 


"Makevars as makefile
autocmd BufNewFile,BufRead {Makevars*} set filetype=make

".md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"disable highlight italic in Markdown
autocmd FileType markdown hi! def link markdownItalic LineNr"
"setup for vim-markdown
let g:vim_markdown_folding_diabled = 1
let g:vim_markdown_math = 1


"setup for clang_complete
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
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_default_keymappings = 0
"let g:clang_use_library = 1

"setup for jedi-vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#rename_command = "<Leader>R"
let g:jedi#goto_assignments_command = '<Leader>G'
autocmd FileType python setlocal omnifunc=jedi#completions
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"define Jq command
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
	if 0 == a:0
		let l:arg = "."
	else
		let l:arg = a:1
	endif
	execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction

"setup for vim-rooter
let g:rooter_use_lcd = 1
let g:rooter_patterns = ['tags', '.git', '.git/',  'Makefile', 'OMakeroot', 'CMakeLists.txt', '.svn', '.hg']

"setup for SrcExpl
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_winHeight = 11
let g:SrcExpl_jumpKey="<CR>"
let g:SrcExpl_gobackKey="<SPACE>"
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ./"
let g:SrcExpl_pluginList = [
	\ "__Tagbar__",
	\ "NERD_TREE_1",
	\ "undotree_2",
	\ "diffpanel_3"
\ ]
nmap <F9> :SrcExplToggle<CR>

"setupfor emmet-vim
let g:user_emmet_leader_key = "<C-m>"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
