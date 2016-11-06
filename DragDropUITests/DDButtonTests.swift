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
                    expect(button.actions(forTarget: button, forControlEvent: .touchDragInside)).notTo(beNil())
                    expect(button.actions(forTarget: button, forControlEvent: .touchUpInside)).notTo(beNil())
                }
            })
            context("button wasDragged", {
                it("and delegate not nil should inform the view controller") {
                    let viewController = ButtonTestViewControler()
                    let button = MockDDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    button.delegate = viewController
                    expect(button.delegate).notTo(beNil())
                    viewController.view.addSubview(button)
                    button.sendActions(for: .touchDragInside)
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
                    viewController.view.addSubview(button)
                    button.sendActions(for: .touchUpInside)
                    expect(viewController.wasDropped).to(beTrue())
                }
            })
            context("button wasDropped", {
                it("and delegate nil should not inform the view controller") {
                    let viewController = ButtonTestViewControler()
                    let button = MockDDButton(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                    expect(button).notTo(beNil())
                    expect(button.delegate).to(beNil())
                    viewController.view.addSubview(button)
                    button.sendActions(for: .touchUpInside)
                    expect(viewController.wasDropped).to(beFalse())
                }
            })
        })
    }
    
}

private class MockDDButton: DDButton {
    
    @objc override func wasDragged(button: UIButton, event: UIEvent) {
        let event = MockEvent()
        super.wasDragged(button: button, event: event)
    }
    
    @objc override func wasDropped(button: UIButton, event: UIEvent) {
        let event = MockEvent()
        super.wasDropped(button: button, event: event)
    }
    
}

private class MockEvent: UIEvent {
    
    override func touches(for view: UIView) -> Set<UITouch>? {
        var touches = Set<UITouch>()
        touches.insert(MockTouch())
        return touches
    }
    
}

private class MockTouch: UITouch {
    
    override var phase: UITouchPhase {
        return UITouchPhase.ended
    }
    
}

private class ButtonTestViewControler: UIViewController, DDButtonDelegate {
    
    public var wasDragged: Bool! = false
    public var wasDropped: Bool! = false
    
    func buttonWasDragged(button: UIButton, centerOfButton: CGPoint) {
        wasDragged = true
    }
    
    func buttonWasDropped(button: UIButton) {
        wasDropped = true
    }
}
