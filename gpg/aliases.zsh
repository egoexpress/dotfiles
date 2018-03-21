. ~/.private/gpg/*

# get missing GPG keys
alias gpg-get-missing="gpg --list-sigs ${GPG_KEY} | 
	grep 'User ID' | 
	sed 's|sig\ 2*3*\ *P*N*||g' | 
	awk '{print $1}' | 
	sort | 
	uniq | 
	xargs gpg --recv-keys"

