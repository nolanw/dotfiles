# Source everything in bash folder and its subfolders.
for f in ~/.bash/* ; do 
    if [ -d "$f" ]; then
        source "$f"/*
    else
        source "$f"
    fi
done

# Source local additions.
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

