//
//  HomeView.swift
//  SkyMobileTest
//
//  Created Patricia Souza on 17/7/2019.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//
import UIKit

class HomeView: UIViewController {

    // MARK: - Viper Properties

    var presenter: HomePresenterInputProtocol!

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Internal Properties
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Inits

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cine Sky"
        self.setupCollectionView()
        self.presenter.viewDidLoad()
    }

    // MARK: - Private Methods
    private func setupCollectionView() {
        
        MovieCell.registerOn(self.collectionView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

// MARK: - HomePresenterOutputProtocol

extension HomeView: HomePresenterOutputProtocol {

    // MARK: - Internal Methods
    func reloadCollectionView() {
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseIdentifier, for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        
        let movie = self.presenter.dataSource[indexPath.row]
        
        cell.setup(movie: movie)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 2 - 1
        return CGSize(width: width, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

// MARK: - UICollectionViewDelegate

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.presenter.dataSource[indexPath.row]
        self.presenter.didSelectMovie(movie)
    }
}
