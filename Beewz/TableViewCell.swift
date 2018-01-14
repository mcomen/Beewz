//
//  TableViewCell.swift
//  Beewz
//
//  Created by MUHAMMED COMEN on 1/8/18.
//  Copyright © 2018 MUHAMMED COMEN. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var sourceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
