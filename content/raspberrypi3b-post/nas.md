---
title: NAS
description: 树莓派3B的NAS搭建工具介绍
draft: false
ShowReadingTime: false
ShowBreadCrumbs: false
---

**这个NAS基于RaspbianOS**

# 资源下载

| 需求 | 工具 | 项目地址 |
|---|---|---|
| 视频资源下载 | yt-dlp | [https://github.com/yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp) |
| 音乐下载 | spotDL | [https://github.com/spotDL/spotify-downloader](https://github.com/spotDL/spotify-downloader) |
| PT站下载做种 | Transmission | [https://github.com/transmission/transmission](https://github.com/transmission/transmission) |

yt-dlp: 几乎可以下载全网所有主流视频播放平台的视频。  
spotDL: 下载Spotify的音乐资源（通过Youtube Music）。  
Transmission，通过其web gui界面配合Tailscale的虚拟局域网可以非常方便的进行远程管理。

# 资源管理
将下载好的资源移动到本地磁盘或上传到网盘  

| 需求 | 工具 | 项目地址 |
|---|---|---|
| 资源上传 | rclone | [https://github.com/rclone/rclone](https://github.com/rclone/rclone) |

rclone同时支持远程资源上传和本地拷贝，在本场景下完美替代rsync。

# 脚本
需要通过脚本来自定义下载资源和上传对象，配合yt-dlp,spotDL,rclone实现线上资源的下载，整合。
通过shell脚本来进行管理

# 进程管理
上述shell脚本需要通过工具来进行监控和管理

| 需求 | 工具 | 项目地址 |
|---|---|---|
| 进程管理 | pm2 | [https://github.com/Unitech/pm2](https://github.com/Unitech/pm2) |

# 资源本地分享
通过Samba,WebDAV协议分享资源

| 需求 | 工具 | 项目地址 |
|---|---|---|
| 阿里云资源本地挂载 | aliyundrive-webdav | [https://github.com/messense/aliyundrive-webdav](https://github.com/messense/aliyundrive-webdav) |
| 内网共享本地目录 | samba | [https://ubuntu.com/tutorials/install-and-configure-samba#1-overview](https://ubuntu.com/tutorials/install-and-configure-samba#1-overview) |

# 虚拟内网
类似frp等内网穿透工具的效果，但使用方式有所差异。  

| 需求 | 工具 | 项目地址 |
|---|---|---|
| 实现远程访问 | Tailscale | [https://tailscale.com/](https://tailscale.com/) |

此外，还需要挂载一个大容量硬盘用于资源存储，但由于我的预算有限（总预算在¥300以内）之前18年200多买到的树莓派3B正好用上，因此不考虑硬件升级，延用树莓派3B和一个几年前的老机械硬盘，也没有做RAID的考虑和读写速度的要求，仅做技术上的功能实现。  
在完成上述搭建之后，可以购买Infuse Pro/Plex之类的应用，就能方便的观看本地资源了。