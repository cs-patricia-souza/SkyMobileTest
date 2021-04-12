//
//  ErrorsTests.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import Quick
import Nimble

@testable import SkyMobileTest

class ErrorsTests: QuickSpec {
    override func spec() {
        describe("HTTPError") {
            describe("when is noResponse") {
                it("returns correct domain and code") {
                    let nserror = HTTPError.noResponse.toNSError()
                    
                    expect(nserror.domain).to(equal("HTTPError.noResponse"))
                    expect(nserror.code).to(equal(101))
                }
            }
            
            describe("when is noData") {
                it("returns correct domain and code") {
                    let nserror = HTTPError.noData(nil).toNSError()
                    
                    expect(nserror.domain).to(equal("HTTPError.noData"))
                    expect(nserror.code).to(equal(102))
                }
            }
            
            describe("when is invalidRequestData") {
                it("returns correct domain and code") {
                    let nserror = HTTPError.invalidRequestData.toNSError()
                    
                    expect(nserror.domain).to(equal("HTTPError.invalidRequestData"))
                    expect(nserror.code).to(equal(103))
                }
            }
            
            describe("when is unsuccesfulStatusCode") {
                it("returns correct domain and code") {
                    let serviceError = NSError(domain:"unsuccesfulStatusCode", code: 500, userInfo: nil)
                    let nserror = HTTPError.unsuccesfulStatusCode(serviceError).toNSError()
                    
                    expect(nserror.domain).to(equal("HTTPError.unsuccesfulStatusCode"))
                    expect(nserror.code).to(equal(104))
                }
            }
            
            describe("when is unauthorizedAccess") {
                it("returns correct domain and code") {
                    let serviceError = NSError(domain:"unauthorizedAccess", code: 401, userInfo: nil)
                    let nserror = HTTPError.unauthorizedAccess(serviceError).toNSError()
                    
                    expect(nserror.domain).to(equal("HTTPError.unauthorizedAccess"))
                    expect(nserror.code).to(equal(105))
                }
            }
            
            describe("when is couldNotDecode") {
                it("returns correct domain and code") {
                    let nserror = HTTPError.couldNotDecode.toNSError()
                    
                    expect(nserror.domain).to(equal("HTTPError.couldNotDecode"))
                    expect(nserror.code).to(equal(106))
                }
            }
        }
    }
}

