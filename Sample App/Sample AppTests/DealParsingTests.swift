//
//  DealParsingTests.swift
//  Sample AppTests
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation
import XCTest
import Down
@testable import Sample_App

class DealParsingTests: XCTestCase {
    let decoder = { () -> JSONDecoder in
        var decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(MehISO8601.formatter)
        return decoder
    }()
    
    func testItemsParsing() {
        let example = """
[{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"White"}],"condition":"New","id":"110266","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110265","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110264","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110263","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"White"}],"condition":"New","id":"110270","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110269","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110268","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110267","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"White"}],"condition":"New","id":"110278","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110277","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110276","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110275","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"White"}],"condition":"New","id":"110274","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110273","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110272","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110271","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"}]
""".data(using: .utf8)!
        
        do {
            let items = try decoder.decode([MehDealItem].self, from: example)
            
            guard items.count == 16 else {
                XCTFail("Expected 16 items, but got \(items.count).")
                return
            }
            
            // There are too many items to test all of them. We'll just test the first and last items.
            
            // First item.
            //
            // {"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"White"}],"condition":"New","id":"110266","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"}
            guard items[0].attributes.count == 2 else {
                XCTFail("Expected item 0 to have 2 attributes, but it has \(items[0].attributes.count).")
                return
            }
            XCTAssert(items[0].attributes[0].key == "Size")
            XCTAssert(items[0].attributes[0].value == "Twin")
            XCTAssert(items[0].attributes[1].key == "Color")
            XCTAssert(items[0].attributes[1].value == "White")
            XCTAssert(items[0].condition == "New")
            XCTAssert(items[0].id == "110266")
            XCTAssert(items[0].price == 18)
            XCTAssert(items[0].photo == URL(string: "https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png")!)
            
            // Last item.
            //
            // {"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110271","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"}
            guard items[15].attributes.count == 2 else {
                XCTFail("Expected item 0 to have 2 attributes, but it has \(items[15].attributes.count).")
                return
            }
            XCTAssert(items[15].attributes[0].key == "Size")
            XCTAssert(items[15].attributes[0].value == "King")
            XCTAssert(items[15].attributes[1].key == "Color")
            XCTAssert(items[15].attributes[1].value == "Sage")
            XCTAssert(items[15].condition == "New")
            XCTAssert(items[15].id == "110271")
            XCTAssert(items[15].price == 29)
            XCTAssert(items[15].photo == URL(string: "https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png")!)
        } catch {
            XCTFail("Failed with error \(error)")
        }
    }
    
    func testLaunchesParsing() {
        let example = """
[{"soldOutAt":"2017-11-21T12:57:17.775Z"},{"soldOutAt":null}]
""".data(using: .utf8)!
        
        do {
            let launches = try decoder.decode([MehDealLaunch].self, from: example)
            
            guard launches.count == 2 else {
                XCTFail("Expected 2 launches, but got \(launches.count)")
                return
            }
            
            let firstSoldOutAt = Date(timeIntervalSince1970: 1511269037.775)
            XCTAssert(launches[0].soldOutAt == firstSoldOutAt)
            
            XCTAssert(launches[1].soldOutAt == nil)
        } catch {
            XCTFail("Failed with error \(error)")
        }
    }
    
    func testPhotosParsing() {
        let example = """
["https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png","http://res.cloudinary.com/mediocre/image/upload/v1511211224/cm9obc70ah4zzjq7eopt.png","http://res.cloudinary.com/mediocre/image/upload/v1511211227/r9bsnm2wnlbschnyybxd.png","https://res.cloudinary.com/mediocre/image/upload/v1511212455/po6qqnc4oeuo8dfovurr.png","http://res.cloudinary.com/mediocre/image/upload/v1511211224/c6duowpipdhbvqly3drc.png","http://res.cloudinary.com/mediocre/image/upload/v1511211226/k062fgvk01lmvaomhyv1.png","http://res.cloudinary.com/mediocre/image/upload/v1511211226/o249fjk6awqflat5fukd.png","http://res.cloudinary.com/mediocre/image/upload/v1511211222/dgoc8anwu5k1go8rzbjc.png","http://res.cloudinary.com/mediocre/image/upload/v1511211224/jr7gs6ks9xopquzbcung.png","http://res.cloudinary.com/mediocre/image/upload/v1511211222/nlhvqz9aer34v3nsptbw.png","https://res.cloudinary.com/mediocre/image/upload/v1511211628/gwahgjnc7vinna6ir2ao.png","https://res.cloudinary.com/mediocre/image/upload/v1511211647/kdachiulc4ke1rmm2652.png","https://res.cloudinary.com/mediocre/image/upload/v1511211666/jylqmv6js4uksxrwj6fw.png","https://res.cloudinary.com/mediocre/image/upload/v1511212325/fm5syzyvaqlzhsdp2wjl.png","https://res.cloudinary.com/mediocre/image/upload/v1511214266/wewp5vokyzg0agg93gnp.png"]
""".data(using: .utf8)!
        
        do {
            let photos = try decoder.decode([URL].self, from: example)
            
            let shouldBe: [String] = [
                "https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211224/cm9obc70ah4zzjq7eopt.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211227/r9bsnm2wnlbschnyybxd.png",
                "https://res.cloudinary.com/mediocre/image/upload/v1511212455/po6qqnc4oeuo8dfovurr.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211224/c6duowpipdhbvqly3drc.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211226/k062fgvk01lmvaomhyv1.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211226/o249fjk6awqflat5fukd.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211222/dgoc8anwu5k1go8rzbjc.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211224/jr7gs6ks9xopquzbcung.png",
                "http://res.cloudinary.com/mediocre/image/upload/v1511211222/nlhvqz9aer34v3nsptbw.png",
                "https://res.cloudinary.com/mediocre/image/upload/v1511211628/gwahgjnc7vinna6ir2ao.png",
                "https://res.cloudinary.com/mediocre/image/upload/v1511211647/kdachiulc4ke1rmm2652.png",
                "https://res.cloudinary.com/mediocre/image/upload/v1511211666/jylqmv6js4uksxrwj6fw.png",
                "https://res.cloudinary.com/mediocre/image/upload/v1511212325/fm5syzyvaqlzhsdp2wjl.png",
                "https://res.cloudinary.com/mediocre/image/upload/v1511214266/wewp5vokyzg0agg93gnp.png"
            ]
            let shouldBeURLs = shouldBe.map { URL(string: $0)! }
            XCTAssert(shouldBeURLs == photos)
        } catch {
            XCTFail("Failed with error \(error)")
        }
    }
    
    func testSpecificationsParsing() {
        let example = "Specs\r\n====\r\n- Model: IYSMICRO\r\n- Condition: New\r\n- Made of microfiber\r\n- The fitted sheet fits right on your bed and then you sleep on it\r\n- The other sheet goes over you\r\n- The pillow case is like a hard suitcase for your pillow except it is soft and you put your head on it\r\n- Kinda like a non-portable sleeping bag\r\n\r\nWhat's in the Box?\r\n====\r\n2x Fitted sheet\r\n2x Top Sheet\r\n4x Pillow cases (ironically only 2x with Twin size)\r\n\r\nPictures\r\n====\r\n[Sheet colors](http://res.cloudinary.com/mediocre/image/upload/v1511211219/l4viytmqguzvpumkjt32.png)\r\n[bed](http://res.cloudinary.com/mediocre/image/upload/v1511211224/cm9obc70ah4zzjq7eopt.png)\r\n[Stack of white](http://res.cloudinary.com/mediocre/image/upload/v1511211227/r9bsnm2wnlbschnyybxd.png)\r\n[White](https://res.cloudinary.com/mediocre/image/upload/v1511212455/po6qqnc4oeuo8dfovurr.png)\r\n[Taupe](http://res.cloudinary.com/mediocre/image/upload/v1511211224/c6duowpipdhbvqly3drc.png)\r\n[Stack of taupe](http://res.cloudinary.com/mediocre/image/upload/v1511211226/k062fgvk01lmvaomhyv1.png)\r\n[Taupe sheet](http://res.cloudinary.com/mediocre/image/upload/v1511211226/o249fjk6awqflat5fukd.png)\r\n[Sage](http://res.cloudinary.com/mediocre/image/upload/v1511211222/dgoc8anwu5k1go8rzbjc.png)\r\n[Stack of Sage](http://res.cloudinary.com/mediocre/image/upload/v1511211224/jr7gs6ks9xopquzbcung.png)\r\n[Sage sheet](http://res.cloudinary.com/mediocre/image/upload/v1511211222/nlhvqz9aer34v3nsptbw.png)\r\n[Silver](https://res.cloudinary.com/mediocre/image/upload/v1511211628/gwahgjnc7vinna6ir2ao.png)\r\n[Silver stack](https://res.cloudinary.com/mediocre/image/upload/v1511211647/kdachiulc4ke1rmm2652.png)\r\n[Silver sheet](https://res.cloudinary.com/mediocre/image/upload/v1511211666/jylqmv6js4uksxrwj6fw.png)\r\n[Shitty packaging](https://res.cloudinary.com/mediocre/image/upload/v1511212325/fm5syzyvaqlzhsdp2wjl.png)\r\n\r\nPrice Comparison\r\n====\r\n[$27.98 - $49.98 (for 2) at Amazon](https://www.amazon.com/dp/B06X9T1HMK/?tag=meh0ec-20)"
    }
    
    func testStoryParsing() {
        let example = """
{"title":"Consider The Hedgehog","body":"Hedgehogs have roughly the same life expectancy as bedsheets â€” about 5 years. Yet when their beloved pets die, most responsible hedgehog owners dispose of them in a proper manner. Many sheet owners, however, cling to their tattered linens long, long after their time on this earth has passed.\\r\\n\\r\\nIt may be time for you to take a good look at your sheets and decide whether itâ€™s time to let go. We know itâ€™s not an easy decision. You might need some time together to decide (or mourn).\\r\\n\\r\\nWeâ€™re not saying all sheets die by year 5. High-quality or lightly used ones can last up to a decade. But for the most part, even the most expensive sheets expire in much less time.\\r\\n\\r\\nNor are we saying that the sheets cannot be used after being stretched, faded, and pilled. Just as a pet hedgehog whose spirit has passed from this corporeal realm can still be cuddled and given food, old sheets can still be used, albeit in a macabre dance of death.\\r\\n\\r\\nRemember when you learned that underwear eventually dies? Maybe you were in your 20s and your girlfriend or boyfriend at the time pointed out that the elastic in your oldest pair of drawers no longer held them tightly to your body, but merely draped them over your hips like a renaissance Venus. Before that moment you had assumed that a good pair of underwear should be immortal. After, that you should toss out your oldest undies every so often.\\r\\n\\r\\nThe problem lies in the slow nature of this death. Unlike biological creatures which pass from â€œaliveâ€ to â€œdeadâ€ in a very discrete manner, sheets lose their vital spirit so slowly that it can be difficult to perceive. â€œThese sheets are still good,â€ you tell yourself, because at no point did anything drastically change. But if you were an outsider inspecting your old sheets for the first time, you would immediately see that theyâ€™re more dead than alive.\\r\\n\\r\\nWeâ€™re not trying to hard-sell these sheets. You can buy them or you can not buy them and weâ€™ll still be happy youâ€™re here. Weâ€™re just suggesting that sheets should be considered a *consumable* product that one replaces regularly, like batteries, iPhones, or hedgehogs."}
""".data(using: .utf8)!
        
        do {
            let story = try decoder.decode(MehDealStory.self, from: example)
            
            let title = "Consider The Hedgehog"
            XCTAssert(story.title == title)
            
            let markdown = "Hedgehogs have roughly the same life expectancy as bedsheets â€” about 5 years. Yet when their beloved pets die, most responsible hedgehog owners dispose of them in a proper manner. Many sheet owners, however, cling to their tattered linens long, long after their time on this earth has passed.\r\n\r\nIt may be time for you to take a good look at your sheets and decide whether itâ€™s time to let go. We know itâ€™s not an easy decision. You might need some time together to decide (or mourn).\r\n\r\nWeâ€™re not saying all sheets die by year 5. High-quality or lightly used ones can last up to a decade. But for the most part, even the most expensive sheets expire in much less time.\r\n\r\nNor are we saying that the sheets cannot be used after being stretched, faded, and pilled. Just as a pet hedgehog whose spirit has passed from this corporeal realm can still be cuddled and given food, old sheets can still be used, albeit in a macabre dance of death.\r\n\r\nRemember when you learned that underwear eventually dies? Maybe you were in your 20s and your girlfriend or boyfriend at the time pointed out that the elastic in your oldest pair of drawers no longer held them tightly to your body, but merely draped them over your hips like a renaissance Venus. Before that moment you had assumed that a good pair of underwear should be immortal. After, that you should toss out your oldest undies every so often.\r\n\r\nThe problem lies in the slow nature of this death. Unlike biological creatures which pass from â€œaliveâ€ to â€œdeadâ€ in a very discrete manner, sheets lose their vital spirit so slowly that it can be difficult to perceive. â€œThese sheets are still good,â€ you tell yourself, because at no point did anything drastically change. But if you were an outsider inspecting your old sheets for the first time, you would immediately see that theyâ€™re more dead than alive.\r\n\r\nWeâ€™re not trying to hard-sell these sheets. You can buy them or you can not buy them and weâ€™ll still be happy youâ€™re here. Weâ€™re just suggesting that sheets should be considered a *consumable* product that one replaces regularly, like batteries, iPhones, or hedgehogs."
            XCTAssert(story.bodyMarkdown == markdown)
        } catch {
            XCTFail("Failed with error \(error)")
        }
    }
    
    func testThemeParsing() {
        let example = """
{"accentColor":"#2b203e","backgroundColor":"#8E7dad","backgroundImage":"https://res.cloudinary.com/mediocre/image/upload/v1511211099/ihdi3matbpiihi6lqhxo.jpg","foreground":"dark"}
""".data(using: .utf8)!
        do {
            let theme = try decoder.decode(MehDealTheme.self, from: example)
            
            let accentColor = UIColor(
                red: CGFloat(0x2b) / CGFloat(0xff),
                green: CGFloat(0x20) / CGFloat(0xff),
                blue: CGFloat(0x3e) / CGFloat(0xff),
                alpha: 1
            )
            XCTAssert(theme.accentColor == accentColor)
            
            let backgroundColor = UIColor(
                red: CGFloat(0x8e) / CGFloat(0xff),
                green: CGFloat(0x7d) / CGFloat(0xff),
                blue: CGFloat(0xad) / CGFloat(0xff),
                alpha: 1
            )
            XCTAssert(theme.backgroundColor == backgroundColor)
            
            let backgroundImage = URL(string: "https://res.cloudinary.com/mediocre/image/upload/v1511211099/ihdi3matbpiihi6lqhxo.jpg")!
            XCTAssert(theme.backgroundImage == backgroundImage)
            
            let foreground = "dark"
            XCTAssert(theme.foreground == foreground)
        } catch {
            XCTFail("Failed to parse: \(error)")
        }
    }
    
    func testTopicParsing() {
        let example = """
{"commentCount":35,"createdAt":"2017-11-21T05:00:05.645Z","id":"5a13b2d5cb6c920d90c23562","replyCount":26,"url":"https://meh.com/forum/topics/2-for-tuesday-microfiber-sheets-sets","voteCount":1}
""".data(using: .utf8)!
        do {
            let topic = try decoder.decode(MehDealTopic.self, from: example)
            
            let commentCount = 35
            XCTAssert(topic.commentCount == commentCount)
            
            let createdAt = Date(timeIntervalSince1970: 1511240405.645)
            XCTAssert(topic.createdAt == createdAt)
            
            let id = "5a13b2d5cb6c920d90c23562"
            XCTAssert(topic.id == id)
            
            let replyCount = 26
            XCTAssert(topic.replyCount == replyCount)
            
            let url = URL(string: "https://meh.com/forum/topics/2-for-tuesday-microfiber-sheets-sets")!
            XCTAssert(topic.url == url)
            
            let voteCount = 1
            XCTAssert(topic.voteCount == voteCount)
        } catch {
            XCTFail("Failed to parse: \(error)")
        }
    }
    
    func testPurchaseQuantityParsing() {
        let example = """
{"maximumLimit":3,"minimumLimit":1}
""".data(using: .utf8)!
        
        do {
            let quantity = try decoder.decode(MehDealPurchaseQuantity.self, from: example)
            XCTAssert(quantity.maximumLimit == 3)
            XCTAssert(quantity.minimumLimit == 1)
        } catch {
            XCTFail("Failed with error \(error)")
        }
    }
    
    func testParsingEntireDealObject() {
        let exampleURL = Bundle(for: DealParsingTests.self).url(forResource: "meh_sample", withExtension: "json")!
        
        do {
            let example = try Data(contentsOf: exampleURL)
            
            let root = try decoder.decode(MehRoot.self, from: example)
            let deal = root.deal
            
            let features = "- These microfiber sheets are made with only the microest of fibers\r\n- The king, queen, and full sets get 2 pillowcases each (so 4 total), the \"twin\" set paradoxically gets only 1 (so 2 total)\r\n- Having 2 sets of the same sheets makes the laundry-day-switchover much smoother\r\n- And having brand-new microfiber sheets makes sleeping much smoother\r\n- Model: IYSMICRO (The internet tells us that \"IYS\" could refer to the \"[International Year Of Sanitation](https://en.wikipedia.org/wiki/International_Year_of_Sanitation),\" a 2008 push by the United Nations to get college students to clean their sheets at least once per semester)."
            XCTAssert(deal.features == features)
            XCTAssert(deal.id == "a6k5A000000CwLJQA0")
            XCTAssert(deal.items.count == 16)
            XCTAssert(deal.photos.count == 15)
            
            XCTAssert(deal.purchaseQuantity.maximumLimit == 3)
            XCTAssert(deal.purchaseQuantity.minimumLimit == 1)
            
            XCTAssert(deal.title == "2-for-Tuesday: Microfiber Sheets Sets")
            XCTAssert(deal.specifications == "Specs\r\n====\r\n- Model: IYSMICRO\r\n- Condition: New\r\n- Made of microfiber\r\n- The fitted sheet fits right on your bed and then you sleep on it\r\n- The other sheet goes over you\r\n- The pillow case is like a hard suitcase for your pillow except it is soft and you put your head on it\r\n- Kinda like a non-portable sleeping bag\r\n\r\nWhat's in the Box?\r\n====\r\n2x Fitted sheet\r\n2x Top Sheet\r\n4x Pillow cases (ironically only 2x with Twin size)\r\n\r\nPictures\r\n====\r\n[Sheet colors](http://res.cloudinary.com/mediocre/image/upload/v1511211219/l4viytmqguzvpumkjt32.png)\r\n[bed](http://res.cloudinary.com/mediocre/image/upload/v1511211224/cm9obc70ah4zzjq7eopt.png)\r\n[Stack of white](http://res.cloudinary.com/mediocre/image/upload/v1511211227/r9bsnm2wnlbschnyybxd.png)\r\n[White](https://res.cloudinary.com/mediocre/image/upload/v1511212455/po6qqnc4oeuo8dfovurr.png)\r\n[Taupe](http://res.cloudinary.com/mediocre/image/upload/v1511211224/c6duowpipdhbvqly3drc.png)\r\n[Stack of taupe](http://res.cloudinary.com/mediocre/image/upload/v1511211226/k062fgvk01lmvaomhyv1.png)\r\n[Taupe sheet](http://res.cloudinary.com/mediocre/image/upload/v1511211226/o249fjk6awqflat5fukd.png)\r\n[Sage](http://res.cloudinary.com/mediocre/image/upload/v1511211222/dgoc8anwu5k1go8rzbjc.png)\r\n[Stack of Sage](http://res.cloudinary.com/mediocre/image/upload/v1511211224/jr7gs6ks9xopquzbcung.png)\r\n[Sage sheet](http://res.cloudinary.com/mediocre/image/upload/v1511211222/nlhvqz9aer34v3nsptbw.png)\r\n[Silver](https://res.cloudinary.com/mediocre/image/upload/v1511211628/gwahgjnc7vinna6ir2ao.png)\r\n[Silver stack](https://res.cloudinary.com/mediocre/image/upload/v1511211647/kdachiulc4ke1rmm2652.png)\r\n[Silver sheet](https://res.cloudinary.com/mediocre/image/upload/v1511211666/jylqmv6js4uksxrwj6fw.png)\r\n[Shitty packaging](https://res.cloudinary.com/mediocre/image/upload/v1511212325/fm5syzyvaqlzhsdp2wjl.png)\r\n\r\nPrice Comparison\r\n====\r\n[$27.98 - $49.98 (for 2) at Amazon](https://www.amazon.com/dp/B06X9T1HMK/?tag=meh0ec-20)")
            
            XCTAssert(deal.story.title == "Consider The Hedgehog")
            XCTAssert(deal.story.bodyMarkdown == "Hedgehogs have roughly the same life expectancy as bedsheets â€” about 5 years. Yet when their beloved pets die, most responsible hedgehog owners dispose of them in a proper manner. Many sheet owners, however, cling to their tattered linens long, long after their time on this earth has passed.\r\n\r\nIt may be time for you to take a good look at your sheets and decide whether itâ€™s time to let go. We know itâ€™s not an easy decision. You might need some time together to decide (or mourn).\r\n\r\nWeâ€™re not saying all sheets die by year 5. High-quality or lightly used ones can last up to a decade. But for the most part, even the most expensive sheets expire in much less time.\r\n\r\nNor are we saying that the sheets cannot be used after being stretched, faded, and pilled. Just as a pet hedgehog whose spirit has passed from this corporeal realm can still be cuddled and given food, old sheets can still be used, albeit in a macabre dance of death.\r\n\r\nRemember when you learned that underwear eventually dies? Maybe you were in your 20s and your girlfriend or boyfriend at the time pointed out that the elastic in your oldest pair of drawers no longer held them tightly to your body, but merely draped them over your hips like a renaissance Venus. Before that moment you had assumed that a good pair of underwear should be immortal. After, that you should toss out your oldest undies every so often.\r\n\r\nThe problem lies in the slow nature of this death. Unlike biological creatures which pass from â€œaliveâ€ to â€œdeadâ€ in a very discrete manner, sheets lose their vital spirit so slowly that it can be difficult to perceive. â€œThese sheets are still good,â€ you tell yourself, because at no point did anything drastically change. But if you were an outsider inspecting your old sheets for the first time, you would immediately see that theyâ€™re more dead than alive.\r\n\r\nWeâ€™re not trying to hard-sell these sheets. You can buy them or you can not buy them and weâ€™ll still be happy youâ€™re here. Weâ€™re just suggesting that sheets should be considered a *consumable* product that one replaces regularly, like batteries, iPhones, or hedgehogs.")
            
            XCTAssert(deal.theme.accentColor == UIColor(red: CGFloat(0x2b) / 255.0, green: CGFloat(0x20) / 255.0, blue: CGFloat(0x3e) / 255.0, alpha: 1.0))
            // Assume other fields are fine on theme.
            
            XCTAssert(deal.url == URL(string: "https://meh.com/deals/2-for-tuesday-microfiber-sheets-sets")!)
            XCTAssert(deal.launches.count == 2)
            
            XCTAssert(deal.topic.id == "5a13b2d5cb6c920d90c23562")
            // Assume other fields are fine on topic.
        } catch {
            XCTFail("Failed with error \(error)")
        }
    }
}
