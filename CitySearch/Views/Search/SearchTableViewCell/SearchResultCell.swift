//
//  SearchResultCell.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import UIKit
import SnapKit

class SearchResultCell : UITableViewCell{
    
    var cityName : UILabel = {
        let label = UILabel()
        label.text = "San Francisco"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "BalsamiqSans-Bold", size: 15)
        label.sizeToFit()
        return label
    }()
    
    var stateName : UILabel = {
        let label = UILabel()
        label.text = "California"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "BalsamiqSans-Regular", size: 10)
        label.sizeToFit()
        label.textColor = .gray
        return label
    }()
    
    var countryName : UILabel = {
          let label = UILabel()
          label.text = "US"
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = UIFont(name: "BalsamiqSans-Regular", size: 15)
          label.textColor = .gray
          label.sizeToFit()
          return label
      }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.addSubview(cityName)
        self.addSubview(stateName)
        self.addSubview(countryName)
        setup()
    }
    
    func setup(){
        cityName.snp.makeConstraints { (make) in
           make.top.equalToSuperview().offset(5)
           make.leading.equalToSuperview().offset(10)
        }
        
        stateName.snp.makeConstraints { (make) in
           make.bottom.equalTo(cityName.snp.bottom).offset(25)
           make.leading.equalToSuperview().offset(10)
        }
        
        countryName.snp.makeConstraints { (make) in
            make.bottom.equalTo(cityName.snp.bottom).offset(25)
            make.trailing.equalToSuperview().inset(20)
        }
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
