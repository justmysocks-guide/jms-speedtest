<p align="center">
  <img src="https://raw.githubusercontent.com/justmysocks-guide/.github/main/assets/logo.png" width="120" height="120" alt="Just My Socks Guide Logo" />
</p>

# Just My Socks 全球节点测速与 AI / 流媒体解锁一键检测脚本 (2026)

**中文说明** | 🌐 [English Version](./README_EN.md)

[![GitHub Stars](https://img.shields.io/github/stars/justmysocks-guide/jms-speedtest?style=flat-square)](https://github.com/justmysocks-guide/jms-speedtest/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](./LICENSE)
[![Organization](https://img.shields.io/badge/Organization-justmysocks--guide-cyan.svg?style=flat-square)](https://github.com/justmysocks-guide)

> 🚀 **项目简介**：专为 **Just My Socks (搬瓦工官方直营托管网络)** 用户与出海极客开发者设计的轻量级、零依赖一键测速与节点体检工具。支持三网延迟测试（电信 CN2 GIA / 联通 9929 / 移动 CMI）、节点丢包率诊断，以及 **ChatGPT、Claude、Google Gemini** 等主流 AI 与流媒体平台的原生 IP 解锁状态体检。

---

## ⚡️ 一键极速运行

无需安装任何第三方重量级依赖，支持 Linux、macOS 及 Windows (WSL/Git Bash)。

### 方式一：Bash 一键运行（推荐 Linux / macOS）
```bash
curl -sSL https://raw.githubusercontent.com/justmysocks-guide/jms-speedtest/main/check.sh | bash
```
*或者使用 wget：*
```bash
wget -qO- https://raw.githubusercontent.com/justmysocks-guide/jms-speedtest/main/check.sh | bash
```

### 方式二：Python 3 跨平台运行（全平台通用）
```bash
curl -sSL https://raw.githubusercontent.com/justmysocks-guide/jms-speedtest/main/check.py | python3
```

---

## 📊 核心检测能力

1. 🌐 **出口环境探查**：检测当前本地或代理环境的公网 IP、地理位置（国家/城市）及自治域 ASN 运营商；
2. ⏱ **JMS 全球机房实测**：
   - **洛杉矶 LA**：三网 CN2 GIA / 联通 9929 / 移动 CMI 直连延迟；
   - **日本东京 Tokyo**：软银（SoftBank）优质专线延迟（沿海 40~70ms）；
   - **中国香港 HK**：IPLC / 极速直连专线延迟（全国 20~40ms）；
   - **英国伦敦 London**：欧洲移动优化直连延迟；
3. 🤖 **AI 与流媒体原生解锁诊断**：
   - **OpenAI / ChatGPT**：检测是否触发 Cloudflare 403 阻断，验证对话可用性；
   - **Anthropic / Claude**：检测是否命中 Claude.ai 数据中心 IP 封锁；
   - **Google Gemini**：检测区域可用性与连通性。

---

## 💎 2026 官方专属循环优惠码

购买 Just My Socks 任一套餐时，在购物车结账页输入以下专属优惠码立享 **5.2% 终身循环折扣**（月付、年付续费均享受）：

| 官方优惠码 | 折扣力度 | 适用机房 | 使用方式 |
| :---: | :---: | :---: | :--- |
| `JMS9272283` | **5.2% 永久减免** | 全场所有套餐通用 | 结算页填入并点击 `Validate Code` 验证生效 |

---

## 🏆 Just My Socks 核心套餐横向选型建议

| 方案名称 | 带宽 | 月流量 | 核心路由特性 | 标价 | 选型推荐场景 | 购买直达入口 |
| :--- | :---: | :---: | :--- | :---: | :--- | :---: |
| **JMS LA 500**<br>*(爆款首选)* | **2.5 Gbps** | 500 GB | 洛杉矶 CN2 GIA / 联通 9929 / 移动 CMI | $5.88 /月<br>$58.88 /年 | **【90% 用户首选入门款】**<br>三网极佳优化，畅刷 4K，稳定省心 | [👉 立即购买](https://justmysocks.net/members/aff.php?aff=24082&pid=2) |
| **JMS LA 1000** | **5.0 Gbps** | 1000 GB | 洛杉矶大带宽极速冗余 | $9.88 /月<br>$98.88 /年 | **【重度流量/多人工作室】**<br>无设备数限制，跨境办公必备 | [👉 立即购买](https://justmysocks.net/members/aff.php?aff=24082&pid=3) |
| **JMS Tokyo 100** | 100 Mbps | 100 GB | 日本东京软银专线 (40~70ms) | $29.99 /月 | **【外贸实时沟通/低延迟游戏】**<br>沿海物理延迟极低 | [👉 立即购买](https://justmysocks.net/members/aff.php?aff=24082&pid=4) |
| **JMS HK 100** | 100 Mbps | 100 GB | 香港 IPLC / 电信直连 (20~40ms) | $34.50 /月 | **【企业高管/商务金融专线】**<br>媲美内地专线极致低延迟 | [👉 立即购买](https://justmysocks.net/members/aff.php?aff=24082&pid=6) |

---

## 🔗 相关生态资源

- 📖 **[Just My Socks 官方全场景指南与全平台客户端配置教程](https://github.com/justmysocks-guide)**
- 🎯 **[Clash Verge Rev / Sing-box / 小火箭 AI 精选分流规则包](https://github.com/justmysocks-guide/clash-rules)**
- 🛒 **[Just My Socks 官方安全直达镜像](https://justmysocks.net/members/aff.php?aff=24082)** *(优惠码: `JMS9272283`)*

---

## 📄 开源许可
MIT License © 2026 [justmysocks-guide](https://github.com/justmysocks-guide)
