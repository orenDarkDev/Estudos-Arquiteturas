//
//  File.swift
//  Arquiteturas
//
//  Created by Oren Pelosof on 20/06/23.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func register(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    func login(parameters: [AnyHashable: Any], completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserProvider: UserProviderProtocol {
    lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        var body: NSDictionary = parameters["body"] as! NSDictionary
        let userModel = body["userModel"] as! UserModel 
    }
    
    func register(parameters: [AnyHashable : Any], completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        <#code#>
    }
    
    
    
    
}
