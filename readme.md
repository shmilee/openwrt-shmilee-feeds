# OpenWrt shmilee's feeds

* 添加官方源中缺少的包,
  主要针对版本 Chaos Calmer 15.05.1, 架构 ar71xx, 其他未测试
* 修改官方源中的部分包, 删减或增加功能, 具体情况看以下每个软件包的介绍
* 需确保 `SDK/feeds.conf.default` 中包含 `base`, `packages`, `luci`,
  以避免依赖或文件缺失. 比如,
  ```
  src-git base https://git.openwrt.org/15.05/openwrt.git
  src-git packages https://github.com/openwrt/packages.git;for-15.05
  src-git luci https://github.com/openwrt/luci.git;for-15.05
  src-git shmilee https://github.com/shmilee/openwrt-shmilee-feeds.git
  ```

# 已包含软件包

1. autossh/autossh
    * 来源 github.com/openwrt/packages.git, 版本 `1.4e-1`
    * 可灵活的使用 ssh 的端口转发(-L, -R, -D)
    * Network -> SSH -> autossh

2. autossh/luci-app-autossh
    * autossh luci 界面
    * 翻译: en, zh-cn

3. web/nginx
    * 来源 github.com/openwrt/packages.git;for-15.05, 版本 `1.12.1`
    * 更新到 [nginx](http://nginx.org/en/download.html) `1.12.2`
    * 考虑到路由器的性能, nginx 只作前端, 将不同请求反向代理到其他机器.
      因此, 开启 `TLS SNI`, 保留 `proxy` 的同时, 尽量去除其他的 module,
      如 autoindex, auth, ssi, fastcgi, uwsgi, scgi, memcached, lua, NAXSI 等.
