# 🎉 微信公众号消息推送工�?

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.8+-blue?style=for-the-badge&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/WeChat-公众�?green?style=for-the-badge&logo=wechat" alt="WeChat">
  <img src="https://img.shields.io/badge/GitHub-Pages-black?style=for-the-badge&logo=github" alt="GitHub Pages">
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License">
</p>

<p align="center">
  <strong>一键配置网�?+ 自动推送脚�?/strong><br>
  支持天气、生日、纪念日、星座运势等17种趣味内容推�?
</p>

---

## 📖 项目简�?

本项目提供了完整的微信公众号模板消息推送解决方案：

- 🌐 **在线配置工具**：无需编程，可视化生成配置文件
- 🤖 **自动推送脚�?*：支持本地运行和 GitHub Actions 定时推�?
- 📱 **多样化内�?*：早安心语、晚安心语、天气、笑话、故事等17种内�?
- 🎨 **个性化定制**：生日提醒、纪念日、倒计时、星座运�?
- 🚀 **一键部�?*：提供服务器一键安装脚�?

## 🌐 在线配置工具

**访问地址**：[https://你的用户�?github.io/wexchatpush/](https://你的用户�?github.io/wexchatpush/)

使用在线配置工具，只需5步即可生成配置文件：

1. **填写公众号信�?* - AppID、AppSecret、模板ID
2. **配置API密钥** - 和风天气、天行数�?
3. **设置个人信息** - 地区、生日、纪念日
4. **选择推送内�?* - 勾选想要的内容类型
5. **生成并下�?* - 一键生�?config.txt

## �?功能特�?

### 📅 基础信息
- �?当前日期和星�?
- �?实时天气、温度范�?
- �?日出日落时间
- �?空气质量指数
- �?每日生活建议

### 💝 个人定制
- �?生日提醒（支持公�?农历�?
- �?纪念日累计天�?
- �?重要日期倒计�?
- �?每日星座运势

### 🎭 趣味内容�?7种）

| 类型 | 说明 | 类型 | 说明 |
|-----|------|-----|------|
| 🌅 早安心语 | 每日励志语录 | 🌙 晚安心语 | 温馨晚安话语 |
| 💝 土味情话 | 甜蜜情话 | 🌈 彩虹�?| 夸赞文案 |
| 🏥 健康小提�?| 健康养生 | 💡 生活小窍�?| 实用技�?|
| 😂 雷人笑话 | 搞笑段子 | 🧩 谜语大全 | 趣味谜语 |
| 📖 故事大全 | 精选故�?| 🍵 毒鸡�?| 反励志语�?|
| 🐕 舔狗日记 | 舔狗语录 | 📜 文化谚语 | 传统谚语 |
| 💬 小段�?| 有趣段子 | 📝 朋友圈文�?| 配文参�?|

## 🚀 快速开�?

### 方式一：在线配置（推荐新手�?

1. 访问配置工具网页
2. 按照步骤填写信息
3. 下载生成�?`config.txt`
4. Fork 本仓库并替换配置文件
5. GitHub Actions 自动定时推�?

### 方式二：服务器部�?

使用一键安装脚本：

```bash
# 下载并运行安装脚�?
curl -fsSL https://raw.githubusercontent.com/你的用户�?wexchatpush/main/install.sh | bash

# 或者使�?wget
wget -qO- https://raw.githubusercontent.com/你的用户�?wexchatpush/main/install.sh | bash
```

### 方式三：本地运行

```bash
# 克隆仓库
git clone https://github.com/你的用户�?wexchatpush.git
cd wexchatpush/WeChatPush-Merged

# 安装依赖
pip install -r requirements.txt

# 配置文件
cp config.example.txt config.txt
# 编辑 config.txt 填入你的信息

# 运行
python main.py
```

## 📋 准备工作

### 1. 注册微信公众号测试账�?

1. 访问 [微信公众平台测试号](https://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=sandbox/login)
2. 扫码登录获取 `appID` �?`appsecret`
3. 关注测试号，获取用户 `OpenID`

### 2. 创建消息模板

在测试号管理页面，新增模板消息，示例格式�?

```
📅 {{date.DATA}}
🌤�?{{region.DATA}} {{weather.DATA}}
🌡�?{{temp.DATA}} ({{min_temp.DATA}} ~ {{max_temp.DATA}})
💨 {{wind_dir.DATA}}

💑 我们在一�?{{commemoration_day1.DATA}} 天啦
🎂 {{birthday1.DATA}}

�?{{zaoan.DATA}}

📝 {{note_ch.DATA}}
```

### 3. 获取 API 密钥

- **和风天气**：[dev.qweather.com](https://dev.qweather.com/) 注册获取免费 API Key
- **天行数据**：[tianapi.com](https://www.tianapi.com/) 注册获取免费 API Key

## 📁 项目结构

```
wexchatpush/
├── WeChatPush/                 # 在线配置工具
�?  ├── index.html             # 配置页面
�?  ├── styles.css             # 样式文件
�?  └── script.js              # 交互逻辑
�?
├── WeChatPush-Merged/         # Python推送脚�?
�?  ├── main.py                # 主程�?
�?  ├── config.txt             # 配置文件（需自行创建�?
�?  ├── config.example.txt     # 配置示例
�?  ├── requirements.txt       # Python依赖
�?  └── .github/
�?      └── workflows/
�?          └── push.yml       # GitHub Actions配置
�?
├── install.sh                 # 服务器一键安装脚�?
└── README.md                  # 说明文档
```

## ⚙️ 配置说明

### 基础配置

```python
{
  # 公众号信�?
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
  "horoscope1": "cancer"  # 星座英文�?
}
```

### 生日配置

```python
# 公历生日
"birthday1": {"name": "宝贝", "birthday": "2000-01-01"}

# 农历生日（日期前�?r�?
"birthday2": {"name": "妈妈", "birthday": "r1970-08-15"}
```

### 纪念日和倒计�?

```python
# 纪念日（显示累计天数�?
"commemoration_day1": "2020-05-20"

# 倒计时（显示剩余天数�?
"countdown1": "2025-12-31"
```

## 🤖 GitHub Actions 定时推�?

项目已配�?GitHub Actions，Fork 后自动启用定时推送�?

### 默认推送时�?

| 时间 | 内容 |
|-----|------|
| 每天 08:00 | 早安心语 + 天气 |
| 每天 12:00 | 健康小提�?|
| 每天 20:30 | 笑话 + 谜语 |
| 每天 22:00 | 晚安心语 |
| 每天 23:00 | 故事大全 |

### 修改推送时�?

编辑 `.github/workflows/push.yml` 中的 cron 表达式：

```yaml
schedule:
  - cron: '0 0 * * *'  # UTC 00:00 = 北京时间 08:00
```

### 手动触发

在仓库的 **Actions** 页面，选择工作流，点击 **Run workflow** 可手动触发推送�?

## 🖥�?服务器部�?

### 自动安装（推荐）

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/你的用户�?wexchatpush/main/install.sh)
```

脚本会自动完成：
- �?检测并安装 Python 3
- �?安装项目依赖
- �?引导配置 config.txt
- �?设置定时任务（crontab�?
- �?提供管理命令

### 手动部署

```bash
# 1. 安装依赖
sudo apt update
sudo apt install python3 python3-pip -y

# 2. 克隆项目
git clone https://github.com/你的用户�?wexchatpush.git
cd wexchatpush/WeChatPush-Merged

# 3. 安装 Python �?
pip3 install -r requirements.txt

# 4. 配置
cp config.example.txt config.txt
nano config.txt  # 编辑配置

# 5. 测试运行
python3 main.py

# 6. 设置定时任务
crontab -e
# 添加�?
# 0 0 * * * cd /path/to/WeChatPush-Merged && python3 main.py
```

## 📱 模板变量参�?

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
| `{{saylove.DATA}}` | 土味情话 | `{{chp.DATA}}` | 彩虹�?|
| `{{health_tip.DATA}}` | 健康提示 | `{{xqm.DATA}}` | 生活窍门 |
| `{{joke.DATA}}` | 笑话 | `{{riddle.DATA}}` | 谜语 |
| `{{story.DATA}}` | 故事 | `{{note_ch.DATA}}` | 每日金句 |

### 个人变量

| 变量 | 说明 |
|-----|------|
| `{{birthday1.DATA}}` | 生日1倒计�?|
| `{{commemoration_day1.DATA}}` | 纪念�?天数 |
| `{{countdown1.DATA}}` | 倒计�? |
| `{{horoscope1.DATA}}` | 星座运势 |

## �?常见问题

### Q: access_token 获取失败
**A**: 检�?`app_id` �?`app_secret` 是否正确

### Q: 模板消息发送失�?
**A**: 
- 检�?`template_id` 是否正确
- 确认模板变量与配置匹�?
- 检查用户是否已关注测试�?

### Q: 天气数据获取失败
**A**: 
- 检�?`weather_key` 是否正确
- 确认和风天气账号已激�?
- 检查免费版是否达到调用上限

### Q: GitHub Actions 没有执行
**A**:
- 确认仓库�?0天内有活�?
- 检�?Actions 是否已启�?
- 查看工作流日志排查错�?

### Q: 如何添加多个接收用户�?
**A**: �?config.txt 中添加多�?OpenID�?
```python
"user": ["openid1", "openid2", "openid3"]
```

### Q: 农历生日如何配置�?
**A**: 日期前加 `r` 表示农历�?
```python
"birthday1": {"name": "妈妈", "birthday": "r1970-08-15"}
```

### Q: 如何自定义推送时间？
**A**: 修改 `.github/workflows/push.yml` 中的 cron 表达式。注�?GitHub Actions 使用 UTC 时间，需要减8小时�?

## 📄 开源协�?

本项目采�?[MIT 协议](LICENSE) 开源�?

## 🙏 致谢

- [和风天气](https://www.qweather.com/) - 提供天气数据
- [天行数据](https://www.tianapi.com/) - 提供各类内容API  
- [金山词霸](http://open.iciba.com/) - 提供每日金句
- [微信公众平台](https://mp.weixin.qq.com/) - 提供消息推送服�?

## 📮 反馈与建�?

如有问题或建议，欢迎提交 [Issue](https://github.com/你的用户�?wexchatpush/issues)�?

---

<p align="center">
  Made with ❤️ for WeChat Push<br>
  �?如果这个项目对你有帮助，欢迎 Star �?
</p>
