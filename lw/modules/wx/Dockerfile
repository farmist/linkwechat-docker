# 基础镜像
FROM  openjdk:11-jre
# author
MAINTAINER lw

# 复制jar文件到路径
COPY ./jar/lw-wx.jar lw-wx.jar
# 启动文件服务
ENTRYPOINT ["java","-jar","lw-wx.jar"]