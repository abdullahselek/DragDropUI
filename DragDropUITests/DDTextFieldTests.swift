//
//  DDTextFieldTests.swift
//  DragDropUI
//
//  Copyright © 2017 Abdullah Selek. All rights reserved.
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

class DDTextFieldTests: QuickSpec {
    
    override func spec() {
        describe("DDTextField Tests", {
            var textField: DDTextField!
            var viewController: UIViewController!

            beforeEach {
                textField = DDTextField(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                viewController = UIViewController()
            }

            describe(".init(frame:)", {
                it("should initiate successfully", closure: {
                    expect(textField).notTo(beNil())
                })
            })

            describe(".didMoveToSuperview()", {
                context("when superview not nil", {
                    var gesturesCount = 0

                    beforeEach {
                        gesturesCount = (textField.gestureRecognizers?.count)!
                        viewController.view.addSubview(textField)
                        let _ = viewController.view
                    }

                    it("should have additional gesture recognizers", closure: {
                        expect(textField.gestureRecognizers?.count).to(equal(gesturesCount + 2))
                    })
                })
                context("when if superview nil", {
                    var gesturesCount = 0

                    beforeEach {
                        gesturesCount = (textField.gestureRecognizers?.count)!
                        textField.didMoveToSuperview()
                    }

                    it("should not have additioanl gesture recognizers", closure: {
                        expect(textField.gestureRecognizers?.count).to(equal(gesturesCount))
                    })
                })
            })
        })
    }
}
