//
//  Setting_MainViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/24.
//

import UIKit

class Setting_MainViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    var settingList: [Cell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        registerCell()
        
        // TableView Remove line
        settingTableView.separatorStyle = .none
        settingTableView.showsVerticalScrollIndicator  = false
        
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
    
    private func registerCell() {
        settingList = [
            Cell(subject: "상담사와 상담하기", type: .nextBtn),
            Cell(subject: "애플 캘린더 연당", type: .switchBtn),
            Cell(subject: "운동 스케쥴 연동", type: .switchBtn),
            Cell(subject: "식단", type: .nextBtn),
            Cell(subject: "체중변화", type: .nextBtn),
            Cell(subject: "운동 데이터 연동", type: .switchBtn),
            Cell(subject: "푸쉬 알림 설정", type: .switchBtn),
        ]
        settingTableView.reloadData()
    }

}


extension Setting_MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingCell = settingList[indexPath.row]
        switch settingCell.type {
        case .nextBtn:
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "nextCell") as! nextTableViewCell
            cell.selectionStyle = .none
            cell.set(settingCell:settingCell)
            return cell
        default:
            let cell = settingTableView.dequeueReusableCell(withIdentifier: "switchCell") as! switchTableViewCell
            cell.selectionStyle = .none
            cell.set(settingCell: settingCell)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "chat") as! ChatViewController
            self.navigationController?.pushViewController(firstVC, animated: true)
        case 3:
            let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MenuViewController
            self.navigationController?.pushViewController(firstVC, animated: true)
        case 4:
            let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "weightChange") as! weightChangeViewController
            self.navigationController?.pushViewController(firstVC, animated: true)
        default:
            print("selected is \(indexPath.row)")
        }
    }
    
}
