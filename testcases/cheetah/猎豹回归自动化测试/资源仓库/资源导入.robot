*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 资源导入

#     Scenario: 验证 资源导入
#     Given 用户有权限操作资源仓库, 导入模板已准备
#     When 用户登录猎豹, 导向到 资源中心/资源仓库
#     Step 1 用户点击 `业务` -> `业务应用`, 期望 业务应用资源列表可见
#     Step 2 点击 `添加资源` 图标, 期望 `批量导入` 可见
#     Step 3 用户点击 `批量导入`, 期望 弹出 `批量导入` 窗口层
#     Step 4 用户点击 `点击下载` 导入模板, 期望 无异常报错提示
#     Step 5 点击 `上传文件` 按钮, 期望 用户可选择模板文件上传
#     Step 6 查看模板导入结果, 期望 导入完成, 导入成功和导入失败统计数
#     Step 7 关闭弹出窗口层, 期望 资源列表新导入业务可见
#     Then 验证 资源导入成功

资源导入
    Given 用户有权限操作资源仓库, 导入模板已准备
    when 用户登录猎豹, 导向到 资源中心/资源仓库
    and 用户点击 `业务` -> `业务系统`
    then 校验业务系统资源列表可见   业务系统_auto
    when 导入资源   模板_auto      ../../../../upload_file/Business_template.xlsx     Business_template.xlsx
    then 校验资源导入成功   模板_auto     业务系统型资源



