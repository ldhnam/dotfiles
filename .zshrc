# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ldhnam/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
  history-substring-search
  zsh-syntax-highlighting
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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
plugins=(git)

alias vim=nvim

export EDITOR=nvim
#export PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[pink]%}%D{%T}%{$reset_color%} [$(whoami)] %{$fg_bold[blue]%}%c $(git_prompt_info)% %{$reset_color%}'
export TERM=xterm-256color
#export TERM="screen-256color"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
[ -f ~/.zsh_utils.zsh ] && source ~/.zsh_utils.zsh

export GOPATH=$HOME/go/src/
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
#export GO111MODULE=on
export ANDROID_HOME=/Users/ldhnam/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/bin
export PATH=$ANDROID_HOME/platform-tools:$PATH
# export PATH=$HOME/development/zephir
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

# Sytax highlighting: git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.zsh/
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ldhnam/development/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ldhnam/development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ldhnam/development/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ldhnam/development/google-cloud-sdk/completion.zsh.inc'; fi

source $HOME/.cargo/env
export GITHUB_TOKEN="14b749502839a940cc598c2f5c8cac45b34713b8"

#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export HOMEBREW_GITHUB_API_TOKEN=00fdb0be9e0a9336be16cca99ca94f27e1d1b556
export PATH="$PATH:/Users/ldhnam/development/flutter/bin"

# Python Version Manager
export PATH="$PATH:$HOME/.pyenv/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init -)"

#K8S
export KUBECONFIG="/Users/ldhnam/.kube/config:/Users/ldhnam/.kube/checkout.config:/Users/ldhnam/.kube/staging.config:/Users/ldhnam/.kube/dev.config"
export LC_ALL=en_US.UTF-8

kube-init-config() {
    if [[ $(ls ~/.kube | egrep "\.config$" | wc -l) -ne 0 ]] ; then
        export KUBECONFIG="${HOME}/.kube/config"
        for f_config in $(ls ~/.kube | egrep "\.config$") ; do
            export KUBECONFIG="$KUBECONFIG:$HOME/.kube/$f_config"
        done
    fi
}

ZSH_THEME_GIT_PROMPT_DIRTY='±'

function _git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  echo "${ref/refs\/heads\//⭠ }$(parse_git_dirty)"
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
    echo "%{%K{$BG_COLOR}%}⮀%{%F{$FG_COLOR}%} $(_git_prompt_info) %{%F{$BG_COLOR}%K{blue}%}⮀"
  else
    echo "%{%K{blue}%}⮀"
  fi
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT_HOST='%{%b%F{gray}%K{black}%} %(?.%{%F{green}%}✔.%{%F{red}%}✘)%{%F{yellow}%} %n %{%F{black}%}'
PROMPT_DIR='%{%F{white}%} %~%  '
PROMPT_SU='%(!.%{%k%F{blue}%K{black}%}⮀%{%F{yellow}%} ⚡ %{%k%F{black}%}.%{%k%F{blue}%})⮀%{%f%k%b%}'

PROMPT='%{%f%b%k%}$PROMPT_HOST$(_git_info)$PROMPT_DIR$PROMPT_SU
$(virtualenv_info)❯ '
RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

curl_time() {
    curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}
