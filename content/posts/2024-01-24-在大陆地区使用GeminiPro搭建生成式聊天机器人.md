---
title: 在大陆地区使用GeminiPro搭建生成式聊天机器人
description: 3种方案的利弊
date: 2024-01-24T11:34:00.245Z
draft: false
tags:
  - 记录
---

![gemini.jpeg](https://raw.githubusercontent.com/lestat220255/images/main/gemini.jpeg)

> 本文仅作技术方案记录

两周前偶然发现了一个基于GeminiPro接口的[开源项目](https://github.com/babaohuang/GeminiProChat),可以一键搭建聊天机器人,于是准备尝试一下,并顺便找到一种可以直接通过国内网络访问的方式.

### 方案一：使用 Google Gemini API + Gemini Pro Chat + Vercel 部署聊天机器人

优点：
- 部署简单，易于使用。
- Vercel 提供了开箱即用的解决方案，降低了开发难度。

缺点：
- 由于中国大陆的 GFW，无法通过在大陆直连的方式访问聊天机器人。
- Vercel 的服务器位于海外，可能会导致访问速度较慢。

### **方案二：在访问域名前加上 Cloudflare 的 DNS 解析和 CDN 分发**

优点：
- 绕过了 GFW，用户可以访问到部署在 Vercel 的页面。
- Cloudflare 提供了全球化的 CDN 服务，可以提高访问速度。

缺点：
- 由于 Google 本身对于访问来源 IP 的限制，当用户访问 API 的时候，仍然会被 API 检测到来源 IP 是来自大陆，因此，这种方案虽然能让用户访问到部署在 Vercel 的页面，但是仍然无法使用 Gemini API。

### **方案三：将服务部署到个人美国 VPS 上面，再通过 VPS 上面现有的 Caddy 做了反向代理**

优点：

- 隐藏了来源 IP，使 Gemini API 认为用户来自美国，因此实现了在中国大陆正常使用 Gemini API。
- 使用 Caddy 做反向代理，配置简单，易于使用。

缺点：

- 需要有美国 VPS，并且需要有一定的技术基础来配置反向代理。
- VPS 的稳定性和安全性需要自行保障。

### **2. 最终方案中用户访问 GeminiProChat 的流程**

1. 用户通过大陆 IP 直连被 Cloudflare CDN 分发的聊天页面。
2. 在聊天页面上的对话请求被美国 VPS 上的 Caddy 通过反向代理（不手动传递用户真实 IP）的方式隐藏了来源 IP。
3. Gemini API 认为用户来自美国，因此实现了在中国大陆正常使用 Gemini API。

![方案三流程](https://raw.githubusercontent.com/lestat220255/images/main/SolutionUML.png)


### **总结**

以上是**中国大陆使用 Google Gemini API 搭建生成式聊天机器人**的几种技术实现方案的尝试，我最终选择了一种可行的方法。这种方法虽然需要有美国 VPS，并且需要有一定的技术基础来配置反向代理，但它可以实现**在中国大陆正常使用 Gemini API**。

### **细节补充**

- 在方案二中，虽然使用了 Cloudflare 的 DNS 解析和 CDN 分发，但由于 Google 本身对于访问来源 IP 的限制，仍然无法使用 Gemini API。这是因为 Google 会根据用户的 IP 地址来判断其所在的位置，并根据不同地区提供不同的服务。
- 在方案三中，使用 Caddy 做反向代理可以隐藏用户的真实 IP 地址。Caddy 是一个轻量级的 Web 服务器，它可以将用户的请求转发到另一个服务器，同时隐藏用户的真实 IP 地址。
- 在这种方案中，用户访问聊天页面的速度可能会受到 VPS 的影响。如果 VPS 的性能较差，或者网络连接不稳定，可能会导致访问速度较慢。