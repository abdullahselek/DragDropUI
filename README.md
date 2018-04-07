[![Build Status](https://travis-ci.org/abdullahselek/DragDropUI.svg?branch=master)](https://travis-ci.org/abdullahselek/DragDropUI)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DragDropUI.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# DragDropUI
A set of iOS UI components which have drag &amp; drop capability. There is also a information [link](http://gargo.of.by/dragdropui/) which is translated to Russian by @gerchicov-bp.

## Requirements

| DragDropUI Version | Minimum iOS Target  | Swift Version |
|:--------------------:|:---------------------------:|:---------------------------:|
| 1.0.4 | 9.0 | 4.1 |
| 1.0.3 | 9.0 | 4.0 |
| 1.0.2 | 8.0 | 3.x |

## CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

```
$ gem install cocoapods
```

To integrate DragDropUI into your Xcode project using CocoaPods, specify it in your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
	pod 'DragDropUI', '~> 1.0.4'
end
```

Then, run the following command:

	$ pod install

## Carthage

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with Homebrew using the following command:

```
brew update
brew install carthage
```

To integrate DragDropUI into your Xcode project using Carthage, specify it in your Cartfile:

```
github "abdullahselek/DragDropUI" ~> 1.0.4
```

Run carthage update to build the framework and drag the built DragDropUI.framework into your Xcode project.

## DragDropUI contains

- [x] DDView
- [x] DDButton
- [x] DDImageView
- [x] DDLabel
- [x] DDTableViewCell
- [x] DDCollectionViewCell
- [x] DDTextField

### It is so simple to use these components. You can just directly add them on storyboard or xib file and set its class with the DD ones.

### If you prefer adding with code it is also enabled. Creating with frame and then adding contrants is enough!

## Example Usage

```
@IBOutlet weak var draggableView: DDView!

override func viewDidLoad() {
	super.viewDidLoad()
    draggableView.delegate = self // it is optional to catch drag and drop points
}
```

```
// MARK: DDViewDelegate

func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
	print("Dragged Point : ", draggedPoint)
}

func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
    print("Dropped Point : ", droppedPoint)
}
```

## License

```
MIT License

Copyright (c) 2016 Abdullah Selek

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```