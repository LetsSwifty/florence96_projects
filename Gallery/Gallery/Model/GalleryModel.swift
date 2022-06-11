//
//  PhotoModels.swift
//  Gallery
//
//  Created by Yejin Hong on 2022/06/09.
//

import Foundation

struct SearchInfo: Codable {
    var total: Int?
    var total_pages: Int?
    var results: [UrlInfo]?
}

struct UrlInfo: Codable {
    var id: String?
    var urls: SizeInfo?
}

struct SizeInfo: Codable {
    var regular: String?
}
