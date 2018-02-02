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
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: 40))
        navBar.barTintColor = UIColor.white
        
        let navItem = UINavigationItem(title: "ALLLEDROGO")
        let logoutButton = UIButton(type: .system)
        logoutButton.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        logoutButton.addTarget(self, action: #selector(logout), for: UIControlEvents.touchUpInside )
        
        navItem.leftBarButtonItem = UIBarButtonItem(customView: logoutButton)
        
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
        
    }
    
  @objc func logout(){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let viewController = storyboard.instantiateInitialViewController() as? ViewController else{
        return
    }
    self.present(viewController, animated: true, completion: nil)    }
}
