//
//  ViewController.swift
//  UserActivityTest
//
//  Created by Clifford Spencer on 12/14/18.
//  Copyright © 2018 Clifford Spencer. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func didTap(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Secondary")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        super.restoreUserActivityState(activity)
        print("restore")
    }
    
}

