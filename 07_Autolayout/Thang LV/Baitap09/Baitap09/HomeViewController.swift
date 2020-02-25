import UIKit

struct Image {
    let imageName: String
    let description: String
}

class HomeViewController: UIViewController {
    
    
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var imageScrollView: UIScrollView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private let images: [Image] = [Image(imageName: "Fox.png", description: "Foxes are small-to-medium-sized,    omnivorous mammals belonging to several genera of the family Canidae. Foxes have a flattened skull, upright triangular ears, a pointed, slightly upturned snout, and a long bushy tail (or brush)."),
                                   Image(imageName: "Dog.png", description: "The domestic dog (Canis lupus familiaris when considered a subspecies of the wolf or Canis familiaris when considered a distinct species) is a member of the genus Canis (canines), which forms part of the wolf-like canids, and is the most widely abundant terrestrial carnivore"),
                                   Image(imageName: "Sheep.png", description: "Sheep (Ovis aries) are quadrupedal, ruminant mammals typically kept as livestock. Like most ruminants, sheep are members of the order Artiodactyla, the even-toed ungulates. Although the name sheep applies to many species in the genus Ovis, in everyday usage it almost always refers to Ovis aries."),
                                   Image(imageName: "Tiger.png", description: "The tiger (Panthera tigris) is the largest species among the Felidae and classified in the genus Panthera. It is most recognisable for its dark vertical stripes on orangish-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar"),
                                   Image(imageName: "Horse.png", description: "The horse (Equus ferus caballus) is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today"),
                                   Image(imageName: "Bird.png", description: "Birds are a group of endothermic vertebrates constituting the class Aves, characterized by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton")]
    
    private var index: Int = 0
    
    private func setUpUI() {
        setUpImageScrollView()
        for index in 0..<images.count {
            createImage(index: index)
            setUpInfoLabel(index: index)
        }
    }
    
    private func setUpImageScrollView() {
        imageScrollView.contentSize = CGSize(width: 0.8 * self.view.frame.width * CGFloat(images.count), height: 0.8 * self.view.frame.width * 0.8)
    }
    
    private func createImage(index: Int) {
        var imageView = UIImageView()
        imageView = UIImageView(image: UIImage(named: self.images[index].imageName))
        let originPoint = CGPoint(x: imageScrollView.contentSize.width * CGFloat(index) / CGFloat(images.count), y: 0)
        imageView.frame = CGRect(origin: originPoint, size: CGSize(width: 0.8 * self.view.frame.width, height: 0.8 * self.view.frame.width * 0.8))
        imageScrollView.addSubview(imageView)
    }
    
    private func setUpInfoLabel(index: Int) {
        infoLabel.text = "\(index)/5"
    }
    
    @IBAction func nextButtonDidClick(_ sender: Any) {
        guard index < images.count - 1 else { return }
        index += 1
        UIView.animate(withDuration: 0.5, animations: {
            self.imageScrollView.contentOffset = CGPoint(x: CGFloat(self.index) * 0.8 * self.view.frame.width, y: 0)
            self.descriptionTextView.text = self.images[self.index].description
            self.setUpInfoLabel(index: self.index)
            self.prevButton.isEnabled = true
        }) { (done) in
            if self.index == self.images.count - 1 {
                self.nextButton.isEnabled = false
            }
        }
    }
    
    @IBAction func prevButtonDidClick(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        UIView.animate(withDuration: 0.5, animations: {
            self.imageScrollView.contentOffset = CGPoint(x: CGFloat(self.index) * 0.8 * self.view.frame.width, y: 0)
            self.descriptionTextView.text = self.images[self.index].description
            self.setUpInfoLabel(index: self.index)
            self.nextButton.isEnabled = true
        }) { (done) in
            if self.index == 0 {
                self.prevButton.isEnabled = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    

}
