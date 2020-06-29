//
//  ViewController.swift
//  ios-cw5-p2
//
//  Created by Waleed Albahar on 6/27/20.
//  Copyright © 2020 Waleed Albahar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    
    // x % 2 == 0 -> زوجي
    // x % 2 == 1 -> فردي
    var counter = 0
    
    @IBAction func tap(_ sender: UIButton) {
        
        print(sender.tag)
        print(counter)
        if counter % 2 == 0{
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.black, for: .normal)
            turnLabel.text = "O Turn"
        }
        else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            turnLabel.text = "X Turn"
            
        }
        counter += 1
        sender.isEnabled = false
        
        Winning(winner: "X")
        Winning(winner: "O")
        
        
    }
    
    @IBAction func resetTapped() {
        self.restartGame()
    }
    func Winning(winner: String)
    {
        let r1 = b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner
        let r2 = b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner
        let r3 = b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner
        let c1 = b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner
        let c2 = b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner
        let c3 = b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner
        let d1 = b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner
        let d2 = b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner
        // X winning
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
        {
            print("\(winner) الفائز" )
            //1.اصنع alert
            // 2. اصنع alertAction(الزر بداخل التنبيه)
            //3. أضف الalertAction بداخل الAlert
            //4. أظهر ال Alert
            okAlert(title: winner,message: "مبروك\(winner)")
        }
        else  if counter == 9 {
             okAlert(title: "تعادل", message: "إعادة اللعب")
        }
    }
    
    
    
    
    
    func restartGame()
    {
        b1.setTitle("", for: .normal)
        b1.titleLabel?.text = ""
        b1.isEnabled = true
        
        b2.setTitle("", for: .normal)
        b2.titleLabel?.text = ""
        b2.isEnabled = true
        
        b3.setTitle("", for: .normal)
        b3.titleLabel?.text = ""
        b3.isEnabled = true
        
        b4.setTitle("", for: .normal)
        b4.titleLabel?.text = ""
        b4.isEnabled = true
        
        b5.setTitle("", for: .normal)
        b5.titleLabel?.text = ""
        b5.isEnabled = true
        
        b6.setTitle("", for: .normal)
        b6.titleLabel?.text = ""
        b6.isEnabled = true
        
        b7.setTitle("", for: .normal)
        b7.titleLabel?.text = ""
        b7.isEnabled = true
        
        b8.setTitle("", for: .normal)
        b8.titleLabel?.text = ""
        b8.isEnabled = true
        
        b9.setTitle("", for: .normal)
        b9.titleLabel?.text = ""
        b9.isEnabled = true
        
        
        
        counter = 0
        turnLabel.text = "X turn"
        
    }
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
