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
#                                Plugins
# ===========================================================================


# ===========================================================================
#                                Options
# ===========================================================================


# ===========================================================================
#                             Key Bindings
# ===========================================================================
