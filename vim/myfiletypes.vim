" Automatic syntax highlighting for other languages

augroup filetype
	au!
	au! BufRead,BufNewFile *.rl	set filetype=ragel
augroup END

