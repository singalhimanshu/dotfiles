" :setlocal makeprg=python\ %
" :setlocal errorformat=

" Set makeprg to run the Python script
set makeprg=python\ %

" Set errorformat to handle Python errors
" set errorformat=%A\ %#File\ \"%f\"\\,\ line\ %l\\,\ in\ %o,%Z\ %#%m

" File "/home/himanshu/repos/scripts/dr/main2.py", line 9                                                                          
"     ef kill(instruction):                                                                                                          
"        ^                                                                                                                           
" SyntaxError: invalid syntax
set errorformat=%E\ \ File\ \"%f\"\\,\ line\ %l,


