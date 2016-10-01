# .bash_profile file, inspired by Oliver :)
# brainseller
# 20150302

# the directory where bash configuration files reside
INIT_DIR="${HOME}/.dotfiles/bash"

# to make local configurations, add these files into this directory:
# bash_extras
# bash_aliases
# bash_settings
# bash_welcome

# this line, e.g.,  protects the functionality of rsync by only turning on the below if the shell is in interactive mode
# In particular, rsync fails if things are echo-ed to the terminal
[[ "$-" != *i* ]] && return

# color definitions
green="\033[0;32m"
NC="\033[0m"
# bash welcome
if [ -e "${INIT_DIR}/bash_welcome" ]; then
  cat ${INIT_DIR}/bash_welcome
fi

#--------------------LOCAL------------------------------

# extras
# extras are aliases, functions and settings, that should not be shared publically (read via github)
if [ -e "${INIT_DIR}/bash_extras" ]; then
  source "${INIT_DIR}/bash_extras"
  echo -e "   extras loaded ${green}✓${NC}"
fi
# aliases
if [ -e "${INIT_DIR}/bash_aliases" ]; then
  source "${INIT_DIR}/bash_aliases"
  echo -e "   aliases loaded ${green}✓${NC}"
fi
# settings
if [ -e "${INIT_DIR}/bash_settings" ]; then
  source "${INIT_DIR}/bash_settings"
  echo -e "   settings loaded ${green}✓${NC}"
fi
# functions
if [ -e "${INIT_DIR}/bash_functions" ]; then
  source "${INIT_DIR}/bash_functions"
  echo -e "   functions loaded ${green}✓${NC}"
fi
# git prompt
# git prompt could be installed via 'brew install bash-git-prompt' unfortunately styling the prompt must be done in the cellar. See more in bash_settings
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
    echo -e "   git-prompt loaded ${green}✓${NC}"
fi

echo
echo "---------------------------------------------------------------"
echo
