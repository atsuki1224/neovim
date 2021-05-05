" vimの設定
" -----------------------------------------------------------------------------------------------------

" 互換性や便利な機能を使えるようにするおまじない
if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" ファイルを開いた際にファイルタイプを検出する機能をオンにする
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" colorscheme
" -----------------------------------------------------------------------------------------------------
colorscheme NeoSolarized                " カラースキームの設定
"colorscheme onedark                " カラースキームの設定

" set
" -----------------------------------------------------------------------------------------------------
set encoding=utf-8
set t_Co=256                            " 256色を有効化
" set nowrap                            " ターミナルの右端で文字を折り返さない
set number                              " 行番号表示
set splitbelow                          " 水平分割時に下に表示
set splitright                          " 縦分割時を右に表示
set noequalalways                       " 分割時に自動調整を無効化
set wildmenu                            " コマンドモードの補完
set hls                                 " 検索した文字をハイライトする
set clipboard+=unnamed,unnamedplus      " Vimの無名レジスタとシステムのクリップボードを連携(文字列のリスト) 
set ruler                               " カーソルの位置表示
set cursorline                          " カーソルハイライト
set expandtab                           " tabを複数のspaceに置き換え
set tabstop=2                           " tabは半角2文字
set shiftwidth=2                        " 自動インデント時に入力する空白の数
set shiftwidth=2                        " tabの幅
set autoindent                          " 改行時に自動でインデントする
set splitright                          " 画面を縦分割する際に右に開く
set termguicolors                       " カラースキームに必要
set background=dark                     " ダークバージョンのテーマを設定
set hlsearch                            " 検索結果ハイライト
set ignorecase                          " 検索パターンで大文字、小文字を区別しない
set incsearch                           " 検索コマンド使用時にインクリメンタルサーチする
set smartcase                           " 小文字で検索した際には大文字、小文字を区別しない。大文字検索時は区別する
set laststatus=2                        " ステータスラインを表示する
set statusline=%{F}                     " ステータスラインにフルパスを表示
set nobackup                            " ファイル保存時にバックアップファイルを作らない
set noswapfile                          " ファイル編集中にスワップファイルを作らない
set wrapscan                            " 最後尾まで検索を終えたら次の検索で先頭に移る
set showcmd                             " コマンドの一部を最下部に表示する
set confirm                             " 保存されていないファイルがあるときは終了前に保存確認
set hidden                              " 保存されていないファイルがある時でも別のファイルで開くことが可能
set autoread                            "外部でファイルに変更がされた場合は読みなおす
set backspace=indent,eol,start          " コンマ区切りのリストの時にバックスペースの対象範囲を指定する
set showmatch                           " 閉じかっこを入力した際に一瞬対応する開始かっこに移動する
set cursorcolumn                        " カーソル位置のカラムの背景色を変える
set helpheight=999                      " ヘルプを画面いっぱいに開く
set list                                " 不可視文字を表示
set listchars=tab:>-,trail:.            " 不可視文字。タブを >--- 半スペを . で表示する
set clipboard=unnamed,unnamedplus       " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse=a                             " マウスの入力を受け付ける
set history=10000                       " コマンドラインの履歴表示数
set visualbell t_vb=                    "ビープ音すべてを無効にする
set noerrorbells                        "エラーメッセージの表示時にビープを鳴らさない
set fileencodings=utf-8                 "ファイルの文字コード設定
set fileformats=unix,dos,mac            "フィアルフォーマット設定

let mapleader = "\<Space>"              "リーダーキーをスペースに設定
" 全角スペースを可視化する
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" シンタックスハイライトの有効化、デフォルトの色を有効化
syntax on
" シンタックスハイライトの現在の色を変更しない
" syntax enable

" -------------------------------------------------------------------------------------------------------
map <Space>n <plug>NERDTreeTabsToggle<CR>     " NERDTreeを簡単に開く

nmap <Esc><Esc> :nohlsearch<CR><Esc>          " esc2回押下で検索のハイライトを終了

" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>
imap < <><left>

" scala
autocmd BufRead,BufNewFile *.sbt set filetype=scala
" markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" <C-p>でブラウザでプレビューできるようにする
nnoremap <silent> <C-p> :PrevimOpen<CR>
" 自動で折り畳まれないようにする
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1

" vim起動時に自動でNERDTreeを開く
autocmd vimenter * NERDTree
autocmd TabNew * call timer_start(0, { -> execute('NERDTree')})
" vimを閉じる時にNERDTreeも自動で閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

inoremap <C-g> <Esc>
inoremap <TAB> <C-n>
inoremap ; :

" タブの追加
noremap  <Leader><C-t> :tabnew<Enter>
" タブを水平高校に分割
nnoremap <Leader>vs    :vsplit<Enter>
" タブを垂直方向に分割
nnoremap <Leader>s     :split<Enter>

" 入力時にマルスカーソルの形を変更
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif

" 言語にかかわらずカッコの閉じタグとインデントを揃える
inoremap {<Enter> {} <Left><CR><ESC><S-o>
inoremap [<Enter> [] <Left><CR><ESC><S-o>
inoremap (<Enter> () <Left><CR><ESC><S-o>
