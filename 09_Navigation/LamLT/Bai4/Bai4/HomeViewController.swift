import UIKit

class HomeViewController: UIViewController {

    private var navBar: UINavigationBar?

        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }

        func setupUI() {
            title = "Home"
            navBar = navigationController?.navigationBar
        }
        
        lazy var searchBar = UISearchBar()

        @IBAction private func changeNavigationBarToucUpInside(_ sender: UIButton) {
            clearNavigationBar()
            switch sender.tag {
            case 1:
                title = "Gradient NavigationBar"
                navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                navigationController?.navigationBar.backgroundColor = UIColor(displayP3Red: 231 / 255, green: 28 / 255, blue: 89 / 255, alpha: 1)
            case 2:
                searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
                searchBar.placeholder = "Search"
                searchBar.delegate = self
                let leftSearchBarButotItem = UIBarButtonItem(customView: searchBar)
                navigationItem.leftBarButtonItems = [leftSearchBarButotItem]
            default:
                return
            }
        }

        private func clearNavigationBar() {
            title = ""
            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            navigationItem.rightBarButtonItems = []
            navigationItem.leftBarButtonItems = []
            navBar?.backgroundColor = .white
        }
    }

    extension HomeViewController: UISearchBarDelegate {
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
    }
