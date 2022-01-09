//
//  Avatar.swift
//  Demo_ListView
//
//  Created by Shi Ying Nguyen on 08/01/2022.
//

import UIKit
class Avatar {
    var id : Int!
    var name : String!
    var image : String!
    var phone : String!
    internal init(id : Int? = nil, name : String? = nil, image : String? = nil , phone : String!){
        self.id = id
        self.name = name
        self .image = image
        self.phone = phone
    }
}
