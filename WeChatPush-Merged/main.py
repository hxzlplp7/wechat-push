#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
微信公众号消息推送工具 - 合并版
支持多种内容类型推送：早安心语、晚安心语、故事大全、健康小提示、雷人笑话、
谜语大全、生活小窍门、土味情话等

功能特性：
- 天气信息推送
- 纪念日/生日/倒计时提醒
- 星座运势
- 每日金句
- 多种趣味内容

作者: 合并整理版
版本: 2.0
"""

import random
import time
import json
import argparse
from time import localtime
from requests import get, post
from datetime import datetime, date
from zhdate import ZhDate
import sys
import os


# ============== 内容类型定义 ==============
CONTENT_TYPES = {
    "zaoan": "早安心语",
    "wanan": "晚安心语", 
    "healthtip": "健康小提示",
    "saylove": "土味情话",
    "qiaomen": "生活小窍门",
    "caihongpi": "彩虹屁",
    "dujitang": "毒鸡汤",
    "tiangou": "舔狗日记",
    "mnpara": "小段子",
    "pyqwenan": "朋友圈文案",
    "proverb": "文化谚语",
    "joke": "雷人笑话",
    "riddle": "谜语大全",
    "naowan": "脑筋急转弯",
    "hsjz": "失恋分手句子",
    "cangtoushi": "藏头诗",
    "story": "故事大全"
}


def get_region_data(config_data):
    """获取所有地区天气数据"""
    region_data = {}
    for k, v in config_data.items():
        if k[0:6] == "region":
            region = config_data[k]
            id = k[6:]
            weather, temp, max_temp, min_temp, wind_dir, sunrise, sunset, category, pm2p5, proposal = get_weather(
                region, config_data)
            # 获取疫情数据（已过时，可选）
            yq_data = yq(region, config_data)
            region_data[k] = region
            region_data["weather{}".format(id)] = weather
            region_data["max_temp{}".format(id)] = max_temp
            region_data["min_temp{}".format(id)] = min_temp
            region_data["temp{}".format(id)] = temp
            region_data["wind_dir{}".format(id)] = wind_dir
            region_data["sunrise{}".format(id)] = sunrise
            region_data["sunset{}".format(id)] = sunset
            region_data["category{}".format(id)] = category
            region_data["pm2p5{}".format(id)] = pm2p5
            region_data["proposal{}".format(id)] = proposal
            region_data["yq{}".format(id)] = yq_data
    return region_data


def get_horoscope(config_data):
    """获取所有星座数据"""
    horoscope_data = {}
    for k, v in config_data.items():
        if k[0:9] == "horoscope":
            try:
                key = config_data["tian_api"]
                url = "http://api.tianapi.com/star/index?key={}&astro={}".format(key, v)
                headers = {
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                                  'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
                    'Content-type': 'application/x-www-form-urlencoded'

                }
                response = get(url, headers=headers).json()
                if response["code"] == 200:
                    horoscope = response["newslist"][-1]["content"]
                    horoscope = horoscope.split("。")[0]
                else:
                    horoscope = response["msg"]
            except KeyError:
                horoscope = ""
            horoscope_data[k] = horoscope
    return horoscope_data


def yq(region, config_data):
    """获取疫情数据（已过时，保留兼容性）"""
    try:
        key = config_data["weather_key"]
        url = "https://geoapi.qweather.com/v2/city/lookup?key={}&location={}".format(key, region)
        r = get(url).json()
        if r["code"] == "200":
            city = r["location"][0]["adm2"]
            if region in ["台北", "高雄", "台中", "台湾"]:
                city = "台湾"
        else:
            city = ""
        headers = {
            'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Mobile Safari/537.36',
        }

        response = get('https://covid.myquark.cn/quark/covid/data?city={}'.format(city), headers=headers).json()
        if city in ["北京", "上海", "天津", "重庆", "香港", "澳门", "台湾"]:
            city_data = response["provinceData"]
        else:
            city_data = response["cityData"]
        try:
            sure_new_loc = "昨日新增：{}".format(city_data["sure_new_loc"])
            sure_new_hid = "昨日无症状：{}".format(city_data["sure_new_hid"])
            present = "现有确诊：{}".format(city_data["present"])
            danger = "中/高风险区：{}/{}".format(city_data["danger"]["1"], city_data["danger"]["2"])
            statistics_time = response["time"]
            yq_data = "{}疫情数据\n{}\n{}\n{}\n{}\n{}".format(city, sure_new_loc, sure_new_hid, present, danger,
                                                          statistics_time)
        except TypeError:
            yq_data = ""
        return yq_data
    except:
        return ""


def get_commemoration_day(today, commemoration_day):
    """获取纪念日的日期差"""
    commemoration_year = int(commemoration_day.split("-")[0])
    commemoration_month = int(commemoration_day.split("-")[1])
    commemoration_day = int(commemoration_day.split("-")[2])
    commemoration_date = date(commemoration_year, commemoration_month, commemoration_day)
    commemoration_days = str(today.__sub__(commemoration_date)).split(" ")[0]
    return commemoration_days


def get_commemoration_data(today, config_data):
    """获取所有纪念日数据"""
    commemoration_days = {}
    for k, v in config_data.items():
        if k[0:13] == "commemoration":
            commemoration_days[k] = get_commemoration_day(today, v)
    return commemoration_days


def get_countdown_data(today, config_data):
    """获取所有倒计时数据"""
    countdown_data = {}
    for k, v in config_data.items():
        if k[0:9] == "countdown":
            countdown_year = int(v.split("-")[0])
            countdown_month = int(v.split("-")[1])
            countdown_day = int(v.split("-")[2])
            countdown_date = date(countdown_year, countdown_month, countdown_day)
            if today == countdown_date:
                countdown_data[k] = 0
            else:
                countdown_data[k] = str(countdown_date.__sub__(today)).split(" ")[0]
    return countdown_data


def color(name, config):
    """获取字体颜色，如没设置返回随机颜色"""
    try:
        if config[name] == "":
            return get_color()
        else:
            return config[name]
    except KeyError:
        return get_color()


def get_color():
    """获取随机颜色"""
    get_colors = lambda n: list(map(lambda i: "#" + "%06x" % random.randint(0, 0xFFFFFF), range(n)))
    color_list = get_colors(100)
    return random.choice(color_list)


def get_access_token(config):
    """获取微信公众号 Access Token"""
    app_id = config["app_id"]
    app_secret = config["app_secret"]
    post_url = ("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={}&secret={}"
                .format(app_id, app_secret))
    try:
        access_token = get(post_url).json()['access_token']
    except KeyError:
        print("获取access_token失败，请检查app_id和app_secret是否正确")
        os.system("pause")
        sys.exit(1)
    return access_token


def get_weather(region, config):
    """获取天气信息"""
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
    }
    key = config["weather_key"]
    region_url = "https://geoapi.qweather.com/v2/city/lookup?location={}&key={}".format(region, key)
    response = get(region_url, headers=headers).json()
    if response["code"] == "404":
        data = "地区数据找不到"
        return data, data, data, data, data, data, data, data, data, data
    elif response["code"] == "401":
        data = "未配置和风天气key或key配置错误"
        return data, data, data, data, data, data, data, data, data, data
    else:
        location_id = response["location"][0]["id"]
    
    weather_url = "https://devapi.qweather.com/v7/weather/now?location={}&key={}".format(location_id, key)
    response = get(weather_url, headers=headers).json()
    weather = response["now"]["text"]
    temp = response["now"]["temp"] + u"\N{DEGREE SIGN}" + "C"
    wind_dir = response["now"]["windDir"]
    
    url = "https://devapi.qweather.com/v7/weather/3d?location={}&key={}".format(location_id, key)
    response = get(url, headers=headers).json()
    max_temp = response["daily"][0]["tempMax"] + u"\N{DEGREE SIGN}" + "C"
    min_temp = response["daily"][0]["tempMin"] + u"\N{DEGREE SIGN}" + "C"
    sunrise = response["daily"][0]["sunrise"]
    sunset = response["daily"][0]["sunset"]
    
    url = "https://devapi.qweather.com/v7/air/now?location={}&key={}".format(location_id, key)
    response = get(url, headers=headers).json()
    if response["code"] == "200":
        category = response["now"]["category"]
        pm2p5 = response["now"]["pm2p5"]
    else:
        category = ""
        pm2p5 = ""
    
    id = random.randint(1, 16)
    url = "https://devapi.qweather.com/v7/indices/1d?location={}&key={}&type={}".format(location_id, key, id)
    response = get(url, headers=headers).json()
    proposal = ""
    if response["code"] == "200":
        proposal += response["daily"][0]["text"]
    return weather, temp, max_temp, min_temp, wind_dir, sunrise, sunset, category, pm2p5, proposal


def get_tianhang(config, content_types=None):
    """
    获取天行数据接口内容
    
    参数:
        config: 配置字典
        content_types: 要获取的内容类型列表，默认获取全部
    """
    if content_types is None:
        data = list(CONTENT_TYPES.keys())
    else:
        data = content_types
    
    data_list = {}
    for i in data:
        try:
            key = config["tian_api"]
            url = "http://api.tianapi.com/{}/index?key={}".format(i, key)
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                              'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
                'Content-type': 'application/x-www-form-urlencoded'

            }
            response = get(url, headers=headers).json()
            if response["code"] == 200:
                if i not in ["proverb", "riddle", "naowan", "story"]:
                    content = response["newslist"][0]["content"]
                elif i == "riddle":
                    content = "问题：{},答案：{}".format(response["newslist"][0]["quest"], response["newslist"][0]["answer"])
                elif i == "naowan":
                    content = "问：{},答：{}".format(response["newslist"][0]["quest"], response["newslist"][0]["result"])
                elif i == "story":
                    content = "{},{}".format(response["newslist"][0]["title"], response["newslist"][0]["content"])
                else:
                    content = "{},{}".format(response["newslist"][0]["front"], response["newslist"][0]["behind"])
            else:
                content = response["msg"]
        except KeyError:
            content = ""
        
        # 字段名映射
        key_name = i
        if i == "caihongpi":
            key_name = "chp"
        elif i == "healthtip":
            key_name = "health_tip"
        elif i == "pyqwenan":
            key_name = "wenan"
        elif i == "qiaomen":
            key_name = "xqm"
        data_list[key_name] = content
    return data_list


def get_birthday(birthday, year, today):
    """计算距离生日还有多少天"""
    birthday_year = birthday.split("-")[0]
    if birthday_year[0] == "r":
        # 农历生日
        r_mouth = int(birthday.split("-")[1])
        r_day = int(birthday.split("-")[2])
        try:
            year_date = ZhDate(year, r_mouth, r_day).to_datetime().date()
        except TypeError:
            print("请检查生日的日子是否在今年存在")
            os.system("pause")
            sys.exit(1)
    else:
        # 公历生日
        birthday_month = int(birthday.split("-")[1])
        birthday_day = int(birthday.split("-")[2])
        year_date = date(year, birthday_month, birthday_day)
    
    if today > year_date:
        if birthday_year[0] == "r":
            r_last_birthday = ZhDate((year + 1), r_mouth, r_day).to_datetime().date()
            birth_date = date((year + 1), r_last_birthday.month, r_last_birthday.day)
        else:
            birth_date = date((year + 1), birthday_month, birthday_day)
        birth_day = str(birth_date.__sub__(today)).split(" ")[0]
    elif today == year_date:
        birth_day = 0
    else:
        birth_date = year_date
        birth_day = str(birth_date.__sub__(today)).split(" ")[0]
    return birth_day


def get_ciba():
    """获取金山词霸每日一句"""
    url = "http://open.iciba.com/dsapi/"
    headers = {
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
    }
    r = get(url, headers=headers)
    note_en = r.json()["content"]
    note_ch = r.json()["note"]
    return note_ch, note_en


def send_message(to_user, access_token, note_ch, note_en, config, horoscope_data, region_data, tianhang_data):
    """发送模板消息"""
    url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token={}".format(access_token)
    week_list = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
    os.environ['TZ'] = 'Asia/Shanghai'
    
    year = localtime().tm_year
    month = localtime().tm_mon
    day = localtime().tm_mday
    today = datetime.date(datetime(year=year, month=month, day=day))
    week = week_list[today.isoweekday() % 7]
    
    # 获取各类数据
    commemoration_data = get_commemoration_data(today, config)
    countdown_data = get_countdown_data(today, config)
    
    # 获取生日数据
    birthdays = {}
    for k, v in config.items():
        if k[0:5] == "birth":
            birthdays[k] = v
    
    data = {
        "touser": to_user,
        "template_id": config["template_id"],
        "url": "http://weixin.qq.com/download",
        "topcolor": "#FF0000",
        "data": {
            "date": {
                "value": "{} {}".format(today, week),
                "color": color("color_date", config)
            },
            "note_en": {
                "value": note_en,
                "color": color("color_note_en", config)
            },
            "note_ch": {
                "value": note_ch,
                "color": color("color_note_zh", config)
            },
        }
    }
    
    # 插入各类数据
    for key, value in tianhang_data.items():
        data["data"][key] = {"value": value, "color": color("color_{}".format(key), config)}
    for key, value in region_data.items():
        data["data"][key] = {"value": value, "color": color("color_{}".format(key), config)}
    for key, value in horoscope_data.items():
        data["data"][key] = {"value": value, "color": color("color_{}".format(key), config)}
    for key, value in commemoration_data.items():
        data["data"][key] = {"value": value, "color": color("color_{}".format(key), config)}
    for key, value in countdown_data.items():
        data["data"][key] = {"value": value, "color": color("color_{}".format(key), config)}
    
    # 处理生日数据
    for key, value in birthdays.items():
        birth_day = get_birthday(value["birthday"], year, today)
        if birth_day == 0:
            birthday_data = "今天{}生日哦，祝{}生日快乐！".format(value["name"], value["name"])
        else:
            birthday_data = "距离{}的生日还有{}天".format(value["name"], birth_day)
        data["data"][key] = {"value": birthday_data, "color": color("color_{}".format(key), config)}
    
    headers = {
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
    }
    response = post(url, headers=headers, json=data).json()
    
    # 错误处理
    error_messages = {
        40037: "推送消息失败，请检查模板id是否正确",
        40036: "推送消息失败，请检查模板id是否为空",
        40003: "推送消息失败，请检查微信号是否正确",
        43004: "推送消息失败，用户取消关注公众号"
    }
    
    if response["errcode"] in error_messages:
        print(error_messages[response["errcode"]])
        os.system("pause")
        sys.exit(1)
    elif response["errcode"] == 0:
        print("推送消息成功: {}".format(to_user))
    else:
        print(response)


def load_config(config_file="config.txt"):
    """加载配置文件"""
    try:
        with open(config_file, encoding="utf-8") as f:
            config = eval(f.read())
        return config
    except FileNotFoundError:
        print("推送消息失败，请检查{}文件是否与程序位于同一路径".format(config_file))
        os.system("pause")
        sys.exit(1)
    except SyntaxError:
        print("推送消息失败，请检查配置文件格式是否正确")
        os.system("pause")
        sys.exit(1)


def handler(event="", context="", config_file="config.txt", content_types=None):
    """
    主处理函数
    
    参数:
        event: 事件（云函数用）
        context: 上下文（云函数用）
        config_file: 配置文件路径
        content_types: 要推送的内容类型列表
    """
    config = load_config(config_file)
    
    # 获取accessToken
    accessToken = get_access_token(config)
    users = config["user"]
    
    # 获取各类数据
    region_data = get_region_data(config)
    note_ch = config.get("note_ch", "")
    note_en = config.get("note_en", "")
    
    if note_ch == "" and note_en == "":
        note_ch, note_en = get_ciba()
    
    horoscope_data = get_horoscope(config)
    tianhang_data = get_tianhang(config, content_types)
    
    # 推送消息
    for user in users:
        send_message(user, accessToken, note_ch, note_en, config, horoscope_data, region_data, tianhang_data)
    
    time.sleep(5)


def main():
    """命令行入口"""
    parser = argparse.ArgumentParser(
        description='微信公众号消息推送工具',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  python main.py                          # 使用默认配置推送所有内容
  python main.py -c my_config.txt         # 使用指定配置文件
  python main.py -t zaoan                 # 只推送早安心语
  python main.py -t zaoan wanan           # 推送早安心语和晚安心语
  python main.py --list                   # 列出所有可用内容类型

可用内容类型:
  zaoan      - 早安心语
  wanan      - 晚安心语
  healthtip  - 健康小提示
  saylove    - 土味情话
  qiaomen    - 生活小窍门
  caihongpi  - 彩虹屁
  dujitang   - 毒鸡汤
  tiangou    - 舔狗日记
  mnpara     - 小段子
  pyqwenan   - 朋友圈文案
  proverb    - 文化谚语
  joke       - 雷人笑话
  riddle     - 谜语大全
  naowan     - 脑筋急转弯
  hsjz       - 失恋分手句子
  cangtoushi - 藏头诗
  story      - 故事大全
        """
    )
    
    parser.add_argument('-c', '--config', default='config.txt',
                        help='配置文件路径 (默认: config.txt)')
    parser.add_argument('-t', '--types', nargs='+',
                        help='要推送的内容类型，可指定多个')
    parser.add_argument('--list', action='store_true',
                        help='列出所有可用的内容类型')
    
    args = parser.parse_args()
    
    if args.list:
        print("\n可用的内容类型:")
        print("-" * 30)
        for key, value in CONTENT_TYPES.items():
            print(f"  {key:12} - {value}")
        print()
        return
    
    handler(config_file=args.config, content_types=args.types)


if __name__ == "__main__":
    main()
