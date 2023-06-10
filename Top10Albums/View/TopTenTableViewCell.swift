//
//  TopTenTableViewCell.swift
//  Top10Albums
//
//  Created by Jake Gordon on 20/05/2023.
//

import UIKit

//Custom tableViewCell for Top Ten Lists.

class TopTenTableViewCell: UITableViewCell {

    @IBOutlet weak var recordImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
