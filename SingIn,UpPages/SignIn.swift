//
//  SignIn.swift
//  SingIn,UpPages
//
//  Created by LATIFA on 06/12/2024.
//

import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var showSignUp = false
    @State private var showForgotPassword = false
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    VStack(spacing: 20){
                        


                        Text("تسجيل الدخول")
                            .font(.system(size: 24)).bold()
                        
                        Text(" سجل دخولك  ")
                            .font(.system(size: 14))                              .foregroundColor(Color(red: 0.592, green: 0.592, blue: 0.592))
                    }
                    .padding(.vertical, 80.0)
                    
                    VStack(spacing: 5) { // Decreased spacing between VStacks
                        // Email
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("بريدك الإلكتروني")
                                .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.613))
                                .font(.system(size: 14))
                            
                            TextField("", text: $email)
                                .textFieldStyle(CustomTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                        }
                        
                        // Password
                        VStack(alignment: .trailing, spacing: 10) {
                            Text("كلمة السر")
                                .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.613))
                                .font(.system(size: 14))
                            
                            SecureField("", text: $password)
                                .textFieldStyle(CustomTextFieldStyle())
                                .multilineTextAlignment(.trailing)
                        }
                        
                        Button {
                            print("Sign in user")

                        } label: {
                            Text("تم")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(minWidth: 140, minHeight: 60)
                                .background(Ellipse().foregroundColor(.blue))
                                .clipShape(Ellipse())
                                .padding(.bottom, 30.0)
                        }
                        .padding(.top, 60.0)
                        
                        Button {
                            print("goto forgot password")
                            self.showForgotPassword = true
                        } label: {
                            Text("نسيت كلمة السر ؟")
                          .font(.system(size: 18))
                                .bold()
                            
                        }
                        .padding()
                    }
                    .padding()
                    
                    // Don't have an account?
                    HStack {
                        Button(action: {
                            print("goto sign up")
                            self.showSignUp = true
                        }) {
                           
                            Text("سجل دخولك")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(.blue)
                                
                        }
                        Text("ما عندك حساب؟")
                            .font(.system(size: 18))
                         
                            .foregroundColor(Color(red: 0.490, green: 0.490, blue: 0.510))
                       
                    }
                    //.padding(.top, 130)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 100)
                .navigationBarBackButtonHidden(true)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("تم")))
                    
                }
//                NavigationLink(destination: Signup(), isActive: $showSignUp){
//                }
//                NavigationLink(destination: ForgetPassword(), isActive: $showForgotPassword){
//                }
            }
        }
    }
    
//    func handleSignIn() {
//        if email.count == 0 || password.count == 0 {
//            alertTitle = "خطأ"
//            alertMessage = "تأكد أنك عبيت كل البيانات"
//            showAlert = true
//        }else{
//            if isValidEmail(email) {
//                // Perform action on valid email
//                print("Email is valid")
//                FirebaseModal.shared.login(email: email, password: password) { result, errorString in
//                    if result {
//                        print("user logged in successfully")
//                        withAnimation(.spring()) {
//                            appRootManager.currentRoot = .main
//                        }
//                    }else {
//                        alertTitle = "خطأ"
//                        alertMessage = "حدث خطأ، حاول وقت ثاني"
//                        if let errorString = errorString{
//                            alertMessage = errorString
//                        }
//                        showAlert = true
//                        print("user login failed")
//                    }
//                }
//            } else {
//                // Handle invalid email
//                print("Email is not valid")
//                alertTitle = "خطأ"
//                alertMessage = "تأكد من صيغة الإيميل صح"
//                showAlert = true
//            }
//        }
//    }
    
    struct CustomTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .frame(width: 351.0, height: 42.0)
                .background(Color(red: 0.961, green: 0.961, blue: 0.961))
                .cornerRadius(8)
        }
    }
}

#Preview {
    SignIn()
}
