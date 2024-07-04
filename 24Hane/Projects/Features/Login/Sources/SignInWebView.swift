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
//    @EnvironmentObject var hane: Hane
    @Binding var viewStat: Stat

    var url: URL {
        let path = "/user/login/42?redirect=42"
        let apiRoot = NetworkManager.shared.apiRoot
        let retURL = URL(string: "\(apiRoot)\(path)")!
        return retURL
    }

    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self, viewStat: $viewStat)
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
//        var hane: Hane
        var viewStat: Binding<Stat>

        init(_ parent: SignInWebView, viewStat: Binding<Stat>) {
            self.parent = parent
//            self.hane = hane
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
            let urlToMatch =  "/user/login/callback/42"

            if  let urlStr = navigationAction.request.url?.path, urlStr == urlToMatch {
                WKWebsiteDataStore.default().httpCookieStore.getAllCookies { (cookies) in
                    for cookie in cookies where cookie.name == "accessToken" {
                        UserDefaults.standard.setValue(String(cookie.value), forKey: "Token")
                        UserDefaults.shared.setValue(String(cookie.value), forKey: HaneWidgetConstant.storageKey)
                        WidgetCenter.shared.reloadAllTimelines()
//                        self.hane.isSignIn = true
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
