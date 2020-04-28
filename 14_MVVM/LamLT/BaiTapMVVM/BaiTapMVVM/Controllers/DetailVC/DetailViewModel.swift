import Foundation

final class DetailViewModel {
    
    // MARK: - Property
    var dataDetail: [DataDetail] = []
    let images: [String] = ["image1", "image2", "image3", "image4", "image5"]

    // MARK: - Public Functions
    func numberOfSections() -> Int {
        return 2
    }

    func numberOfRowInSection() -> Int {
        return dataDetail.count
    }

    func viewModelForCell(at indexPath: IndexPath) -> DetailCellModel {
        let item = dataDetail[indexPath.row]
        let viewModel = DetailCellModel(dataDetail: item)
        return viewModel
    }

    func getDataDetail() {
        let data1 = DataDetail(name: Config.dataName, image: Config.dataImageName, comment: Config.commentText, time: Config.dataTime)
        let data2 = DataDetail(name: Config.dataName2, image: Config.dataImageName2, comment: Config.commentText2, time: Config.dataTime2)
        dataDetail.append(contentsOf: [data1, data2])
    }
}

// MARK: - Config
extension DetailViewModel {
    struct Config {
        static var dataName: String = "Obaba"
        static var dataImageName: String = "avatarDetail"
        static var commentText: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        static var dataTime: String = "5 days ago"

        static var dataName2: String = "jack"
        static var dataImageName2: String = "avatarDetail"
        static var commentText2: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        static var dataTime2: String = "5 days ago"
    }
}
