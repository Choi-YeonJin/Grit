//
//  PlanViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/22.
//

import UIKit
import FSCalendar
import SnapKit

class teacherPlanOneViewController: UIViewController, FSCalendarDelegate{
    
    var calendar:FSCalendar!
    var formatter = DateFormatter()
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var trainerLessonTableView: UITableView!
    
    @IBOutlet weak var lessonListBtn: UIButton!
    @IBOutlet weak var changeScheduleBtn: UIButton!
    
    let teacherName = ["Jenny 트레이너와","Jenny 트레이너와"]
    let lessonName = ["Personal Training #2","Personal Training #2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbar_start()
        
        calendar = FSCalendar()
        
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
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
        
        lessonListBtn.setTitleColor(.init(cgColor: CGColor(red: 168/255, green: 14/255, blue: 233/255, alpha: 1/0)), for: .normal)
        
        //        calendar.appearance.todaySelectionColor
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        
        calendar.delegate = self
        
        // TableView Remove line
        trainerLessonTableView.separatorStyle = .none
        trainerLessonTableView.showsVerticalScrollIndicator  = false
        
        trainerLessonTableView.dataSource = self
        trainerLessonTableView.delegate = self
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
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY"
        // EEEE : Sunday, MM : 01, dd : 01, YYYY : 2020, h:1, mm:01
        let string = formatter.string(from: date)
        print("\(string)")
    }
}

extension teacherPlanOneViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teacherName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trainerLessonTableView.dequeueReusableCell(withIdentifier: "teacherScheduleList") as! teacherScheduleTableViewCell
        
        let name = teacherName[indexPath.row]
        let lesson = lessonName[indexPath.row]
        
        cell.trainerName.text = name
        cell.lessonName.text = lesson
        
        cell.lessonTime.layer.cornerRadius = 5
        
        cell.cellView.layer.cornerRadius = 10
        cell.cellView.layer.borderWidth = 0.5
        cell.cellView.layer.borderColor = .init(CGColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0))
        
        
        return cell
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 74
        }
}
