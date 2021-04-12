//
//  MovieDetailWireframe.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class MovieDetailWireframe: NSObject {

    // MARK: - Viper Properties

    var view: MovieDetailView?

    // MARK: - Public Properties

    // MARK: - Internal Properties

    // MARK: - Private Properties

    private let nibName = "MovieDetail"
    private let viewIdentifier = "MovieDetailView"

    // MARK: - Inits

    init(movie: MovieEntity) {
        
        super.init()

        let view = self.viewControllerFromXib()
        let interactor = MovieDetailInteractor(movie: movie)
        let presenter = MovieDetailPresenter()

        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = view

        view.presenter = presenter
        interactor.output = presenter

        self.view = view
    }

    // MARK: - Public Methods

    // MARK: - Internal Methods

    // MARK: - Private Methods

    private func viewControllerFromXib() -> MovieDetailView {
        let movieDetailView = MovieDetailView(nibName: self.nibName, bundle: nil)
        
        return movieDetailView
    }

    // MARK: - Notifications

}

// MARK: - MovieDetailWireframeProtocol

extension MovieDetailWireframe: MovieDetailWireframeProtocol {

    func present(with navigationController: UINavigationController) {
        guard let view = self.view else {
            return
        }

        navigationController.pushViewController(view, animated: true)
    }

}
