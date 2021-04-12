//
//  SkyProtocol.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Foundation

protocol SkyServiceProtocol {
    var path: URL { get }
    var method: HttpMethod { get }
    var params: Data? { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String] { get }
}

extension SkyServiceProtocol {
    var baseURL: URL {
        if let url = Bundle.main.infoDictionary?["SKYSERVICE_BASE_URL"] as? String,
            let baseURL = URL(string: url) {
            return baseURL
        }
        print("Error could not get the service URL")
        return URL(string: "https://sky-exercise.herokuapp.com")!
    }
    
    func encode<T: Encodable>(model: T) -> Data? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            return try jsonEncoder.encode(model)
        } catch {
            return nil
        }
    }
    
    func getStubURL(with resource: String) -> URL {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else {
            print("Error could not get the path to \(resource).json")
            return URL(string: "")!
        }
        return URL(fileURLWithPath: url.path)
    }
}
