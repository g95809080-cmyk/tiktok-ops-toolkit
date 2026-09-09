# TikTok Ops Kit

版本0.1.0，私有交付候选版。面向Codex、Antigravity、Claude Code及支持自定义Skills的Claude账号。

[安装与使用](START-HERE.md) · [诊断方法](skill/tiktok-ops-toolkit/method.md) · [决策模板](skill/tiktok-ops-toolkit/templates.md) · [虚构验收案例](skill/tiktok-ops-toolkit/example.md)

Windows完整解压Release中的TikTok-Ops-Kit-0.1.0.zip后运行START-WINDOWS.cmd。Claude网页仅上传claude-skill.zip。

这是方法与模板工具包，不是自动投放软件或平台官方产品。未做各宿主模型端到端测试和真实业务效果验证。发布者的内容商业授权、品牌、售价和客户许可条款需在对外销售前确定；本私有仓库发布不代表这些事项已完成。

## 构建与检查

Windows PowerShell运行 `./BUILD.ps1` 生成dist下的两个ZIP及SHA256清单。运行 `./TEST.ps1` 检查三个安装目标的隔离安装、预览无写入及同名保护。无第三方依赖。

源文件不包含私人群聊原文、图片、身份或访问密钥。内部研究版保持独立，不随本仓库发布。
