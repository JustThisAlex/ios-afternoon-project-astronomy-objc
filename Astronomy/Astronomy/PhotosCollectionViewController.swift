//
//  PhotosCollectionViewController.swift
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    static let cache = CustomCacheClass()
    var sol: Int32 = 1 { didSet { getData() }}
    var images: [URL]? { didSet { DispatchQueue.main.async { self.collectionView.reloadData() } } }

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        getData()
    }
    
    func getData() {
        NetworkingController().getImagesForSol(sol) { (data, success) in
            if !success {
                self.sol += 1
                self.getData()
            } else if let data = data {
                guard let photos = data as NSArray as? [Photo] else { return }
                self.images = photos.compactMap({ $0.url as URL? })
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            guard let index = collectionView.indexPathsForSelectedItems?.first else { return }
            guard let cell =  collectionView.cellForItem(at: index) as? PhotosCollectionViewCell else { return }
            destination.image = cell.imageView.image
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        guard let url = images?[indexPath.row] else { return cell }
        
        var comp = URLComponents(url: url, resolvingAgainstBaseURL: true)
        comp?.scheme = "https"
        guard let photoURL = comp?.url else { return cell }
        
        if let data = PhotosCollectionViewController.cache.getObjectForKey(photoURL.absoluteString) as? Data {
            cell.photo = data
        } else {
            cell.photoURL = photoURL
        }
        
        return cell
    }

    
}
