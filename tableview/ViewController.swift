//
//  ViewController.swift
//  tableview
//
//  Created by Диас Акберген on 13.08.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var TextView: UITextView!
    
    
    
    //var name = ""
    //var surname = ""
    //var imagename = ""
    
    var person = Person()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelName.text = person.name
        labelSurname.text = person.surname
        imageView.image = UIImage(named: person.imagename)
    }


}

