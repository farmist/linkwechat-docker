# 基础镜像
FROM  openjdk:11-jre
# author
MAINTAINER lw

COPY ./jar/lw-auth.jar lw-auth.jar
# 启动认证服务
ENTRYPOINT ["java","-jar","lw-auth.jar"]