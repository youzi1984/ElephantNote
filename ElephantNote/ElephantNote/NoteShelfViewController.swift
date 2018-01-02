//
//  NoteShelfViewController.swift
//  ElephantNote
//
//  Created by Yuqi on 2017/12/26.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit

class NoteShelfViewController: UITableViewController {
    var n:Int=1
    var inputNoteName = UIAlertController()
    var notebookname = [UITextField]()
    var NoteBooks=[[NoteItem]]()
    var notenum:Int=1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    @IBAction func exitToNotebookshelf(sender: UIStoryboardSegue){
        
        if let nvc =  sender.source as? MainMenuTableViewController{
            
                //let item = MainMenuTableViewController(
            
            self.NoteBooks[notenum] = nvc.NoteBook
            self.tableView.reloadData()
            
        }
        
    }

    @IBAction func AddNotebook(_ sender: Any) {
        let alertController = UIAlertController(title: "输入笔记本名称", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "保存", style: .default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            
            
            print("firstName \(String(describing: firstTextField.text))")
            self.notebookname.append(firstTextField)
            print(self.notebookname.count)
            self.tableView.reloadData()
            self.NoteBooks.append([NoteItem]())
        })
        
        let cancelAction = UIAlertAction(title: "取消", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "notebook"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.notebookname.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteBookNameCell", for: indexPath)

        // Configure the cell...
        if let name = notebookname[indexPath.row].text{
            cell.textLabel?.text=name
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            var updateData = NoteBooks
            updateData.remove(at: indexPath.row)
            NoteBooks=updateData
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "ShowNoteDetail":
        guard let NewNoteViewController = segue.destination as? MainMenuTableViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selecteditemCell = sender as? UITableViewCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selecteditemCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        self.notenum = indexPath.row

        let selecteditem = NoteBooks[indexPath.row]
        
        NewNoteViewController.NoteBook = selecteditem
            

        //let selecteditem = NoteBook[indexPath.row]
        
        //NewitemViewController.noteitem = selecteditem
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
