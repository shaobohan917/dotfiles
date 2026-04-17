# Fish Shell Configuration

# ===== 环境变量 =====
set -x PATH $PATH /Users/luka/Library/Android/sdk/platform-tools
set -x PATH $PATH /Users/luka/Documents/Project/Github/claw-code/rust/target/release

# Alibaba Cloud DashScope (通义千问)
set -x DASHSCOPE_API_KEY "sk-sp-55ceb0b0730043009d5ba68955ab4aba"
set -x CLAW_DEFAULT_MODEL "qwen3.5-plus"

# Homebrew 镜像加速
set -x HOMEBREW_AUTO_UPDATE_SECS 86400
set -x HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
set -x HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
set -x HOMEBREW_BOTTLE_DOMAIN "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# ===== Alias =====
alias python python3
alias pip pip3

# lsd (ls deluxe) - 现代化的 ls 替代品
alias ls 'lsd'
alias l 'lsd -l'
alias ll 'lsd -l'
alias lt 'lsd --tree'
alias la 'lsd -la'

# 目录跳转
alias work 'cd /Users/luka/Documents/Work'
alias proj 'cd /Users/luka/Documents/Project'
alias app 'cd /Users/luka/Documents/Work/app'

# ===== Starship Prompt =====
starship init fish | source

# ===== FZF 集成 =====
# 如果安装了 fzf，启用 fish 集成
if command -v fzf >/dev/null
    # fzf 的 fish 集成通常会自动加载
end

# ===== Z 集成 =====
# 如果安装了 zoxide，使用 z 命令
if command -v zoxide >/dev/null
    zoxide init fish | source
end
