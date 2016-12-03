![Build Status](https://travis-ci.org/abdullahselek/DragDropUI.svg?branch=master)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DragDropUI.svg)
[![Coverage Status](https://coveralls.io/repos/github/abdullahselek/DragDropUI/badge.svg?branch=master)](https://coveralls.io/github/abdullahselek/DragDropUI?branch=master)

# DragDropUI
A set of iOS UI components which have drag &amp; drop capability.

# Requirements
iOS 8.0+ & Swift 3

# Sammple

https://appetize.io/app/75d498bh2rvwyg7w2a4232v9km?device=iphone5s&scale=75&orientation=portrait&osVersion=9.3

# CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

```
$ gem install cocoapods
```

To integrate DragDropUI into your Xcode project using CocoaPods, specify it in your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
	pod 'DragDropUI', '~> 0.3'
end
```

Then, run the following command:

	$ pod install

## For the first version of DragDropUI contains

- DDView
- DDButton
- DDImageView
- DDLabel
- DDTableViewCell
- DDCollectionViewCell

which are the most common used ui components for drop &amp; drop. With the next versions will add more
ui components.

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