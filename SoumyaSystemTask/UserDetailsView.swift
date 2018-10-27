//
//  UserDetailsView.swift
//  SoumyaSystemTask
//
//  Created by PASHA on 27/10/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class UserDetailsView: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var userTBV: UITableView!
  var userDetails = [String]()
  var user:UserDetails? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
      self.userTBV.delegate = self
      self.userTBV.dataSource = self
      self.navigationController?.navigationBar.isHidden = false
 
    //  let id = user?.id
      let username = user?.username
      let name = user?.name
     
      let email = user?.email
      let mobile = user?.phone
      let company = user?.company.name
      let street = user?.address.street
      let suite = user?.address.suite
       let city = user?.address.city
      let zipcode = user?.address.zipcode
      let lat = user?.address.geo.lat
      let long = user?.address.geo.lng
      self.userDetails = [username!,name!,city!,email!,mobile!,company!,suite!,street!,zipcode!,lat!,long!]
      print(self.userDetails.count)
      self.userTBV.reloadData()
        // Do any additional setup after loading the view.
    }
    
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.userDetails.count  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserDetailsCell
    
    cell.userLbl.text = "\(userDetails[indexPath.row])"
    return cell
    
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "UserDetails"
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
