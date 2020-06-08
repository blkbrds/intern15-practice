//
//  HomeView2Controller.swift
//  Autolayout
//
//  Created by ADMIN on 6/4/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeView2Controller: UIViewController {
    var arr: [Person] = [Person(name: "Name", date: "01/01/2000"),Person(name: "Name1", date: "01/01/2000"), Person(name: "Name2", date: "01/01/2000")]
    
    @IBOutlet weak var subView3: SubView!
    @IBOutlet weak var subView2: SubView!
    @IBOutlet weak var subView1: SubView!
    
    override func viewDidLoad() {
        title = "Home "
        
        subView1.delegate = self
        subView2.delegate = self
        subView3.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        subView1.dataSource = self
        subView2.dataSource = self
        subView3.dataSource = self
    }
}

class Person {
    var name: String
    var date: String
    
    init(name: String = "", date: String = "") {
        self.name = name
        self.date = date
    }
}
extension HomeView2Controller: SubViewDatasource {
    func subView(nameOf userView: SubView) -> Person {
        let person = arr[userView.tag]
        return person
    }
}
extension HomeView2Controller: SubViewDelegate {
    func passData(userView: SubView) {
        let person = arr[userView.tag]
        let vc = DetailViewController2()
        vc.person = person
        vc.index = userView.tag
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeView2Controller: DetailDelegate {
    func update(person: Person, index: Int) {
        arr[index] = person
    }
}
