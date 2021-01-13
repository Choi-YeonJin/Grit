//
//  PrivacyPolicyViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit
import RxSwift
import RxCocoa

class PrivacyPolicyViewController: UIViewController {
    
    @IBOutlet weak var CheckBtn: UIButton!
    
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    
    @IBOutlet weak var onePrivacyTxt: UILabel!
    @IBOutlet weak var twoPrivacyTxt: UILabel!
    @IBOutlet weak var threePrivacyTxt: UILabel!
    @IBOutlet weak var fourPrivacyTxt: UILabel!
    @IBOutlet weak var fivePrivacyTxt: UILabel!
    @IBOutlet weak var sixPrivacyTxt: UILabel!
    
    var requireBtnCnt = 0
    
    let disposeBag = DisposeBag()
    
    var checkedCount = 0
    
    let checkedImage = UIImage(named: "radio-checked")! as UIImage
    let uncheckedImage = UIImage(named: "radio")! as UIImage
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let Allcheckbox = [allBtn,oneBtn,twoBtn,threeBtn,fourBtn,fiveBtn,sixBtn]
        
        Allcheckbox.enumerated().forEach{
            $1!.setImage(self.checkedImage, for: .selected)
            $1!.setImage(self.uncheckedImage, for: .normal)
        }
        
        binding()
        
        swipeRecognizer()
        
        reauiredPrivacyPolicy()
    }
    
    @IBAction func CheckBtnClicked(_ sender: Any) {
        if(oneBtn.isSelected && twoBtn.isSelected && threeBtn.isSelected) {
            let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
            self.navigationController?.pushViewController(firstVC, animated: true)
        }
        else {
            let alert = UIAlertController(title: "실패", message: "필수 항목에 체크해주세요", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .destructive) { (action) in }
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
        
    }
    
    func reauiredPrivacyPolicy() {
        
        
        let onePrivacyString = NSMutableAttributedString()
            .bold("서비스 이용약관", fontSize: 16)
            .boldPurple("(필수)", fontSize: 14, fontColor: UIColor.init(red: 168/255, green: 14/255, blue: 233/255, alpha: 1.0).cgColor)
        
        onePrivacyTxt.attributedText = onePrivacyString
        
        let twoPrivacyString = NSMutableAttributedString()
            .bold("개인정보 이용약관", fontSize: 16)
            .boldPurple("(필수)", fontSize: 14, fontColor: UIColor.init(red: 168/255, green: 14/255, blue: 233/255, alpha: 1.0).cgColor)
        
        twoPrivacyTxt.attributedText = twoPrivacyString
        
        let threePrivacyString = NSMutableAttributedString()
            .bold("개인 민감정보 수집 이용약관", fontSize: 16)
            .boldPurple("(필수)", fontSize: 14, fontColor: UIColor.init(red: 168/255, green: 14/255, blue: 233/255, alpha: 1.0).cgColor)
        
        threePrivacyTxt.attributedText = threePrivacyString
        
        let fourPrivacyString = NSMutableAttributedString()
            .bold("위치정보 수집 이용약관", fontSize: 16)
        
        fourPrivacyTxt.attributedText = fourPrivacyString
        
        let fivePrivacyString = NSMutableAttributedString()
            .bold("마케팅 정보 수신", fontSize: 16)
        
        fivePrivacyTxt.attributedText = fivePrivacyString
        
        let sixPrivacyString = NSMutableAttributedString()
            .bold("헬스데이터 수집 이용약관", fontSize: 16)
        
        sixPrivacyTxt.attributedText = sixPrivacyString
        
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
    
    func binding() {
        let checkboxs = [oneBtn,twoBtn,threeBtn,fourBtn,fiveBtn,sixBtn]
        
        allBtn.rx.tap.bind {
            _ in
            self.allBtn.isSelected.toggle()
            checkboxs.enumerated().forEach{
                $1?.isSelected = self.allBtn.isSelected ? true : false
            }
        }.disposed(by: disposeBag)
        
        checkboxs.enumerated().forEach{
            let i = $0
            $1!.rx.tap.bind {
                checkboxs[i]!.isSelected.toggle()
                self.checkedCount = checkboxs[i]!.isSelected ? +1 : -1
                self.allBtn.isSelected = self.checkedCount == 6 ? true : false
            }.disposed(by: disposeBag)
        }
        
    }
}

extension NSMutableAttributedString {
    
    func bold(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: fontSize)]
        self.append(NSMutableAttributedString(string: text, attributes: attrs))
        return self
    }
    
    func normal(_ text: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize)]
        self.append(NSMutableAttributedString(string: text, attributes: attrs))
        return self
    }
    
    func boldPurple(_ text: String, fontSize: CGFloat, fontColor: CGColor) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize),NSAttributedString.Key.foregroundColor:fontColor]
        self.append(NSMutableAttributedString(string: text, attributes: attrs))
        return self
    }
    
}
