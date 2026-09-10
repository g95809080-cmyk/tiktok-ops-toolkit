# TikTok 运营诊断工具包 0.2.0

用于冷启动规划、素材诊断与裂变、运营动作复盘。包含方法、三张工作表和虚构示例。不是广告自动化软件，不提供模型额度或平台账号，不保证投放收益。

## 选择入口

已配置Node.js和Git的用户，可直接使用[README的一行安装命令](README.md#一行安装项目范围)，在当前项目安装。本仓库公开，无需申请访问权限。下方保留不依赖Node.js的Windows安装和手动方式。

| 工具 | 入口 | 安装/导入方式 |
|---|---|---|
| Codex 本地版 | 标准技能目录 | Windows脚本或手动复制 |
| Antigravity | 标准技能目录 | Windows脚本或手动复制 |
| Claude Code | 标准技能目录 | Windows脚本或手动复制 |
| Claude 网页/桌面支持Skills的账号 | 独立Skill ZIP | 上传 claude-skill.zip，不上传整个交付包 |

目录适配按2026-09-09官方文档整理。安装文件校验不代表在所有客户端版本实测；本工具不提供永久记忆。

## Windows

先完整解压，再双击 START-WINDOWS.cmd，输入 codex、antigravity 或 claude-code。无需管理员权限、Python、API密钥；不会安装AI软件本身。启动器仅对本次PowerShell进程设置脚本执行策略，不修改系统永久策略。组织设备若禁止脚本，使用下方手动复制，不绕过组织限制。

在包目录中也可运行：

```powershell
.\INSTALL.ps1 -Target codex -WhatIf
.\INSTALL.ps1 -Target codex
.\INSTALL.ps1 -Target antigravity
.\INSTALL.ps1 -Target claude-code
```

第一条只预览，不创建文件。目标已有同名目录时会停止，不自动覆盖。自定义旧版路径使用 `-SkillsRoot '绝对技能父目录'`，由客户先核对自己版本，不同时装到多个可被同一工具扫描的位置。

## 手动安装（Windows、macOS、Linux）

将 skill 下整个 tiktok-ops-toolkit 文件夹复制到以下父目录。`~`表示当前用户目录；最终应为“父目录/tiktok-ops-toolkit/SKILL.md”，不要多套一层。

- Codex：`~/.agents/skills/`
- Antigravity：`~/.gemini/config/skills/`
- Claude Code：`~/.claude/skills/`

项目范围：Codex及Antigravity可使用项目的`.agents/skills/`，Claude Code使用`.claude/skills/`。用户级与项目级选一种即可。脚本只在Windows验证，macOS/Linux使用手动方式。

打开新会话后，要求“使用 tiktok-ops-toolkit 诊断以下业务”。Codex可显式写`$tiktok-ops-toolkit`，Claude Code可写`/tiktok-ops-toolkit`。未找到技能时核对目录层级、名称和当前工具是否限制自定义技能。

## Claude 网页或桌面

在支持自定义Skills的账号中，进入 Customize > Skills，通过创建/上传技能入口上传 claude-skill.zip，再启用。界面和可用性以账号实际显示为准。没有入口的账号不在此安装路径支持范围内。Claude Code的本地安装不等于网页账号已经启用。

## 验收、更新与卸载

请AI处理skill/tiktok-ops-toolkit/example.md中的虚构案例。应能算出CTR 4%、CVR 2.5%、ROAS 2.5、广告后贡献为0且未扣固定成本，并不直接建议扩量。

升级前将已有同名技能文件夹移到技能目录外备份，再安装新版本。卸载只需移走安装器显示的同名文件夹；不删除整个skills目录。Claude网页从技能设置移除。本包没有后台进程或远程服务。

## 官方接入参考

- [Codex技能目录](https://learn.chatgpt.com/docs/build-skills)
- [Antigravity技能目录](https://antigravity.google/docs/skills)
- [Claude Code技能](https://code.claude.com/docs/en/skills)
- [Claude技能上传](https://support.claude.com/en/articles/12512180-use-skills-in-claude)
