//
//  teacherFinishExcerciseViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/30.
//

import UIKit

class teacherFinishExcerciseViewController: UIViewController {

    @IBOutlet weak var compleBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func compleBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
