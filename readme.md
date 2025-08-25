# OpenWrt shmilee's feeds

* 添加官方源中缺少的包,
  主要针对版本 openwrt 24.10, 架构 ath79, 其他未测试
* ~~修改官方源中的部分包, 删减或增加功能, 具体情况看以下每个软件包的介绍~~
* 需确保 `SDK/feeds.conf.default` 中包含 `base`, `packages`, `luci`,
  以避免依赖或文件缺失. 比如,
  ```
  src-git base https://git.openwrt.org/openwrt/openwrt.git;openwrt-24.10
  src-git packages https://git.openwrt.org/feed/packages.git^c7d1a8c1ae976bd0ad94a351d82ee8fbf16a81f0
  src-git luci https://git.openwrt.org/project/luci.git^d6b13f648339273facc07b173546ace459c1cabe
  src-git shmilee https://github.com/shmilee/openwrt-shmilee-feeds.git
  ```

# 已包含软件包

1. luci-app-autossh
    * autossh luci 界面
    * 翻译: en, zh-cn

2. luci-app-nfs
    * 来源 https://github.com/openwrt-1983/2015/trunk/luci-app-nfs, 版本 `1.0`

3. luci-app-vlmcsd
    * 来源 https://github.com/mchome/luci-app-vlmcsd, 版本 `1.0.1`
    * 更改分组 network -> services
      ```
      sed -i 's/"network"/"services"/g' \
      luci-app-vlmcsd/files/luci/controller/vlmcsd.lua
      ```
    * repackage: by luci template

4. vlmcsd
    * 来源 https://github.com/mchome/openwrt-vlmcsd, 版本 `svn1112`
    * version: update git format

