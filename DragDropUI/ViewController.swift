//
//  ViewController.swift
//  DragDropUI
//
//  Created by Abdullah Selek on 06/11/2016.
//  Copyright © 2016 Abdullah Selek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DDViewDelegate {

    @IBOutlet weak var draggableView: DDView!

    override func viewDidLoad() {
        super.viewDidLoad()
        draggableView.ddDelegate = self
    }

    // MARK: DDViewDelegate

    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        print("Dragged Point : ", draggedPoint)
    }

    func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        print("Dropped Point : ", droppedPoint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

