import UIKit

class HeroDotoViewController: UIViewController {

    struct Hero {
        let name: String
        let avatar: UIImage
    }

    enum Attributes: Int {
        case strength
        case agility
        case intelligence

        var teamAttributes: String {
            switch self {
            case .strength: return "Strength"
            case .agility: return "Agility"
            case .intelligence: return "Intelligence"
            }
        }

        var teamAvatar: UIImage {
            switch self {
            case .strength: return #imageLiteral(resourceName: "dragonKnight")
            case .agility: return #imageLiteral(resourceName: "Terro")
            case .intelligence: return #imageLiteral(resourceName: "CM")
            }
        }

        var heros: [Hero] {
            switch self {
            case .strength: return [Hero(name: "Dragon Knight", avatar: #imageLiteral(resourceName: "dragonKnight.jpg")), Hero(name: "Doom", avatar: #imageLiteral(resourceName: "doom.jpg")), Hero(name: "Chaos Knight", avatar: #imageLiteral(resourceName: "chaos.jpg")), Hero(name: "Sven", avatar: #imageLiteral(resourceName: "svem.jpg"))]
            case .agility: return [Hero(name: "Mortred", avatar: #imageLiteral(resourceName: "assasinPA.jpg")), Hero(name: "Luna", avatar: #imageLiteral(resourceName: "lunaHd")), Hero(name: "Lanaya", avatar: #imageLiteral(resourceName: "templar.jpg")), Hero(name: "TerroBlade", avatar: #imageLiteral(resourceName: "Terro")), Hero(name: "Spectre", avatar: #imageLiteral(resourceName: "spectre")), Hero(name: "Mirana", avatar: #imageLiteral(resourceName: "mirana.jpg"))]
            case .intelligence: return [Hero(name: "Rylai", avatar: #imageLiteral(resourceName: "CM.jpg")), Hero(name: "Lina", avatar: #imageLiteral(resourceName: "lina.png")), Hero(name: "Windranger", avatar: #imageLiteral(resourceName: "wind.jpg")), Hero(name: "Invoker", avatar: #imageLiteral(resourceName: "joker.jpg")), Hero(name: "Askasa", avatar: #imageLiteral(resourceName: "Dota-2-Queen-Of-Pain-HD-Wallpaper.jpg"))]
            }
        }
        static var count: Int { return Attributes.intelligence.hashValue + 1 }
    }

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DOTO"
        configCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func configCollectionView() {
        let cellNib = UINib(nibName: "HeroCollectionViewCell", bundle: .main)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "HeroCollectionViewCell")
        let headerNib = UINib(nibName: "HeaderCollectionReusableView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind:
                UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")

        let footerNib = UINib(nibName: "FooterCollectionReusableView", bundle: .main)
        collectionView.register(footerNib, forSupplementaryViewOfKind:
                UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
    }
}

extension HeroDotoViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let attribute = Attributes(rawValue: section)
            else { fatalError("Attributes Value Is Null") }
        return attribute.heros.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let attribute = Attributes(rawValue: indexPath.section) else { fatalError("Attributes Value Is Null") }

        guard indexPath.item < attribute.heros.count else { fatalError("Attributes index is out of Bounds") }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as! HeroCollectionViewCell
        cell.updateCell(avatar: attribute.heros[indexPath.item].avatar, name: attribute.heros[indexPath.item].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let attribute = Attributes(rawValue: indexPath.section) else { fatalError("Attributes Value Is Null") }
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionReusableView
            header.updateHeader(avatar: attribute.teamAvatar, name: attribute.teamAttributes)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath) as! FooterCollectionReusableView
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}
