# Dotfiles 配置指南

这是 shaobohan917 的个人 dotfiles 配置，由 chezmoi 管理。当前同步目标是 **fish shell**；敏感信息和设备专属状态不纳入仓库。

## 快速开始（另一台电脑首次配置）

### 前置条件
- 已安装 Homebrew
- 已配置 GitHub SSH Key
- 已安装或可使用 git

### 1. 安装 chezmoi 并应用配置

```bash
brew install chezmoi
git config --global url."git@github.com:".insteadOf "https://github.com/"
chezmoi init --apply git@github.com:shaobohan917/dotfiles.git
```

`chezmoi` 默认将源目录放在 `$(chezmoi source-path)`（通常是 `~/.local/share/chezmoi`），不是 `~/dotfiles`。

### 2. 安装 Homebrew 包

```bash
brew bundle --file="$(chezmoi source-path)/Brewfile"
```

Brewfile 会安装 fish、Starship、fzf、lsd、zoxide 等 fish 配置依赖，以及其他个人工具。包安装失败时可以先执行 `brew update`，再使用 `--verbose` 重试。

### 3. 将 fish 设为登录 Shell

```bash
chsh -s "$(command -v fish)"
exec fish -l
```

如果 `command -v fish` 没有输出，先确认 Brewfile 已安装成功。

### 4. 配置本机专属内容

敏感环境变量、SSH Key、Docker 上下文、Conda/OrbStack 等设备专属配置不要写入仓库。可在本机创建 `~/.config/fish/conf.d/local.fish` 保存个人环境变量；该文件不由本仓库管理。

### 5. 验证

```fish
fish -n ~/.config/fish/config.fish
starship --version
chezmoi status
```

## 日常同步

### 当前电脑：修改 fish 配置并推送前检查

本仓库目录和当前机器默认的 chezmoi 源目录可能不是同一个目录。若以本仓库作为源目录，使用显式 `--source`：

```fish
cd ~/Project/Github/dotfiles
chezmoi --source $PWD diff
fish -n dot_config/fish/config.fish
git diff --check
```

若要把当前生效的 fish 配置写回本仓库：

```fish
chezmoi --source $PWD add ~/.config/fish/config.fish
```

确认 `git diff` 没有敏感信息后，再由维护者自行执行 `git add`、`git commit` 和 `git push`。

### 另一台电脑：拉取更新

```fish
chezmoi update
brew bundle --file="$(chezmoi source-path)/Brewfile"
exec fish -l
```

## 配置文件

### Shell & Prompt
- `dot_config/fish/config.fish` → `~/.config/fish/config.fish`
- `dot_config/starship.toml` → `~/.config/starship.toml`

### 开发工具
- `dot_gitconfig` → `~/.gitconfig`
- `dot_npmrc` → `~/.npmrc`
- `dot_local_bin_env` → `~/.local/bin/env`
- `private_dot_claude/` → `~/.claude/`
- `dot_gemini/` → `~/.gemini/`

### 应用配置
- Claude Desktop
- VS Code
- Codex
- OpenCode

### Homebrew
- `Brewfile`：Homebrew formula、cask 和 VS Code 扩展列表

## 注意事项

1. 敏感信息和设备特定配置只保存在本机，不同步到 Git。
2. 迁移到新设备时先安装 Brewfile，再检查 fish、Starship、fzf、lsd、zoxide 是否可用。
3. 同步前运行 `git diff --check`，并人工检查 `git diff`，确认没有密钥或个人状态文件。

**仓库地址**: `git@github.com:shaobohan917/dotfiles.git`
**维护者**: shaobohan917
