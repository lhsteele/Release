//
//  InteractionPanToClose.swift
//  Release
//
//  Created by Lisa Steele on 10/4/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class InteractionPanToClose: UIPercentDrivenInteractiveTransition {
    
    @IBOutlet var visualEffectView: UIVisualEffectView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var viewController: SwipeViewController!
    var gestureRecognizer: UIPanGestureRecognizer!
    
    func setGestureRecognizer() {
        gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handle))
        view.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.delegate = self
    }
    
    @objc func handle(_ gesture: UIPanGestureRecognizer) {
        
        let threshold: CGFloat = 100
        let translation = gesture.translation(in: viewController.view)
        
        switch gesture.state {
        case .changed:
            //the animation will update
            if translation.y > 0 {
                let percentComplete = translation.y / 2000
                update(percentComplete)
            }
        case .ended:
            //the animation will finish or cancel
            if translation.y > threshold { finish() }
            else { cancel()}
        default: break
        }
    }
    
    
    
    
    override func update(_ percentComplete: CGFloat) {
        visualEffectView.alpha = 1-percentComplete
        
        let translation = gestureRecognizer.translation(in: viewController.view)
        let translationY = CGAffineTransform(translationX: 0, y: translation.y)
        let scale = CGAffineTransform(scaleX: 1-percentComplete, y: 1-percentComplete)
        let origin = gestureRecognizer.location(in: viewController.view)
        let frameWidth = viewController.view.frame.width
        let originX = origin.x / frameWidth
        let degrees = 150 - originX * 300
        let rotationAngle = percentComplete * degrees * CGFloat.pi / 180.0
        let rotation = CGAffineTransform(rotationAngle: rotationAngle)
        
        let transform = translationY.concatenating(scale).concatenating(rotation)
        
        view.transform = transform
    }
    
    override func cancel() {
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.6) {
            self.visualEffectView.alpha = 1
            self.view.transform = .identity
        }
        animator.startAnimation()
    }
    
    override func finish() {
        let animator = UIViewPropertyAnimator(duration: 0.9, dampingRatio: 0.9) {
            self.view.frame.origin.y += 200
            self.visualEffectView.effect = nil
            self.viewController.dismiss(animated: true)
        }
        animator.startAnimation()
    }
    
    
}

extension InteractionPanToClose: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

