import Foundation

class DetailViewModel {
    var dataDetail: [DataDetail] = []
    let images = ["image1", "image2", "image3", "image4", "image5"]
    
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
        let data1 = DataDetail(name: "Obaba", image: "avatarDetail", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", time: "5 days ago")
        let data2 = DataDetail(name: "jack", image: "avatarDetail", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", time: "6 days ago")
        dataDetail.append(contentsOf: [data1, data2])
    }
}
