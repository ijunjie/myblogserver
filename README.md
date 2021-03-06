## 说明

前后端分离示例项目的后端，使用Spring boot + mybatis.

原项目地址：[https://github.com/lenve/VBlog.git](https://github.com/lenve/VBlog.git)

工程中包含了编译后的前端资源，用于演示。

前端工程在myblogserver-ui项目单独开发。

前后端的开发、编译和部署是彻底分离的。

## 开发测试

1. 准备mysql数据库，可以使用容器启动，如：

```bash
docker run -d -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456 mysql
```
密码设置为`root:123456`.

2. 初始化数据库表

导入`src/main/resources/db/vueblog-init.sql`.

3. 运行

克隆项目到本地：

```bash
git clone https://github.com/ijunjie/myblogserver.git
```

在IDEA中打开项目并运行，也可以使用maven编译运行。

运行时设置环境变量：

- `MYSQL_SERVICE_HOST` 默认为127.0.0.1
- `MYSQL_SERVICE_PORT` 默认为3306
- `MYSQL_SERVICE_USER` 默认为root
- `MYSQL_SERVICE_PASSWORD` 默认为123456


也可以直接修改`application-mysql.properties`


访问`http://localhost:8081/index.html`.


## 问题

目前h2的profile是不可用的。

原计划将mysql初始化脚本改为在h2中可用的脚本，作为测试用profile.
