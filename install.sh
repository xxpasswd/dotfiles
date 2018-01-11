#!/usr/bin/env bash

DOTFILE_DIR="$(cd $(dirname $BASH_SOURCE) && pwd)"
export DOTFILE_DIR

# make unilities available
PATH="$DOTFILE_DIR/bin:$PATH"


# 创建必要的链接文件
linkfiles=(
	'bash_profile'
	)

for file in "$DOTFILE_DIR"/linkfile/.${linkfiles[@]}; do
	ln -sv "$file" ~	
done

# 需要额外执行的脚本
scripts=()
function brewsoft()
{
	for script in "$DOTFILE_DIR"/install/${scripts[@]}; do
		bash script
	done
}
