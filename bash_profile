# Set up a fancy pants prompt with colored pwd, ruby, and git info

# be sure to define the colors
# for ease in setting fancy ps1 stuff

txtblk='\033[00;30m' # Black - Regular
txtred='\033[00;31m' # Red
txtgrn='\033[00;32m' # Green
txtylw='\033[00;33m' # Yellow
txtblu='\033[00;34m' # Blue
txtpur='\033[00;35m' # Purple
txtcyn='\033[00;36m' # Cyan
txtwht='\033[00;37m' # White
bldblk='\033[01;30m' # Black - Bold
bldred='\033[01;31m' # Red
bldgrn='\033[01;32m' # Green
bldylw='\033[01;33m' # Yellow
bldblu='\033[01;34m' # Blue
bldpur='\033[01;35m' # Purple
bldcyn='\033[01;36m' # Cyan
bldwht='\033[01;37m' # White
unkblk='\033[04;30m' # Black - Underline
undred='\033[04;31m' # Red
undgrn='\033[04;32m' # Green
undylw='\033[04;33m' # Yellow
undblu='\033[04;34m' # Blue
undpur='\033[04;35m' # Purple
undcyn='\033[04;36m' # Cyan
undwht='\033[04;37m' # White
bakblk='\033[40m' # Black - Background
bakred='\033[41m' # Red
badgrn='\033[42m' # Green
bakylw='\033[43m' # Yellow
bakblu='\033[44m' # Blue
bakpur='\033[45m' # Purple
bakcyn='\033[46m' # Cyan
bakwht='\033[47m' # White
txtrst='\033[00m' # Text Reset

# Set up fancy pants colors in ls
# yellow dirs, green exec, cyan sym links, rest defaulted
# man ls for the details
export CLICOLOR=true
export LSCOLORS=dxgxfxexcxegedabagacad

# git completion, also contains ps1 stuff
if [ -f ~/.bash/git_completion ]; then
  . ~/.bash/git_completion
fi

# used in the ps1 stuff
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}



PS1=""


PS1=$PS1"\[$bldylw\]\w\[$txtrst\]" # => pwd (in yellow, bold)


PS1=$PS1'$(__git_ps1 "[\[$txtgrn\]%s\[$txtylw\]$(parse_git_dirty)\[$txtrst\]]")'
                                                    # => [in brackets] (default color)...
                                                    # => git branch name (in green)
                                                    # => followed by asterisk (in yellow)
                                                    # (if dirty)

PS1=$PS1"\[$txtrst\]\$ " # => dollar sign with space
                                         # (in default color)
export PS1

# paths
PATH="/usr/bin:/bin:/usr/sbin:/sbin"

# needed to use pygments to render jekyll sites locally
PATH="/usr/local/share/python:${PATH}"

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

alias ls='ls -F'
alias la='ls -A'
alias l='ls -lhF'
alias ll='ls -lahF'
alias ..='cd ..'

alias path='echo -e ${PATH//:/\\\n}'
alias targz='tar xzvf'

# for some reason rbenv won't create a 'qw' shim on rehash??
# alias qw="`rb gemdir`/../bin/qw --editor `which mate`"
alias bx="bundle exec"
alias cap="bx cap"
alias rake="bx rake"
alias irb="pry --simple-prompt"
alias pry="pry --simple-prompt"

alias tlog='mkdir -p log; touch log/development.log; tail -f log/development.log'
alias rst='touch tmp/restart.txt'

alias sub='subl'
alias mate='subl'

alias readme='test -x `which redcarpet` && test -f ./README.md && redcarpet README.md > ~/.Trash/readme.html && open ~/.Trash/readme.html'



