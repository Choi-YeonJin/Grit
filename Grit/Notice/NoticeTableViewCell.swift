//
//  NoticeTableViewCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/29.
//

import UIKit

protocol CellDelegate: class {
    func CellBtnTapped(tag: Int)
}

class NoticeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todaylb: UILabel!
    @IBOutlet weak var NoticeTitlelb: UILabel!
    @IBOutlet weak var NoticeDatelb: UILabel!
    @IBOutlet weak var NoticeSubTitlelb: UILabel!
    @IBOutlet weak var refusalReceivelb: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var consulteBtn: UIButton!
    
    
    var tapBlock: (() -> Void)? = nil
    
//    weak var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        tapBlock?()
//        delegate?.CellBtnTapped(tag: sender.tag)
    }
    
}
