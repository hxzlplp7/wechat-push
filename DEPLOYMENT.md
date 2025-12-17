# 🚀 部署指南

## 📋 目录

- [GitHub Pages 部署](#github-pages-部署)
- [GitHub Actions 自动推送](#github-actions-自动推送)
- [常见问题](#常见问题)

---

## 🌐 GitHub Pages 部署

将配置工具网页部署到 GitHub Pages，让任何人都能在线使用。

### 步骤一：Fork 仓库

1. 访问项目仓库
2. 点击右上角的 **Fork** 按钮
3. 等待 Fork 完成

### 步骤二：启用 GitHub Pages

1. 进入你 Fork 的仓库
2. 点击 **Settings** (设置)
3. 在左侧菜单找到 **Pages**
4. 在 **Source** 下选择 **GitHub Actions**

### 步骤三：触发部署

有两种方式触发部署：

#### 方式 1：推送代码（自动触发）
```bash
git add .
git commit -m "update"
git push
```

#### 方式 2：手动触发
1. 进入仓库的 **Actions** 标签
2. 选择 **Deploy to GitHub Pages** 工作流
3. 点击 **Run workflow**
4. 点击绿色的 **Run workflow** 按钮

### 步骤四：访问网站

部署完成后，访问：
```
https://hxzlplp7.github.io/wechat-push/
```

### 🎨 自定义域名（可选）

1. 在仓库 **Settings** → **Pages** 中
2. 在 **Custom domain** 输入你的域名
3. 在域名 DNS 设置中添加 CNAME 记录：
   ```
   CNAME  hxzlplp7.github.io
   ```

---

## 🤖 GitHub Actions 自动推送

使用 GitHub Actions 实现云端自动定时推送，无需服务器。

### 步骤一：准备配置文件

1. 使用在线配置工具生成 `config.txt`
2. 或手动复制 `config.example.txt` 并修改

### 步骤二：上传配置文件

```bash
# 克隆你的仓库
git clone https://github.com/hxzlplp7/wechat-push.git
cd wechat-push/WeChatPush-Merged

# 将配置文件放入目录
# 编辑或复制你的 config.txt

# 提交并推送
git add config.txt
git commit -m "Add config file"
git push
```

### 步骤三：查看工作流

1. 进入仓库的 **Actions** 页面
2. 等待工作流自动运行
3. 查看运行日志

### 默认推送时间

| 时间（北京） | UTC 时间 | 推送内容 |
|-------------|---------|---------|
| 08:00 | 00:00 | 早安心语 + 天气 |
| 12:00 | 04:00 | 健康小提示 |
| 20:30 | 12:30 | 笑话 + 谜语 |
| 22:00 | 14:00 | 晚安心语 |
| 23:00 | 15:00 | 故事大全 |

### 修改推送时间

编辑 `.github/workflows/push.yml`：

```yaml
on:
  schedule:
    # 北京时间 = UTC + 8小时
    # 例如：北京时间 08:00 = UTC 00:00
    - cron: '0 0 * * *'  # 早上 08:00
    - cron: '0 14 * * *' # 晚上 22:00
```

Cron 表达式格式：
```
分钟 小时 日 月 星期
0    0   *  *  *     # 每天 00:00 UTC
30   12  *  *  *     # 每天 12:30 UTC
0    0,12 * *  *     # 每天 00:00 和 12:00 UTC
```

### 手动触发推送

1. 进入 **Actions** 页面
2. 选择推送工作流
3. 点击 **Run workflow**
4. 选择分支，点击绿色按钮

### 查看推送日志

1. 进入 **Actions** 页面
2. 点击具体的工作流运行
3. 点击 **push** 任务
4. 展开步骤查看详细日志

---

## 🔧 常见问题

### Q: GitHub Actions 为什么没有自动运行？

**A**: 可能的原因：
- 仓库近60天内无活动（GitHub 会暂停定时任务）
- Actions 未启用：Settings → Actions → 选择允许所有操作
- 配置文件有误：检查 `config.txt` 格式

**解决方法**：
1. 定期提交代码保持活跃
2. 手动触发一次工作流
3. 检查工作流日志排查错误

### Q: 推送失败，提示 access_token 错误？

**A**: 检查配置：
- `app_id` 和 `app_secret` 是否正确
- 是否在微信公众平台测试号中获取
- 配置文件格式是否正确（注意引号）

### Q: GitHub Pages 404 错误？

**A**: 解决步骤：
1. 确认 Actions 已成功运行
2. 检查 Settings → Pages 是否正确配置
3. 等待几分钟（部署需要时间）
4. 清除浏览器缓存

### Q: 如何更新项目？

**GitHub 更新**：
```bash
cd wechat-push
git pull
```

### Q: 配置文件格式错误？

**A**: 确保：
- 使用英文引号和逗号
- JSON 格式正确（可使用在线 JSON 验证工具）
- 注释行以 `#` 开头

---

## 📞 获取帮助

如果遇到问题：

1. 📖 查看 [README.md](README.md) 完整文档
2. 🐛 提交 [Issue](https://github.com/hxzlplp7/wechat-push/issues)
3. 💬 在 Discussions 中讨论

---

<p align="center">
  <strong>祝你部署成功！🎉</strong>
</p>
