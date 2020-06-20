//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by admin on 6/19/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var coutries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountryNameFrom(endPoint: "all")
        service.completionHandle { [weak self] (coutries, status, messenge ) in
            if status {
                guard let self  = self else { return }
                guard let _countries = coutries else { return }
                self.coutries = _countries
                self.tableView.reloadData()
            }
        }
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coutries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        if cell == nil {
            
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "IDCell")
        }
        let country = coutries[indexPath.row]
        cell.textLabel?.text = country.name ?? "" + "\(String(describing: country.countryCode))"
        
        cell.detailTextLabel?.text = country.capital 
        return cell
    }
    
    
}

