//
//  ChatViewController.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/28.
//

import UIKit
import SnapKit
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Media : MediaItem {
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
}

let Label = UILabel()

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    var test : MessagesViewController = MessagesViewController()
    
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    let currentUser = Sender(senderId: "self", displayName: "Test")
    let otherUser = Sender(senderId: "other", displayName: "Counselor")
    
    var message = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테스트 라벨 내용
        Label.text = "1:1 상담하기"
        Label.textAlignment = .center
        Label.backgroundColor = .white
        
        // 테스트 라벨 constraint
        self.view.addSubview(Label)
        Label.translatesAutoresizingMaskIntoConstraints = false
        
        Label.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(30)
        }
        
        message.append(Message(sender: otherUser,
                               messageId: "1",
                               sentDate: Date().addingTimeInterval(-2000),
                               kind: .text("무엇이 궁금하세요?")))
        
        message.append(Message(sender: currentUser,
                               messageId: "2",
                               sentDate: Date().addingTimeInterval(-1000),
                               kind: .text("수강권 구매는 어떻게 하나요?")))
        
        message.append(Message(sender: otherUser,
                               messageId: "3",
                               sentDate: Date(),
                               kind: .text("수강권 구매는 GRIT 페이지에서 구매 가능합니다.")))
        
        // 아바타 삭제
        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout {
            layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
            layout.textMessageSizeCalculator.incomingAvatarSize = .zero
        }
        
        messagesCollectionView.contentInset.top = 30
        
        
        swipeRecognizer()
        tabbar_start()
        
        chatView.layer.borderColor = CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        chatView.layer.borderWidth = 0.5
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        setupInputButton()
        
    }
    
    private func setupInputButton() {
        let button = InputBarButtonItem()
        button.setSize(CGSize(width: 35, height: 35), animated: false)
        button.setImage(UIImage(named: "chatPlusBtn"), for: .normal)
        button.onTouchUpInside{ [weak self] _ in
            self?.presentInputActionSheet()
        }
        messageInputBar.setLeftStackViewWidthConstant(to: 36, animated: false)
        messageInputBar.setStackViewItems([button], forStack: .left, animated: false)
    }
    
    private func presentInputActionSheet() {
        
    }
    
    func currentSender() -> SenderType {
        currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
    
    func tabbar_start() {
        print("Tabbbar")
        //self.setLeftAlignedNavigationItemTitle(text: "TRAINER", color: .black, margin: 20)
        let buttonIcon = UIImage(named: "bell")
        let backbuttonIcon = UIImage(named: "BackBtn")
        //let logo = UIImage(named: "logo")
        let rightBarButton = UIBarButtonItem(title: "bell", style: UIBarButtonItem.Style.done, target: self, action: #selector(ChatViewController.myRightSideBarButtonItemTapped(_:)))
        let leftBarButton = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.done, target: self, action: #selector(ChatViewController.myLeftSideBarButtonItemTapped(_:)))
        //let leftBarButton = UIBarButtonItem(title: "bell", style:nil, target: self, action: nil)
        
        rightBarButton.image = buttonIcon
        leftBarButton.image = backbuttonIcon
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.title = "CHAT"
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
    //뒤로가기 버튼 클릭 이벤트
    @objc func myLeftSideBarButtonItemTapped(_ sender:UIBarButtonItem!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
    }
}
