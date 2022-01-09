//
//  Demo_tableView.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit

class Demo_tableView : UIViewController {

    let listAvatar : [Avatar] = [Avatar(id: 1, name: "A", image: "A", phone: "01234"), Avatar(id: 2, name: "B", image: "B", phone: "01235"), Avatar(id: 3, name: "C", image: "C", phone: "01236")]
    @IBOutlet weak var tableDemo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDemo.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoTableViewCell")
        tableDemo.dataSource = self
        tableDemo.delegate = self
        
        
    }
    @IBAction func clickNext(_ sender: Any) {
        let thisView = UIStoryboard(name: "Main", bundle: nil)
        let vc = thisView.instantiateViewController(withIdentifier: "Demo_CollectionView") as! Demo_CollectionView
        vc.viewTableView = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension Demo_tableView : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableDemo.frame.height/4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listAvatar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableDemo.dequeueReusableCell(withIdentifier: "DemoTableViewCell") as! DemoTableViewCell
        cell.imageAva.image = UIImage(named: listAvatar[indexPath.row].image)
        cell.idLable.text = String(listAvatar[indexPath.row].id)
        cell.nameLable.text = listAvatar[indexPath.row].name
        cell.phoneLable.text = listAvatar[indexPath.row].phone
        return cell
    }
}
