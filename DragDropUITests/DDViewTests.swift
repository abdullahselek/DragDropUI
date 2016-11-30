//
//  DDViewTests.swift
//  DragDropUI
//
//  Created by Abdullah Selek on 12/11/2016.
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

class DDViewTests: QuickSpec {
    
    override func spec() {
        /***
        describe("DragDropView", {
            context("view init", {
                it("withFrame should initiate successfully") {
                    let view = DDView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view).notTo(beNil())
                    expect(view.gestureRecognizers).to(haveCount(1))
                }
            })
            context("view wasDragged", {
                it("and delegate not nil should inform the view controller") {
                    let viewController = TestViewControler()
                    let view = MockDDView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view).notTo(beNil())
                    view.delegate = viewController
                    expect(view.delegate).notTo(beNil())
                    let gestureRecognizer = MockPanGestureRecognizer(target: view, action: #selector(DDView.handlePan(_:)))
                    view.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(view)
                    view.handlePan(gestureRecognizer)
                    expect(viewController.wasDragged).to(beTrue())
                }
            })
            context("view wasDragged", {
                it("and delegate nil should not inform the view controller") {
                    let viewController = TestViewControler()
                    let view = MockDDView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view).notTo(beNil())
                    expect(view.delegate).to(beNil())
                    let gestureRecognizer = UIPanGestureRecognizer(target: view, action: #selector(DDView.handlePan(_:)))
                    view.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(view)
                    view.handlePan(gestureRecognizer)
                    expect(viewController.wasDragged).to(beFalse())
                }
            })
            context("view wasDropped", {
                it("and delegate not nil should inform the view controller") {
                    let viewController = TestViewControler()
                    let view = MockDDView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view).notTo(beNil())
                    view.delegate = viewController
                    expect(view.delegate).notTo(beNil())
                    let gestureRecognizer = UIPanGestureRecognizer(target: view, action: #selector(DDView.handlePan(_:)))
                    view.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(view)
                    view.handlePan(gestureRecognizer)
                    expect(viewController.wasDropped).to(beTrue())
                }
            })
            context("view wasDropped", {
                it("and delegate not nil should not inform the view controller") {
                    let viewController = TestViewControler()
                    let view = MockDDView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(view).notTo(beNil())
                    expect(view.delegate).to(beNil())
                    let gestureRecognizer = UIPanGestureRecognizer(target: view, action: #selector(DDView.handlePan(_:)))
                    view.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(view)
                    view.handlePan(gestureRecognizer)
                    expect(viewController.wasDropped).to(beFalse())
                }
            })
        })
        ***/
    }
    
}

/***
private class MockDDView: DDView {
    
    @objc override func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        super.handlePan(gestureRecognizer)
    }
    
}

private class TestViewControler: UIViewController, DDViewDelegate {
    
    public var wasDragged: Bool! = false
    public var wasDropped: Bool! = false
    
    public func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        wasDropped = true
    }
    
    public func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        wasDragged = true
    }
    
}
***/
