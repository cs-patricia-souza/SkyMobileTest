//
//  MovieTests.swift
//  SkyMobileTestTests
//
//  Created by Patricia Souza on 03/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import Quick
import Nimble

@testable import SkyMobileTest

class MovieTests: QuickSpec {
    override func spec() {
        describe("#init") {
            it("has correct properties") {
                let movie = Movie(id: "090f0d8fs9d0dfdf",
                                  title: "titulo",
                                  overview: "descricao",
                                  duration: "1h 55m",
                                  releaseYear: "2017",
                                  coverUrl: "https://image.tmdb.org/t/p/w1280/dsAQmTOCyMDgmiPp9J4aZTvvOJP.jpg",
                                  backdropsUrl: ["https://image.tmdb.org/t/p/w1066_and_h600_bestv2/tFI8VLMgSTTU38i8TIsklfqS9Nl.jpg"])
                
                expect(movie.id).to(equal("090f0d8fs9d0dfdf"))
                expect(movie.title).to(equal("titulo"))
                expect(movie.overview).to(equal("descricao"))
                expect(movie.duration).to(equal("1h 55m"))
                expect(movie.releaseYear).to(equal("2017"))
            expect(movie.coverUrl).to(equal("https://image.tmdb.org/t/p/w1280/dsAQmTOCyMDgmiPp9J4aZTvvOJP.jpg"))
            expect(movie.backdropsUrl[0]).to(equal("https://image.tmdb.org/t/p/w1066_and_h600_bestv2/tFI8VLMgSTTU38i8TIsklfqS9Nl.jpg"))
            }
        }
    }
}
