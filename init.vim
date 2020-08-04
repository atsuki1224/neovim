" default
" -----------------------------------------------------------------------------------------------------

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

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" colorscheme
" -----------------------------------------------------------------------------------------------------
colorscheme NeoSolarized                " カラースキームの設定

" set
" -----------------------------------------------------------------------------------------------------
set encoding=utf-8
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

" map (noremapはmapに上書きされないコマンド)
" -------------------------------------------------------------------------------------------------------
map <Space>n <plug>NERDTreeTabsToggle<CR>     " NERDTreeを簡単に開く

