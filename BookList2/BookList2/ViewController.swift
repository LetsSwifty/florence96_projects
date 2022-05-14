//
//  ViewController.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/07.
//

import UIKit

class ViewController: UIViewController, BookListCellDelegate {
    @IBOutlet weak var personalTest: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageTitle: UILabel!
    
    var bookData = [Book]()
    var books = [Book]()
    var status = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitle.text = "책 목록"
        
        APIRequest.getBookList(){
            let items = APIRequest.items as! [[String: String]]
            for item in items {
                let title = item["title"]?.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
                let data = Book(name: title!, detail: item["author"]!, thumbnail: item["image"]!)
                self.bookData.append(data)
            }
            self.defaultStatus()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewDelegate()
        self.defaultStatus()
    }
    
    @IBAction func personalTest(_ sender: Any) {
        let alert = UIAlertController(title: "시험용 입니다", message: "시험 중", preferredStyle: .alert)
        let rect = CGRect(x: 8.0, y: 8.0, width: alert.view.bounds.size.width - 8.0 * 4.0, height: 100.0)
        let tableView = UITableView(frame: rect)
        tableView.delegate = self
        tableView.dataSource = self
        alert.view.addSubview(tableView)
        let cancel = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    
    @IBAction func myPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyPageVC") as! MyPageVC
        vc.books = self.books
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func starSelected(index: Int) {
        if !status[index] {
            alertWithOK(vc: self, message: "도서가 선택되었습니다.") {
                self.status[index] = !self.status[index]
                self.books.append(self.bookData[index])
                self.tableView.reloadData()
            }
        } else {
            alertWithOK(vc: self, message: "이미 선택된 도서입니다.") {}
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
        let image = try! Data(contentsOf: URL(string: bookData[row].thumbnail!)!)
        cell.selectionStyle = .none
        cell.index = row
        cell.bookTitle.text = bookData[row].name
        cell.bookAuthor.text = bookData[row].detail
        cell.bookImage.image = UIImage(data: image)
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
