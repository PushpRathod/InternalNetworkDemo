 //
//  DetailViewController.swift
//  InternalModelDemo
//
//  Created by pushp on 3/20/18.
//  Copyright © 2018 pushp. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

     weak var detailDescriptionLabel: MainModel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
             print(detailItem?.id!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: MainModel? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

