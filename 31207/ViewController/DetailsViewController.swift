//
//  DetailsViewController.swift
//  31207
//
//  Created by Tairo Roberto on 12/07/17.
//  Copyright © 2017 Tairo Roberto. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageIv: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var taglineLbl: UILabel!
    @IBOutlet weak var abvLbl: UILabel!
    @IBOutlet weak var ibuLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let url = URL(string: (beer?.image_url)!)!
        let ibu = beer?.ibu
        
        imageIv.kf.setImage(with: url)
        nameLbl.text = beer?.name?.description
        taglineLbl.text = beer?.tagline?.description
        abvLbl.text = beer?.abv?.description
        
        if ibu == 0.0 {
            ibuLbl.text = "Não disponivel"
        } else {
            ibuLbl.text = ibu?.description
        }
        
        descriptionLbl.text = beer?.descriptionBeer
        
    }
    
}

