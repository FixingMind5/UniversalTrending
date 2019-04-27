//
//  GetTweetsViewController.swift
//  UniversalTrending
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 4/27/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit
import TwitterKit

class GetTweetsViewController: UIViewController {
    @IBOutlet weak var showTweet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var tweetView: TWTRTweetView?
        let client = TWTRAPIClient()
        
        client.loadTweet(withID: "1122235471004880896") { (tweet, error) in
            if let t = tweet {
                if let tweetView = tweetView {
                    tweetView.configure(with: t)
                } else {
                    tweetView = TWTRTweetView(tweet: t, style: TWTRTweetViewStyle.regular)
                }
            } else {
                print("Failed to load tweet \(error!.localizedDescription)")
            }
        }
        
        self.view.addSubview(tweetView!)
    }
    
}
