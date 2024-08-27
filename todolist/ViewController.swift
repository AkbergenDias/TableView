//
//  ViewController.swift
//  todolist
//
//  Created by Диас Акберген on 26.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskname = textfield.text
        
        var newTask = TaskItem()
        
        newTask.name = taskname!
        
        do {
            if let data = defaults.data(forKey: "taskItemArray") {
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                array.append(newTask)
                
                let encodedData = try JSONEncoder().encode(array)
                defaults.set(encodedData, forKey: "taskItemArray")
            } else {
                let encodedData = try JSONEncoder().encode([newTask])
                defaults.set(encodedData, forKey: "taskItemArray")
            }
        } catch {
            print("Unable to encode \(error)")
        }
        
//        if let array = defaults.array(forKey: "TaskItemArray") {
//            taskarray = array as! [TaskItem]
//            
//            taskarray.append(newTask)
//            
//            defaults.set(taskarray, forKey: "taskItemArray")
//
//        } else {
//            let array = [newTask]
//            
//            defaults.set(array, forKey: "taskItemArray")
//        }
        
        
//        var taskarray:[String] = []
//        
//        if let array = defaults.array(forKey: "taskArray") {
//            taskarray = array as! [String]
//            
//            taskarray.append(taskname!)
//            
//            defaults.set(taskarray, forKey: "taskArray")
//            
//        } else {
//            let array = [taskname]
//            
//            defaults.set(array, forKey: "taskArray")
//        }
        
        textfield.text = ""
    }
}

