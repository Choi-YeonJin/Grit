//
//  loginViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var login: UIButton!
    
    
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRecognizer()
        
        IDField.layer.borderWidth = 0.5
        IDField.layer.borderColor = CGColor.init(red: 36/255, green: 36/255, blue: 36/255, alpha: 1.0)
        IDField.layer.cornerRadius = 10
        
        passwordField.layer.borderWidth = 0.5
        passwordField.layer.borderColor = CGColor.init(red: 36/255, green: 36/255, blue: 36/255, alpha: 1.0)
        passwordField.layer.cornerRadius = 10
    }
    @IBAction func loginBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    // Hide Topbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
    
}
