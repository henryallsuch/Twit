//
//  ViewController.swift
//  Twit
//
//  Created by Saoirse on 02/11/2018.
//  Copyright © 2018 AgilePixel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var console: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logToView("")
        logToView("View Did Load")
       
    }

    func logToView(_ message :String, clearAllText: Bool? = nil , newLine: Bool? = true){
        
        //always update UI in main thread!
        DispatchQueue.main.async {
            
            
            self.console.text.append(message);
            if(newLine != nil){
                self.console.text.append("\n");
            }
            
            let range = NSMakeRange(self.console.text.count - 1, 0)
            self.console.scrollRangeToVisible(range)
            
            print(message)
            
        }
    }
}

