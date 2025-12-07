: "履歴設定"; {
  # 履歴の保存件数
  export HISTSIZE=10000
  export HISTFILESIZE=20000

  # 重複したコマンド・スペースで始まるコマンドを履歴に残さない
  export HISTCONTROL=ignoreboth

  # 履歴に実行時刻を追記する
  export HISTTIMEFORMAT='%F %T '

  # 複数のターミナルを開いている場合、履歴を上書きせず追記する
  shopt -s histappend

  # コマンドごとに履歴を保存する
  export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
}

: ""; {
  # ウィンドウサイズを変更したとき、コマンドの表示幅を自動調整する
  shopt -s checkwinsize
}

: "プロンプト設定（Starship優先 / なければ標準）"; {
  if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
  else
    PS1='\[\e[1;32m\]\u:\w\$ \[\e[m\]'
  fi
}