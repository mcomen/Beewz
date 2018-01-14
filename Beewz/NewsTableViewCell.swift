//
//  NewsTableViewCell.swift
//  Beews
//
//  Created by MUHAMMED COMEN on 12/30/17.
//  Copyright © 2017 MUHAMMED COMEN. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleOfNews: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var moreDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
