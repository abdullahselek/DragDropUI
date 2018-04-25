//
//  ViewController.swift
//  Sample
//
//  Created by Abdullah Selek on 25.04.18.
//  Copyright © 2018 Abdullah Selek. All rights reserved.
//

import UIKit
import DragDropUI

class ViewController: UIViewController {

    @IBOutlet weak var draggableView: DDView!

    override func viewDidLoad() {
        super.viewDidLoad()
        draggableView.ddDelegate = self
    }

}

extension ViewController: DDViewDelegate {

    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        print(NSStringFromCGPoint(draggedPoint))
    }

    func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        print(NSStringFromCGPoint(droppedPoint))
    }

}
