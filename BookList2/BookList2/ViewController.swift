//
//  ViewController.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/07.
//

import UIKit

class ViewController: UIViewController, BookListCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageTitle: UILabel!
    
    var bookData = [
        Book(name: "꼼꼼한 재은 씨의 스위프트 문법편", detail: "이재은 (지은이)", thumbnail: "book_1"),
        Book(name: "꼼꼼한 재은 씨의 스위프트 기본편", detail: "이재은 (지은이)", thumbnail: "book_2"),
        Book(name: "꼼꼼한 재은 씨의 스위프트 실전편", detail: "이재은 (지은이)", thumbnail: "book_3"),
        Book(name: "Do it! 자바 프로그래밍 입문", detail: "박은종 (지은이)", thumbnail: "book_4"),
        Book(name: "Do it! 자료구조와 함께 배우는 알고리즘 입문: 자바 편", detail: "시바타 보요 (지은이)", thumbnail: "book_5"),
        Book(name: "Do it! 핸즈온 머신러닝", detail: "오렐리앙 제롱 (지은이)", thumbnail: "book_6"),
        Book(name: "내가 틀릴 수도 있습니다", detail: "비욘 나티코 린데블라드 (지은이)", thumbnail: "book_7"),
        Book(name: "작별인사", detail: "김영하 (지은이)", thumbnail: "book_8"),
        Book(name: "오늘부터 개발자", detail: "김병욱 (지은이)", thumbnail: "book_9"),
        Book(name: "유지보수하기 어렵게 코딩하는 방법: 평생 개발자로 먹고 살 수 있다", detail: "로에디 그린 (지은이)", thumbnail: "book_10"),
        Book(name: "오늘도 개발자가 안 된다고 말했다", detail: "김중철, 김수지 (지은이)", thumbnail: "book_11"),
        Book(name: "면접을 위한 CS 전공지식 노트", detail: "주홍철 (지은이)", thumbnail: "book_12"),
        Book(name: "나는 LINE 개발자입니다", detail: "김윤신, 김영환 외 (지은이)", thumbnail: "book_13"),
        Book(name: "여름의 문", detail: "가와카미 미에코 (지은이)", thumbnail: "book_14"),
        Book(name: "도메인 주도 개발 시작하기", detail: "최범균 (지은이)", thumbnail: "book_15")
    ]
    
    var books = [Book]()
    var status = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageTitle.text = "책 목록"
        tableViewDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        defaultStatus()
        tableViewDelegate()
    }
    
    @IBAction func myPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageVC
        vc.books = self.books
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func starSelected(index: Int) {
        if !status[index] {
            let alert = UIAlertController(title: nil, message: "도서가 선택되었습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.status[index] = !self.status[index]
                self.books.append(self.bookData[index])
                self.tableView.reloadData()
            }
            
            alert.view.tintColor = UIColor.black
            alert.addAction(ok)
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "이미 선택된 도서입니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.view.tintColor = UIColor.black
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    func defaultStatus(){
        status = [Bool](repeating: false, count: bookData.count)
        
        for data in books {
            let index = bookData.firstIndex(of: data)!
            status[index] = true
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath) as! BookListCell
        cell.selectionStyle = .none
        cell.index = row
        cell.bookTitle.text = bookData[row].name
        cell.bookAuthor.text = bookData[row].detail
        cell.bookImage.image = UIImage(named: bookData[row].thumbnail!)
        cell.status = self.status[row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableViewDelegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
}