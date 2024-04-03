/**
 * 环境变量
 * 以下划线 '_' 开头的字段表示只在build命令打包时有效，勿在项目中使用
 */
const envs = {
  production: {
    DOMAIN: 'http://127.0.0.1',
    BASE_URL: './', // 路由基础路径
    BASE_API: 'http://127.0.0.1/api',
    SYSTEM_API: '/api',
    _ISGZIP: true, // 是否开启gzip压缩
    _ISCDN: true, // 是否开启cdn加速
  },
}
const env = Object.assign(
  { SYSTEM_NAME_ALL: 'LinkWeChat -- 全链路私域数字化营销增长解决方案' },
  envs[process.env.VUE_APP_ENV || process.env.NODE_ENV],
)

module.exports = env
