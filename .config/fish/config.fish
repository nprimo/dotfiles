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
jj util completion fish | source
mise activate fish | source

#############
# TMUX set up
#############

if status is-interactive
and not set -q TMUX
  set session "base"
  if not tmux has-session -t "$session" 2>/dev/null
      tmux new-session -s "$session" -d
  end
  tmux attach -t "$session"
end

#######
# pnpm
#######

set -gx PNPM_HOME "/home/nprimo/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# opencode
fish_add_path /home/nprimo/.opencode/bin
