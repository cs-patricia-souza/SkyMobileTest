//
//  MovieDetailInteractor.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class MovieDetailInteractor: NSObject {

    // MARK: - Viper Properties

    weak var output: MovieDetailInteractorOutputProtocol!

    // MARK: - Public Properties

    // MARK: - Internal Properties
    var movie: MovieEntity
    

    // MARK: - Private Properties

    // MARK: - Inits
    
    init(movie: MovieEntity) {
        self.movie = movie
        super.init()
    }

    // MARK: - Public Methods

    // MARK: - Internal Methods

    // MARK: - Private Methods

    // MARK: - Notifications

}

// MARK: - MovieDetailInteractorInputProtocol

extension MovieDetailInteractor: MovieDetailInteractorInputProtocol {

    // MARK: - Internal Methods

}
