//
//  DayFactory.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/23/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class DayFactory{
    func setupVM() -> HoursWheaterViewModel{
        let loader = RemoteWithLocalFallBackLoader(remote: NetworkLoader(), local: LocalLoader())
        let service = HoursWheatherService(loader: loader)
        return  HoursWheaterViewModel(service: service)
    }
}
