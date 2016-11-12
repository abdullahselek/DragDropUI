//
//  DDButton.swift
//  DragDropUI
//
//  Created by Abdullah Selek on 05/11/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import UIKit

public protocol DDButtonDelegate {

    func buttonWasDragged(button: UIButton, droppedPoint: CGPoint)
    
    func buttonWasDropped(button: UIButton, droppedPoint: CGPoint)

}

public class DDButton: UIButton {
    
    public var delegate: DDButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureAction(button: self)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGestureAction(button: self)
    }
    
    internal func addGestureAction(button: UIButton) {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DDButton.handlePan(_:)))
        addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc internal func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: superview!)
        let button = gestureRecognizer.view as! UIButton
        button.center = CGPoint(x: button.center.x + translation.x, y: button.center.y + translation.y)
        if (gestureRecognizer.state == .changed) {
            handleTouchChanged(button: button, gestureRecognizer: gestureRecognizer)
        }
        gestureRecognizer.setTranslation(CGPoint(), in: superview!)
        if (gestureRecognizer.state == .ended) {
            handleTouchEnded(button: button, gestureRecognizer: gestureRecognizer)
        }
    }
    
    internal func handleTouchChanged(button: UIButton, gestureRecognizer: UIPanGestureRecognizer) {
        let point = gestureRecognizer.location(in: superview!)
        if delegate != nil {
            delegate!.buttonWasDragged(button: button, droppedPoint: point)
        }
    }
    
    internal func handleTouchEnded(button: UIButton, gestureRecognizer: UIPanGestureRecognizer) {
        let point = gestureRecognizer.location(in: superview!)
        if delegate != nil {
            delegate!.buttonWasDropped(button: button, droppedPoint: point)
        }
    }

}
