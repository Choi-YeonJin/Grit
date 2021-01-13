//
//  GritCompliteViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/23.
//

import UIKit
import Cosmos
import SnapKit

class Grit_CompliteViewController: UIViewController {

    @IBOutlet weak var complBtn: UIButton!
    @IBOutlet weak var ratingView: UIView!
    
    lazy var cosmosVieww: CosmosView = {
        var view = CosmosView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingView.addSubview(cosmosVieww)
        cosmosVieww.snp.makeConstraints{ make in
            make.center.equalTo(ratingView)
        }
        
        // Set image for the filled star
        cosmosVieww.settings.filledImage = UIImage(named: "Star_full")

        // Set image for the empty star
        cosmosVieww.settings.emptyImage = UIImage(named: "Star_empty")
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func compleBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
