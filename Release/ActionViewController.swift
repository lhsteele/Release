//
//  ActionViewController.swift
//  Release
//
//  Created by Lisa Steele on 9/26/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    
    @IBOutlet var userInput: UILabel!
    @IBOutlet var scratchButton: UIButton!
    @IBOutlet var popButton: UIButton!
    @IBOutlet var swipeButton: UIButton!
    
    var textInputPassed = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInput.text = textInputPassed
        userInput.backgroundColor = UIColor(patternImage: UIImage(named: "LabelBackground")!)
        
        print (textInputPassed)
    }
    
    @IBAction func scratchButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "SegueToScratch", sender: scratchButton)
    }
    
    @IBAction func swipeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "SegueToSwipe", sender: swipeButton)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueToScratch") {
            let pointer = segue.destination as! ScratchViewController
            pointer.textInputPassed = self.textInputPassed
        }
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
