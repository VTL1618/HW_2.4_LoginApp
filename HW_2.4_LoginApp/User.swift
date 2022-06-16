//
//  User.swift
//  HW_2.4_LoginApp
//
//  Created by Vitaly Zubenko on 14.05.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "User",
             password: "Password",
             person: Person(name: "Vitaly", surname: "Zubenko")
        )
    }
}

//чтобы отображать на следующем экране
struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
