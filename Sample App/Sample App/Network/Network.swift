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
    
    static func defaultDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(MehISO8601.formatter)
        return decoder
    }
    
    let base: URL
    let client: NetworkClient
    private let apiKey: String
    let decoder: JSONDecoder
    
    init(
        base: URL = URL(string: "https://api.meh.com/")!,
        client: NetworkClient = URLSessionNetworkClient(),
        apiKey: String = Constants.apiKey,
        decoder: JSONDecoder = Network.defaultDecoder()
        ) throws
    {
        self.base = base
        self.client = client
        self.apiKey = apiKey
        self.decoder = decoder
    }
    
    func getCurrent(callback: @escaping (MehRoot?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        let url = URL(string: "1/current.json?apikey=\(apiKey)", relativeTo: base)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return client.start(request: request, callback: { (data: Data?, response: URLResponse?, error: Error?) in
            let root: MehRoot?
            let _error: Error?
            if let data = data {
                do {
                    root = try self.decoder.decode(MehRoot.self, from: data)
                    _error = nil
                } catch let decodingError {
                    root = nil
                    _error = decodingError
                }
            } else {
                root = nil
                _error = nil
            }
            DispatchQueue.main.async {
                callback(root, response, error ?? _error)
            }
        })
    }
}
