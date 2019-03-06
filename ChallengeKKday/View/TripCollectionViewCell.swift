//
//  TripCollectionViewCell.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/2/28.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import UIKit

protocol TripCollectionViewCellDelegate {
    func heartChange(indexPath: IndexPath)
}

class TripCollectionViewCell: UICollectionViewCell {
    
    var indexPath: IndexPath?
    var delegate: TripCollectionViewCellDelegate?
    
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.cornerRadius = 10
            bgView.clipsToBounds = true
            bgView.layer.masksToBounds = true
            bgView.backgroundColor = .white
            bgView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            bgView.layer.borderWidth = 0.5
            
            
//            bgView.layer.addShadow()
        }
    }
    @IBOutlet weak var coverImage: UIImageView! {
        didSet {
            coverImage.layer.cornerRadius = 10
            coverImage.clipsToBounds = true
            coverImage.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            coverImage.layer.borderWidth = 0.5
            coverImage.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner ]
            

        }
    }
    @IBOutlet weak var tripNameLbl: UILabel!
    @IBOutlet weak var locaitonLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func update(trip: Travel) {
        
        tripNameLbl.text = trip.tripName
        locaitonLbl.text = "⍒ " + trip.location.city + ", " + trip.location.country
        costLbl.text = "\(trip.cost)"
        coverImage.image = trip.image
        
        if trip.isFavorited {
            favoriteButton.setImage(#imageLiteral(resourceName: "heart filled"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "heart blank"), for: .normal)
            favoriteButton.tintColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        }
    }
    
    
    //FIX ME!!
    @IBAction func favoriteDidTap(sender: UIButton) {
        if let indexPath = indexPath {
            delegate?.heartChange(indexPath: indexPath)
        }
    }
    

}

//cell.coverImage.image = trips[indexPath.row].image
//cell.costLbl.text = "\(trips[indexPath.row].cost)"
//cell.tripNameLbl.text = trips[indexPath.row].tripName
//cell.locaitonLbl.text = "⍒ "+trips[indexPath.row].location.country + ", " + trips[indexPath.row].location.city
//
//cell.updataBtn(liked: trips[indexPath.row].isFavorited)
//cell.indexPath = indexPath
//cell.delegate = self
//
//print(trips[indexPath.row].isFavorited)
//return cell






//class MyButton: UIButton {
//
//    var isFavorite: Bool = false
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        buttonInit(bool: isFavorite)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        buttonInit(bool: isFavorite)
//
//    }
//
//    func buttonInit(bool: Bool){
//        let image = bool ? UIImage(named: "heart filled") : UIImage(named: "heart blank")
//        setImage(image, for: .normal)
//        addTarget(self, action: #selector(clickButton), for: .touchUpInside)
//    }
//
//    @objc func clickButton(){
//        changeImage(bool: !isFavorite)
//    }
//
//    func changeImage(bool: Bool){
//        isFavorite = bool
//        let image = bool ? UIImage(named: "heart filled") : UIImage(named: "heart blank")
//        setImage(image, for: .normal)
//    }
//
//
//}
