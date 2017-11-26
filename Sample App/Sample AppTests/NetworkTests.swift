//
//  NetworkTests.swift
//  Sample AppTests
//
//  Created by Christopher Bryan Henderson on 11/25/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation
import XCTest
@testable import Sample_App

class NetworkTests: XCTestCase {
    class FakeClient: NetworkClient {
        let startClosure: (URLRequest, @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask
        
        init(startClosure: @escaping (URLRequest, @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask) {
            self.startClosure = startClosure
        }
        
        func start(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
            return startClosure(request, callback)
        }
    }
    
    func testSuccessfulCall() {
        let client = FakeClient(startClosure: { (request, callback) in
            let apiKey = Constants.apiKey
            let url = URL(string: "https://api.meh.com/1/current.json?apikey=\(apiKey)")!
            XCTAssert(request.url == url)
            XCTAssert(request.httpMethod == "GET")
            XCTAssert(request.httpBody == nil)
            let exampleURL = Bundle(for: DealParsingTests.self).url(forResource: "meh_sample", withExtension: "json")!
            
            let data: Data?
            let response: URLResponse?
            let _error: Error?
            do {
                data = try Data(contentsOf: exampleURL)
                response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: ["Content-Type": "application/json"])
                _error = nil
            } catch {
                data = nil
                response = nil
                _error = error
                XCTFail("Failed with error: \(error)")
            }
            
            DispatchQueue.global().async {
                callback(data, response, _error)
            }
            return URLSessionTask()
        })
        
        let expectation = self.expectation(description: "Waiting for request...")
        
        let network = try! Network(base: URL(string: "https://api.meh.com/")!, client: client)
        _ = network.getCurrent { (root: MehRoot?, response: URLResponse?, error: Error?) -> Void in
            XCTAssert(Thread.isMainThread)
            XCTAssert(root != nil)
            XCTAssert(response != nil)
            XCTAssert(error == nil)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Failed: \(error)")
            }
        }
    }
}
