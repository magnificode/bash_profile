export PATH=$PATH:/Applications/MAMP/Library/bin
export PATH=$PATH:~/bin/git-open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

################
#   Aliases
################

# management
alias cds='cd /Applications/MAMP/htdocs/sites'
alias cl='clear'
alias wpcon='subl wp-config.php'
alias subl='/Applications/Sublime\ Text\ 3.app/Contents/SharedSupport/bin/subl'

# git helpers
alias ga='git add'
alias gaa='git add --all'
alias gp='git push'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg='git lg'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gme='git merge --no-ff'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gpod='git push origin dev'
 function gm() {
    git commit -m "$*"
}
function gaa() {
    git add --all 'git rev-parse --show-toplevel'
}


################
#   Coloring
################

#Function that outputs the branch you are on when in a git project.

function git_info() {
    # check if we're in a git repo
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # quickest check for what branch we're on
    branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

    # check if it's dirty (via github.com/sindresorhus/pure)
    dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

    echo ' ['$branch$dirty']'
}

#Terminal Prompt
PS1="\w\$(git_info)\n\[\e[0;35m\]\[\e[40m\]::\[\e[m\]\[\e[m\] ";
#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#sets up the prompt color (currently a green similar to linux terminal)
# export PS1='\# \W |  '
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'

################
# get image dimensions
################
alias imgdim='sips -g pixelHeight -g pixelWidth $1'

################
# Zip
################
alias zip='zip -r'

function siteurl() { mysql -hlocalhost -uroot -proot -e "USE "$1"; SELECT option_value FROM wp_options WHERE option_name = 'siteurl'"; }