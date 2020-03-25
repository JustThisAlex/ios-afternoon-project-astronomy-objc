//
//  PhotosCollectionViewCell.swift
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var photoURL: URL? { didSet { updatePhoto() }}
    var photo: Data? { didSet { setPhoto() }}
    
    func setPhoto() {
        guard let photo = photo else { return }
        self.imageView.image = UIImage(data: photo)
    }
    
    func updatePhoto() {
        guard let url = photoURL else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                PhotosCollectionViewController.cache.add(data, forKey: url.absoluteString)
                self.imageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
