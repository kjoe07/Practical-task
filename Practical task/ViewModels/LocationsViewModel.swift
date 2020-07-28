//
//  LocationsViewModel.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit
class LocationsViewModel{
    var location: [Locations]?
    
    init(){
        if let data = UserDefaults.standard.value(forKey: "locations") as? Data{
            location = try? JSONDecoder().decode([Locations].self, from: data)
        }else{
            location = [Locations(woeid: 839722, title: "Sofia"),Locations(woeid: 2459115,title: "NY" ),Locations(woeid: 1118370,title:"Tokyo")]
        }
    }    
}
