//
//  DemoTableViewCell.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit

class DemoTableViewCell: UITableViewCell {


    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var imageAva: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code. 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
