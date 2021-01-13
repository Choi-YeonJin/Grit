//
//  Trainer_Main.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit
import SnapKit

class Trainer_Main: UIViewController {
    
    var imagearray = [UIImage(named: "ex_1"),UIImage(named: "trpf_3"),UIImage(named: "ex_1"),UIImage(named: "trpf_3"),UIImage(named: "ex_1"),UIImage(named: "trpf_3"),UIImage(named: "ex_1"),UIImage(named: "trpf_3")]
    
    @IBOutlet weak var btn_Detail: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var banner: UITextView!
    @IBOutlet weak var btn_MyT: UIButton!
    @IBOutlet weak var tr_info: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabbar_start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setBanner()
        addCollectionView()
        collectionView.backgroundColor = .clear
        self.view.backgroundColor = .white
        
    }
    
    func setupView(){
        btn_Detail.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        
        btn_Detail.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(tr_info.snp.bottom).offset(-16)
            make.width.equalTo(120)
            make.height.equalTo(48)
        }
        
        btn_MyT.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(48)
        }
        banner.snp.makeConstraints{(make) in
            //make.centerX.equalToSuperview()
            make.top.equalTo(btn_MyT.snp.bottom).offset(28)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-24)
            make.width.equalTo(202)
            make.height.equalTo(80)
        }
        collectionView.snp.makeConstraints{(make)in
            make.top.equalTo(banner.snp.bottom).offset(34)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        tr_info.layer.cornerRadius = 10
        tr_info.font = UIFont.systemFont(ofSize: 16)
        tr_info.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(40)
            
        }
    }
    
    func setBanner() {
        let user = "test"
        let bannerString = NSMutableAttributedString(string: "\(user)님 에게 \n 맞는 GRIT 트레이너 찾기", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .light)
        ])
        bannerString.addAttributes([
            .font : UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.init(red: 168/255, green: 17/255, blue: 255/255, alpha: 1.0)
            
        ], range: (user as NSString).range(of: "\(user)"))
        bannerString.addAttributes([
            .font : UIFont.systemFont(ofSize: 20, weight: .medium),
            .underlineStyle : NSUnderlineStyle.single.rawValue,
            .underlineColor : UIColor.black
        ], range: (bannerString.string as NSString).range(of: "GRIT 트레이너"))
        
        
        banner.attributedText = bannerString
        banner.textAlignment = NSTextAlignment.center
        
        let MyTrainerBtnString = NSMutableAttributedString(string: btn_MyT.currentTitle! , attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .light)
        ])
        
        MyTrainerBtnString.addAttributes([
            .font : UIFont.systemFont(ofSize: 13, weight: .heavy),
            .underlineStyle : NSUnderlineStyle.single.rawValue,
            .underlineColor : UIColor.white
        ], range: (btn_MyT.currentTitle! as NSString).range(of: "MY TRAINERS"))
        
        btn_MyT.setAttributedTitle(MyTrainerBtnString, for: .normal)
        
        let trainerName = "Jenny"
        let trainerInfo = "청담동 피트니스 근무 경력 10년 \n 연예인 김XX, 오XX, 퍼스널 트레이너 \n 자신감은 떨어지지만 희망을 잃지 않는 사람들에게 \n 뜨거운 호응을 얻고 있는 스타 트레이너"
        
        let TrInfoString = NSMutableAttributedString(string: "Trainer \(trainerName) \n\n \(trainerInfo)\n", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light),
            NSAttributedString.Key.foregroundColor : UIColor.init(red: 111/255, green: 111/255, blue: 111/255, alpha: 1.0)
        ])
        TrInfoString.addAttributes([
            .font : UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.init(red: 168/255, green: 17/255, blue: 255/255, alpha: 1.0)
            
        ], range: (TrInfoString.string as NSString).range(of: "Trainer"))
        TrInfoString.addAttributes([
            .font : UIFont.systemFont(ofSize: 16, weight: .heavy),
            .foregroundColor: UIColor.init(red: 168/255, green: 17/255, blue: 255/255, alpha: 1.0)
        ], range: (TrInfoString.string as NSString).range(of: "\(trainerName)"))
        
        
        tr_info.attributedText = TrInfoString
        tr_info.textAlignment = NSTextAlignment.center
        
    }
    func addCollectionView(){
        let layout = CarouselLayout()
        
        layout.itemSize = CGSize(width: collectionView.frame.size.width*0.68, height: collectionView.frame.size.height)
        layout.sideItemScale = 175/251
        layout.spacing = -197
        layout.isPagingEnabled = true
        layout.sideItemAlpha = 0.5
        
        collectionView.collectionViewLayout = layout
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.register(UINib(nibName: "TrainerViewCell", bundle: .main), forCellWithReuseIdentifier: "TrainerViewCell")
        //self.collectionView?.register(TrainerViewCell.self, forCellWithReuseIdentifier: "trainerViewCell")
    }
    
    
    func tabbar_start() {
        print("MainTrainerTabbbar")
        //self.setLeftAlignedNavigationItemTitle(text: "TRAINER", color: .black, margin: 20)
        
        
        let buttonIcon = UIImage(named: "bell")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(Trainer_Main.myRightSideBarButtonItemTapped(_:)))
        //let leftBarButton = UIBarButtonItem(title: "bell", style:nil, target: self, action: nil)
        
        rightBarButton.image = buttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)  {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    
}
extension Trainer_Main: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagearray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerViewCell", for: indexPath) as? TrainerViewCell else {
            return UICollectionViewCell()
        }
        
        cell.TrainerPF.image = imagearray[indexPath.row]
        cell.customView.backgroundColor = .white
        return cell
        
    }
    
    
}
