##########################
# Update PATH for binaries
##########################

set PATH $PATH "/usr/local/bin"
set PATH $PATH "/opt/nvim-linux-x86_64/bin/"
set PATH $PATH "$HOME/.local/bin"
set PATH $PATH "$HOME/scripts"
set PATH $PATH "$HOME/.cargo/bin"
set PATH $PATH "$HOME/go/bin"
set ENCORE_INSTALL "$HOME/.encore"
set PATH $PATH "$ENCORE_INSTALL/bin"

set -x EDITOR "nvim"

source $HOME/.config/fish/alias.fish
source $HOME/.config/fish/bun.fish
set -U fish_greeting

##################
## Straship prompt
##################

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

###############
# Programs init
###############

zoxide init fish | source
mise activate fish | source

#############
# Multiplexer set up
#############

# starting herdr cause a weird bug - starting manually at each startup

#######
# pnpm
#######

set -gx PNPM_HOME "/home/nprimo/.local/share/pnpm/bin"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# opencode
fish_add_path /home/nprimo/.opencode/bin
