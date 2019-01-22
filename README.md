[![Build Status](https://travis-ci.org/shuzheng/zheng.svg?branch=master)](https://travis-ci.org/shuzheng/zheng)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Aichaellee/springboot/pulls)

[中文文档]() [英文文档]()

## 项目演示
[我的博客](http://www.aichaellee.com)
[在线演示](https://zeus-web.herokuapp.com/index.html)

> 注意：目前项目部署在heroku,因为使用免费dyno，长时间没有http请求服务器会进入到休眠状态，所以第一次访问会有
些许延迟，请耐心等待，另因为目前只是尝试开发的演示版本，和本地环境下的样式或功能尚有些
出入，目前正在快马加鞭地开发与整理，项目开发完成后会和当前版本云泥之别，敬请期待。

## 项目简介
代码拥有丰富的注释和[文档](),（文档尚在完善中，即将开放），基于springboot 2.0.4.RELEASE 开发,后续会有[springCloud版本](),[dubbo版本]()的重构计划,敬请期待

**主要功能如下：**
* rabbitMQ+sendGrid 异步发送邮件,免费用户每月可发送10000条(已下线，后续会重写该部分)
* 支持如微信,QQ,github等第三方登录
* 实现postgres,mysql双数据源,mybatis,springDataJPA双ORM框架的自由切换(已删除，后续会单独设置一个项目)
* Spring Security基于JWT实现SSO单点登录(已更改，取消了JWT方式)
* spring session 集成redis实现分布式session共享
* Actuator可视化数据监控
* Druid连接池监视，监视当期系统数据库连接池和应用状态，全方面多角度地发现系统性能瓶颈。
* 使用swagger生成在线接口文档
* quartz定时任务进行邮件发送或消息通知
* 使用WebSocket进行消息推送
* activiti 工作流（后续会重构为单独模块）
* 前后端分离,前台使用vue+element
* gitlab-ci或jenkins持续集成和自动部署
* 正在开发cli快速搭建脚手架

## 快速部署
为了更方便地部署,我完善了持续集成和快速部署部分,现在支持AWS 或 阿里云 或 本地服务器的快速脚本部署,并且完善了相关的
教程,同时还支持Heroku的一键部署,可以快速地体验,开始吧!
### Heroku
Heroku是一个Paas云服务平台,它支持免费地使用某些资源,但对于我们日常使用测试
 完全没有问题,我们支持一键部署至Heroku,如果你没有Heroku的相关经验,可以点击 [这里](https://aichaellee.github.io/doc/heroku/simIntroduction.html) 查看友好的新手指南,好了,现在开始尝试你的云端之旅吧!<br><br>
[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### AWS
您可以下载AWS 分支,该部分对AWS的环境进行了定制化,并提供了AWS Formation模板,你可以通过
模板快速生成AWS 基础设施,包括EC2,S3,RDS等,当然这些在代码中我都做了适配,你可以很方便地建立起一整套的高性能高可用自动扩展的分布式集群系统,快来体验吧!
如果您没有使用AWS的相关经验,可以查看[这里](https://aichaellee.github.io/doc/heroku/simIntroduction.html)的相关文档

### 本地部署 todo
需要安装mysql,redis....
## 功能特性

功能 | 进度 | 预计时间
----|------|----
自动切换双数据源 | 已完成  | ✔️
heroku一键部署 | 已完成  | ✔️
gitlab-ci持续集成 | 已完成  | ✔️
quartz创建定时任务 | 已完成  | ✔️
Druid可视化监控 | 已完成  | ✔️
redis分布式锁 | 已完成  | ✔️


# TODO
* 函数式接口
* jenkins持续集成
* 分布式锁
* redis限流
* 配置动态数据源
* 代码生成

## 版本日志
zeusSpring v0.1-Beta demo版本
* springboot版本从1.5升级至2.04，移除dubbo，使用spring security实现了前后端分离的权限校验和鉴权，完成了动态授权和角色，权限，菜单的可配置
初步完成了用户管理模块，作为管理员可以动态地添加修改用户信息，禁用，强制下线等基本的操作
* 目前均为demo演示，后续正式版本的changeLog会体现在发行日志中
## 后续计划
* zeusSpring 2019-1计划：完成代码生成模块，完善工作流部分，功能包括但不仅限于我的任务、审批测试、流程管理、模型管理等
* zeusSpring 2019-2计划：完善工作流，实现高度灵活的可配置化表单管理，更好地适配绝大部分的业务场景；重写前台vue样式，提供全新的现代化界面，增加系统的可视化监控，数据分析，图表统计等，宕机邮件通知等小功能
* zeusSpring 2019-3计划：提供更简单易用的接入方式；增加CMS模块，功能包括内容管理、统计分析、栏目设置、自定义首页等
* zeusSpring 2019-4计划：增加多数据源和动态数据源支持，一键切换mysql,postgres,sqlServer等；使用spring security实现单点登录
* zeusSpring 2019-5计划：手机端适配
[点击此处]()查看更详细的发版版本计划
### 技术选型

#### 后端技术:
技术 | 名称 | 官网
----|------|----
Springboot | MVC框架  | [http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc)
spring security | 安全框架  | [https://spring.io/projects/spring-security](https://spring.io/projects/spring-security)
Spring session | 分布式Session管理  | [http://projects.spring.io/spring-session/](http://projects.spring.io/spring-session/)
MyBatis | ORM框架  | [http://www.mybatis.org/mybatis-3/zh/index.html](http://www.mybatis.org/mybatis-3/zh/index.html)
MyBatis Generator | 代码生成  | [http://www.mybatis.org/generator/index.html](http://www.mybatis.org/generator/index.html)
PageHelper | MyBatis物理分页插件  | [http://git.oschina.net/free/Mybatis_PageHelper](http://git.oschina.net/free/Mybatis_PageHelper)
Druid | 数据库连接池  | [https://github.com/alibaba/druid](https://github.com/alibaba/druid)
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
Redisson | 分布式redis工具包  | [https://redisson.org](https://redisson.org)
#### 前端技术:
技术 | 名称 | 官网
----|------|----
Vue | 前端框架  | [https://cn.vuejs.org](https://cn.vuejs.org)
Element | UI库  | [http://element-cn.eleme.io](element-cn.eleme.io/#/zh-CN)


## 许可证

[MIT](LICENSE "MIT")

