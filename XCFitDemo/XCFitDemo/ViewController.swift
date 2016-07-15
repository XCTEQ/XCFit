//
//  ViewController.swift
//  XCFitDemo
//
//  Created by Shashikant Jagtap on 15/07/2016.
//  Copyright © 2016 Shashikant Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Hello: UILabel!
    @IBAction func ClickMe(sender: AnyObject) {
        
        
        Hello.text = "WelCome"
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

