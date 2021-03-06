*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***


#Scenario: 验证数据过滤规则的设置
#    Given 已对接NPV数据
#    When 用户登录系统，导航至"流量分析中心/流量透视"
#     Step 1 查看默认过滤规则，期望 展示"数据过滤规则：只展示总流量>=1Mb的数据"
#     Step 2 点击规则设置按钮，期望 打开规则设置页面
#     Step 3 查看规则设置页面标题和说明，期望 标题"规则设置"，说明信息"系统根据规则过滤数据进行展示"
#     Step 4 查看过滤规则，期望 过滤规则默认展示为"总流量>=1Mb 恢复默认按钮"
#     Step 5 清空总流量数值鼠标焦点离开或点击确定按钮，期望 输入框飘红有提示信息"请输入过滤数值"
#     Step 6 总流量数值输入小于0的整数eg:-1，鼠标焦点， 期望 数值自动填充为0
#     Step 7 总流量数值输入大于1024的整数eg:1025，鼠标焦点离开，期望 数值自动填充为1024
#     Step 8 总流量数值输入小数eg:1.1,鼠标焦点离开， 期望 输入框飘红，有提示信息"请输入整数"
#     Step 9 总流量数值输入整数eg:0，点击减小箭头， 期望 数值仍旧展示为0
#     Step 10 总流量数值输入整数eg:1024,点击增大箭头，期望 数值仍旧展示为1024
#     Step 11 查看单位下拉框下拉选项，期望 Gb,Mb,Kb,b
#     Step 12 总流速输入框输入1024,单位选中Mb,点击取消， 期望 设置页面关闭，其他同Step 1的期望
#     Step 13 总流速输入1024，单位选中Mb,点击确定，期望 设置页面关闭，过滤规则展示为"数据过滤规则：只展示总流量>=1024Mb的数据"
#     ///Step 14 查看流量构成分析列表，期望 列表数据按照>=1024Mb请求数据（无数据的情况下不能校验）
#    Then 过滤规则验证通过

数据过滤规则的设置
    When 用户登录猎豹, 导向到流量分析中心/流量透视
    Then 校验默认过滤规则
    When 点击规则设置    规则设置
    Then 校验规则设置页面打开     系统根据规则过滤数据进行展示
    And 校验过滤规则
    When 清空总流量数值
    Then 校验出现的错误提示     请输入过滤数值
    When 输入小于0的整数   -1
    Then 校验数值自动填充为0
    When 输入数值   1025
    Then 校验数值自动填充为1024
    When 点击复位键
    And 输入数值   1.1
    Then 校验出现的错误提示     请输入整数
    When 点击复位键
    And 输入数值   0
    And 点击减小箭头
    Then 校验数值自动填充为0
    When 输入数值   1024
    And 点击增大箭头
    Then 校验数值自动填充为1024
    When 查看单位下拉框下拉选项
    Then 校验单位   Gb  Mb  Kb  b
    When 点击复位键
    And 重设过滤规则  1024    Mb
    And 点击取消
    Then 校验默认过滤规则
    When 点击规则设置    规则设置
    Then 校验规则设置页面打开     系统根据规则过滤数据进行展示
    When 重设过滤规则  1024    Mb
    And 点击确认
    Then 校验总流量修改的过滤规则
