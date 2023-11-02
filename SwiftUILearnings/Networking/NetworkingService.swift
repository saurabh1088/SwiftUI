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
