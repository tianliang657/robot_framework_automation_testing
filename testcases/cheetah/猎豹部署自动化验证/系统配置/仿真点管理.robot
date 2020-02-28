### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化仿真点管理测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
注册仿真点
    Given 打开菜单项  sc_icon  simulation_icon
    When 注册仿真点  Automation testing      171.17.162.1

查看仿真点
    when 点击已存在仿真点
    Then 校验头部基础信息   Automation testing

编辑仿真点
    when 编辑仿真点基本信息

下载仿真点
    when 下载已存在仿真点
    Then 成功下载   下载

删除仿真点
    When 删除已存在仿真点
    Then 验证已经被删除