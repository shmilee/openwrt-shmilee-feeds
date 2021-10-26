# OpenWrt shmilee's feeds

* 添加官方源中缺少的包,
  主要针对版本 openwrt 19.07, 架构 ar71xx, 其他未测试
* 修改官方源中的部分包, 删减或增加功能, 具体情况看以下每个软件包的介绍
* 需确保 `SDK/feeds.conf.default` 中包含 `base`, `packages`, `luci`,
  以避免依赖或文件缺失. 比如,
  ```
  src-git base https://git.openwrt.org/openwrt/openwrt.git;v19.07.8
  src-git packages https://git.openwrt.org/feed/packages.git^c6ae1c6a0fced32c171e228e3425a9b655585011
  src-git luci https://git.openwrt.org/project/luci.git^7b931da4779c68f5aef5908286c2ae5283d2dece
  src-git shmilee https://github.com/shmilee/openwrt-shmilee-feeds.git;for-19.07
  ```

# 已包含软件包

1. adbyby/adbyby
    * 来源 https://github.com/coolsnowwolf/lede/tree/master/package/lean/adbyby, 版本 `2.7-20200315`
    * svn 对应 github repo 版本 `3000`
    * 删除 files, 修改 Makefile, 用 svn 下载所需 files
      ```
      svn checkout -r 3000 repo/trunk/dir
      ./files -> $(PKG_BUILD_DIR)/files
      ```

2. adbyby/luci-app-adbyby-plus
    * 来源 https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-adbyby-plus, 版本 `2.0-75`

3. autossh/luci-app-autossh
    * autossh luci 界面
    * 翻译: en, zh-cn

4. fs/luci-app-nfs
    * 来源 https://github.com/openwrt-1983/2015/trunk/luci-app-nfs, 版本 `1.0`

5. ipv6/radvd
    * 来源 https://github.com/openwrt/packages/pull/1458, 更新到版本 `2.17`
    * rm patches, rm DEPEND kmod-ipv6, add `-std=gnu99`
    * See also: [Setting up an ISATAP router on Linux](http://www.saschahlusiak.de/linux/isatap.htm#router)

6. tunnel/frp
    * frp 主页: https://github.com/fatedier/frp
    * 来源 https://github.com/openwrt/packages/tree/openwrt-21.02/net/frp
    * `frpc`, `frps`
    * `make package/frp/check FIXUP=1 V=s`

7. vlmcsd/vlmcsd
    * 来源 https://github.com/mchome/openwrt-vlmcsd, 版本 `svn1112`

8. vlmcsd/luci-app-vlmcsd
    * 来源 https://github.com/mchome/luci-app-vlmcsd, 版本 `1.0.1`
    * 更改分组 network -> services
      ```
      sed -i 's/"network"/"services"/g' \
      luci-app-vlmcsd/files/luci/controller/vlmcsd.lua
      ```

9. web/nginx
    * 来源 github.com/openwrt/packages.git, 版本 `1.12.2`
    * 考虑到路由器的性能, nginx 只作前端, 将不同请求反向代理到其他机器.
      因此, 开启 `TLS SNI`, 保留 `proxy` 的同时, 尽量去除其他的 module,
      如 auth, ssi, fastcgi, uwsgi, scgi, memcached, lua, NAXSI 等.
    * 保留 `autoindex`, 用于分享数据.
    * 添加 substitutions && google filter
