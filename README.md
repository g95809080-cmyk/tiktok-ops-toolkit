# TikTok Ops Kit

版本0.2.0，公开发布。面向Codex、Antigravity、Claude Code及支持自定义Skills的Claude账号。

v0.2新增：五类场景分支、异常对象澄清、参数单位与未确认假设字段，以及七个虚构反例。保留原安装方式；不增加固定投放参数。内容规则尚未通过独立模型及真实业务验证。

[安装与使用](START-HERE.md) · [诊断方法](skill/tiktok-ops-toolkit/method.md) · [决策模板](skill/tiktok-ops-toolkit/templates.md) · [虚构验收案例](skill/tiktok-ops-toolkit/example.md)

## 一行安装（项目范围）

先安装Node.js/npm和Git。本仓库已公开，下载安装无需GitHub登录或单独申请仓库访问权限。在你希望使用技能的项目目录打开终端运行：

```sh
npx --yes skills@1.5.25 add https://github.com/g95809080-cmyk/tiktok-ops-toolkit/tree/main/skill/tiktok-ops-toolkit --skill tiktok-ops-toolkit --agent codex claude-code antigravity --copy --yes
```

只装一个工具时，将`--agent`后面的列表改成`codex`、`claude-code`或`antigravity`。Windows PowerShell若拦截npx.ps1，可把命令开头改为`npx.cmd`。

此命令已经在Windows隔离项目中验证，安装到`.agents/skills/tiktok-ops-toolkit`及`.claude/skills/tiktok-ops-toolkit`。不加`-g`，因此不是全局安装；全局安装使用本包INSTALL.ps1的已核实路径。尚未实测macOS/Linux或宿主模型行为。

安装器为第三方[vercel-labs/skills](https://github.com/vercel-labs/skills)，版本固定为本次验证的1.5.25；`--yes`跳过确认，安装前检查同名技能并备份，第三方安装器不承诺与本包脚本相同的拒绝覆盖行为。此命令下载main分支最新内容。Claude网页不适用终端命令，仍上传Release的claude-skill.zip。

任何人均可访问本仓库并下载安装。本工具不需要激活码，不提供付费访问控制或防复制功能。

Windows完整解压Release中的TikTok-Ops-Kit-0.2.0.zip后运行START-WINDOWS.cmd。Claude网页仅上传claude-skill.zip。已有版本先备份再替换；一行命令读取main的新版本，但安装过的副本不会自动升级。

这是方法与模板工具包，不是自动投放软件或平台官方产品。未做各宿主模型端到端测试和真实业务效果验证。

## 构建与检查

Windows PowerShell运行 `./BUILD.ps1` 生成dist下的两个ZIP及SHA256清单。运行 `./TEST.ps1` 检查三个安装目标的隔离安装、预览无写入及同名保护。无第三方依赖。

源文件不包含私人群聊原文、图片、身份或访问密钥。内部研究版保持独立，不随本仓库发布。
