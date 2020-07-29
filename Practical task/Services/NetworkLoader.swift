//
//  NetworkLoader.swift
//  Takehome
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit
import Network
protocol DataLoader {
    func loadData(url: String,params:[String:Any],method: MethodType,completion: @escaping (Result<Data, Error>) -> Void)
    func cancel()
}
class NetworkLoader: DataLoader{
    var task: URLSessionDataTask?
    func loadData(url: String, params: [String : Any], method: MethodType,completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        print("the url is \(String(describing: request.url?.absoluteURL))")
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue:  .main)
        task = session.dataTask(with: request){ data,response,error  in
            print("response \(String(describing: response)): \(String(describing: data))")
            if error != nil {
                completion(.failure(error!))
            }
            let val = url.replacingOccurrences(of: "https://www.metaweather.com/api/location/", with: "")
            
            guard let data = data else { return }
            UserDefaults.standard.set(data, forKey: val.replacingOccurrences(of: "/", with: "-"))
            completion(.success(data))
        }
        task?.resume()
    }
    func cancel() {
        task?.cancel()
    }
}
class LocalLoader: DataLoader{
    func loadData(url: String, params: [String : Any], method: MethodType, completion: @escaping (Result<Data, Error>) -> Void) {
        let val = url.replacingOccurrences(of: "https://www.metaweather.com/api/location/", with: "")
        if let data = UserDefaults.standard.value(forKey: val.replacingOccurrences(of: "/", with: "-")) as? Data{
            completion(.success(data))
        }else{
            completion(.failure(MyErrors.nodata))
        }
    }
    
    func cancel(){        
    }
    
}

class RemoteWithLocalFallBackLoader: DataLoader{
    let remote: NetworkLoader!
    var local: LocalLoader!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    init(remote: NetworkLoader, local: LocalLoader) {
        self.remote = remote
        self.local = local
    }
    func loadData(url: String, params: [String : Any], method: MethodType, completion: @escaping (Result<Data, Error>) -> Void) {
        let load = appDelegate.monitor.currentPath.status == .satisfied ? remote.loadData : local.loadData
        load(url,params,method,completion)
    }
    
    func cancel() {
        if appDelegate.monitor.currentPath.status == .satisfied{
            remote.cancel()
        }
    }
}
enum MethodType: String {
    case post
    case get
}
