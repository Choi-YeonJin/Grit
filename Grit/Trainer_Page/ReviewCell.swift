//
//  ReviewCell.swift
//  Grit-kkh-test
//
//  Created by 김강훈 on 2020/12/29.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var review_name: UILabel!
    @IBOutlet weak var review_content: UILabel!
    @IBOutlet weak var reviewer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
