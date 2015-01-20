//
//  AppViewController.swift
//  clock
//
//  Created by Steven Lu on 1/19/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit

class AppViewController: UIViewController, KPTimePickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNeedsStatusBarAppearanceUpdate()

//        [self.navigationController.navigationBar setTranslucent:YES];
//        self.navigationController.navigationBar.shadowImage = [UIImage new];
//        self.navigationController.view.backgroundColor = [UIColor clearColor];
//        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage();
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()

        var timePicker = KPTimePicker(frame: self.view.bounds)
        timePicker.delegate = self
        self.view.addSubview(timePicker)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    func timePicker(timePicker: KPTimePicker!, selectedDate date: NSDate!) {
        return
    }

    func timePicker(timePicker: KPTimePicker!, titleForDate time: NSDate!) -> String! {
        return "Set alarm to"
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
