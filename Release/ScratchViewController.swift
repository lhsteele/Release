//
//  ScratchViewController.swift
//  Release
//
//  Created by Lisa Steele on 10/3/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class ScratchViewController: UIViewController {

    @IBOutlet var scratchView: ScratchView!
    @IBOutlet var userInput: UILabel!
    @IBOutlet var backButton: UIButton!
    var textInputPassed = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userInput.text = textInputPassed
        userInput.backgroundColor = UIColor(patternImage: UIImage(named: "LabelBackground")!)
        
    }
    
    
    @IBAction func backToAction(_ sender: Any) {
        performSegue(withIdentifier: "SegueBackToInput", sender: backButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueBackToInput") {
            let pointer = segue.destination as! InputViewController
            pointer.textInputPassed = self.textInputPassed
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
