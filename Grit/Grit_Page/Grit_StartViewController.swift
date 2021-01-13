//
//  Grit_StartViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/23.
//

import UIKit

class Grit_StartViewController: UIViewController {

    @IBOutlet weak var payBtn: UIButton!
    
    @IBOutlet weak var freeBtn: UIButton!
    @IBOutlet weak var tenBtn: UIButton!
    @IBOutlet weak var thirtyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultBtn(Btn: freeBtn)
        defaultBtn(Btn: tenBtn)
        defaultBtn(Btn: thirtyBtn)
        
        tabbar_start()
        
    }
    
    func tabbar_start() {
        print("Tabbbar")
        //self.setLeftAlignedNavigationItemTitle(text: "TRAINER", color: .black, margin: 20)
        let buttonIcon = UIImage(named: "bell")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(PlanViewController.myRightSideBarButtonItemTapped(_:)))
        //let leftBarButton = UIBarButtonItem(title: "bell", style:nil, target: self, action: nil)
        rightBarButton.image = buttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    //알람 버튼 클릭 이벤트
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    @IBAction func freeBtnClicked(_ sender: Any) {
        btnClicked(Btn: freeBtn)
        btnUnClicked(Btn: tenBtn)
        btnUnClicked(Btn: thirtyBtn)
        
    }
    @IBAction func tenBtnClicked(_ sender: Any) {
        btnClicked(Btn: tenBtn)
        btnUnClicked(Btn: freeBtn)
        btnUnClicked(Btn: thirtyBtn)
        
    }
    @IBAction func thirtyBtnClicked(_ sender: Any) {
        btnClicked(Btn: thirtyBtn)
        btnUnClicked(Btn: freeBtn)
        btnUnClicked(Btn: tenBtn)
        
    }
    
    func defaultBtn(Btn : UIButton) {
        Btn.layer.cornerRadius = 10
    }
    
    func btnClicked(Btn : UIButton) {
        Btn.layer.cornerRadius = 10
        Btn.backgroundColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1.0)
        Btn.setTitleColor(.white, for: .normal)
    }
    
    func btnUnClicked(Btn : UIButton) {
        Btn.layer.cornerRadius = 10
        Btn.backgroundColor = .white
        Btn.setTitleColor(.black, for: .normal)
    }
    
    
    @IBAction func payBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "remainingTime") as! Grit_remainingTimeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    
}
