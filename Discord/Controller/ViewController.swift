//
//  ViewController.swift
//  Discord
//
//  Created by Leonardo Diaz on 8/2/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    let tableView = UITableView()
    let bottomBarView = BottomBarView()
    let hashTagChatView = HashTagChatView()
    /// Top Bar Buttons
    var userButton = UIBarButtonItem()
    var searchButton = UIBarButtonItem()
    var serverTabButton = UIBarButtonItem()
    var spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    var chatButton = UIBarButtonItem()
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        addLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        notificationConfig()
    }
    
    func setupView(){
        bottomBarView.messageField.delegate = self
        userButton = makeButtonImage(name: "account-multiple", view: self)
        searchButton = makeButtonImage(name: "magnify", view: self)
        searchButton.imageInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        serverTabButton = makeButtonImage(name: "menu", view: self)
        chatButton = UIBarButtonItem(customView: hashTagChatView)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = .darkBackground
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItems = [userButton, searchButton]
        navigationItem.leftBarButtonItems = [serverTabButton, spacer, spacer, chatButton]
        navigationController?.navigationBar.tintColor = .lightText
        bottomBarView.backgroundColor = .defaultBackground
    }
    
    func setupTableView(){
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "messageCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = .defaultBackground
    }
    
    func addLayout(){
        view.addSubview(tableView)
        view.addSubview(bottomBarView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBarView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            bottomBarView.heightAnchor.constraint(equalToConstant: 100),
            bottomBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func notificationConfig(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification){
//        print(self.view.frame.origin.y) --> Where 88 came from
        // 88 on 11 Pro
        guard let keyboardReact = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        if notification.name == UIResponder.keyboardWillShowNotification ||  notification.name == UIResponder.keyboardWillChangeFrameNotification {
            self.view.frame.origin.y = -keyboardReact.height + bottomBarView.frame.size.height
        } else {
            self.view.frame.origin.y = 88
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageController.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = .defaultBackground
        cell.message = MessageController.messages[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        bottomBarView.messageField.resignFirstResponder()
        return true
    }

}
