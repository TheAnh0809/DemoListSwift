//
//  Demo_tableView.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit

class Demo_tableView : UIViewController {

    var listAvatar : [Avatar] = [Avatar]()
    @IBOutlet weak var tableDemo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...30{
            let avata = Avatar(id: i, name: "user \(i)", image: radom(), phone: "01234\(i)")
            listAvatar.append(avata)
        }
        tableDemo.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoTableViewCell")
        tableDemo.dataSource = self
        tableDemo.delegate = self
        
        
    }
    func radom() -> String{
        let x = Int.random(in: 0..<3)
        switch x{
        case 0: return "A"
        case 1: return "B"
        default: return "C"
        }
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
