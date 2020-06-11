////
////  PageViewController.swift
////  API_MVVM_2
////
////  Created by PCI0002 on 6/10/20.
////  Copyright © 2020 LeThanhLam. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//
//class PageViewController: UIPageViewController {
//    
//    var pageControl: UIPageControl!
//    
//    var subViewControllers: [UIViewController] = {
//        return [FavoritesViewController(), GitFavoritesViewController()]
//    }()
//
//    var titles: [String] = ["Repositories Favorites", "Git Favorites"]
//
//    var currentIndex: Int {
//        get {
//            return subViewControllers.firstIndex(of: self.viewControllers!.first!)!
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.delegate = self
//        self.dataSource = self
//        configNavi()
//        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
//        guard let pageControl = pageControl else {
//            return
//        }
//        pageControl.frame = CGRect(x: 500, y: 500, width: 100, height: 30)
//        pageControl.backgroundColor = .gray
//        view.addSubview(pageControl)
//    }
//
//    func configNavi() {
//        let imageDelete = UIImage(named: "trash")
//        let backButton = UIBarButtonItem(image: imageDelete, style: .plain, target: self, action: #selector(deleteButtonTouchUpInside))
//        navigationItem.leftBarButtonItem = backButton
//    }
//
//    @objc func deleteButtonTouchUpInside() {
//        print(currentIndex)
//        if currentIndex == 0 {
//            do {
//                let realm = try Realm()
//
//                let results = realm.objects(RepoRealm.self)
//
//                try realm.write {
//                    realm.delete(results)
//                }
//
//            } catch { }
//        } else {
//            do {
//                let realm = try Realm()
//
//                let results = realm.objects(GitRealm.self)
//
//                try realm.write {
//                    realm.delete(results)
//                }
//
//            } catch { }
//        }
//    }
//
//    override init(transitionStyle style: UIPageViewController.TransitionStyle,
//        navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey: Any]? = nil) {
//        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return subViewControllers.count
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        let currenIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
//        if currenIndex <= 0 {
//            return nil
//        }
//        return subViewControllers[currenIndex - 1]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        let currenIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
//        if currenIndex >= subViewControllers.count - 1 {
//            return nil
//        }
//        return subViewControllers[currenIndex + 1]
//    }
//}
//
//
////        set {
////            guard newValue >= 0,
////                newValue < subViewControllers.count else {
////                    return
////            }
////            let vc = subViewControllers[newValue]
////            let direction: UIPageViewController.NavigationDirection = newValue > currentIndex ? .forward : .reverse
////            self.setViewControllers([vc], direction: direction, animated: true, completion: nil)
////        }
////    }
