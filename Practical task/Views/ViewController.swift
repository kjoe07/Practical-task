//
//  ViewController.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit
import ActivityIndicator
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var location = LocationsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        guard let data = try? JSONEncoder().encode(location.location) else {return}
        UserDefaults.standard.set(data, forKey: "locations")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        location.location?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseIdentifier) as? LocationTableViewCell
        cell?.name.text = location.location?[indexPath.row].title ?? ""
        return cell ?? LocationTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: LocationWheatherViewController.identifier) as! LocationWheatherViewController
        vc.location = location.location?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

