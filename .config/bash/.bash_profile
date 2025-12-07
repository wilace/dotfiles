if [[ -f "${HOME}/.bashrc" ]]; then
  source "${HOME}/.bashrc"
fi

: "環境変数"; {
  export LANG=ja_JP.UTF-8
  export EDITOR=vi
  export LESS='-R' #lessコマンドで色付き表示

  : "パスを通す"; {
    paths=(
      "${HOME}/bin"
      "${HOME}/.cargo/bin"
    )

    # パスの重複・ディレクトリの存在を確認してからパスを追加する
    for p in "${paths[@]}"; do
      if [[ ":${PATH}:" != *":${p}:"* ]] && [[ -d "${p}" ]]; then
        export PATH="${p}:${PATH}"
      fi
    done

    unset paths p
  }

  : "XDG Base Directory"; {
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DATA_HOME="${HOME}/.local/share"
    export XDG_STATE_HOME="${HOME}/.local/state"
    export XDG_CACHE_HOME="${HOME}/.cache"
  }
}