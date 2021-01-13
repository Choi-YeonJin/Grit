//
//  nextTableViewCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/24.
//

import UIKit

class nextTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectTxt: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        // Configure the view for the selected state
    }
    
    public func set(settingCell: Cell) {
        subjectTxt.text = settingCell.subject
    }

}
