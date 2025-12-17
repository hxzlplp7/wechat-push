# 🚀 部署指南

## 📋 目录

- [GitHub Pages 部署](#github-pages-部署)
- [服务器部署](#服务器部�?
- [GitHub Actions 自动推送](#github-actions-自动推�?

---

## 🌐 GitHub Pages 部署

将配置工具网页部署到 GitHub Pages，让任何人都能在线使用�?

### 步骤一：Fork 仓库

1. 访问项目仓库
2. 点击右上角的 **Fork** 按钮
3. 等待 Fork 完成

### 步骤二：启用 GitHub Pages

1. 进入�?Fork 的仓�?
2. 点击 **Settings** (设置)
3. 在左侧菜单找�?**Pages**
4. �?**Source** 下选择 **GitHub Actions**

### 步骤三：触发部署

有两种方式触发部署：

#### 方式 1：推送代码（自动触发�?
```bash
git add .
git commit -m "update"
git push
```

#### 方式 2：手动触�?
1. 进入仓库�?**Actions** 标签
2. 选择 **Deploy to GitHub Pages** 工作�?
3. 点击 **Run workflow**
4. 点击绿色�?**Run workflow** 按钮

### 步骤四：访问网站

部署完成后，访问�?
```
https://你的用户�?github.io/wexchatpush/
```

### 🎨 自定义域名（可选）

1. 在仓�?**Settings** �?**Pages** �?
2. �?**Custom domain** 输入你的域名
3. 在域�?DNS 设置中添�?CNAME 记录�?
   ```
   CNAME  你的用户�?github.io
   ```

---

## 🖥�?服务器部�?

在你的服务器上自动安装和配置推送脚本�?

### 快速安装（一键脚本）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户�?wexchatpush/main/install.sh)
```

或使�?`wget`�?
```bash
bash <(wget -qO- https://raw.githubusercontent.com/你的用户�?wexchatpush/main/install.sh)
```

### 安装过程

脚本会自动完成以下步骤：

1. �?**检测系统环�?*
   - 识别操作系统类型
   - 检�?Python 版本

2. �?**安装依赖**
   - 安装 Python 3.8+
   - 安装 pip �?Git
   - 安装项目依赖�?

3. �?**下载项目**
   - �?GitHub 克隆仓库
   - 进入项目目录

4. �?**配置引导**
   - 填写公众号信�?
   - 配置 API 密钥
   - 设置个人信息

5. �?**测试运行**
   - 测试配置是否正确
   - 尝试发送消�?

6. �?**设置定时任务**
   - 选择推送时�?
   - 添加 crontab 任务

7. �?**创建管理命令**
   - 生成 `wechat-push` 管理脚本

### 管理命令

安装完成后，可以使用以下命令管理�?

```bash
# 立即推送消�?
wechat-push start

# 查看推送日�?
wechat-push log

# 编辑配置文件
wechat-push config

# 编辑定时任务
wechat-push cron

# 更新项目
wechat-push update

# 查看状�?
wechat-push status
```

### 手动部署

如果一键脚本失败，可以手动部署�?

#### 1. 安装依赖
```bash
# Debian/Ubuntu
sudo apt update
sudo apt install -y python3 python3-pip git

# CentOS/RHEL
sudo yum install -y python3 python3-pip git

# Arch Linux
sudo pacman -S python python-pip git
```

#### 2. 克隆项目
```bash
git clone https://github.com/你的用户�?wexchatpush.git
cd wexchatpush/WeChatPush-Merged
```

#### 3. 安装 Python �?
```bash
pip3 install -r requirements.txt
```

#### 4. 配置文件
```bash
cp config.example.txt config.txt
nano config.txt  # 或使�?vim 编辑
```

#### 5. 测试运行
```bash
python3 main.py
```

#### 6. 设置定时任务
```bash
crontab -e
```

添加以下内容（根据需要调整时间和路径）：
```cron
# 每天早上 8:00 推�?
0 8 * * * cd /path/to/WeChatPush-Merged && python3 main.py >> push.log 2>&1

# 每天晚上 22:00 推�?
0 22 * * * cd /path/to/WeChatPush-Merged && python3 main.py >> push.log 2>&1
```

---

## 🤖 GitHub Actions 自动推�?

使用 GitHub Actions 实现云端自动定时推送，无需服务器�?

### 步骤一：准备配置文�?

1. 使用在线配置工具生成 `config.txt`
2. 或手动复�?`config.example.txt` 并修�?

### 步骤二：上传配置文件

```bash
# 克隆你的仓库
git clone https://github.com/你的用户�?wexchatpush.git
cd wexchatpush/WeChatPush-Merged

# 将配置文件放入目�?
# 编辑或复制你�?config.txt

# 提交并推�?
git add config.txt
git commit -m "Add config file"
git push
```

### 步骤三：查看工作�?

1. 进入仓库�?**Actions** 页面
2. 等待工作流自动运�?
3. 查看运行日志

### 默认推送时�?

| 时间（北京） | UTC 时间 | 推送内�?|
|-------------|---------|---------|
| 08:00 | 00:00 | 早安心语 + 天气 |
| 12:00 | 04:00 | 健康小提�?|
| 20:30 | 12:30 | 笑话 + 谜语 |
| 22:00 | 14:00 | 晚安心语 |
| 23:00 | 15:00 | 故事大全 |

### 修改推送时�?

编辑 `.github/workflows/push.yml`�?

```yaml
on:
  schedule:
    # 北京时间 = UTC + 8小时
    # 例如：北京时�?08:00 = UTC 00:00
    - cron: '0 0 * * *'  # 早上 08:00
    - cron: '0 14 * * *' # 晚上 22:00
```

Cron 表达式格式：
```
分钟 小时 �?�?星期
0    0   *  *  *     # 每天 00:00 UTC
30   12  *  *  *     # 每天 12:30 UTC
0    0,12 * *  *     # 每天 00:00 �?12:00 UTC
```

### 手动触发推�?

1. 进入 **Actions** 页面
2. 选择推送工作流
3. 点击 **Run workflow**
4. 选择分支，点击绿色按�?

### 查看推送日�?

1. 进入 **Actions** 页面
2. 点击具体的工作流运行
3. 点击 **push** 任务
4. 展开步骤查看详细日志

---

## 🔧 常见问题

### Q: GitHub Actions 为什么没有自动运行？

**A**: 可能的原因：
- 仓库�?0天内无活动（GitHub 会暂停定时任务）
- Actions 未启用：Settings �?Actions �?选择允许所有操�?
- 配置文件有误：检�?`config.txt` 格式

**解决方法**�?
1. 定期提交代码保持活跃
2. 手动触发一次工作流
3. 检查工作流日志排查错误

### Q: 服务器定时任务不执行�?

**A**: 检查步骤：

1. 查看 crontab 是否正确�?
   ```bash
   crontab -l
   ```

2. 检查日志文件：
   ```bash
   cat ~/wexchatpush/WeChatPush-Merged/push.log
   ```

3. 手动测试�?
   ```bash
   wechat-push start
   ```

4. 确认 cron 服务运行�?
   ```bash
   sudo systemctl status cron    # Debian/Ubuntu
   sudo systemctl status crond   # CentOS/RHEL
   ```

### Q: 一键脚本安装失败？

**A**: 常见原因�?
- 网络问题：无法访�?GitHub
- 权限问题：某些命令需�?sudo
- 系统不支持：检查是否为受支持的系统

**解决方法**�?
1. 检查网络连�?
2. 使用 `sudo` 运行脚本
3. 手动安装（参考手动部署章节）

### Q: 推送失败，提示 access_token 错误�?

**A**: 检查配置：
- `app_id` �?`app_secret` 是否正确
- 是否在微信公众平台测试号中获�?
- 配置文件格式是否正确（注意引号）

### Q: GitHub Pages 404 错误�?

**A**: 解决步骤�?
1. 确认 Actions 已成功运�?
2. 检�?Settings �?Pages 是否正确配置
3. 等待几分钟（部署需要时间）
4. 清除浏览器缓�?

### Q: 如何更新项目�?

**服务器更�?*�?
```bash
wechat-push update
```

**GitHub 更新**�?
```bash
cd wexchatpush
git pull
```

---

## 📞 获取帮助

如果遇到问题�?

1. 📖 查看 [README.md](../README.md) 完整文档
2. 🐛 提交 [Issue](https://github.com/你的用户�?wexchatpush/issues)
3. 💬 �?Discussions 中讨�?

---

<p align="center">
  <strong>祝你部署成功！�?/strong>
</p>
