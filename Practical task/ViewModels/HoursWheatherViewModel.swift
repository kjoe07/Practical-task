//
//  HoursWheatherViewModel.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/23/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class HoursWheaterViewModel{
    let service: HoursWheatherService
    var completion: ((Error?) -> Void)?
    var data: [ConsolidatedWeather]?
    
    init(service: HoursWheatherService) {
        self.service = service
    }
    
    func loadData(woeid: Int,date:String){
        service.loadWheather(woeid: woeid, day: date.replacingOccurrences(of: "-", with: "/"), completion: {[weak self] data,e in
            guard let self = self else {return}
            self.data = data
            self.completion?(e)
        })
    }
    
}
