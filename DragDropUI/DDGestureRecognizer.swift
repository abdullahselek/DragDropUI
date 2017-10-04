//
//  DDGestureRecognizer.swift
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

import UIKit

extension UIGestureRecognizer {

    internal class DDClosureWrapper: NSObject {
        internal let handler: (UIGestureRecognizer) -> Void

        internal init(handler: @escaping (UIGestureRecognizer) -> Void) {
            self.handler = handler
        }
    }

    public class DDGestureDelegate: NSObject, UIGestureRecognizerDelegate {
        static var delegateKey: String = "key"
        @objc public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return gestureRecognizer.delegate is DDGestureDelegate && otherGestureRecognizer.delegate is DDGestureDelegate
        }

        @objc public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
            return true
        }

        @objc public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }

    private var multiDelegate: DDGestureDelegate {
        get {
            return objc_getAssociatedObject(self, &DDGestureDelegate.delegateKey) as! DDGestureDelegate
        }
        set {
            objc_setAssociatedObject(self, &DDGestureDelegate.delegateKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private static var handlerKey: String = "handlerKey"
    var handler: ((UIGestureRecognizer) -> Void)? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &UIGestureRecognizer.handlerKey) as? DDClosureWrapper else {
                return nil
            }
            return closureWrapper.handler
        }
        set {
            guard let gestureHandler = newValue else {
                return
            }
            self.addTarget(self, action: #selector(UIGestureRecognizer.handleAction))
            self.multiDelegate = DDGestureDelegate()
            self.delegate = self.multiDelegate
            objc_setAssociatedObject(self, &UIGestureRecognizer.handlerKey, DDClosureWrapper(handler: gestureHandler), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    @objc public func handleAction() {
        guard let handler = self.handler else {
            return
        }
        handler(self)
    }

}
