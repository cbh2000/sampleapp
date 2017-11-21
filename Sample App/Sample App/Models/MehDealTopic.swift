//
//  MehDealTopic.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

struct MehDealTopic: Decodable {
    enum CodingKeys: CodingKey{
        case commentCount
        case createdAt
        case id
        case replyCount
        case url
        case voteCount
    }

    struct InvalidDateFormatError: Error {
        var localizedDescription: String {
            return "Invalid date format encountered in JSON."
        }
    }
    
    private static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX") // SUPER important--prevents app breakage with different locales!
        return formatter
    }()
    
    let commentCount: Int
    let createdAt: Date
    let id: String
    let replyCount: Int
    let url: URL
    let voteCount: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        commentCount = try container.decode(Int.self, forKey: .commentCount)

        let dateString = try container.decode(String.self, forKey: .createdAt)
        guard let date = MehDealTopic.dateFormatter.date(from: dateString) else {
            throw InvalidDateFormatError()
        }
        createdAt = date

        id = try container.decode(String.self, forKey: .id)
        replyCount = try container.decode(Int.self, forKey: .replyCount)
        url = try container.decode(URL.self, forKey: .url)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
    }
}
