# paths
PATH="/usr/bin:/bin:/usr/sbin:/sbin"

# sublime text 2 bin paths
PATH="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin:${PATH}"

if [ -d "/usr/local" ]; then
 PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

MANPATH="/usr/share/man:/usr/local/share/man"

export PATH MANPATH

# home bin path
if [ -d "$HOME/.bin" ]; then
 export PATH="$HOME/.bin:$PATH"
fi

# Github dotfiles (be sure to source this last)
if [ -f ~/.bash_dotfiles.sh ]; then
    . ~/.bash_dotfiles.sh
fi
