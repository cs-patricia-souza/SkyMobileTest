//
//  MovieDetailView.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class MovieDetailView: UIViewController {

    // MARK: - Viper Properties

    var presenter: MovieDetailPresenterInputProtocol!

    // MARK: - Outlets

    // MARK: - Public Properties

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    // MARK: - Public Methods

    // MARK: - Internal Methods

    // MARK: - Private Methods

    // MARK: - Actions

    // MARK: - Notifications

}

// MARK: - MovieDetailPresenterOutputProtocol

extension MovieDetailView: MovieDetailPresenterOutputProtocol {

    // MARK: - Internal Methods
    func setupTitle(_ title: String) {
        self.title = title
    }

}
