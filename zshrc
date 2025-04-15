# ==========================================================================
#                           Declare Variables
# ==========================================================================
# Common ENV Variables
export SHELL="/bin/zsh"
export EDITOR="vim"

# Path to my oh-my-zsh installation
export ZSH="/home/h3r0/.oh-my-zsh"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

# Driver issue resolution for pygame and other libraries using C++
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

export TERM="xterm-256color"
export COLORTERM="truecolor"

# ==========================================================================
#                         Loading From Sources
# ==========================================================================
# Import powerlevel9k
# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
# Import oh-my-zsh
# source $ZSH/oh-my-zsh.sh
# Import zplug
source $HOME/.zplug/init.zsh

# ==========================================================================
#                      POWERLEVEL9K Configurations
# ==========================================================================
# P9K_PROMPT_ON_NEWLINE=true
# P9K_PROMPT_ADD_NEWLINE=true


# ==========================================================================
#                       oh-my-zsh Configurations
# ==========================================================================
# ZSH_THEME="spaceship"
# Plugins for oh-my-zsh
# plugins=(git)
# autoload -U compinit
# compinit


# ==========================================================================
#                              Aliases
# ==========================================================================
# General Purpose
alias e='cd ~/code/excelsior/'
alias ls='exa'
alias l='ls'				  # for when I hit enter too fast \_(*_*)_/
alias la='ls -a'			  # show all
alias ll='ls -alrt'			  # show all, long, reverse, time
alias cp='cp -i'                          # confirm before overwriting something
# alias df='df -h'                          # human-readable sizes
alias open='xdg-open'
# alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
alias more=less
alias ..='cd ..'			  # Shorten moving up the filepath
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias vi=vim				  # VIM by DEFAULT
# alias svi='sudo vi'
# alias vis='vim "+set si"'
# alias ping='ping -c 10 -s .2 -i .2 google.com'
alias chrome='/opt/google/chrome/chrome'  # Repeat for all browsers
alias ports='netstat -tulanp'		  # Show all open ports
# alias vba='visualboyadvance-m &|'	  # Launch VBA-M from terminal
alias bye='exit'
alias qacp='pwd; git add -A; git commit -m "update"; git push'
alias c='clear'
alias powerup='sudo su'
alias palmetto='ssh ckalahi@slogin.palmetto.clemson.edu'
alias ivy='ssh ckalahi@ivy2.cs.clemson.edu'
alias anvil='ssh x-ckalahiki@anvil.rcac.purdue.edu'
alias gemini='python /home/h3r0/code/jarvis/src/gemini-pro-cli.py'
alias pi='ssh kalahiki'

# ==========================================================================
#                               Functions
# ==========================================================================


# ===========================================================================
#                          zplug Configurations
# ===========================================================================
# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug zdharma/fast-syntax-highlighting, defer:2
# zplug "trapd00r/LS_COLORS", use:"LS_COLORS", defer:3
zplug "joel-porquet/zsh-dircolors-solarized", defer:3

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Load theme
# zplug "themes/amuse", from:oh-my-zsh, as:theme
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# ===========================================================================
#                                Options
# ===========================================================================


# ===========================================================================
#                             Key Bindings
# ===========================================================================


# ===========================================================================
#                          Start-Up Processes
# ===========================================================================
if zplug check "denysdovhan/spaceship-prompt"; then
    SPACESHIP_PROMPT_ORDER=(
    # time        # Time stampts section (Disabled)
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    jobs          # Background jobs indicator
    char          # Prompt character
    )

    SPACESHIP_RPROMPT_ORDER=(
    exit_code     # Exit code section
    time
    )

    SPACESHIP_TIME_SHOW=true
    SPACESHIP_EXIT_CODE_SHOW=true

    SPACESHIP_PROMPT_SEPARATE_LINE=false
    SPACESHIP_PROMPT_ADD_NEWLINE=true

    #SPACESHIP_PROMPT_SEPARATE_LINE=false
    #SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

    #PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '
    #RPROMPT='[%F{yellow}%?%f]'
fi

# bun completions
[ -s "/home/h3r0/.bun/_bun" ] && source "/home/h3r0/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/h3r0/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/h3r0/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/h3r0/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/h3r0/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opt/openmpi/lib

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/h3r0/google-cloud-sdk/path.zsh.inc' ]; then . '/home/h3r0/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/h3r0/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/h3r0/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

# ==========================================================================
#                               Open Tmux
# ==========================================================================
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

