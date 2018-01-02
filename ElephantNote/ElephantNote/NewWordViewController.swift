//
//  NewWordViewController.swift
//  ElephantNote
//
//  Created by ShenXiao Yu on 2017/12/11.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit

class NewWordViewController: UIViewController {

    @IBOutlet weak var WordTextField: UITextField!
    @IBOutlet weak var WordsaveButton: UIBarButtonItem!
    @IBOutlet weak var searchbutton: UIBarButtonItem!
    @IBOutlet weak var webviewtext: UIWebView!
    
    var worditem:WordItem?
    var WordisSave=false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let curworditem = worditem {
            WordTextField.text=curworditem.word
        }
        
        //self.webviewtext = UIWebView()
        //print(view.bounds)
        webviewtext.delegate = self as? UIWebViewDelegate
        
        
    }

    
    // @IBAction func searchword(_ sender: Any) {
        /*
        var urlString = "https://fanyi.baidu.com/?aldtype=16047#auto/zh"
        //var urlString = "https://www.baidu.com"
        var url = NSURL(string: urlString)
        let data = NSData(contentsOf: url! as URL)
        let dataString = NSString(data: data! as Data, encoding: String.Encoding.utf8.rawValue)!
        let infoScanner = Scanner(string: dataString as String)
        print("\n\n\n")
        print(dataString)
        print("\n\n\n")
 */
        
        /*
        print("search")
    let urlString = "ymailto://"
    let url = URL(string: urlString)
        
        UIApplication.shared.open(url!, options: [:],
                                      completionHandler: {
                                        (success) in
            })
    }*/
 
    
        /*
        var urlRequest = NSURLRequest(url :url! as URL)
        view.addSubview(webviewtext)
        webviewtext.loadRequest(urlRequest as URLRequest)
        let body = webviewtext.stringByEvaluatingJavaScript(from: "document.body.innerText") ?? "" as String
        
        print("\n\n\n")
        let title = webviewtext.stringByEvaluatingJavaScript(from: "function showtitle();showtitle()")
        print("title:\(title)")
        print("body:\(body)")
        print("\n\n\n")
 
        
        
        
 
    }*/
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let btn = sender as? UIBarButtonItem{
            if btn==WordsaveButton{
                WordisSave=true
            }
        }
        
        // Pass the selected object to the new view controller.
    }
    

}
