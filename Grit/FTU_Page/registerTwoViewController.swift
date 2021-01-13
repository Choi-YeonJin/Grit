//
//  registerTwoViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class registerTwoViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    
    @IBOutlet weak var dateOfBirthTxt: UITextField!
    @IBOutlet weak var heightTxt: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    
    let year = (1950...2020).map(String.init)
    let month = (1...12).map(String.init)
    let day = (1...31).map(String.init)
    let heightNum = (130...200).map(String.init)
    let weightNum = (30...200).map(String.init)
    
    var birthPicker = UIPickerView()
    var heigtPicker = UIPickerView()
    var weightPicker = UIPickerView()
    
    var selectedYear = String()
    var selectedMonth = String()
    var selectedDay = String()
    var selectedHeight = String()
    var selectedWeight = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultBtn(Btn: maleBtn)
        defaultBtn(Btn: femaleBtn)
        
        //textfiled Clicked event
        dateOfBirthTxt.addTarget(self, action: #selector(dateOfBirthTxtFunc), for: .touchDown)
        heightTxt.addTarget(self, action: #selector(heightTxtFunc), for: .touchDown)
        weightTxt.addTarget(self, action: #selector(weightTxtFunc), for: .touchDown)
        
        // BirthTxt 오늘로 초기화
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd일      MM월      yyyy년"
        let formattedDate = format.string(from: date)
        dateOfBirthTxt.text = formattedDate
        
        swipeRecognizer()
        
    }
    @IBAction func nextBtnClicked(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "registerThree") as! registerThreeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    // 생년월일 Textfield Click event
    @objc func dateOfBirthTxtFunc(textField: UITextField) {
        let alert = UIAlertController(title: "Day        Month        Year", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        birthPicker = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        birthPicker.tag = 1
        alert.view.addSubview(birthPicker)
        birthPicker.dataSource = self
        birthPicker.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
        self.dateOfBirthTxt.text = self.selectedDay + "일      " + self.selectedMonth + "월     " + self.selectedYear + "년"
               }))
        self.present(alert,animated: true, completion: nil )
    }

    @objc func heightTxtFunc(textField: UITextField) {

        let alert = UIAlertController(title: "키", message: "\n\n\n\n\n\n", preferredStyle: .alert)

        heigtPicker = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        heigtPicker.tag = 2
        alert.view.addSubview(heigtPicker)
        heigtPicker.dataSource = self
        heigtPicker.delegate = self

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            if(self.selectedHeight != "") {self.heightTxt.text = self.selectedHeight + "     cm"}
            else {self.heightTxt.text = "130     cm"}
               }))
        self.present(alert,animated: true, completion: nil )
    }

    @objc func weightTxtFunc(textField: UITextField) {

        let alert = UIAlertController(title: "몸무게", message: "\n\n\n\n\n\n", preferredStyle: .alert)

        weightPicker = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        weightPicker.tag = 3
        alert.view.addSubview(weightPicker)
        weightPicker.dataSource = self
        weightPicker.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            if(self.selectedWeight != "") {self.weightTxt.text = self.selectedWeight + "     kg"}
            else {self.weightTxt.text = "30     kg"}
               }))
        self.present(alert,animated: true, completion: nil )
    }
    
    @IBAction func femaleBtnClicked(_ sender: Any) {
        btnClicked(Btn: maleBtn)
        btnUnClicked(Btn: femaleBtn)
    }
    @IBAction func maleBtnClicked(_ sender: Any) {
        btnClicked(Btn: femaleBtn)
        btnUnClicked(Btn: maleBtn)
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


extension registerTwoViewController : UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 1:
            return 3
        default:
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            if( component == 0) { return day.count }
            else if(component == 1) { return month.count }
            else if(component == 2) { return year.count }
            else { return 1 }
        case 2:
            return heightNum.count
        case 3:
            return weightNum.count
        default:
            return 1
        }

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            if( component == 0) { return day[row] }
            else if(component == 1) { return month[row] }
            else if(component == 2) { return year[row] }
            else { return "Data is Not Found" }
        case 2:
            return heightNum[row]
        case 3:
            return weightNum[row]
        default:
            return "Tag value is " + String(pickerView.tag)
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            if(component==0) {selectedDay = day[row]}
            if(component==1) {selectedMonth = month[row]}
            if(component==2) {selectedYear = year[row]}
        case 2:
            selectedHeight = heightNum[row]
        case 3:
            selectedWeight = weightNum[row]
        default:
            return
        }

    }

    // preview row limit
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
}
