*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P3

# 验证: 人员组织管理

#Scenario: 验证 默认集团部门下新建M个子部门
#    Given 用户有权限配置人员组织
#     When 用户登录猎豹, 导向到 系统配置/人员组织
#     Step 1 用户点击`集团`, 点击 `添加部门`, 期望 右侧基础信息表单可见
#     Step 2 输入部门名称 e.g `RIIL事业部`
#     Step 3 选择上级部门 e.g `集团`
#     Step 4 用户点击`保存`, 期望 部门树中 `RIIL事业部` 存在
#     Step 5 用户点击 `RIIL事业部`, 点击`添加部门`
#     Step 6 重复步骤2-4, 新建子部门 `BMC产品线`, 以此类推 `RELAX产品线`, `猎豹产品线`
#     Step 7 验证部门创建成功

默认集团部门下新建M个子部门
    Given 打开菜单项  sc_icon  organization_icon
    When 列表不存在创建  RIIL事业部
    And 展开列表
    Then 校验事业部是否存在  RIIL事业部
    When 点击已存在部门  RIIL事业部
    And 列表不存在创建子部门  BMC产品线
    And 展开列表
    Then 校验子部门是否存在  BMC产品线
    When 点击已存在部门  RIIL事业部
    Then 校验子部门是否存在  RELAX产品线
    When 点击已存在部门  RIIL事业部
    Then 校验子部门是否存在  猎豹产品线




#    Given 打开菜单项  sc_icon  organization_icon
#    When 部门不存在添加  RIIL事业部
#    Then 校验新建部门成功  RIIL事业部
#    When 点击已存在部门  RIIL事业部
#    And 子部门不存在添加  BMC产品线
#    Then 校验新建部门成功  BMC产品线
#    When 点击已存在部门  RIIL事业部
#    And 不展开列表创建子部门  RELAX产品线
#    Then 校验新建部门成功  RELAX产品线
#    When 点击已存在部门  RIIL事业部
#    And 不展开列表创建子部门  猎豹产品线
#    Then 校验新建部门成功  猎豹产品线