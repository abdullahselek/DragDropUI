//
//  DDButton.swift
//  DragDropUI
//
//  Created by Abdullah Selek on 05/11/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import UIKit

public protocol DDButtonDelegate {
    func buttonWasDragged(button: UIButton, centerOfButton: CGPoint)
    
    func buttonWasDropped(button: UIButton)
}

public class DDButton: UIButton {
    
    public var delegate: DDButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureActions(button: self)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGestureActions(button: self)
    }
    
    private func addGestureActions(button: UIButton) {
        addTarget(self, action: #selector(wasDragged(button:event:)), for: .touchDragInside)
        addTarget(self, action: #selector(wasDropped(button:event:)), for: .touchUpInside)
    }
    
    @objc func wasDragged(button: UIButton, event: UIEvent) {
        let touches: Set<UITouch> = event.touches(for: button)!
        let touch = touches.first! as UITouch
        let previousLocation: CGPoint = touch.previousLocation(in: button)
        let location: CGPoint = touch.location(in: button)
        let deltaX: CGFloat = location.x - previousLocation.x
        let deltaY: CGFloat = location.y - previousLocation.y
        let center = CGPoint(x: button.center.x + deltaX, y: button.center.y + deltaY)
        button.center = center
        handleDragged(button: button)
    }
    
    @objc func wasDropped(button: UIButton, event: UIEvent) {
        let touches: Set<UITouch> = event.touches(for: button)!
        let touch = touches.first! as UITouch
        if touch.phase == .ended {
            handleDropped(button: button)
        }
    }
    
    private func handleDragged(button: UIButton) {
        if delegate != nil {
            delegate!.buttonWasDragged(button: button, centerOfButton: button.center)
        }
    }
    
    private func handleDropped(button: UIButton) {
        if delegate != nil {
            delegate!.buttonWasDropped(button: button)
        }
    }

}
