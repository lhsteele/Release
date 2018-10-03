//
//  InputViewController.swift
//  Release
//
//  Created by Lisa Steele on 9/26/18.
//  Copyright © 2018 Lisa Steele. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var balloonImage: UIImageView!
    @IBOutlet var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        inputTextView.layer.cornerRadius = 150
//        inputTextView.clipsToBounds = true
//        inputTextView.adjustsFontForContentSizeCategory = true 
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
