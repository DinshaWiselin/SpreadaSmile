//
//  FirebaseAuthService.swift
//  SpreadaSmile
//
//  Created by Dinsha Wiselin Christudhas on 27.06.23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService:ObservableObject{
    var user : User?{
        didSet{
            objectWillChange.send()
        }
    }
    func signUp(emailAdress:String,password:String){
        Auth.auth().createUser(withEmail: emailAdress, password: password){result,error in
            if let error=error{
                print("can create User\(error.localizedDescription)")
                return
            }
        }
    }
        
        func listentoAuthState(){
            Auth.auth().addStateDidChangeListener{_, user in
                self.user = user
            }
    }
    func signIn(emailAdress:String,password:String){
                Auth.auth().signIn(withEmail: emailAdress, password: password){result,error in
                    if let error=error{
                        print("can create User\(error.localizedDescription)")
                        return
                    }
                }
            }
    func signOut(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
}
