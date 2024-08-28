
import Foundation
import SwiftUI

public class Authentication: ObservableObject {
    @Published public var isSignIn: Bool
    
    public init() {
        self.isSignIn = false
    }
    
    @MainActor
    public func isLogin() async throws -> Bool {
        debugPrint("isLogin start")
        do {
            try await NetworkManager.shared.apiRequest("/user/login/islogin", .get)
            debugPrint("isLogin success")
            return true
        } catch {
            ErrorHandler.shared.handleError(error)
            debugPrint("isLogin failed")
            return false
        }
    }
    
    //MARK: - API 요청시 사용자 AccessToken이 만료된 경우
    public func tokenExpired() {
        
    }

    //MARK: - More Module 내에서 사용자가 로그아웃 한 경우
    public func signOut() {
        
    }
    
    //MARK: - LogIn Module 내에서 사용자가 로그인 경우
    public func signIn() {
        
    }
    
}
