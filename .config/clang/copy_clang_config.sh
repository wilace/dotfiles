#!/bin/bash

project_dir=${1}

if [[ -f "./.clang-format" ]]; then
  cp "./.clang-format" "${project_dir}/.clang-format"
fi

if [[ -f "./.clang-tidy" ]]; then
  cp "./.clang-tidy" "${project_dir}/.clang-tidy"
fi

unset project_dir
