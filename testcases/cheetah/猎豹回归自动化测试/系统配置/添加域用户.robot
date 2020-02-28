*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  登录猎豹
Suite Setup  初始化添加域用户测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P3
#Scenario: 验证 添加域用户

   #     Given 用户有权限配置域管理, 已经有可用域 e.g BMC域, Cheetah域, Relax域
   #     When 用户登录猎豹, 导向到 系统配置/域管理
   #     Step 1 选择`BMC域`, 点击`域用户列表` tab标签页, 期望 可见当前域下的用户展示
   #     Step 2 点击`加入域用户`, 期望 弹出`添加域用户`窗口层
   #     Step 3 用户勾选全部`BMC域`部门用户, 点击`加入`, 期望 提示`添加成功`
   #     Step 4 查看`域用户列表`, 期望 加入的`BMC域`新用户在列表中
   #     Step 5 搜索域用户列表, 输入 e.g hepeng, 回车/搜索, 期望 过滤到匹配域用户
   #     Step 6 重复步骤 1-4, 其他域用户添加到域中
   #     Then 验证域用户添加成功

添加域用户
    Given 打开菜单项  sc_icon  domain_icon
    when 打开域列表
    Then 校验域是否存在    Cheet_auto
    when 点击已存在域    Cheet_auto
    and 打开域用户列表
    then 校验当前域下用户是否包含用户   Qingbo_auto   Cheet_auto
    when 搜索用户    Qingbo_auto
    then 校验查询结果     Qingbo_auto
    When 添加域用户角色信息      Cheet_auto域管理员      Qingbo_auto
    Then 校验成员被加入    Qingbo_auto
   #     写这条case注意修改用户名，Qingbo_auto在别的case中已经应用
校验域用户权限
    When 退出当前管理员账户  系统管理员
    Then 校验退出到登录页
    When 员工登录猎豹   Qingbo_auto
    Then 校验域用户管理员菜单权限     人员    角色    通知
    When 返回到列表视图    Qingbo_auto
    Then 查看业务和添加业务权限     基本信息    BigData_App_auto     您没有该资源的访问权限，请联系管理员！
