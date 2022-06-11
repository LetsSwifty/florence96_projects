//
//  BookListCellinXib.swift
//  BookList2
//
//  Created by Yejin Hong on 2022/05/23.
//

import UIKit

protocol BookListCellDelegate {
    func starSelected(index: IndexPath)
}

class BookListCellinXib: UITableViewCell {
    @IBOutlet weak var bookThumbnail: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var star: UIButton!
    
    var index: IndexPath?
    var image: String?
    var name: String?
    var author: String?
    var status: Bool = false
    
    var delegate: BookListCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bookTitle.numberOfLines = 2
        bookAuthor.numberOfLines = 2
        starStatus(status: status)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func starButton(_ sender: Any) {
        delegate?.starSelected(index: index!)
        print("index = \(index)")
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
