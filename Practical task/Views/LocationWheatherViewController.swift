//
//  LocationWheatherViewController.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/22/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit

class LocationWheatherViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var location: Locations?
    var loader = RemoteWithLocalFallBackLoader(remote: NetworkLoader(), local: LocalLoader())
    var service: WheatherService!// = WheatherService(loader: loader)
    var vm: LocationWheatherDayDataViewModel!//= LocationWheatherDayDataViewModel(service: service)
    let dateVM = WheatherDateViewModel()
    let tempVM = WheaterTempViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        service = WheatherService(loader: loader)
        vm = LocationWheatherDayDataViewModel(service: service)
        self.showActivityIndicator(color: .blue)
        vm.loadData(woeid: location?.woeid ?? 0)
        self.title = location?.title
        tableView.tableFooterView = UIView()
        vm.completion = {[weak self] e in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.hideActivityIndicator()
                if e == nil {
                    self.tableView.reloadData()
                }else{
                    guard let e = e else {return}
                    self.showError(e: e)
                }
            }            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if vm.data?.consolidatedWeather?.count ?? 0 == 0{
            tableView.setEmptyView(title: "", message: "No data Avaible", imageString: UIImage(systemName: "tray"))
        }else{
            tableView.restore()
        }
        return vm.data?.consolidatedWeather?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayWheatherTableViewCell.reuseIdentifier) as! DayWheatherTableViewCell
        cell.setup(data: vm.data?.consolidatedWeather?[indexPath.row], vm: dateVM, tempVM: tempVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "days", sender: indexPath.row)
    }
    
    func showError(e: Error){
        let alert = UIAlertController(title: "Ups!", message: e.localizedDescription, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Retry", style: .default, handler: {_ in
            self.vm.loadData(woeid: self.location?.woeid ?? 0)
        })
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true , completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "days"{
            let vc = segue.destination as! HoursWheatherViewController
            vc.vm = DayFactory().setupVM()
            vc.date = vm.data?.consolidatedWeather?[sender as! Int].applicable_date
            vc.woeid = self.location?.woeid
        }
    }
}
