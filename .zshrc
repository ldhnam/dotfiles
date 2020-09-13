# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ldhnam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   kubectl
   zsh-syntax-highlighting
   kubetail
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
plugins=(
   git
   zsh-syntax-highlighting
)
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ldhnam/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ldhnam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ldhnam/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ldhnam/google-cloud-sdk/completion.zsh.inc'; fi

alias vim=nvim
alias pip=pip3
export EDITOR=nvim
export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -s /Users/ldhnam/.autojump/etc/profile.d/autojump.sh ]] && source /Users/ldhnam/.autojump/etc/profile.d/autojump.sh

#Alias
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(kubectl completion zsh)

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOPRIVATE=git.begroup.team,git.veep.tech,github.com
export GOOGLE_APPLICATION_CREDENTIALS=~/application_default_credentials.json
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

function _git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="‚û¶ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  echo "${ref/refs\/heads\//‚≠† }$(parse_git_dirty)"
}

function _git_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    local BG_COLOR=green
    if [[ -n $(parse_git_dirty) ]]; then
      BG_COLOR=yellow
      FG_COLOR=black
    fi

    if [[ ! -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        BG_COLOR=red
        FG_COLOR=white
    fi
    echo "%{%K{$BG_COLOR}%}‚ÆÄ%{%F{$FG_COLOR}%} $(_git_prompt_info) %{%F{$BG_COLOR}%K{blue}%}‚ÆÄ"
  else
    echo "%{%K{blue}%}‚ÆÄ"
  fi
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT_HOST='%{%b%F{gray}%K{black}%} %(?.%{%F{green}%}‚úî.%{%F{red}%}‚úò)%{%F{yellow}%} %n %{%F{black}%}'
PROMPT_DIR='%{%F{white}%} %~%  '
PROMPT_SU='%(!.%{%k%F{blue}%K{black}%}‚ÆÄ%{%F{yellow}%} ‚ö° %{%k%F{black}%}.%{%k%F{blue}%})‚ÆÄ%{%f%k%b%}'

PROMPT='%{%f%b%k%}$PROMPT_HOST$(_git_info)$PROMPT_DIR$PROMPT_SU
$(virtualenv_info)‚ùØ '
RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

function prepend_path() {
    [[ ! -d "$1" ]] && return

    path=(
        $1
        $path
    )
}

prepend_path $HOME/bin

export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export PATH="$PATH:~/development/flutter/bin"
export PATH=/usr/local/opt/mysql-client@5.7/bin:/usr/local/opt/python/libexec/bin:/Users/ldhnam/.autojump/bin:/Users/ldhnam/google-cloud-sdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ldhnam/.oh-my-zsh/custom/plugins/kubetail:/Users/ldhnam/.fzf/bin:/Users/ldhnam/go/bin:/usr/local/opt/go/libexec/bin:~/development/flutter/bin:/Users/ldhnam/development/day_night_login/flutter/bin

source $HOME/.cargo/env
