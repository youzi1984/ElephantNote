//
//  DictionaryTableViewController.swift
//  ElephantNote
//
//  Created by 鲁平凡 on 2017/12/11.
//  Copyright © 2017年 nju. All rights reserved.
//

import UIKit
import os.log

class DictionaryTableViewController: UITableViewController {

    var Words=[WordItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addnewword(newword: "word")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        Words=Dictionary.Words
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func RefreshBtnDown(_ sender: Any) {
        
        for word in Words{
            Dictionary.Words.append(word)
        }
        Words=Dictionary.Words
        tableView.reloadData()
    }
    
    @IBAction func exitToDictionary(sender: UIStoryboardSegue){
        
        if let nvc =  sender.source as? NewWordViewController, let word = nvc.WordTextField.text {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                if(nvc.WordisSave){
                    Words[selectedIndexPath.row].word = word
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
            }
            
           else if !word.isEmpty &&  nvc.WordisSave {
                let item = WordItem()
                
                item.word = word
                
                self.Words.append(item)
                self.tableView.reloadData()
                print(Words.count)
            }
            
        }
        
    }
    
   /*
    @IBAction func addFromNoteToDictionary(sender: UIStoryboardSegue){
        print("addFromNoteToDictionary")
        if let nvc =  sender.source as? NewitemViewController, let word = nvc.word?.word {
            
          //  if !word.isEmpty  {
                let item = WordItem(word: word)
                
                
                
                self.Words.append(item!)
                self.tableView.reloadData()
                print(Words.count)
            //}
            
        }
        
    }
*/
    /*
    func addnewword(newword:String){
        print("addnewword")
        let item = WordItem()
        self.Words.append(item!)
        //self.tableView.reloadData()
        print(Words.count)
    }
    */
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
        return self.Words.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        if let word = Words[indexPath.row].word{
            //cell.subtitleLabel.text=NoteBook[indexPath.row].title
            //  n=n+1
              cell.textLabel?.text=word
           // cell.subcontentLabel.text=content
        }
        // Configure the cell...

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
            var updateData = Words
            
            updateData.remove(at: indexPath.row)
            
            Words = updateData
            // Delete the row from the data source
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
    
        switch(segue.identifier ?? ""){
        case "AddWord":
            os_log("Adding a new word.",log: OSLog.default,type: .debug)
            
        case "ShowWordDetail":do {
            guard let NewWordViewController = segue.destination as? NewWordViewController else{
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedwordCell = sender as? UITableViewCell else{
                fatalError("Unexpected sender: \(String(describing:sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedwordCell) else{
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedWord = Words[indexPath.row]
            NewWordViewController.worditem = selectedWord
            
        }
        default:
            fatalError("Unexpected Segue")
        }
        
    }
    

}
