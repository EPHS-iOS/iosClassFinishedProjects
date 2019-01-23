//
//  CustomNavigationController.swift
//  GPSApp
//
//  Created by 90301422 on 1/12/19.
//  Copyright © 2019 Nico D. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }
   
}
