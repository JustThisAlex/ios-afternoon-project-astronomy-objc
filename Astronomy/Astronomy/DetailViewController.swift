//
//  DetailViewController.swift
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
//    var sol: Int32 = 1 { didSet { getData() }}
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
//    private func updateImage(_ imageURL: URL?) {
//        guard let imageURL = imageURL else { return }
//        var comp = URLComponents(url: imageURL, resolvingAgainstBaseURL: true)
//        comp?.scheme = "https"
//        guard let url = comp?.url else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.imageView.image = UIImage(data: data)
//            }
//        }.resume()
//    }

//    func getData() {
//        NetworkingController().getImagesForSol(sol) { (data, success) in
//            if !success {
//                self.sol += 1
//                self.getData()
//            } else if let data = data {
//                guard let photos = data as NSArray as? [Photo] else { return }
//                self.updateImage(photos[0].url as URL?)
//            }
//        }
//    }
}
