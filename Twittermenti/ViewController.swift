//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let swifter = Swifter(consumerKey: "FEAZwnygkUcFqppAG1oaTOk2J", consumerSecret: "4HQxlYjPcagwDHxrQ9hB7RTDmlawxPl03DpHQmZvWpxLYNZd3R")

    
    let sentimentClassifier = TweetSentimentClassifier()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        swifter.searchTweet(using: "#blessed", lang: "en", count: 100, tweetMode: .extended, success: { (results, metadata) in
            
            var tweets = [TweetSentimentClassifierInput]()
            
            
            for i in 0..<100 {
                if let tweet = results[i]["full_text"].string {
                    tweets.append(TweetSentimentClassifierInput(text: tweet))
                }
            }
            do {
                
                var sentimentScore = 0
                let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                
                for prediction in predictions {
                    if prediction.label == "Pos" {
                        sentimentScore += 1
                    } else if prediction.label == "Neg" {
                        sentimentScore -= 1
                    }
                }
                
                print(sentimentScore)

            } catch {
                print(error)
            }

            
        }) { (error) in
            print(error)
        }
    }

    @IBAction func predictPressed(_ sender: Any) {
    
    
    }
    
}

