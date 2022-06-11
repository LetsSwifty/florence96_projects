//
//  GalleryCell.swift
//  Gallery
//
//  Created by Yejin Hong on 2022/06/11.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.image = UIImage(systemName: "photo.artframe")
        imageView.contentMode = .scaleAspectFill
    }
}
