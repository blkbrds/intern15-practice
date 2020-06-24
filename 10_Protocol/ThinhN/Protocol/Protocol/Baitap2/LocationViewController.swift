//
//  LocationViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
//protocol LocationViewControllerDatasource: class {
//    func getValueAreaViewController(view: LocationViewController) -> String
//}
class LocationViewController: UIViewController {
    
    @IBOutlet weak var diaDiemLabel: UILabel!
    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!
    
    var valueOfMien: String = ""
//    weak var datasource: LocationViewControllerDatasource?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        setupView()
        
    }
    func setupView() {
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
        
    }
    @objc func editButtonTouchUpInside() {
        let vc = AreaViewController()
        vc.datasource = self
        navigationController?.pushViewController(vc, animated: true)
    }
//    func configValue() {
//        guard let datasource = datasource else { return }
//        datasource.getValueAreaViewController(view: self)
//    }
    
}
extension LocationViewController: AreaViewControllerDatasource {
    func getViewController(view: AreaViewController, location: Location) -> Location {
        return location
    }
    
//    func getViewController(view: AreaViewController) -> Location {
//        return Location.mien
//    }
}
