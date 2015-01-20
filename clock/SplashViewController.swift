//
//  SplashViewController.swift
//  director
//
//  Created by Steven Lu on 1/3/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var loginButton: UIButton!
    var loginView: LoginViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        var screenBounds = UIScreen.mainScreen().bounds;
        view.backgroundColor = UIColor.lightGrayColor();

//        var image = UIImage(named: "director.png")
//        var imageView = UIImageView(frame: CGRect(x: 40, y: 60, width: screenBounds.width-80, height: 240))
//        imageView.image = image
//        imageView.opaque = false
//        imageView.contentMode = UIViewContentMode.ScaleAspectFit;
//        view.addSubview(imageView)

        loginButton = UIButton(frame: CGRect(x: 20, y: 320, width: screenBounds.width-40, height: 48))
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        loginButton.backgroundColor = UIColor.primaryColor()
        loginButton.addTarget(self, action: Selector("loginButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(loginButton)

        loginView = LoginViewController()
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }

    func loginButtonPressed(sender:UIButton!) {
        openLoginView()
    }

    func openLoginView() {
        self.navigationController?.pushViewController(self.loginView, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}