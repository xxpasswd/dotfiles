# zsh需要添加下面两行
autoload bashcompinit
bashcompinit

_dotfile() 
 {
     local cur prev opts
     COMPREPLY=()
     cur="${COMP_WORDS[COMP_CWORD]}"  # s2的值  
     prev="${COMP_WORDS[COMP_CWORD-1]}" # s3的值
  
     common_lifecycle_phases="open help push"
      
 	 # 生成补全结果，等待bash读取
     COMPREPLY=( $(compgen -W "${common_lifecycle_phases}" -- ${cur}) )
 
 }
 
 complete -F _dotfile dotfile
 

 # bash补全文档学习：https://segmentfault.com/a/1190000002968878