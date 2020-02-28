*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  准备域管理员加入/移除成员测试环境    ly_auto   集团
Suite Teardown  关闭浏览器

*** Test Cases ***
#Scenario: 验证 集团域管理员加入/移除成员
#Given 用户有权限操作角色管理, 已经存在至少多个域用户成员
# When 用户登录列表, 导向到 系统配置/角色管理
#Step 1 用户搜索默认`集团域管理员` e.g 关键字 `集团`, 期望 `集团域管理员` 过滤到可见
#Step 2 点击`集团域管理员`, 期望 管理员 基本信息 | 成员列表
#Step 3 切换`成员列表`, 期望 显示成员列表
#Step 4 点击`加入成员`, 期望 显示`加入成员`弹出窗口层
#Step 5 选择`全选`复选框, 期望 当前页成员被勾选
#Step 6 点击`加入`, 期望 当前页面所选择的人员被加入到成员列表
#Step 7 勾选若干成员,点击`移除成员`按钮, 期望 弹出提示`确认移除用户?`
#Step 8 点击`确定`, 期望 成员列表中移除被选择的若干成员, e.g `tan/yanf/...`
#Step 9 搜索成员列表, 输入 `tan`, 回车/搜索, 期望 `暂无数据` 即已被移除
# hen 验证集团域下加入/移除成员操作

集团域下加入成员
    Given 打开目录  sc_icon  role_icon
    when 搜索域管理员   集团
    then 校验过滤可见     集团域管理员  集团
    when 点击管理员  集团域管理员
    then 校验某管理员基础信息    集团域管理员
    when 打开成员列表
    then 显示成员列表
    when 加入成员
    then 校验成员被加入    ly_auto

校验员工权限
    when 退出当前管理员账户  系统管理员
    then 校验退出到登录页
    when 员工登录猎豹   ly_auto
    then 校验员工菜单权限
    when 退出当前管理员账户   ly_auto
    then 校验退出到登录页

移除成员
    when 进入集团域管理员成员列表
    and 移除成员    ly_auto
    then 校验成员被删除     ly_auto
    when 搜索成员列表    ly_auto
    then 校验查询结果      ly_auto
    when 退出当前管理员账户  系统管理员
    then 校验退出到登录页
    and 校验员工无菜单权限  ly_auto


