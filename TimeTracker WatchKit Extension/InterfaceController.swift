//
//  InterfaceController.swift
//  TimeTracker WatchKit Extension
//
//  Created by Kızılay on 28.11.2018.
//  Copyright © 2018 RozeriDilar. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //MARK: Outlets
    
    @IBOutlet var topLabel: WKInterfaceLabel!
    @IBOutlet var middleLabel: WKInterfaceLabel!
    @IBOutlet var clockInOutButton: WKInterfaceButton!
    
    //MARK: Variables
    var clockedIn = false
    
    //MARK: Actions
    @IBAction func clockInOutTapped() {
        if(clockedIn){
            clockOut()
        }else{
            clockIn()
        }
        updateUI(clockedIn: clockedIn)
    }
    
    func updateUI(clockedIn: Bool){
        if(clockedIn){
            //The UI for someone is clocked in
            topLabel.setHidden(false)
            middleLabel.setText("3h 14m")
            clockInOutButton.setTitle("Clock-In")
            clockInOutButton.setBackgroundColor(UIColor.red)
        }else{
            //The UI for someone is clocked out
            topLabel.setHidden(true)
            middleLabel.setText("Today\n3h 14m")
            clockInOutButton.setTitle("Clock-Out")
            clockInOutButton.setBackgroundColor(UIColor.green)
        }
        
        
    }
    
    func clockIn(){
        self.clockedIn = !clockedIn
        UserDefaults.standard.set(Date(), forKey: "clockedIn")
        UserDefaults.standard.synchronize()
    }
    
    func clockOut(){
        self.clockedIn = !clockedIn
        if let clockedInDate = UserDefaults.standard.object(forKey: "clockedIn") as? Date {
            print(clockedInDate)
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        updateUI(clockedIn: clockedIn)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
