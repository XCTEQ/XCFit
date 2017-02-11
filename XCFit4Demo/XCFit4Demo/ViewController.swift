//
//  ViewController.swift
//  XCFit4Demo
//
//  Created by Shashikant Jagtap on 11/02/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func ClickMeButton(_ sender: Any) {
        
        WelcomeTextField.text = "HELLO XCFIT"
    }
    
    
    @IBOutlet weak var WelcomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

