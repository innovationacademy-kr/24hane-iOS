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
    
    let url: URL {
        let path = "/user/login/42?redirect=42"
        return (URL(string: hane.APIroot + path))
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self, hane: Hane)
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
            
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationActioin: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
            let urlToMatch =  "/user/login/callback/42"
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
                decisionHandler(.cancel)
            }
        }
    }
}

struct SignInWebView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWebView()
    }
}
