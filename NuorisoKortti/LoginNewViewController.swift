//
//  LoginNewViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 5.1.2023.
//

import UIKit

class LoginNewViewController: UIViewController {

    @IBOutlet weak var logintxt: UITextField!
    
    @IBOutlet weak var passworTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nappiLogin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.username = logintxt.text!
        vc.password = passworTxt.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
