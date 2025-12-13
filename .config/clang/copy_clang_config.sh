#!/bin/bash

project_dir=${1}

if [[ -f "$(dirname "${0}")/.clang-format" ]]; then
  cp -v "$(dirname "${0}")/.clang-format" "${project_dir}/.clang-format"
fi

if [[ -f "$(dirname "${0}")/.clang-tidy" ]]; then
  cp -v "$(dirname "${0}")/.clang-tidy" "${project_dir}/.clang-tidy"
fi

unset project_dir
