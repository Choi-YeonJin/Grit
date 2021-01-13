//
//  StatusViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/24.
//

import UIKit
import MBCircularProgressBar

class StatusViewController: UIViewController {

    
    @IBOutlet weak var viewOne: gradient!
    @IBOutlet weak var viewTwo: twoGradient!
    @IBOutlet weak var viewThree: threeGradient!
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var circleBarNameView: UIView!
    var countFired: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        circleBarNameView.layer.cornerRadius = 30
        circleBarNameView.layer.masksToBounds = false
        
        circleBarNameView.layer.shadowColor = UIColor.black.cgColor
        circleBarNameView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        circleBarNameView.layer.shadowOpacity = 0.5
        circleBarNameView.layer.shadowRadius = 4.0
//        circleBarNameView.backgroundColor = .black
        centerView.backgroundColor = .clear
        pointView.layer.cornerRadius = self.pointView.frame.height / 2
        
        
        tabbar_start()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.countFired += 1
            
            DispatchQueue.main.async {
                self.viewOne.progress = min(0.03 * self.countFired, 0.5)
                self.viewTwo.progress = min(0.03 * self.countFired, 0.2)
                self.viewThree.progress = min(0.03 * self.countFired, 0.5)
                
                
                if self.viewOne.progress == 1 {
                    timer.invalidate()
                }
                if self.viewTwo.progress == 1 {
                    timer.invalidate()
                }
                if self.viewThree.progress == 1 {
                    timer.invalidate()
                }
            }
        }
        viewOne.backgroundColor = .clear
        viewTwo.backgroundColor = .clear
        viewThree.backgroundColor = .clear
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
    
}
