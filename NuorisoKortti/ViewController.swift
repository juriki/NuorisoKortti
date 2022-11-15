//
//  ViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var iloinenAskolaa: UIImageView!
    

    
    
    func kirjaudu(img: UIImageView, button: UIButton)
    {
        if button.currentTitle == "Kirjaudu"
        {
            button.setTitle("Ulos", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.7168534398, green: 0.06697402149, blue: 0.2032336891, alpha: 1)
            img.isHidden = false
        }
        else
        {
            button.setTitle("Kirjaudu", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.2070960402, green: 0.7793012261, blue: 0.3491066098, alpha: 1)
            img.isHidden = true
            
        }
    }
    
    @IBAction func Kirjaudu(_ sender: UIButton)
    {
        kirjaudu(img: iloinenAskolaa, button: sender)
    }
    
}

