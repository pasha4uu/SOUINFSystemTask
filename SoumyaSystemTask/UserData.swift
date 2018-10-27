//
//  UserData.swift
//  SoumyaSystemTask
//
//  Created by PASHA on 28/10/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import Foundation

struct UserData:Codable {
  var id :Int
  var name :String
  var username:String
  var email:String
  var address:Address
  var phone:String
  var website:String
  var company:Company
}
struct Address:Codable {
  var street: String
  var suite : String
  var city: String
  var zipcode : String
  var geo: Geo
}
struct Geo:Codable {
  var lat: String
  var lng : String
}
struct Company:Codable {
  var name: String
  var catchPhrase : String
  var bs: String
}
