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
    
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userInput.text = textInputPassed
        userInput.backgroundColor = UIColor(patternImage: UIImage(named: "LabelBackground")!)
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
            default:self.popped()
                //self.popView.removeFromSuperview()
            }
        })
        
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
        
    }

    func popped() {
        self.popView.removeFromSuperview()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.performSegue(withIdentifier: "SegueBackToInput", sender: self.popButton)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
