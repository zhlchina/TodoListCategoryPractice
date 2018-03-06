//
//  CatTableViewController.swift
//  TodoListCategoryPractice
//
//  Created by HL on 2018-03-03.
//  Copyright © 2018 Haolinzhang. All rights reserved.
//

import UIKit
import CoreData

class CatTableViewController: UITableViewController {

    var categoryArray=[Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("View did load")
        let newCategory = Category(context: context)
         print("newCategory Declared")
        newCategory.title = "This is a new category \(arc4random_uniform(100))"
         print("newCategory Title Set")
//        categoryArray.append(newCategory)
//         print("New category appended to Category array")
        
        saveData()
        loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
         return categoryArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].title
        // Configure the cell...

        return cell
    }
    
    @IBAction func firstbuttonPressed(_ sender: UIButton) {
        print("button pressed")
//      context.delete(categoryArray[categoryArray.count-1])
        categoryArray[categoryArray.count-2].title="this this the 2nd last"
        for eachItem in categoryArray{
            context.delete(eachItem)
        }
        saveData()
        loadData()
    }
    
    
    //MARK: - Data manipulation
    func loadData(){
        let requst : NSFetchRequest<Category> = Category.fetchRequest()
        do {
             print("Load Data Get called")
            categoryArray = try context.fetch(requst)
            tableView.reloadData()
            print("data fetched")
        } catch{
            print(error)
        }
    }
    
    func saveData(){
        do {
             print("saveData get called")
            try context.save()
            print(context)
            tableView.reloadData()
            print("data saved")
        } catch {
            print("Saving Data error \(error)")
        }
       
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
