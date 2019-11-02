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

    // MARK: - Properties
    @IBOutlet weak var draggableView: DDView!

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        draggableView.ddDelegate = self
    }
}

// MARK: - DDViewDelegate
extension ViewController: DDViewDelegate {
    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        print(NSCoder.string(for: draggedPoint))
    }

    func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        print(NSCoder.string(for: droppedPoint))
    }
}
