

1. 安装docker-compose , nodejs16, openjdk11
```shell
#1. set npm registry to ali mirrors(System wide, if you don't have permission, remove the -g opeion below)
npm config -g set registry https://registry.npmmirror.com

```

2. 创建目录并拉取代码

   ```shell
   mkdir link-wechat && cd link-wechat
   git clone https://gitee.com/LinkWeChat/link-wechat
   git clone https://gitee.com/LinkWeChat/link-we-chat-front
   git clone https://gitee.com/LinkWeChat_admin/linkwechat-docker
   
   ```

3. 打包文件

   ```shell
   # 服务端打包
   cd link-wechat

   # checkout the target tag (currently 5.1.3)
   git checkout v5.1.3
   # 重要
   cp ../linkwechat-docker/bootstrap.yml config/run/bootstrap.yml
   # package jar files
   mvn clean package
   # pc前端
   cd link-we-chat-front/vue3-lw-pc
   git checkout v5.25.0
   # copy and modify the config for front project, eg. the BASE_URL and DOMAIN are the two important parameters for run it correctly.
   cp ../linkwechat-docker/pc/env.js
   npm i
   npm run build

   ```

4. 修改配置和sql

   1. sql文件

      没有变动不需要操作,有需要就加到mysql/db文件夹内

   2. 增加nacos配置文件

      默认已添加到 `mysql/db/config.sql`

   3. 增加xxl-job配置文件

      默认已添加

5. 到 compose 目录依次执行

   ```sh
   # 拷贝指定文件到对应目录
   sh copy.sh
   # 启动基础模块
   sh deploy.sh base
   # 启动项目其他模块
   sh deploy.sh modules
   ```

6. 其它
```shell
#只更新前端文件
docker compose down lw-nginx
sh copy_front.sh
docker compose up -d lw-nginx
```







