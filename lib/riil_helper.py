# coding=utf-8
import configparser
import math
import operator
import os
import time
import platform
import cv2 as cv
import xlrd
import numpy as np
from PIL import Image
from functools import reduce
from requests_toolbelt import MultipartEncoder
import requests
import json
from datetime import datetime
from pymouse import PyMouse
from pykeyboard import PyKeyboard


def get_data_from_excel(url):
    ff = xlrd.open_workbook(u'../../../../data/cheetah_get_element_xpath.xlsx')
    table = ff.sheet_by_index(0)
    xpath = ''
    for i in range(1, table.nrows):
        # print(table.cell(i, 0).value)
        if table.cell(i, 0).value == url:
            xpath = str(table.cell(i, 1).value)
            break
    print(xpath)
    return xpath


def get_xpath(section, name, product):
    cf = configparser.ConfigParser()
    if product == 'cheetah':
        cf.read(u'../../../../data/cheetah_element_xpath.conf', encoding="utf-8-sig")
    elif product == 'relax':
        cf.read(u'../../../../../data/relax_element_xpath.conf', encoding="utf-8-sig")
    else:
        cf.read(get_xpath_conf_path())
        # cf.read(u'../../../data/bmc_element_xpath.conf')
    # print(cf.get(section, name))
    return cf.get(section, name)


def get_format_xpath(section, name, product, *args):
    value = get_xpath(section, name, product)
    return value.format(*args)


def get_xpath_conf_path():
    root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../"))
    return os.path.join(os.path.join(root, 'data'), 'bmc_element_xpath.conf')


def get_common_search(search_type, search_element_name):
    print("//" + search_type + "[contains(text(), '" + search_element_name + "')]")
    return str("//" + search_type + "[contains(text(), '" + search_element_name + "')]")

def get_common_search_popup(search_type, search_element_name, num ):
    print("//" + search_type + "[contains(text(), '" + search_element_name + "')]")
    return str("//body/div["+ num +"]//" + search_type + "[contains(text(), '" + search_element_name + "')]")

def screen_as_element(locator, d, out):
    target = d.find_element_by_xpath(locator)
    time.sleep(2)
    d.execute_script("arguments[0].scrollIntoView();", target)
    time.sleep(2)
    target.screenshot(out)


def screen_as_element_no_wait(locator, d, out):
    target = d.find_element_by_xpath(locator)
    target.screenshot(out)


# 读取图像，解决imread不能读取中文路径的问题
def cv_imread(file_path):
    cv_img = cv.imdecode(np.fromfile(file_path, dtype=np.uint8), -1)
    return cv_img


def find_image_cv(expect_path, actual_path, value):
    source = cv_imread(actual_path)
    template = cv_imread(expect_path)
    result = cv.matchTemplate(source, template, cv.TM_CCOEFF_NORMED)
    pos_start = cv.minMaxLoc(result)[3]
    x = int(pos_start[0]) + int(template.shape[1] / 2)
    y = int(pos_start[1]) + int(template.shape[0] / 2)
    similarity = cv.minMaxLoc(result)[1]
    if similarity < float(value):
        return (-1, -1)
    else:
        return [(x, y), (x, y)]


"""
功能：校验大图是否包含小图
使用说明：
当校验包含时，flag传"exist"，如果是找到目标图片则返回True,否则返回False
当校验不包含时，flag传"noexist",如果未找到目标图片则返回True,否则返回False
"""


def match_img(actual, expect, value, flag):
    p, circle_center_pos = find_image_cv(expect, actual, value)
    if flag == 'exist':
        if circle_center_pos == -1:
            print("未找到")
            return False
        else:
            return True
    else:
        if circle_center_pos == -1:
            return True
        else:
            return False


def image_cmp(act, exp, percent):
    image1 = Image.open(act)
    image2 = Image.open(exp)
    histogram1 = image1.histogram()
    histogram2 = image2.histogram()
    differ = math.sqrt(reduce(operator.add, list(map(lambda a, b: (a - b) ** 2, \
                                                     histogram1, histogram2))) / len(histogram1))
    print(differ)
    print(float(percent))
    if differ <= float(percent):
        return True
    else:
        return False


def image_cut_special(path, out, win, winsize, h, v, size):
    print(os.path.dirname(path))
    img = Image.open(path)  # 打开当前路径图像
    platform = UsePlatform()
    if platform == 0:
        import win32api, win32con
        x = win32api.GetSystemMetrics(win32con.SM_CXSCREEN) * 1
        y = win32api.GetSystemMetrics(win32con.SM_CYSCREEN) * 1
    else:
        x = 1366
        y = 768
    left = h
    if v == 0:
        top = v
    else:
        top = v
    right = left + size[0]
    down = top + size[1]
    box = (left, top, right, down)  # 不选中
    print(left, top, right, down)
    image = img.crop(box)  # 图像裁剪
    image.save(out)  # 存储裁剪得到的图像


def image_cut_special_offset(path, out, win, winsize, h, v, size, left_o, top_o, right_o, down_o):
    print(os.path.dirname(path))
    img = Image.open(path)  # 打开当前路径图像
    if UsePlatform() == 0:
        import win32api, win32con
        x = win32api.GetSystemMetrics(win32con.SM_CXSCREEN) * 1.5
        y = win32api.GetSystemMetrics(win32con.SM_CYSCREEN) * 1.5
    if UsePlatform() == 1 | UsePlatform() == 2:
        x = 1920
        y = 1080

    left = x / winsize[0] * h + x / winsize[0] * abs(win[0]) + int(left_o)
    if v == 0:
        top = v + int(top_o)
    else:
        top = y / winsize[1] * v + y / winsize[1] * win[1] + int(top_o)
    right = left + x / winsize[0] * size[0] + int(right_o)
    down = top + y / winsize[1] * size[1] + int(down_o)
    box = (left, top, right, down)  # 不选中
    image = img.crop(box)  # 图像裁剪
    image.save(out)  # 存储裁剪得到的图像


def image_cut_as_point(path, out, left, top, right, down):
    print(os.path.dirname(path))
    img = Image.open(path)  # 打开当前路径图像
    box = (int(left), int(top), int(right), int(down))  # 不选中
    image = img.crop(box)  # 图像裁剪
    image.save(out)  # 存储裁剪得到的图像


def get_path_image_path(relativePath):
    return os.path.abspath(relativePath)

def string_strim(string,s,e):
    s = int(s)
    e = int(e)
    return string[s:e]

def UsePlatform():
    sysstr = platform.system()
    if (sysstr == "Windows"):
        return 0
    elif (sysstr == "Linux"):
        return 1
    else:
        return 2

def upload_files(path, filename,ip):
    str = ip
    # url = "http://172.17.162.101/cheetah/api/v1/session/login"
    url = "http://" + str + "/cheetah/api/v1/session/login"
    print("url =", url)
    header = {"accept": "application/json", "Accept-Encoding": "gzip, deflate",
              "Accept-Language": "zh-CN,zh;q=0.9,ia;q=0.8,en-US;q=0.7,en;q=0.6", \
              "Connection": "keep-alive", "content-type": "application/json",
              "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.56 Safari/537.36", \
              "Host": str, "Origin": "http://" + str, "Referer": "http://" + str + "/cheetah",
              "Referrer Policy": "no-referrer-when-downgrade", "Content-Length": "43"}
    data = {"username": "admin", "password": "/Gbp+Vuztk8RuRo/8jdQRw=="}
    d = json.dumps(data).encode(encoding='UTF8')
    ROOM_SESSION = requests.Session()
    # 登录
    r = ROOM_SESSION.post(url, data=d, headers=header)
    r.encoding = 'utf-8'
    content = r.text
    print(content)
    url = "http://" + str + "/cheetah/api/base_web_server/v1/ci/upload?citype=Business"
    print("url =", url)
    files = {'uploadFile': (filename, open(path, 'rb'))}
    data = {'fileName': 'uploadFile'}
    reponse = ROOM_SESSION.post(url, data=data, files=files)
    text = reponse.text
    print(text)
    return text

def data_cmp(v1,v2,v):
    v1 = int(v1)
    v2 = int(v2)
    v = int(v)
    if v1+1==v2:
        return True
    else:
        print("未找到")
        return False
def data_sub(v1,v2,time_sub):
    a = v1
    b = v2
    startTime = datetime.strptime(a, "%Y-%m-%d %H:%M")
    endTime = datetime.strptime(b, "%Y-%m-%d %H:%M")
    hours = (endTime - startTime).seconds/3600
    hours = int(hours)
    time_sub = int(time_sub)
    if hours <= time_sub:
        return True
    else:
        print("未找到")
        return False
def get_handle(d):
    window_1 = d.current_window_handle
    return window_1

def switch_special_handle(d,w1):
    windows = d.window_handles
    for w in windows:
        if w1 == w:
            d.switch_to.window(w1)

def input_str_emotion(str):
    m = PyMouse()
    k = PyKeyboard()
    k.tap_key(k.shift_l_key)
    k.type_string(str)
    for i in range(2):
        k.press_key(k.enter_key)
        time.sleep(1)
        k.release_key(k.enter_key)
def data_equal(v1,v2):
    a = v1
    b = v2
    if a==b:
        return True
    else:
        print("未找到")
        return False