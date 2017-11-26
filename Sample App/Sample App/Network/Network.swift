//
//  Network.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/25/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

/// This class is responsible for constructing URLRequests and processing network responses.
///
/// Use this class to get the current Meh deal, like:
///     Network.shared.getCurrent { (root, response, error) in
///         if let root = root {
///             ...
///         } else {
///             ...
///         }
///     }
class Network {
    /// The application should use this shared property whenever a specific instance isn't needed.
    ///
    /// Unit tests should never use this, because unit tests shouldn't actually hit the network.
    static let shared = try! Network()
    
    /// Unfortunately, Swift doesn't have a generic Decoder.decode(_:from:) method.
    /// Thus, we have to use JSONDecoder. TODO: It would be nice to abstract it
    /// further into something like NetworkDecoder, but there's really no need,
    /// because this application is so tiny.
    static func defaultDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(MehISO8601.formatter)
        return decoder
    }
    
    /// The base URL that all requests should be based off of.
    let base: URL
    
    /// The network client to use.
    let client: NetworkClient
    
    /// Meh requires an API key to access its API. https://meh.com/forum/topics/meh-api
    private let apiKey: String
    
    /// The decoder to use.
    let decoder: JSONDecoder
    
    /// This class uses dependency injection for the client and decoder. Dependency
    /// injection is useful for testing (see NetworkTests.swift).
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
    
    /// Gets the current deal from the Meh API. If successful, then the root will be non-nil.
    ///
    /// It could be made nicer, but since there is only one network request for the entire app,
    /// such an abstraction would prove overkill. If more API calls are added, then the networking
    /// code below should be more abstracted and reusable.
    func getCurrent(callback: @escaping (MehRoot?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        let url = URL(string: "1/current.json?apikey=\(apiKey)", relativeTo: base)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return client.start(request: request, callback: { (data: Data?, response: URLResponse?, error: Error?) in
            let root: MehRoot?
            let decodingError: Error?
            
            // This is a little verbose, but it gets the job done well.
            if let data = data, error == nil {
                do {
                    root = try self.decoder.decode(MehRoot.self, from: data)
                    decodingError = nil
                } catch let e {
                    root = nil
                    decodingError = e
                }
            } else {
                root = nil
                decodingError = nil
            }
            
            DispatchQueue.main.async {
                callback(root, response, error ?? decodingError)
            }
        })
    }
}
