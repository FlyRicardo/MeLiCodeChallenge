//
//  MeLiViewCell.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 21/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

class MeLiViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ItemCelliD"
    
    @IBOutlet weak var thumbnail: UIImageView!
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
    
    override func prepareForReuse() {
        
    }
    
    //MARK - Configuration cell
    func configurationCell(_ searchItemViewModel: SearchItemViewModelProtocol) {
        thumbnail.loadImageUsingCacheWithURLString(searchItemViewModel.thumbnailUrl, placeHolder: nil) {_ in
            //perform actions if needed
        }
        detail.text = searchItemViewModel.descriptionText
        price.text = searchItemViewModel.priceText
        installments.text = searchItemViewModel.installmentText
        shipping.text = searchItemViewModel.shippingModeText
        shipping.isHidden = searchItemViewModel.shippingModeText.isEmpty
    }
}
