//
//  Locations.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
struct Locations : Codable {
    let title : String?
    let location_type : String?
    let woeid : Int?
    let latt_long : String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case location_type = "location_type"
        case woeid = "woeid"
        case latt_long = "latt_long"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        location_type = try values.decodeIfPresent(String.self, forKey: .location_type)
        woeid = try values.decodeIfPresent(Int.self, forKey: .woeid)
        latt_long = try values.decodeIfPresent(String.self, forKey: .latt_long)
    }
    init(woeid:Int,title:String){
        self.woeid = woeid
        self.title = title
        self.location_type = nil
        self.latt_long = nil
    }
}
