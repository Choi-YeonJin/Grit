//
//  Trainer_Details.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class Trainer_Details: UIViewController {

    @IBOutlet weak var review_table: UITableView!
    
    let contentview = UIView() // safeAreaLayoutGuide
    
    let topView = UIView() // image와 trainerLb 위 여백 주기 위한 뷰
    
    let trainerDetailView = UIView() // imageView + infoView
    let trainerImageView = UIView() // trainerPF
    let trainerInfoView = UIView() // trainerNameLb + secondView + thirdView
    
    let trainerPF : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trainerDetail-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let trainerNameLb : UILabel = {
        let label = UILabel()
        label.text = "Kimberly Noel Kardashian \n( 킴카다시안 )"
        label.textColor = #colorLiteral(red: 0.6588235294, green: 0.06666666667, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
//        label.minimumScaleFactor = 0.2
        return label
    }()
    
    let secondView = UIView() // Carrer + SNSView
    
    let trainerCarrer : UILabel = {
        let carrerContent = ["2020.04 jh" , "2020.05 요가 강사","2020.07 adfdadsf"]
        
        let carrerText = carrerContent.joined(separator: "\n")
        
        let label = UILabel()
        label.text = carrerText
        label.textColor = #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        let attrString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        
        return label
    }()
    
    let SNSView = UIView() // facebookSNSView + instagramSNSView
    let facebookSNSView = UIView() // icon + accountName
    let instagramSNSView = UIView() // icon + accountName
    
    let facebookIconView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "facebook")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let facebookAccountName : UILabel = {
        let label = UILabel()
        label.text = "@Jenny"
        label.textColor = #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 9, weight: .bold)
        return label
    }()
    
    let instagramIconView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "172")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let instagramAccountName : UILabel = {
        let label = UILabel()
        label.text = "@Jenny"
        label.textColor = #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 9, weight: .bold)
        return label
    }()
    
    let thirdView = UIView() // trainerInfoLine + info
    
    let trainerInfoLineView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6588235294, green: 0.06666666667, blue: 1, alpha: 1)
        return view
    }()
    
    let trainerInfo : UILabel = {
        let label = UILabel()
        label.text = "청담동 피트니스 근무 경력 10년 연예인 김XX, 오XX 퍼스널 트레이너 자신감은 떨이지지만 희망을 잃지 않는 사람들에게 뜨거운 호응을 얻고 있는 스타 트레이너"
        label.textColor = #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 60, weight: .light)
        label.adjustsFontSizeToFitWidth = true
//        let attrString = NSMutableAttributedString(string: label.text!)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 10
//        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
//        label.attributedText = attrString
        return label
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let classReviewView = UIView() // reviewTitle + tableView
    let reviewTitleLb : UILabel = {
        let label = UILabel()
        label.text = "수강 후기"
        label.textColor = #colorLiteral(red: 0.6588235294, green: 0.06666666667, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(contentview)
        
        [topView,trainerDetailView, lineView, classReviewView].enumerated().forEach {
            contentview.addSubview($1)
        }
        
        [trainerImageView, trainerInfoView].enumerated().forEach {
            trainerDetailView.addSubview($1)
        }
        trainerImageView.addSubview(trainerPF)
        
        [trainerNameLb, secondView, thirdView].enumerated().forEach {
            trainerInfoView.addSubview($1)
        }
        
        [trainerCarrer, SNSView].enumerated().forEach {
            secondView.addSubview($1)
        }
        
        [facebookSNSView, instagramSNSView].enumerated().forEach {
            SNSView.addSubview($1)
        }
        
        [facebookIconView, facebookAccountName].enumerated().forEach {
            facebookSNSView.addSubview($1)
        }
        
        [instagramIconView, instagramAccountName].enumerated().forEach {
            instagramSNSView.addSubview($1)
        }
        
        [trainerInfoLineView, trainerInfo].enumerated().forEach {
            thirdView.addSubview($1)
        }
        
        [reviewTitleLb, review_table].enumerated().forEach {
            classReviewView.addSubview($1)
        }
        
        contentview.snp.makeConstraints{
            make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        topView.snp.makeConstraints{
            make in
            make.top.leading.trailing.equalTo(contentview)
            make.width.equalTo(contentview.snp.width)
            make.height.equalTo(contentview.snp.height).multipliedBy(0.05)
        }
        
        trainerDetailView.snp.makeConstraints {
            make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalTo(self.contentview)
            make.height.equalTo(contentview.snp.height).multipliedBy(0.45)
        }
        
        trainerPF.snp.makeConstraints{
            make in
            make.edges.equalTo(trainerImageView)
        }
        
        trainerImageView.snp.makeConstraints {
            make in
//            make.center.equalTo(self.trainerDetailView)
            make.top.leading.equalTo(self.trainerDetailView)
            make.width.equalTo(self.trainerDetailView.snp.width).multipliedBy(0.5)
            make.height.equalTo(trainerDetailView.snp.height).multipliedBy(0.9)
        }

        trainerInfoView.snp.makeConstraints {
            make in
//            make.center.equalTo(self.trainerDetailView)
            make.top.trailing.equalTo(trainerDetailView)
            make.width.equalTo(self.trainerDetailView.snp.width).multipliedBy(0.5)
            make.height.equalTo(trainerDetailView.snp.height)
//            make.height.equalTo(trainerPF.snp.width / 0.618)
       }
        
        trainerNameLb.snp.makeConstraints{
            make in
            make.width.equalTo(trainerInfoView)
            make.top.equalTo(trainerInfoView)
            make.leading.equalTo(trainerInfoView)
//            make.height.equalTo(trainerInfoView).dividedBy(3.5)
        }

        secondView.snp.makeConstraints{
            make in
            make.top.equalTo(trainerNameLb.snp.bottom)
            make.leading.trailing.equalTo(trainerInfoView)
            make.height.equalTo(trainerInfoView).multipliedBy(0.4)
        }

        trainerCarrer.snp.makeConstraints{
            make in
            make.top.leading.equalTo(secondView)
            make.height.equalTo(secondView).multipliedBy(0.65)
            make.width.equalTo(secondView.snp.width)
        }

        SNSView.snp.makeConstraints{
            make in
            make.top.equalTo(trainerCarrer.snp.bottom).offset(2)
            make.leading.bottom.equalTo(secondView)
            make.height.equalTo(secondView).multipliedBy(0.35)
        }

        facebookSNSView.snp.makeConstraints{
            make in
            make.centerY.equalTo(SNSView)
            make.top.leading.equalTo(SNSView)
        }

        facebookIconView.snp.makeConstraints{
            make in
            make.centerY.equalTo(facebookSNSView)
            make.leading.top.equalTo(facebookSNSView)
        }

        facebookAccountName.snp.makeConstraints{
            make in
            make.leading.equalTo(facebookIconView.snp.trailing).offset(2)
            make.centerY.equalTo(facebookSNSView)
        }

        instagramSNSView.snp.makeConstraints{
            make in
            make.centerY.equalTo(SNSView)
            make.top.equalTo(SNSView)
            make.leading.equalTo(facebookAccountName.snp.trailing).offset(3)
        }

        instagramIconView.snp.makeConstraints{
            make in
            make.centerY.equalTo(instagramSNSView)
            make.leading.top.equalTo(instagramSNSView)
        }

        instagramAccountName.snp.makeConstraints{
            make in
            make.leading.equalTo(instagramIconView.snp.trailing).offset(2)
            make.centerY.equalTo(instagramSNSView)
        }

        thirdView.snp.makeConstraints{
            make in
            make.top.equalTo(secondView.snp.bottom)
            make.leading.trailing.equalTo(trainerInfoView)
            make.height.equalTo(trainerInfoView).multipliedBy(0.4)
        }

        trainerInfoLineView.snp.makeConstraints{
            make in
            make.top.leading.equalTo(thirdView)
            make.height.equalTo(5)
            make.width.equalTo(facebookIconView.snp.width)
        }

        trainerInfo.snp.makeConstraints{
            make in
            make.top.equalTo(trainerInfoLineView.snp.bottom).offset(3)
            make.leading.equalTo(thirdView)
            make.width.equalTo(thirdView.snp.width)
            make.height.equalTo(thirdView.snp.height).multipliedBy(0.6)
        }
        
        // 전체 페이지 가운데 Line
        lineView.snp.makeConstraints{
            make in
            make.center.equalTo(self.contentview)
            make.height.equalTo(1)
            make.width.equalTo(contentview.snp.width)
        }
        
        // 수강후기View
        classReviewView.snp.makeConstraints {
            make in
            make.bottom.leading.trailing.equalTo(self.contentview)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(2)
        }
        
        reviewTitleLb.snp.makeConstraints{
            make in
            make.top.leading.equalTo(classReviewView).offset(20)
        }
        
        review_table.snp.makeConstraints{
            make in
            make.top.equalTo(reviewTitleLb.snp.bottom).offset(10)
            make.leading.equalTo(classReviewView).offset(10)
            make.trailing.equalTo(classReviewView).inset(10)
            make.height.equalTo(classReviewView.snp.height)
        }
        
        view.backgroundColor = .white
        review_table.dataSource = self
        review_table.delegate = self
        
        let buttonIcon = UIImage(named: "bell")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(Trainer_Details.myRightSideBarButtonItemTapped(_:)))
        
        rightBarButton.image = buttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)  {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
}

extension Trainer_Details: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
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
        let cell = review_table.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        
        cell.review_name.text = "너무나도 좋았습니다"
        cell.review_content.text = "청담동 피트니스 근무 경력 10년 연예인 김XX, 오XX 퍼스널 트레이너\n자신감은 떨이지지만 희망을\n 잃지 않는 사람들에게 뜨거운 호응을 얻고 있는 스타 트레이너"
        cell.reviewer.text = "20.12.10 수강생 김00"
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 8
        cell.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        cell.cellView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
                
        cell.review_name.snp.makeConstraints{
            make in
            make.leading.top.equalTo(cell.cellView)
            make.height.equalTo(cell.cellView.snp.height).multipliedBy(0.7)
        }
        
        cell.review_content.snp.makeConstraints{
            make in
            make.leading.equalTo(cell.cellView)
            make.top.equalTo(cell.review_name.snp.bottom)
            make.height.equalTo(cell.cellView.snp.height).multipliedBy(0.7)
        }
        
        cell.reviewer.snp.makeConstraints{
            make in
            make.bottom.trailing.equalTo(cell.cellView)
        }
        
        cell.cellView.snp.makeConstraints{
            make in
            make.height.equalTo(cell.snp.height).multipliedBy(0.8)
            make.width.equalTo(cell.snp.width).multipliedBy(0.95)
            make.center.equalTo(cell)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
}
