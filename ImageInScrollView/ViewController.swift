//
//  ViewController.swift
//  ImageInScrollView
//
//  Created by julien@macmini on 19/09/2017.
//  Copyright © 2017 jbloit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    Shows how to rescale and scroll vertically a larger image than the scroll view.
    The important part is setting the scrollview's contentsize and setting the right contentMode for the imageView.
     */


    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView!
    var imageRatio: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "partners1")
        imageView.backgroundColor = .orange // just for debugging
        imageRatio = #imageLiteral(resourceName: "partners1").size.width / #imageLiteral(resourceName: "partners1").size.height
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        // This part needs to happen after the constraints have been applied (to get scrollview's dimensions)
        imageView.frame = CGRect(x:0, y:0, width: scrollView.frame.width, height:  scrollView.frame.width / imageRatio )
        scrollView.contentSize = imageView.frame.size
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

