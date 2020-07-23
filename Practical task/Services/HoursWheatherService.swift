//
//  DayWheatherService.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//
import UIKit
import Network

class HoursWheatherService {
    var loader: DataLoader
    
    init(loader: DataLoader){
        self.loader = loader
    }
    
    func loadWheather(woeid:Int,day:String, completion: @escaping ([ConsolidatedWeather]?,Error?) -> Void){
        loader.loadData(url: Api.wheatherDay(woeid: woeid, day: day).url, params: [:], method: .get, completion: { result in
            switch result{
            case .success(let d):
                let data = try? JSONDecoder().decode([ConsolidatedWeather].self, from: d)
                completion(data,nil)
            case .failure(let e):
                print(e.localizedDescription)
                completion(nil,e)
            }
        })
    }    
}
