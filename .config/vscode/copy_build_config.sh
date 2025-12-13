#!/bin/bash

project_dir=${1}

if [[ ! -d "${project_dir}" ]]; then
  mkdir -v ${project_dir}
fi

if [[ ! -d "${project_dir}/.vscode" ]]; then
  mkdir -v "${project_dir}/.vscode"
fi

cp -v "$(dirname "${0}")/tasks.json" "$(dirname "${0}")/launch.json" "${project_dir}/.vscode/"

if [[ -f "$(dirname "${0}")/../clang/copy_clang_config.sh" ]]; then
  "$(dirname "${0}")/../clang/copy_clang_config.sh" "${project_dir}"
fi

unset project_dir
