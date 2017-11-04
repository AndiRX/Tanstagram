//
//  ViewController.swift
//  Tanstagram
//
//  Created by Petr on 04.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var images: [UIImageView]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGestures()
        
    }
    
    //Set Gestures
    func pinchGesture(imageView: UIImageView) -> UIGestureRecognizer {
        
        return UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch))
    }
    
    func panGesture(imageView: UIImageView) -> UIPanGestureRecognizer{
        
        return UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan))
    }
    
    func rotationGesture(imageView: UIImageView) -> UIRotationGestureRecognizer {
        return UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotation))
        
    }
    
    //Handle Gestures
    func handlePinch(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
    }
    
    func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    func handleRotation(sender: UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform)!.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    //Create Gestures
    func createGestures() {
        
        for shape in images {
            let pinch = pinchGesture(imageView: shape)
            shape.addGestureRecognizer(pinch)
            
        }
        
    }
    
}

