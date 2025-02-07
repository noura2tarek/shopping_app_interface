# Shopping_app_interface

# Add Profile with auth access

Adding profile with auth access to the app using local_auth package.:

The user can go to profile page from the home page by clicking on the profile icon in the top
right.
The profile page added with a dummy data and it is accessible only to authenticated users.
If the user device does not support biometric authentication, it will be redirected to the profile
page (assuming that the user is authenticated).

If the user device supports biometric authentication, the user will be asked to scan his fingerprint
for authentication using LocalAuthentication.authenticate() method in local_auth package.

The Task output images with name (user_profile_output) in assets/images
folder.
The widgets in lib/widgets folder.    
The screens in lib/screens folder.
Other App components is stored in lib/utils folder.

---------------------------------------

# Packages used:

local_auth: for biometric authentication --> https://pub.dev/packages/local_auth
firebase_core: to use the Firebase Core
API --> https://pub.dev/packages/firebase_core                                                                                             
firebase_auth: for firebase authentication ---> https://pub.dev/packages/firebase_auth
