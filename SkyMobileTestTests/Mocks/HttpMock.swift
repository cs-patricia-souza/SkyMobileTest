//
//  HttpMock.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Foundation

@testable import SkyMobileTest

class HttpMock: HttpProtocol {
    var calledWithService: Bool = false
    
    func request<T>(_ service: SkyServiceProtocol,
                    completion: @escaping (Result<T>) -> Void) where T: Decodable {
        self.calledWithService = true
    }
    
    func request<T>(_ service: SkyServiceProtocol, token: String,
                    completion: @escaping (Result<T>) -> Void) where T: Decodable {
        self.calledWithService = true
    }
}
