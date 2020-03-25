//
//  ViewController.swift
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: PhotosCollectionViewController?
    @IBOutlet weak var solLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = self.children.first as? PhotosCollectionViewController
        
        solLabel.text = "\(collectionView?.sol ?? 1)"
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        collectionView?.sol += 1
        solLabel.text = "\(collectionView?.sol ?? 1)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
