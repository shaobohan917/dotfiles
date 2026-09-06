# Fish Shell Configuration

# Homebrew 配置
set -gx HOMEBREW_AUTO_UPDATE_SECS 86400
set -gx HOMEBREW_NO_ASK 1

# Python
if command -q python3
    alias python python3
end
if command -q pip3
    alias pip pip3
end

# lsd (ls deluxe) - 现代化的 ls 替代品
alias ls 'lsd'
alias l 'lsd -l'
alias ll 'lsd -l'
alias lt 'lsd --tree'
alias la 'lsd -la'

# 目录跳转
alias proj 'cd $HOME/Project'

# Claude Code 危险模式 (跳过权限确认)
alias cc 'claude --dangerously-skip-permissions'

# Starship Prompt
if command -q starship
    starship init fish | source
end

# Z 集成
if command -q zoxide
    zoxide init fish | source
end

# pnpm 与本地用户命令
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path "$PNPM_HOME/bin"
fish_add_path "$HOME/.local/bin"
