//
//  ViewController.swift
//  AboutMeApp
//
//  Created by 90301422 on 9/12/18.
//  Copyright © 2018 Nico D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var photo: UIImageView!
    
    @IBAction func moonButton(_ sender: UIButton) {
        photo.image = #imageLiteral(resourceName: "moon")
    }
    @IBAction func bookButton(_ sender: UIButton) {
        photo.image = #imageLiteral(resourceName: "book") }
    
    @IBAction func lizardButton(_ sender: UIButton) {  photo.image = #imageLiteral(resourceName: "lizard")}
    
    @IBAction func planeButton(_ sender: UIButton) {
        photo.image = #imageLiteral(resourceName: "plane")}
        
    
    
    
    }



