//
//  HTTP.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import UIKit

protocol HttpProtocol {
    func request<T: Decodable>(_ service: SkyServiceProtocol,
                               completion: @escaping HTTPCompletion<T>)
    func request<T: Decodable>(_ service: SkyServiceProtocol, token: String,
                               completion: @escaping HTTPCompletion<T>)
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

typealias HTTPCompletion<T: Decodable> = (Result<T>) -> Void
typealias DataResult = (Result<Data>) -> Void

class Http: NSObject, HttpProtocol {
    let sessionConfig: URLSessionConfiguration
    private var decoder: JSONDecoder
    private var successCodes: Range<Int> = 200..<299
    
    init(decoder: JSONDecoder = JSONDecoder(),
         sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default) {
        sessionConfig.timeoutIntervalForRequest =  60.0
        sessionConfig.timeoutIntervalForResource = 80.0
        self.sessionConfig = sessionConfig
        self.decoder = decoder
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func request<T: Decodable>(_ service: SkyServiceProtocol,
                               completion: @escaping HTTPCompletion<T>) {
        executeRequest(service: service) { result in
            switch result {
            case .success(let data):
                self.decode(data: data, completion: completion)
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    func request<T: Decodable>(_ service: SkyServiceProtocol, token: String,
                               completion: @escaping HTTPCompletion<T>) {
        executeRequest(service: service, token: token) { result in
            switch result {
            case .success(let data):
                self.decode(data: data, completion: completion)
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    private func executeRequest(service: SkyServiceProtocol, token: String? = nil,
                                completion: @escaping DataResult) {
        var urlComponents = URLComponents(url: service.path, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = service.queryItems
        
        guard let url = urlComponents?.url else { return }
        print(url.absoluteString)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = service.params
        let printLog = String(data: urlRequest.httpBody ?? Data(), encoding: .utf8) ?? ""
        print(printLog)
        urlRequest.httpMethod = service.method.rawValue
        if let token = token {
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        sessionConfig.httpAdditionalHeaders = service.headers
        
        let urlSession = URLSession(configuration: sessionConfig,
                                    delegate: nil, delegateQueue: .main)
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if error != nil {
                print(error ?? "")
                completion(.error(HTTPError.noResponse))
                return
            } else {
                self.evaluateResponse(data: data,
                                      response: response,
                                      completion: completion)
            }
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        dataTask.resume()
    }
    
    private func evaluateResponse(data: Data?,
                                  response: URLResponse?,
                                  completion: @escaping DataResult) {
        print(String(data: data ?? Data(), encoding: .utf8) ?? "")
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(.error(HTTPError.noResponse))
            return
        }
        guard httpResponse.statusCode != 401 else {
            //Get error directly from SKY Services
            let error = NSError(domain:"unauthorizedAccess", code:httpResponse.statusCode, userInfo:nil)
            completion(.error(HTTPError.unauthorizedAccess(error)))
            return
        }
        guard self.successCodes.contains(httpResponse.statusCode) else {
            //Get error directly from SKY Services
            let error = NSError(domain:"unsuccesfulStatusCode", code:httpResponse.statusCode, userInfo:nil)
            completion(.error(HTTPError.unsuccesfulStatusCode(error)))
            return
        }
        
        guard let data = data else {
            completion(.error(HTTPError.noData(nil)))
            return
        }
        
        if data.isEmpty {
            completion(.success(emptyJson()))
            return
        }
        completion(.success(data))
    }
    
    func emptyJson() -> Data {
        let emptyJson = "{}".data(using: .utf8) ?? Data()
        return emptyJson
    }
    
    private func decode<T: Decodable>(data: Data, completion: @escaping HTTPCompletion<T>) {
        do {
            let result = try self.decoder.decode(T.self, from: data)
            completion(.success(result))
        } catch let error {
            completion(.error(HTTPError.noData(error)))
        }
    }
}

