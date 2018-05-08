<img src="https://cdn.rawgit.com/jkalash/croc/4dd2f48/Resources/Croc.svg" width="370"/>

**Croc** is a library for parsing emojis on iOS. It provides a simple and lightweight interface for detecting, generating, categorizing and managing emoji characters, making emoji-powered features an easy task for developers. 

[![Build Status](https://travis-ci.org/JKalash/Croc.svg?branch=master)](https://travis-ci.org/JKalash/Croc)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Croc.svg)](https://img.shields.io/cocoapods/v/Croc.svg)
[![CocoaPods](https://img.shields.io/cocoapods/dt/Croc.svg)](https://img.shields.io/cocoapods/dt/Croc.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Croc.svg?style=flat)](https://jkalash.github.io/)
[![License](https://img.shields.io/cocoapods/l/Croc.svg?style=flat)](http://cocoapods.org/pods/Croc)
[![Swift-4.0](http://img.shields.io/badge/Swift-4.1%2B-orange.svg)]()
[![Codecov](https://codecov.io/github/jkalash/croc/coverage.svg?branch=master)](https://codecov.io/github/jkalash/croc)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MHHC3G7U6UHE2)

## Usage

### Checking for emojis

![checking emojis](https://github.com/jkalash/croc/raw/master/Resources/checking_emojis.png)

### Querying for emojis

![querying emojis](https://github.com/jkalash/croc/raw/master/Resources/querying_emojis.png)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build Croc

To integrate Croc into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Croc'
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

To integrate Croc into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "JKalash/Croc"
```

Run `carthage update` to build the framework and drag the built `Croc.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Croc does support its use on supported platforms. 

Once you have your Swift package set up, adding Croc as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

#### Swift 3

```swift
dependencies: [
    .Package(url: "https://github.com/JKalash/Croc.git", majorVersion: 0)
]
```

#### Swift 4

```swift
dependencies: [
    .package(url: "https://github.com/JKalash/Croc.git", from: "0.0.0")
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Croc into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add Croc as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/JKalash/Croc.git
  ```

- Open the new `Croc` folder, and drag the `Croc.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Croc.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Croc.xcodeproj` folders each with two different versions of the `Croc.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `Croc.framework`.

- Select the top `Croc.framework` for iOS and the bottom one for OS X.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `Croc` will be listed as either `CrociOS`, `CrocOSX`, `CrocTVOS` or `CrocWatchOS`.

- And that's it!

  > The `Croc.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

## Requirements

- iOS 8.0+ / macOS 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.3+
- Swift 3.1+

## Author

Joseph Kalash, josephkalash@gmail.com

## Donation
If this project helps you reduce time to develop, you can give me a cup of coffee :) 

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MHHC3G7U6UHE2)

## License

Croc is released under the MIT license. [See LICENSE](https://github.com/JKalash/Croc/blob/master/LICENSE) for details.
