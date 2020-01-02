//
//  HomeViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var menuCategoryCollectionView: UICollectionView!

    // MARK: - Properties
    private var selectedIndex = 0
    private let menuCategoryCell = "MenuCategoryCell"
    private let menuCategory = ["U.S", "Business", "Technology", "Health", "Science", "Sports", "Entertainment"]

    private var pageController: UIPageViewController!
    private var viewControllers = [BaseHomeChildViewController]()
    private var currentPage: Int = 0

    // MARK: - Life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configPageViewController()
//        configCustomView() #warning("if many time ---- scroll view color")
    }

    // MARK: - config
    override func setupUI() {
        super.setupUI()
        title = "Headlines"
        configMenuCategoryCollectionView()
    }

    // MARK: - Private funcs
    private func configMenuCategoryCollectionView() {
        menuCategoryCollectionView.register(UINib(nibName: menuCategoryCell, bundle: .main), forCellWithReuseIdentifier: menuCategoryCell)
        menuCategoryCollectionView.dataSource = self
        menuCategoryCollectionView.delegate = self
        // auto resize item
        if let flowLayout = menuCategoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }

    private func configPageViewController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        let widthScreen = UIScreen.main.bounds.width
        let heightScreen = UIScreen.main.bounds.height
        let yMenuCategory = menuCategoryCollectionView.frame.maxY
        let heightMenuCategory = menuCategoryCollectionView.frame.height

        pageController.view.frame = CGRect(x: 0, y: yMenuCategory, width: widthScreen, height: heightScreen - heightMenuCategory)
        addChild(pageController)
        view.addSubview(pageController.view)

        addChildViewController()

        pageController.setViewControllers([viewControllers[0]], direction: .forward, animated: false)
        pageController.didMove(toParent: self)

        pageController.dataSource = self
        pageController.delegate = self
    }

    private func addChildViewController() {
        for (index, type) in BaseHomeChildViewController.ScreenType.allCases.enumerated() {
            let viewController = BaseHomeChildViewController()
            viewController.screenType = type
            viewController.view.tag = index
            viewControllers.append(viewController)
        }
    }

    private func scrollToItem(to selectedIndex: Int) {
        menuCategoryCollectionView.scrollToItem(at: IndexPath(row: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)

        for i in 0..<menuCategory.count {
            if let cell = menuCategoryCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? MenuCategoryCell {
                cell.configUI(isEnable: i == selectedIndex)
            }
        }

        pageController.setViewControllers([viewControllers[selectedIndex]], direction: .reverse, animated: true)
    }

    private func scrollToItem(to selectedIndex: Int, a: String) {
        menuCategoryCollectionView.scrollToItem(at: IndexPath(row: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)

        for i in 0..<menuCategory.count {
            if let cell = menuCategoryCollectionView.cellForItem(at: IndexPath(item: i, section: 0)) as? MenuCategoryCell {
                cell.configUI(isEnable: i == selectedIndex)
            }
        }
    }
}

// MARK: - PageViewController DataSource
extension HomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? BaseHomeChildViewController else { return nil }
        let index: Int = viewController.view.tag
        guard index == 0 else {
            let viewController = viewControllers[index - 1]
            return viewController
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? BaseHomeChildViewController else { return nil }
        var index: Int = viewController.view.tag
        index += 1
        guard index == menuCategory.count else {
            let viewController = viewControllers[index]
            return viewController
        }
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return menuCategory.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished, let vc = pageViewController.viewControllers?.first {
            scrollToItem(to: vc.view.tag, a: "")
        }
    }
}

// MARK: - CollectionView DataSource, Delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    // DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuCategory.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = menuCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: menuCategoryCell, for: indexPath) as? MenuCategoryCell else { return UICollectionViewCell() }
        menuCell.configUI(category: menuCategory[indexPath.row], isEnable: selectedIndex == indexPath.row)
        return menuCell
    }

    // Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        scrollToItem(to: selectedIndex)
    }
}
