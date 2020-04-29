import UIKit

class HomeViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    var namePerson: [String] = ["Obama", "Putin"]
    var address: [String] = ["new york America.new york America.new york America.", "Macsova Rusian.Macsova Rusian"]
    var birthDayPerson: [String] = ["04/08/1961", "07/10/1952"]
    var sexPerson: [String] = ["Man", "Man"]
    var inforPerson: [String] = ["Là tổng thống thứ 44 của Hoa Kỳ từ năm 2009 đến năm 2017. Ông là người Mỹ gốc Phi đầu tiên được bầu vào chức vụ này. Lớn lên ở Honolulu, Hawaii, cá nhân ông thừa hưởng những nền văn hoá Phi-Âu-Á-Mỹ của thế giới từ thuở thiếu thời, Obama tốt nghiệp Viện Đại học Columbia và Trường Luật Viện Đại học Harvard, nơi ông từng là chủ tịch Harvard Law Review. Obama có thiên hướng hoạt động vì cộng đồng từ thời thanh niên và hoạt động cộng đồng tại Chicago trước khi nhận văn bằng luật, rồi làm luật sư về dân quyền và dạy luật hiến pháp tại Trường Luật Viện Đại học Chicago từ năm 1992 đến 2004. Ông phục vụ ba nhiệm kỳ đại diện cho Hạt 13 tại Thượng viện Tiểu bang Illinois từ năm 1997 đến 2004. Năm 2000, ông ứng cử vào Viện Dân biểu Hoa Kỳ nhưng thất bại.", "Putin là nhà lãnh đạo Nga giành được sự ủng hộ lớn nhất của người dân kể từ sau sự tan rã của Liên Xô. Putin được những người ủng hộ ông khen ngợi vì đã phục hồi sức mạnh của nước Nga sau những năm cầm quyền hỗn loạn của Boris Yeltsin.[2][3][4] Trong tám năm cầm quyền, nền kinh tế đã ra khỏi cơn khủng hoảng với GDP tăng gấp sáu lần (72% PPP).[5][6] Ông cũng phản bác nhiều vụ tuyên truyền chống nước Nga và tống khứ những đầu sỏ tài phiệt từng lũng đoạn chính trường Nga trong thập niên 1990[7] Trong khi đó, những người phản đối Putin mô tả ông là một nhà độc tài, lạm dụng quyền lực. Một số nhà hoạt động nhân quyền ở Nga, các tổ chức nhân quyền và một số nhà bình luận đã bày tỏ lo ngại về tình trạng dân chủ, tự do báo chí và nhân quyền tại Nga[8], họ buộc tội Putin đã vi phạm nhân quyền, đàn áp các cuộc phản đối dân sự cũng như ra lệnh ám sát các nhà phê bình và đối thủ chính trị của ông. Putin đã bác bỏ các cáo buộc nói trên[9], ông cũng cho rằng nước phương Tây đang tỏ ra đạo đức giả khi họ luôn thuyết giảng nước Nga về dân chủ, nhân quyền nhưng lại liên tục bất chấp luật pháp quốc tế và đem quân xâm lược các nước khác[10]. Các quan chức của chính phủ Hoa Kỳ đã buộc tội ông đưa ra một chương trình can thiệp chống lại Hillary Clinton và ủng hộ Donald Trump trong cuộc bầu cử tổng thống Hoa Kỳ năm 2016, điều mà Putin đã thường xuyên phủ nhận."]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    //MARK: - Public Function
    func configTableView() {
        title = "List Friend"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
    }

    func loadData() {

    }
}

// MARK : - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return namePerson.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.namePersonLabel.text = namePerson[indexPath.section]
        cell.addressLabel.text = address[indexPath.section]
        cell.sexLabel.text = sexPerson[indexPath.section]
        cell.birthDayLabel.text = birthDayPerson[indexPath.section]
        cell.infoLabel.text = inforPerson[indexPath.section]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pfc = ProfileViewController()
        pfc.name = namePerson[indexPath.section]
        pfc.sex = sexPerson[indexPath.section]
        pfc.birthDay = birthDayPerson[indexPath.section]
        pfc.info = inforPerson[indexPath.section]
        pfc.address = address[indexPath.section]
        self.navigationController?.pushViewController(pfc, animated: true)
    }

}
