//
//  CountriesListModel.swift
//  Countries
//
//  Created by Valerii Petin on 3/6/19.
//  Copyright © 2019 Valerii Petin. All rights reserved.
//

import Foundation

struct CountriesList: Codable {
    var countries: [Countries]
}

struct Countries: Codable {
    let name: String
    let borders: [String]
}

class CountriesListModel {
    
    private let session = URLSession.shared
    
    //get the information from the URL and pass it to the Countries array
    func retreiveCountries(complition: @escaping ([Countries]) -> ()) {
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else { return complition([]) }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, response, error) in
            
            do {
                let countries = try JSONDecoder().decode([Countries].self, from: data!)
                
                //print response to the console
                for country in countries {
                    print(country.name + " : \(country.borders)" )
                }
                //return data to array Countries
                DispatchQueue.main.async {
                    complition(countries)
                    print()
                }
                
            } catch {
                print("Error")
            }
        }.resume()
    }
}
