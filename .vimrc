version 0.83

" ==================================================================
"
"  File:         $HOME/.vimrc
"  Availability: This file is available as
"  Purpose:      Setup file for the editor Vim (Vi IMproved)
"  Author:       Youke Shen (y62shen@uwaterloo.ca)
"  Size:         This file is about 7K in size and has 500+ lines.

" ===================================================================

inoremap ` <Esc>


syntax on
set tags=./tags;/
set noshelltemp
"set shell=/bin/sh
"set guifont=courier_new:h14
"set guifont=Consolas:h14
set guifont=Monospace\ 10
set nocompatible
set number
set cindent
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set incsearch
set encoding=utf-8
"set completeopt=menuone,longest
set fileencodings=ucs-bom,utf-8,utf-16,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set expandtab
set cursorline
set autoread
set shellslash
set grepprg=grep\ -nH\ $*
set background=dark
colorscheme gruvbox
execute pathogen#infect()
"set relativenumber
set noeb vb t_vb=
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" autoreload this file (.vimrc)
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" block cursor
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" Disable all blinking:
:set guicursor+=a:blinkon0
" Remove previous setting:
:set guicursor-=a:blinkon0
" Restore default setting:
:set guicursor&

" Key Mapping under insertion mode
"noremap <Leader>w <Esc>:w<CR>a
"inoremap <C-s> <Esc>:w<CR>a
inoremap <C-a> <Esc><S-0>i
inoremap <C-e> <Esc><S-$>a
inoremap <C-p> <Esc><up><right>i
inoremap <C-n> <Esc><down><right>i
inoremap <C-d> <Esc>dd<up>i<left>
inoremap <C-]> <Esc>gt
inoremap <C-[> <Esc>gT
imap <leader>w <Esc>:w<CR>

" enable for autocompletion selection
inoremap <C-k> <C-p>
inoremap <C-j> <C-n>

nmap <C-=> <C-W> 
"nmap <Leader>ll :silent! call Tex_RunLaTex()<CR>
nmap <leader>ls :silent call Tex_RunLaTeX()<cr>
":imap <C-d> <C-o>diwa

"inoremap <C-k> <up>
"inoremap <C-j> <down>
"inoremap <C-l> <right>
"inoremap <C-d> <Esc><C-d>
"inoremap <C-u> <Esc><C-u>
inoremap <C-z> <Esc>zz i
"inoremap ;s <Esc>:w<CR>a

inoremap <C-f> <Esc>ea
inoremap <C-b> <Esc>bi
"inoremap <Tab> <Esc>
inoremap <C-o> <Esc>
"inoremap <C-;> <Esc>:
 
nmap <C-s> :update<CR>
 
map <C-[> gT
map <C-]> gt

" map navigation keys to Control-h/j/k/l
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>


highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%10000v.*/
"au FileType javascript call JavaScriptFold()


"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" press :shell toggle a shell without leaving vim!

"nnoremap <C-left> :vertical resize -5<cr>
"nnoremap <C-down> :resize +5<cr>
"nnoremap <C-up> :resize -5<cr>
"nnoremap <C-right> :vertical resize +5<cr>


" highlight character at column of 80
"augroup collumnLimit
"  autocmd!
"  autocmd BufEnter,WinEnter,FileType javascript,java,cpp,python,
"        \ highlight ColumnLimit ctermbg=Red guibg=Red
"  let collumnLimit = 79 " feel free to customize
"  let pattern =
"        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
"  autocmd BufEnter,WinEnter,FileType javascript,java,cpp,python
"        \ let w:m1=matchadd('ColumnLimit', pattern, -1)
"augroup END



"==============================================================
"                     Compile setup 
"==============================================================
map <F1> :!g++ %; ./a.out; rm a.out <CR>
map <F2> :!node % <CR>
map ++ :w<CR> :!clear; make<CR> :!./%<<CR>

" Settings for vim-javascript
let g:javascript_conceal = 1






"==============================================================
"                           TagList
"==============================================================
let Tlist_Use_Right_Window = 0
let Tlist_Use_Horiz_Window = 1
nnoremap <F6> :TlistToggle<CR>


"==============================================================
"                          TagBar 
"==============================================================
"nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_autopreview = 1
autocmd BufEnter * nested :call tagbar#autoopen(0)
autocmd FileType c,cpp,js,java,cc,h,py, nested :TagbarOpen
"let g:tagbar_previewwin_pos = "topright"

"==============================================================
"                       Python-mode
"==============================================================
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

let g:pymode_rope = 0
let g:pymode_options_max_line_length = 80
let g:pymode_folding = 0
let g:pymode_lint = 1
let g:pymode_syntax = 1



"==============================================================
"                       EasyMotion 
"==============================================================
" /bundle/EasyMotion
nnoremap f H:call EasyMotion#WB(0, 0)<CR>


"==============================================================
"                       Easy-Align
"==============================================================
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

"==============================================================
"                           NERDTree
"==============================================================
" /bundle/YouCompleteMe
" open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree| endif
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"NERDTreeTabs Config
let g:nerdtree_tabs_open_on_gui_startup = 1
"let g:nerdtree_tabs_open_on_console_startup = 1 
let g:nerdtree_tabs_smart_startup_focus = 2
let g:NERDTreeWinSize=20
"autocmd BufEnter * lcd %:p:h
"autocmd BufEnter * silent! lcd %:p:h
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"==============================================================
"                       Syntastic 
"==============================================================
" /bundle/YouCompleteMe
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_ignore_files = ['.html$', '.c$', '.h$', '.java']
"let g:syntastic_ignore_files = ['.html$']



"==============================================================
"                       YouCompleteMe
"==============================================================
 "/bundle/YouCompleteMe
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '/User/youkeshen/'
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_key_list_select_completion = ['<Enter>']
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_library_path = '/usr/lib/'
let g:clang_user_options='|| exit 0'
"let g:ycm_filetype_specific_completion_to_disable = {'javascript':1}
"let g:ycm_filetype_specific_completion_to_disable = {'javascript':1, 'c': 1}

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,cc,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,d,vim,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'javascript' : [],
  \   'golang' : ['.'],
  \   'go' : ['.'],
  \ }

  "\   'cs,java,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],

"==============================================================
"                           Utilsnips 
"==============================================================
" /bundle/Utilsnips

" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"==============================================================
"                          Gundo
"==============================================================
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom=0


"==============================================================
"                         Tabular 
"==============================================================
let g:tabular_loaded = 1


"==============================================================
"                      vim-nodejs-complete 
"==============================================================
let g:multi_cursor_quit_key = '`'


"==============================================================
"                      Airline
"==============================================================
let g:airline#extensions#tabline#enabled=1


"==============================================================
"                      vim-nodejs-complete 
"==============================================================

"let g:nodejs_complete_config = {
"\  'js_compl_fn': 'jscomplete#CompleteJS',
"\  'max_node_compl_len': 15
"\}
"
"autocmd FileType javascript
"  \ :setl omnifunc=jscomplete#CompleteJS
"

"set g:jscomplete_use

"==============================================================
"                           Ag
"==============================================================
let g:ag_highlight=1
nnoremap <space>/ :Ag 
nnoremap <Leader>f :AgFile 


"==============================================================
"                       Unite
"==============================================================
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\./',
      \ '\.\./',
      \ 'node_modules/',
      \ '\.git/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_enable_start_insert=1
let g:unite_split_rule="top"
let g:unite_force_overwrite_statusline=0
let g:unite_winheight=10

"nnoremap <C-P> :<C-u>Unite  -buffer-name=files -start-insert buffer file_rec/async:!<cr>
"nnoremap <space>/ :Unite grep:.<CR>
nnoremap <space>s :Unite -quick-match buffer<cr>

let g:unite_source_rec_max_cache_files=200000000
nnoremap <C-P> :Unite -buffer-name=files -start-insert buffer file_rec/async:!<CR>
autocmd FileType unite call s:unite_settings()

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction


let g:gitgutter_max_signs = 100000


"==============================================================
"                       GoTags 
"==============================================================
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"let g:unite_source_menu_menus.git = {
"    \ 'description' : '            gestionar repositorios git
"        \                            ⌘ [espacio]g',
"    \}
"let g:unite_source_menu_menus.git.command_candidates = [
"    \['▷ tig                                                        ⌘ ,gt',
"        \'normal ,gt'],
"    \['▷ git status       (Fugitive)                                ⌘ ,gs',
"        \'Gstatus'],
"    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
"        \'Gdiff'],
"    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
"        \'Gcommit'],
"    \['▷ git log          (Fugitive)                                ⌘ ,gl',
"        \'exe "silent Glog | Unite quickfix"'],
"    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
"        \'Gblame'],
"    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
"        \'Gwrite'],
"    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
"        \'Gread'],
"    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
"        \'Gremove'],
"    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
"        \'exe "Gmove " input("destino: ")'],
"    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
"        \'Git! push'],
"    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
"        \'Git! pull'],
"    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
"        \'exe "Git! " input("comando git: ")'],
"    \['▷ git cd           (Fugitive)',
"        \'Gcd'],
"    \]
"nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>

"==============================================================
"                       VimShell 
"==============================================================
"inoremap <buffer> <expr><silent> <C-.>

"==============================================================
"                       ConqueShell
"==============================================================
"let g:ConqueTerm_Color=1
"let g:ConqueTerm_ReadUnfocused=1
"let g:ConqueTerm_PromptRegex='^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
"==============================================================
"                       Insearch
"==============================================================
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"set hlsearch
"let g:incsearch#auto_nohlsearch = 1
"map n  <Plug>(incsearch-nohl-n)
"map N  <Plug>(incsearch-nohl-N)
"map *  <Plug>(incsearch-nohl-*)
"map #  <Plug>(incsearch-nohl-#)
"map g* <Plug>(incsearch-nohl-g*)
"map g# <Plug>(incsearch-nohl-g#)
"nnoremap <Esc> :<C-u>nohlsearch<CR>!
"let g:incsearch#consistent_n_direction = 1
