# 🎉 微信公众号消息推送工具

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.8+-blue?style=for-the-badge&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/WeChat-公众号-green?style=for-the-badge&logo=wechat" alt="WeChat">
  <img src="https://img.shields.io/badge/GitHub-Pages-black?style=for-the-badge&logo=github" alt="GitHub Pages">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License">
</p>

<p align="center">
  <strong>一键配置网页 + 自动推送脚本</strong><br>
  支持天气、生日、纪念日、星座运势等17种趣味内容推送
</p>

---

## 📖 项目简介

本项目提供了完整的微信公众号模板消息推送解决方案：

- 🌐 **在线配置工具**：无需编程，可视化生成配置文件
- 🤖 **自动推送脚本**：支持本地运行和 GitHub Actions 定时推送
- 📱 **多样化内容**：早安心语、晚安心语、天气、笑话、故事等17种内容
- 🎨 **个性化定制**：生日提醒、纪念日、倒计时、星座运势
- 🚀 **一键部署**：提供服务器一键安装脚本

## 🌐 在线配置工具

**访问地址**：[https://hxzlplp7.github.io/wechat-push/](https://hxzlplp7.github.io/wechat-push/)

使用在线配置工具，只需5步即可生成配置文件：

1. **填写公众号信息** - AppID、AppSecret、模板ID
2. **配置API密钥** - 和风天气、天行数据
3. **设置个人信息** - 地区、生日、纪念日
4. **选择推送内容** - 勾选想要的内容类型
5. **生成并下载** - 一键生成 config.txt

## ✨ 功能特性

### 📅 基础信息
- ✅ 当前日期和星期
- ✅ 实时天气、温度范围
- ✅ 日出日落时间
- ✅ 空气质量指数
- ✅ 每日生活建议

### 💝 个人定制
- ✅ 生日提醒（支持公历/农历）
- ✅ 纪念日累计天数
- ✅ 重要日期倒计时
- ✅ 每日星座运势

### 🎭 趣味内容（17种）

| 类型 | 说明 | 类型 | 说明 |
|-----|------|-----|------|
| 🌅 早安心语 | 每日励志语录 | 🌙 晚安心语 | 温馨晚安话语 |
| 💝 土味情话 | 甜蜜情话 | 🌈 彩虹屁 | 夸赞文案 |
| 🏥 健康小提示 | 健康养生 | 💡 生活小窍门 | 实用技巧 |
| 😂 雷人笑话 | 搞笑段子 | 🧩 谜语大全 | 趣味谜语 |
| 📖 故事大全 | 精选故事 | 🍵 毒鸡汤 | 反励志语录 |
| 🐕 舔狗日记 | 舔狗语录 | 📜 文化谚语 | 传统谚语 |
| 💬 小段子 | 有趣段子 | 📝 朋友圈文案 | 配文参考 |

## 🚀 快速开始

### 方式一：在线配置（推荐新手）

1. 访问配置工具网页
2. 按照步骤填写信息
3. 下载生成的 `config.txt`
4. Fork 本仓库并替换配置文件
5. GitHub Actions 自动定时推送

### 方式二：服务器部署

使用一键安装脚本：

```bash
# 下载并运行安装脚本
curl -fsSL https://raw.githubusercontent.com/hxzlplp7/wechat-push/main/install.sh | bash

# 或者使用 wget
wget -qO- https://raw.githubusercontent.com/hxzlplp7/wechat-push/main/install.sh | bash
```

### 方式三：本地运行

```bash
# 克隆仓库
git clone https://github.com/hxzlplp7/wechat-push.git
cd wechat-push/WeChatPush-Merged

# 安装依赖
pip install -r requirements.txt

# 配置文件
cp config.example.txt config.txt
# 编辑 config.txt 填入你的信息

# 运行
python main.py
```

## 📋 准备工作

### 1. 注册微信公众号测试账号

1. 访问 [微信公众平台测试号](https://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=sandbox/login)
2. 扫码登录获取 `appID` 和 `appsecret`
3. 关注测试号，获取用户 `OpenID`

### 2. 创建消息模板

在测试号管理页面，新增模板消息，示例格式：

```
📅 {{date.DATA}}
🌤️ {{region.DATA}} {{weather.DATA}}
🌡️ {{temp.DATA}} ({{min_temp.DATA}} ~ {{max_temp.DATA}})
💨 {{wind_dir.DATA}}

💑 我们在一起 {{commemoration_day1.DATA}} 天啦
🎂 {{birthday1.DATA}}

✨ {{zaoan.DATA}}

📝 {{note_ch.DATA}}
```

### 3. 获取 API 密钥

- **和风天气**：[dev.qweather.com](https://dev.qweather.com/) 注册获取免费 API Key
- **天行数据**：[tianapi.com](https://www.tianapi.com/) 注册获取免费 API Key

## 📁 项目结构

```
wechat-push/
├── WeChatPush/                 # 在线配置工具
│   ├── index.html             # 配置页面
│   ├── styles.css             # 样式文件
│   └── script.js              # 交互逻辑
│
├── WeChatPush-Merged/         # Python推送脚本
│   ├── main.py                # 主程序
│   ├── config.txt             # 配置文件（需自行创建）
│   ├── config.example.txt     # 配置示例
│   ├── requirements.txt       # Python依赖
│   └── .github/
│       └── workflows/
│           └── push.yml       # GitHub Actions配置
│
├── install.sh                 # 服务器一键安装脚本
└── README.md                  # 说明文档
```

## ⚙️ 配置说明

### 基础配置

```python
{
  # 公众号信息
  "app_id": "你的AppID",
  "app_secret": "你的AppSecret", 
  "template_id": "模板消息ID",
  "user": ["接收者OpenID1", "接收者OpenID2"],
  
  # API密钥
  "weather_key": "和风天气Key",
  "tian_api": "天行数据Key",
  
  # 地区信息
  "region": "北京",
  
  # 星座
  "horoscope1": "cancer"  # 星座英文名
}
```

### 生日配置

```python
# 公历生日
"birthday1": {"name": "宝贝", "birthday": "2000-01-01"}

# 农历生日（日期前加 r）
"birthday2": {"name": "妈妈", "birthday": "r1970-08-15"}
```

### 纪念日和倒计时

```python
# 纪念日（显示累计天数）
"commemoration_day1": "2020-05-20"

# 倒计时（显示剩余天数）
"countdown1": "2025-12-31"
```

## 🤖 GitHub Actions 定时推送

项目已配置 GitHub Actions，Fork 后自动启用定时推送。

### 默认推送时间

| 时间 | 内容 |
|-----|------|
| 每天 08:00 | 早安心语 + 天气 |
| 每天 12:00 | 健康小提示 |
| 每天 20:30 | 笑话 + 谜语 |
| 每天 22:00 | 晚安心语 |
| 每天 23:00 | 故事大全 |

### 修改推送时间

编辑 `.github/workflows/push.yml` 中的 cron 表达式：

```yaml
schedule:
  - cron: '0 0 * * *'  # UTC 00:00 = 北京时间 08:00
```

### 手动触发

在仓库的 **Actions** 页面，选择工作流，点击 **Run workflow** 可手动触发推送。

## 🖥️ 服务器部署

### 自动安装（推荐）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/hxzlplp7/wechat-push/main/install.sh)
```

脚本会自动完成：
- ✅ 检测并安装 Python 3
- ✅ 安装项目依赖
- ✅ 引导配置 config.txt
- ✅ 设置定时任务（crontab）
- ✅ 提供管理命令

### 手动部署

```bash
# 1. 安装依赖
sudo apt update
sudo apt install python3 python3-pip -y

# 2. 克隆项目
git clone https://github.com/hxzlplp7/wechat-push.git
cd wechat-push/WeChatPush-Merged

# 3. 安装 Python 包
pip3 install -r requirements.txt

# 4. 配置
cp config.example.txt config.txt
nano config.txt  # 编辑配置

# 5. 测试运行
python3 main.py

# 6. 设置定时任务
crontab -e
# 添加：
# 0 0 * * * cd /path/to/WeChatPush-Merged && python3 main.py
```

## 📱 模板变量参考

### 基础变量

| 变量 | 说明 | 变量 | 说明 |
|-----|------|-----|------|
| `{{date.DATA}}` | 日期 | `{{region.DATA}}` | 地区 |
| `{{weather.DATA}}` | 天气 | `{{temp.DATA}}` | 当前温度 |
| `{{max_temp.DATA}}` | 最高温 | `{{min_temp.DATA}}` | 最低温 |
| `{{wind_dir.DATA}}` | 风向 | `{{sunrise.DATA}}` | 日出 |
| `{{sunset.DATA}}` | 日落 | `{{category.DATA}}` | 空气质量 |
| `{{pm2p5.DATA}}` | PM2.5 | `{{proposal.DATA}}` | 今日建议 |

### 内容变量

| 变量 | 说明 | 变量 | 说明 |
|-----|------|-----|------|
| `{{zaoan.DATA}}` | 早安心语 | `{{wanan.DATA}}` | 晚安心语 |
| `{{saylove.DATA}}` | 土味情话 | `{{chp.DATA}}` | 彩虹屁 |
| `{{health_tip.DATA}}` | 健康提示 | `{{xqm.DATA}}` | 生活窍门 |
| `{{joke.DATA}}` | 笑话 | `{{riddle.DATA}}` | 谜语 |
| `{{story.DATA}}` | 故事 | `{{note_ch.DATA}}` | 每日金句 |

### 个人变量

| 变量 | 说明 |
|-----|------|
| `{{birthday1.DATA}}` | 生日1倒计时 |
| `{{commemoration_day1.DATA}}` | 纪念日1天数 |
| `{{countdown1.DATA}}` | 倒计时1 |
| `{{horoscope1.DATA}}` | 星座运势 |

## ❓ 常见问题

### Q: access_token 获取失败
**A**: 检查 `app_id` 和 `app_secret` 是否正确

### Q: 模板消息发送失败
**A**: 
- 检查 `template_id` 是否正确
- 确认模板变量与配置匹配
- 检查用户是否已关注测试号

### Q: 天气数据获取失败
**A**: 
- 检查 `weather_key` 是否正确
- 确认和风天气账号已激活
- 检查免费版是否达到调用上限

### Q: GitHub Actions 没有执行
**A**:
- 确认仓库近60天内有活动
- 检查 Actions 是否已启用
- 查看工作流日志排查错误

### Q: 如何添加多个接收用户？
**A**: 在 config.txt 中添加多个 OpenID：
```python
"user": ["openid1", "openid2", "openid3"]
```

### Q: 农历生日如何配置？
**A**: 日期前加 `r` 表示农历：
```python
"birthday1": {"name": "妈妈", "birthday": "r1970-08-15"}
```

### Q: 如何自定义推送时间？
**A**: 修改 `.github/workflows/push.yml` 中的 cron 表达式。注意 GitHub Actions 使用 UTC 时间，需要减8小时。

## 📄 开源协议

本项目采用 [MIT 协议](LICENSE) 开源。

## 🙏 致谢

- [和风天气](https://www.qweather.com/) - 提供天气数据
- [天行数据](https://www.tianapi.com/) - 提供各类内容API  
- [金山词霸](http://open.iciba.com/) - 提供每日金句
- [微信公众平台](https://mp.weixin.qq.com/) - 提供消息推送服务

## 📮 反馈与建议

如有问题或建议，欢迎提交 [Issue](https://github.com/hxzlplp7/wechat-push/issues)。

---

<p align="center">
  Made with ❤️ for WeChat Push<br>
  ⭐ 如果这个项目对你有帮助，欢迎 Star ⭐
</p>
