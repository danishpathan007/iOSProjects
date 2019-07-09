//
//  DepartmentViewController.swift
//  EmployeeDetails
//
//  Created by Zap.Danish on 04/07/19.
//  Copyright © 2019 Gorilla App Development. All rights reserved.
//

import UIKit
import CoreData

class DepartmentViewController: UIViewController {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var departmentsList: [Department] = []
    var name:String?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSourceAndDelegates()
        departmentsList = Department.getAll() ?? [] // fetch all
    }
    
    @IBAction func addDepartmentButtonAction(_ sender: UIBarButtonItem) {
        showAlertWithTextField()
    }
    
    
    private func setDataSourceAndDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    
    private func showAlertWithTextField() {
        
        let alert = UIAlertController(title: "Department Title", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            
            if textField.text != "" {
                //Read TextFields text data
                print(textField.text!)
                self.name = textField.text!
            } else {
                print("TextField 1 is Empty...")
            }
            _ =  Department.setData(name: self.name, id: UUID().uuidString, employees: nil)
            self.departmentsList = Department.getAll() ?? []
            self.tableView.reloadData()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Please Enter Department name"
            textField.textColor = .red
        }
        alert.addAction(save)
        
        //Cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        self.present(alert, animated:true, completion: nil)
    }
    
    
    func  showEmployeeViewController(department:Department) {
    guard let employeeViewController =  storyboard?.instantiateViewController(withIdentifier:"EmployessViewController") as? EmployessViewController else { return }
    //addItemViewController.addItemViewModel = AddItemViewModel(list: list)
   // addItemViewController.updateTableDataDelegate = self
        employeeViewController.selectedDepartment = department
    navigationController?.pushViewController(employeeViewController, animated: true)
    
    }
}



extension DepartmentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension DepartmentViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departmentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:DepartmentTableCell = tableView.dequeueReusableCell(withIdentifier: "DepartmentTableCell") as! DepartmentTableCell
        cell.textLabel?.text = departmentsList[indexPath.row].name ?? ""
        return cell
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //================Delete Action==================
        let deleteAction =  UIContextualAction(style: .normal, title: nil, handler: { [weak self] (action,view,completionHandler ) in
            //Delete list here
                        if let id = self?.departmentsList[indexPath.row].id {
                            Department.delete(ids: [id])
                            self?.departmentsList = Department.getAll() ?? [] // fetch all
                            self?.tableView.reloadData()
                            completionHandler(true)
                        }
        })
        deleteAction.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        deleteAction.image =  UIGraphicsImageRenderer(size: CGSize(width: 20, height: 25)).image { _ in
            UIImage(named: "delete")?.draw(in: CGRect(x: 0, y: 0, width: 20, height: 25))
        }
       
        let confrigation = UISwipeActionsConfiguration(actions: [deleteAction])
        return confrigation
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        showEmployeeViewController(department:departmentsList[indexPath.row])
    }
    
    
}

