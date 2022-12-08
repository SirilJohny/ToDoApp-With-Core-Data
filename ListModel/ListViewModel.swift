//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by DDUKK on 08/12/22.
//

import Foundation
class ListViewModel{
    var listArray = [List]()
    let coreDataHelper = CoreDataHelper()
    func fetchData(){
        listArray = coreDataHelper.fetchData() ?? [List]()
        
    }
    func saveData(title:String){
        coreDataHelper.saveData(title:title)
        
        
    }
    func deleteData(index:Int ){
        coreDataHelper.deleteData(index:index)
        
    }
    
}
