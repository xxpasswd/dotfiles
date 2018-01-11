# 函数
function cdw()
{
	if [ -d ~/working ]; then
		cd ~/working
	else
		mkdir ~/working
		cd ~/working
	fi
}



# 别名设置
alias py="python"