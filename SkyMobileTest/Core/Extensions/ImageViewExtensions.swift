//
//  ImageViewExtensions.swift
//  SkyMobileTest
//
//  Created by Patricia Souza on 19/07/19.
//  Copyright © 2019 Patricia Souza. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource, placeholder: UIImage(named: "noposter"))
    }
}
