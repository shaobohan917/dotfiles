# Dotfiles 配置指南

这是 shaobohan917 的个人 dotfiles 配置，由 chezmoi 管理。

## 快速开始（另一台电脑首次配置）

### 前置条件
- 已安装 Homebrew
- 已配置 GitHub SSH Key
- 已安装 git

### 步骤 1：安装 chezmoi
```bash
brew install chezmoi
```

### 步骤 2：拉取并应用配置
```bash
chezmoi init --apply shaobohan917
```

这会自动：
- 克隆 dotfiles 仓库到 `~/dotfiles`
- 将所有配置文件链接到正确位置
- 创建必要的目录结构

### 步骤 3：安装 Homebrew 包
```bash
cd ~/dotfiles && brew bundle install
```

这会安装 Brewfile 中列出的所有包（约 80+ 个）。

### 步骤 4：手动配置 API Keys

以下文件需要手动输入敏感信息：

**~/.zshrc** - 编辑以下变量：
```bash
export DASHSCOPE_API_KEY="你的密钥"
export CLAW_DEFAULT_MODEL="qwen3.5-plus"
```

**~/.local/bin/env** - 编辑环境变量（如果文件存在）

**~/.claude/settings.json** - 配置个人设置

### 步骤 5：验证配置
```bash
# 重新加载 Shell
source ~/.zshrc

# 验证 Starship
starship --version

# 验证 chezmoi 状态
chezmoi status
```

---

## 后续同步

### 本机推送更新
```bash
# 添加更改的文件
chezmoi add ~/.zshrc

# 推送到 GitHub
cd ~/dotfiles
git add .
git commit -m "描述更改"
git push
```

### 另一台电脑拉取更新
```bash
chezmoi update
```

---

## 配置文件列表

### Shell & Prompt
- `.zshrc` - Zsh 配置
- `.config/starship.toml` - Starship 提示符 (Tokyo Night 主题)

### AI 工具
- `.claude/CLAUDE.md` - Claude Code 全局指令
- `.claude/settings.json` - Claude Code 设置
- `.gemini/settings.json` - Gemini CLI 设置
- `.claw/` - Claw 配置
- `.config/clawhub_config.json` - ClawHub 配置

### 开发工具
- `.gitconfig` - Git 配置
- `.npmrc` - NPM 配置
- `.local/bin/env` - 环境变量

### 应用配置
- `Library_Application_Support_Claude*_claude_desktop_config.json` - Claude Desktop
- `Library_Application_Support_Code_User_settings.json` - VSCode
- `Library_Application_Support_Codex_Preferences` - Codex
- `Library_Application_Support_OpenClaw/` - OpenClaw
- `Library_Application_Support_ai_opencode_desktop/` - OpenCode

### Homebrew
- `Brewfile` - 所有 Homebrew 包列表

---

## 故障排除

### 如果 chezmoi 失败
```bash
# 检查状态
chezmoi doctor

# 强制重新应用
chezmoi apply --force
```

### 如果 SSH 失败
```bash
# 测试 GitHub SSH
ssh -T git@github.com
```

### 如果 Brew 安装失败
```bash
# 更新 Brew
brew update

# 逐个安装包
brew bundle install --verbose
```

---

## 注意事项

1. **敏感信息**：API Keys 需要手动输入，不会同步
2. **设备特定配置**：如 SSH Key、Docker 上下文等需要单独配置
3. **同步前检查**：推送前确保没有敏感信息泄露

---

**仓库地址**: https://github.com/shaobohan917/dotfiles  
**维护者**: shaobohan917
