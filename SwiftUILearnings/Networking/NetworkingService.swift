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

// TODO: This is not being used as of now, assess and remove if required.
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
        makeRequest(request.urlRequest, completion: completion)
    }
    
    func load(request: T, decodedTo: U.Type, completion: @escaping (Result<U>) -> Void) {
        makeRequest(request.urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(decodedTo, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension NetworkingService {
    private func makeRequest(_ request: URLRequest, 
                             onQueue: DispatchQueue = DispatchQueue.main,
                             completion: @escaping (Result<Data>) -> Void) {
        urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                onQueue.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                onQueue.async {
                    completion(.success(data))
                }
            }
        }.resume()
    }
}
