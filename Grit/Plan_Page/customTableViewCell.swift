//
//  customTableViewCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/23.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var trainerNameTxt: UILabel!
    @IBOutlet weak var lessonNameTxt: UILabel!
    @IBOutlet weak var lessonTimeTxt: UILabel!
    @IBOutlet weak var reservationStatus: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var leftColorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
