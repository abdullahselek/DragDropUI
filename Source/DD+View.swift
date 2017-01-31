//
//  DDView.swift
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

import UIKit

public extension DDProtocol where Self: UIView {

    public var view: UIView { get { return self } }
    public var parentView: UIView? { get { return self.view.superview } }

    func registerGesture() {
        let panGesture = UIPanGestureRecognizer()
        panGesture.handler = { gesture in
            self.handlePan(panGesture: gesture as! UIPanGestureRecognizer)
        }

        self.view.addGestureRecognizer(panGesture)

        let pressGesture = UILongPressGestureRecognizer()
        pressGesture.minimumPressDuration = 0.001
        pressGesture.handler = { gesture in
            self.didPress(pressGesture: gesture as! UILongPressGestureRecognizer)
        }

        self.view.addGestureRecognizer(pressGesture)
    }

    func removeGesture() {
        guard self.gestureRecognizers != nil else {
            return
        }

        let _ = self.gestureRecognizers!
            .filter({ $0.delegate is UIGestureRecognizer.DDGestureDelegate })
            .map({ self.removeGestureRecognizer($0) })
    }

    func didPress(pressGesture: UILongPressGestureRecognizer) {
        switch pressGesture.state {
        case .began:
            self.draggedPoint = self.view.center
            self.parentView?.bringSubview(toFront: self.view)
            break
        case .cancelled, .ended, .failed:
            if self.ddDelegate != nil {
                self.ddDelegate!.viewWasDropped(view: self, droppedPoint: self.draggedPoint)
            }
            break
        default:
            break
        }
    }

    func handlePan(panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: self.parentView)
        self.view.center = CGPoint(x: self.draggedPoint.x + translation.x, y: self.draggedPoint.y + translation.y)
        if self.ddDelegate != nil {
            self.ddDelegate!.viewWasDragged(view: self, draggedPoint: self.view.center)
        }
    }
}
