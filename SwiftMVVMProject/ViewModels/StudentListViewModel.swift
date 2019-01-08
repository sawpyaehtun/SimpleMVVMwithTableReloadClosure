//
//  StudentListViewModel.swift
//  SwiftMVVMProject
//
//  Created by SawPyaeHtun on 1/8/19.
//  Copyright © 2019 SawPyaeHtun. All rights reserved.
//

import Foundation
class StudentListViewModel {
    //This is ViewModel class of studentListViewController
    
    var reloadStudentList = { () -> () in }
    var arrayOfStudent : [Student]? = []{
        didSet{
            reloadStudentList()
        }
    }
    
    // like this function will fetch data using the class from Provider
    func addStudentData(name : String?, address : String?) {
        arrayOfStudent?.append(Student(name: name, address: address))
    }
    
}
