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
    
    var textInputPassed = String() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInput.text = textInputPassed
        userInput.backgroundColor = UIColor(patternImage: UIImage(named: "LabelBackground")!)
        
        print (textInputPassed)
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
