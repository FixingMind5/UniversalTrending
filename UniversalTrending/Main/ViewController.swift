//
//  ViewController.swift
//  UniversalTrending
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 4/27/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit
import TwitterKit
import NaturalLanguageUnderstandingV1
import RestKit
import Starscream
import DiscoveryV1
import TextToSpeechV1
//import WatsonDeveloperCloud


class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //showTweet(id: "1122235471004880896")
    }
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        NSLog(textField.text!)
        
        //checking sentiment
        //"f2Ngff1n1t2fx7jPtp0bFv2uinjM7XNu6B-g_dP_D1JV"
        let version = "2019-04-28"
        let apiKey = "f2Ngff1n1t2fx7jPtp0bFv2uinjM7XNu6B-g_dP_D1JV"
        let naturalLanguage = NaturalLanguageUnderstanding(version: version, apiKey: apiKey)
        let urlAnalyze = textField.text!
        
        //let sentimentOptions = SentimentOptions(document: true)
        let features = Features(sentiment: SentimentOptions(document: true))
        
        //let faurile = { (error: Error) in print(error) }
        naturalLanguage.analyze(features: features, text: urlAnalyze) { (response, error) in
            if let error = error {
                print(error)
            }
            
            guard let results = response?.result else {
                print("Failed to analyze")
                return
            }
            
            if (results.sentiment?.document?.score)! < 0.0 {
                DispatchQueue.main.async {
                    self.statusLabel.text = "negative"
                }
            } else if (results.sentiment?.document?.score)! == 0.0 {
                DispatchQueue.main.async {
                    self.statusLabel.text = "neutral"
                }
            } else {
                DispatchQueue.main.async {
                    self.statusLabel.text = "positive"
                }
            }
        }
        
        //Checking feedback on sentiment
        //statusLabel.text = textField.text
    }
    
}

/*naturalLanguage.analyze(features: features) { (results, faurile) in
 let score = results?.result?.sentiment?.document?.score ?? 0.0
 var sentimentValue = "positive"
 
 if score < 0.0 {
 sentimentValue = "negative"
 } else if score == 0.0 {
 sentimentValue = "neutral"
 }
 
 NSLog("result: " + (results?.result?.sentiment.debugDescription)!)
 DispatchQueue.main.async {
 self.textField.text = "analyzed text score " + sentimentValue
 }
 }*/

//SHOWTWEET
func showTweet(id: String, my_view: UIView) {
    var tweetView: TWTRTweetView?
    let client = TWTRAPIClient()
    
    
    client.loadTweet(withID: id) { (tweet, error) in
        if let t = tweet {
            if let tweetView = tweetView {
                tweetView.configure(with: t)
                my_view.addSubview(tweetView)
            } else {
                tweetView = TWTRTweetView(tweet: t, style: TWTRTweetViewStyle.regular)
                my_view.addSubview(tweetView!)
            }
        } else {
            print("Failed to load tweet \(error!.localizedDescription)")
        }
    }
}

