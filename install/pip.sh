# python安装包
apps=(
	'cheat'
	)

pip=$(which pip)
[ -x $pip ] && pip install ${apps[@]}