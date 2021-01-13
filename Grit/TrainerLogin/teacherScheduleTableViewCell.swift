//
//  teacherScheduleTableViewCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/30.
//

import UIKit

class teacherScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var lessonDate: UILabel!
    @IBOutlet weak var lessonTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
