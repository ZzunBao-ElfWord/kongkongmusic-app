fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios build

```sh
[bundle exec] fastlane ios build
```

构建 App Store 包（需先在 Xcode 中配置 Team）

### ios metadata

```sh
[bundle exec] fastlane ios metadata
```

推送 App Store 元数据 + 截屏

### ios tf_builds

```sh
[bundle exec] fastlane ios tf_builds
```

查看 TestFlight builds 状态

### ios tf_internal

```sh
[bundle exec] fastlane ios tf_internal
```

把最新 build 分配给内部测试组

### ios release

```sh
[bundle exec] fastlane ios release
```

构建 + 上传 + 推送元数据（完整发布流程）

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
