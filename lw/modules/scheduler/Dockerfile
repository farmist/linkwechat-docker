# 基础镜像
FROM  openjdk:11-jre
# author
MAINTAINER lw

# 复制jar文件到路径
COPY ./jar/lw-scheduler.jar lw-scheduler.jar
# 启动文件服务
ENTRYPOINT ["java","-jar","lw-scheduler.jar"]