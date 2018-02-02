//
//  ViewController.swift
//  Allle
//
//  Created by Belzi on 09/01/2018.
//  Copyright © 2018 Belzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "ALLLEDROGO"
        loginField.placeholder = "Login"
        passwordField.placeholder = "Hasło"
        button.setTitle("Zaloguj", for: .normal)

    }

    @IBAction func buttonAction(_ sender: UIButton) {

        guard let login = loginField.text else {
            self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
            return
        }
        
        guard let password = passwordField.text else {
            self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
            return
        }
        
        let parameters = ["login": login, "password": password]
        let URLString:String = Constant.getUserURL + "?login=" + login + "&password=" + password
        
        guard let url = URL(string: URLString) else {
            self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
            return
        }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            guard let data = data else {
                    self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
                return
            }
            
            let parseResult: [String:AnyObject]!
            
            do{
                parseResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                print(parseResult)
            }catch{
                self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
                return
            }
            
            if(parseResult.count == 0){
                self.showAlert(title: "Błąd", message: "Niepoprawne dane logowania")
                return
            }else{
            
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "BaseView", bundle: nil)
                    guard let viewController = storyboard.instantiateInitialViewController() as? BaseView else{
                        return
                    }
                    self.present(viewController, animated: true, completion: nil)
                }
            }
            
        }.resume()
    }
    
    func showAlert(title: String, message:String){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "ok", style: .default){(action) -> Void in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction);
            self.present(alert, animated: true)
        }
    }
}

