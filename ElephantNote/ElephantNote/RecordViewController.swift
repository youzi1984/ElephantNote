//
//  RecordViewController.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2018/1/1.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    var record_manager=RecordManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBtnDown(_ sender: Any) {
        record_manager.stopRecord()
    }
    
    @IBAction func recordBtnDown(_ sender: Any) {
        record_manager.beginRecord()
    }
    
    @IBAction func playBtnDown(_ sender: Any) {
        record_manager.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
