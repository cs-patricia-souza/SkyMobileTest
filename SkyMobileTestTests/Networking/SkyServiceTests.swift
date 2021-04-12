//
//  SkyServiceTests.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Quick
import Nimble

@testable import SkyMobileTest

class SkyServiceTests: QuickSpec {
    override func spec() {
        var skyService: SkyService!
        
        describe("home") {
            beforeEach {
                skyService = SkyService.home
            }
            
            it("has the /Movies as its path") {
                let expectedURL = skyService.baseURL.appendingPathComponent("/api/Movies")
                
                expect(skyService.path).to(equal(expectedURL))
            }
            
            it("has GET as its httpMethod") {
                expect(skyService.method).to(equal(HttpMethod.get))
            }
        }
    }
}

