//
//  ViewController.swift
//  XCFit-Example
//
//  Created by Shashikant Jagtap on 04/10/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeText: UITextField!
    @IBAction func Hello(_ sender: Any) {
        welcomeText.text = "Welcome"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

