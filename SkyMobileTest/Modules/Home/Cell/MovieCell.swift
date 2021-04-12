//
//  MovieCell.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 17/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
    static let nibName = "MovieCell"
    static let reuseIdentifier = "MovieCellIdentifier"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.title.text = nil
        self.imageView.image = nil
    }
    
    static func registerOn(_ collectionView: UICollectionView) {
        let bundle = Bundle(for: self.self)
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    func setup(movie: MovieEntity) {
        self.title.text = movie.title
        self.imageView.setImage(with: movie.coverUrl)
    }
}
