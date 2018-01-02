//
//  UserInfoTableViewCell.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/26.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit
import AVFoundation

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var sublist: UILabel!
    @IBOutlet weak var subinfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
