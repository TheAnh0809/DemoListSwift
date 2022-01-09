//
//  Demo_CollectionView.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit
class Demo_CollectionView : UIViewController{
    var viewTableView : Demo_tableView! 
    @IBOutlet weak var demoCLV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        demoCLV.register(UINib(nibName: "Demo_CLV_Cell", bundle: nil), forCellWithReuseIdentifier: "Demo_CLV_Cell")
        demoCLV.delegate = self
        demoCLV.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 210 , height: 197)
        demoCLV.collectionViewLayout = layout
    }
    @IBAction func ClickNext(_ sender: Any) {
        
        let thisView = UIStoryboard(name: "Main", bundle: nil)
        let vc = thisView.instantiateViewController(withIdentifier: "Demo_PickerView") as! Demo_PickerView
        vc.firstView = viewTableView
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension Demo_CollectionView : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewTableView.listAvatar.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = demoCLV.dequeueReusableCell(withReuseIdentifier: "Demo_CLV_Cell", for: indexPath) as! Demo_CLV_Cell
        let data = viewTableView.listAvatar[indexPath.row]
        cell.idAva.text = String(data.id)
        cell.nameAva.text = data.name
        cell.imageAva.image = UIImage(named: data.image)
        cell.phoneAva.text = data.phone
        return cell
    }
}
