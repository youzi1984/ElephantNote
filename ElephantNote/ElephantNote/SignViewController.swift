//
//  SignViewController.swift
//  nettest
//
//  Created by 鲁平凡 on 2017/12/30.
//  Copyright © 2018年 nju. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    
    var imageissaved=false
    
    var signphototosave:UIImage?
    
    var drawView:DrawSignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //签名区域位置尺寸
        var drawViewFrame = self.view.bounds
        drawViewFrame.size.height = 600
        //添加签名区域
        drawView = DrawSignatureView(frame: drawViewFrame)
        self.view.addSubview(drawView)
        
    }
    
    //预览
    @IBAction func previewSignature(_ sender: AnyObject) {
        let signatureImage = self.drawView.getSignature()
        imageView.image = signatureImage
    }
    
    //保存
    @IBAction func saveSignature(_ sender: AnyObject) {
        let signatureImage = self.drawView.getSignature()
        UIImageWriteToSavedPhotosAlbum(signatureImage, nil, nil, nil)
        signphototosave=signatureImage as UIImage
        self.drawView.clearSignature()
        imageissaved=true
    }
    
    //清除
    @IBAction func clearSignature(_ sender: AnyObject) {
        
        
        self.drawView.clearSignature()
        self.imageView.image = nil
        imageissaved=false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
       
        
        // Pass the selected object to the new view controller.
    }
    
}
