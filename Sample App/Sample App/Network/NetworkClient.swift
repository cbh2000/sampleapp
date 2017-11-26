//
//  NetworkClient.swift
//  Sample App
//
//  Created by Christopher Bryan Henderson on 11/25/17.
//  Copyright © 2017 Christopher Bryan Henderson. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func start(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask
}
