//
//  secondViewController.swift
//  AppSwift
//
//  Created by Jaime on 15/6/18.
//  Copyright © 2018 Jaime. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class secondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var students: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStudents(){ (value) in
            self.students = value
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setStudents(completion:@escaping ([String]) -> Void) {
        var arrayStudents: [String] = []
        
        let apiToContact = "https://randomuser.me/api/?results=20"
        Alamofire.request(apiToContact, method: .get).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let users = json["results"].arrayValue
                    
                    for i in 0...(users.endIndex - 1) {
                        let userName = users[i]["name"]["first"].stringValue + " " + users[i]["name"]["last"].stringValue
                        arrayStudents.append(userName)
                    }
                    
                    completion(arrayStudents)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = students[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return students.count
    }
}
