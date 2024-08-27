//
//  TableViewController.swift
//  tableview
//
//  Created by Диас Акберген on 15.08.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    @IBOutlet var Logo: [UIImageView]!
    
    
    
    
    
    @IBAction func BuyButtonTouch(_ sender: UIButton) {
        let phoneNumber = "77088225790"
        let urlString = "https://wa.me/\(phoneNumber)"
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open WhatsApp")
            }
        }
    }
    //let array = [1, 2, 3, 4, 5]
    
    //var arrayNames = ["Rick", "Vlad", "Michael", "Tyrone", "Chad"]
    //var arraySurname = ["Owens", "Cepesh", "Jackson", "Lebron", "Chaduly" ]
    //var arrayImage = ["rick", "vlad", "michael", "tyrone", "chad"]
    
    var arrayPersons = [Person(name: "Rick", surname: "Owens", imagename: "rick"), Person(name: "Chico", surname: "Lachowski", imagename: "Chico"),Person(name: "Michael", surname: "Jackson", imagename: "michael"),Person(name: "Sean", surname: "O'Pry", imagename: "Sean"),Person(name: "Raf", surname: "Simons", imagename: "Raf"),]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func addPerson(_ sender: Any) {
        //arrayNames.append("New name")
        //arraySurname.append("New Surname")
        //arrayImage.append("chad")
        arrayPersons.append(Person(name: "New name", surname: "New Surname", imagename: "chad"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        let labelSurname = cell.viewWithTag(1001) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname
        
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: arrayPersons[indexPath.row].imagename)

        // Identify the button and set up its action
        if let button = cell.viewWithTag(1003) as? UIButton {
                button.addTarget(self, action: #selector(BuyButtonTouch(_:)), for: .touchUpInside)
                button.tag = indexPath.row  // Set the button's tag to the row index for identification
            } else {
                print("Button with tag 1003 not found in cell")
            }

        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(identifier: "detailViewController") as!ViewController
        
        
        
        //detailVc.name = arrayPersons[indexPath.row].name
        //detailVc.surname = arrayPersons[indexPath.row].surname
        //detailVc.imagename = arrayPersons[indexPath.row].imagename
        
        detailVc.person = arrayPersons[indexPath.row]
        
        navigationController?.show(detailVc, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //arrayNames.remove(at: indexPath.row)
            //arraySurname.remove(at: indexPath.row)
            //arrayImage.remove(at: indexPath.row)
            arrayPersons.remove(at: indexPath.row)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
