//
//  registerFourViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class registerFourViewController: UIViewController {
    
    @IBOutlet weak var excerciseTimeTxt: UITextField!
    @IBOutlet weak var PTYes: UIButton!
    @IBOutlet weak var PTNo: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    let unit = ["주","월"]
    let unitNum = (1...7).map(String.init)
    
    var exercisePicker = UIPickerView()
    
    var selectedUnit = String()
    var selectedUnitNum = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        excerciseTimeTxt.addTarget(self, action: #selector(excerciseTimeTxtFunc), for: .touchDown)
        
        defaultBtn(Btn: PTYes)
        defaultBtn(Btn: PTNo)
        
        swipeRecognizer()
    }
    
    @objc func excerciseTimeTxtFunc(textField: UITextField) {
        let alert = UIAlertController(title: "운동 시간", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        exercisePicker = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        exercisePicker.tag = 1
        alert.view.addSubview(exercisePicker)
        exercisePicker.dataSource = self
        exercisePicker.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.excerciseTimeTxt.text = self.selectedUnit + "   " + self.selectedUnitNum + "  회"
        }))
        self.present(alert,animated: true, completion: nil )
    }
    
    @IBAction func PTYesClicked(_ sender: Any) {
        btnClicked(Btn: PTYes)
        btnUnClicked(Btn: PTNo)
    }
    
    @IBAction func PTNoClicked(_ sender: Any) {
        btnClicked(Btn: PTNo)
        btnUnClicked(Btn: PTYes)
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "registerFive") as! registerFiveViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
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

extension registerFourViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( component == 0) { return unit.count }
        else if(component == 1) { return unitNum.count }
        else { return 1 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( component == 0) { return unit[row] }
        else if(component == 1) { return unitNum[row] }
        else { return "Data is Not Found" }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component==0) {selectedUnit = unit[row]}
        if(component==1) {selectedUnitNum = unitNum[row]
        }
        
        // preview row limit
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 45
        }
    }
}
