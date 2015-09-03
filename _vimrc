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
set guifont=Consolas:h14
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
"let g:tagbar_width = 30
"let g:tagbar_autopreview = 1
"autocmd VimEnter * nested :call tagbar#autoopen(1)
""autocmd FileType * nested :call tagbar#autoopen(0)
""autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType c,cpp,js,java,cc,h,py, nested :TagbarOpen
"let g:tagbar_previewwin_pos = "topright"

"==============================================================
"                       Python-mode
"==============================================================
" /bundle/Python-mode
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()
"let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

filetype plugin indent on
syntax on

let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''
let g:pymode_folding = 0

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


" ===================================================================
"                       ASCII tables 
" ===================================================================
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
"
" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================
