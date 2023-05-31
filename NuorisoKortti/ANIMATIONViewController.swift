//
//  ANIMATIONViewController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 30.5.2023.
//

import UIKit

class ANIMATIONViewController: UIViewController {
    
    
    @IBOutlet weak var LogoMOve: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //   Funktio sueraa näytön kosketusta
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        if touch.view == LogoMOve
        {
            rotate(view: LogoMOve, to: 23.5)
            print("You tou Logo")
        }else
        {
            print("Touch")
        }
    }
   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        rotate(view: LogoMOve, to: 0.0)
    }
    
    func rotate(view: UIView, to angle: Double)
    {
        UIView.animate(withDuration: 0.5)
        {
            view.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
}
