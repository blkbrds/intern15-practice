//
//  HomeViewController.swift
//  Bai_Tap_14
//
//  Created by ANH NGUYỄN on 12/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configData()
        configUI()
    }
    
    func updateUI() {
        if viewModel.isShowTableView {
            tableView.isHidden = false
            collectionView.isHidden = true
            tableView.reloadData()
        } else {
            tableView.isHidden = true
            collectionView.isHidden = false
            collectionView.reloadData()
        }
    }
    
    func configUI() {
        configTableView()
        configCollectionView()
        //setupNavi
    }
    
    func configData() {
        //load Data
        viewModel.loadData { (done) in
            if done {
                self.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: "Error", message: "Khong Lay duoc DaTa", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        viewModel.loadImagesSlide()
    }

    override func setUpNaVi() {
        title = "Home"
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "tableViewMenu"), style: .plain, target: self, action: #selector(showTableView))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
    }

    @objc func showTableView() {
        //change barbutton
        let collectionViewButton = UIBarButtonItem(image: UIImage(named: "collectionMenu"), style: .plain, target: self, action: #selector(showCollectionView))
        navigationItem.rightBarButtonItem = collectionViewButton
        collectionViewButton.tintColor = .black
        
        //change isShow
        viewModel.changeDisplay { (done) in
            if done {
                self.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: "Error", message: "Khong Lay Duoc Data", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    @objc func showCollectionView() {
      
        
        let tableViewButton = UIBarButtonItem(image: UIImage(named: "tableViewMenu"), style: .plain, target: self, action: #selector(showTableView))
        navigationItem.rightBarButtonItem = tableViewButton
        tableViewButton.tintColor = .black
        
        viewModel.changeDisplay { (done) in
            if done {
                self.updateUI()
            } else {
                //show alertview --> bao' loi~
                let alert = UIAlertController(title: "Error", message: "Khong Lay duoc DaTa", preferredStyle: UIAlertController.Style.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }

    func configTableView() {
        //cell
        let nib = UINib(nibName: "HomeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")

        //header
        let nib2 = UINib(nibName: "SliderTableViewCell", bundle: .main)
        tableView.register(nib2, forCellReuseIdentifier: "SliderTableViewCell")

        //delegate & datasource
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")

        let nib2 = UINib(nibName: "SliderCollectionCell", bundle: Bundle.main)
        collectionView.register(nib2, forCellWithReuseIdentifier: "SliderCollectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            //slides
            return 1
        } else if section == 1 {
            return viewModel.address.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //section dau tien vs section thu 2 la 0 vs 1
        if indexPath.section == 0 {
            return 150
        } else if indexPath.section == 1 {
            return 100
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //slider
            let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            cell.dataSoucre = self
            return cell

        } else if indexPath.section == 1 {
            //cells
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            //gan vieModelCell = viewModel
            cell.viewModelCell = viewModel.getHomeCellModel(atIndexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            //slider Header
            return 1
        } else if section == 1 {
            return viewModel.address.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 2 section
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionCell", for: indexPath) as! SliderCollectionCell
            cell.dataSouce = self
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            //gan cho viewModelCollectionCell  = viewModel 
            cell.viewModelCollection = viewModel.getHomeCellModel(atIndexPath: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // xet frame size cho 2 section 
        if indexPath.section == 0 {
            let width = collectionView.frame.width - 40
            return CGSize(width: width, height: 150)
        }else if indexPath.section == 1 {
            let width = collectionView.frame.width
            return CGSize(width: width / 3, height: 250)
        }
        return CGSize(width: 0, height: 0)
    }
}

extension HomeViewController: SliderTableViewDataSoucre {
    func numberOfSection() -> Int {
        return viewModel.numberSectionSlide()
    }
    
    func numberRow(in section: Int) -> Int {
        return viewModel.numberImageSlide()
    }
    
    func imageSlide(in indexPath: IndexPath) -> String {
        return viewModel.imageSlide(in: indexPath.row).imageSlider
    }
    
}

extension HomeViewController:  SliderCollectionCellDataSource {
    func numberOfSectionCollection() -> Int {
//        return viewModel.numberSectionSlideCollection()
        return viewModel.numberSectionSlide()
    }
    
    func numberRowImage(in section: Int) -> Int {
        return viewModel.numberImageSlide()
    }
    
    func imageSlideCollection(in indexPath: IndexPath) -> String {
        return viewModel.imageSlide(in: indexPath.row).imageSlider
    }
}
