# 判断是否是交互环境，若不是交互环境，则退出
[ -z "$PS1" ] && return


# 获取读取链接的命令
READLINK=$(which readlink || which greadlink)

# 这儿BASH_SOURCE一直出错，不知道什么问题，暂时用$0代替
CURRENT_SCRIPT=$0

# 获取.bash_profile的真正路径和其上上层目录
if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
	SCRIPT_PATH=$($READLINK $CURRENT_SCRIPT)
	DOTFILES_DIR="$(cd $(dirname $(dirname $SCRIPT_PATH)) && pwd)"
else
	echo "获取.bash_profile出错"
	return
fi


# make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"


# source配置文件
for dotfile in "$DOTFILES_DIR"/system/{path,alias}; do
	[ -f "$dotfile" ] && source "$dotfile"
done


# clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH dotfile 


# export 
export DOTFILES_DIR