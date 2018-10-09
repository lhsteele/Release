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
        performSegue(withIdentifier: "SegueScratchToAction", sender: backButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueScratchToAction") {
            let pointer = segue.destination as! ActionViewController
            pointer.textInputPassed = self.textInputPassed
        }
    }
    
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
