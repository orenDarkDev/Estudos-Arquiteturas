//
//  UserManager.swift
//  Arquiteturas
//
//  Created by Oren Pelosof on 03/07/23.
//

import Foundation


protocol UserManagerProtocol {
    func register(email: String, password: String,
                  successHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void)
    
    func login(email: String, password: String,
               successHandler: @escaping (UserModel) -> Void,
               failureHandler: @escaping (Error) -> Void)
}

class UserManager: UserManagerProtocol {
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
// or just - let business = UserBusinessProtocol()
    }
    
    func register(email: String,password: String,
                  successHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                successHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func login(email: String, password: String,
               successHandler: @escaping (UserModel) -> Void,
               failureHandler: @escaping (Error) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
            case .success(let userModel):
                successHandler(userModel)
                
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
}
