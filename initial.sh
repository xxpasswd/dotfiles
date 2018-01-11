#!/usr/bin/env bash

DOTFILE_DIR="$(cd $(dirname $BASH_SOURCE) && pwd)"
export DOTFILE_DIR

# make unilities available
PATH="$DOTFILE_DIR/bin:$PATH"


# 创建链接文件
for file in "$DOTFILE_DIR"/runcom/.{bash_profile,aaa}; do
	ln -sv "$file" ~
	
done

function brewsoft()
{
	for script in "$DOTFILE_DIR"/install/{aa,}; do
		echo
	done
}
