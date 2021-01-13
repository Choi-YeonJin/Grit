//
//  Trainer_MyTrainer.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit

class Trainer_MyTrainer: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    
    var index = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonIcon = UIImage(named: "bell")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(Trainer_MyTrainer.myRightSideBarButtonItemTapped(_:)))
        //let leftBarButton = UIBarButtonItem(title: "bell", style:nil, target: self, action: nil)
        
        rightBarButton.image = buttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)  {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return index
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainerListCell", for: indexPath) as! TrainerListCell
        
        cell.imgimage.image = UIImage(named: "ex_1")
        
        return cell
        
    }
    
}

