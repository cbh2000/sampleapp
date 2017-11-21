//
//  DealParsingTests.swift
//  Sample AppTests
//
//  Created by Christopher Bryan Henderson on 11/21/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation
import XCTest
@testable import Sample_App

class DealParsingTests: XCTestCase {
    func testFeaturesParsing() {
        let example = "- These microfiber sheets are made with only the microest of fibers\r\n- The king, queen, and full sets get 2 pillowcases each (so 4 total), the \"twin\" set paradoxically gets only 1 (so 2 total)\r\n- Having 2 sets of the same sheets makes the laundry-day-switchover much smoother\r\n- And having brand-new microfiber sheets makes sleeping much smoother\r\n- Model: IYSMICRO (The internet tells us that \"IYS\" could refer to the \"[International Year Of Sanitation](https://en.wikipedia.org/wiki/International_Year_of_Sanitation),\" a 2008 push by the United Nations to get college students to clean their sheets at least once per semester)."
    }
    
    func testIDParsing() {
        let example = "a6k5A000000CwLJQA0"
    }
    
    func testItemsParsing() {
        let example = """
[{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"White"}],"condition":"New","id":"110266","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110265","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110264","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Twin"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110263","price":18,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"White"}],"condition":"New","id":"110270","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110269","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110268","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Full"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110267","price":22,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"White"}],"condition":"New","id":"110278","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110277","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110276","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"Queen"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110275","price":26,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"White"}],"condition":"New","id":"110274","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Taupe"}],"condition":"New","id":"110273","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Silver"}],"condition":"New","id":"110272","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"},{"attributes":[{"key":"Size","value":"King"},{"key":"Color","value":"Sage"}],"condition":"New","id":"110271","price":29,"photo":"https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png"}]
"""
    }
    
    func testLaunchesParsing() {
        let example = """
[{"soldOutAt":"2017-11-21T12:57:17.775Z"},{"soldOutAt":null}]
"""
    }
    
    func testPhotosParsing() {
        let example = """
["https://res.cloudinary.com/mediocre/image/upload/v1511214860/ulzymtibqzkewyfpc0ow.png","http://res.cloudinary.com/mediocre/image/upload/v1511211224/cm9obc70ah4zzjq7eopt.png","http://res.cloudinary.com/mediocre/image/upload/v1511211227/r9bsnm2wnlbschnyybxd.png","https://res.cloudinary.com/mediocre/image/upload/v1511212455/po6qqnc4oeuo8dfovurr.png","http://res.cloudinary.com/mediocre/image/upload/v1511211224/c6duowpipdhbvqly3drc.png","http://res.cloudinary.com/mediocre/image/upload/v1511211226/k062fgvk01lmvaomhyv1.png","http://res.cloudinary.com/mediocre/image/upload/v1511211226/o249fjk6awqflat5fukd.png","http://res.cloudinary.com/mediocre/image/upload/v1511211222/dgoc8anwu5k1go8rzbjc.png","http://res.cloudinary.com/mediocre/image/upload/v1511211224/jr7gs6ks9xopquzbcung.png","http://res.cloudinary.com/mediocre/image/upload/v1511211222/nlhvqz9aer34v3nsptbw.png","https://res.cloudinary.com/mediocre/image/upload/v1511211628/gwahgjnc7vinna6ir2ao.png","https://res.cloudinary.com/mediocre/image/upload/v1511211647/kdachiulc4ke1rmm2652.png","https://res.cloudinary.com/mediocre/image/upload/v1511211666/jylqmv6js4uksxrwj6fw.png","https://res.cloudinary.com/mediocre/image/upload/v1511212325/fm5syzyvaqlzhsdp2wjl.png","https://res.cloudinary.com/mediocre/image/upload/v1511214266/wewp5vokyzg0agg93gnp.png"]
"""
    }
    
    func testTitleParsing() {
        let example = "2-for-Tuesday: Microfiber Sheets Sets"
    }
    
    func testSoldOutAtParsing() {
        // This field may not be present if it hasn't been sold out yet.
        let example = "2017-11-21T12:57:17.775Z"
    }
    
    func testSpecificationsParsing() {
        let example = "Specs\r\n====\r\n- Model: IYSMICRO\r\n- Condition: New\r\n- Made of microfiber\r\n- The fitted sheet fits right on your bed and then you sleep on it\r\n- The other sheet goes over you\r\n- The pillow case is like a hard suitcase for your pillow except it is soft and you put your head on it\r\n- Kinda like a non-portable sleeping bag\r\n\r\nWhat's in the Box?\r\n====\r\n2x Fitted sheet\r\n2x Top Sheet\r\n4x Pillow cases (ironically only 2x with Twin size)\r\n\r\nPictures\r\n====\r\n[Sheet colors](http://res.cloudinary.com/mediocre/image/upload/v1511211219/l4viytmqguzvpumkjt32.png)\r\n[bed](http://res.cloudinary.com/mediocre/image/upload/v1511211224/cm9obc70ah4zzjq7eopt.png)\r\n[Stack of white](http://res.cloudinary.com/mediocre/image/upload/v1511211227/r9bsnm2wnlbschnyybxd.png)\r\n[White](https://res.cloudinary.com/mediocre/image/upload/v1511212455/po6qqnc4oeuo8dfovurr.png)\r\n[Taupe](http://res.cloudinary.com/mediocre/image/upload/v1511211224/c6duowpipdhbvqly3drc.png)\r\n[Stack of taupe](http://res.cloudinary.com/mediocre/image/upload/v1511211226/k062fgvk01lmvaomhyv1.png)\r\n[Taupe sheet](http://res.cloudinary.com/mediocre/image/upload/v1511211226/o249fjk6awqflat5fukd.png)\r\n[Sage](http://res.cloudinary.com/mediocre/image/upload/v1511211222/dgoc8anwu5k1go8rzbjc.png)\r\n[Stack of Sage](http://res.cloudinary.com/mediocre/image/upload/v1511211224/jr7gs6ks9xopquzbcung.png)\r\n[Sage sheet](http://res.cloudinary.com/mediocre/image/upload/v1511211222/nlhvqz9aer34v3nsptbw.png)\r\n[Silver](https://res.cloudinary.com/mediocre/image/upload/v1511211628/gwahgjnc7vinna6ir2ao.png)\r\n[Silver stack](https://res.cloudinary.com/mediocre/image/upload/v1511211647/kdachiulc4ke1rmm2652.png)\r\n[Silver sheet](https://res.cloudinary.com/mediocre/image/upload/v1511211666/jylqmv6js4uksxrwj6fw.png)\r\n[Shitty packaging](https://res.cloudinary.com/mediocre/image/upload/v1511212325/fm5syzyvaqlzhsdp2wjl.png)\r\n\r\nPrice Comparison\r\n====\r\n[$27.98 - $49.98 (for 2) at Amazon](https://www.amazon.com/dp/B06X9T1HMK/?tag=meh0ec-20)"
    }
    
    func testStoryParsing() {
        let example = """
{"title":"Consider The Hedgehog","body":"Hedgehogs have roughly the same life expectancy as bedsheets â€” about 5 years. Yet when their beloved pets die, most responsible hedgehog owners dispose of them in a proper manner. Many sheet owners, however, cling to their tattered linens long, long after their time on this earth has passed.\r\n\r\nIt may be time for you to take a good look at your sheets and decide whether itâ€™s time to let go. We know itâ€™s not an easy decision. You might need some time together to decide (or mourn).\r\n\r\nWeâ€™re not saying all sheets die by year 5. High-quality or lightly used ones can last up to a decade. But for the most part, even the most expensive sheets expire in much less time.\r\n\r\nNor are we saying that the sheets cannot be used after being stretched, faded, and pilled. Just as a pet hedgehog whose spirit has passed from this corporeal realm can still be cuddled and given food, old sheets can still be used, albeit in a macabre dance of death.\r\n\r\nRemember when you learned that underwear eventually dies? Maybe you were in your 20s and your girlfriend or boyfriend at the time pointed out that the elastic in your oldest pair of drawers no longer held them tightly to your body, but merely draped them over your hips like a renaissance Venus. Before that moment you had assumed that a good pair of underwear should be immortal. After, that you should toss out your oldest undies every so often.\r\n\r\nThe problem lies in the slow nature of this death. Unlike biological creatures which pass from â€œaliveâ€ to â€œdeadâ€ in a very discrete manner, sheets lose their vital spirit so slowly that it can be difficult to perceive. â€œThese sheets are still good,â€ you tell yourself, because at no point did anything drastically change. But if you were an outsider inspecting your old sheets for the first time, you would immediately see that theyâ€™re more dead than alive.\r\n\r\nWeâ€™re not trying to hard-sell these sheets. You can buy them or you can not buy them and weâ€™ll still be happy youâ€™re here. Weâ€™re just suggesting that sheets should be considered a *consumable* product that one replaces regularly, like batteries, iPhones, or hedgehogs."}
"""
    }
    
    func testThemeParsing() {
        let example = """
{"accentColor":"#2b203e","backgroundColor":"#8E7dad","backgroundImage":"https://res.cloudinary.com/mediocre/image/upload/v1511211099/ihdi3matbpiihi6lqhxo.jpg","foreground":"dark"}
""".data(using: .utf8)!
        do {
            let theme = try JSONDecoder().decode(MehDealTheme.self, from: example)
            
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
"""
    }
    
    func testURLParsing() {
        let example = "https://meh.com/deals/2-for-tuesday-microfiber-sheets-sets"
    }
}
