//
//  MehDeal.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

struct MehDeal: Decodable {
    let features: String
    let id: String
    let items: [MehDealItem]
    let photos: [URL]
    let purchaseQuantity: MehDealPurchaseQuantity
    let title: String
    let specifications: String
    let story: MehDealStory
    let theme: MehDealTheme
    let url: URL
    let launches: [MehDealLaunch]
    let topic: MehDealTopic
}
