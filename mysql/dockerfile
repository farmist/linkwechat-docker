# 基础镜像
FROM mysql:8.4.2
# 执行sql脚本
ADD ./db/*.sql /docker-entrypoint-initdb.d/

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/
