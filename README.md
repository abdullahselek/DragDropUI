![Build Status](https://travis-ci.org/abdullahselek/DragDropUI.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/abdullahselek/DragDropUI/badge.svg?branch=master)](https://coveralls.io/github/abdullahselek/DragDropUI?branch=master)

# DragDropUI
A set of iOS UI components which have drop &amp; drop capability.

## For the first version of DragDropUI contains

- DDView
- DDButton
- DDImageView
- DDLabel

which are the most common used ui components for drop &amp; drop. With the next versions will add more
ui components.

### It is so simple to use these components. You can just directly add them on storyboard or xib file and set its class with the DD ones.

### If you prefer adding with code it is also enabled. Creating with frame and then adding contrants is enough!

# Example Usage

```
@IBOutlet weak var draggableView: DDView!

override func viewDidLoad() {
	super.viewDidLoad()
    draggableView.delegate = self
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