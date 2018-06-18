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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = students[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return students.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let apiToContact = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        // This code will call the iTunes top 25 movies endpoint listed above
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
        students = [ "Alex Benavides", "Alberto Lopez", "David Eugenio Prados", "Alejandro Contreras", "Guillermo Nuez", "Jaime Gallardo", "Carlos Calado", "Juan Manuel Garrido", "Maikel Ramos", "Daniel Antonio Garcia"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
