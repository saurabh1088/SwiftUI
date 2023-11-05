//
//  NetworkingService.swift
//  SwiftUILearnings
//
//  Created by Saurabh Verma on 31/10/23.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol NetworkingServiceProvider {
    associatedtype T: ServiceRequest
    associatedtype U: Codable
    
    func load(request: T, completion: @escaping (Result<Data>) -> Void)
    func load(request: T, decodedTo: U.Type, completion: @escaping (Result<U>) -> Void)
}

class NetworkingService<T: ServiceRequest, U: Codable> {
    var urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func load(request: T, completion: @escaping (Result<Data>) -> Void) {
        
    }
}

extension NetworkingService {
    private func makeRequest(_ request: URLRequest, 
                             onQueue: DispatchQueue = DispatchQueue.main,
                             completion: @escaping (Result<U>) -> Void) {
        urlSession.dataTask(with: request) { data, response, error in
            
        }
    }
}
