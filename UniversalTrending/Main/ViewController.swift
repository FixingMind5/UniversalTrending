//
//  ViewController.swift
//  UniversalTrending
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 4/27/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        showTweet(id: "1122235471004880896")
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

