//
//  SignInWebView.swift
//  HANE24
//
//  Created by Katherine JANG on 2/20/23.
//

import SwiftUI
import WebKit
import Foundation
import WidgetKit
import HaneCore

struct SignInWebView: UIViewRepresentable {
    @ObservedObject var auth: Authentication
    @Binding var viewStat: Stat
    
    init(auth: Authentication, viewStat: Binding<Stat>) {
        self.auth = auth
        self._viewStat = viewStat 
        // 이런 방식으로 Binding 변수를 주입해줄 수 있음(https://stackoverflow.com/questions/56973959/swiftui-how-to-implement-a-custom-init-with-binding-variables)
    }

    var url: URL {
        let path = "/user/login/42?redirect=42"
        let apiRoot = NetworkManager.shared.apiRoot
        let retURL = URL(string: "\(apiRoot)\(path)")!
        return retURL
    }

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self, auth, viewStat: $viewStat)
    }

    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        wkWebView.load(request)
        return wkWebView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
    }

    class WebViewCoordinator: NSObject, WKNavigationDelegate {
        var parent: SignInWebView
        var auth: Authentication
        var viewStat: Binding<Stat>

        init(_ parent: SignInWebView, _ auth: Authentication , viewStat: Binding<Stat>) {
            self.parent = parent
            self.auth = auth
            self.viewStat = viewStat
            super.init()
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if self.viewStat.wrappedValue == .buttonTabbed {
                self.viewStat.wrappedValue = .readyToSignIn
            } else {
                self.viewStat.wrappedValue = .viewAppeared
            }
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            debugPrint("webView start")
            let urlToMatch =  "/user/login/callback/42"

            if  let urlStr = navigationAction.request.url?.path, urlStr == urlToMatch {
                WKWebsiteDataStore.default().httpCookieStore.getAllCookies { (cookies) in
                    for cookie in cookies where cookie.name == "accessToken" {
                        debugPrint("webView: \(cookie.value)")
                        UserDefaults.standard.setValue(String(cookie.value), forKey: "Token")
                        UserDefaults.shared.setValue(String(cookie.value), forKey: HaneWidgetConstant.storageKey)
                        WidgetCenter.shared.reloadAllTimelines()
                        self.auth.isSignIn = true
                        
                        break
                    }
                }
                decisionHandler(.allow)
            } else {
                decisionHandler(.allow)
            }
        }
    }
}
