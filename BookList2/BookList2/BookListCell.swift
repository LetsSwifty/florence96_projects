//
//  BookListCell.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/07.
//

import Foundation
import UIKit

protocol BookListCellDelegate {
    func starSelected(index: Int)
}

class BookListCell: UITableViewCell {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var star: UIButton!
    
    var index: Int?
    var image: String?
    var name: String?
    var author: String?
    var status: Bool = false
    
    var delegate: BookListCellDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bookTitle.numberOfLines = 2
        bookAuthor.numberOfLines = 0
        starStatus(status: status)
    }
    
    @IBAction func starButton(_ sender: Any) {
        delegate?.starSelected(index: index!)
    }
    
    func starStatus(status: Bool){
        if status {
            star.tintColor = UIColor.red
            star.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            star.tintColor = UIColor.gray
            star.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
}
