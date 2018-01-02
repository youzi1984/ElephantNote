//
//  NoteItem.swift
//  ElephantNote
//
//  Created by ShenXiao Yu on 2017/12/11.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit

class NoteItem: NSObject{
    var title:String?
    var content:String?
 //   var notebookno:Int
    var photono:Int
    var photo = [UIImage]()
    var time = [Int]()
    //MARK: Initialization
    override init() {
        photono=0;
    }
    
}
