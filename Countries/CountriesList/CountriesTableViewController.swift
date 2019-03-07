//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Valerii Petin on 3/6/19.
//  Copyright © 2019 Valerii Petin. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    let model = CountriesListModel()
    var countries: [Countries] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //array of countries assign the countries that came from the URL
        model.retreiveCountries { [weak self] countries in
            self?.countries = countries
            self?.tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
    }
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCell", for: indexPath)
        
        if let countriesCell = cell as? CountriesTableViewCell {
            let country = countries[indexPath.row]
            countriesCell.countriesNameLabel.text = country.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //delegation of data to another controller
        let bordersVC = storyboard?.instantiateViewController(withIdentifier: "CountryMutualBorder") as! CountryMutualBorderTableViewController
        
        let country = countries[indexPath.row]
        bordersVC.detailText = country.borders
        
        navigationController?.pushViewController(bordersVC, animated: true)
    }

}
