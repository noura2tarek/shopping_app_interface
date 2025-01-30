# shopping_app_interface

# sign_up

Flutter Task4:         
Making a signup page to access the shopping screen.                                    
The sign up page design includes name form field, email form field, password form field, and confirm
password form field (using TextFormField widget) and a sign up button.

The code validates some conditions to ensure successful sign up.       
The validations are: 
1- The first letter of the name must be capitalized.  
2- The email field must contains @   
3- The password field must have at least 6 characters.   
4- The password and confirm password fields must be the same.    

The validations done using the validator attribute of each field and the form key of the form
widget.      
The sign up button is made using OutlinedButton widget.      
After successful sign up --> a dialog box appears to inform that the user is signed up successfully
And the sign up page is redirected to the home page.

The UI is made responsive using media queries,  
The widgets in lib/widgets folder.    
The screens in lib/screens folder.                   
The sign up page output in images folder.           
The font used is Suwannaphum.               
Other App components is stored in lib/utils folder.
