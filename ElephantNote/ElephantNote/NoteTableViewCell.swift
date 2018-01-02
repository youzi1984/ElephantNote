//
//  NoteTableViewCell.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/11.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit
import AVFoundation

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var subcontentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
