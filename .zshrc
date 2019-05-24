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


# ==========================================================================
#                              Aliases
# ==========================================================================
# General Purpose
alias la='ls -a'			  # show all
alias ll='ls -alrt'			  # show all, long, reverse, time
alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias open='xdg-open'
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ..='cd ..'			  # Shorten moving up the filepath
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias vi=vim				  # VIM by DEFAULT
alias svi='sudo vi'
alias vis='vim "+set si"'
alias ping='ping -c 10 -s .2 -i .2'
alias chrome='/opt/google/chrome/chrome'  # Repeat for all browsers
alias ports='netstat -tulanp'		  # Show all open ports


# ==========================================================================
#                               Functions
# ==========================================================================


# ===========================================================================
#                          zplug Configurations
# ===========================================================================
# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-syntax-highlighting"

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
