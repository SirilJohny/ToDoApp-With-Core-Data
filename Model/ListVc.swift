//
//  ListVc.swift
//  ToDoApp
//
//  Created by DDUKK on 08/12/22.
//

import UIKit

class ListVc: UIViewController {
    let viewModel = ListViewModel()

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //table.reloadData()
        viewModel.fetchData()

    
    }
    func upadateTableView(){
    viewModel.fetchData()
    table.reloadData()
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        alartWithTextField(with: "AddItem",
                           message: "",
                           actionButtonTitle: "Add",
                           cancelButtonTitle: "Cancel",
                           placeholder: "Enter here"){
            text in
            if !text.isEmpty{
                self.viewModel.saveData(title: text)
                self.upadateTableView()
            }
            
        }
        
    }
    
}
extension ListVc:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   viewModel.listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell 
    }
}
extension ListVc:UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteData(index: indexPath.row)
            upadateTableView()
        }
    }
    
}
