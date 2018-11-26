[![Build Status](https://travis-ci.org/shuzheng/zheng.svg?branch=master)](https://travis-ci.org/shuzheng/zheng)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Aichaellee/springboot/pulls)

[中文文档]() [英文文档]()


## 项目简介
* 代码拥有丰富的注释和[文档](),基于springboot 2.0 release开发,目前正在进行[springCloud版本](),[dubbo版本]()的重构,敬请期待
* rabbitMQ+sendGrid 异步发送邮件,免费用户每月可发送10000条
* 支持如微信,QQ,github等第三方登录
* Spring Security基于JWT实现SSO单点登录
* Actuator可视化数据监控
* quartz定时任务进行邮件发送或消息通知
* 使用WebSocket进行消息推送
* 前后端分离,前台使用vue+element
* 正在开发cli快速搭建脚手架

## 快速部署
为了更方便地部署,我完善了持续集成和快速部署部分,现在支持AWS 或 阿里云 或 本地服务器的快速脚本部署,并且完善了相关的
教程,同时还支持Heroku的一键部署,可以让你飞快地体验,是不是已经迫不及待了?那就开始吧!
### Heroku
Heroku是一个Paas云服务平台,它支持免费地使用某些资源,但对于我们日常使用测试
 完全没有问题,我们支持一键部署至Heroku,如果你没有Heroku的相关经验,可以点击 [这里](https://aichaellee.github.io/doc/heroku/simIntroduction.html) 查看友好的新手指南,好了,现在开始尝试你的云端之旅吧!<br><br>
[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### AWS
您可以下载AWS 分支,该部分对AWS的环境进行了定制化,并提供了AWS Formation模板,你可以通过
模板快速生成AWS 基础设施,包括EC2,S3,RDS等,当然这些在代码中我都做了适配,你可以很方便地建立起一整套的高性能高可用自动扩展的分布式集群系统,快来体验吧!
如果您没有使用AWS的相关经验,可以查看[这里](https://aichaellee.github.io/doc/heroku/simIntroduction.html)的相关文档

### 本地部署 todo
需要安装mysql,postgres,activeMQ....
## 功能特性

功能 | 进度 | 预计时间
----|------|----
全局异常处理 | 已完成  | ✔️
整合mybatis,jpa | 已完成  | ✔️
dubbo | 已完成  | ✔️
zookeeper | 已完成  | ✔️
创建定时任务

# TODO
函数式接口
jenkins持续集成
gitlab-ci持续集成
分布式锁
heroku一键部署
redis限流
quartz定时任务

### 技术选型

#### 后端技术:
技术 | 名称 | 官网
----|------|----
Springboot | MVC框架  | [http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc)
Apache security | 安全框架  | [http://shiro.apache.org/](http://shiro.apache.org/)
Spring session | 分布式Session管理  | [http://projects.spring.io/spring-session/](http://projects.spring.io/spring-session/)
MyBatis | ORM框架  | [http://www.mybatis.org/mybatis-3/zh/index.html](http://www.mybatis.org/mybatis-3/zh/index.html)
MyBatis Generator | 代码生成  | [http://www.mybatis.org/generator/index.html](http://www.mybatis.org/generator/index.html)
PageHelper | MyBatis物理分页插件  | [http://git.oschina.net/free/Mybatis_PageHelper](http://git.oschina.net/free/Mybatis_PageHelper)
Druid | 数据库连接池  | [https://github.com/alibaba/druid](https://github.com/alibaba/druid)
Thymeleaf | 模板引擎  | [http://www.thymeleaf.org/](http://www.thymeleaf.org/)
ZooKeeper | 分布式协调服务  | [http://zookeeper.apache.org/](http://zookeeper.apache.org/)
Dubbo | 分布式服务框架  | [http://dubbo.io/](http://dubbo.io/)
elastic-job | 分布式调度框架  | [https://github.com/dangdangdotcom/elastic-job](https://github.com/dangdangdotcom/elastic-job)
Redis | 分布式缓存数据库  | [https://redis.io/](https://redis.io/)
Solr & Elasticsearch | 分布式全文搜索引擎  | [http://lucene.apache.org/solr/](http://lucene.apache.org/solr/) [https://www.elastic.co/](https://www.elastic.co/)
Quartz | 作业调度框架  | [http://www.quartz-scheduler.org/](http://www.quartz-scheduler.org/)
RabbitMQ | 消息队列  | [http://activemq.apache.org/](http://activemq.apache.org/)
FastDFS | 分布式文件系统  | [https://github.com/happyfish100/fastdfs](https://github.com/happyfish100/fastdfs)
Log4J | 日志组件  | [http://logging.apache.org/log4j/1.2/](http://logging.apache.org/log4j/1.2/)
Swagger2 | 接口测试框架  | [http://swagger.io/](http://swagger.io/)
sequence | 分布式高效ID生产  | [http://git.oschina.net/yu120/sequence](http://git.oschina.net/yu120/sequence)
Jenkins | 持续集成工具  | [https://jenkins.io/index.html](https://jenkins.io/index.html)
Maven | 项目构建管理  | [http://maven.apache.org/](http://maven.apache.org/)
Netty-socketio | 实时推送  | [https://github.com/mrniko/netty-socketio](https://github.com/mrniko/netty-socketio)

#### 前端技术:
技术 | 名称 | 官网
----|------|----
Vue | 前端框架  | [http://jquery.com/](http://jquery.com/)
Element | UI库  | [http://getbootstrap.com/](http://getbootstrap.com/)


## 许可证

[MIT](LICENSE "MIT")

