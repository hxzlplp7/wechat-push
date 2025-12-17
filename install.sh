#!/bin/bash

#================================================================
# 微信公众号推送工具 - 服务器一键安装脚本
# 
# 功能：
# - 自动检测系统环境
# - 安装 Python 3 及依赖
# - 配置项目文件
# - 设置定时任务
# - 提供管理命令
#
# 使用方法：
# bash <(curl -fsSL https://raw.githubusercontent.com/hxzlplp7/wechat-push/main/install.sh)
#================================================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 配置变量
REPO_URL="https://github.com/hxzlplp7/wechat-push.git"
INSTALL_DIR="$HOME/wechat-push"
PROJECT_DIR="$INSTALL_DIR/WeChatPush-Merged"

# 打印带颜色的消息
print_info() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "\n${PURPLE}==>${NC} ${BLUE}$1${NC}\n"
}

# 打印横幅
print_banner() {
    echo -e "${CYAN}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║   微信公众号消息推送工具 - 一键安装脚本               ║
║                                                       ║
║   🚀 自动化部署                                       ║
║   ⏰ 定时推送                                         ║
║   💬 多种内容                                         ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}\n"
}

# 检测系统类型
detect_os() {
    print_step "检测系统环境"
    
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
        VER=$VERSION_ID
    else
        OS=$(uname -s)
        VER=$(uname -r)
    fi
    
    print_info "操作系统: $OS"
    print_info "版本: $VER"
}

# 检查 Python 版本
check_python() {
    print_step "检查 Python 环境"
    
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version | awk '{print $2}')
        print_success "已安装 Python $PYTHON_VERSION"
        
        # 检查版本是否满足要求（3.8+）
        MAJOR=$(echo $PYTHON_VERSION | cut -d. -f1)
        MINOR=$(echo $PYTHON_VERSION | cut -d. -f2)
        
        if [ "$MAJOR" -ge 3 ] && [ "$MINOR" -ge 8 ]; then
            print_success "Python 版本满足要求"
            return 0
        else
            print_warning "Python 版本过低，建议升级到 3.8+"
        fi
    else
        print_warning "未检测到 Python 3"
        return 1
    fi
}

# 安装 Python
install_python() {
    print_step "安装 Python 3"
    
    case $OS in
        ubuntu|debian)
            sudo apt update
            sudo apt install -y python3 python3-pip python3-venv
            ;;
        centos|rhel|fedora)
            sudo yum install -y python3 python3-pip
            ;;
        arch|manjaro)
            sudo pacman -S --noconfirm python python-pip
            ;;
        *)
            print_error "不支持的操作系统: $OS"
            print_info "请手动安装 Python 3.8+"
            exit 1
            ;;
    esac
    
    print_success "Python 安装完成"
}

# 安装 Git
install_git() {
    if ! command -v git &> /dev/null; then
        print_step "安装 Git"
        
        case $OS in
            ubuntu|debian)
                sudo apt install -y git
                ;;
            centos|rhel|fedora)
                sudo yum install -y git
                ;;
            arch|manjaro)
                sudo pacman -S --noconfirm git
                ;;
        esac
        
        print_success "Git 安装完成"
    fi
}

# 克隆项目
clone_project() {
    print_step "下载项目文件"
    
    if [ -d "$INSTALL_DIR" ]; then
        print_warning "检测到已存在的安装目录"
        read -p "是否删除并重新安装? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$INSTALL_DIR"
        else
            print_info "取消安装"
            exit 0
        fi
    fi
    
    git clone "$REPO_URL" "$INSTALL_DIR"
    print_success "项目下载完成"
}

# 安装 Python 依赖
install_dependencies() {
    print_step "安装 Python 依赖包"
    
    cd "$PROJECT_DIR"
    
    if [ -f "requirements.txt" ]; then
        python3 -m pip install --user -r requirements.txt
        print_success "依赖包安装完成"
    else
        print_error "未找到 requirements.txt"
        exit 1
    fi
}

# 配置引导
configure_project() {
    print_step "配置项目"
    
    cd "$PROJECT_DIR"
    
    if [ -f "config.txt" ]; then
        print_warning "检测到已存在的配置文件"
        read -p "是否重新配置? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            return
        fi
    fi
    
    echo -e "\n${CYAN}========== 配置引导 ==========${NC}\n"
    
    # 公众号配置
    echo -e "${BLUE}1. 公众号配置${NC}"
    read -p "请输入 AppID: " APP_ID
    read -p "请输入 AppSecret: " APP_SECRET
    read -p "请输入 模板消息ID: " TEMPLATE_ID
    read -p "请输入 用户OpenID (多个用逗号分隔): " USER_IDS
    
    # API密钥
    echo -e "\n${BLUE}2. API密钥配置${NC}"
    read -p "请输入 和风天气Key: " WEATHER_KEY
    read -p "请输入 天行数据Key: " TIAN_API
    
    # 个人信息
    echo -e "\n${BLUE}3. 个人信息${NC}"
    read -p "请输入 地区 (默认: 北京): " REGION
    REGION=${REGION:-北京}
    
    read -p "是否配置生日? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "请输入名字: " BIRTHDAY_NAME
        read -p "请输入生日 (格式: YYYY-MM-DD): " BIRTHDAY_DATE
        read -p "是否为农历? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            BIRTHDAY_DATE="r$BIRTHDAY_DATE"
        fi
    fi
    
    read -p "是否配置纪念日? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "请输入纪念日 (格式: YYYY-MM-DD): " COMMEMORATION_DATE
    fi
    
    # 生成配置文件
    cat > config.txt << EOF
{
# 公众号配置
"app_id": "$APP_ID",
"app_secret": "$APP_SECRET",
"template_id": "$TEMPLATE_ID",
"user": [$(echo "$USER_IDS" | sed 's/,/", "/g' | sed 's/^/"/' | sed 's/$/"/')],

# API密钥
"weather_key": "$WEATHER_KEY",
"tian_api": "$TIAN_API",

# 地区配置
"region": "$REGION",
EOF

    if [ ! -z "$BIRTHDAY_NAME" ]; then
        cat >> config.txt << EOF

# 生日配置
"birthday1": {"name": "$BIRTHDAY_NAME", "birthday": "$BIRTHDAY_DATE"},
EOF
    fi

    if [ ! -z "$COMMEMORATION_DATE" ]; then
        cat >> config.txt << EOF

# 纪念日配置
"commemoration_day1": "$COMMEMORATION_DATE",
EOF
    fi

    cat >> config.txt << EOF

# 金句配置
"note_ch": "",
"note_en": "",

# 颜色配置（留空使用随机颜色）
"color_date": "",
"color_region": "",
"color_weather": "",
"color_zaoan": "",
"color_wanan": "",
}
EOF
    
    print_success "配置文件已生成"
}

# 测试运行
test_run() {
    print_step "测试运行"
    
    cd "$PROJECT_DIR"
    
    read -p "是否立即测试推送? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_info "开始测试推送..."
        python3 main.py
        
        if [ $? -eq 0 ]; then
            print_success "测试推送成功！"
        else
            print_error "测试推送失败，请检查配置"
        fi
    fi
}

# 设置定时任务
setup_cron() {
    print_step "设置定时任务"
    
    read -p "是否设置定时推送? (Y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        echo -e "\n${CYAN}请选择推送时间:${NC}"
        echo "1) 每天早上 8:00"
        echo "2) 每天晚上 22:00"
        echo "3) 早上 8:00 和 晚上 22:00"
        echo "4) 自定义时间"
        read -p "请选择 (1-4): " CRON_CHOICE
        
        case $CRON_CHOICE in
            1)
                CRON_SCHEDULE="0 8 * * *"
                ;;
            2)
                CRON_SCHEDULE="0 22 * * *"
                ;;
            3)
                CRON_SCHEDULE="0 8,22 * * *"
                ;;
            4)
                read -p "请输入 cron 表达式: " CRON_SCHEDULE
                ;;
            *)
                print_warning "无效选择，跳过定时任务设置"
                return
                ;;
        esac
        
        # 添加到 crontab
        CRON_COMMAND="cd $PROJECT_DIR && /usr/bin/python3 main.py >> $PROJECT_DIR/push.log 2>&1"
        
        # 检查是否已存在
        (crontab -l 2>/dev/null | grep -v "$PROJECT_DIR/main.py"; echo "$CRON_SCHEDULE $CRON_COMMAND") | crontab -
        
        print_success "定时任务设置完成"
        print_info "推送时间: $CRON_SCHEDULE"
        print_info "日志文件: $PROJECT_DIR/push.log"
    fi
}

# 创建管理脚本
create_manager() {
    print_step "创建管理脚本"
    
    cat > "$HOME/wechat-push" << 'EOF'
#!/bin/bash

PROJECT_DIR="$HOME/wechat-push/WeChatPush-Merged"
LOG_FILE="$PROJECT_DIR/push.log"

case "$1" in
    start)
        echo "执行推送..."
        cd "$PROJECT_DIR"
        python3 main.py
        ;;
    
    log)
        if [ -f "$LOG_FILE" ]; then
            tail -f "$LOG_FILE"
        else
            echo "日志文件不存在"
        fi
        ;;
    
    config)
        nano "$PROJECT_DIR/config.txt"
        ;;
    
    cron)
        crontab -e
        ;;
    
    update)
        echo "更新项目..."
        cd "$HOME/wechat-push"
        git pull
        cd "$PROJECT_DIR"
        pip3 install --user -r requirements.txt
        echo "更新完成"
        ;;
    
    status)
        echo "检查定时任务..."
        crontab -l | grep wechat-push || echo "未设置定时任务"
        ;;
    
    *)
        echo "微信公众号推送工具 - 管理脚本"
        echo ""
        echo "用法: wechat-push [命令]"
        echo ""
        echo "命令:"
        echo "  start   - 立即执行推送"
        echo "  log     - 查看推送日志"
        echo "  config  - 编辑配置文件"
        echo "  cron    - 编辑定时任务"
        echo "  update  - 更新项目"
        echo "  status  - 查看状态"
        ;;
esac
EOF
    
    chmod +x "$HOME/wechat-push"
    
    # 添加到 PATH（如果不在）
    if [[ ":$PATH:" != *":$HOME:"* ]]; then
        echo 'export PATH="$HOME:$PATH"' >> "$HOME/.bashrc"
        export PATH="$HOME:$PATH"
    fi
    
    print_success "管理脚本已创建: wechat-push"
}

# 完成安装
finish_installation() {
    echo -e "\n${GREEN}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║              ✅ 安装完成！                            ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}\n"
    
    echo -e "${CYAN}📁 安装目录:${NC} $INSTALL_DIR"
    echo -e "${CYAN}📝 配置文件:${NC} $PROJECT_DIR/config.txt"
    echo -e "${CYAN}📊 日志文件:${NC} $PROJECT_DIR/push.log"
    echo ""
    echo -e "${YELLOW}常用命令:${NC}"
    echo -e "  ${GREEN}wechat-push start${NC}  - 立即推送"
    echo -e "  ${GREEN}wechat-push log${NC}    - 查看日志"
    echo -e "  ${GREEN}wechat-push config${NC} - 编辑配置"
    echo -e "  ${GREEN}wechat-push status${NC} - 查看状态"
    echo ""
    echo -e "${BLUE}💡 提示:${NC} 运行 ${GREEN}wechat-push${NC} 查看所有命令"
    echo ""
}

# 主函数
main() {
    clear
    print_banner
    
    detect_os
    
    # 检查并安装 Python
    if ! check_python; then
        install_python
    fi
    
    # 安装 Git
    install_git
    
    # 克隆项目
    clone_project
    
    # 安装依赖
    install_dependencies
    
    # 配置项目
    configure_project
    
    # 测试运行
    test_run
    
    # 设置定时任务
    setup_cron
    
    # 创建管理脚本
    create_manager
    
    # 完成
    finish_installation
}

# 执行主函数
main
