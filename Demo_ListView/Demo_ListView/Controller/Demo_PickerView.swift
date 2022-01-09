//
//  Demo_PageView.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit
class Demo_PickerView : UIViewController{
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    var firstView : Demo_tableView!
    @IBOutlet weak var demoPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        demoPickerView.dataSource = self
        demoPickerView.delegate = self
        setText(firstView.listAvatar[0])
    }
    
    @IBAction func clickNext(_ sender: Any) {
        let thisView = UIStoryboard(name: "Main", bundle: nil)
        let vc = thisView.instantiateViewController(withIdentifier: "Demo_TabBar") as! Demo_TabBar
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension Demo_PickerView : UIPickerViewDataSource, UIPickerViewDelegate{
    func setText(_ data : Avatar){
        self.idLable.text = String(data.id)
        self.nameLable.text = data.name
        self.phoneLable.text = data.phone
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return firstView.listAvatar.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        imageView.image = UIImage(named: firstView.listAvatar[row].image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.setText(firstView.listAvatar[row])
    }
}
