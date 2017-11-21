//
//  MehDealTheme.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation
import UIColor_Hex_Swift
import UIKit

struct MehDealTheme: Decodable {
    enum CodingKeys: Swift.CodingKey {
        case accentColor
        case backgroundColor
        case backgroundImage
        case foreground
    }
    
    let accentColor: UIColor
    let backgroundColor: UIColor
    let backgroundImage: URL
    let foreground: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let accentColorString = try container.decode(String.self, forKey: .accentColor)
        accentColor = try UIColor(rgba_throws: accentColorString)
        
        let backgroundColorString = try container.decode(String.self, forKey: .backgroundColor)
        backgroundColor = try UIColor(rgba_throws: backgroundColorString)
        
        backgroundImage = try container.decode(URL.self, forKey: .backgroundImage)
        
        foreground = try container.decode(String.self, forKey: .foreground)
    }
}
