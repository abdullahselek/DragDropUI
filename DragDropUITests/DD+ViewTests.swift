//
//  DDProtocolTests.swift
//  DragDropUI
//
//  Created by Abdullah Selek on 01/12/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Quick
import Nimble

@testable import DragDropUI

class DD_ViewTests: QuickSpec {
    
    override func spec() {
        describe("DD_View", {
            context("parentView", {
                it("should return valid view when superview not nil", closure: {
                    let viewController = UIViewController()
                    let view = DDView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    viewController.view.addSubview(view)
                    expect(view.parentView).notTo(beNil())
                })
            })
            context("parentView", {
                it("should return nil when superview nil", closure: {
                    let view = DDView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view.parentView).to(beNil())
                })
            })
            context("didPress", {
                it("should set its dragged point on state began", closure: {
                    let viewController = UIViewController()
                    let view = DDView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view.draggedPoint).to(equal(CGPoint(x: 0.0, y: 0.0)))
                    viewController.view.addSubview(view)
                    view.didPress(pressGesture: LongPressGestureRecognizerStubStateBegan())
                    expect(view.draggedPoint).to(equal(CGPoint(x: 100.0, y: 20.0)))
                })
            })
            context("didPress", {
                it("should trigger its delegate when it is set and on state cancel", closure: {
                    let viewController = TestViewController()
                    let view = DDView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    view.ddDelegate = viewController
                    viewController.view.addSubview(view)
                    view.didPress(pressGesture: LongPressGestureRecognizerStubStateCancel())
                    expect(viewController.wasDropped).to(beTrue())
                })
            })
            context("handlePan", {
                it("should trigger its delegate when it is set", closure: {
                    let viewController = TestViewController()
                    let view = DDView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    view.ddDelegate = viewController
                    viewController.view.addSubview(view)
                    view.handlePan(panGesture: UIPanGestureRecognizer())
                    expect(viewController.wasDragged).to(beTrue())
                })
            })
        })
    }
    
}

class LongPressGestureRecognizerStubStateBegan: UILongPressGestureRecognizer {

    override open var state: UIGestureRecognizerState {
        return .began
    }

}

class LongPressGestureRecognizerStubStateCancel: UILongPressGestureRecognizer {

    override open var state: UIGestureRecognizerState {
        return .cancelled
    }
    
}

class TestViewController: UIViewController, DDViewDelegate {

    var wasDragged = false
    var wasDropped = false

    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        wasDragged = true
    }

    func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        wasDropped = true
    }

}
