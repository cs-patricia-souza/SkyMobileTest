//
//  Decode.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Foundation

final class Decode {
    
    static func from<T: Decodable>(_ resource: String,
                                   withExtension: String,
                                   bundle: Bundle = Bundle.main,
                                   completion: @escaping HTTPCompletion<T>) {
        guard let url = bundle.url(forResource: resource, withExtension: withExtension) else {
            return completion(.error(CommonError.invalidPath))
        }
        
        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.error(CommonError.couldNotDecode))
        }
    }
}
