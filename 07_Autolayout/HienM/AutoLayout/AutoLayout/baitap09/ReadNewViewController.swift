import UIKit

class ReadNewViewController: UIViewController {
	@IBOutlet weak var backImageButton: UIButton!
	@IBOutlet weak var nextImageButton: UIButton!
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var commentButton: UIButton!
	@IBOutlet weak var shareButton: UIButton!
	@IBOutlet weak var contentTextView: UITextView!
	@IBOutlet weak var contentImageView: UIImageView!

	let images: [String] = ["casau", "lacda", "chuotchui", "doi", "thorung", ""]
	let contents: [String] = ["Câu nói “nước mắt cá sấu” ngụ ý người hay biểu lộ cảm xúc giả tạo, xuất phát từ thực tế là loài cá sấu thường chảy nước mắt khi nhử và hạ sát con mồi của mình. Do cá sấu không thể nhai cho nên nó phải xé nhỏ con mồi thành miếng vừa miệng rồi nuốt cả miếng to. Như một sự ngẫu nhiên, tuyến nước mắt của chúng lại nằm ngay gần cổ họng, mà khi chúng nuốt những miếng thức ăn to thì vô tình sẽ tạo sức ép lên tuyến này và làm nước mắt chảy ra.", "Một con lạc đà có thể sống đến 7 ngày mà không cần nước. Có được khả năng này không phải vì chúng chứa nước dự trữ trong những cái bướu mà chính là nhờ vào những tế bào hồng cầu có hình oval (khác với tế bào hồng cầu thông thường có hình cầu). Còn những cái bướu chẳng có vai trò gì khác ngoài là nguồn dự trữ mỡ. Với cái bướu này, lạc đà có được nguồn năng lượng tương đương với lượng thức ăn nó ăn trong 3 tuần. Còn bộ phận cơ thể giúp nó tiết kiệm tối đa lượng nước thoát ra ngoài chính là thận và ruột. Nhờ có 2 bộ phận hoạt động rất hiệu quả này mà nước tiểu của lạc đà đặc quánh như xi-rô, còn phân của chúng thì khô đến nổi có thể dùng để đốt ngay được.", "Đây là loài vật duy nhất được lấy tên đặt cho một ngày ở Mỹ - ngày 2/2 hàng năm, ngày mà nó chui ra khỏi hang sau giấc ngủ đông dài. Và người dân tin rằng, nếu con vật này nhìn thấy cái bóng của nó vào ngày này thì mùa đông sẽ kéo dài thêm 6 tuần nữa, nếu không thì mùa xuân đã gần kề rồi. Con chuột chũi tiên tri nổi tiếng nhất có tênVậy n Punxsutawney Phil. hững lời tiên tri của loài gặm nhắm này đáng tin đến đâu? Các nhà nghiên cứu nói rằng, khi trồi lên khỏi hang, chúng thật sự có cảm nhận và phản ứng với những thay đổi về cường độ ánh sáng và nhiệt độ bên ngoài – 2 yếu tố cốt yếu dùng trong dự đoán thời tiết. Và thực tế là xác xuất chính xác của những “lời tiên tri” của Phil cũng khá cao.", "Quan niệm này xuất phát từ việc loài dơi phần lớn sử dụng khả năng định vị bằng siêu âm để di chuyển và tránh chướng ngại vật trong bóng tối. Tuy nhiên, không phải vì vậy mà mắt chúng không nhìn thấy gì. Ngược lại, mắt chúng hoàn toàn có chức năng nhận biết hình ảnh, tuy rằng kích thước mắt khá nhỏ và thị lực cũng khá kém. Ngoài ra thính giác và khứu giác của chúng cũng cực nhạy.", "Trong tiếng Anh có một thành ngữ “Mad as a March Hare”, có nghĩa đen là “Điên như thỏ tháng 3”. Điên ở đây cũng có thể hiểu là bất chợt trở nên hung dữ. Thành ngữ này xuất phát từ thực tế sau: vào đầu mùa sinh sản của thỏ rừng, kéo dài từ tháng 2 đến 9, các con thỏ cái thông thường vốn hiền lành, bỗng nhiên trở nên dữ dằn, tỏ thái độ nổi loạn và chống đối khi có một con đực quá nhiệt tình trong lúc ân ái. Chúng thường dùng 2 chân trước đánh lại nhân tình của mình, và hành động này trông giống như chúng đang đấm bốc vậy. Trước đây hành động này của loài thỏ rừng bị hiểu lầm là 2 con đực đánh nhau để giành uy thế, nhưng các nhà khoa học đã “giải oan” cho các chàng thỏ.", ""]

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	var x = 0

	@IBAction func nextImageButton(_ sender: Any) {
		if x < 4 { x += 1 }
		else { x += 0 }
		
		contentImageView.image = UIImage (named: images[x])
		contentTextView.text = contents[x]
	}

	@IBAction func backImageButton(_ sender: Any) {
		if x > 0 { x -= 1 }
		else { x -= 0 }
		
		contentImageView.image = UIImage (named: images[x])
		contentTextView.text = contents[x]
	}
}
