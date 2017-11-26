//
//  URLSessionNetworkClient.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/25/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

class URLSessionNetworkClient: NetworkClient {
    func start(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler: callback)
        task.resume()
        return task
    }
}
