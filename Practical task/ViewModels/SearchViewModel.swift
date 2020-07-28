//
//  SearchViewModel.swift
//  Practical task
//
//  Created by Yoel Jimenez del Valle on 7/24/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class SearchViewModel{
    let service: SearchService
    var completion: ((Error?) -> Void)?
    var data: [Locations]?
    
    init(service: SearchService) {
        self.service = service
    }
    
    func loadData(search:String){
        service.loadData(search: search, competion:{ [weak self] data,e in
            guard let self = self else {return}
            self.data = data
            self.completion?(e)
        })
//        service.loadWheather(woeid: woeid, day: date.replacingOccurrences(of: "-", with: "/"), completion: {[weak self] data,e in
//            guard let self = self else {return}
//            self.data = data
//            self.completion?(e)
//        })
    }
}
