import Foundation

enum Status {
    case tableView
    case collectionView
}

final class HomeViewModel {
    var datas: [DataManager] = []
    let images = ["image1", "image2", "image3", "image4", "image5"]

    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRowInSection() -> Int {
        return datas.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> HomeCellModel {
        let item = datas[indexPath.row]
        let viewModel = HomeCellModel(data: item)
        return viewModel
    }
    
    func getData() {
        let data1 = DataManager(name: "Heaven Cafe", image: "image1", address: "123 Ham Nghi", range: "22km", rate: "1/10", favorite: true)
        let data2 = DataManager(name: "Beach Cafe", image: "image2", address: "123 Ham Nghi", range: "4km", rate: "2/10")
        let data3 = DataManager(name: "Robo Cafe", image: "image3", address: "123 Ham Nghi", range: "3km", rate: "3/10")
        let data4 = DataManager(name: "Sky Cafe", image: "image4", address: "123 Ham Nghi", range: "5km", rate: "4/10")
        let data5 = DataManager(name: "Shit Cafe", image: "image5", address: "123 Ham Nghi", range: "10km", rate: "5/10")
        self.datas.append(contentsOf: [data1, data2, data3, data4, data5])
    }
}
