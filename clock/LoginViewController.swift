//
//  LoginViewController.swift
//  director
//
//  Created by Steven Lu on 1/2/15.
//  Copyright (c) 2015 Steven Lu. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var delegate: AppDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Login"

        var screenBounds = UIScreen.mainScreen().bounds;
        view.backgroundColor = UIColor.lightGrayColor();

        usernameTextField = UITextField(frame: CGRect(x: 20, y: 80, width: screenBounds.width-40, height: 48))
        usernameTextField.backgroundColor = UIColor.whiteColor()
        usernameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 25))
        usernameTextField.leftViewMode = UITextFieldViewMode.Always
        usernameTextField.placeholder = "Username"
        view.addSubview(usernameTextField)

        passwordTextField = UITextField(frame: CGRect(x: 20, y: 129, width: screenBounds.width-40, height: 48))
        passwordTextField.backgroundColor = UIColor.whiteColor()
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 25))
        passwordTextField.leftViewMode = UITextFieldViewMode.Always
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
        view.addSubview(passwordTextField)

        loginButton = UIButton(frame: CGRect(x: 20, y: 179, width: screenBounds.width-40, height: 48))
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        loginButton.backgroundColor = UIColor.primaryColor()
        loginButton.addTarget(self, action: Selector("loginButtonPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(loginButton)

        delegate = UIApplication.sharedApplication().delegate as? AppDelegate
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButtonPressed(sender:UIButton!) {
        login()
    }

    func successfulLogin() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        delegate?.loadApp()
    }

    func login() {
        Alamofire.request(
            Router.Login(usernameTextField.text, passwordTextField.text))
            .validate()
            .responseJSON { (request, response, data, error) in
                if (error != nil) {
                    var errorMessage:NSString? = data?.valueForKey("error") as NSString?
                    if (errorMessage == nil) {
                        errorMessage = "An unknown error has occured" as NSString;
                    }

                    var alertView = UIAlertView(title: "Error", message: errorMessage, delegate: nil, cancelButtonTitle: "Close");
                    alertView.show()
                    return;
                }

                if let token:NSString? = data?.valueForKey("token") as NSString? {
                    let authTokenKey = GenericKey(keyName: "authentication-token", value: token)
                    let keychain = Keychain()
                    keychain.add(authTokenKey)
                    self.successfulLogin()
                }
        }
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