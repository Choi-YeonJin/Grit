//
//  NoticeViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/28.
//

import UIKit

class NoticeViewController: UIViewController {
    
    @IBOutlet weak var NoticeTableView: UITableView!
    var noticeTitle = ["오늘의 1 PICK: 레깅스","오늘의 2 PICK: 요가매트","오늘의 3 PICK: 텀블러","오늘의 4 PICK: 폼블러"]
    var noticeDate = ["2020.10.30","2020.10.30","2020.10.30","2020.10.30"]
    var noticeSubTitle = ["(광고) 단 하루! 선착순 5% 쿠폰 + UP TO 50% OFF","(광고) 단 하루! 선착순 5% 쿠폰 + UP TO 50% OFF","(광고) 단 하루! 선착순 5% 쿠폰 + UP TO 50% OFF","(광고) 단 하루! 선착순 5% 쿠폰 + UP TO 50% OFF"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbar_start()
        
        // TableView Remove line
        NoticeTableView.separatorStyle = .none
        NoticeTableView.showsVerticalScrollIndicator  = false
        
        NoticeTableView.delegate = self
        NoticeTableView.dataSource = self
        
    }
    
    func tabbar_start() {
        print("Tabbbar")
        let backbuttonIcon = UIImage(named: "BackBtn")
        let leftBarButton = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.done, target: self, action: #selector(NoticeViewController.myLeftSideBarButtonItemTapped(_:)))
        
        
        leftBarButton.image = backbuttonIcon
        navigationController?.navigationBar.tintColor = .black
        let toggle = UISwitch()
        toggle.onTintColor = UIColor.init(red: 181/255, green: 33/255, blue: 255/255, alpha: 1.0)
            toggle.addTarget(self, action: #selector(toggleValueChanged(_:)), for: .valueChanged)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: toggle)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.title = "알림센터"
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc func toggleValueChanged(_ toggle: UISwitch) {
        print("new value: \(toggle.isOn)")
    }
    
    //알람 버튼 클릭 이벤트
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    //뒤로가기 버튼 클릭 이벤트
    @objc func myLeftSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NoticeTableView.dequeueReusableCell(withIdentifier: "NoticeCell") as! NoticeTableViewCell
        
        cell.NoticeTitlelb.text = noticeTitle[indexPath.row]
        cell.NoticeDatelb.text = noticeDate[indexPath.row]
        cell.NoticeSubTitlelb.text = noticeSubTitle[indexPath.row]
        
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = .init(CGColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0))
        
        cell.tapBlock = {
            self.NoticeTableView.reloadData()
            self.noticeTitle.remove(at: indexPath.row)
            self.noticeDate.remove(at: indexPath.row)
            self.noticeSubTitle.remove(at: indexPath.row)
            self.NoticeTableView.beginUpdates()
            self.NoticeTableView.deleteRows(at: [indexPath], with: .automatic)
            self.NoticeTableView.endUpdates()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.NoticeTableView.reloadData()
            noticeTitle.remove(at: indexPath.row)
            noticeDate.remove(at: indexPath.row)
            noticeSubTitle.remove(at: indexPath.row)
            NoticeTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
