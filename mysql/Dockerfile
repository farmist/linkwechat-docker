# 基础镜像
FROM mysql:8.4.2
# 执行sql脚本
# 检查初始化脚本是否存在，不存在的话表示复制资源的步骤未正确执行，请检查
RUN test -f ./db/lw-cloud.sql || { echo " lw-cloud 文件不存在: 请执行copy.sh 或者直接解压lw-cloud.zip"; exit 1; }

ADD ./db/*.sql /docker-entrypoint-initdb.d/

RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/
