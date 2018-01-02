//
//  NewitemViewController.swift
//  ElephantNote
//
//  Created by ShenXiao Yu on 2017/12/10.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit

class NewitemViewController: UIViewController,UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

 //  @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var contentTextField: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
     var phototosave=[UIImage]()
    
    var photono:Int = 0
    
    var noteitem:NoteItem?
    
    
    var downMenuButton:DWBubbleMenuButton!
    
    var upMenuView:DWBubbleMenuButton!
    
    var isSave=false
   
    var isEmoji = false
    
    var word = WordItem()
   
    //文字大小
    let textViewFont = UIFont.systemFont(ofSize: 22)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Set up views if editing an existing Meal.
        if let noteitem = noteitem {
            titleTextField.text = noteitem.title
            contentTextField.text = noteitem.content
            photono=noteitem.photono
           // photoImageView.image = noteitem.photo
           // ratingControl.rating = noteitem.rating
            for image in noteitem.photo{
                insertPicture(image)
            }
        }
        
        
        
        contentTextField.isEditable = true
        
        self.becomeFirstResponder()
        let menu = UIMenuController.shared
        //menu.menuItems = [mail]
        menu.menuItems = [UIMenuItem(title: "加入单词表", action: #selector(NewitemViewController.addtodictionary))/*...*/]
        
//contentTextField.setMarkedText(<#T##markedText: String?##String?#>, selectedRange: contentTextField.selectedRange)
        
    //UITextRange *selectedRange = [textView selectedTextRange]
        
        // NSString *selectedText = [textView textRange:selectRange]
    //contentTextField.selectedRange.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addtodictionary(){
        print("dictionary")
        let selectedtext=(contentTextField.text as NSString).substring(with:contentTextField.selectedRange)
        print(selectedtext)
        word = WordItem()
        word.word=selectedtext
        Dictionary.Words.append(word)
        //DictionaryTableViewController().addnewword(newword:selectedtext)
       // print(contentTextField.selectedRange)
        //获取textView的所有文本，转成可变的文本
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let btn = sender as? UIBarButtonItem{
            if btn==saveButton{
                isSave=true
            }
        }
        // Pass the selected object to the new view controller.
        
        
    }
    
    @IBAction func exitToNewitem(sender: UIStoryboardSegue){
        if let nvc = sender.source as? SignViewController  {
            let photo = nvc.signphototosave
            if nvc.imageissaved {
                self.phototosave.append(photo!)
                photono=photono+1
                insertPicture(photo!,mode:.fitTextView)
                
            }
        }
    }
    
    /*
    //插入文字
    func insertString(_ text:String) {
        //获取textView的所有文本，转成可变的文本
        let mutableStr = NSMutableAttributedString(attributedString: contentTextField.attributedText)
        //获得目前光标的位置
        let selectedRange = contentTextField.selectedRange
        //插入文字
        //let attStr = NSAttributedString(string: text)
        //mutableStr.insert(attStr, at: selectedRange.location)
        
        //设置可变文本的字体属性
        mutableStr.addAttribute(NSAttributedStringKey.font, value: textViewFont,
                                range: contentTextField.selectedRange)
        //再次记住新的光标的位置
        let newSelectedRange = NSMakeRange(selectedRange.location, 0)
        
        //重新给文本赋值
        contentTextField.attributedText = mutableStr
        //恢复光标的位置（上面一句代码执行之后，光标会移到最后面）
        contentTextField.selectedRange = newSelectedRange
    }
 */
    
    
    //插入图片
    func insertPicture(_ image:UIImage, mode:ImageAttachmentMode = .default){
        //获取textView的所有文本，转成可变的文本
        let mutableStr = NSMutableAttributedString(attributedString: contentTextField.attributedText)
        
        //创建图片附件
        let imgAttachment = NSTextAttachment(data: nil, ofType: nil)
        var imgAttachmentString: NSAttributedString
        imgAttachment.image = image
        
        //设置图片显示方式
        if mode == .fitTextLine {
            //与文字一样大小
            imgAttachment.bounds = CGRect(x: 0, y: -4, width: contentTextField.font!.lineHeight,
                                          height: contentTextField.font!.lineHeight)
        } else if mode == .fitTextView {
            //撑满一行
            let imageWidth = contentTextField.frame.width - 10
            let imageHeight = image.size.height/image.size.width*imageWidth
            imgAttachment.bounds = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        }
        
        imgAttachmentString = NSAttributedString(attachment: imgAttachment)
        
        //获得目前光标的位置
        let selectedRange = contentTextField.selectedRange
        //插入文字
        mutableStr.insert(imgAttachmentString, at: selectedRange.location)
        //设置可变文本的字体属性
        mutableStr.addAttribute(NSAttributedStringKey.font, value: textViewFont,
                                range: NSMakeRange(0,mutableStr.length))
        //再次记住新的光标的位置
        let newSelectedRange = NSMakeRange(selectedRange.location+1, 0)
        
        //重新给文本赋值
        contentTextField.attributedText = mutableStr
        //恢复光标的位置（上面一句代码执行之后，光标会移到最后面）
        contentTextField.selectedRange = newSelectedRange
        //移动滚动条（确保光标在可视区域内）
        self.contentTextField.scrollRangeToVisible(newSelectedRange)
    }
    
/*
    //插入图片
    @IBAction func btnClick(_ sender: AnyObject) {
        // Hide the keyboard.
        //contentTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
 
        
       
        //insertPicture(UIImage(named: "icon")!)//, mode:.fitTextLine)
    }
    

    */
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
       // phototosave=selectedImage;
        self.phototosave.append(selectedImage)
        photono=photono+1
        if(isEmoji){
            insertPicture(selectedImage,mode:.fitTextLine)
            
        }
        else{
            insertPicture(selectedImage,mode:.fitTextView)
        }


        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        
        // Create down menu button
        /*let homeLabel = self.createHomeButtonView()
        
        downMenuButton = DWBubbleMenuButton(frame: CGRect(x: 20.0,
                                                          y: 20.0,
                                                          width: homeLabel.frame.size.width,
                                                          height: homeLabel.frame.size.height), expansionDirection: ExpansionDirection.directionDown)
        downMenuButton.homeButtonView = homeLabel;
        downMenuButton.addButtons(self.createDemoButtonArray())
        self.view.addSubview(downMenuButton)
        */
        
        
        // Create up menu button
        let homeLabel2 =  self.createHomeButtonView()
        
        upMenuView = DWBubbleMenuButton(frame: CGRect(x: self.view.frame.size.width - homeLabel2.frame.size.width - 20.0,y: self.view.frame.size.height - homeLabel2.frame.size.height - 20.0,
                                                      width: homeLabel2.frame.size.width,height: homeLabel2.frame.size.height),expansionDirection: .directionUp)
        upMenuView.homeButtonView = homeLabel2
        
        upMenuView.addButtons(self.createDemoButtonArray())
        
        self.view.addSubview(upMenuView)
 
    }
    
    
    func createHomeButtonView() -> UILabel {
        
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
        
        label.text = "添加";
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.layer.cornerRadius = label.frame.size.height / 2.0;
        label.backgroundColor = UIColor(red:0.0,green:0.5,blue:0.0,alpha:0.6)
        label.clipsToBounds = true;
        
        return label;
    }
    
    func createDemoButtonArray() -> [UIButton] {
        var buttons:[UIButton]=[]
        var i = 0
        for str in ["表情","图片","拍照","录音","手写"] {
            let button:UIButton = UIButton(type: UIButtonType.system)
            button.setTitleColor(UIColor.white, for: UIControlState())
            button.setTitle(str, for: UIControlState())
            
            button.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0);
            button.layer.cornerRadius = button.frame.size.height / 2.0;
            button.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 0.6)
            button.clipsToBounds = true;
            i += 1
            button.tag = i;
            button.addTarget(self, action: #selector(NewitemViewController.buttonTap(_:)), for: UIControlEvents.touchUpInside)
            
            buttons.append(button)
            
        }
        return buttons
        
    }
    
    func createButtonWithName(_ imageName:NSString) -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(named: imageName as String), for: UIControlState())
        button.sizeToFit()
        button.addTarget(self, action: #selector(NewitemViewController.buttonTap(_:)), for: UIControlEvents.touchUpInside)
        
        return button
        
    }
    
    @objc func buttonTap(_ sender:UIButton){
        
        print("Button tapped, tag:\(sender.tag)")
        if(sender.tag==1||sender.tag==2){
            if (sender.tag == 1) {isEmoji = true}
            else{isEmoji=false}
            // UIImagePickerController is a view controller that lets a user pick media from their photo library.
            let imagePickerController = UIImagePickerController()
            
            // Only allow photos to be picked, not taken.
            imagePickerController.sourceType = .photoLibrary
            
            // Make sure ViewController is notified when the user picks an image.
            imagePickerController.delegate = self
            
            
            present(imagePickerController, animated: true, completion: nil)
            
        }
        if(sender.tag==3){
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            let imagePickerController = UIImagePickerController()
            
            // Only allow photos to be picked, not taken.
            imagePickerController.sourceType = .camera
            
            // Make sure ViewController is notified when the user picks an image.
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: { () -> Void in})
            }
            else{
                print("找不到相机")
            }

        }
        if(sender.tag==4){
            var recordViewController = RecordViewController()
            recordViewController = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "recordView") as! RecordViewController
            self.present(recordViewController,animated: true,completion: nil)
        }
        
        if(sender.tag==5){
            var signViewController = SignViewController()
            signViewController = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "signView") as! SignViewController
            self.present(signViewController,animated:true,completion: nil)
        }
    }

}




//插入的图片附件的尺寸样式
enum ImageAttachmentMode {
    case `default`  //默认（不改变大小）
    case fitTextLine  //使尺寸适应行高
    case fitTextView  //使尺寸适应textView
}
