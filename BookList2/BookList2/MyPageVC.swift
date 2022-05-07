//
//  MyPageVC.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/07.
//

import Foundation
import UIKit

class MyPageVC: UIViewController, MyPageDelegate {
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle.text = "마이페이지"
        checkBookisEmpty()
        setNaviBar()
        tableViewDelegate()
    }
    
    @objc func backButton(sender: UIBarButtonItem){
        let vc = self.navigationController?.viewControllers[0] as! ViewController
        vc.books = self.books
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNaviBar(){
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: UIBarButtonItem.Style.done, target: self, action: #selector(backButton(sender:)))
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func checkBookisEmpty(){
        if books.isEmpty {
            let alert = UIAlertController(title: nil, message: "저장된 도서가 없습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                let vc = self.navigationController?.viewControllers[0] as! ViewController
                vc.books = self.books
                self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(ok)
            alert.view.tintColor = UIColor.black
            
            self.present(alert, animated: true)
        }
    }
    
    func deleteBook(index: Int?) {
        let alert = UIAlertController(title: nil, message: "도서를 삭제하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .default) { _ in
            self.books.remove(at: index!)
            self.tableView.reloadData()
            self.checkBookisEmpty()
        }
        
        let cancel = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.view.tintColor = UIColor.black
        
        self.present(alert, animated: true)
    }
}

extension MyPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath) as! MyPageCell
        cell.index = row
        cell.bookImage.image = UIImage(named: books[row].thumbnail!)
        cell.bookTitle.text = books[row].name
        cell.delegate = self
        return cell
    }
    
    func tableViewDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}