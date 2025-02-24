"setting

 " 文字コードの自動判別
 set encoding=utf-8
 set fileencodings=utf-8,cp932
 " バックアップファイルを作らない
 set nobackup
 " スワップファイルを作らない
 set noswapfile
 " 編集中のファイルが変更されたら自動で読み直す
 set autoread
 " バッファが編集中でもその他のファイルを開けるように
 set hidden
 " 入力中のコマンドをステータスに表示する
 set showcmd

" 見た目系
 " 行番号を表示
 set number
 " 現在の行を強調表示
 set cursorline
 " 現在の列を強調表示
 set cursorcolumn
 " カーソルが何行目の何列目に置かれているかを表示
 set ruler
 " マウスでカーソル移動可能にする
 set mouse=a
 " クリップボード
 set clipboard=unnamed,autoselect
 " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
 " インデントはスマートインデント
 set smartindent
 " 括弧入力時の対応する括弧を表示
 set showmatch
 " ステータスラインを常に表示
 set laststatus=2
 " コマンドラインの補完
 set wildmode=list:longest
 " 文字幅の設定
 set ambiwidth=double

" Tab系
 " Tab文字を半角スペースにする
 set expandtab
 " 行頭以外のTab文字の表示幅（スペースいくつ分）
 set tabstop=2
 " 行頭でのTab文字の表示幅
 set shiftwidth=2


" 検索系
 " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
 set ignorecase
 " 検索文字列に大文字が含まれている場合は区別して検索する
 set smartcase
 " 検索文字列入力時に順次対象文字列にヒットさせる
 set incsearch
 " 検索時に最後まで行ったら最初に戻る
 set wrapscan
 " 検索語をハイライト表示
 set hlsearch

 " ---------------
 " dein.vimの設定
 " ---------------
 " プラグインが実際にインストールされるディレクトリ
 let s:dein_dir = expand('~/.cache/dein')
 " dein.vim 本体
 let s:dein_repo_dir = s:dein_dir . '/repos/github.com/shougo/dein.vim'
 
 " dein.vim がなければ github から落としてくる
 if &runtimepath !~# '/dein.vim'
     if !isdirectory(s:dein_repo_dir)
         execute '!git clone https://github.com/shougo/dein.vim' s:dein_repo_dir
     endif
     execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
 endif
 
 " 設定開始
 if dein#load_state(s:dein_dir)
     call dein#begin(s:dein_dir)
 
     " プラグインリストを収めた TOML ファイル
     " 予め TOML ファイル（後述）を用意しておく
     let g:dein_dir    = expand('~/.vim/dein')
     let s:toml      = g:dein_dir . '/dein.toml'
     let s:lazy_toml = g:dein_dir . '/lazy.toml'
 
     " TOML を読み込み、キャッシュしておく
     call dein#load_toml(s:toml,      {'lazy': 0})
     call dein#load_toml(s:lazy_toml, {'lazy': 1})
 
     " 設定終了
     call dein#end()
     call dein#save_state()
 endif
 
 " もし、未インストールものものがあったらインストール
 if dein#check_install()
     call dein#install()
 endif

 let g:neosnippet#snippets_directory='~/.vim/dein/neosnippet-snippets/snippets/'
 let g:indent_guides_enable_on_vim_startup = 1
 " ---------------
 " dein.vimの設定終了
 " ---------------

 " マッピング系
 inoremap jj <esc>
 inoremap ｊｊ <esc>

 nnoremap い i
 nnoremap Ｉ <S-i>

 nnoremap あ a
 nnoremap Ａ <S-a>

 nnoremap ｓ s
 nnoremap Ｓ <S-s>

 nnoremap お o
 nnoremap Ｏ <S-o>

 nnoremap ｈ h
 nnoremap ｊ j
 nnoremap ｋ k
 nnoremap ｌ l

 nnoremap ｗ w
 nnoremap ｂ b

 nnoremap ｄｄ dd
 nnoremap ｙｙ yy
 nnoremap ｐ p
 nnoremap ｒ r


 nnoremap う u

 nnoremap １ 1
 nnoremap ２ 2
 nnoremap ３ 3
 nnoremap ４ 4
 nnoremap ５ 5
 nnoremap ６ 6
 nnoremap ７ 7
 nnoremap ８ 8
 nnoremap ９ 9
 nnoremap ０ 0

 nnoremap ： :

 nnoremap [q :cprevious<CR>
 nnoremap ]q :cnext<CR>
 nnoremap [Q :<C-u>cfirst<CR>
 nnoremap ]Q :<C-u>clast<CR>

 nnoremap // :set hlsearch!<CR>

 " neosnippet settings
 imap <C-k> <Plug>(neosnippet_expand_or_jump)
 smap <C-k> <Plug>(neosnippet_expand_or_jump)
 xmap <C-k> <Plug>(neosnippet_expand_or_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

 "python
 autocmd bufnewfile,bufread *.py nnoremap <f5> :!python %
 
 "cpp
 autocmd bufnewfile,bufread *.cpp nnoremap <f5> :!g++ -std=c++11 %
 
 "md
 autocmd bufnewfile,bufread *.md nnoremap <f5> :!markdown % >
 
 "tex
 autocmd bufnewfile,bufread *.tex nnoremap <f5> :!platex %
 autocmd bufnewfile,bufread *.tex nnoremap <f6> :!dvipdfmx

 "カラースキーマ
 colorscheme molokai
 " シンタックスハイライトの有効化
 syntax on
 " 256色
 set t_Co=256
 " truecolor
 set termguicolors
