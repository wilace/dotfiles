# 対話シェルのときだけ読み込む
[[ $- != *i* ]] && return

: "モジュールファイルの読み込み"; {
  MODULE_DIR="${HOME}/.config/bash/module"

  # エイリアス
  if [[ -f "${MODULE_DIR}/alias.bash" ]]; then
    source "${MODULE_DIR}/alias.bash"
  fi

  # ユーティリティ
  if [[ -f "${MODULE_DIR}/utility.bash" ]]; then
    source "${MODULE_DIR}/utility.bash"
  fi

  unset MODULE_DIR
}
