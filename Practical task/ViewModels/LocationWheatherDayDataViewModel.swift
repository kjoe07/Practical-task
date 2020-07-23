//
//  LocationWheatherDayDataViewModel.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class LocationWheatherDayDataViewModel{
    var service: WheatherService
    var data: ResponseWoeid?
    var completion: ((Error?)->Void)?
    init(service: WheatherService) {
        self.service = service
    }
    func loadData(woeid: Int){
        service.loadData(woeid: woeid, competion: {[weak self] data,error in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.data = data as? ResponseWoeid
                if data != nil {
                    self.completion?(nil)
                }else{
                    self.completion?(error)
                }
            }
        })
    }
    
}
