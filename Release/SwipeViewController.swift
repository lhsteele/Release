//
//  SwipeViewController.swift
//  Release
//
//  Created by Lisa Steele on 10/4/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
    
    @IBOutlet var panToClose: InteractionPanToClose!
    @IBOutlet var userInput: UILabel!
    var textInputPassed = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userInput.text = textInputPassed
        userInput.backgroundColor = UIColor(patternImage: UIImage(named: "LabelBackground")!)
        
        panToClose.setGestureRecognizer()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
