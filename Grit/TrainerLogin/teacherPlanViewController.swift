//
//  teacherPlanViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2021/01/05.
//

import UIKit
import FSCalendar
import SnapKit

class teacherPlanViewController: UIViewController,FSCalendarDelegate {
    
    var calendar:FSCalendar!
    var formatter = DateFormatter()
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var dayCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar = FSCalendar()
        
        calendar.scrollDirection = .horizontal
        calendar.scope = .week
        calendar.placeholderType = .none
        
        calendarView.addSubview(calendar)
        calendar.frame = calendarView.frame
        
        calendarView.snp.makeConstraints{make in
            make.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(self.view).multipliedBy(0.4)
        }
        calendar.snp.makeConstraints{make in
            make.edges.equalTo(calendarView)
        }
        
        calendar.appearance.selectionColor = .init(cgColor: CGColor(srgbRed: 168/255, green: 14/255, blue: 233/255, alpha: 0.12))
        calendar.appearance.titleSelectionColor = .init(cgColor: CGColor(srgbRed: 168/255, green: 14/255, blue: 233/255, alpha: 1.0))
        calendar.appearance.todayColor = .white
        calendar.appearance.titleTodayColor = .init(cgColor: CGColor(srgbRed: 168/255, green: 14/255, blue: 233/255, alpha: 1.0))
        calendar.appearance.headerTitleColor = .init(cgColor: CGColor(srgbRed: 168/255, green: 14/255, blue: 233/255, alpha: 1.0))
        calendar.appearance.weekdayTextColor = .init(cgColor: CGColor(srgbRed: 60/255, green: 60/255, blue: 67/255, alpha: 0.3))
        
        //        calendar.appearance.todaySelectionColor
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        
        calendar.delegate = self
        
        tabbar_start()
        
        self.dayCollectionView.delegate = self
        self.dayCollectionView.dataSource = self
        self.dayCollectionView.reloadData()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 11.27, bottom: 0, right: 11.27)
        
        dayCollectionView.collectionViewLayout = layout
        

    }
    
    
    
    func tabbar_start() {
        print("Tabbbar")
        //self.setLeftAlignedNavigationItemTitle(text: "TRAINER", color: .black, margin: 20)
        let buttonIcon = UIImage(named: "bell")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(PlanViewController.myRightSideBarButtonItemTapped(_:)))
        //let leftBarButton = UIBarButtonItem(title: "bell", style:nil, target: self, action: nil)
        rightBarButton.image = buttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = nil
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    //알람 버튼 클릭 이벤트
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        let storyboard = UIStoryboard(name: "Notice", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "Notice") as! NoticeViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
}


extension teacherPlanViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6    // 32개의 아이템을 보여준다.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayScheduleCell", for: indexPath) // TestCollectionCell은 스토리보드에서 등록한 Cell Identifier
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 36.6, height: 480.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
