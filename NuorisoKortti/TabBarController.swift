//
//  TabBarController.swift
//  NuorisoKortti
//
//  Created by Jurij Tokvin on 21.5.2023.
//

import Foundation
import UIKit
class TabBarController: UITabBarController
{
    var userName: String?
    var puhelin: String?
    func viewDiLoad()
    {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers else
        {
            return
        }
        
        for viewController in viewControllers {
            if let caardViewController = viewController as? CardViewNavigationController
            {
                if let cardViewConroller = caardViewController.viewControllers.first as? CardViewController
                {
                    cardViewConroller.puhelin = puhelin ?? "Zalupa Koshkina"
                }
            }
                
        }
    }
    
}
