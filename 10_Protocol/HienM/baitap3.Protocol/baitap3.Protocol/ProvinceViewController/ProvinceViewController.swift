import UIKit

class ProvinceViewController: BaseViewController {

	@IBOutlet var TinhButton: [UIButton]!
	var diaDiem: DiaDiem = DiaDiem()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func setupNavigationBar() {
		title = "Province"

		let rightButton = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(pushToDistrictViewController))
		navigationItem.rightBarButtonItem = rightButton
		
		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backtoViewLocalViewController))
		navigationItem.leftBarButtonItem = backButton
	}
	@objc func pushToDistrictViewController() {
		let vc = DistrictViewController()
		vc.diaDiem = diaDiem
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc func backtoViewLocalViewController() {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func getProvinceAction(_ sender: UIButton) {
		TinhButton.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .green
		diaDiem.tinh = sender.titleLabel?.text ?? ""
	}
}
