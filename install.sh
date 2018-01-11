#!/usr/bin/env bash

DOTFILE_DIR="$(cd $(dirname $BASH_SOURCE) && pwd)"
export DOTFILE_DIR

# make unilities available
PATH="$DOTFILE_DIR/bin:$PATH"


# 创建必要的链接文件
linkfiles=(
	'bash_profile'
	)
# 若是系统中存在这些文件，先备份
for file in ${linkfiles[@]}; do
	[ -e ~/.$file ] && mv ~/.$file ~/.${file}_old
done

for file in ${linkfiles[@]}; do
	ln -sv "$DOTFILE_DIR/linkfile/.$file" ~	
done

# 需要额外执行的脚本
scripts=(
	'pip.sh'
	)
function brewsoft()
{
	for script in ${scripts[@]}; do
		bash $DOTFILE_DIR/install/$script
	done
}


# clean up
unset linkfiles script