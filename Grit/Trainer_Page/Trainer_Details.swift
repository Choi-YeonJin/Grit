//
//  Trainer_Details.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class Trainer_Details: UIViewController {
    
    @IBOutlet weak var TrainerPF: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TrainerAward: UILabel!
    @IBOutlet weak var Trainer_detail: UILabel!
    @IBOutlet weak var Review_table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TrainerTab")
        
        view.backgroundColor = .white
        Review_table.dataSource = self
        Review_table.delegate = self
        
        
        let buttonIcon = UIImage(named: "bell")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(Trainer_Details.myRightSideBarButtonItemTapped(_:)))
        //let leftBarButton = UIBarButtonItem(title: "bell", style:nil, target: self, action: nil)
        
        rightBarButton.image = buttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        
        
        setupview()
        
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)  {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    func setupview(){
        var attributedString = NSMutableAttributedString(string: TitleLabel.text!)
        
        _ = attributedString.length
        
        attributedString.addAttributes([.foregroundColor: UIColor.purple,.font: UIFont.systemFont(ofSize: 20, weight: .light)], range: NSRange(location: 0, length: 7))
        
        attributedString.addAttributes([.foregroundColor: UIColor.purple,.font: UIFont.systemFont(ofSize: 20, weight: .bold)], range: NSRange(location: 8, length: 5))
        
        
        TitleLabel.attributedText = attributedString
        TitleLabel.textColor = UIColor.purple
        
        attributedString = NSMutableAttributedString(string: TrainerAward.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 12
        attributedString.addAttributes([.foregroundColor: UIColor.gray,.font: UIFont.systemFont(ofSize: 12, weight: .regular)], range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        TrainerAward.attributedText = attributedString
        
        attributedString = NSMutableAttributedString(string: Trainer_detail.text!)
        paragraphStyle.lineSpacing = 4
        attributedString.addAttributes([.foregroundColor: UIColor.gray,.font: UIFont.systemFont(ofSize: 10, weight: .regular)], range: NSMakeRange(0, attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        Trainer_detail.attributedText = attributedString
        
    }
    
}

extension Trainer_Details: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Review_table.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        
        cell.review_name.text = "너무나도 좋았습니다"
        cell.review_content.text = "청담동 피트니스 근무 경력 10년 연예인 김XX, 오XX 퍼스널 트레이너\n자신감은 떨이지지만 희망을\n 잃지 않는 사람들에게 뜨거운 호응을 얻고 있는 스타 트레이너"
        cell.reviewer.text = "20.12.10 수강생 김00"
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 8
        cell.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
}
