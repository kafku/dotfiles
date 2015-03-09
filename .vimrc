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
set nohlsearch "disable hlsearch for usage of easymotion
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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'rails.vim'
Bundle 'railscasts' 
Bundle 'fugitive.vim'
Bundle 'surround.vim'
Bundle 'mru.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-scripts/AutoClose'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
"this require lua"Bundle 'Shougo/neocmplete' 
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/VimShell'
Bundle 'itchyny/lightline.vim'
Bundle 'https://github.com/Yggdroot/indentLine'
Bundle 'YankRing.vim'
Bundle 'undotree.vim'
Bundle 'easybuffer.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic' 
Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/TasKList.vim'
Bundle 'tagexplorer.vim'
Bundle 'szw/vim-tags'
Bundle 'python_ifold'
Bundle 'thinca/vim-splash'
Bundle 'vim-jp/cpp-vim'
Bundle 'mattn/quickrunex-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'mattn/webapi-vim'
Bundle 'osyo-manga/unite-boost-online-doc'
Bundle 'cocopon/colorswatch.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'AndrewRadev/linediff.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'kannokanno/previm' 
"Bundle 'davidhalter/jedi-vim' this requires +python +python3
Bundle 'elzr/vim-json'
Bundle 'rbtnn/rabbit-ui.vim'
Bundle 'rbtnn/rabbit-ui-collection.vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'airblade/vim-rooter'
Bundle 'wesleyche/SrcExpl'
Bundle 'vim-scripts/Vim-R-plugin'
Bundle 'mattn/emmet-vim'
Bundle 'severin-lemaignan/vim-minimap'

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
let g:syntastic_python_checker = ['pyflakes', 'pep8']

"set up for neocomplcache
let g:acp_enebleAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_min_syntax_length = 3
let g:neocomplcache_lock_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_list = {
		\ 'default' : '',
		\ 'vimshell' : $HOME.'/.vimshell_hist',
		\ 'scheme' : $HOME.'./.gosh_completions'
			\}

if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_force_expand)" : pumvisible() ? "<C-n>" : "\<TAB>"
inoremap <expr><G-g> neocomplcache#undo_completion()
inoremap <expr><G-l> neocomplcache#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplcache#smart_close_popup() : s:ExCr()
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-[> neocomplcache#cancel_popup()."\<ESC>"
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup()."\<Space>" : "\<Space>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascritp setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#completeTags

if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns ={}
endif

let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '\[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

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

"setup for jedi-vim
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#popup_select_first = 0
"let g:jedi#rename_command = "<Leader>R"
"if !exists('g:neocomplcache_force_omni_patterns')
"	let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

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
