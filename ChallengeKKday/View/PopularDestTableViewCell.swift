//
//  PopularDestTableViewCell.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/3/3.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import UIKit

class PopularDestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let popularDest = UINib(nibName: "PopularDestinationsCollectionViewCell", bundle: nil)
        collectionView.register(popularDest, forCellWithReuseIdentifier: "popularDest")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9039036632, green: 0.9001372457, blue: 0.9208526015, alpha: 1)
        collectionView.collectionViewLayout = layout
        
    }
}

extension PopularDestTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularDest", for: indexPath) as! PopularDestinationsCollectionViewCell
        
        cell.coverImage.image = trips[indexPath.row].location.image
        cell.titleLbl.text = trips[indexPath.row].location.country
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: (collectionView.frame.width - 48) / 2 , height: 240)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
}

