//
//  ScratchView.swift
//  Release
//
//  Created by Lisa Steele on 10/3/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class ScratchView: UIView {
    
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        
        lineColor = UIColor.white
        lineWidth = 50
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        scratchLayer()
    }
    
    func scratchLayer() {
        let scratchLayer = CAShapeLayer()
        scratchLayer.path = path.cgPath
        scratchLayer.strokeColor = lineColor.cgColor
        scratchLayer.lineWidth = lineWidth
        scratchLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(scratchLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas() {
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
