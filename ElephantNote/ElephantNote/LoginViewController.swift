//
//  LoginViewController.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/26.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitToLogin(sender: UIStoryboardSegue){
        //do something
    }
    
    @IBAction func LoginBtnDown(_ sender: Any) {
        
        
//        let url:NSURL = NSURL(string:"http://localhost:3000/login?username=yushenxiao&password=3")!
//
//        let request:NSMutableURLRequest=NSMutableURLRequest(url:url as URL)
//        request.timeoutInterval=5.0
//        request.httpMethod="GET"
//
//        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue:OperationQueue()) { (res, data, error) in
//
//            let  str = NSString(data: (data)!, encoding:String.Encoding.utf8.rawValue)
//
//            print(str)
//
//            self.resultLabel.text=str! as String;
        
        print(self.usernameTextField.text)
        print(self.passwordTextField.text)
        
        if(self.usernameTextField.text==""||self.passwordTextField.text==""){
            let alertController = UIAlertController(title:"",message:"uncompleted input",preferredStyle: .alert)
            let cancelAction = UIAlertAction(title:"OK",style: .default,handler:{
                (action :UIAlertAction!) -> Void in
            })
            
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true,completion: nil)
            
        }
        
        let username=self.usernameTextField.text
        let password=self.passwordTextField.text
        
        let urlPath: String = "http://localhost:3000/login?username="+username!+"&password="+password!
        print(urlPath)
        let url = URL(string: urlPath)!
        let request1 = URLRequest(url: url)
        let response: AutoreleasingUnsafeMutablePointer<URLResponse?>?=nil
        
        do{
            let dataVal = try NSURLConnection.sendSynchronousRequest(request1, returning: response)
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
            if(res=="user not exist"||res=="wrong password"){
                print(res)
                let alertController = UIAlertController(title:"notes",message:res,preferredStyle: .alert)
                let cancelAction = UIAlertAction(title:"OK",style: .default,handler:{
                    (action :UIAlertAction!) -> Void in
                })
                
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true,completion: nil)
                
            }else{
                Account.email=res
                Account.username=username!
                Account.password=password!
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? ""){
        case "UserReg":do{
                
            }
        default:
            fatalError("Unexpected Segue")
        }
        
    }
    */

}
