//
//  ResultExtractor.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

@testable import SkyMobileTest

func extract<T>(result: Result<T>) -> (error: Error?, value: T?) {
    switch result {
    case .success(let value):
        return (error: nil, value: value)
    case .error(let error):
        return (error: error, value: nil)
    }
}
