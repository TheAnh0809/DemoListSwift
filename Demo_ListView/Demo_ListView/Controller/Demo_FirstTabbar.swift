//
//  Demo_FirstTabbar.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit
class Demo_FirstTabbar : UIViewController{
    @IBOutlet weak var Demo_Segmen: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func changeSegmen(_ sender: Any) {
        switch Demo_Segmen.selectedSegmentIndex{
        case 0 :
            view.backgroundColor = .red
        default:
            view.backgroundColor = .green
        }
    }
}
