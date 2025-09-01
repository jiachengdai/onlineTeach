# 🎓 OnlineTeach - 现代化在线教学平台后端

![Java](https://img.shields.io/badge/Java-17-blue)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.1-green)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)
![Redis](https://img.shields.io/badge/Redis-3.2-red)
![Docker](https://img.shields.io/badge/Docker-✓-blue)

一个基于 Spring Boot 的现代化在线教学平台后端，支持课程管理、章节学习、在线测试等功能。

## ✨ 功能特性

- 📚 课程管理（创建/编辑/删除课程）
- 📝 章节内容管理
- 🧑‍🏫 教师管理
- 🧑‍🎓 学生管理
- 📊 学习进度跟踪
- 🧪 在线测试与考试
- 💬 课程讨论区

## 🏗 项目结构

```bash
onlineTeach/
├── src/
│   ├── main/
│   │   ├── java/             # 核心Java代码
│   │   └── resources/        # 配置文件
│   │       ├── application.yml
│   │       └── ...
├── docs/                     # 文档与数据库脚本
│   ├── postgresql_init.sql    # PostgreSQL初始化脚本
│   └── ...
├── Dockerfile                # Docker构建文件
├── docker-compose.yml        # Docker编排文件
├── pom.xml                   # Maven配置
└── README.md                 # 项目文档
```

## 🚀 快速开始

### 先决条件

- JDK 17+
- Maven 3.8+
- Docker 20.10+
- PostgreSQL 15
- Redis 3.2

### 1. 克隆仓库

```bash
git clone https://github.com/your-repo/onlineTeach.git
cd onlineTeach
```

### 2. 配置环境

#### 数据库配置

1. 创建PostgreSQL数据库：

```sql
CREATE DATABASE online_teach;
```

2. 修改 `src/main/resources/application.yml`：

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/online_teach
    username: your_db_user
    password: your_db_password
    driver-class-name: org.postgresql.Driver
```

3. 初始化数据库：

```bash
psql -U your_db_user -d online_teach -f docs/postgresql_init.sql
```

#### Redis配置

```bash
docker run -d --name online_teach_redis -p 6379:6379 redis:3.2
```

### 3. 构建与运行

#### 本地开发

```bash
mvn clean install
mvn spring-boot:run
```

#### Docker部署

```bash
docker-compose up -d --build
```

## 🌐 API文档

访问 [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html) 查看API文档

## 🛠 开发指南

### 构建

```bash
mvn clean package
```

### 测试

```bash
mvn test
```

## 🤝 贡献

欢迎提交Pull Request或Issue！

## 📜 许可证

MIT License

Copyright (c) 2024 Your Name
