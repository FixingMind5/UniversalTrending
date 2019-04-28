//
//  Status.swift
//  UniversalTrending
//
//  Created by eyc on 27/04/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit

class Status: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func PositiveComent(_ sender: UIButton)
    {
        func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "StatusChangeSegue"
            {
                let VistaStatusChange = segue.destination as! StatusChange
                VistaStatusChange.Texto = "Positivo"
            }
        }
    }
    @IBAction func NeutralComent(_ sender: UIButton)
    {
        func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "StatusChangeSegue"
            {
                let VistaStatusChange = segue.destination as! StatusChange
                VistaStatusChange.Texto = "Neutral"
            }
        }
    }
    @IBAction func NegativeComent(_ sender: UIButton)
    {
        func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "StatusChangeSegue"
            {
                let VistaStatusChange = segue.destination as! StatusChange
                VistaStatusChange.Texto = "Negativo"
            }
        }
    }
}
