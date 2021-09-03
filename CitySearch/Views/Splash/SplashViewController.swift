//
//  SplashViewController.swift
//  CitySearch
//
//  Created by marilyn A on 6/5/21.
//

import UIKit
import SnapKit

class SplashController: UIViewController {
    
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "KeepTruckinLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImageView)
        view.backgroundColor = .white;
        view.frame = UIScreen.main.bounds
        setupLogo()
    }
    
    func setupLogo(){
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
