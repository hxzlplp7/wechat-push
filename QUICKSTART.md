# �?快速开始指�?

## 🎯 5分钟快速部�?

### 方案一：GitHub Pages + GitHub Actions（推荐）

**适合人群**：没有服务器，想要最简单的部署方式

#### 步骤 1：Fork 仓库
点击右上�?**Fork** 按钮 �?等待完成

#### 步骤 2：生成配�?
1. 访问配置工具：https://你的用户�?github.io/wexchatpush/
2. 按照5步向导填写信�?
3. 下载生成�?`config.txt`

#### 步骤 3：上传配�?
```bash
git clone https://github.com/你的用户�?wexchatpush.git
cd wexchatpush/WeChatPush-Merged
# 将下载的 config.txt 放到这个目录
git add config.txt
git commit -m "Add config"
git push
```

#### 步骤 4：启�?GitHub Pages
Settings �?Pages �?Source 选择 **GitHub Actions**

#### 步骤 5：完成！
- 配置工具网址：https://你的用户�?github.io/wexchatpush/
- 查看推送状态：Actions 标签�?
- 自动推送：每天定时执行

---

### 方案二：服务器一键部�?

**适合人群**：有自己的服务器，想要更灵活的控�?

#### 一条命令搞定：
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户�?wexchatpush/main/install.sh)
```

#### 安装后使用：
```bash
wechat-push start   # 立即推�?
wechat-push log     # 查看日志
wechat-push config  # 编辑配置
```

---

## 📋 准备清单

在开始之前，请确保你有：

### �?必需�?
- [ ] 微信公众号测试账�?
  - AppID
  - AppSecret  
  - 模板消息ID
  - 用户OpenID

### �?API密钥（可选）
- [ ] 和风天气 API Key（免费）
  - 注册地址：https://dev.qweather.com/
- [ ] 天行数据 API Key（免费）
  - 注册地址：https://www.tianapi.com/

---

## 🎨 模板消息示例

推荐模板格式�?

### 简洁版
```
📅 {{date.DATA}}
🌤�?{{weather.DATA}} {{temp.DATA}}
💑 在一�?{{commemoration_day1.DATA}} �?
🎂 {{birthday1.DATA}}
�?{{zaoan.DATA}}
```

### 完整�?
```
📅 日期：{{date.DATA}}

🌤�?天气信息
地区：{{region.DATA}}
天气：{{weather.DATA}}
温度：{{temp.DATA}}
范围：{{min_temp.DATA}} ~ {{max_temp.DATA}}
风向：{{wind_dir.DATA}}

💝 重要日子
在一起：{{commemoration_day1.DATA}} �?
生日：{{birthday1.DATA}}

�?每日一�?
{{zaoan.DATA}}

📝 金句
{{note_ch.DATA}}
{{note_en.DATA}}
```

---

## �?常见问题快速解�?

### Q: 如何获取 OpenID�?
1. 微信扫码关注测试�?
2. 在测试号管理页面�?用户列表"中查�?

### Q: 模板消息ID在哪里？
1. 测试号管理页�?
2. 新增测试模板
3. 提交后获得模板ID

### Q: 农历生日怎么设置�?
在日期前�?`r`，例如：`r2000-08-15`

### Q: 推送时间怎么改？
- **GitHub Actions**: 编辑 `.github/workflows/push.yml`
- **服务�?*: 运行 `wechat-push cron` 编辑定时任务

### Q: 推送失败怎么办？
1. 检查配置文件格�?
2. 确认 API Key 正确
3. 查看日志排查错误�?
   - GitHub: Actions 页面查看日志
   - 服务�? `wechat-push log`

---

## 📚 进阶使用

### 定制推送内�?
编辑 `config.txt` 可以控制推送的内容类型

### 多用户推�?
�?`user` 数组中添加多�?OpenID�?
```python
"user": ["openid1", "openid2", "openid3"]
```

### 自定义颜�?
设置 `color_*` 字段为RGB颜色值：
```python
"color_date": "#FF5733",
"color_weather": "#3498DB",
```

### 手动触发推�?
- **GitHub**: Actions �?选择工作�?�?Run workflow
- **服务�?*: `wechat-push start`

---

## 🚀 下一�?

- 📖 阅读 [完整文档](README.md)
- 🌐 查看 [部署指南](DEPLOYMENT.md)
- 🐛 遇到问题？[提交 Issue](https://github.com/你的用户�?wexchatpush/issues)

---

**祝你使用愉快！如果有帮助，请给个 �?Star**
