//
//  RegViewController.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/26.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var password0TextField: UITextField!
    let alertController1 = UIAlertController(title:"",message:"uncompleted input",preferredStyle: .alert)
    let cancelAction1 = UIAlertAction(title:"OK",style: .default,handler:{
        (action :UIAlertAction!) -> Void in
    })
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertController1.addAction(cancelAction1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func regBtnDown(_ sender: Any) {
        
        print(self.usernameTextField.text)
        print(self.passwordTextField.text)
        
        if(self.usernameTextField.text!==""||self.emailTextField.text!==""||self.passwordTextField.text!==""||self.password0TextField.text!==""){
//            let alertController1 = UIAlertController(title:"notes",message:"uncompleted input",preferredStyle: .alert)
//            let cancelAction1 = UIAlertAction(title:"OK",style: .default,handler:{
//                (action :UIAlertAction!) -> Void in
//            })
//
//            alertController1.addAction(cancelAction1)
//
//            self.present(alertController1, animated: true,completion: nil)
           
            
            self.present(alertController1, animated: true,completion: nil)
        }
        else{
        let username=self.usernameTextField.text
        let email=self.emailTextField.text
        let password=self.passwordTextField.text
        let password0=self.password0TextField.text
        
        
        let urlPath: String = "http://localhost:3000/reg"
        let url = URL(string: urlPath)!
        var request = URLRequest(url: url)
        let response: AutoreleasingUnsafeMutablePointer<URLResponse?>?=nil
        let param:NSString=NSString(format:"username=%@&email=%@&password=%@&password0=%@",self.usernameTextField.text!,self.emailTextField.text!,self.passwordTextField.text!,self.password0TextField.text!)
        
        request.httpMethod="POST"
        request.httpBody=param.data(using: String.Encoding.utf8.rawValue)
        
        do{
            let dataVal = try NSURLConnection.sendSynchronousRequest(request, returning: response)
            let dataString = NSString.init(data: dataVal, encoding: String.Encoding.utf8.rawValue)
            //  print(response as Any)
            //  print(dataString!)
            let res=dataString! as String
            /*
             let alertController = UIAlertController(title:"",message:res,preferredStyle: .alert)
             let cancelAction = UIAlertAction(title:"OK",style: .default,handler:{
             (action :UIAlertAction!) -> Void in
             })
             
             alertController.addAction(cancelAction)
             
             self.present(alertController, animated: true,completion: nil)
             */
            if(res=="user exist"||res=="password error"||res=="email used"){
                print(res)
                let alertController2 = UIAlertController(title:"notes",message:res,preferredStyle: .alert)
                let cancelAction2 = UIAlertAction(title:"OK",style: .default,handler:{
                    (action :UIAlertAction!) -> Void in
                })
                
                alertController2.addAction(cancelAction2)
                
                self.present(alertController2, animated: true,completion: nil)
                
            }else{
                let alertController3 = UIAlertController(title:"notes",message:"success",preferredStyle: .alert)
                let cancelAction3 = UIAlertAction(title:"OK",style: .default,handler:{
                    (action :UIAlertAction!) -> Void in
                })
                
                alertController3.addAction(cancelAction3)
                
                self.present(alertController3, animated: true,completion: nil)
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
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
