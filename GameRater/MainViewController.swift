//
//  MainViewController.swift
//  GameRater
//
//  Created by Robert Fryman on 7/5/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITextFieldDelegate {
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var nGame : Game? = nil
 
    @IBOutlet weak var gameName: UITextField!
    @IBOutlet weak var gameType: UITextField!
    @IBOutlet weak var gameRating: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameName.delegate = self
        gameType.delegate = self
        gameRating.delegate = self
        
        if nGame != nil {
            gameName.text = nGame?.name
            gameType.text = nGame?.type
            gameRating.text = nGame?.rating
            
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        dismissVC()
    }
    
    @IBAction func saveTapped(sender: UIBarButtonItem) {
        if nGame != nil {
            editGame()
        } else {
            newGame()
        }
        dismissVC()
    }
    
    func dismissVC() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func newGame() {
        let context = self.context
        let ent = NSEntityDescription.entityForName("Game", inManagedObjectContext: context!)
        
        let nGame = Game(entity: ent!, insertIntoManagedObjectContext: context)
        
        nGame.name = gameName.text
        nGame.type = gameType.text
        nGame.rating = gameRating.text
        
        context?.save(nil)
        
    }
    
    func editGame() {
        nGame!.name = gameName.text
        nGame!.type = gameType.text
        nGame!.rating = gameRating.text
        
        context?.save(nil
        )
        
    }

}

