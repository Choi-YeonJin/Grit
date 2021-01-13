//
//  teacherAddPlanViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/30.
//

import UIKit

class teacherAddPlanViewController: UIViewController {
    
    @IBOutlet weak var start_time: UIView!
    @IBOutlet weak var end_time: UIView!
    @IBOutlet weak var repeatView: UIView!
    @IBOutlet weak var planExplain: UITextField!
    @IBOutlet weak var subjectField: UITextField!
    
    @IBOutlet weak var repeatBtn: UIButton!
    @IBOutlet weak var startTimePicker: UITextField!
    @IBOutlet weak var endTimePicker: UITextField!
    
    
    let unit = ["오전","오후"]
    let repeatArr = ["안 함","1 회","2 회","3 회"]
    let hour = (1...12).map(String.init)
    let minute = (00...60).map(String.init)
    let day = (1...31).map(String.init)
    
    var startTime = UIPickerView()
    var endTime = UIPickerView()
    
    var selectedStartTime = String()
    var selectedStartMinute = String()
    var selectedStartUnit = String()
    var selectedEndTime = String()
    var selectedEndMinute = String()
    var selectedEndUnit = String()
    var selectedRepeat = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimePicker.addTarget(self, action: #selector(startTimePickerFunc), for: .touchDown)
        endTimePicker.addTarget(self, action: #selector(endTimePickerFunc), for: .touchDown)
        
        planExplain.backgroundColor = .white
        
        //        planExplain.borderStyle = .none
        //        subjectField.borderStyle = .none
        planExplain.layer.borderWidth = 0.1
        planExplain.layer.borderColor = UIColor.init(red: 60/255, green: 60/255, blue: 67/255, alpha: 0/36).cgColor
        subjectField.layer.borderWidth = 0.1
        subjectField.layer.borderColor = UIColor.init(red: 60/255, green: 60/255, blue: 67/255, alpha: 0/36).cgColor
        //        subjectField.layer.borderWidth = 0.1
        //        subjectField.layer.borderColor = UIColor.gray.cgColor
        
        startTimePicker.borderStyle = .none
        endTimePicker.borderStyle = .none
        
        start_time.layer.borderWidth = 0.5
        start_time.layer.borderColor = UIColor.gray.cgColor
        end_time.layer.borderWidth = 0.5
        end_time.layer.borderColor = UIColor.gray.cgColor
        repeatView.layer.borderWidth = 0.5
        repeatView.layer.borderColor = UIColor.gray.cgColor
        
        
    }
    
    @objc func startTimePickerFunc(textField: UITextField) {
        let alert = UIAlertController(title: "시작 시간", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        startTime = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        startTime.tag = 1
        alert.view.addSubview(startTime)
        startTime.dataSource = self
        startTime.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            
            if(self.selectedStartUnit == "") { self.selectedStartUnit = "오전"}
            if(self.selectedStartTime == "") { self.selectedStartTime = "1"}
            if(self.selectedStartMinute == "") { self.selectedStartMinute = "00"}
            
            self.startTimePicker.text = self.selectedStartUnit + " " + self.selectedStartTime + ":" + self.selectedStartMinute
            self.selectedStartUnit = ""
            self.selectedStartTime = ""
            self.selectedStartMinute = ""
        }))
        self.present(alert,animated: true, completion: nil )
    }
    
    @objc func endTimePickerFunc(textField: UITextField) {
        let alert = UIAlertController(title: "종료 시간", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        endTime = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        endTime.tag = 2
        alert.view.addSubview(endTime)
        endTime.dataSource = self
        endTime.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            if(self.selectedEndUnit == "") { self.selectedEndUnit = "오전"}
            if(self.selectedEndTime == "") { self.selectedEndTime = "1"}
            if(self.selectedEndMinute == "") { self.selectedEndMinute = "00"}
            self.endTimePicker.text = self.selectedEndUnit + " " + self.selectedEndTime + ":" + self.selectedEndMinute
            self.selectedEndUnit = ""
            self.selectedEndTime = ""
            self.selectedEndMinute = ""
        }))
        self.present(alert,animated: true, completion: nil )
    }
    
    @IBAction func repeatBtnClicked(_ sender: Any) {
        let alert = UIAlertController(title: "반복", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        endTime = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140)) // PickerView resize
        endTime.tag = 3
        alert.view.addSubview(endTime)
        endTime.dataSource = self
        endTime.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            if(self.selectedRepeat == "") { self.selectedRepeat = "안 함"}
            self.repeatBtn.setTitle("\(self.selectedRepeat)", for: .normal)
            self.selectedRepeat = ""
        }))
        self.present(alert,animated: true, completion: nil )
    }
    
}


extension teacherAddPlanViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 3:
            return 1
        default:
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 3:
            return repeatArr.count
        default:
            if( component == 0) { return unit.count }
            else if(component == 1) { return hour.count }
            else if(component == 2) { return minute.count }
            else { return 1 }
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 3:
            return repeatArr[row]
        default:
            if( component == 0) { return unit[row] }
            else if(component == 1) { return hour[row] }
            else if(component == 2) { return minute[row] }
            else { return "Data is Not Found" }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            if(component==0) {selectedStartUnit = unit[row]}
            if(component==1) {selectedStartTime = hour[row] }
            if(component==2) {selectedStartMinute = minute[row]}
        case 2:
            if(component==0) {selectedEndUnit = unit[row]}
            if(component==1) {selectedEndTime = hour[row] }
            if(component==2) {selectedEndMinute = minute[row]}
        case 3:
            if(component==0) {selectedRepeat = repeatArr[row]}
        default:
            return
        }
        
    }
    
    // preview row limit
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
}
