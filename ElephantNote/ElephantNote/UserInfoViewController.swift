//
//  UserInfoViewController.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/26.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UILabel!
    @IBOutlet weak var emailTextField: UILabel!
    @IBOutlet weak var passwordTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let thread = Thread.init(target: self, selector: Selector("run"), object: nil)
//        thread.name = "Thread A"
//        thread.start()
//
//        func run() {
//            while(true){
//                self.usernameTextField.text=Account.username
//                self.emailTextField.text=Account.email
//                self.passwordTextField.text=Account.password
//            }
//            let thread = Thread.current
//            print("run--\(thread.name)-\(thread)")
//        }
        
        self.usernameTextField.text=Account.username
        self.emailTextField.text=Account.email
        self.passwordTextField.text=Account.password
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RefreshBtnDown(_ sender: Any) {
        self.usernameTextField.text=Account.username
        self.emailTextField.text=Account.email
        self.passwordTextField.text=Account.password
        
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
