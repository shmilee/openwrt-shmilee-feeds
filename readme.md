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

