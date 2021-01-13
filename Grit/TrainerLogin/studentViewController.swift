//
//  studentViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/30.
//

import UIKit

class studentViewController: UIViewController {

    @IBOutlet weak var user_Std: UIView!
    @IBOutlet weak var user_status: UIView!
    @IBOutlet weak var user_name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar_start()
        
        
        
        user_Std.layer.borderWidth = 0.5
        user_Std.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
        
        let bannerString = NSMutableAttributedString(string: user_name.text!)
        bannerString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: (user_name.text! as NSString).range(of: "뉴요커"))
        user_name.attributedText = bannerString
    }
    

    func tabbar_start() {
        print("Tabbbar")
       //self.setLeftAlignedNavigationItemTitle(text: "TRAINER", color: .black, margin: 20)
        
        
        let buttonIcon = UIImage(named: "bell")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(studentViewController.myRightSideBarButtonItemTapped(_:)))
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
}
