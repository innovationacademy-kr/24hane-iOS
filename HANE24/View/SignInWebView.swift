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
    @ObservedObject var hane: Hane
    
    var url: URL {
        let path = "/user/login/42?redirect=42"
//        /// 강제 unwrapping...?
        let retURL = URL(string: "https://\(hane.APIroot)\(path)")!
        print("hi")
        print(retURL)
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
        
//        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//
//        }
//
//        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//
//        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
            let urlToMatch =  hane.APIroot + "/user/login/callback/42"
            if let urlStr = navigationAction.request.url?.path, urlStr == urlToMatch {
                WKWebsiteDataStore.default().httpCookieStore.getAllCookies{ cookies in
                    for cookie in cookies {
                        if cookie.name == "accessToken"{
                            UserDefaults.standard.setValue(String(cookie.value), forKey: "Token")
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
        SignInWebView(hane: Hane())
    }
}
