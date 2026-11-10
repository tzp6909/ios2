# SmoothStride（顺滑增强）

面向 iOS 16.2+、Roothide Dopamine、arm64e 的 SpringBoard 插件。提供 UIKit 动画时长调整，以及默认关闭的 CPU 调度实验：仅在 SpringBoard 中尝试将进程 nice 值降低 1，系统可能拒绝。每次启用仅尝试一次；关闭时，仅在当前值仍是插件设置的值时才尝试恢复。实验结果通过系统日志记录，不代表 CPU 频率变化或性能保证。

**设备反馈：5.2.0 设置页出现 `bad bind opcode 0x00`；5.2.1 ARM64 实验包出现 `have arm64, need arm64e`。这两个包均不适合你的设备，请卸载。此源码版本 5.2.2 必须由兼容的 macOS/Xcode 工具链编译成真正 ARM64E 的 tweak 和设置 bundle，并在真机验证后才能称为可用。**

## 在线构建

1. 将整个工程目录上传到你自己的 GitHub 仓库，默认分支使用 `main` 或 `master`。
2. 打开仓库的 **Actions** 页面，选择 **Build SmoothStride**，点击 **Run workflow**。推送到默认分支也会自动构建。
3. 等待任务成功，在本次运行页面的 **Artifacts** 下载 `packages-roothide`。
4. 解压 artifact，确认 `.deb` 信息中的包名为 `com.axs.smoothstride`、架构为 `iphoneos-arm64e`，然后通过支持 Roothide 的越狱包管理器安装。
5. 安装后在设置中打开“顺滑增强”，并按偏好调整动画倍率。默认关闭插件。

工作流只生成 Actions artifact，不创建 GitHub Release。仓库无需提供给构建器任何账号密码或 API key；GitHub Actions 使用仓库默认的只读令牌读取源码。

## 本地构建

需预先安装兼容的 Roothide Theos、iPhoneOS 16.5 SDK、Xcode/clang 和 dpkg：

```sh
sh build.sh
```

输出位于 `packages/`。在线 CI 的成功只能证明该工具链完成编译打包；首次在设备安装前仍建议备份并确认包管理器显示的架构、依赖与安装路径。配置开关本身不能证明 nice 值修改成功；请在 SpringBoard 日志中查找 `[AxsSmoothStride] CPU experiment`，并检查权限拒绝信息。若从其他插件或系统层改变了优先级，关闭时不会强行覆盖。
