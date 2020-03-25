//
//  Model.swift
//  Astronomy
//
//  Created by Alexander Supe on 25.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import Foundation

@objc class Photo: NSObject {
    @objc var url: NSURL?
    
    @objc init(_ dictionary: Dictionary<String, Any>) {
        self.url = NSURL(string: dictionary["img_src"] as? String ?? "")
    }
}
