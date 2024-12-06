//
//  ForgetPassword.swift
//  SingIn,UpPages
//
//  Created by LATIFA on 06/12/2024.
//

import SwiftUI

struct ForgetPassword: View {
    
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            Color.clear
                .ignoresSafeArea()
            
            VStack{
                VStack(spacing: 20){
                    Text("نسيت كلمة السر ؟")
                        .font(.system(size: 24)).bold()
                    
                        .foregroundColor(Color.blue)
                }.padding(.bottom, 80.0)
                
                VStack(spacing: 5) { // Decreased spacing between VStacks
                    // Email
                    VStack(alignment: .trailing, spacing: 10) {
                        Text(" بريدك الإلكتروني")
                            .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.613))
                            .font(.system(size: 18))
                        
                        TextField("", text: $email)
                            .textFieldStyle(CustomTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Button {
                        print("forgot password pressed")
                        ForgetPassword()                    } label: {
                        Text("تحقق")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(minWidth: 140, minHeight: 60)
                            .background(Ellipse().foregroundColor(.blue))
                            .clipShape(Ellipse())
                            .padding(.bottom, 30.0)
                    }
                    .padding()
                }
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 100)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                
            }
        }
    }
    
//    func handleForgotPassword() {
//        if email.count == 0 {
//            alertTitle = "خطأ"
//            alertMessage = "يجب إدخال الإيميل"
//            showAlert = true
//        }else{
//            if isValidEmail(email) {
//                // Perform action on valid email
//                print("Email is valid")
//                FirebaseModal.shared.resetPassword(email: testEmail) { result, errorString in
//                    if result {
//                        print("password reset send")
//                        alertTitle = "تم"
//                        alertMessage = "تم ارسال كلمة السر إلى الإيميل الالكتروني"
//                        showAlert = true
//                    }else {
//                        alertTitle = "خطأ"
//                        alertMessage = "حدث خطأ،حاول في وقت أخر"
//                        if let errorString = errorString{
//                            alertMessage = errorString
//                        }
//                        showAlert = true
//                        print("password reset failed")
//                    }
//                }
//            } else {
//                // Handle invalid email
//                print("Email is not valid")
//                alertTitle = "خطأ"
//                alertMessage = "أدخل صيغة إيميل صحيحة"
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
    ForgetPassword()
}

