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
    var textInputPassed = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.delegate = self
        inputTextView.returnKeyType = .done
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SegueToAction") {
            //pass the textfield input to the next view
            let pointer = segue.destination as! ActionViewController
            pointer.textInputPassed = self.textInputPassed
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputTextView.text = nil
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == self.inputTextView {
            self.textInputPassed = inputTextView.text
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            inputTextView.resignFirstResponder()
            return false
        }
        return true
    }

}
