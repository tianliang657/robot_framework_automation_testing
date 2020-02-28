### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录资源仓库
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 基于模型创建资源

#     Scenario: 验证 通过选定的模型创建资源
#     Given 用户有权限操作资源仓库
#     When 用户登录猎豹, 导向到 资源中心/资源仓库
#     Step 1 用户选择某一个模型 e.g `集群 / 数据库集群`
#     Step 2 点击 `数据库集群`, 点击 `添加资源` 按钮, 期望 选择资源类型为 `数据库集群`
#     Step 3 输入资源信息, 名称 e.g ClickHouse数据库_1
#     Step 4 输入IP地址 e.g 172.17.162.173
#     Step 5 输入端口 e.g 8123
#     Step 6 输入描述 e.g `ClickHouse数据库用于猎豹流水数据存储`
#     Step 7 所属域默认 `集团域`, 期望 所属于默认不可修改选择
#     Step 8 用户 点击`保存`, 期望 提示`保存成功` 页面跳转 `数据库集群` 资源列表并默认选中该资源, 右侧显示当前新增加资源的资源详情
#     Then 验证 新增资源成功

基于数据库集群模型创建资源
    When 打开数据库集群    数据库集群
    and 数据库集群中添加资源  ClickHouse数据库_auto  172.17.162.173  8123    ClickHouse数据库用于猎豹流水数据存储
    Then 校验新增资源成功

基于容器模型创建资源
    When 打开容器
    and 容器中添加资源  ClickHouse容器_auto  007  Kubernets    ISO   8082    $cancel     100
    Then 校验容器资源添加成功

编辑容器资源
    When 进入容器资源     ClickHouse容器_auto
    And 编辑容器基本信息   178     8081    保存
    Then 校验ID保存成功

删除容器资源
    When 删除新建容器资源
    Then 容器资源已经被删除