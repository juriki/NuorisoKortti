//
//  LoginNewViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 5.1.2023.
//

import UIKit
import SwiftUI


class LoginNewViewController: UIViewController {
    private var username = ""
    private var pasword = ""


    
    @IBOutlet weak var logintxt: UITextField!
    var loggedIn: Bool = false
    @IBOutlet weak var passworTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        }
    
    func kirjaudusisän(buton: UIButton)
    {
        guard let url = URL(string: "http://localhost:8888/test/index3.php?login=\(logintxt.text!)&\(passworTxt.text!)") else{return}
        
        URLSession.shared.dataTask(with: url){ [self]data, response, error in
            if error != nil{
                return
            }

            guard let data = data else {return}

            do
            {
                let users = try JSONDecoder().decode([User].self, from: data)
                self.username = (users.first?.KayttajaId)!
                self.loggedIn = true
            }
            catch
            {
                print("******************WRONG PASSWORD *********************")
                return
            }
           
        }.resume()
    }
    

    @IBAction func nappiLogin(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.username = logintxt.text!
        vc.password = passworTxt.text!
        kirjaudusisän(buton: sender)
        
        if(loggedIn)
        {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
