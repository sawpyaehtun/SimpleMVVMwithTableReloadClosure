//
//  ViewController.swift
//  SwiftMVVMProject
//
//  Created by SawPyaeHtun on 1/8/19.
//  Copyright © 2019 SawPyaeHtun. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var studentInfoTable: UITableView!
    
    let studentViewModel = StudentListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentInfoTable.register(UINib(nibName: String(describing: StudentInfoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: StudentInfoTableViewCell.self))
        
        studentViewModel.reloadStudentList = { [weak self] () in
            self?.studentInfoTable.reloadData()
        }
    }

    @IBAction func addDataButton(_ sender: Any) {
        if (nameTF.text?.count ?? 0 > 0) && (addressTF.text?.count ?? 0 > 0){
            studentViewModel.addStudentData(name: nameTF.text, address: addressTF.text)
            
            nameTF.text = ""
            addressTF.text = ""
            self.view.endEditing(true)
        }
        else{
            print("not Validate")
        }
    }
    
}

extension StudentListViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentViewModel.arrayOfStudent?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StudentInfoTableViewCell.self), for: indexPath) as? StudentInfoTableViewCell else{return UITableViewCell()}
        cell.student = studentViewModel.arrayOfStudent![indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
