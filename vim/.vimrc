" setting "

" title "
set title
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"

" encode "
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" mouse "
set mouse=a
" alias "
let $BASH_ENV="~/.bashrc"
" ctags 
set tags=./tags
nnoremap <C-]> g<C-]>

" { } "
set showmatch

" color "
syntax on

" line "
set number
" set cursorline
set virtualedit=onemore
" set scrolloff "
set scrolloff=5
" set backspace "
set backspace=indent,eol,start
" set hlsearch
set hlsearch

" indent "
set expandtab
set tabstop=4
set smartindent
set autoindent
set shiftwidth=4

" key map "
" inoremap <ESC> <ESC>:set iminsert=2<CR>

" normal mode --------------------------
noremap <C-h> <BS>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap sh <C-w>h 
noremap sj <C-w>j 
noremap sk <C-w>k 
noremap sl <C-w>l 
noremap sw <C-w>w 

" end normal mode --------------------------


" insert mode ----------------------
inoremap jj <Esc>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <S-Tab> <BS><BS><BS><BS>
" inoremap <Tab> <C-n>
" inoremap <S-Tab> <C-p>

" insert mode mac-like "
inoremap <C-p> <C-o>gk
inoremap <C-n> <C-o>gj
inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>l
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-d> <C-o>x
inoremap <C-k> <C-o>d$
inoremap <C-y> <C-o>p

" end insert mode =====================

" command-line mode ------------
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" end command-line mode ========

" \n "
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" save and quit "
nnoremap ZZ <Nop>

" no save and quit "
nnoremap ZQ <Nop>

" ex mode "
nnoremap Q <Nop>

" command "
command Hello echo 'hello, world!'

" function! s:WE_Func(arg)
" 	w %
" 	w a:arg
" 	e a:arg
" endfunction

"" "NeoBundle Scripts-----------------------------
" 	if &compatible
" 		set nocompatible               " Be iMproved
" 	endif
" 	
" 	" Required:
" 	set runtimepath+=~/.vim/bundle/neobundle.vim/
" 	
" 	" Required:
" 	call neobundle#begin(expand('~/.vim/bundle'))
" 	
" 	" Let NeoBundle manage NeoBundle
" 	" Required:
" 	NeoBundleFetch 'Shougo/neobundle.vim'
" 	
" 	" Add or remove your Bundles here:
" 	NeoBundle 'Shougo/neosnippet.vim'
" 	NeoBundle 'Shougo/neosnippet-snippets'
" 	NeoBundle 'tpope/vim-fugitive'
" 	NeoBundle 'ctrlpvim/ctrlp.vim'
" 	NeoBundle 'flazz/vim-colorschemes'
" 	NeoBundle 'jmcantrell/vim-virtualenv'
" 	NeoBundle 'scrooloose/syntastic'
" 		let g:syntastic_python_checkers = ['pyflakes']
" 	NeoBundle 'davidhalter/jedi-vim'
" 	
" 	" You can specify revision/branch/tag.
" 	NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
" 	
" 	" Required:
" 	call neobundle#end()
" 	" Required:
" 	filetype plugin indent on
" 	
" 	" If there are uninstalled bundles found on startup,
" 	" this will conveniently prompt you to install them.
" 	NeoBundleCheck
" "End NeoBundle Scripts-------------------------
" 
" autocmd FileType html setl filetype=htmldjango
" 
" 
" command -nargs=1 WE call s:WE_Func(<q-args>)
" set nocompatible
"
" filetype plugin indent off
" 
" if has('vim_starting')
"   set runtimepath+=~/.vim/bundle/neobundle.vim
"   call neobundle#rc(expand('~/.vim/bundle'))
" endif 
" 
" NeoBundleFetch 'Shougo/neobundle.vim'
" 
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neosnippet.vim'
" 
" filetype plugin indent on






" Vim syntax file
" Language:	JavaCC, a Java Compiler Compiler written by JavaSoft
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/javacc.vim
" Last Change:	2012 Oct 05

" Uses java.vim, and adds a few special things for JavaCC Parser files.
" Those files usually have the extension  *.jj

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" source the java.vim file
runtime! syntax/java.vim
unlet b:current_syntax

"remove catching errors caused by wrong parenthesis (does not work in javacc
"files) (first define them in case they have not been defined in java)
syn match	javaParen "--"
syn match	javaParenError "--"
syn match	javaInParen "--"
syn match	javaError2 "--"
syn clear	javaParen
syn clear	javaParenError
syn clear	javaInParen
syn clear	javaError2

" remove function definitions (they look different) (first define in
" in case it was not defined in java.vim)
"syn match javaFuncDef "--"
syn clear javaFuncDef
syn match javaFuncDef "[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)[ \t]*:" contains=javaType

syn keyword javaccPackages options DEBUG_PARSER DEBUG_LOOKAHEAD DEBUG_TOKEN_MANAGER
syn keyword javaccPackages COMMON_TOKEN_ACTION IGNORE_CASE CHOICE_AMBIGUITY_CHECK
syn keyword javaccPackages OTHER_AMBIGUITY_CHECK STATIC LOOKAHEAD ERROR_REPORTING
syn keyword javaccPackages USER_TOKEN_MANAGER  USER_CHAR_STREAM JAVA_UNICODE_ESCAPE
syn keyword javaccPackages UNICODE_INPUT JDK_VERSION
syn match javaccPackages "PARSER_END([^)]*)"
syn match javaccPackages "PARSER_BEGIN([^)]*)"
syn match javaccSpecToken "<EOF>"
" the dot is necessary as otherwise it will be matched as a keyword.
syn match javaccSpecToken ".LOOKAHEAD("ms=s+1,me=e-1
syn match javaccToken "<[^> \t]*>"
syn keyword javaccActionToken TOKEN SKIP MORE SPECIAL_TOKEN
syn keyword javaccError DEBUG IGNORE_IN_BNF

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link javaccSpecToken Statement
hi def link javaccActionToken Type
hi def link javaccPackages javaScopeDecl
hi def link javaccToken String
hi def link javaccError Error

let b:current_syntax = "javacc"
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8

" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'plasticboy/vim-markdown'
 NeoBundle 'kannokanno/previm'
 NeoBundle 'tyru/open-browser.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

 
" markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1
