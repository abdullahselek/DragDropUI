//
//  DDImageViewTests.swift
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

class DDImageViewTests: QuickSpec {
    
    override func spec() {
        describe("DDImageView Tests", {
            var imageView: DDImageView!
            var viewController: UIViewController!

            beforeEach {
                imageView = DDImageView(frame:  CGRect(x: 0.0, y: 0.0, width: 200.0, height: 40.0))
                viewController = UIViewController()
            }

            describe(".init(frame:)", {
                it("should initiate successfully", closure: {
                    expect(imageView).notTo(beNil())
                })
            })

            describe(".didMoveToSuperview()", {
                context("when superview not nil", {
                    beforeEach {
                        viewController.view.addSubview(imageView)
                        let _ = viewController.view
                    }

                    it("should have gesture recognizers", closure: {
                        expect(imageView.gestureRecognizers).to(haveCount(2))
                    })
                })

                context("when superview nil", {
                    beforeEach {
                        imageView.didMoveToSuperview()
                    }

                    it("should not have gesture recognizers", closure: {
                        expect(imageView.gestureRecognizers).to(beNil())
                    })
                })
            })
        })
    }
}
