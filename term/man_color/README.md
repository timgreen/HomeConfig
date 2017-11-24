mkdir ~/.terminfo/ && cd ~/.terminfo
wget http://nion.modprobe.de/mostlike.txt
tic mostlike.txt
#rm -f mostlike.txt
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"

# infocmp mostlike if you'd like to change terminfo file.
