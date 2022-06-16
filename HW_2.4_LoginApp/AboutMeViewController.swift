//
//  AboutMeViewController.swift
//  HW_2.4_LoginApp
//
//  Created by Vitaly Zubenko on 13.05.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
        //записывает Имя и Фамилию в навигейшн бар
    }
    
}
