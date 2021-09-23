# OpenWrt shmilee's feeds

* 添加官方源中缺少的包,
  主要针对版本 openwrt 18.06, 架构 ar71xx, 其他未测试
* 修改官方源中的部分包, 删减或增加功能, 具体情况看以下每个软件包的介绍
* 需确保 `SDK/feeds.conf.default` 中包含 `base`, `packages`, `luci`,
  以避免依赖或文件缺失. 比如,
  ```
  src-git base https://git.openwrt.org/openwrt/openwrt.git;v18.06.1
  src-git packages https://github.com/openwrt/packages.git;openwrt-18.06
  src-git luci https://github.com/openwrt/luci.git;openwrt-18.06
  src-git shmilee https://github.com/shmilee/openwrt-shmilee-feeds.git;for-18.06
  ```

# 已包含软件包

1. adbyby/adbyby
    * 来源 https://github.com/coolsnowwolf/lede/tree/master/package/lean/adbyby, 版本 `2.7-20180616`
    * svn 对应 github repo 版本 `584`
    * 删除 files, 修改 Makefile, 用 svn 下载所需 files
      ```
      svn checkout -r 584 repo/trunk/dir
      ./files -> $(PKG_BUILD_DIR)/files
      ```

2. adbyby/luci-app-adbyby-plus
    * 来源 https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-adbyby-plus, 版本 `2.0-29`

3. aria2/luci-app-aria2
    * 来源 github.com/openwrt/luci.git, 版本 `1.0.1-2`
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

4. autossh/luci-app-autossh
    * autossh luci 界面
    * 翻译: en, zh-cn

5. fs/luci-app-nfs
    * 来源 https://github.com/openwrt-1983/2015/trunk/luci-app-nfs, 版本 `1.0`

6. ipv6/radvd
    * 来源 https://github.com/openwrt/packages/pull/1458, 更新到版本 `2.17`
    * rm patches, rm DEPEND kmod-ipv6, add `-std=gnu99`
    * See also: [Setting up an ISATAP router on Linux](http://www.saschahlusiak.de/linux/isatap.htm#router)

6. tunnel/frp
    * frp 主页: https://github.com/fatedier/frp
    * `frpc`, `frps`
    * `make package/frp/check FIXUP=1 V=s`

7. vlmcsd/vlmcsd
    * 来源 https://github.com/mchome/openwrt-vlmcsd, 版本 `svn1111`
    * Network -> vlmcsd

8. vlmcsd/luci-app-vlmcsd
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

9. web/nginx
    * 来源 github.com/openwrt/packages.git, 版本 `1.12.2`
    * 考虑到路由器的性能, nginx 只作前端, 将不同请求反向代理到其他机器.
      因此, 开启 `TLS SNI`, 保留 `proxy` 的同时, 尽量去除其他的 module,
      如 auth, ssi, fastcgi, uwsgi, scgi, memcached, lua, NAXSI 等.
    * 保留 `autoindex`, 用于分享数据.
    * 添加 substitutions && google filter
