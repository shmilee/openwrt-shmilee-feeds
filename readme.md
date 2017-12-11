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

4. aria2/aria2
    * 来源 github.com/openwrt/packages.git, 版本 `1.33.0`

5. aria2/yaaw
    * 来源 github.com/openwrt/packages.git, 版本 `2017-04-11`
    * Makefile 中添加缺少变量
      ```
      PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
      PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
      ```

6. aria2/ariang
    * AriaNg 主页: https://github.com/mayswind/AriaNg, 版本 `0.3.0`
    * 配合 luci-app-aria2 使用

7. aria2/luci-app-aria2
    * 来源 github.com/openwrt/luci.git, 版本 `1.0.1`
    * Makefile 中修复路径 `../../luci.mk` -> `$(TOPDIR)/feeds/luci/luci.mk`
    * 添加 AriaNg 支持
        - `luasrc/controller/aria2.lua`
          ```
  	      local status = {
	  	    running = (sys.call("pidof aria2c > /dev/null") == 0),
	  	    yaaw = ipkg.installed("yaaw"),
	  	    webui = ipkg.installed("webui-aria2"),
            ariang = ipkg.installed("ariang")
	      }
          ```
        - `luasrc/view/aria2/overview_status.htm`
          ```
  				if (data.webui) {
					links += '<input class="cbi-button mar-10" type="button" value="<%:Open WebUI-Aria2%>" onclick="openWebUI(\'webui-aria2\');" />';
				}
				if (data.ariang) {
					links += '<input class="cbi-button mar-10" type="button" value="<%:Open AriaNg%>" onclick="openWebUI(\'ariang\');" />';
				}
          ```
        - `po/lang/aria2.po`, 中文示例
          ```
          msgid "Open AriaNg"
          msgstr "打开 AriaNg"
          ```

8. vlmcsd/vlmcsd
    * 来源 https://github.com/mchome/openwrt-vlmcsd, 版本 `svn1111`
    * Network -> vlmcsd

9. vlmcsd/luci-app-vlmcsd
    * 来源 https://github.com/mchome/luci-app-vlmcsd, 版本 `1.0.1`
    * 去掉依赖 dnsmasq, 防止与 dnsmasq-ful 冲突
      ```
      sed -i 's/ +dnsmasq//' luci-app-vlmcsd/Makefile
      ```
    * 更改分组 network -> services
      ```
      sed -i 's/"network"/"services"/g' \
      luci-app-vlmcsd/files/luci/controller/vlmcsd.lua
      ```

10. tunnel/miredo
    * 来源 https://github.com/christophgysin/openwrt-packages/tree/master/ipv6/miredo, 版本 `1.2.4`
    * 版本更新到 `1.2.6`
    * 修复编译错误
      ```
      del PKG_FIXUP:=libtool
      del CONFIGURE_VARS
      del MAKE_FLAGS
      del DEPENDS: +uclibcxx
      add TARGET_CFLAGS+=-std=gnu99
      ```

11. shadowsocks/libsodium
    * 来源 https://github.com/shadowsocks/openwrt-feeds, 版本 `1.0.12`
    * shadowsocks 的依赖

12. shadowsocks/mbedtls
    * 来源 https://github.com/shadowsocks/openwrt-feeds, 版本 `2.6.0`
    * shadowsocks 的依赖

13. shadowsocks/shadowsocks-libev
    * 来源 https://github.com/shadowsocks/openwrt-shadowsocks, 版本 `3.1.1`
    * Network -> shadowsocks-libev, shadowsocks-libev-server

14. shadowsocks/luci-app-shadowsocks
    * 来源 https://github.com/shadowsocks/luci-app-shadowsocks, 版本 `1.8.2`

15. adbyby/adbyby
    * 来源 https://github.com/coolsnowwolf/lede/tree/master/package/lean/adbyby, 版本 `2.7-20170823`
    * svn 对应 github repo 版本 `240`
    * 删除 files, 修改 Makefile, 用 svn 下载所需 files
      ```
      svn checkout -r 240 repo/trunk/dir
      ./files -> $(PKG_BUILD_DIR)/files
      ```

16. adbyby/luci-app-adbyby-plus
    * 来源 https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-adbyby-plus, 版本 `2.0`

17. goagent/python-dnslib
    * goagent 依赖

18. goagent/python-greenlet
    * goagent 依赖

19. goagent/python-gevent
    * 来源 https://github.com/hackpascal/packages/tree/master/lang/python-gevent, 版本 `1.0.2`
    * fix arguments to setup.py; del filespec, install
    * goagent 依赖

20. goagent/python-pyopenssl
    * 来源 github.com/openwrt/packages.git, 版本 `0.15`
    * 降版本到 `0.13`, 不依赖于 `cryptography`, `six`
    * goagent 依赖

21. goagent/ca-certificates
    * 来源 https://github.com/openwrt/openwrt/tree/chaos_calmer/package/system/ca-certificates, 版本 `20161130+nmu1`
    * goagent 依赖 `ca-bundle`

22. goagent/goagent-client
    * 来源 archlinux, 版本 `3.2.3.20150617`
    * TODO: files/goagent-client.init
