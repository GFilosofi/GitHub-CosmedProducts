//
//  ProductsTableViewController.swift
//  CosmedProducts
//
//  Created by Gabriele Filosofi on 23/01/16.
//  Copyright © 2016 Gabriele Filosofi. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()

        product1.name = "Spiropalm"
        product1.cellImage = "spiropalm_icon_172x172px"
        product1.productImage = "spiropalm_400x400px"

        product2.name = "Pony FX"
        product2.cellImage = "ponyfx_icon_172x172px"
        product2.productImage = "ponyfx_400x400px"

        product3.name = "Quark PFT"
        product3.cellImage = "pft_icon_172x172px"
        product3.productImage = "qpft_400x400px"

        product4.name = "K5"
        product4.cellImage = "k5_icon_172x172px"
        product4.productImage = "k5_400x400px"

        products = [product1, product2, product3, product4]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //here we have an example of indirect optional binding
        if let p = products {
            return p.count
        }
        return 0    //if products doesn't exist we need to a return 0 value
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)

        //let's assign to a constant product get out form the products array
        //by indexing the array with the row property of the indexPath of the current cell
        let product = products?[indexPath.row]
        
        //again, let's unwrap product using optional binding
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
        }
        
        return cell
    }
    
    //This method is called every time a transition (segue) has triggered by an action
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //check if the segue is the one we have defined in the Storyboard with the name ShowProduct
        if segue.identifier == "ShowProduct" {

            //let's define a copy of the ViewController we are transitioning to.
            //We also need to specify it is a ProductViewController type
            //We have to add a optional ? and this will make the productVC an optional too
            let productVC = segue.destinationViewController as? ProductViewController
            
            /*
            //let's recover the cell from we come from
            let cell = sender as? UITableViewCell
            //unwrap with optional bindind
            if let c = cell {
            let indexPath = tableView.indexPathForCell(c)   //warning this method returns an optional
            //unwrap with optional bindind
            if let ip = indexPath {
            let productName = productNames?[ip.row]
            productVC?.productName = productName
            }
            }
            */
            
            /*
            if let cell = sender as? UITableViewCell {
            if let indexPath = tableView.indexPathForCell(cell) {
            productVC?.productName = productNames?[indexPath.row]
            } else {
            return
            }
            }
            */

            //this code is more compact but does the same things of the two coding solutions above
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPathForCell(cell) else {
                    return
            }
            productVC?.product = products?[indexPath.row]

        }
    }
}