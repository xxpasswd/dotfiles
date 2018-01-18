dotfile=$(which dotfile)
# 加载zsh自动补全插件
autoload bashcompinit
bashcompinit
[ -x $dotfile ] && eval "$(_DOTFILE_COMPLETE=source $dotfile)"