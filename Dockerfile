# 第一阶段：构建 jar
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# 复制 pom.xml 并提前下载依赖（利用缓存，加快构建速度）
COPY pom.xml .
RUN mvn dependency:go-offline

# 复制源码并打包
COPY src ./src
RUN mvn clean package -DskipTests

# 第二阶段：运行 jar
FROM openjdk:17-jdk-slim
WORKDIR /app

# 复制编译好的 jar 文件到运行容器
COPY --from=build /app/target/onlineTeach-1-0.0.1-SNAPSHOT.jar app.jar

# 暴露端口
EXPOSE 8080

# 启动 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
