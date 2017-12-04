## 关于历史纪录的配置 {{{
export HISTSIZE=10000                  # 历史纪录条目数量
export SAVEHIST=10000                  # 注销后保存的历史纪录条目数量
export HISTFILE=~/.zhistory            # 历史纪录文件

setopt BANG_HIST                       # Perform textual history expansion, csh-style, treating the character '!' specially
setopt INC_APPEND_HISTORY              # 以附加的方式写入历史纪录
setopt HIST_IGNORE_ALL_DUPS            # 历史纪录中只保留一个
setopt HIST_FIND_NO_DUPS               # No dup result in history search
setopt EXTENDED_HISTORY                # 为历史纪录中的命令添加时间戳
setopt HIST_SAVE_NO_DUPS               # No dups on history saving
setopt HIST_SAVE_BY_COPY               # Write to $HISTFILE.new then rename it
setopt HIST_IGNORE_SPACE               # 在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_NO_STORE                   # Remove hists access cmds from hist
setopt HIST_NO_FUNCTIONS               # Don't save function define
setopt HIST_REDUCE_BLANKS              # Remove superfluous blanks from each command line being added to the history list
setopt INC_APPEND_HISTORY              # Added to the $HISTFILE incrementally
## }}}

## cd {{{
setopt AUTO_PUSHD                      # 启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt NO_AUTO_CD                      # 输入文件名不直接进入目录
setopt PUSHD_IGNORE_DUPS               # 相同的历史路径只保留一个
## }}}

## 杂项 {{{
setopt NO_FLOW_CONTROL                 # Ignore ^S/^Q
LISTPROMPT=''                          # Don't ask me 'do you wish to see all XX possibilities' before menu selection
setopt INTERACTIVE_COMMENTS            # 允许在交互模式中使用注释  例如：cmd #这是注释
limit coredumpsize 0                   # 禁用 core dumps
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'      # 单词分界  去掉了 '.' '/'
MENUPROMPT=                            # Show the default prompt while scrolling during menu selection
setopt LIST_ROWS_FIRST LIST_PACKED     #
setopt LONG_LIST_JOBS                  # List jobs in the long format by default
REPORTTIME=2                           # Report time if execution exceeds amount of seconds, format defined in TIMEFMT, default is '%E real  %U user  %S system  %P %J'
## }}}

