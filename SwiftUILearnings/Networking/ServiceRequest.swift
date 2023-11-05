//
//  ServiceRequest.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 02/11/23.
//

import Foundation

protocol ServiceRequest {
    var baseURL: String { get }
    var path: String { get }
    var params: [String: Any]? { get }
    var httpMethod: HTTPMethods { get }
}

extension ServiceRequest {
    var urlRequest: URLRequest {
        guard let url = self.url else { fatalError("Error") }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        return request
    }
    
    var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path
        
        if httpMethod == .GET {
            guard let queryParams = params as? [String: String] else {
                fatalError("Error")
            }
            urlComponents?.queryItems = queryParams.map({ URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        return urlComponents?.url
    }
}
