//
//  MehDealTopic.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

struct MehDealTopic: Decodable {
    let commentCount: Int
    let createdAt: Date
    let id: String
    let replyCount: Int
    let url: URL
    let voteCount: Int
}
