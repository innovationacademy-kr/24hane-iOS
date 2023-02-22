//
//  SignInWebView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/20/23.
//

import SwiftUI
import WebKit
import Foundation

struct SignInWebView: UIViewRepresentable {
    @EnvironmentObject var hane: Hane
    
    var url: URL {
        let path = "/user/login/42?redirect=42"
//        /// 강제 unwrapping...?
        let retURL = URL(string: "\(hane.APIroot)\(path)")!
        return retURL
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self, hane: hane)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context){
    }
    
    class WebViewCoordinator: NSObject, WKNavigationDelegate {
        var parent: SignInWebView
        var hane: Hane
        
        init(_ parent: SignInWebView, hane: Hane){
            self.parent = parent
            self.hane = hane
            super.init()
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("load web view")
           // hane.status = .webViewLoding
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("finished load")
            //hane.status = .webViewAppear
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
            let urlToMatch =  "/user/login/callback/42"
            
            if  let urlStr = navigationAction.request.url?.path, urlStr == urlToMatch {
                print("before cookie")
                WKWebsiteDataStore.default().httpCookieStore.getAllCookies{ (cookies) in
                    for cookie in cookies{
                        if cookie.name == "accessToken"{
                            UserDefaults.standard.setValue(String(cookie.value), forKey: "Token")
                            self.hane.status = .afterSignIn
                            break
                        }
                    }
                }
                decisionHandler(.allow)
            } else {
                decisionHandler(.allow)
            }
        }
    }
}

struct SignInWebView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWebView()
    }
}
