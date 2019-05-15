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
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
# Import oh-my-zsh
source $ZSH/oh-my-zsh.sh
# Import zplug
source $HOME/.zplug/init.sh

# ==========================================================================
#                      POWERLEVEL9K Configurations
# ==========================================================================
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true


# ==========================================================================
#                       oh-my-zsh Configurations
# ==========================================================================
# ZSH_THEME="awesomepanda"
# Plugins for oh-my-zsh
plugins=(git)


# ==========================================================================
#                              Aliases
# ==========================================================================
# General Purpose
alias alex='ssh -i .ssh/goodvibesforalex.pem ec2-user@ec2-54-175-235-39.compute-1.amazonaws.com'
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

# For Work
alias powerup='sudo su - wladmin'
alias cybergrep='grep -nr "*cyberark*" .'
alias route66='cd /SWA/weblogic/mxi/srvr/mx-server-8.3-2100/apps/assetmanagement/resource/property/'
alias highway12='cd /opt/tomcat/servers/'
alias greatriverroad='cd /opt/release_mgmt/scripts/common/bin/'
#alias mtxlogs=“tail -f /SWA/weblogic/mxi/srvr/mx-server-8.3-2100/domain/servers/server-$(hostname)/logs/maintenix.log”


# ==========================================================================
#                               Functions
# ==========================================================================
# For Work
readjar() { unzip -c "$@" | less -I; }	# <jar>
findname() { find . -name "$1"; }	# <file name>
# <SWAAPP-ID> <SAFEID> <NAME>
getCARKpass() { /opt/CARKaim/sdk/clipasswordsdk GetPassword -p AppDescs.AppID="$1" -p Query="Folder=root;Safe='$2';Object='$3'" -o PassProps.Address,PassProps.UserName,Password; }
thelogs() { scp "$1"@"$2":/opt/tomcat/servers/"$3"/logs/catalina.out ~; }	# <user> <host> <ServiceName>
getakey() { ssh-keygen -t rsa -C "$1"; }	# <your email>
# <Version Number>
#killit() { curl --request DELETE --user "mx-deploy-user:hw99" https://nexus-tools.swacorp.com/MX/service/local/repositories/CI/content/com/swacorp/mx/lp/lp-message-relay/"$1"; }


# ===========================================================================
#                          zplug Configurations
# ===========================================================================
# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
zplug "modules/prompt", from:prezto

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    use:get_last_pane_path.sh

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
zplug "~/.zsh", from:local

# Load theme file
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


# ===========================================================================
#                                Options
# ===========================================================================


# ===========================================================================
#                             Key Bindings
# ===========================================================================


# ===========================================================================
#                          Start-Up Processes
# ===========================================================================
