//
//  BaseView.swift
//  Allle
//
//  Created by Belzi on 11/01/2018.
//  Copyright © 2018 Belzi. All rights reserved.
//

import UIKit

class BaseView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    private func setupNavigationBarItems(){
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let navItem = UINavigationItem(title: "ALLLEDROGO")
        let logoutButton = UIButton(type: .system)
        logoutButton.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        logoutButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        
        let logoutItem = UIBarButtonItem(customView: logoutButton)
        navItem.setLeftBarButton(logoutItem, animated: false)
        
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
        
    }
}
