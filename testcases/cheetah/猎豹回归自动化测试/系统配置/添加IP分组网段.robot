### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 增加3个IP分组网段

#     Scenario: 添加IP分组网段
#     Given 不存在冲突IP网段交叉
#     When 用户登录猎豹, 导航到`系统配置`->`IP分组管理`菜单
#     Step 1 点击添加图标, 期望添加IP分组表单见(名称 | IP地址)标签项
#     Step 2 用户输入 IP分组名称, e.g IP分组_161网段, 移动焦点, 期望无异常提示
#     Step 3 用户输入 IP范围, e.g 172.17.161.1/24, 移动焦点, 期望无异常提示
#     Step 4 点击`保存`按钮, 期望保存成功, 有提示信息显示并自动消失
#     Step 5 查看左侧IP分组列表, 期望可以搜索到已加入的`IP分组_161网段`
#     Step 6 重复步骤#1-5, 继续加入两组IP分组, e.g 172.17.162.1/24, 172.17.163.1/24, IP分组_VPN网段, e.g 172.16.69.1/24
#     Then 验证 IP分组添加成功

添加IP分组网段
    Given 打开菜单项  sc_icon  ip_icon
	When 添加IP分组名称和IP地址  IP分组_160网段_auto     172.17.160.1
	Then 校验IP分组网段被创建    IP分组_160网段_auto
	When 添加IP分组名称和IP地址  IP分组_162网段_auto       172.17.162.1-172.17.162.24
	Then 校验IP分组网段被创建    IP分组_162网段_auto
	When 添加IP分组名称和IP地址  IP分组_164网段_auto       172.17.164.1/24
	Then 校验IP分组网段被创建    IP分组_164网段_auto
	When 添加IP分组名称和IP地址  IP分组_VPN网段_auto       172.17.69.1/24
	Then 校验IP分组网段被创建    IP分组_VPN网段_auto

查看IP分组网段
    When 点击已存在IP分组  IP分组_160网段_auto
    Then 校验头部基础信息   IP分组_160网段_auto
    When 点击已存在IP分组  IP分组_162网段_auto
    Then 校验头部基础信息   IP分组_162网段_auto
    When 点击已存在IP分组  IP分组_164网段_auto
    Then 校验头部基础信息   IP分组_164网段_auto
    When 点击已存在IP分组  IP分组_VPN网段_auto
    Then 校验头部基础信息   IP分组_VPN网段_auto