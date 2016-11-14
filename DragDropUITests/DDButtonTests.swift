//
//  DDButtonTests.swift
//  DragDropUI
//
//  Created by Abdullah Selek on 05/11/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import Quick
import Nimble

@testable import DragDropUI

class DDButtonTests: QuickSpec {
    
    override func spec() {
        describe("DragDropButton", {
            context("button init", {
                it("withFrame should initiate successfully") {
                    let button = DDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    expect(button.gestureRecognizers).to(haveCount(1))
                }
            })
            context("button wasDragged", {
                it("and delegate not nil should inform the view controller") {
                    let viewController = ButtonTestViewControler()
                    let button = MockDDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    button.delegate = viewController
                    expect(button.delegate).notTo(beNil())
                    let gestureRecognizer = MockPanGestureRecognizer(target: button, action: #selector(DDButton.handlePan(_:)))
                    button.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(button)
                    button.handlePan(gestureRecognizer)
                    expect(viewController.wasDragged).to(beTrue())
                }
            })
            context("button wasDragged", {
                it("and delegate nil should not inform the view controller") {
                    let viewController = ButtonTestViewControler()
                    let button = MockDDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    expect(button.delegate).to(beNil())
                    viewController.view.addSubview(button)
                    button.sendActions(for: .touchDragInside)
                    expect(viewController.wasDragged).to(beFalse())
                }
            })
            context("button wasDropped", {
                it("and delegate not nil should inform the view controller") {
                    let viewController = ButtonTestViewControler()
                    let button = MockDDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    button.delegate = viewController
                    expect(button.delegate).notTo(beNil())
                    let gestureRecognizer = UIPanGestureRecognizer(target: button, action: #selector(DDButton.handlePan(_:)))
                    button.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(button)
                    button.handlePan(gestureRecognizer)
                    expect(viewController.wasDropped).to(beTrue())
                }
            })
            context("button wasDropped", {
                it("and delegate not nil should not inform the view controller") {
                    let viewController = ButtonTestViewControler()
                    let button = MockDDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    expect(button.delegate).to(beNil())
                    let gestureRecognizer = UIPanGestureRecognizer(target: button, action: #selector(DDButton.handlePan(_:)))
                    button.addGestureRecognizer(gestureRecognizer)
                    viewController.view.addSubview(button)
                    button.handlePan(gestureRecognizer)
                    expect(viewController.wasDropped).to(beFalse())
                }
            })
        })
    }
    
}

extension UIPanGestureRecognizer {
    
    override open var state: UIGestureRecognizerState {
        return .ended
    }
    
}

private class MockDDButton: DDButton {
    
    @objc override func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        super.handlePan(gestureRecognizer)
    }
    
}

public class MockPanGestureRecognizer: UIPanGestureRecognizer {
    
    override open var state: UIGestureRecognizerState {
        return .changed
    }
    
}

private class ButtonTestViewControler: UIViewController, DDButtonDelegate {
    
    public var wasDragged: Bool! = false
    public var wasDropped: Bool! = false
    
    public func buttonWasDropped(button: UIButton, droppedPoint: CGPoint) {
        wasDropped = true
    }
    
    public func buttonWasDragged(button: UIButton, droppedPoint: CGPoint) {
        wasDragged = true
    }
    
}
