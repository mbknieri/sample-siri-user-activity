//
//  SecondViewController.swift
//  UserActivityTest
//
//  Created by Clifford Spencer on 12/14/18.
//  Copyright © 2018 Clifford Spencer. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices
import Intents
import IntentsUI

class SecondaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity = addUserActivity("com.spiffcleanser.activitytest.test-user-activity2")
        userActivity = activity
        
        let addToSiriButton = INUIAddVoiceShortcutButton(style: .blackOutline)
        addToSiriButton.translatesAutoresizingMaskIntoConstraints = false
        
        addToSiriButton.addTarget(self, action: #selector(addToSiri(_:)), for: .touchUpInside)
        
        view.addSubview(addToSiriButton)
        
        NSLayoutConstraint.activate([
            addToSiriButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addToSiriButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // com.spiffcleanser.activitytest.test-user-activity
    func addUserActivity(_ type: String) -> NSUserActivity {
        let userActivity = NSUserActivity(activityType: type)
        userActivity.isEligibleForSearch = true
        userActivity.isEligibleForPrediction = true
        userActivity.title = "TestActivity"
        userActivity.userInfo = ["key": "our value"]
        userActivity.suggestedInvocationPhrase = "Wayfair Activity"
        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        userActivity.contentAttributeSet = attributes
        return userActivity
    }
    
    @objc func addToSiri(_ sender: Any) {
        if let activity = userActivity{
            let shortcut = INShortcut(userActivity: activity)
            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            viewController.modalPresentationStyle = .formSheet
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
    }
}

extension SecondaryViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        print("Finished!!!")
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        print("Canceled")
        controller.dismiss(animated: true, completion: nil)
    }
}
