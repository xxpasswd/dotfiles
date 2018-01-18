# 判断是否是交互环境，若不是交互环境，则退出
[ -z "$PS1" ] && return


# 获取读取链接文件路径的命令
READLINK=$(which readlink || which greadlink)

# 这儿BASH_SOURCE一直出错，不知道什么问题，暂时用$0代替
CURRENT_SCRIPT=$0


# 获取.bash_profile的路径和其上上层目录
if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
	SCRIPT_PATH=$CURRENT_SCRIPT
	# 若是链接文件，则获取链接文件的路径
	[ -L $CURRENT_SCRIPT ] && SCRIPT_PATH=$($READLINK $CURRENT_SCRIPT)
	DOTFILES_DIR="$(cd $(dirname $(dirname $SCRIPT_PATH)) && pwd)"
else
	echo "获取.bash_profile出错"
	return
fi


# make utilities available
# PATH="$PATH:$DOTFILES_DIR/bin"


# source配置文件
source_files=(
	'path'
	'alias_and_functions'
	'virtualenvwrapper_path'
	'dotfile_completion.sh'
	)
# 注意：路径不能写在for循环里面,不然会出错
for dotfile in ${source_files[@]}; do
	[ -f "$DOTFILES_DIR/system/$dotfile" ] && source $DOTFILES_DIR/system/$dotfile
done


# clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH dotfile source_file


# export 
export DOTFILES_DIR