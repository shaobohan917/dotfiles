# Claude Code 全局自定义规则

## 交流规则

### 语言和格式要求
- **使用中文回复**：所有回复必须使用中文，除非代码注释或技术术语需要英文
- **成语结尾**：每次回复的结尾必须附上一个相关的中文成语

## Git 仓库操作规则

### 代码提交审批（最高优先级）
- **禁止私自提交代码**：在没有用户明确允许的情况下，绝对不能执行 git commit 或 git push 操作
- **必须征得同意**：在执行任何代码提交前，必须先询问用户是否可以提交
- **违规后果**：此规则为最高优先级，违反将被视为严重错误

### GitHub SSH 优先策略
- **强制使用 SSH 协议**：在所有 GitHub 仓库操作中，必须使用 SSH 方式（git@github.com:）而不是 HTTPS 方式（https://github.com/）
- **适用场景**：
  - `git clone` 操作
  - `git remote add` 添加远程仓库
  - `git remote set-url` 修改远程仓库地址
  - `git push` 和 `git pull` 操作
- **URL 格式**：
  - ✅ 正确：`git@github.com:username/repo.git`
  - ❌ 错误：`https://github.com/username/repo.git`

### 示例
```bash
# 克隆仓库时使用 SSH
git clone git@github.com:username/repo.git

# 添加远程仓库时使用 SSH
git remote add origin git@github.com:username/repo.git

# 如果已有 HTTPS 远程仓库，转换为 SSH
git remote set-url origin git@github.com:username/repo.git
```

### 注意事项
- 确保用户已配置 SSH 密钥并添加到 GitHub 账户
- 如果遇到权限问题，提示用户检查 SSH 密钥配置
