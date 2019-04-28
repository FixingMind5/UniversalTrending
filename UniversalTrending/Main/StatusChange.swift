//
//  StatusChange.swift
//  UniversalTrending
//
//  Created by eyc on 27/04/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit

class StatusChange: UIViewController
{
    @IBOutlet weak var TextoLabel: UILabel!
    var Texto:String = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        TextoLabel.text = Texto
    }
}
