//
//  Api.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
struct server {
    static let ws = "https://www.metaweather.com/api/location/"

}
enum Api {
    case woeid(val:Int)
    case wheatherDay(woeid: Int,day: String)
    case search(search:String)
    var url:String{
        switch self {
        case .woeid(let val):
            return "\(server.ws)\(val)/"
        case .wheatherDay(let woeid,let day):
            return "\(server.ws)\(woeid)/\(day)"
        case .search(let search):
            return "\(server.ws)/search/?query=\(search)"
        }
    }
}
