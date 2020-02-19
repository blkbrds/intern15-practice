//
//  HomeViewController.swift
//  BaitapHomeScreen
//
//  Created by PCI0008 on 2/4/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Struct
    struct Config {
        static let itemSizeForTableViewType = CGSize(width: UIScreen.main.bounds.width - 20, height: 110)
        static let itemSizeForCollectionViewType = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIScreen.main.bounds.width / 2 - 10)
        static let sectionInsetForTableViewType = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        static let sectionInsetForCollectionViewType = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    // MARK: - Enum
    enum ViewTypeStatus {
        case table
        case collection
        var itemSize: CGSize {
            switch self {
            case .table:
                return Config.itemSizeForTableViewType
            case .collection:
                return Config.itemSizeForCollectionViewType
            }
        }
        var sectionInset: UIEdgeInsets {
            switch self {
            case .table:
                return Config.sectionInsetForTableViewType
            case .collection:
                return Config.sectionInsetForCollectionViewType
            }
        }
    }

    //MARK: IBOutlet
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var prevButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!

    //MARK: Properties
    private var index: Int = 0
    private var viewModel = HomeViewModel()
    private var status = ViewTypeStatus.table
    private let customCell = "CustomCell"
    private let collectionViewCell = "CollectionViewCell"

    // MARK: Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        setupScrollView()
        configCollectionView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(viewTypeButtonTouchUpInside))
        changeFlowLayout(status: .collection)
    }

    @objc private func viewTypeButtonTouchUpInside() {
        configNavigationBar()
        if status == .collection {
            changeFlowLayout(status: .table)
        } else {
            changeFlowLayout(status: .collection)
        }
    }

    //MARK: Private functions
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.imageNames.count), height: 0.2 * view.frame.width)
        for i in 0..<viewModel.imageNames.count {
            createImage(index: i)
        }
        setupPageControl()
    }

    private func setupPageControl() {
        pageControl.numberOfPages = viewModel.imageNames.count
    }

    private func createImage(index: Int) {
        let imageView: UIImageView = UIImageView(image: UIImage(named: viewModel.imageNames[index]))
        let originPoint = CGPoint(x: scrollView.contentSize.width * CGFloat(index) / CGFloat(viewModel.imageNames.count), y: 0)
        imageView.frame = CGRect(origin: originPoint, size: CGSize(width: view.frame.width, height: view.frame.height / 5))
        scrollView.addSubview(imageView)
    }

    private func configCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = status.sectionInset
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.register(UINib(nibName: customCell, bundle: nil), forCellWithReuseIdentifier: customCell)
        collectionView.register(UINib(nibName: collectionViewCell, bundle: nil), forCellWithReuseIdentifier: collectionViewCell)
        collectionView.isScrollEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func changeFlowLayout(status: ViewTypeStatus) {
        self.status = status
        collectionView.reloadData()
    }

    private func configNavigationBar() {
        switch status {
        case .table:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(viewTypeButtonTouchUpInside))
        case .collection:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tableview"), style: .plain, target: self, action: #selector(viewTypeButtonTouchUpInside))
        }
    }

    //MARK: IBAction
    @IBAction private func prevButtonTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
            self.nextButton.isEnabled = true
        }) { (done) in
            if self.index == 0 {
                self.prevButton.isEnabled = false
            }
        }
        pageControl.currentPage = index
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        guard index < viewModel.imageNames.count - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
            self.prevButton.isEnabled = true
        }) { (done) in
            if self.index == self.viewModel.imageNames.count - 1 {
                self.nextButton.isEnabled = false
            }
        }
        pageControl.currentPage = index
    }
}

//MARK: Extensions
extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch status {
        case .collection:
            let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCell, for: indexPath) as! CustomCell
            cell.viewModel = viewModel.viewModelForItem(at: indexPath)
            return cell
        case .table:
            let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCell, for: indexPath) as! CustomCell
            cell.viewModel = viewModel.viewModelForItem(at: indexPath)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.detailViewModel = DetailViewModel(imageNames: viewModel.imageNames)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.75) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return status.itemSize
    }
}

