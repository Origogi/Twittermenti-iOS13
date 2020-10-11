//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let swifter = Swifter(consumerKey: "FEAZwnygkUcFqppAG1oaTOk2J", consumerSecret: "4HQxlYjPcagwDHxrQ9hB7RTDmlawxPl03DpHQmZvWpxLYNZd3R")


    override func viewDidLoad() {
        super.viewDidLoad()
        
        swifter.searchTweet(using: "@Apple", success: { (results, metadata) in
            print(results)
        }) { (error) in
            print(error)
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

