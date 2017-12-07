//
//  Beer.swift
//  31207
//
//  Created by Tairo Roberto on 12/07/17.
//  Copyright © 2017 Tairo Roberto. All rights reserved.
//

import UIKit

class Beer: NSObject {
    
    var image_url: String?
    var name: String?
    var tagline: String?
    var abv: Float?
    var ibu: Float?
    var descriptionBeer: String?
    
    override init() {
        
    }
    
    init(imageUrl: String, name: String, tagline: String, abv: Float, ibu: Float, descriptionBeer: String ) {
        self.image_url = imageUrl
        self.name = name
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.descriptionBeer = descriptionBeer
    }
}
