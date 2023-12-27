set nocompatible              " Vim 디폴트 기능들을 사용함, 오리지날 VI와 호환하지 않음
filetype off                  " required. vundle에서 off하라고 함.

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" yss' 같은거
Plugin 'tpope/vim-surround'

" nerdcommenter
Plugin 'preservim/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" nerdtree
Plugin 'scrooloose/nerdtree'
" \ne로 nt toggle
nmap <leader>ne :NERDTreeToggle<cr>
" nerdtree 항상 시작
" autocmd vimenter * NERDTree

" whitespace 표시
Plugin 'bad-whitespace'

" rainbow parenthesis
Plugin 'frazrepo/vim-rainbow'
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']  " 이쁨

" vim airline
Plugin 'vim-airline/vim-airline'

" vir airline 테마
Plugin 'vim-airline/vim-airline-themes'
" vim airline에 현재 경로도 표시하도록 설정
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" vim airline 화살표 모양
let g:airline_powerline_fonts = 1
" vim airline theme.
" let g:airline_theme='simple'  " 없는 게 가독성 좋네..

" airline도 아이콘 뜸
Plugin 'ryanoasis/vim-devicons'

" vim airline에 시계 추가
Plugin 'enricobacis/vim-airline-clock'

" indent 줄 표시
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=darkgrey

" 이걸 해야 float도 강조됨
Plugin 'vim-python/python-syntax'
" 너무 많이하면 난잡함
" let g:python_highlight_all = 1
let g:python_highlight_builtins = 1

" 이거는 다른 용도로 nerdtree에서 색깔 입히려고.
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" red line 없애줌
let g:NERDTreeHighlightCursorline = 0

" search가 몇번째인지 표시
Plugin 'osyo-manga/vim-anzu'
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" statusline
set statusline=%{anzu#search_status()}

" python스럽게 indent 해준다
Plugin 'hynek/vim-python-pep8-indent'

" yank한 부분을 highlight
Plugin 'machakann/vim-highlightedyank'
" A negative number makes the highlight persistent.
"let g:highlightedyank_highlight_duration = -1
" persistent는 아닌것같더라.
" Assign a number of time in milliseconds.
let g:highlightedyank_highlight_duration = 1000
" 사실은 디폴트도 1000인듯

" 수정 사항 생기면 +로 표시
Plugin 'chrisbra/changesplugin'

" 왼쪽에 scroll 표시
Plugin 'flebel/vim-scroll-position'
" yellow
hi ScrollPositionMarker        ctermfg=11
hi ScrollPositionVisualBegin   ctermfg=11
hi ScrollPositionVisualMiddle  ctermfg=11
hi ScrollPositionVisualEnd     ctermfg=11
hi ScrollPositionVisualOverlap ctermfg=11
hi ScrollPositionChange        ctermfg=11
hi ScrollPositionJump          ctermfg=11


" 괄호 쌍 맞도록 자동으로 닫는 괄호 하나 추가
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr=1

" +, _로 visual expand
Plugin 'terryma/vim-expand-region'

" flake8을 vim 내부에서 사용
Plugin 'nvie/vim-flake8'
autocmd FileType python map <buffer> <leader>f :call flake8#Flake8()<CR>
let g:flake8_quickfix_height=20
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
let g:flake8_naming_marker=''      " disable naming warnings
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" / search에서 tab complete
Plugin 'SearchComplete'

" 잘 모르겠음
Plugin 'peterrincker/vim-argumentative'
nmap [; <Plug>Argumentative_Prev
nmap ]; <Plug>Argumentative_Next
xmap [; <Plug>Argumentative_XPrev
xmap ]; <Plug>Argumentative_XNext
nmap <; <Plug>Argumentative_MoveLeft
nmap >; <Plug>Argumentative_MoveRight
xmap i; <Plug>Argumentative_InnerTextObject
xmap a; <Plug>Argumentative_OuterTextObject
omap i; <Plug>Argumentative_OpPendingInnerTextObject
omap a; <Plug>Argumentative_OpPendingOuterTextObject

" 잘 모르겠음
Plugin 'chiel92/vim-autoformat'

" mark해서 이동
Plugin 'kshenoy/vim-signature'

" smooth scroll, 조금 빠름
Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" vimtex
Plugin 'lervag/vimtex'
noremap <silent> <leader>lv :VimtexStop<CR> :VimtexCompile<CR>




" tarbar for mac
Plugin 'majutsushi/tagbar'
" 먼저 설치를 진행 brew install ctags-exuberant
" 그 다음 해당 경로를 적용
let g:Tlist_Ctags_Cmd="/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags"
nmap <Leader>tg :TagbarToggle<CR>

" 유니크 알파벳 표시
Plugin 'unblevable/quick-scope'
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" leader k로 멀티로 highlight 가능
Plugin 'lfv89/vim-interestingwords'

" 암튼 completion에서 이게 좀 더 자세히 나옴.
Plugin 'neoclide/coc.nvim'
"" enter 했을 때 선택되도록
" new
" Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use tab for trigger completion with characters ahead and navigate
" " NOTE: There's always complete item selected by default, you may want to
" enable
" " no select by `"suggest.noselect": true` in your configuration file
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
"



" 현재 단어와 twin들을 highlight
Plugin 'dominikduda/vim_current_word'
hi CurrentWord ctermbg=57
hi CurrentWordTwins ctermbg=105

" 현재 위치에 대한 indent를 컬러로 표시
Plugin 'tweekmonster/local-indent.vim'
" autocmd FileType * LocalIndentGuide +hl -cc
highlight LocalIndentGuide ctermfg=2 ctermbg=0 cterm=inverse
" error with latex

" =ci같은 게 .으로 repeat되도록
Plugin 'tpope/vim-repeat'



" spell, typo check. 여러 가지 해봤는데 이게 좋은듯.
Plugin 'kamykn/spelunker.vim'



" 폐기
" sqrt 같은 문자들을 표시
" Plugin 'ehamberg/vim-cute-python'

" tabnine
" Plugin 'zxqfl/tabnine-vim'

" 시작 화면
" Plugin 'mhinz/vim-startify'

" 자동으로 complete되도록 popup한다
" Plugin 'AutoComplPop'
" set complete+=kspell
" set completeopt=menuone,longest
" set shortmess+=c

" cursor가 좋인 단어에 밑줄
" Plugin 'itchyny/vim-cursorword'

" Ctrl f 부드럽게
" Plugin 'yuttie/comfortable-motion.vim'
" 이거 느려서 다른 걸로 교체

" 이것도 자동완성인데 tab임 말하자면 C-n을 tab으로 대체
" Plugin 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType = "<c-n>"  "위부터

" 현재 function을 헤더에
Plugin 'wellle/context.vim'

" new
" preview when substitute
Plugin 'markonm/traces.vim'




call vundle#end()            " required
filetype plugin indent on    " required

" 해당 파일을 읽어서 명령들이 실행됨
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction



"""일반 설정
set nu
set wmnu    " tab 을 눌렀을 때 자동완성 가능한 목록
set encoding=utf8 " 인코딩을 utf8로 설정
set fileencodings=utf-8,cp949
" set relativenumber "별로임

" 왼쪽 line number 색. greay, white, DarkGrey 등의 옵션이 있음
highlight LineNr ctermfg=DarkGrey

" tab space 4
set smartindent  "새로운 라인을 시작할 때, smart 하게 auto indentation 을 수행한다. for문 같은거에서 다음 행 넘어갈 때 tab 시켜줌.
set tabstop=4
set expandtab
set shiftwidth=4 " >> 또는 << 키로 들여 쓰기 할때 스페이스의 갯수. 기본값 8

" 주석에 >>할 때 indent되도록 설정하는거
set cindent  "C용 indent라고함..
set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e

" vim에서 복사한 내용이 클립보드에 저장. "+ 이거 안해도 됨
set clipboard=unnamed  " mac에서는 이거
" set clipboard=unnamedplus  " linux에서는 이거

" beep 대신에 visual bell 사용
set visualbell

" vim 임시파일 생성시 이동
"set directory=C:\\Temp
"set backupdir=C:\\Temp
"set undodir=C:\\Temp
set directory=~/vimswap
set backupdir=~/vimswap
set undodir=~/vimswap

" 창 크기 maximize
au GUIEnter * simalt ~x

" " default split
" rightb vert term
" vertical resize -80

" 전체적으로 색깔 더 이쁨
set t_Co=256

" tmux에서 syntax hl 다른 이슈
set background=dark

" cursorline
set cursorline

" color
" good
"hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE
"hi CursorLine   cterm=NONE ctermbg=16 ctermfg=NONE
"hi CursorLine   cterm=NONE ctermbg=59 ctermfg=NONE
hi CursorLine   cterm=NONE ctermbg=235 ctermfg=NONE

" for mac
syntax on

" 마우스로 복사하려고
set mouse=i

" 주석 어둡게
" highlight Comment ctermfg=8
" highlight Comment ctermfg=34
highlight Comment ctermfg=247

" 검색시 대소문자 무시
set ignorecase
" 이때 검색어에 대문자가 있을 경우 자동으로 대문자만 검색한다.
set smartcase



""" key mapping
" leader를 =로 설정
let mapleader = "="

" control l로 noh
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"save, exit, quit을 mapping
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>

" Search. 엄밀히는 substitute인듯.
noremap ;; :%s:::g<Left><Left><Left>

" Replace the word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" disable arrowkeys in all modes
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" insert a blank line with <leader>o and <leader>O
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>O O<ESC>

" select last pasted text
nnoremap gp `[v`]

" qq to record, Q to replay
nnoremap Q @q

" Quickly move current line above or below
nnoremap <C-k><C-k> :<C-u>execute 'move -1-'. v:count1<CR>
nnoremap <C-j><C-j> :<C-u>execute 'move +'. v:count1<CR>

" set nu toggle
nnoremap \nn :set invnumber<CR>

" Like gJ, but always remove spaces
fun! s:join_spaceless()
    execute 'normal! gJ'

    " Remove character under the cursor if it's whitespace.
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        execute 'normal! dw'
    endif
endfun

" Map it to a key
nnoremap <Leader>J :call <SID>join_spaceless()<CR>"
