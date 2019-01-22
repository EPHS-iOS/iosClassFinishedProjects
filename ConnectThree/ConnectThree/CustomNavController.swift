//
//  CustomNavController.swift
//  ConnectThree
//
//  Created by 90301422 on 9/25/18.
//  Copyright © 2018 Nico D. All rights reserved.
//

import UIKit

class CustomNavController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        
    }
    

    /*
    // MARK: - Navigation
     ViewController a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
