# fuck_project

A new Flutter project.

## Getting Started

```bash
flutter pub get && flutter run 
```
## folder

```
lib ---> 源代码文件
  - components ---> 全局公用组件目录
  - src  ---> 业务代码和页面逻辑目录
    - layout ---> 实际业务逻辑和页面目录
      - components --->本页面专用组件目录
      - view.dart  --->本页面源码文件
      - controller.dart --->本页面controller
  - internationalization --->国际化
  - service --->services目录
  - binding ---> controller绑定目录
  - routers ---> 命名路由目录
  - main.dart ---> 程序入口文件
```