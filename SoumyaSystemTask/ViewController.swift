//
//  ViewController.swift
//  SoumyaSystemTask
//
//  Created by PASHA on 27/10/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

//struct User:Codable {
//  var user: [UserDetails]
//}
//struct UserDetails:Codable {
//  var id :Int
//  var name :String
//  var username:String
//  var email:String
//  var address:Address
//  var phone:String
//  var website:String
//  var company:Company
//}
//struct Address:Codable {
//  var street: String
//  var suite : String
//  var city: String
//  var zipcode : String
//  var geo: Geo
//}
//struct Geo:Codable {
//  var lat: String
//  var lng : String
//}
//struct Company:Codable {
//  var name: String
//  var catchPhrase : String
//  var bs: String
//}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var TBV: UITableView!
  
  var namesArr = [String]()
  var userDetails = [UserData]()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let aa = [ UserData(id: 1, name: "pasha", username: "pasha12", email: "pasha123@gmail.com", address:Address(street: "nagar", suite: "psa", city: "wgl", zipcode: "506310", geo: Geo(lat: "71.43", lng: "73.938")), phone: "9909090909", website: "www.ps.com", company: Company(name: "inc", catchPhrase: "peo 39438492 cb", bs: "9389284")),UserData(id: 2, name: "pasha", username: "pasha12", email: "pasha123@gmail.com", address:Address(street: "nagar", suite: "psa", city: "wgl", zipcode: "506310", geo: Geo(lat: "71.43", lng: "73.938")), phone: "9909090909", website: "www.ps.com", company: Company(name: "inc", catchPhrase: "peo 39438492 cb", bs: "9389284")),UserData(id: 3, name: "pasha", username: "pasha12", email: "pasha123@gmail.com", address:Address(street: "nagar", suite: "psa", city: "wgl", zipcode: "506310", geo: Geo(lat: "71.43", lng: "73.938")), phone: "9909090909", website: "www.ps.com", company: Company(name: "inc", catchPhrase: "peo 39438492 cb", bs: "9389284")),UserData(id: 4, name: "pasha", username: "pasha12", email: "pasha123@gmail.com", address:Address(street: "nagar", suite: "psa", city: "wgl", zipcode: "506310", geo: Geo(lat: "71.43", lng: "73.938")), phone: "9909090909", website: "www.ps.com", company: Company(name: "inc", catchPhrase: "peo 39438492 cb", bs: "9389284"))]
    
    let db = try! JSONEncoder().encode(aa)
    JSONEncoder().outputFormatting = .prettyPrinted
    let sc = String(bytes: db, encoding: .utf8)
    let ds = try! JSONDecoder().decode([UserData].self, from: db)
    let bb = ds[3].id
    
 //   let b = ds.user
    
   print("name is : \(sc!)")
      getJsonData()
//    let jsonEncode = try! JSONEncoder().encode(aa)
//    let aas = String(bytes: jsonEncode, encoding: .utf8)
//    print(aas.)
    self.TBV.delegate = self
    self.TBV.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.userDetails.count  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
   
    cell?.textLabel?.text = "\(userDetails[indexPath.row].name)"
    return cell!
    
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let user = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsView") as! UserDetailsView
    user.user = self.userDetails[indexPath.row]
    self.navigationController?.pushViewController(user, animated: true)
  }
  
  func getJsonData() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
     let request = URLRequest(url: url)
  
    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in
    
      
      let db = String(bytes: data!, encoding: .utf8)
      let sd = db?.data(using: .utf8)
      
     
        do {
          self.userDetails = try JSONDecoder().decode([UserData].self, from: sd!)
 
        //  let b = ds[3].address.geo.lat
          
          print("name is : \(self.userDetails.count)")
          DispatchQueue.main.async {
             self.TBV.reloadData()
          }
         
        }
        catch
        {
          print("\(error.localizedDescription)")
        }
        
        
//        let userData = try! JSONSerialization.jsonObject(with: dataS, options: .mutableContainers)
//      guard let userArr = userData as? [Any] else { return}
//
//          for user in userArr {
//
//            guard let userDict = user as? [String: Any] else { return }
//
//            guard let company = userDict["company"] as? [String: Any] else { return }
//
//            guard let bs = company["bs"] as? String else { return }
//
//            guard let id = userDict["id"] as? Int else { return }
//            guard let name = userDict["name"] as? String else { return }
//            guard let website = userDict["website"] as? String else { return }
//            guard let address = userDict["address"] as? [String:Any] else { return }
//            guard let city = address["city"] as? String else { return }
//            guard let zipcode = address["zipcode"] as? String else { return }
//            guard let geo = address["geo"] as? [String:String] else { return }
//            guard let lat = geo["lat"] else { return }
//            guard let lng = geo["lng"] else { return }
//            print("\n ID : \(id) " + "\n Name : \(name)" + "\n website : \(website)" + "\n bs is : \(bs) " + "\n city is : \(city) " +  "\n zipcode :\(zipcode)"  + "\n latitude is : \(lat) " +  "\n longitude :\(lng)")
//
//      }

    }
    task.resume()
  }
  
}

