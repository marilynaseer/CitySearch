//
//  SearchViewController+Extension.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import UIKit

extension SearchViewController : UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let results = allResults else {return 0}
        if results.count == 0{
            return 0
        }
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResult", for: indexPath as IndexPath) as!  SearchResultCell
        
        cell.cityName.text = allResults?[indexPath.row].name.capitalized
        cell.countryName.text = allResults?[indexPath.row].countryName
        cell.stateName.text = allResults?[indexPath.row].adminName1
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 70
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            allResults?.removeAll()
        }
    }
}

