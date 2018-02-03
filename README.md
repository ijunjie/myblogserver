## 说明

前后端分离示例项目的后端，使用Spring boot + mybatis.

工程中包含了编译后的前端资源，用于演示。

前端工程在myblogserver-ui项目单独开发。

前后端的开发、编译和部署是彻底分离的。

## 开发调试

1. 准备mysql数据库，可以使用容器启动，如：

```bash
docker run -d -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456 mysql
```
密码设置为`root:123456`.

2. 初始化数据库表

导入`src/main/resources/db/vueblog-init.sql`.

3. 在IDEA中运行

在IDEA中打开项目并运行，访问`http://localhost:8081/index.html`.

## 问题

目前h2的profile是不可用的。

原计划将mysql初始化脚本改为在h2中可用的脚本，作为测试用profile.
