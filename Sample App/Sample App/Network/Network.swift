//
//  Network.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/25/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

class Network {
    static let shared = try! Network()
    
    let base: URL
    let client: NetworkClient
    
    private let apiKey: String
    
    init(base: URL = URL(string: "https://api.meh.com/")!, client: NetworkClient = URLSessionNetworkClient(), apiKey: String = Constants.apiKey) throws {
        self.base = base
        self.client = client
        self.apiKey = apiKey
    }
    
    func getCurrent(callback: @escaping (MehRoot?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        var request = URLRequest(url: base)
        request.httpMethod = "GET"
        return client.start(request: request, callback: { (data: Data?, response: URLResponse?, error: Error?) in
            
        })
    }
}
