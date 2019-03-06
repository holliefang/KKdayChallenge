//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let info = [[0,1,2],[3,4,5]]

class MyViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TripTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1//info.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count//info[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TripTableViewCell
       
        cell.cVC.collectionView.tag = indexPath.row
        cell.contentView.addSubview(cell.cVC.collectionView)
        
//        cell.cVC.collectionView
        return cell
    }
    
}

class TripTableViewCell:UITableViewCell{
    let cVC = MyCollectVC(collectionViewLayout: UICollectionViewFlowLayout())
    
    
}
class MyCollectVC:UICollectionViewController, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyCVCell.self, forCellWithReuseIdentifier: "cCell")
        collectionView.backgroundColor = .white
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info[collectionView.tag].count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cCell", for: indexPath) as! MyCVCell
        
        cell.label.text =
        "\(info[collectionView.tag][indexPath.item])"
//        cell.label.backgroundColor = .green
        cell.backgroundColor = .green
        
        
        return cell
    }
    
    
}

class MyCVCell:UICollectionViewCell{
    lazy var label:UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        addSubview(label)
        
        return label
    }()
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController(style: .plain)
