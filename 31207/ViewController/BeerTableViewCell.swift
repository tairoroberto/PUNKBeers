//
//  BeerTableViewCell.swift
//  31207
//
//  Created by Tairo Roberto on 12/07/17.
//  Copyright © 2017 Tairo Roberto. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerImageIV: UIImageView!
    @IBOutlet weak var beerNameLbl: UILabel!
    @IBOutlet weak var beerABVLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
