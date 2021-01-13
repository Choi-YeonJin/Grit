//
//  bookListViewTableViewCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/23.
//

import UIKit

class bookListViewTableViewCell: UITableViewCell {

    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var dateTxt: UILabel!
    @IBOutlet weak var teacherNameTxt: UILabel!
    @IBOutlet weak var lessonNameTxt: UILabel!
    @IBOutlet weak var lessonTimeTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
