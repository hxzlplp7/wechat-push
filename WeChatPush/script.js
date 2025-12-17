/**
 * 微信公众号推送配置工具 - JavaScript 逻辑
 */

// 当前步骤
let currentStep = 1;
const totalSteps = 5;

// DOM 元素
const progressFill = document.getElementById('progressFill');
const steps = document.querySelectorAll('.step');
const sections = document.querySelectorAll('.form-section');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');
const toast = document.getElementById('toast');

/**
 * 更新进度条和步骤状态
 */
function updateProgress() {
    // 更新进度条填充
    const progress = (currentStep / totalSteps) * 100;
    progressFill.style.width = `${progress}%`;

    // 更新步骤状态
    steps.forEach((step, index) => {
        const stepNum = index + 1;
        step.classList.remove('active', 'completed');

        if (stepNum < currentStep) {
            step.classList.add('completed');
        } else if (stepNum === currentStep) {
            step.classList.add('active');
        }
    });

    // 更新表单区域显示
    sections.forEach((section, index) => {
        section.classList.remove('active');
        if (index + 1 === currentStep) {
            section.classList.add('active');
        }
    });

    // 更新按钮状态
    prevBtn.style.display = currentStep === 1 ? 'none' : 'flex';

    if (currentStep === totalSteps) {
        nextBtn.innerHTML = `
            完成
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
        `;
        generateConfig();
    } else {
        nextBtn.innerHTML = `
            下一步
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="5" y1="12" x2="19" y2="12"></line>
                <polyline points="12 5 19 12 12 19"></polyline>
            </svg>
        `;
    }
}

/**
 * 验证当前步骤
 */
function validateCurrentStep() {
    const currentSection = document.querySelector(`.form-section[data-section="${currentStep}"]`);
    const requiredInputs = currentSection.querySelectorAll('input[required]');

    for (const input of requiredInputs) {
        if (!input.value.trim()) {
            input.focus();
            input.parentElement.classList.add('error');
            setTimeout(() => {
                input.parentElement.classList.remove('error');
            }, 2000);
            showToast('请填写必填项', 'error');
            return false;
        }
    }

    return true;
}

/**
 * 下一步
 */
function nextStep() {
    if (currentStep < totalSteps) {
        if (validateCurrentStep()) {
            currentStep++;
            updateProgress();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    }
}

/**
 * 上一步
 */
function prevStep() {
    if (currentStep > 1) {
        currentStep--;
        updateProgress();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

/**
 * 切换密码显示
 */
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const btn = input.parentElement.querySelector('.toggle-password');
    const eyeOpen = btn.querySelector('.eye-open');
    const eyeClosed = btn.querySelector('.eye-closed');

    if (input.type === 'password') {
        input.type = 'text';
        eyeOpen.style.display = 'none';
        eyeClosed.style.display = 'block';
    } else {
        input.type = 'password';
        eyeOpen.style.display = 'block';
        eyeClosed.style.display = 'none';
    }
}

/**
 * 添加用户输入行
 */
function addUser() {
    const container = document.getElementById('usersContainer');
    const row = document.createElement('div');
    row.className = 'user-input-row';
    row.innerHTML = `
        <div class="input-wrapper">
            <input type="text" name="user[]" placeholder="用户 OpenID">
            <div class="input-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </div>
        </div>
        <button type="button" class="btn-icon btn-remove" onclick="removeUserRow(this)">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
        </button>
    `;
    container.appendChild(row);
}

/**
 * 移除用户输入行
 */
function removeUserRow(btn) {
    const container = document.getElementById('usersContainer');
    if (container.children.length > 1) {
        btn.parentElement.remove();
    }
}

/**
 * 添加生日项
 */
function addBirthday() {
    const container = document.getElementById('birthdayContainer');
    const row = document.createElement('div');
    row.className = 'item-row';
    row.innerHTML = `
        <input type="text" name="birthdayName[]" placeholder="名字" class="name-input">
        <input type="date" name="birthdayDate[]" class="date-input">
        <label class="checkbox-label">
            <input type="checkbox" name="birthdayLunar[]">
            <span class="checkbox-custom"></span>
            农历
        </label>
        <button type="button" class="btn-remove" onclick="removeItem(this)">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
        </button>
    `;
    container.appendChild(row);
}

/**
 * 添加纪念日项
 */
function addAnniversary() {
    const container = document.getElementById('anniversaryContainer');
    const row = document.createElement('div');
    row.className = 'item-row';
    row.innerHTML = `
        <input type="date" name="anniversaryDate[]" class="date-input full">
        <button type="button" class="btn-remove" onclick="removeItem(this)">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
        </button>
    `;
    container.appendChild(row);
}

/**
 * 添加倒计时项
 */
function addCountdown() {
    const container = document.getElementById('countdownContainer');
    const row = document.createElement('div');
    row.className = 'item-row';
    row.innerHTML = `
        <input type="date" name="countdownDate[]" class="date-input full">
        <button type="button" class="btn-remove" onclick="removeItem(this)">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
        </button>
    `;
    container.appendChild(row);
}

/**
 * 移除项目
 */
function removeItem(btn) {
    btn.parentElement.remove();
}

/**
 * 内容卡片选择
 */
document.querySelectorAll('.content-card').forEach(card => {
    card.addEventListener('click', function () {
        this.classList.toggle('selected');
    });
});

/**
 * 生成配置文件
 */
function generateConfig() {
    const form = document.getElementById('configForm');

    // 收集基础配置
    const appId = document.getElementById('appId').value.trim();
    const appSecret = document.getElementById('appSecret').value.trim();
    const templateId = document.getElementById('templateId').value.trim();

    // 收集用户列表
    const userInputs = document.querySelectorAll('input[name="user[]"]');
    const users = Array.from(userInputs)
        .map(input => input.value.trim())
        .filter(v => v);

    // 收集API密钥
    const weatherKey = document.getElementById('weatherKey').value.trim();
    const tianApi = document.getElementById('tianApi').value.trim();

    // 收集个人信息
    const region = document.getElementById('region').value.trim() || '北京';
    const horoscope = document.getElementById('horoscope').value;

    // 收集生日信息
    const birthdayNames = document.querySelectorAll('input[name="birthdayName[]"]');
    const birthdayDates = document.querySelectorAll('input[name="birthdayDate[]"]');
    const birthdayLunars = document.querySelectorAll('input[name="birthdayLunar[]"]');
    const birthdays = [];

    birthdayNames.forEach((nameInput, index) => {
        const name = nameInput.value.trim();
        const date = birthdayDates[index]?.value;
        const isLunar = birthdayLunars[index]?.checked;

        if (name && date) {
            birthdays.push({
                name,
                birthday: isLunar ? 'r' + date : date
            });
        }
    });

    // 收集纪念日
    const anniversaryDates = document.querySelectorAll('input[name="anniversaryDate[]"]');
    const anniversaries = Array.from(anniversaryDates)
        .map(input => input.value)
        .filter(v => v);

    // 收集倒计时
    const countdownDates = document.querySelectorAll('input[name="countdownDate[]"]');
    const countdowns = Array.from(countdownDates)
        .map(input => input.value)
        .filter(v => v);

    // 收集选中的内容类型
    const selectedContents = Array.from(document.querySelectorAll('input[name="contents[]"]:checked'))
        .map(input => input.value);

    // 生成配置字符串
    let config = `{
# ============== 公众号配置 ==============
# 公众号appId (必填)
"app_id": "${appId}",
# 公众号appSecret (必填)
"app_secret": "${appSecret}",
# 模板消息id (必填)
"template_id": "${templateId}",
# 接收公众号消息的微信号openid
"user": [${users.map(u => `"${u}"`).join(', ')}],

# ============== API密钥配置 ==============
# 和风天气apikey
"weather_key": "${weatherKey}",
# 天行数据apikey
"tian_api": "${tianApi}",

# ============== 地区配置 ==============
"region": "${region}",
`;

    // 添加星座
    if (horoscope) {
        config += `
# ============== 星座配置 ==============
"horoscope1": "${horoscope}",
`;
    }

    // 添加生日
    if (birthdays.length > 0) {
        config += `
# ============== 生日配置 ==============
`;
        birthdays.forEach((b, i) => {
            config += `"birthday${i + 1}": {"name": "${b.name}", "birthday": "${b.birthday}"},
`;
        });
    }

    // 添加纪念日
    if (anniversaries.length > 0) {
        config += `
# ============== 纪念日配置 ==============
`;
        anniversaries.forEach((date, i) => {
            config += `"commemoration_day${i + 1}": "${date}",
`;
        });
    }

    // 添加倒计时
    if (countdowns.length > 0) {
        config += `
# ============== 倒计时配置 ==============
`;
        countdowns.forEach((date, i) => {
            config += `"countdown${i + 1}": "${date}",
`;
        });
    }

    // 金句配置
    config += `
# ============== 金句配置 ==============
"note_ch": "",
"note_en": "",
`;

    // 添加颜色配置
    config += `
# ============== 字体颜色配置 ==============
# 留空则使用随机颜色
"color_date": "",
"color_region": "",
"color_weather": "",
"color_temp": "",
"color_max_temp": "",
"color_min_temp": "",
"color_note_en": "",
"color_note_zh": "",
`;

    // 为选中的内容添加颜色配置
    const contentColorMap = {
        'zaoan': 'color_zaoan',
        'wanan': 'color_wanan',
        'saylove': 'color_saylove',
        'caihongpi': 'color_chp',
        'healthtip': 'color_health_tip',
        'qiaomen': 'color_xqm',
        'joke': 'color_joke',
        'riddle': 'color_riddle',
        'story': 'color_story',
        'dujitang': 'color_dujitang',
        'tiangou': 'color_tiangou',
        'proverb': 'color_proverb'
    };

    selectedContents.forEach(content => {
        if (contentColorMap[content]) {
            config += `"${contentColorMap[content]}": "",
`;
        }
    });

    // 生日颜色
    birthdays.forEach((_, i) => {
        config += `"color_birthday${i + 1}": "",
`;
    });

    // 纪念日颜色
    anniversaries.forEach((_, i) => {
        config += `"color_commemoration_day${i + 1}": "",
`;
    });

    // 倒计时颜色
    countdowns.forEach((_, i) => {
        config += `"color_countdown${i + 1}": "",
`;
    });

    // 星座颜色
    if (horoscope) {
        config += `"color_horoscope1": "",
`;
    }

    config += `}`;

    // 显示配置
    document.getElementById('outputCode').textContent = config;
}

/**
 * 复制配置
 */
function copyConfig() {
    const code = document.getElementById('outputCode').textContent;
    navigator.clipboard.writeText(code).then(() => {
        showToast('配置已复制到剪贴板');
    }).catch(() => {
        // 降级方案
        const textarea = document.createElement('textarea');
        textarea.value = code;
        document.body.appendChild(textarea);
        textarea.select();
        document.execCommand('copy');
        document.body.removeChild(textarea);
        showToast('配置已复制到剪贴板');
    });
}

/**
 * 下载配置
 */
function downloadConfig() {
    const code = document.getElementById('outputCode').textContent;
    const blob = new Blob([code], { type: 'text/plain;charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'config.txt';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
    showToast('配置文件已下载');
}

/**
 * 显示Toast提示
 */
function showToast(message, type = 'success') {
    const toastEl = document.getElementById('toast');
    const messageEl = toastEl.querySelector('.toast-message');

    messageEl.textContent = message;
    toastEl.classList.add('show');

    if (type === 'error') {
        toastEl.style.background = 'linear-gradient(135deg, #f5576c 0%, #f093fb 100%)';
    } else {
        toastEl.style.background = 'linear-gradient(135deg, #11998e 0%, #38ef7d 100%)';
    }

    setTimeout(() => {
        toastEl.classList.remove('show');
    }, 3000);
}

/**
 * 初始化
 */
document.addEventListener('DOMContentLoaded', function () {
    updateProgress();

    // 添加输入框焦点动画
    document.querySelectorAll('input, select, textarea').forEach(input => {
        input.addEventListener('focus', function () {
            this.parentElement.classList.add('focused');
        });

        input.addEventListener('blur', function () {
            this.parentElement.classList.remove('focused');
        });
    });

    // 阻止表单默认提交
    document.getElementById('configForm').addEventListener('submit', function (e) {
        e.preventDefault();
    });
});

/**
 * 键盘快捷键
 */
document.addEventListener('keydown', function (e) {
    // Enter 键下一步
    if (e.key === 'Enter' && !e.shiftKey) {
        const activeElement = document.activeElement;
        if (activeElement.tagName !== 'TEXTAREA') {
            e.preventDefault();
            if (currentStep < totalSteps) {
                nextStep();
            }
        }
    }

    // Escape 键上一步
    if (e.key === 'Escape' && currentStep > 1) {
        prevStep();
    }
});
