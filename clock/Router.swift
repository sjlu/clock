//
//  Router.swift
//  clock
//
//  Created by Steven Lu on 10/1/14.
//  Copyright (c) 2014 Steven Lu. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "http://hub.atomicdevices.co"
//    static let baseURLString = "http://localhost:3000"

    case Login(String, String)
    case SetAlarm(String)

    var method: Alamofire.Method {
        switch self {
        case .Login: return .POST
        case .SetAlarm: return .PUT
        default: return .GET
        }
    }

    var path: String {
        switch self {
        case .Login: return "/login/token"
        case .SetAlarm: return "/api/users/me/alarm"
        default: return ""
        }
    }

    // MARK: URLRequestConvertible

    var URLRequest: NSURLRequest {
        let urlString = Router.baseURLString + self.path;
        let URL = NSURL(string: urlString)
        let mutableURLRequest = NSMutableURLRequest(URL: URL!)
        mutableURLRequest.HTTPMethod = method.rawValue

        let authTokenKey = GenericKey(keyName: "authentication-token")
        let keychain = Keychain()
        if let authToken = keychain.get(authTokenKey).item?.value {
            let authTokenString = authToken.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            mutableURLRequest.setValue("\(authTokenString!)", forHTTPHeaderField: "authentication-token")
        }

        switch self {
        case .Login(let username, let password):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: ["username":username, "password":password]).0
        case .SetAlarm(let timeString):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: ["alarm": timeString]).0
        default:
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        }
    }
}