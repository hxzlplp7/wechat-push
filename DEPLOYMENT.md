# 馃殌 閮ㄧ讲鎸囧崡

## 馃搵 鐩綍

- [GitHub Pages 閮ㄧ讲](#github-pages-閮ㄧ讲)
- [鏈嶅姟鍣ㄩ儴缃瞉(#鏈嶅姟鍣ㄩ儴缃?
- [GitHub Actions 鑷姩鎺ㄩ€乚(#github-actions-鑷姩鎺ㄩ€?

---

## 馃寪 GitHub Pages 閮ㄧ讲

灏嗛厤缃伐鍏风綉椤甸儴缃插埌 GitHub Pages锛岃浠讳綍浜洪兘鑳藉湪绾夸娇鐢ㄣ€?

### 姝ラ涓€锛欶ork 浠撳簱

1. 璁块棶椤圭洰浠撳簱
2. 鐐瑰嚮鍙充笂瑙掔殑 **Fork** 鎸夐挳
3. 绛夊緟 Fork 瀹屾垚

### 姝ラ浜岋細鍚敤 GitHub Pages

1. 杩涘叆浣?Fork 鐨勪粨搴?
2. 鐐瑰嚮 **Settings** (璁剧疆)
3. 鍦ㄥ乏渚ц彍鍗曟壘鍒?**Pages**
4. 鍦?**Source** 涓嬮€夋嫨 **GitHub Actions**

### 姝ラ涓夛細瑙﹀彂閮ㄧ讲

鏈変袱绉嶆柟寮忚Е鍙戦儴缃诧細

#### 鏂瑰紡 1锛氭帹閫佷唬鐮侊紙鑷姩瑙﹀彂锛?
```bash
git add .
git commit -m "update"
git push
```

#### 鏂瑰紡 2锛氭墜鍔ㄨЕ鍙?
1. 杩涘叆浠撳簱鐨?**Actions** 鏍囩
2. 閫夋嫨 **Deploy to GitHub Pages** 宸ヤ綔娴?
3. 鐐瑰嚮 **Run workflow**
4. 鐐瑰嚮缁胯壊鐨?**Run workflow** 鎸夐挳

### 姝ラ鍥涳細璁块棶缃戠珯

閮ㄧ讲瀹屾垚鍚庯紝璁块棶锛?
```
https://浣犵殑鐢ㄦ埛鍚?github.io/wexchatpush/
```

### 馃帹 鑷畾涔夊煙鍚嶏紙鍙€夛級

1. 鍦ㄤ粨搴?**Settings** 鈫?**Pages** 涓?
2. 鍦?**Custom domain** 杈撳叆浣犵殑鍩熷悕
3. 鍦ㄥ煙鍚?DNS 璁剧疆涓坊鍔?CNAME 璁板綍锛?
   ```
   CNAME  浣犵殑鐢ㄦ埛鍚?github.io
   ```

---

## 馃枼锔?鏈嶅姟鍣ㄩ儴缃?

鍦ㄤ綘鐨勬湇鍔″櫒涓婅嚜鍔ㄥ畨瑁呭拰閰嶇疆鎺ㄩ€佽剼鏈€?

### 蹇€熷畨瑁咃紙涓€閿剼鏈級

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/浣犵殑鐢ㄦ埛鍚?wexchatpush/main/install.sh)
```

鎴栦娇鐢?`wget`锛?
```bash
bash <(wget -qO- https://raw.githubusercontent.com/浣犵殑鐢ㄦ埛鍚?wexchatpush/main/install.sh)
```

### 瀹夎杩囩▼

鑴氭湰浼氳嚜鍔ㄥ畬鎴愪互涓嬫楠わ細

1. 鉁?**妫€娴嬬郴缁熺幆澧?*
   - 璇嗗埆鎿嶄綔绯荤粺绫诲瀷
   - 妫€鏌?Python 鐗堟湰

2. 鉁?**瀹夎渚濊禆**
   - 瀹夎 Python 3.8+
   - 瀹夎 pip 鍜?Git
   - 瀹夎椤圭洰渚濊禆鍖?

3. 鉁?**涓嬭浇椤圭洰**
   - 浠?GitHub 鍏嬮殕浠撳簱
   - 杩涘叆椤圭洰鐩綍

4. 鉁?**閰嶇疆寮曞**
   - 濉啓鍏紬鍙蜂俊鎭?
   - 閰嶇疆 API 瀵嗛挜
   - 璁剧疆涓汉淇℃伅

5. 鉁?**娴嬭瘯杩愯**
   - 娴嬭瘯閰嶇疆鏄惁姝ｇ‘
   - 灏濊瘯鍙戦€佹秷鎭?

6. 鉁?**璁剧疆瀹氭椂浠诲姟**
   - 閫夋嫨鎺ㄩ€佹椂闂?
   - 娣诲姞 crontab 浠诲姟

7. 鉁?**鍒涘缓绠＄悊鍛戒护**
   - 鐢熸垚 `wechat-push` 绠＄悊鑴氭湰

### 绠＄悊鍛戒护

瀹夎瀹屾垚鍚庯紝鍙互浣跨敤浠ヤ笅鍛戒护绠＄悊锛?

```bash
# 绔嬪嵆鎺ㄩ€佹秷鎭?
wechat-push start

# 鏌ョ湅鎺ㄩ€佹棩蹇?
wechat-push log

# 缂栬緫閰嶇疆鏂囦欢
wechat-push config

# 缂栬緫瀹氭椂浠诲姟
wechat-push cron

# 鏇存柊椤圭洰
wechat-push update

# 鏌ョ湅鐘舵€?
wechat-push status
```

### 鎵嬪姩閮ㄧ讲

濡傛灉涓€閿剼鏈け璐ワ紝鍙互鎵嬪姩閮ㄧ讲锛?

#### 1. 瀹夎渚濊禆
```bash
# Debian/Ubuntu
sudo apt update
sudo apt install -y python3 python3-pip git

# CentOS/RHEL
sudo yum install -y python3 python3-pip git

# Arch Linux
sudo pacman -S python python-pip git
```

#### 2. 鍏嬮殕椤圭洰
```bash
git clone https://github.com/浣犵殑鐢ㄦ埛鍚?wexchatpush.git
cd wexchatpush/WeChatPush-Merged
```

#### 3. 瀹夎 Python 鍖?
```bash
pip3 install -r requirements.txt
```

#### 4. 閰嶇疆鏂囦欢
```bash
cp config.example.txt config.txt
nano config.txt  # 鎴栦娇鐢?vim 缂栬緫
```

#### 5. 娴嬭瘯杩愯
```bash
python3 main.py
```

#### 6. 璁剧疆瀹氭椂浠诲姟
```bash
crontab -e
```

娣诲姞浠ヤ笅鍐呭锛堟牴鎹渶瑕佽皟鏁存椂闂村拰璺緞锛夛細
```cron
# 姣忓ぉ鏃╀笂 8:00 鎺ㄩ€?
0 8 * * * cd /path/to/WeChatPush-Merged && python3 main.py >> push.log 2>&1

# 姣忓ぉ鏅氫笂 22:00 鎺ㄩ€?
0 22 * * * cd /path/to/WeChatPush-Merged && python3 main.py >> push.log 2>&1
```

---

## 馃 GitHub Actions 鑷姩鎺ㄩ€?

浣跨敤 GitHub Actions 瀹炵幇浜戠鑷姩瀹氭椂鎺ㄩ€侊紝鏃犻渶鏈嶅姟鍣ㄣ€?

### 姝ラ涓€锛氬噯澶囬厤缃枃浠?

1. 浣跨敤鍦ㄧ嚎閰嶇疆宸ュ叿鐢熸垚 `config.txt`
2. 鎴栨墜鍔ㄥ鍒?`config.example.txt` 骞朵慨鏀?

### 姝ラ浜岋細涓婁紶閰嶇疆鏂囦欢

```bash
# 鍏嬮殕浣犵殑浠撳簱
git clone https://github.com/浣犵殑鐢ㄦ埛鍚?wexchatpush.git
cd wexchatpush/WeChatPush-Merged

# 灏嗛厤缃枃浠舵斁鍏ョ洰褰?
# 缂栬緫鎴栧鍒朵綘鐨?config.txt

# 鎻愪氦骞舵帹閫?
git add config.txt
git commit -m "Add config file"
git push
```

### 姝ラ涓夛細鏌ョ湅宸ヤ綔娴?

1. 杩涘叆浠撳簱鐨?**Actions** 椤甸潰
2. 绛夊緟宸ヤ綔娴佽嚜鍔ㄨ繍琛?
3. 鏌ョ湅杩愯鏃ュ織

### 榛樿鎺ㄩ€佹椂闂?

| 鏃堕棿锛堝寳浜級 | UTC 鏃堕棿 | 鎺ㄩ€佸唴瀹?|
|-------------|---------|---------|
| 08:00 | 00:00 | 鏃╁畨蹇冭 + 澶╂皵 |
| 12:00 | 04:00 | 鍋ュ悍灏忔彁绀?|
| 20:30 | 12:30 | 绗戣瘽 + 璋滆 |
| 22:00 | 14:00 | 鏅氬畨蹇冭 |
| 23:00 | 15:00 | 鏁呬簨澶у叏 |

### 淇敼鎺ㄩ€佹椂闂?

缂栬緫 `.github/workflows/push.yml`锛?

```yaml
on:
  schedule:
    # 鍖椾含鏃堕棿 = UTC + 8灏忔椂
    # 渚嬪锛氬寳浜椂闂?08:00 = UTC 00:00
    - cron: '0 0 * * *'  # 鏃╀笂 08:00
    - cron: '0 14 * * *' # 鏅氫笂 22:00
```

Cron 琛ㄨ揪寮忔牸寮忥細
```
鍒嗛挓 灏忔椂 鏃?鏈?鏄熸湡
0    0   *  *  *     # 姣忓ぉ 00:00 UTC
30   12  *  *  *     # 姣忓ぉ 12:30 UTC
0    0,12 * *  *     # 姣忓ぉ 00:00 鍜?12:00 UTC
```

### 鎵嬪姩瑙﹀彂鎺ㄩ€?

1. 杩涘叆 **Actions** 椤甸潰
2. 閫夋嫨鎺ㄩ€佸伐浣滄祦
3. 鐐瑰嚮 **Run workflow**
4. 閫夋嫨鍒嗘敮锛岀偣鍑荤豢鑹叉寜閽?

### 鏌ョ湅鎺ㄩ€佹棩蹇?

1. 杩涘叆 **Actions** 椤甸潰
2. 鐐瑰嚮鍏蜂綋鐨勫伐浣滄祦杩愯
3. 鐐瑰嚮 **push** 浠诲姟
4. 灞曞紑姝ラ鏌ョ湅璇︾粏鏃ュ織

---

## 馃敡 甯歌闂

### Q: GitHub Actions 涓轰粈涔堟病鏈夎嚜鍔ㄨ繍琛岋紵

**A**: 鍙兘鐨勫師鍥狅細
- 浠撳簱杩?0澶╁唴鏃犳椿鍔紙GitHub 浼氭殏鍋滃畾鏃朵换鍔★級
- Actions 鏈惎鐢細Settings 鈫?Actions 鈫?閫夋嫨鍏佽鎵€鏈夋搷浣?
- 閰嶇疆鏂囦欢鏈夎锛氭鏌?`config.txt` 鏍煎紡

**瑙ｅ喅鏂规硶**锛?
1. 瀹氭湡鎻愪氦浠ｇ爜淇濇寔娲昏穬
2. 鎵嬪姩瑙﹀彂涓€娆″伐浣滄祦
3. 妫€鏌ュ伐浣滄祦鏃ュ織鎺掓煡閿欒

### Q: 鏈嶅姟鍣ㄥ畾鏃朵换鍔′笉鎵ц锛?

**A**: 妫€鏌ユ楠わ細

1. 鏌ョ湅 crontab 鏄惁姝ｇ‘锛?
   ```bash
   crontab -l
   ```

2. 妫€鏌ユ棩蹇楁枃浠讹細
   ```bash
   cat ~/wexchatpush/WeChatPush-Merged/push.log
   ```

3. 鎵嬪姩娴嬭瘯锛?
   ```bash
   wechat-push start
   ```

4. 纭 cron 鏈嶅姟杩愯锛?
   ```bash
   sudo systemctl status cron    # Debian/Ubuntu
   sudo systemctl status crond   # CentOS/RHEL
   ```

### Q: 涓€閿剼鏈畨瑁呭け璐ワ紵

**A**: 甯歌鍘熷洜锛?
- 缃戠粶闂锛氭棤娉曡闂?GitHub
- 鏉冮檺闂锛氭煇浜涘懡浠ら渶瑕?sudo
- 绯荤粺涓嶆敮鎸侊細妫€鏌ユ槸鍚︿负鍙楁敮鎸佺殑绯荤粺

**瑙ｅ喅鏂规硶**锛?
1. 妫€鏌ョ綉缁滆繛鎺?
2. 浣跨敤 `sudo` 杩愯鑴氭湰
3. 鎵嬪姩瀹夎锛堝弬鑰冩墜鍔ㄩ儴缃茬珷鑺傦級

### Q: 鎺ㄩ€佸け璐ワ紝鎻愮ず access_token 閿欒锛?

**A**: 妫€鏌ラ厤缃細
- `app_id` 鍜?`app_secret` 鏄惁姝ｇ‘
- 鏄惁鍦ㄥ井淇″叕浼楀钩鍙版祴璇曞彿涓幏鍙?
- 閰嶇疆鏂囦欢鏍煎紡鏄惁姝ｇ‘锛堟敞鎰忓紩鍙凤級

### Q: GitHub Pages 404 閿欒锛?

**A**: 瑙ｅ喅姝ラ锛?
1. 纭 Actions 宸叉垚鍔熻繍琛?
2. 妫€鏌?Settings 鈫?Pages 鏄惁姝ｇ‘閰嶇疆
3. 绛夊緟鍑犲垎閽燂紙閮ㄧ讲闇€瑕佹椂闂达級
4. 娓呴櫎娴忚鍣ㄧ紦瀛?

### Q: 濡備綍鏇存柊椤圭洰锛?

**鏈嶅姟鍣ㄦ洿鏂?*锛?
```bash
wechat-push update
```

**GitHub 鏇存柊**锛?
```bash
cd wexchatpush
git pull
```

---

## 馃摓 鑾峰彇甯姪

濡傛灉閬囧埌闂锛?

1. 馃摉 鏌ョ湅 [README.md](../README.md) 瀹屾暣鏂囨。
2. 馃悰 鎻愪氦 [Issue](https://github.com/浣犵殑鐢ㄦ埛鍚?wexchatpush/issues)
3. 馃挰 鍦?Discussions 涓璁?

---

<p align="center">
  <strong>绁濅綘閮ㄧ讲鎴愬姛锛侌煄?/strong>
</p>
