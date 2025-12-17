# 棣冩畬 闁劎璁查幐鍥у础

## 棣冩惖 閻╊喖缍?

- [GitHub Pages 闁劎璁瞉(#github-pages-闁劎璁?
- [閺堝秴濮熼崳銊╁劥缂冪瀴(#閺堝秴濮熼崳銊╁劥缂?
- [GitHub Actions 閼奉亜濮╅幒銊┾偓涔?#github-actions-閼奉亜濮╅幒銊┾偓?

---

## 棣冨 GitHub Pages 闁劎璁?

鐏忓棝鍘ょ純顔间紣閸忛缍夋い鐢稿劥缂冩彃鍩?GitHub Pages閿涘矁顔€娴犺缍嶆禍娲厴閼宠棄婀痪澶稿▏閻劊鈧?

### 濮濄儵顎冩稉鈧敍娆秓rk 娴犳挸绨?

1. 鐠佸潡妫舵い鍦窗娴犳挸绨?
2. 閻愮懓鍤崣鍏呯瑐鐟欐帞娈?**Fork** 閹稿鎸?
3. 缁涘绶?Fork 鐎瑰本鍨?

### 濮濄儵顎冩禍宀嬬窗閸氼垳鏁?GitHub Pages

1. 鏉╂稑鍙嗘担?Fork 閻ㄥ嫪绮ㄦ惔?
2. 閻愮懓鍤?**Settings** (鐠佸墽鐤?
3. 閸︺劌涔忔笟褑褰嶉崡鏇熷閸?**Pages**
4. 閸?**Source** 娑撳鈧瀚?**GitHub Actions**

### 濮濄儵顎冩稉澶涚窗鐟欙箑褰傞柈銊ц

閺堝琚辩粔宥嗘煙瀵繗袝閸欐垿鍎寸純璇х窗

#### 閺傜懓绱?1閿涙碍甯归柅浣峰敩閻緤绱欓懛顏勫З鐟欙箑褰傞敍?
```bash
git add .
git commit -m "update"
git push
```

#### 閺傜懓绱?2閿涙碍澧滈崝銊ㄐ曢崣?
1. 鏉╂稑鍙嗘禒鎾崇氨閻?**Actions** 閺嶅洨顒?
2. 闁瀚?**Deploy to GitHub Pages** 瀹搞儰缍斿ù?
3. 閻愮懓鍤?**Run workflow**
4. 閻愮懓鍤紒鑳閻?**Run workflow** 閹稿鎸?

### 濮濄儵顎冮崶娑崇窗鐠佸潡妫剁純鎴犵彲

闁劎璁茬€瑰本鍨氶崥搴礉鐠佸潡妫堕敍?
```
https://娴ｇ姷娈戦悽銊﹀煕閸?github.io/wexchatpush/
```

### 棣冨腹 閼奉亜鐣炬稊澶婄厵閸氬稄绱欓崣顖炩偓澶涚礆

1. 閸︺劋绮ㄦ惔?**Settings** 閳?**Pages** 娑?
2. 閸?**Custom domain** 鏉堟挸鍙嗘担鐘垫畱閸╃喎鎮?
3. 閸︺劌鐓欓崥?DNS 鐠佸墽鐤嗘稉顓熷潑閸?CNAME 鐠佹澘缍嶉敍?
   ```
   CNAME  娴ｇ姷娈戦悽銊﹀煕閸?github.io
   ```

---

## 棣冩灱閿?閺堝秴濮熼崳銊╁劥缂?

閸︺劋缍橀惃鍕箛閸斺€虫珤娑撳﹨鍤滈崝銊ョ暔鐟佸懎鎷伴柊宥囩枂閹恒劑鈧浇鍓奸張顑锯偓?

### 韫囶偊鈧喎鐣ㄧ憗鍜冪礄娑撯偓闁款喛鍓奸張顒婄礆

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/娴ｇ姷娈戦悽銊﹀煕閸?wexchatpush/main/install.sh)
```

閹存牔濞囬悽?`wget`閿?
```bash
bash <(wget -qO- https://raw.githubusercontent.com/娴ｇ姷娈戦悽銊﹀煕閸?wexchatpush/main/install.sh)
```

### 鐎瑰顥婃潻鍥┾柤

閼存碍婀版导姘冲殰閸斻劌鐣幋鎰簰娑撳顒炴銈忕窗

1. 閴?**濡偓濞村閮寸紒鐔哄箚婢?*
   - 鐠囧棗鍩嗛幙宥勭稊缁崵绮虹猾璇茬€?
   - 濡偓閺?Python 閻楀牊婀?

2. 閴?**鐎瑰顥婃笟婵婄**
   - 鐎瑰顥?Python 3.8+
   - 鐎瑰顥?pip 閸?Git
   - 鐎瑰顥婃い鍦窗娓氭繆绂嗛崠?

3. 閴?**娑撳娴囨い鍦窗**
   - 娴?GitHub 閸忓娈曟禒鎾崇氨
   - 鏉╂稑鍙嗘い鍦窗閻╊喖缍?

4. 閴?**闁板秶鐤嗗鏇烆嚤**
   - 婵夘偄鍟撻崗顑跨船閸欒渹淇婇幁?
   - 闁板秶鐤?API 鐎靛棝鎸?
   - 鐠佸墽鐤嗘稉顏冩眽娣団剝浼?

5. 閴?**濞村鐦潻鎰攽**
   - 濞村鐦柊宥囩枂閺勵垰鎯佸锝団€?
   - 鐏忔繆鐦崣鎴︹偓浣圭Х閹?

6. 閴?**鐠佸墽鐤嗙€规碍妞傛禒璇插**
   - 闁瀚ㄩ幒銊┾偓浣规闂?
   - 濞ｈ濮?crontab 娴犺濮?

7. 閴?**閸掓稑缂撶粻锛勬倞閸涙垝鎶?*
   - 閻㈢喐鍨?`wechat-push` 缁狅紕鎮婇懘姘拱

### 缁狅紕鎮婇崨鎴掓姢

鐎瑰顥婄€瑰本鍨氶崥搴礉閸欘垯浜掓担璺ㄦ暏娴犮儰绗呴崨鎴掓姢缁狅紕鎮婇敍?

```bash
# 缁斿宓嗛幒銊┾偓浣圭Х閹?
wechat-push start

# 閺屻儳婀呴幒銊┾偓浣规）韫?
wechat-push log

# 缂傛牞绶柊宥囩枂閺傚洣娆?
wechat-push config

# 缂傛牞绶€规碍妞傛禒璇插
wechat-push cron

# 閺囧瓨鏌婃い鍦窗
wechat-push update

# 閺屻儳婀呴悩鑸碘偓?
wechat-push status
```

### 閹靛濮╅柈銊ц

婵″倹鐏夋稉鈧柨顔垮壖閺堫剙銇戠拹銉礉閸欘垯浜掗幍瀣З闁劎璁查敍?

#### 1. 鐎瑰顥婃笟婵婄
```bash
# Debian/Ubuntu
sudo apt update
sudo apt install -y python3 python3-pip git

# CentOS/RHEL
sudo yum install -y python3 python3-pip git

# Arch Linux
sudo pacman -S python python-pip git
```

#### 2. 閸忓娈曟い鍦窗
```bash
git clone https://github.com/娴ｇ姷娈戦悽銊﹀煕閸?wexchatpush.git
cd wexchatpush/WeChatPush-Merged
```

#### 3. 鐎瑰顥?Python 閸?
```bash
pip3 install -r requirements.txt
```

#### 4. 闁板秶鐤嗛弬鍥︽
```bash
cp config.example.txt config.txt
nano config.txt  # 閹存牔濞囬悽?vim 缂傛牞绶?
```

#### 5. 濞村鐦潻鎰攽
```bash
python3 main.py
```

#### 6. 鐠佸墽鐤嗙€规碍妞傛禒璇插
```bash
crontab -e
```

濞ｈ濮炴禒銉ょ瑓閸愬懎顔愰敍鍫熺壌閹诡噣娓剁憰浣界殶閺佸瓨妞傞梻鏉戞嫲鐠侯垰绶為敍澶涚窗
```cron
# 濮ｅ繐銇夐弮鈺€绗?8:00 閹恒劑鈧?
0 8 * * * cd /path/to/WeChatPush-Merged && python3 main.py >> push.log 2>&1

# 濮ｅ繐銇夐弲姘瑐 22:00 閹恒劑鈧?
0 22 * * * cd /path/to/WeChatPush-Merged && python3 main.py >> push.log 2>&1
```

---

## 棣冾樆 GitHub Actions 閼奉亜濮╅幒銊┾偓?

娴ｈ法鏁?GitHub Actions 鐎圭偟骞囨禍鎴狀伂閼奉亜濮╃€规碍妞傞幒銊┾偓渚婄礉閺冪娀娓堕張宥呭閸ｃ劊鈧?

### 濮濄儵顎冩稉鈧敍姘櫙婢跺洭鍘ょ純顔芥瀮娴?

1. 娴ｈ法鏁ら崷銊у殠闁板秶鐤嗗銉ュ徔閻㈢喐鍨?`config.txt`
2. 閹存牗澧滈崝銊ヮ槻閸?`config.example.txt` 楠炴湹鎱ㄩ弨?

### 濮濄儵顎冩禍宀嬬窗娑撳﹣绱堕柊宥囩枂閺傚洣娆?

```bash
# 閸忓娈曟担鐘垫畱娴犳挸绨?
git clone https://github.com/娴ｇ姷娈戦悽銊﹀煕閸?wexchatpush.git
cd wexchatpush/WeChatPush-Merged

# 鐏忓棝鍘ょ純顔芥瀮娴犺埖鏂侀崗銉ф窗瑜?
# 缂傛牞绶幋鏍ь槻閸掓湹缍橀惃?config.txt

# 閹绘劒姘﹂獮鑸靛腹闁?
git add config.txt
git commit -m "Add config file"
git push
```

### 濮濄儵顎冩稉澶涚窗閺屻儳婀呭銉ょ稊濞?

1. 鏉╂稑鍙嗘禒鎾崇氨閻?**Actions** 妞ょ敻娼?
2. 缁涘绶熷銉ょ稊濞翠浇鍤滈崝銊ㄧ箥鐞?
3. 閺屻儳婀呮潻鎰攽閺冦儱绻?

### 姒涙顓婚幒銊┾偓浣规闂?

| 閺冨爼妫块敍鍫濆娴滎剨绱?| UTC 閺冨爼妫?| 閹恒劑鈧礁鍞寸€?|
|-------------|---------|---------|
| 08:00 | 00:00 | 閺冣晛鐣ㄨ箛鍐嚔 + 婢垛晜鐨?|
| 12:00 | 04:00 | 閸嬨儱鎮嶇亸蹇斿絹缁€?|
| 20:30 | 12:30 | 缁楁垼鐦?+ 鐠嬫粏顕?|
| 22:00 | 14:00 | 閺呮艾鐣ㄨ箛鍐嚔 |
| 23:00 | 15:00 | 閺佸懍绨ㄦ径褍鍙?|

### 娣囶喗鏁奸幒銊┾偓浣规闂?

缂傛牞绶?`.github/workflows/push.yml`閿?

```yaml
on:
  schedule:
    # 閸栨ぞ鍚弮鍫曟？ = UTC + 8鐏忓繑妞?
    # 娓氬顩ч敍姘娴滎剚妞傞梻?08:00 = UTC 00:00
    - cron: '0 0 * * *'  # 閺冣晙绗?08:00
    - cron: '0 14 * * *' # 閺呮矮绗?22:00
```

Cron 鐞涖劏鎻蹇旂壐瀵骏绱?
```
閸掑棝鎸?鐏忓繑妞?閺?閺?閺勭喐婀?
0    0   *  *  *     # 濮ｅ繐銇?00:00 UTC
30   12  *  *  *     # 濮ｅ繐銇?12:30 UTC
0    0,12 * *  *     # 濮ｅ繐銇?00:00 閸?12:00 UTC
```

### 閹靛濮╃憴锕€褰傞幒銊┾偓?

1. 鏉╂稑鍙?**Actions** 妞ょ敻娼?
2. 闁瀚ㄩ幒銊┾偓浣镐紣娴ｆ粍绁?
3. 閻愮懓鍤?**Run workflow**
4. 闁瀚ㄩ崚鍡樻暜閿涘瞼鍋ｉ崙鑽よ雹閼瑰弶瀵滈柦?

### 閺屻儳婀呴幒銊┾偓浣规）韫?

1. 鏉╂稑鍙?**Actions** 妞ょ敻娼?
2. 閻愮懓鍤崗铚傜秼閻ㄥ嫬浼愭担婊勭ウ鏉╂劘顢?
3. 閻愮懓鍤?**push** 娴犺濮?
4. 鐏炴洖绱戝銉╊€冮弻銉ф箙鐠囷妇绮忛弮銉ョ箶

---

## 棣冩暋 鐢瓕顫嗛梻顕€顣?

### Q: GitHub Actions 娑撹桨绮堟稊鍫熺梾閺堝鍤滈崝銊ㄧ箥鐞涘矉绱?

**A**: 閸欘垵鍏橀惃鍕斧閸ョ媴绱?
- 娴犳挸绨辨潻?0婢垛晛鍞撮弮鐘虫た閸旑煉绱橤itHub 娴兼碍娈忛崑婊冪暰閺冩湹鎹㈤崝鈽呯礆
- Actions 閺堫亜鎯庨悽顭掔窗Settings 閳?Actions 閳?闁瀚ㄩ崗浣筋啅閹碘偓閺堝鎼锋担?
- 闁板秶鐤嗛弬鍥︽閺堝顕ら敍姘梾閺?`config.txt` 閺嶇厧绱?

**鐟欙絽鍠呴弬瑙勭《**閿?
1. 鐎规碍婀￠幓鎰唉娴狅絿鐖滄穱婵囧瘮濞叉槒绌?
2. 閹靛濮╃憴锕€褰傛稉鈧▎鈥充紣娴ｆ粍绁?
3. 濡偓閺屻儱浼愭担婊勭ウ閺冦儱绻旈幒鎺撶叀闁挎瑨顕?

### Q: 閺堝秴濮熼崳銊ョ暰閺冩湹鎹㈤崝鈥茬瑝閹笛嗩攽閿?

**A**: 濡偓閺屻儲顒炴銈忕窗

1. 閺屻儳婀?crontab 閺勵垰鎯佸锝団€橀敍?
   ```bash
   crontab -l
   ```

2. 濡偓閺屻儲妫╄箛妤佹瀮娴犺绱?
   ```bash
   cat ~/wexchatpush/WeChatPush-Merged/push.log
   ```

3. 閹靛濮╁ù瀣槸閿?
   ```bash
   wechat-push start
   ```

4. 绾喛顓?cron 閺堝秴濮熸潻鎰攽閿?
   ```bash
   sudo systemctl status cron    # Debian/Ubuntu
   sudo systemctl status crond   # CentOS/RHEL
   ```

### Q: 娑撯偓闁款喛鍓奸張顒€鐣ㄧ憗鍛亼鐠愩儻绱?

**A**: 鐢瓕顫嗛崢鐔锋礈閿?
- 缂冩垹绮堕梻顕€顣介敍姘￥濞夋洝顔栭梻?GitHub
- 閺夊啴妾洪梻顕€顣介敍姘厙娴滄稑鎳℃禒銈夋付鐟?sudo
- 缁崵绮烘稉宥嗘暜閹镐緤绱板Λ鈧弻銉︽Ц閸氾缚璐熼崣妤佹暜閹镐胶娈戠化鑽ょ埠

**鐟欙絽鍠呴弬瑙勭《**閿?
1. 濡偓閺屻儳缍夌紒婊嗙箾閹?
2. 娴ｈ法鏁?`sudo` 鏉╂劘顢戦懘姘拱
3. 閹靛濮╃€瑰顥婇敍鍫濆棘閼板啯澧滈崝銊╁劥缂冭尙鐝烽懞鍌︾礆

### Q: 閹恒劑鈧礁銇戠拹銉礉閹绘劗銇?access_token 闁挎瑨顕ら敍?

**A**: 濡偓閺屻儵鍘ょ純顕嗙窗
- `app_id` 閸?`app_secret` 閺勵垰鎯佸锝団€?
- 閺勵垰鎯侀崷銊ヤ簳娣団€冲彆娴兼閽╅崣鐗堢ゴ鐠囨洖褰挎稉顓″箯閸?
- 闁板秶鐤嗛弬鍥︽閺嶇厧绱￠弰顖氭儊濮濓絿鈥橀敍鍫熸暈閹板繐绱╅崣鍑ょ礆

### Q: GitHub Pages 404 闁挎瑨顕ら敍?

**A**: 鐟欙絽鍠呭銉╊€冮敍?
1. 绾喛顓?Actions 瀹稿弶鍨氶崝鐔荤箥鐞?
2. 濡偓閺?Settings 閳?Pages 閺勵垰鎯佸锝団€橀柊宥囩枂
3. 缁涘绶熼崙鐘插瀻闁界噦绱欓柈銊ц闂団偓鐟曚焦妞傞梻杈剧礆
4. 濞撳懘娅庡ù蹇氼潔閸ｃ劎绱︾€?

### Q: 婵″倷缍嶉弴瀛樻煀妞ゅ湱娲伴敍?

**閺堝秴濮熼崳銊︽纯閺?*閿?
```bash
wechat-push update
```

**GitHub 閺囧瓨鏌?*閿?
```bash
cd wexchatpush
git pull
```

---

## 棣冩憮 閼惧嘲褰囩敮顔煎И

婵″倹鐏夐柆鍥у煂闂傤噣顣介敍?

1. 棣冩憠 閺屻儳婀?[README.md](../README.md) 鐎瑰本鏆ｉ弬鍥ㄣ€?
2. 棣冩偘 閹绘劒姘?[Issue](https://github.com/娴ｇ姷娈戦悽銊﹀煕閸?wexchatpush/issues)
3. 棣冩尠 閸?Discussions 娑擃叀顓跨拋?

---

<p align="center">
  <strong>缁佹繀缍橀柈銊ц閹存劕濮涢敍渚岀厔?/strong>
</p>
