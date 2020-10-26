//
//  MeLiItemDetailViewController.swift
//  MeLiCodeChallenge
//
//  Created by Fabián Ricardo Rodríguez Avellaneda on 24/10/20.
//  Copyright © 2020 Fabián Ricardo Rodríguez Avellaneda. All rights reserved.
//

import UIKit

class MeLiItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemDetailImageView: UIImageView!
    @IBOutlet weak var itemDetailTitleLabel: UITextView!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var availabelStockLabel: UITextField!
    @IBOutlet weak var installmentsLabel: UITextField!
    @IBOutlet weak var freeShippingLabel: UITextField!
    
    @IBOutlet weak var sellerLevelIdLabel: UITextField!
    
    
    var itemDetailViewModel: ItemDetailViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        
    }
    
    private func setup() {
        guard let _itemDetailViewModel = itemDetailViewModel  else {
            return
        }
        itemDetailImageView.loadImageUsingCacheWithURLString(_itemDetailViewModel.imageUrl, placeHolder: nil) {_ in
            //perform actions if needed
        }
        itemDetailTitleLabel.text = _itemDetailViewModel.descriptionText
        priceLabel.text = _itemDetailViewModel.priceText
        availabelStockLabel.text = _itemDetailViewModel.availableStockText
        installmentsLabel.text = _itemDetailViewModel.installmentText
        freeShippingLabel.text = _itemDetailViewModel.shippingModeText
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
