call SetTabIndent(2)
call SetTextWidth(100)
set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/home/timgreen/.jsl.conf'\ -process\ %
set errorformat=%f(%l):\ %m
