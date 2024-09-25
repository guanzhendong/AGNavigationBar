# AGNavigationBar

[![Version](https://img.shields.io/cocoapods/v/AGNavigationBar.svg?style=flat)](https://cocoapods.org/pods/AGNavigationBar)
[![](https://img.shields.io/cocoapods/l/AGNavigationBar.svg?style=flat)](LICENSE)
[![](https://img.shields.io/badge/support-iOS10%2B-blue.svg?style=flat)](https://www.apple.com/nl/ios/)
[![](https://img.shields.io/badge/language-Swift-f48041.svg?style=flat)](https://www.apple.com/)


## Screenshot

### Demo
![1](./Screenshot/1.png)

### BackgroundColor

```swift
navBar.barTintColor = .green
```

![2](./Screenshot/2.png)

### BackgroundImage

```swift
AGNavigationBar.Config.backgroundImage = UIImage(named: "bg")
```

![3](./Screenshot/3.png)

### AttributesTitle

```swift
navBar.titleTextAttributes = [
    .foregroundColor: UIColor.blue,
    .font: UIFont.systemFont(ofSize: 26, weight: .medium)
]
```

![4](./Screenshot/4.png)

### LongTitle

No additional setup required

![6](./Screenshot/6.png)

### BarAction

```swift
navBar.addAction(AGNavigationBarAction(title: "保存", position: .right))
navBar.addAction(AGNavigationBarAction(title: "朋友圈", position: .right, handler: { _ in
    print("朋友圈")
}))
navBar.addAction(AGNavigationBarAction(title: "关闭", position: .left, handler: { _ in
}))

navBar.actionTintColor = .yellow
```

![5](./Screenshot/5.png)

### ChangeAction

```swift
navBar.addAction(AGNavigationBarAction(title: "保存", position: .right, handler: { action in
    action.title = "😁"
}))
navBar.addAction(AGNavigationBarAction(title: "朋友圈", position: .right, handler: { action in
    print("朋友圈")
    action.isHidden = true
}))
navBar.addAction(AGNavigationBarAction(title: "关闭", position: .left, handler: { action in
    action.isEnabled = false
}))
```

![7](./Screenshot/7.gif)

### HideBackAction

```
navBar.isBackHidden = true
```

![9](./Screenshot/9.png)

### ChangeAlpha

![8](./Screenshot/8.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0
- Swift 5.0

## Installation

### Swift Package Manager

Add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/guanzhendong/AGNavigationBar", .upToNextMajor(from: "0.1.3"))
```

### CocoaPods

AGNavigationBar is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'AGNavigationBar'
```

### Manual

Drop the swift files  [AGNavigationBar.swift](AGNavigationBar/Classes/AGNavigationBar.swift)  into your project.

## Usage

```swift
let nav = AGNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 88))
view.addSubview(nav)
```

More usage reference the example project

## Author

arthurguan, cgrect@126.com

## License

AGNavigationBar is available under the MIT license. See the LICENSE file for more info.
