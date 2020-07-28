//
//  SearchService.swift
//  Practical task
//
//  Created by Yoel Jimenez del Valle on 7/24/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class SearchService{
    var loader: DataLoader
    init(loader: DataLoader) {
        self.loader = loader
    }
    func loadData(search:String,competion: @escaping ([Locations]?,Error?)->Void){
        loader.loadData(url: Api.search(search: search).url
            , params: [:], method: .get, completion: {result in
            DispatchQueue.main.async {
                switch result{
                case .success(let d):
                    let data = try? JSONDecoder().decode([Locations].self, from: d)
                    competion(data, nil)
                case .failure(let e):
                    print(e.localizedDescription)
                    competion(nil,e)
                }
            }
        })
    }
}
