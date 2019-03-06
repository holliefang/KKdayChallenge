//
//  popularDestinationsCollectionViewCell.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/3/3.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import UIKit

class PopularDestinationsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImage: UIImageView! {
        didSet {
            coverImage.layer.cornerRadius = 10
            coverImage.layer.masksToBounds = true
//            coverImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
