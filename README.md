# TikTok Ops Kit

版本0.1.0，私有交付候选版。面向Codex、Antigravity、Claude Code及支持自定义Skills的Claude账号。

[安装与使用](START-HERE.md) · [诊断方法](skill/tiktok-ops-toolkit/method.md) · [决策模板](skill/tiktok-ops-toolkit/templates.md) · [虚构验收案例](skill/tiktok-ops-toolkit/example.md)

## 一行安装（项目范围）

先安装Node.js/npm和Git，并用有仓库权限的GitHub账号完成Git认证（也可先运行`gh auth login`）。在你希望使用技能的项目目录打开终端运行：

```sh
npx --yes skills@1.5.25 add https://github.com/g95809080-cmyk/tiktok-ops-toolkit/tree/main/skill/tiktok-ops-toolkit --skill tiktok-ops-toolkit --agent codex claude-code antigravity --copy --yes
```

只装一个工具时，将`--agent`后面的列表改成`codex`、`claude-code`或`antigravity`。Windows PowerShell若拦截npx.ps1，可把命令开头改为`npx.cmd`。

此命令已经在Windows隔离项目中验证：读取私有仓库，安装到`.agents/skills/tiktok-ops-toolkit`及`.claude/skills/tiktok-ops-toolkit`。不加`-g`，因此不是全局安装；全局安装使用本包INSTALL.ps1的已核实路径。尚未实测macOS/Linux或宿主模型行为。

安装器为第三方[vercel-labs/skills](https://github.com/vercel-labs/skills)，版本固定为本次验证的1.5.25；`--yes`跳过确认，安装前检查同名技能并备份，第三方安装器不承诺与本包脚本相同的拒绝覆盖行为。此命令下载main分支最新内容。Claude网页不适用终端命令，仍上传Release的claude-skill.zip。

私有仓库不会因此公开。付费客户必须先获授GitHub仓库访问权并登录；本命令不带共享Token、不创建授权码，也不是防复制系统。撤销仓库访问只能阻止后续下载，不能收回已下载副本。

Windows完整解压Release中的TikTok-Ops-Kit-0.1.0.zip后运行START-WINDOWS.cmd。Claude网页仅上传claude-skill.zip。

这是方法与模板工具包，不是自动投放软件或平台官方产品。未做各宿主模型端到端测试和真实业务效果验证。发布者的内容商业授权、品牌、售价和客户许可条款需在对外销售前确定；本私有仓库发布不代表这些事项已完成。

## 构建与检查

Windows PowerShell运行 `./BUILD.ps1` 生成dist下的两个ZIP及SHA256清单。运行 `./TEST.ps1` 检查三个安装目标的隔离安装、预览无写入及同名保护。无第三方依赖。

源文件不包含私人群聊原文、图片、身份或访问密钥。内部研究版保持独立，不随本仓库发布。
