//
//  MehDeal.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

struct MehDeal: Decodable {
    enum CodingKeys: String, CodingKey {
        case featuresMarkdown = "features"
        case id
        case items
        case photos
        case purchaseQuantity
        case title
        case specificationsMarkdown = "specifications"
        case story
        case theme
        case url
        case launches
        case topic
    }
    
    let featuresMarkdown: String
    let id: String
    let items: [MehDealItem]
    let photos: [URL]
    let purchaseQuantity: MehDealPurchaseQuantity
    let title: String
    let specificationsMarkdown: String
    let story: MehDealStory
    let theme: MehDealTheme
    let url: URL
    let launches: [MehDealLaunch]
    let topic: MehDealTopic
}
