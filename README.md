# Shopping_app_interface

# Connect App to Firebase

# Sign up and login using Firebase Authentication

Adding firebase authentication for the shopping app:
                         
**Project configuration with firebase** --> done using the flutterfire CLI and flutterfire configure
command.

After the project is configured, firebase options file is added to lib folder.
Then, we add firebase core and firebase auth packages to the pubspec.yaml file.

And i initialize firebase in main.dart file.                       
                                                 
**Sign up screen**                                             
Sign up using firebase auth using (create user with email and password) method.                      
After creating an account successfully, a dialog box appears to inform that the user is signed up successfully
then the user is redirected to the login page.                       
                                                                 
**Login screen**                                                                       
Login using firebase auth using (sign in with email and password) method.                      
After logging in successfully, the user is redirected to the home page.
                                                                                            
**Log out function** is added in home page using actions in the app bar.                                                          
                                                                                                   
If any exception or error occurs, the error message is displayed in a Snack bar.                                 
                                
The code validates some conditions to ensure successful sign up.                                    
The validations are:
1- The first letter of the name must be capitalized.  
2- The email field must contains @   
3- The password field must have at least 6 characters.   
4- The password and confirm password fields must be the same.
 
The widgets in lib/widgets folder.    
The screens in lib/screens folder.                                                     
The task output images in images folder.                           
Other App components is stored in lib/utils folder.                

---------------------------------------
# Packages used:                                         

firebase_core: to use the Firebase Core API --> https://pub.dev/packages/firebase_core                                                                                             
firebase_auth: for firebase authentication ---> https://pub.dev/packages/firebase_auth
