//
//  Webservice.swift
//  TestandoTableview
//
//  Created by Edmilson vieira da silva on 22/03/20.
//  Copyright © 2020 Exatron. All rights reserved.
//

import Alamofire
import Realm
import RealmSwift
import SwiftyJSON

// em desenvolvimento......
class WebService: NSObject {

  /*  static let URL_WS: String = "https://apipersonagens.com.br/.../index.php/";

        let realm = try! Realm()

        
    
        

        
        func req(_ url : String, _ method: HTTPMethod, _ pObject : Object?, _ callback: @escaping (JSON) -> (), _ errorCallback: @escaping (String, String) -> (), _ param: [String: Any]? = nil, _ sendMaster: Bool = false, _ lastAddress: Int = 0)
        {
            
                let url_final: String = "\(WebService.URL_WS)\(url)"
                
                let token: String = "YXBwX215aG91c2U6ZXhhdHJvbl9teWhvdXNl"
                
                UserDefaults(suiteName: "group.com.br.exatron.myhouse")!.set("\(token)", forKey: "access_token")
                
                let headers : [String: String] = ["Content-Type": "application/json", "Authorization": "Basic \(token)"]
                
                print("\n\nURL: \(url_final)")

                var parameters: [String: Any] = [:];
                
               
            
                print("METHOD: \(method)")
                print("PARAMETROS: \(parameters)")
                print("HEADERS: \(headers)")
                
                var request: DataRequest!
                
                if(method != .get)
                {
                    request = Alamofire.request(url_final, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                }
                else
                {
                    request = Alamofire.request(url_final, method: method, parameters: nil, encoding: JSONEncoding.default, headers: headers)
                }
                
                debugPrint(request)

                request.responseJASON(
                    completionHandler: { response in
                        
                        print("RESPOSTA");
                        print(response)
                        print("\n\n")
                        //queue: self.queue, options: .allowFragments,
                        
                        if response.result.error != nil
                        {
                            DispatchQueue.main.async
                            {
                                if(UserDefaults.standard.object(forKey:"TENTATIVA") == nil)
                                {
                                    
                                    UserDefaults.standard.set("1", forKey: "TENTATIVA")
                                    
                                    self.req(url, method, pObject,
                                    {
                                        (retrn:JSON) -> Void in
                                        callback(retrn)
                                    },
                                    { _,_  in
                                        errorCallback("", "")
                                    })
                                    
                                }
                                else
                                {
                                    UserDefaults.standard.removeObject(forKey: "TENTATIVA")
                                    NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "notificationErrorHttp")))
                                    errorCallback("", "")
                                }
                            }
                            
                        }
                        else
                        {
                            switch response.result
                            {
                                case .success(let json):
                                    print("\(url_final) \nSuccess with JSON: \(json) \n\n\n")
                                
                                    if(json == nil || json == "null")
                                    {
                                        DispatchQueue.main.async
                                        {
                                            errorCallback("103", errorsHTTP["103"]!)
                                        }
                                        return;
                                    }
                                
                                    if let status = json["status"].string
                                    {
                                        if let msg = errorsHTTP[status]
                                        {
                                            DispatchQueue.main.async
                                            {
                                                print("ERROR MESSAGE: \(msg)");
                                                errorCallback(status, msg)
                                            }
                                            
                                        }
                                        else
                                        {
                                            DispatchQueue.main.async
                                            {
                                                callback(json)
                                            }
                                        }
                                        
                                    }
                                    else
                                    {
                                        DispatchQueue.main.async
                                        {
                                            callback(json)
                                        }
                                    }
                                
                                case .failure(let error):
                                    print("\(url_final) \nRequest failed with error: \(error) \n\n\n")
                                
                                    DispatchQueue.main.async
                                    {
                                        errorCallback("", "")
                                    }
                            }
                        }
                })
                
            }
            else
            {
                
                DispatchQueue.main.async
                {
                    errorCallback("", "")
                }
                
            }
            
        }
        
        func reqString(_ url : String, _ method: HTTPMethod, _ pObject : Object?, _ callback: @escaping (String) -> (), _ errorCallback: @escaping (String, String) -> (), _ param: [String: Any]? = nil, _ sendMaster: Bool = false)
        {
            
            if(check.isConnectedToNetwork()){
                
                let url_final: String = "\(WebService.URL_WS)\(url)"
                
                let token: String = "YXBwX215aG91c2U6ZXhhdHJvbl9teWhvdXNl"
                
                UserDefaults(suiteName: "group.com.br.exatron.myhouse")!.set("\(token)", forKey: "access_token")
                
                let headers : [String: String] = ["Content-Type": "application/json", "Authorization": "Basic \(token)"]
                
                print("\n\nURL: \(url_final)")
                
                var parameters: [String: Any] = [:];
                
                if let pobject = pObject {
                    
                    if(pobject.isKind(of: TbUser.self)){
                        let object: TbUser = pobject as! TbUser
                        parameters = object.getJsonServer(method)
                        
                    } else if(pobject.isKind(of: TbNetwork.self)){
                        let object: TbNetwork = pobject as! TbNetwork
                        try! self.realm.write {
                            object.dbVersion += 1;
                        }
                        parameters = object.getJsonServer(method, sendMaster)
                        
                    } else if(pobject.isKind(of: TbIhm.self)){
                        let object: TbIhm = pobject as! TbIhm
                        parameters = object.getJsonServer(method)
                        
                    }
                    
                }
                
                if let p = param {
                    parameters = p;
                }
                
                print("METHOD: \(method)")
                print("PARAMETROS: \(parameters)")
                print("HEADERS: \(headers)")
                
                var request: DataRequest!
                
                if(method != .get){
                    request = Alamofire.request(url_final, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                } else {
                    request = Alamofire.request(url_final, method: method, parameters: nil, encoding: JSONEncoding.default, headers: headers)
                }
                
                debugPrint(request)
                
                request.responseString(
                    completionHandler: { response in
                        
                        print("RESPOSTA");
                        print(response)
                        print("\n\n")
                        //queue: self.queue, options: .allowFragments,
                        
                        if response.result.error != nil {
                            
                            DispatchQueue.main.async {
                                
                                if(UserDefaults.standard.object(forKey:"TENTATIVA") == nil){
                                    
                                    UserDefaults.standard.set("1", forKey: "TENTATIVA")
                                    
                                    self.reqString(url, method, pObject, {(retrn:String) -> Void in
                                        callback(retrn)
                                    }, { _,_  in
                                        errorCallback("", "")
                                    })
                                    
                                } else {
                                    
                                    UserDefaults.standard.removeObject(forKey: "TENTATIVA")
                                    
                                    NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "notificationErrorHttp")))
                                    
                                    errorCallback("", "")
                                    
                                }
                                
                            }
                            
                        } else {
                            
                            switch response.result {
                            case .success(let json):
                                print("\(url_final) \nSuccess with String: \(json) \n\n\n")
                                
                                if(json == nil || json == "null"){
                                    DispatchQueue.main.async {
                                        errorCallback("103", errorsHTTP["103"]!)
                                    }
                                    return;
                                }
                                
                                DispatchQueue.main.async {
                                    callback(json)
                                }
                                
                            case .failure(let error):
                                print("\(url_final) \nRequest failed with error: \(error) \n\n\n")
                                
                                DispatchQueue.main.async {
                                    errorCallback("", "")
                                }
                            }
                            
                        }
                        
                })
                
            } else {
                
                DispatchQueue.main.async {
                    errorCallback("", "")
                }
                
            }
            
        } */
        
    }
