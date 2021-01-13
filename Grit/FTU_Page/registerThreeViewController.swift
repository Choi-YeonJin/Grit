//
//  registerThreeViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class registerThreeViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var dietBtn: UIButton!
    @IBOutlet weak var exerciseBtn: UIButton!
    @IBOutlet weak var correctionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        defaultBtn(Btn: dietBtn)
        defaultBtn(Btn: exerciseBtn)
        defaultBtn(Btn: correctionBtn)
        
        swipeRecognizer()
    }
    
    @IBAction func dietBtnClicked(_ sender: Any) {
        btnClicked(Btn: dietBtn)
        btnUnClicked(Btn: exerciseBtn)
        btnUnClicked(Btn: correctionBtn)
    }
    
    @IBAction func exerciseBtnClicked(_ sender: Any) {
        btnClicked(Btn: exerciseBtn)
        btnUnClicked(Btn: dietBtn)
        btnUnClicked(Btn: correctionBtn)
        
    }
    @IBAction func correctionBtnClicked(_ sender: Any) {
        btnClicked(Btn: correctionBtn)
        btnUnClicked(Btn: exerciseBtn)
        btnUnClicked(Btn: dietBtn)
        
    }
    
    func defaultBtn(Btn : UIButton) {
        Btn.layer.cornerRadius = 10
        Btn.layer.borderWidth = 1
    }
    
    func btnClicked(Btn : UIButton) {
        Btn.layer.cornerRadius = 10
        Btn.layer.borderWidth = 1
        Btn.layer.borderColor = CGColor(red: 227/255, green: 187/255, blue: 243/255, alpha: 0.5)
        Btn.backgroundColor = UIColor(red: 217/255, green: 199/255, blue: 256/255, alpha: 0.5)
    }
    
    func btnUnClicked(Btn : UIButton) {
        Btn.layer.cornerRadius = 10
        Btn.layer.borderWidth = 1
        Btn.layer.borderColor = UIColor.black.cgColor
        Btn.setTitleColor(.black, for: .normal)
        Btn.backgroundColor = UIColor.white
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "registerFour") as! registerFourViewController
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
                    self.navigationController?.popViewController(animated: true)
                    self.dismiss(animated: true, completion: nil)
                default: break
                }
            }
        }
}
