//
//  ViewController.swift
//  RelationalDeleteRule
//
//  Created by ankit bharti on 24/07/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let utility = Utility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //insert()
        delete()
    }
    
    private func insert() {
        let _runs = runs
        utility.addPlayer(name: "Ankit", runs: _runs)
        utility.addPlayer(name: "rohit", runs: _runs)
        utility.addPlayer(name: "garima", runs: _runs)
        utility.addPlayer(name: "kailash", runs: _runs)
        utility.addPlayer(name: "sumit", runs: _runs)

        let players = utility.fetch()
        printPlayers(players)
    }
    
    private func delete() {
        utility.deleteAllScores()
        print(utility.fetchScores().count)
        
        let players = utility.fetch()
        printPlayers(players)
    }
    
    func printPlayers(_ players: [Player]) {
        for player in  players {
            print(player.name, player.playersScore?.array.count)
            print("--------------------------------------")
        }
    }
    
    var runs: [Int32] {
        var values = [Int32]()
        for i in 0..<2_00_000 {
            values.append(Int32(i))
        }
        return values
    }
}

