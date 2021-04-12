//
//  ResultsTests.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Quick
import Nimble

@testable import SkyMobileTest

class ResultTests: QuickSpec {
    override func spec() {
        
        describe("when used in a function that returns success") {
            it("returns success with correct value") {
                
                var returnedString: String?
                var returnedError: Error?
                
                func aFunction(completion: @escaping (Result<String>) -> Void) {
                    completion(.success("returnedString"))
                }
                
                aFunction { result in
                    switch result {
                    case .success(let string):
                        returnedString = string
                    case .error(let error):
                        returnedError = error
                    }
                }
                
                expect(returnedError).toEventually(beNil())
                expect(returnedString).toEventually(equal("returnedString"))
            }
        }
        
        describe("when used in a function that returns an error") {
            it("returns error with correct type") {
                
                var returnedResult: Result<String>?
                
                func aFunction(completion: @escaping (Result<String>) -> Void) {
                    completion(.error(HTTPError.noResponse))
                }
                
                aFunction { result in
                    returnedResult = result
                }
                
                let result = extract(result: returnedResult!)
                expect(result.error).toEventuallyNot(beNil())
                let expectedError = result.error!
                expect(expectedError).toEventually(matchError(HTTPError.noResponse))
                expect(result.value).toEventually(beNil())
            }
        }
        
        describe("when used in a function that returns no value") {
            it("returns success with void") {
                
                var returnedResult: Any? = "test"
                var returnedError: Error?
                
                func aFunction(completion: @escaping (Result<Void>) -> Void) {
                    completion(.success)
                }
                
                aFunction { result in
                    switch result {
                    case .success(let any):
                        returnedResult = any
                    case .error(let error):
                        returnedError = error
                    }
                }
                
                expect(returnedError).toEventually(beNil())
                expect(returnedResult).toEventually(beAKindOf(Swift.Void.self))
            }
        }
    }
}

