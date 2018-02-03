//
//  TableViewController.swift
//  pars
//
//  Created by Ян on 02.12.2017.
//  Copyright © 2017 Yan. All rights reserved.
//

import Foundation

import UIKit
struct pars: Decodable {
    var user: Data!
}


struct Data: Decodable {
    var name: String
    var lastName: String
    var email: String
    var product : String
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://localhost/parsing/document.json"
        guard let url = URL (string: urlString ) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            guard error == nil else {
                return
            }
            
            do{
                let parsing = try JSONDecoder().decode (pars.self, from: data)
                print(parsing)
            }catch let error{
                print(error)
            }
            
            }.resume()
    }
}

