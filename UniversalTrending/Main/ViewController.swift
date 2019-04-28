//
//  ViewController.swift
//  UniversalTrending
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 4/27/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit
import TwitterKit
import NaturalLanguageUnderstanding


class ViewController: UIViewController {
    
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: Any) {
        
        NSLog(text.text!)
        
        //check sentiment
        let username = "your-username-here"
        let password = "your-password-here"
        
        let version = "2018-03-16"
        
        let naturalLanguageUnderstanding = NaturalLanguageUnderstanding(version: version, username: username, password: password)
        let urlToAnalyze = text.text
        let sentimentOptions = SentimentOptions(document: true)
        let features = Features(sentiment: sentimentOptions)
        let parameters = AUParameter(features: features, url: urlToAnalyze)
        let failure = { (error: Error) in print (error) }
        naturalLanguageUnderstanding.analyze(parameters: parameters, failure: failure) {
            results in
            let score = results.sentiment?.document?.score
            var sentimentValue = "positive"
            if (score! < 0.0 ) {
                sentimentValue = "negative"
                
            } else if (score! == 0.0 ) {
                sentimentValue = "neutral"
            }
            
            NSLog("result: " + results.sentiment.debugDescription)
            DispatchQueue.main.async {
                self.textStatusLabel.text = "analyzed text score " + sentimentValue
            }
        }
        
        
        
        //setting feedback on sentiment
        label.text = text.text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //showTweet(id: "1122235471004880896")
    }
    @IBOutlet weak var aux: UIView!
    
    
    func showTweet(id: String) {
        var tweetView: TWTRTweetView?
        let client = TWTRAPIClient()
        
        
        client.loadTweet(withID: id) { (tweet, error) in
            if let t = tweet {
                if let tweetView = tweetView {
                    tweetView.configure(with: t)
                    self.aux.addSubview(tweetView)
                } else {
                    tweetView = TWTRTweetView(tweet: t, style: TWTRTweetViewStyle.regular)
                    self.aux.addSubview(tweetView!)
                }
            } else {
                print("Failed to load tweet \(error!.localizedDescription)")
            }
        }
    }
    
}

