//
//  TripTableViewCell.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/2/28.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
//    var trips = [Travel]() {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        let tripNib = UINib(nibName: "TripCollectionViewCell", bundle: nil)
        collectionView.register(tripNib, forCellWithReuseIdentifier: "tripCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = #colorLiteral(red: 0.9039036632, green: 0.9001372457, blue: 0.9208526015, alpha: 1)
        

    }
}

extension TripTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tripCell", for: indexPath) as! TripCollectionViewCell
        
        
//        trips[indexPath.row].isFavorited(liked: cell.isClicked)
        let trip = trips[indexPath.row]
        
//        cell.coverImage.image = trips[indexPath.row].image
//        cell.costLbl.text = "\(trips[indexPath.row].cost)"
//        cell.tripNameLbl.text = trips[indexPath.row].tripName
//        cell.locaitonLbl.text = "⍒ "+trips[indexPath.row].location.country + ", " + trips[indexPath.row].location.city
//
//        cell.updataBtn(liked: trips[indexPath.row].isFavorited)
        cell.update(trip: trip)
        cell.indexPath = indexPath
        cell.delegate = self
        

        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width - 48, height: 300)
        return size
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}


extension TripTableViewCell: TripCollectionViewCellDelegate {
    func heartChange(indexPath: IndexPath) {
        trips[indexPath.row].isFavorited = !trips[indexPath.row].isFavorited
        collectionView.reloadItems(at: [indexPath])
    }
}
