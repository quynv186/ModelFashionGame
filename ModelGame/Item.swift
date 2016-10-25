//
//  Item.swift
//  GameFashion
//
//  Created by admin on 10/25/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    func setup() {
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Item.onPan(panGesture:)))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(Item.onPinch(pinch:)))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(Item.onRotate(rotate:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    
    func onPan(panGesture : UIPanGestureRecognizer) {
        if (panGesture.state == .began || panGesture.state == .changed) {
            let point = panGesture.location(in: self.superview)
            self.center = point
        }
    }
    
    func onRotate(rotate : UIRotationGestureRecognizer) {
        if let view = rotate.view {
            view.transform = view.transform.rotated(by: rotate.rotation)
            rotate.rotation = 0
        }
    }
    
    func onPinch(pinch : UIPinchGestureRecognizer) {
        if let view = pinch.view {
            view.transform = view.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
}
