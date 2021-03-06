#!/usr/bin/bash

# =================函数=====================

# cd到工作目录
function cdw()
{
	if [ -d ~/working ]; then
		cd ~/working
	else
		mkdir ~/working
		cd ~/working
	fi
}

# cd到python虚拟环境目录
# function cdenv()
# {
# 	if [ -d ~/.allenv ]; then
# 		cd ~/.allenv
# 	else
# 		mkdir ~/.allenv
# 		cd ~/.allenv
# 	fi
# }

# 创建python虚拟环境，并添加别名
# function myvirtualenv()
# {
# 	virtualenv=$(which virtualenv)
# 	# 字符串比较时，最好使用双中括号
# 	[[ -n $@ ]] && virtualenv $@
# 	success=$?

# 	# 获取命令行的最后一个元素
# 	for last in $@; do
# 		true
# 	done

# 	# 判断命令是否执行成功，成功则写入别名
# 	if [ $success -eq 0 ] && [ -e ~/.allenv/$last ]; then
# 		cat >> ~/.virtualenv_alias <<EOF
# alias env-$last="source ~/.allenv/$last/bin/activate"
# EOF
# 	fi
# }

[ -e ~/.virtualenv_alias ] && source ~/.virtualenv_alias




# ===============别名设置========================

alias cp="\cp -i" # 复制时，若目的文件存在，则询问是否覆盖
alias py="python3"
alias p2="python"
alias pip="pip3"
alias pip2="pip2"
alias cd..="cd .." # 输入错误时，正确解析
alias cddesk="cd ~/Desktop"
alias cdd="cd ~/Downloads"
alias path="echo -e ${PATH//:/\\\n}" # -e 激活转义字符
alias c="clear"