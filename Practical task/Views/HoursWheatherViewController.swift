//
//  HoursWheatherViewController.swift
//  Practical tasks
//
//  Created by Yoel Jimenez del Valle on 7/23/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit

class HoursWheatherViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var vm: HoursWheaterViewModel!
    var woeid: Int?
    var date: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = WheatherDateViewModel().date(date: date ?? "")
        self.showActivityIndicator(color: .blue)
        vm.loadData(woeid: woeid ?? 0, date: date ?? "")
        vm.completion = {[weak self] e in
            DispatchQueue.main.async {
                guard let self = self else{return}
                self.hideActivityIndicator()
                if e != nil {
                    self.showAlert(e: e!)
                }else{
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    func showAlert(e: Error){
        let alert = UIAlertController(title: "Ups!", message: e.localizedDescription, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Retry", style: .default, handler: {[unowned self] _ in
            self.vm.loadData(woeid: self.woeid ?? 0, date: self.date ?? "")
        })
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true , completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if vm.data?.count ?? 0 == 0{
            self.tableView.setEmptyView(title: "", message: "No wheather data for the given day", imageString: UIImage.init(systemName: "tray"))
        }else{
            self.tableView.restore()
        }
        return vm.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HourrWheatherTableViewCell.reuseIdentifier) as! HourrWheatherTableViewCell
        cell.setup(val: vm.data?[indexPath.row],unitVM: WheaterTempViewModel(),percentVM: PercentageViewModel())
        return cell
    }

}
