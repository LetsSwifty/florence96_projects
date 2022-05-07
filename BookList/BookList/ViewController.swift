//
//  ViewController.swift
//  BookList
//
//  Created by Yejin Hong on 2022/05/02.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    var titleView = UILabel()
    var naviView = UINavigationBar()
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "책 목록"
        naviView = self.navigationController!.navigationBar
        
//        configureTableView()
        configureNavigation()
//        configureTitle()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegate()
        //register cells
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: naviView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func configureNavigation(){
        view.addSubview(naviView)
        naviView.translatesAutoresizingMaskIntoConstraints = false
        naviView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        naviView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        naviView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        naviView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: #selector(toNextView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "books.vertical"), style: .done, target: self, action: #selector(toNextView))
    }
    
    func configureTitle(){
        view.addSubview(titleView)
        let size = CGSize(width: view.frame.width, height: 30)
        titleView.text = "책 목록"
        titleView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: naviView.bottomAnchor).isActive = true
    }
    
    @objc func toNextView(){
        
    }
    
    func setTableViewDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
