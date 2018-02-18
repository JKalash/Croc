# JKEmoji
Elegant Emoji parsing in Swift

[![Build Status](https://travis-ci.org/JKalash/JKEmoji.svg?branch=master)](https://travis-ci.org/JKalash/JKEmoji)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/JKEmoji.svg)](https://img.shields.io/cocoapods/v/JKEmoji.svg)
[![CocoaPods](https://img.shields.io/cocoapods/dt/JKEmoji.svg)](https://img.shields.io/cocoapods/dt/JKEmoji.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/JKEmoji.svg?style=flat)](https://img.shields.io/cocoapods/p/JKEmoji.svg?style=flat)
[![License](https://img.shields.io/cocoapods/l/JKEmoji.svg?style=flat)](http://cocoapods.org/pods/JKEmoji)
[![Swift-4.0](http://img.shields.io/badge/Swift-4.0-blue.svg)]()

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build JKEmoji

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'JKEmoji'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "JKalash/JKEmoji"
```

Run `carthage update` to build the framework and drag the built `Alamofire.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

#### Swift 3

```swift
dependencies: [
    .Package(url: "https://github.com/JKalash/JKEmoji.git", majorVersion: 0)
]
```

#### Swift 4

```swift
dependencies: [
    .package(url: "https://github.com/JKalash/JKEmoji.git", from: "0.0.0")
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Alamofire into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add Alamofire as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/JKalash/JKEmoji.git
  ```

- Open the new `JKEmoji` folder, and drag the `JKEmoji.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `JKEmoji.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `JKEmoji.xcodeproj` folders each with two different versions of the `JKEmoji.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `JKEmoji.framework`.

- Select the top `JKEmoji.framework` for iOS and the bottom one for OS X.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `JKEmoji` will be listed as either `JKEmojiiOS`, `JKEmojiOSX`, `JKEmojiTVOS` or `JKEmojiWatchOS`.

- And that's it!

  > The `JKEmoji.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

## Requirements

- iOS 8.0+ / macOS 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.3+
- Swift 3.1+

## Author

Joseph Kalash, josephkalash@gmail.com

## Donation
If this project helps you reduce time to develop, you can give me a cup of coffee :) 

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MHHC3G7U6UHE2

## License

JKEmoji is released under the MIT license. [See LICENSE](https://github.com/JKalash/JKEmoji/blob/master/LICENSE) for details.
