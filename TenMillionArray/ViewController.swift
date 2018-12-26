//
//  ViewController.swift
//  TenMillionArray
//
//  Created by abuzeid on 12/25/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

let oneMillion = 1000000
struct User{
    let id:Int
    let name:String
    init(id:Int, name:String) {
        self.id = id
        self.name = name
    }
}
class ViewController: UIViewController {
    
    @IBOutlet weak var winnersLabel: UILabel!
    
    //    IMMutable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    func getGoldenUsers(from:Int)->[User]{
        var users = [User]()
        for _ in 0..<from {
            let randomNum:UInt32 = arc4random_uniform(UInt32(from)) // range is 0 to 99
            //Int.random(in: 3...1000000)
            users.append(User(id: Int(randomNum), name: random(100)))
        }
        return users
    }
    
    private func random(_ n: Int) -> String{
        let alphapetical = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        var randomString = ""
        for _ in 0..<n {
            let r = Int(arc4random_uniform(UInt32(alphapetical.count)))
            randomString += String(alphapetical[alphapetical.index(alphapetical.startIndex, offsetBy: r)])
        }
        return randomString
    }
    
    
    func selectRandomly(from:Int, callback:@escaping ((String)->Void)) {
        DispatchQueue.global().async { [weak self] in
            guard let `self` = self else {return}
            let result =  self.getGoldenUsers(from: from).map{$0.id * 2}.filter{$0 > 30}.map{ String($0)}.joined(separator: ",")
            callback(result)
        }
    }
    
    @IBAction func chooseAction(_ sender: Any) {
        
        selectRandomly(from: oneMillion, callback: {string in
            DispatchQueue.main.async {[weak self] in
                self?.winnersLabel.text = "Winners>>>\n \(string)"
                
            }
        })
        
        
    }
    
}

