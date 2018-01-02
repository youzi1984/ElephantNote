//
//  TimeViewController.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/11.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var alarmclocktime: UIDatePicker!
    
    @IBOutlet weak var alarmtext: UITextField!
    
    var alarmison=false
    
    let localNotification = UILocalNotification()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func savealarm(_ sender: Any) {
        if (alarmison){
            UIApplication.shared.cancelLocalNotification(localNotification)
        }
        
        alarmison = true
        /*
        // //取消所有的本地通知
        UIApplication.shared.cancelAllLocalNotifications()
        //数字清零
        UIApplication.shared.applicationIconBadgeNumber = 0
        */
        
        
        //设置时间
        localNotification.fireDate = alarmclocktime.date
        
       
        localNotification.timeZone = NSTimeZone.default
        localNotification.alertBody = alarmtext.text
        localNotification.applicationIconBadgeNumber =  1
        localNotification.soundName = UILocalNotificationDefaultSoundName
        print("add alarm")
        UIApplication.shared.scheduleLocalNotification(localNotification)
        let alertController = UIAlertController(title: "系统提示",
                                                message: "成功保存闹钟", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            print("press OK")
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
 
 
    }
    
    
    //取消通知消息
    @IBAction func cancel(_ sender: Any){
        UIApplication.shared.cancelLocalNotification(localNotification)
        alarmison = false
    }
    

}
