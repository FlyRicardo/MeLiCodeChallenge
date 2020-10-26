//
//  MeLiItemCell.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 20/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

class MeLiItemViewCell: UITableViewCell {
    
    public static let reuseIdentifier = "ItemCelliD"
    
    @IBOutlet weak var detail: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var installments: UITextField!
    @IBOutlet weak var shipping: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
