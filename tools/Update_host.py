# coding=utf-8
import re, os, sys


def alter(file, old_str, new_str):
    with open(file, "r", encoding="utf-8") as f1, open("%s.bak" % file, "w", encoding="utf-8") as f2:
        for line in f1:
            f2.write(re.sub(old_str, new_str, line))
    os.remove(file)
    os.rename("%s.bak" % file, file)


def traverse(f):
    fs = os.listdir(f)
    for f1 in fs:
        tmp_path = os.path.join(f, f1)
        if not os.path.isdir(tmp_path):
            # print('文件: %s' % tmp_path)
            if (tmp_path[-26:]) == 'cheetah_element_xpath.conf':
                alter(tmp_path, 'http://172.17.162.122/cheetah/', sys.argv[1])
        else:
            print('文件夹：%s' % tmp_path)
            traverse(tmp_path)


if __name__ == "__main__":
    # path = 'C:\Jenkins\workspace\Win10_robot\data'
    path = sys.argv[2]
    traverse(path)
