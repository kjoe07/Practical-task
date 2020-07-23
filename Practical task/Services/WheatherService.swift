//
//  WheatherService.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class WheatherService{
    var loader: DataLoader
    init(loader: DataLoader) {
        self.loader = loader
    }
    func loadData(woeid:Int,competion: @escaping (Codable?,Error?)->Void){
        loader.loadData(url: Api.woeid(val: woeid).url, params: [:], method: .get, completion: {result in
            DispatchQueue.main.async {
                switch result{
                case .success(let d):
                    let data = try? JSONDecoder().decode(ResponseWoeid.self, from: d)
                    competion(data, nil)
                case .failure(let e):
                    print(e.localizedDescription)
                    competion(nil,e)
                }
            }
        })
    }
}
