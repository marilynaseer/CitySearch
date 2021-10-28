//
//  SearchViewController.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import UIKit
import SnapKit

class SearchViewController : UIViewController{

    var searchResultTable: UITableView!
    
    var allResults : [City]? {
        didSet{
            setupTableView()
        }
    }
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search Cities"
        sb.barTintColor = .white
        sb.barTintColor = UIColor.clear
        sb.backgroundColor = UIColor.clear
        sb.isTranslucent = true
        sb.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        sb.searchTextField.backgroundColor = .clear
        sb.isTranslucent = true
        sb.delegate = self
        return sb
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .mainColor
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(fetchContent), for: .touchUpInside)
        return button
    }()
    
    var lineView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        overrideUserInterfaceStyle = .dark
        self.title = "Search"
        self.view.backgroundColor = .red
        self.view.addSubview(searchBar)
        self.view.addSubview(searchButton)
        self.view.addSubview(lineView)
        
        setup()
    }
    
    func setup(){
        
        self.navigationController?.navigationBar.barTintColor = .ktBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        self.searchResultTable = UITableView()
        self.searchResultTable.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        searchResultTable.register(SearchResultCell.self, forCellReuseIdentifier: "searchResult")
        searchResultTable.tableFooterView = UIView(frame: .zero)
        self.view.addSubview(self.searchResultTable)
       
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.lightGray.cgColor
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.width.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
      
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(searchButton.snp.bottom).offset(50)
            make.height.equalTo(0.7)
            make.width.equalToSuperview()
        }

    }
    
    @objc func fetchContent() {
        
        guard let searchText = searchBar.text else {return}
       
        if searchText.count == 0{
            return
        }
        NetworkManager.shared.fetchCities(from: searchText) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.allResults = articles.geonames
            case .failure(let error):
                DispatchQueue.main.async { UIHelper.createAlertController(title: "Error", message: error.rawValue, in: self) }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchResultTable.reloadData()
    }
    
    func setupTableView(){
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.searchResultTable.delegate = self
            self.searchResultTable.dataSource = self
            
            self.searchResultTable.snp.makeConstraints { (make) in
                make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
                make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
                make.top.equalTo(self.searchButton.snp.bottom).offset(70)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                make.width.equalTo(self.view.safeAreaLayoutGuide.snp.width)
            }
            self.searchResultTable.reloadData()
        })
    }
    
    

}
