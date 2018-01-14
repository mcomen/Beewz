//
//  MasterTableViewCell.swift
//  Beews
//
//  Created by MUHAMMED COMEN on 12/27/17.
//  Copyright © 2017 MUHAMMED COMEN. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var newSourceNameInCell: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
