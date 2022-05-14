//
//  MyPageCell.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/08.
//

import Foundation
import UIKit

protocol MyPageDelegate {
    func deleteBook(index: Int?)
}

class MyPageCell: UITableViewCell {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var index: Int?
    var delegate: MyPageDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        deleteButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        deleteButton.tintColor = UIColor.gray
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteBook(index: index)
    }
}
