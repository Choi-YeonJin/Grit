//
//  ViewController.swift
//  Girt
//
//  Created by cnsolution on 2020/12/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var logoTxt: UIImageView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var teacherlogin: UIButton!
    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.snp.makeConstraints{ make in
            make.center.equalTo(self.logoView)
        }
        
        logoTxt.snp.makeConstraints{ make in
            make.centerX.equalTo(self.logoView)
            make.top.equalTo(logo.snp.bottom).offset(8.9)
        }
        
        logoView.snp.makeConstraints{ make in
            make.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(self.view).multipliedBy(0.4)
        }
        
        buttonView.snp.makeConstraints{ make in
            make.top.equalTo(logoView.snp.bottom)
            make.bottom.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
        login.snp.makeConstraints{make in
            make.centerX.equalTo(buttonView)
            make.top.equalTo(buttonView)
            make.width.equalTo(290)
            make.height.equalTo(71)
        }
        
        register.snp.makeConstraints{ make in
            make.centerX.equalTo(buttonView)
            make.top.equalTo(login.snp.bottom).offset(3)
            make.width.equalTo(290)
            make.height.equalTo(71)
        }
        
        teacherlogin.snp.makeConstraints{ make in
            make.centerX.equalTo(buttonView)
            make.top.equalTo(register.snp.bottom).offset(155)
        }
        
        // 뒤로가기 모션 적용
        swipeRecognizer()
        
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "login") as! loginViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    @IBAction func registerBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "registerOne") as! registerOneViewController
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
                // 스와이프 시, 원하는 기능 구현.
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
}

