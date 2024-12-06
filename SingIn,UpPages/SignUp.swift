//
//  SignUp.swift
//  SingIn,UpPages
//
//  Created by LATIFA on 06/12/2024.
//

import SwiftUI


struct Signup: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var agreedToTerms = false
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//    @EnvironmentObject private var appRootManager: AppRootManager
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    // Action to perform when the button is tapped
                    withAnimation(.spring()) {
//                            appRootManager.currentRoot = .main
                                           }
                }){
                    Text("تخطي")
                        .foregroundColor(.blue)
                        //.bold()
                }
                .padding(.leading)
                .padding(.leading, 250.0)
                .padding(.top, 80)
 

                VStack{
                    Text("سجّل مع ( اسم التطبيق )")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    Text("سجل دخولك و اعزم اصحابك!")
                        .foregroundColor(.gray)
                }                  .padding(.vertical, 80.0)

                
                
                VStack(spacing: 5) { //
                    //name
//                    VStack(alignment: .trailing, spacing: 10) {
//                        Text("الاسم")
//                            .foregroundColor(.gray)
//                            .font(.system(size: 14))
//
//                        TextField("", text: $username)
//                            .textFieldStyle(CustomTextFieldStyle())
//                            .multilineTextAlignment(.trailing)
//                    }
                    // email
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("بريدك الإلكتروني  ")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        TextField("", text: $email)
                            .textFieldStyle(CustomTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                    }
                    
                    VStack(alignment: .trailing, spacing: 10) {
                        // Password
                        Text("كلمة السر ")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        SecureField("", text: $password)
                            .textFieldStyle(CustomTextFieldStyle())
                            .multilineTextAlignment(.trailing)

                    }
                    
                    // Confirm password
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("تأكيد كلمة السر")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                        SecureField("", text: $confirmPassword)
                            .textFieldStyle(CustomTextFieldStyle())
                            .multilineTextAlignment(.trailing)

                    }
                }
                
                Button {
                    Text("تأكيد كلمة السر")
                    Signup()                } label: {
                    Text("تم")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(minWidth: 140, minHeight: 60)
                        .background(Ellipse().foregroundColor(.blue))
                        .clipShape(Ellipse())
                        .padding(.bottom, 30.0)
                }
                .padding(.top, 60.0)
                
                
                //join us
                HStack {
                    Button(action: {
                        // Add action to navigate to login page
                        presentationMode.wrappedValue.dismiss()
                    }) {
                      
                        Text("سجل دخولك")
                            .bold()
                            .foregroundColor(.blue)
                    }
                    Text(" عندك حساب؟ ")
                        .foregroundColor(.gray)
                  
                }
                .padding()
                .padding(.bottom,40)
            }.padding(.bottom, 50)
            //end Vstack
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                
            }
        }
        
    }
      
    
//    func handleSignUp() {
//        if email.count == 0 || password.count == 0 || confirmPassword.count == 0 {
//            alertTitle = "خطأ"
//            alertMessage = "تأكد أنك عبيت كل البيانات"
//            showAlert = true
//        }else{
//            if confirmPassword != password {
//                alertTitle = "خطأ"
//                alertMessage = "كلمة السر غير مطابقة، تأكد أنك دخلت نفس كلمة المرور"
//                showAlert = true
//                return
//            }
//            if isValidEmail(email) {
//                // Perform action on valid email
//                print("Email is valid")
//                FirebaseModal.shared.signUp(username: "", email: email, password: password) { result, errorString in
//                    if result {
//                        print("user sign up successfully")
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
//                        print("user sign up failed")
//                    }
//                }
//            } else {
//                // Handle invalid email
//                print("Email is not valid")
//                alertTitle = "خطأ"
//                alertMessage = "تأكد أنك تدخل صيغة الإيميل صح"
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
    Signup()
//        .environmentObject(AppRootManager())

}

