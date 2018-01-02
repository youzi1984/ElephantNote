//
//  MainMenuTableViewController.swift
//  ElephantNote
//
//  Created by ShenXiao Yu on 2017/12/10.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit
import os.log
class MainMenuTableViewController: UITableViewController {
    var n:Int=1
   // @IBOutlet weak var subtitleTextField: UILabel!
    
   // @IBOutlet weak var subcontentTextField: UILabel!
    
    var NoteBook=[NoteItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        print("NoteBook.count")
        print(NoteBook.count)
    }

    @IBAction func exitToMainMenu(sender: UIStoryboardSegue){
        
        if let nvc =  sender.source as? NewitemViewController, let content = nvc.contentTextField.text,let title=nvc.titleTextField.text {
           
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                if(nvc.isSave){
                // Update an existing meal.
                NoteBook[selectedIndexPath.row].title = title
                NoteBook[selectedIndexPath.row].content = content
                    NoteBook[selectedIndexPath.row].photo = nvc.phototosave
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
            }
            else if !content.isEmpty &&  nvc.isSave {
                let item = NoteItem()
                
                item.content = content
                item.title = title
                item.photo = nvc.phototosave
                self.NoteBook.append(item)
                self.tableView.reloadData()
            }
            
        }
 
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
        return self.NoteBook.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {
            fatalError(" ")
        }

        // Configure the cell...
        
        if let content = NoteBook[indexPath.row].content{
            cell.subtitleLabel.text=NoteBook[indexPath.row].title
          //  n=n+1
            //  cell.textLabel?.text=content
            cell.subcontentLabel.text=content
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

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
            
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "addAlarm":
            os_log("Adding a new alarm.", log: OSLog.default, type: .debug)
        case "exittonoteshelf":
            os_log("Exittonoteshelf.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let NewitemViewController = segue.destination as? NewitemViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selecteditemCell = sender as? UITableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selecteditemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selecteditem = NoteBook[indexPath.row]
            
            NewitemViewController.noteitem = selecteditem
            
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
 

}
