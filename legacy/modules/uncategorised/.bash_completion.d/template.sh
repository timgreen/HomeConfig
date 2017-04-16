have template.sh &&
_template() {
	local filetype list cur tlist;
	
	cur=${COMP_WORDS[COMP_CWORD]};
	TEMPLATE_DIR=~/Templates;
	
	list=$(ls $TEMPLATE_DIR | awk -F. '{print $NF}' | sort -u);

	COMPREPLY=();

	if [ $COMP_CWORD -eq 1 ];
	then
		COMPREPLY=($(compgen -W '$list' $cur));
		return 0;
	fi
	
	filetype=${COMP_WORDS[1]};
	if [ $COMP_CWORD -eq 2 ];
	then
		tlist=$(ls "$TEMPLATE_DIR" | egrep "\.$filetype$" | sed "s/\.$filetype$//");
		COMPREPLY=($(compgen -W '$tlist' $cur));
		return 0;
	fi

	if [ $COMP_CWORD -eq 3 ];
	then
		tlist=$(ls | grep "\.$filetype$" | sed "s/\.$filetype$//");
		COMPREPLY=($(compgen -W '$tlist' $cur));
		return 0;
	fi

	return 0
}
complete -F _template template.sh
