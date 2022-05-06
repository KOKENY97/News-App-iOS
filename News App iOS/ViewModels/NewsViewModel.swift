//
//  NewsViewModel.swift
//  News App iOS
//
//  Created by user209843 on 5/6/22.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://ichef.bbci.co.uk/news/640/cpsprodpb/133CB/production/_103759787_gettyimages-949493748.jpg"
    }
}
