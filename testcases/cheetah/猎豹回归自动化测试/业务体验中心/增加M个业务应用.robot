### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 增加M个业务应用

#Scenario: 添加业务(包括IP/域名 | 带路径地址等)
#    Given 所加入业务尽量都是真实有效业务
#     When 用户登录猎豹, 导航到`业务体验中心`->`业务总览`菜单
#     Step 1 点击右侧banner选项`列表视图`, 期望 页面切换到业务列表模式, `卡片视图` | `添加`按钮可见
#     Step 2 用户点击`添加`, 期望 页面切换到`添加业务`表单视图页面, 用户可填写业务基础信息
#     Step 3 输入业务名称 e.g `OA信息门户`, 输入焦点切换, 期望 进入下一个输入信息
#     Step 4 输入访问方式 e.g 域名, 期望 域名被填充
#     Step 5 输入域名/IP e.g `oa.ruijie.com.cn`, 输入焦点切换, 期望 进入下一个输入信息
#     Step 6 输入端口 e.g `65540`, 输入焦点切换, 期望 提示`输入0~65535的整数`
#     Step 7 重新输入端口 e.g `80`, 输入焦点切换, 期望 提示消失
#     Step 8 输入路径 e.g `/`, 输入焦点切换
#     Step 9 选择业务重要度 e.g `核心`, 焦点切换, 期望 核心被填充
#     Step 10 选择业务使用频度 e.g `高频`, 焦点切换, 期望 高频被填充
#     Step 11 选择所属域 e.g `集团`, 焦点切换, 期望 集团被填充
#     Step 12 选择业务卡慢告警策略 e.g `默认策略`, 期望 默认策略被填充
#     Step 13 用户点击保存, 期望 提示 业务添加成功
#     Step 14 查看业务卡片, 期望 `OA信息门户`可见
#     Step 15 重复步骤1-14, 继续添加其他业务
#     Then 验证 业务添加成功

增加M个业务应用
    等待 2s
#    Given 菜单项  business_icon
#    And 切换业务总览到列表视图
#    When 创建业务   OA信息门户_auto_01   核心      高频     http://oa.ruijie.com.cn     OA信息门户_auto_01
#    Then 校验新创建业务列表可见     OA信息门户_auto_01
#    When 创建业务   OA信息门户_auto_02   核心      高频     http://172.17.169.2     OA信息门户_auto_02
#    Then 校验新创建业务列表可见     OA信息门户_auto_02
#    When 创建业务   OA信息门户_auto_03   一般      低频     http://172.17.169.2     OA信息门户_auto_02
#    Then 校验新创建业务列表可见     OA信息门户_auto_03
#    When 创建多url业务     basic_auto    核心      高频     http://www.baidu.com    百度   http://www.sohu.com     搜狐
#    Then 校验新创建业务列表可见      basic_auto

