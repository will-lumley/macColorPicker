![ColorPicker: Elegant Color Picking](https://raw.githubusercontent.com/will-lumley/ColorPicker/main/ColorPicker.png)

# ColorPicker

[![CI Status](https://api.travis-ci.com/will-lumley/ColorPicker.svg?branch=main)](https://travis-ci.org/will-lumley/ColorPicker)
[![Version](https://img.shields.io/cocoapods/v/ColorPicker.svg?style=flat)](https://cocoapods.org/pods/ColorPicker)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)
![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Platform](https://img.shields.io/cocoapods/p/ColorPicker.svg?style=flat)](https://cocoapods.org/pods/ColorPicker)
[![License](https://img.shields.io/cocoapods/l/ColorPicker.svg?style=flat)](https://cocoapods.org/pods/ColorPicker)
[![Twitter](https://img.shields.io/badge/twitter-@wlumley95-blue.svg?style=flat)](https://twitter.com/wlumley95)

ColorPicker is a tiny, pure Swift library designed for macOS applications that allows you to let your users easily choose a color.

ColorPicker allows you to present the user with a preset range of colors to choose from. As the developer, you get to choose how these are formatted, how they look, and what happens when a user makes a selection.
If you want to give the user more control, you can allow them to select a button that presents the `NSColorPanel`.

## Usage

ColorPicker is simply a subclass of `NSView` so you can simply add ColorPicker like you would any other view, whether it be to your storyboard, XIB, or just in code. 
Configuring ColorPicker's `delegate` allows you to be notified when the ColorPicker view is about to be presented, when is has been presented, or when a user has selected a color.


https://user-images.githubusercontent.com/14086082/116811221-6fd58480-ab8b-11eb-9e3f-a19fb3f83caa.mov

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

ColorPicker macOS 10.10 and above.

## Installation

### Cocoapods
ColorPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ColorPicker', '~> 1.0'
```

### Carthage
ColorPicker is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
github "will-lumley/ColorPicker" == 1.0
```

### Swift Package Manager
ColorPicker is also available through [Swift Package Manager](https://github.com/apple/swift-package-manager). 
To install it, simply add the dependency to your Package.Swift file:

```swift
...
dependencies: [
    .package(url: "https://github.com/will-lumley/ColorPicker.git", from: "1.0"),
],
targets: [
    .target( name: "YourTarget", dependencies: ["ColorPicker"]),
]
...
```
## Author

[William Lumley](https://lumley.io/), will@lumley.io

## License

FaviconFinder is available under the MIT license. See the LICENSE file for more info.
