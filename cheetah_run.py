#!/usr/bin/env python
# coding:utf8

import configparser
import os
import subprocess
import sys

list_run = []
list_testcase = []
list_output = []


class GetTestCase(object):
    def __init__(self, *args, **kwargs):
        self.root = os.getcwd()
        self.first = sys.argv[0]
        self.second = sys.argv[1]
        self.third = sys.argv[2]
        self.forth = sys.argv[3]
        self.fifth = sys.argv[4]

    def parse_conf(self, section1, section2, section3):
        if not (os.path.exists(self.root + '/Jenkins/cheetah/config.conf')):
            print("用例配置文件不存在，请确认后再试！")
            return
        else:
            self.cf = configparser.ConfigParser()
            self.cf.read(self.root + '/Jenkins/cheetah/config.conf', encoding="utf-8-sig")
            list_run.append(self.cf.items(section1))
            list_testcase.append(self.cf.items(section2))
            list_output.append(self.cf.items(section3))

    def run_case(self, run, input, output,path):
        if not (os.path.exists(path+'/allure-results')):
            os.mkdir(path+'/allure-results')
        for i in range(len(list_run[0])):
            if list_run[0][i][0] == run:
                run = list_run[0][i][1]
        for i in range(len(list_testcase[0])):
            if list_testcase[0][i][0] == input:
                case = list_testcase[0][i][1]
        for i in range(len(list_output[0])):
            if list_output[0][i][0] == output:
                outfile = list_output[0][i][1]
        cmd = 'cd  ' + run + ' &pybot.bat' + ' -d ' + os.getcwd() + outfile + ' ' + os.getcwd() + case
        # cmd = 'cd  ' + run + ' &pybot.bat' + ' -d ' + os.getcwd() + outfile + ' ' + '--listener allure_robotframework;'+path+'/allure-results' + ' ' + os.getcwd() + case
        sub = subprocess.Popen(cmd, shell=True)
        sub.wait()


if __name__ == '__main__':
    gt = GetTestCase()
    gt.parse_conf('run_station', 'testcase', 'output')
    gt.run_case(gt.second, gt.third, gt.forth,gt.fifth)
