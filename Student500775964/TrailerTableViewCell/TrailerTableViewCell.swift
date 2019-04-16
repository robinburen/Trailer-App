//
//  TrailerTableViewCell.swift
//  Student500775964
//
//  Created by Wouter Kloos on 13/04/2019.
//  Copyright © 2019 HvA. All rights reserved.
//

import UIKit

final class TrailerTableViewCell: UITableViewCell {

    @IBOutlet weak var trailerImage: UIImageView!
    
    @IBOutlet weak var trailerLabel: UILabel!
    
    @IBOutlet weak var trailerText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
