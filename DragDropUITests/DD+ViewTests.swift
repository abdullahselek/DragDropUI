//
//  DDProtocolTests.swift
//  DragDropUI
//
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
        describe("DD+View Tests", {
            var view: DDView!
            var viewController: UIViewControllerFake!

            beforeEach {
                view = DDView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                viewController = UIViewControllerFake()
            }

            describe(".parentView", {
                context("when superview nil", {
                    it("should return nil", closure: {
                        expect(view.parentView).to(beNil())
                    })
                })

                context("when superview not nil", {
                    beforeEach {
                        viewController.view.addSubview(view)
                    }

                    it("should return valid view", closure: {
                        expect(view.parentView).notTo(beNil())
                    })
                })
            })

            describe(".didPress(pressGesture:)", {
                context("when dragging start", {
                    beforeEach {
                        expect(view.draggedPoint).to(equal(CGPoint(x: 0.0, y: 0.0)))
                        viewController.view.addSubview(view)
                        view.didPress(pressGesture: LongPressGestureRecognizerStateBeganFake())
                    }

                    it("should set its dragged point on state began", closure: {
                        expect(view.draggedPoint).to(equal(CGPoint(x: 100.0, y: 20.0)))
                    })
                })

                context("when dragging stop", {
                    beforeEach {
                        view.ddDelegate = viewController
                        viewController.view.addSubview(view)
                        view.didPress(pressGesture: LongPressGestureRecognizerStateCancelFake())
                    }

                    it("should trigger its delegate when it is set and on state cancel", closure: {
                        expect(viewController.wasDropped).to(beTrue())
                    })
                })
            })

            describe(".handlePan(panGesture:)", {
                beforeEach {
                    view.ddDelegate = viewController
                    viewController.view.addSubview(view)
                    view.handlePan(panGesture: UIPanGestureRecognizer())
                }

                it("should trigger its delegate when it is set", closure: {
                    expect(viewController.wasDragged).to(beTrue())
                })
            })
        })
    }
}

class LongPressGestureRecognizerStateBeganFake: UILongPressGestureRecognizer {
    override open var state: UIGestureRecognizer.State {
        get { return .began }
        set {}
    }
}

class LongPressGestureRecognizerStateCancelFake: UILongPressGestureRecognizer {
    override open var state: UIGestureRecognizer.State {
        get { return .cancelled }
        set {}
    }
}

class UIViewControllerFake: UIViewController, DDViewDelegate {

    var wasDragged = false
    var wasDropped = false

    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        wasDragged = true
    }

    func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        wasDropped = true
    }

}
