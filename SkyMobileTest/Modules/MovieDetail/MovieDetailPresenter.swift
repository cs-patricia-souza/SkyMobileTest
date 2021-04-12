//
//  MovieDetailPresenter.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class MovieDetailPresenter: NSObject {

    // MARK: - Viper Properties

    weak var view: MovieDetailPresenterOutputProtocol!
    var interactor: MovieDetailInteractorInputProtocol!
    var wireframe: MovieDetailWireframeProtocol!

    // MARK: - Public Properties

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Public Methods

    // MARK: - Internal Methods

    // MARK: - Private Methods
    
    func setupTitle() {
        self.view.setupTitle(self.interactor.movie.title)
    }

    // MARK: - Notifications
}

// MARK: - MovieDetailPresenterInputProtocol

extension MovieDetailPresenter: MovieDetailPresenterInputProtocol {

    // MARK: - Internal Methods

    func viewDidLoad() {
        
        self.setupTitle()

    }
}

// MARK: - MovieDetailInteractorOutputProtocol

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {

    // MARK: - Internal Methods

}
