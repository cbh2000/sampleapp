//
//  MehDealStory.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/25/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

struct MehDealStory: Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case bodyMarkdown = "body"
    }
    
    let title: String
    let bodyMarkdown: String
}
