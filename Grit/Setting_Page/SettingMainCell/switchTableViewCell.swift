//
//  switchTableViewCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/24.
//

import UIKit

class switchTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectTxt: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 0.5
        self.layer.borderColor = CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func switchBtnClicked(_ sender: Any) {
        print("switch is clicked")
    }
    
    public func set(settingCell: Cell) {
        subjectTxt.text = settingCell.subject
        switchBtn.isOn = true
    }

}
