//
//  ContactViewController.swift
//  CosmedProducts
//
//  Created by Gabriele Filosofi on 23/01/16.
//  Copyright © 2016 Gabriele Filosofi. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //the regular frame height for iPhone6 is 667. With this instruction we allow to scroll upt o 820
        scrollView.contentSize = CGSizeMake(375,820)
    }
    
    @IBAction func mailtoPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "mailto://gabrielef@cosmed.it")!)
    }

    @IBAction func phonePressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://+39069315492")!)
    }

    @IBAction func websitePressed(sender: AnyObject) {
        /* objective-c
        NSString *urlString = @"http://www.cosmed.com";
        [[UIApplication sharedApplication()] openURL:[NSURL URLWithString:urlString]];
        */
        let urlString = "http://www.cosmed.com"
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }
}
