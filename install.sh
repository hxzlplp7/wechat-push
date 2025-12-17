#!/bin/bash

#================================================================
# 寰俊鍏紬鍙锋帹閫佸伐鍏?- 鏈嶅姟鍣ㄤ竴閿畨瑁呰剼鏈?# 
# 鍔熻兘锛?# - 鑷姩妫€娴嬬郴缁熺幆澧?# - 瀹夎 Python 3 鍙婁緷璧?# - 閰嶇疆椤圭洰鏂囦欢
# - 璁剧疆瀹氭椂浠诲姟
# - 鎻愪緵绠＄悊鍛戒护
#
# 浣跨敤鏂规硶锛?# bash <(curl -fsSL https://raw.githubusercontent.com/浣犵殑鐢ㄦ埛鍚?wexchatpush/main/install.sh)
#================================================================

set -e

# 棰滆壊瀹氫箟
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 閰嶇疆鍙橀噺
REPO_URL="https://github.com/浣犵殑鐢ㄦ埛鍚?wexchatpush.git"
INSTALL_DIR="$HOME/wexchatpush"
PROJECT_DIR="$INSTALL_DIR/WeChatPush-Merged"

# 鎵撳嵃甯﹂鑹茬殑娑堟伅
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

# 鎵撳嵃妯箙
print_banner() {
    echo -e "${CYAN}"
    cat << "EOF"
鈺斺晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺?鈺?                                                      鈺?鈺?  寰俊鍏紬鍙锋秷鎭帹閫佸伐鍏?- 涓€閿畨瑁呰剼鏈?              鈺?鈺?                                                      鈺?鈺?  馃殌 鑷姩鍖栭儴缃?                                      鈺?鈺?  鈴?瀹氭椂鎺ㄩ€?                                        鈺?鈺?  馃挰 澶氱鍐呭                                         鈺?鈺?                                                      鈺?鈺氣晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺?EOF
    echo -e "${NC}\n"
}

# 妫€娴嬬郴缁熺被鍨?detect_os() {
    print_step "妫€娴嬬郴缁熺幆澧?
    
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
        VER=$VERSION_ID
    else
        OS=$(uname -s)
        VER=$(uname -r)
    fi
    
    print_info "鎿嶄綔绯荤粺: $OS"
    print_info "鐗堟湰: $VER"
}

# 妫€鏌?Python 鐗堟湰
check_python() {
    print_step "妫€鏌?Python 鐜"
    
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version | awk '{print $2}')
        print_success "宸插畨瑁?Python $PYTHON_VERSION"
        
        # 妫€鏌ョ増鏈槸鍚︽弧瓒宠姹傦紙3.8+锛?        MAJOR=$(echo $PYTHON_VERSION | cut -d. -f1)
        MINOR=$(echo $PYTHON_VERSION | cut -d. -f2)
        
        if [ "$MAJOR" -ge 3 ] && [ "$MINOR" -ge 8 ]; then
            print_success "Python 鐗堟湰婊¤冻瑕佹眰"
            return 0
        else
            print_warning "Python 鐗堟湰杩囦綆锛屽缓璁崌绾у埌 3.8+"
        fi
    else
        print_warning "鏈娴嬪埌 Python 3"
        return 1
    fi
}

# 瀹夎 Python
install_python() {
    print_step "瀹夎 Python 3"
    
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
            print_error "涓嶆敮鎸佺殑鎿嶄綔绯荤粺: $OS"
            print_info "璇锋墜鍔ㄥ畨瑁?Python 3.8+"
            exit 1
            ;;
    esac
    
    print_success "Python 瀹夎瀹屾垚"
}

# 瀹夎 Git
install_git() {
    if ! command -v git &> /dev/null; then
        print_step "瀹夎 Git"
        
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
        
        print_success "Git 瀹夎瀹屾垚"
    fi
}

# 鍏嬮殕椤圭洰
clone_project() {
    print_step "涓嬭浇椤圭洰鏂囦欢"
    
    if [ -d "$INSTALL_DIR" ]; then
        print_warning "妫€娴嬪埌宸插瓨鍦ㄧ殑瀹夎鐩綍"
        read -p "鏄惁鍒犻櫎骞堕噸鏂板畨瑁? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$INSTALL_DIR"
        else
            print_info "鍙栨秷瀹夎"
            exit 0
        fi
    fi
    
    git clone "$REPO_URL" "$INSTALL_DIR"
    print_success "椤圭洰涓嬭浇瀹屾垚"
}

# 瀹夎 Python 渚濊禆
install_dependencies() {
    print_step "瀹夎 Python 渚濊禆鍖?
    
    cd "$PROJECT_DIR"
    
    if [ -f "requirements.txt" ]; then
        python3 -m pip install --user -r requirements.txt
        print_success "渚濊禆鍖呭畨瑁呭畬鎴?
    else
        print_error "鏈壘鍒?requirements.txt"
        exit 1
    fi
}

# 閰嶇疆寮曞
configure_project() {
    print_step "閰嶇疆椤圭洰"
    
    cd "$PROJECT_DIR"
    
    if [ -f "config.txt" ]; then
        print_warning "妫€娴嬪埌宸插瓨鍦ㄧ殑閰嶇疆鏂囦欢"
        read -p "鏄惁閲嶆柊閰嶇疆? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            return
        fi
    fi
    
    echo -e "\n${CYAN}========== 閰嶇疆寮曞 ==========${NC}\n"
    
    # 鍏紬鍙烽厤缃?    echo -e "${BLUE}1. 鍏紬鍙烽厤缃?{NC}"
    read -p "璇疯緭鍏?AppID: " APP_ID
    read -p "璇疯緭鍏?AppSecret: " APP_SECRET
    read -p "璇疯緭鍏?妯℃澘娑堟伅ID: " TEMPLATE_ID
    read -p "璇疯緭鍏?鐢ㄦ埛OpenID (澶氫釜鐢ㄩ€楀彿鍒嗛殧): " USER_IDS
    
    # API瀵嗛挜
    echo -e "\n${BLUE}2. API瀵嗛挜閰嶇疆${NC}"
    read -p "璇疯緭鍏?鍜岄澶╂皵Key: " WEATHER_KEY
    read -p "璇疯緭鍏?澶╄鏁版嵁Key: " TIAN_API
    
    # 涓汉淇℃伅
    echo -e "\n${BLUE}3. 涓汉淇℃伅${NC}"
    read -p "璇疯緭鍏?鍦板尯 (榛樿: 鍖椾含): " REGION
    REGION=${REGION:-鍖椾含}
    
    read -p "鏄惁閰嶇疆鐢熸棩? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "璇疯緭鍏ュ悕瀛? " BIRTHDAY_NAME
        read -p "璇疯緭鍏ョ敓鏃?(鏍煎紡: YYYY-MM-DD): " BIRTHDAY_DATE
        read -p "鏄惁涓哄啘鍘? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            BIRTHDAY_DATE="r$BIRTHDAY_DATE"
        fi
    fi
    
    read -p "鏄惁閰嶇疆绾康鏃? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "璇疯緭鍏ョ邯蹇垫棩 (鏍煎紡: YYYY-MM-DD): " COMMEMORATION_DATE
    fi
    
    # 鐢熸垚閰嶇疆鏂囦欢
    cat > config.txt << EOF
{
# 鍏紬鍙烽厤缃?"app_id": "$APP_ID",
"app_secret": "$APP_SECRET",
"template_id": "$TEMPLATE_ID",
"user": [$(echo "$USER_IDS" | sed 's/,/", "/g' | sed 's/^/"/' | sed 's/$/"/')],

# API瀵嗛挜
"weather_key": "$WEATHER_KEY",
"tian_api": "$TIAN_API",

# 鍦板尯閰嶇疆
"region": "$REGION",
EOF

    if [ ! -z "$BIRTHDAY_NAME" ]; then
        cat >> config.txt << EOF

# 鐢熸棩閰嶇疆
"birthday1": {"name": "$BIRTHDAY_NAME", "birthday": "$BIRTHDAY_DATE"},
EOF
    fi

    if [ ! -z "$COMMEMORATION_DATE" ]; then
        cat >> config.txt << EOF

# 绾康鏃ラ厤缃?"commemoration_day1": "$COMMEMORATION_DATE",
EOF
    fi

    cat >> config.txt << EOF

# 閲戝彞閰嶇疆
"note_ch": "",
"note_en": "",

# 棰滆壊閰嶇疆锛堢暀绌轰娇鐢ㄩ殢鏈洪鑹诧級
"color_date": "",
"color_region": "",
"color_weather": "",
"color_zaoan": "",
"color_wanan": "",
}
EOF
    
    print_success "閰嶇疆鏂囦欢宸茬敓鎴?
}

# 娴嬭瘯杩愯
test_run() {
    print_step "娴嬭瘯杩愯"
    
    cd "$PROJECT_DIR"
    
    read -p "鏄惁绔嬪嵆娴嬭瘯鎺ㄩ€? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_info "寮€濮嬫祴璇曟帹閫?.."
        python3 main.py
        
        if [ $? -eq 0 ]; then
            print_success "娴嬭瘯鎺ㄩ€佹垚鍔燂紒"
        else
            print_error "娴嬭瘯鎺ㄩ€佸け璐ワ紝璇锋鏌ラ厤缃?
        fi
    fi
}

# 璁剧疆瀹氭椂浠诲姟
setup_cron() {
    print_step "璁剧疆瀹氭椂浠诲姟"
    
    read -p "鏄惁璁剧疆瀹氭椂鎺ㄩ€? (Y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        echo -e "\n${CYAN}璇烽€夋嫨鎺ㄩ€佹椂闂?${NC}"
        echo "1) 姣忓ぉ鏃╀笂 8:00"
        echo "2) 姣忓ぉ鏅氫笂 22:00"
        echo "3) 鏃╀笂 8:00 鍜?鏅氫笂 22:00"
        echo "4) 鑷畾涔夋椂闂?
        read -p "璇烽€夋嫨 (1-4): " CRON_CHOICE
        
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
                read -p "璇疯緭鍏?cron 琛ㄨ揪寮? " CRON_SCHEDULE
                ;;
            *)
                print_warning "鏃犳晥閫夋嫨锛岃烦杩囧畾鏃朵换鍔¤缃?
                return
                ;;
        esac
        
        # 娣诲姞鍒?crontab
        CRON_COMMAND="cd $PROJECT_DIR && /usr/bin/python3 main.py >> $PROJECT_DIR/push.log 2>&1"
        
        # 妫€鏌ユ槸鍚﹀凡瀛樺湪
        (crontab -l 2>/dev/null | grep -v "$PROJECT_DIR/main.py"; echo "$CRON_SCHEDULE $CRON_COMMAND") | crontab -
        
        print_success "瀹氭椂浠诲姟璁剧疆瀹屾垚"
        print_info "鎺ㄩ€佹椂闂? $CRON_SCHEDULE"
        print_info "鏃ュ織鏂囦欢: $PROJECT_DIR/push.log"
    fi
}

# 鍒涘缓绠＄悊鑴氭湰
create_manager() {
    print_step "鍒涘缓绠＄悊鑴氭湰"
    
    cat > "$HOME/wechat-push" << 'EOF'
#!/bin/bash

PROJECT_DIR="$HOME/wexchatpush/WeChatPush-Merged"
LOG_FILE="$PROJECT_DIR/push.log"

case "$1" in
    start)
        echo "鎵ц鎺ㄩ€?.."
        cd "$PROJECT_DIR"
        python3 main.py
        ;;
    
    log)
        if [ -f "$LOG_FILE" ]; then
            tail -f "$LOG_FILE"
        else
            echo "鏃ュ織鏂囦欢涓嶅瓨鍦?
        fi
        ;;
    
    config)
        nano "$PROJECT_DIR/config.txt"
        ;;
    
    cron)
        crontab -e
        ;;
    
    update)
        echo "鏇存柊椤圭洰..."
        cd "$HOME/wexchatpush"
        git pull
        cd "$PROJECT_DIR"
        pip3 install --user -r requirements.txt
        echo "鏇存柊瀹屾垚"
        ;;
    
    status)
        echo "妫€鏌ュ畾鏃朵换鍔?.."
        crontab -l | grep wexchatpush || echo "鏈缃畾鏃朵换鍔?
        ;;
    
    *)
        echo "寰俊鍏紬鍙锋帹閫佸伐鍏?- 绠＄悊鑴氭湰"
        echo ""
        echo "鐢ㄦ硶: wechat-push [鍛戒护]"
        echo ""
        echo "鍛戒护:"
        echo "  start   - 绔嬪嵆鎵ц鎺ㄩ€?
        echo "  log     - 鏌ョ湅鎺ㄩ€佹棩蹇?
        echo "  config  - 缂栬緫閰嶇疆鏂囦欢"
        echo "  cron    - 缂栬緫瀹氭椂浠诲姟"
        echo "  update  - 鏇存柊椤圭洰"
        echo "  status  - 鏌ョ湅鐘舵€?
        ;;
esac
EOF
    
    chmod +x "$HOME/wechat-push"
    
    # 娣诲姞鍒?PATH锛堝鏋滀笉鍦級
    if [[ ":$PATH:" != *":$HOME:"* ]]; then
        echo 'export PATH="$HOME:$PATH"' >> "$HOME/.bashrc"
        export PATH="$HOME:$PATH"
    fi
    
    print_success "绠＄悊鑴氭湰宸插垱寤? wechat-push"
}

# 瀹屾垚瀹夎
finish_installation() {
    echo -e "\n${GREEN}"
    cat << "EOF"
鈺斺晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺?鈺?                                                      鈺?鈺?             鉁?瀹夎瀹屾垚锛?                           鈺?鈺?                                                      鈺?鈺氣晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺愨晲鈺?EOF
    echo -e "${NC}\n"
    
    echo -e "${CYAN}馃搧 瀹夎鐩綍:${NC} $INSTALL_DIR"
    echo -e "${CYAN}馃摑 閰嶇疆鏂囦欢:${NC} $PROJECT_DIR/config.txt"
    echo -e "${CYAN}馃搳 鏃ュ織鏂囦欢:${NC} $PROJECT_DIR/push.log"
    echo ""
    echo -e "${YELLOW}甯哥敤鍛戒护:${NC}"
    echo -e "  ${GREEN}wechat-push start${NC}  - 绔嬪嵆鎺ㄩ€?
    echo -e "  ${GREEN}wechat-push log${NC}    - 鏌ョ湅鏃ュ織"
    echo -e "  ${GREEN}wechat-push config${NC} - 缂栬緫閰嶇疆"
    echo -e "  ${GREEN}wechat-push status${NC} - 鏌ョ湅鐘舵€?
    echo ""
    echo -e "${BLUE}馃挕 鎻愮ず:${NC} 杩愯 ${GREEN}wechat-push${NC} 鏌ョ湅鎵€鏈夊懡浠?
    echo ""
}

# 涓诲嚱鏁?main() {
    clear
    print_banner
    
    detect_os
    
    # 妫€鏌ュ苟瀹夎 Python
    if ! check_python; then
        install_python
    fi
    
    # 瀹夎 Git
    install_git
    
    # 鍏嬮殕椤圭洰
    clone_project
    
    # 瀹夎渚濊禆
    install_dependencies
    
    # 閰嶇疆椤圭洰
    configure_project
    
    # 娴嬭瘯杩愯
    test_run
    
    # 璁剧疆瀹氭椂浠诲姟
    setup_cron
    
    # 鍒涘缓绠＄悊鑴氭湰
    create_manager
    
    # 瀹屾垚
    finish_installation
}

# 鎵ц涓诲嚱鏁?main
