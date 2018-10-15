## TYModuleManager客户使用指南

### TYModuleManager是什么

TYModuleManager 是“涂鸦智能” app 的iOS端自行开发并正在使用的模块化工具，它能使得app的各个模块之间相互独立，并且能够支持客户按照涂鸦规范开发任意模块后直接替换涂鸦的对应模块，然后产生自己的app。

“TYModuleManager”既是工具名，也是工具内具体的一个类名(历史原因)，下文提到的TYModuleManager均泛指工具



### 模块化过程

涂鸦只能的模块化可以简单理解为这么几步

- 按业务能力区分模块，并将各个模块放在单独的工程中

- 为每个模块添加一个抽象的module类

  > 这个类会负责本模块的一些注册事务，如注册services，注册tab，注册route

- 将模块中的业务再一步细分为到service类

  > 一个service可以管理多个viewController，service对外提供接口，内部再调用相关viewController的接口。这样做使得模块化过程能够不侵入业务，只是在业务基础之上再包装一层

- 将service的接口分离至protocol (duck typing)

  > 这一步的目的是为了模块与模块之间能够解耦，模块与模块之间只相互依赖于protocol，不会依赖到具体类。并且protocol能够在编译期检查方法名的正确性，保证调用方不会出错

- 主工程通过pod管理，并根据需要在配置文件中添加模块

- 主工程在启动的时候执行调起TYModuleManager

  > 主工程对TYModuleManager是强依赖

- TYModuleManager根据配置调用各个模块的module类

  > 各个模块的module类会在被TYModuleManager调用的时候注册其包含的protocol与service，并进行protocol与service的绑定

- 模块需要调用另一个模块的时候，根据protocol向TYModuleManager获取id类型的service实例

  > 业务通过TYModuleManager提供的接口获取service实例时，TYModuleManager会跟据注册的记录，去创建对应的实例，并返回



### service 和 module

TYModuleManager 1.2.0+ 在内部对于service 和 module 的含义进行了更加明确的区分

- service

  service 代表着该类能够对外提供某项能力，因此 service ≈ class + protocol

  任何一个类通过 duck typing 解耦后都能够成为符合我们规范的 service

- module

  module 代表着该类不对外提供能力，因此 module ≈ class

  任何一个类都能无条件的成为 module

- module 和 service的关系

  module 内可以管理任意个service，service 可以管理任意个viewController，涂鸦业务中的 module 还兼具了帮助模块管理 service、tab、route 等功能



### 关于config_modules.json

config_modules.json是TYModuleManager的配置文件，一般你可以在你的工程目录下找到它，每个工程都会有自己的一份，所以它不需要被放在模块文件内。

config_module.json中几个配置项 **带星号的为必配项**

- schema 项 **

  e.g.  `"schema":"your_schema"`

  需要注意

  - 是 “schema” 不是 “scheme”
  - schema 支持忽略大小写

- appDelegate 项 **

  原本系统的AppDelegate.m中finishLaunch下的内容建议挪到单独的类中，这样能够保持AppDelegate的整洁，并且能够支持随时通过修改配置来实现功能替换

  如果是使用 tuya-cli-public 工具创建的工程，默认会帮助创建此类，并配置到config_modules.json

  e.g. `"appDelegate" : "your_app_module"`

  需要注意

  - 这个类建议继承自 TYModuleApplication，这样能够由基类帮助创建window，并提供一些方法的默认实现
  - 这个类需要实现 TYModuleApplicationBlueprint 协议

- tabManager 项 **

  用来管理tab的类，建议使用涂鸦提供的 TYModuleTabManager

  如果是使用 tuya-cli-public 工具创建的工程，默认配置TYModuleTabManager

  e.g. `"tabManager": "TYModuleTabManager"`

  需要注意

  - 这个类需要实现 TYModuleTabBarBlueprint 协议，并务必实现所有方法和属性
  - 如无特殊需求，建议考虑直接使用 TYModuleTabManager

- tabs 项

  需要显示在tab上的模块

  e.g. `"tabs":["your_tab_module1", "your_tab_module2"]`

- tabSelect 项

  tabs配置项中需要默认选中的项，也是tabBar上的默认选中项

  e.g. `"tabSelect":["your_tab_module1"]`

- modules 项

  app中所有需要注册service、route、notify、task的模块，都需要配置在这里、

  即使某模块已经配置在了tabs，如果有上述需求，也需要再次配置

  e.g. `"modules":["your_module1", "your_module2", "your_moudle3"]`



