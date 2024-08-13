/**
 * 环境变量
 * 以下划线 '_' 开头的字段表示只在build命令打包时有效，勿在项目中使用
 */
const envs = {
  production: {
    DOMAIN: 'http://192.168.1.229',
    BASE_URL: './', // 路由基础路径
    BASE_API: 'http://192.168.1.229/api',
    SYSTEM_API: '/api',
    _ISGZIP: true, // 是否开启gzip压缩
    _ISCDN: false, // 是否开启cdn加速
  },
}
let _env = {}
_env = envs['production']
_env.ENV = 'production' // 前端系统环境模式 development，test，production

export const env = _env
