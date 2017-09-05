//
//  ProductViewController.swift
//  CosmedProducts
//
//  Created by Gabriele Filosofi on 23/01/16.
//  Copyright © 2016 Gabriele Filosofi. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    //the product that has to be passed by the segue prepared in the
    //ProductTableViewController we are coming from. It is optional because could be undefined
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView?.image = UIImage(named: i)
            }
        }
    }
    
    @IBAction func addToCartPressed(sender: AnyObject) -> Void {
        print("button has tapped")
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.google.com")!)
    }
}
