//
//  News.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import Foundation

struct News: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsBox: Codable {
    let status: String
    let totalResults: Int
    let articles: [News]
}
