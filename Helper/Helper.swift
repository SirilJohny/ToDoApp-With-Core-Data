//
//  Helper.swift
//  ToDoApp
//
//  Created by DDUKK on 08/12/22.
//

import Foundation
import UIKit
extension UIViewController{
    func alartWithTextField(with title:String,
                            message:String,
                            actionButtonTitle:String,
                            cancelButtonTitle:String,
                            placeholder:String,
                            completion:@escaping(String)->()){
        let alartController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alartController.addTextField{
            textField in textField.placeholder = placeholder
        }
        let actionButton = UIAlertAction(title: actionButtonTitle, style: .default){
            action in completion(alartController.textFields?[0].text ?? "")
        }
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel,handler:nil)
        alartController.addAction(actionButton)
        alartController.addAction(cancelButton)
        present(alartController, animated: true,completion: nil)
    }
}
