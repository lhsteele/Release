//
//  PopViewController.swift
//  Release
//
//  Created by Lisa Steele on 10/9/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {
    
    @IBOutlet var popView: UIView!
    @IBOutlet var userInput: UILabel!
    @IBOutlet var popButton: UIButton!
    var textInputPassed = String()
    
    var growLayer = CAShapeLayer()

    var tap = UITapGestureRecognizer()
    var tapIsOn = Bool()
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userInput.text = textInputPassed
        userInput.backgroundColor = UIColor(patternImage: UIImage(named: "LabelBackground")!)
        
        //initiateTap()
    }
    
    @IBAction func popAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0: self.popView.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
            case 1: self.popView.transform = CGAffineTransform(scaleX: 1.30, y: 1.30)
            case 2: self.popView.transform = CGAffineTransform(scaleX: 1.45, y: 1.45)
            case 3: self.popView.transform = CGAffineTransform(scaleX: 1.60, y: 1.60)
            case 4: self.popView.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
            case 5: self.popView.transform = CGAffineTransform(scaleX: 1.90, y: 1.90)
            case 6: self.popView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            default: break
            }
        })
        
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
        
    }
//    func initiateTap() {
//        tap.state = .began
//        tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        tap.numberOfTapsRequired = 3
//        popView.addGestureRecognizer(tap)
//        tapIsOn = false
//    }
    
//    func handleTap(gestureRecognizer: UIGestureRecognizer) {
//        popView.alpha = 0.75
//        UIView.animate(withDuration: 0.5) {
//            self.popView.alpha = 1.0
//        }
//    }
//
//    @objc func tapped() {
//        //This makes it grow to a certain size over a certain duration of time.
//        UIView.animate(withDuration: 5) {
////            self.popView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.popView.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
