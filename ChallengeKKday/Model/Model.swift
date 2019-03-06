//
//  File.swift
//  ChallengeKKday
//
//  Created by Sihan Fang on 2019/2/28.
//  Copyright © 2019 Sihan Fang. All rights reserved.
//

import Foundation
import UIKit


struct Travel {
    var tripName: String
    var location: Location
    var cost: Int
    var image: UIImage? = nil
    var isFavorited: Bool = false
    
    mutating func isFavorited(liked: Bool) {
        let bool = liked
        self.isFavorited = bool
    }
    
}

struct Location {
    var country: String
    var city: String
    var image: UIImage? = nil
}


let sectionArray = ["Recently viewd", "Popular destinations", "Staff-Picked", "Around current location"]

var trips = [hawaiiTrip, tokyoDisney, mtFujiTrip, sydneyTrip, thailandTrip]


let hawaiiTrip = Travel(tripName: "Day Tour from Waikiki: Kualoa Ranch - Jurassic Park Adventure", location: Location(country: "United States", city: "Hawaii", image: #imageLiteral(resourceName: "us")), cost: 5616, image: #imageLiteral(resourceName: "jurassic-park-location"), isFavorited: false)

let tokyoDisney = Travel(tripName: "Disneyland 1 day tick", location: Location(country: "Japan", city: "Tokyo", image: #imageLiteral(resourceName: "jp")), cost: 2094, image: #imageLiteral(resourceName: "tokyodisneyland"), isFavorited: false)

let mtFujiTrip = Travel(tripName: "Petronas Tower sightseeing", location: Location(country: "Malaysia", city: "Kuala Lumpur", image: #imageLiteral(resourceName: "malaysia")), cost: 1490, image: #imageLiteral(resourceName: "petronasTowerMA"), isFavorited: false)

let sydneyTrip = Travel(tripName: "Sydney Trip", location: Location(country: "Australia", city: "Sydney", image: #imageLiteral(resourceName: "au")), cost: 10839, image: #imageLiteral(resourceName: "Sydney"), isFavorited: false)

let thailandTrip = Travel(tripName: "Thailand Trip", location: Location(country: "Thailand", city: "Bangkog", image: #imageLiteral(resourceName: "th")), cost: 1849, image: #imageLiteral(resourceName: "bangkok"), isFavorited: false)

