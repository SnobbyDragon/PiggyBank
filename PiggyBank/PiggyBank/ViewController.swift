//
//  ViewController.swift
//  PiggyBank
//
//  Created by Angela Li on 5/20/18.
//  Copyright © 2018 Angela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var PiggyBank: UILabel!
    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var TotalMoney: UILabel!
    @IBOutlet weak var SnobbyCommentary: UILabel!
    @IBOutlet weak var SnobbyImage: UIImageView!
    
    let money:[String] = ["Pennies", "Nickles", "Dimes", "Quarters"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(displayTotal(notification: )), name: NSNotification.Name(rawValue: "step"), object: nil)
        
        SnobbyCommentary.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return money.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.Coin.text = money[indexPath.row]
        cell.Amount.text = "0"
        return cell
    }
    
    @objc func displayTotal(notification: NSNotification) {
        let money = calculateTotal()
        TotalMoney.text = "Total: $" + String(format: "%.2f", money)
        if money < 100 {
            SnobbyCommentary.text = "Poor peasant."
        }
        else {
            SnobbyCommentary.text = "Snobby Dragon approves."
        }
    }
    
    func calculateTotal() -> Double {
        var total = 0.0
        let cells = Table.visibleCells
        let penny = cells[0] as! CustomCell
        if let p = Double(penny.Amount.text!) {
            total += p*0.01
        }
        let nickle = cells[1] as! CustomCell
        if let n = Double(nickle.Amount.text!) {
            total += n*0.05
        }
        let dime = cells[2] as! CustomCell
        if let d = Double(dime.Amount.text!) {
            total += d*0.1
        }
        let quarter = cells[3] as! CustomCell
        if let q = Double(quarter.Amount.text!) {
            total += q*0.25
        }
        return total
    }

}

