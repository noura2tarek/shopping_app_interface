# Shopping App Interface

This is a Shopping app displays products and offers in one page using flutter.

products data shown using page view and grid view,
And offers data shown using list view (horizontal).

- Any product image is Network image from internet with a placeholder while loading using (FadeInImage) widget.
- Every product in grid view has an 'add to cart' icon button, which adding items to cart list.        
- The product which added to the cart, the 'add to cart icon' color, became green.
- Then displays a message to the user 'Item added to the cart successfully' using snackBar.

The UI is made responsive using media queries.    

# App Structure

- The widgets in lib/widgets folder.    
- The screens in lib/screens folder.
- The font used is Suwannaphum.    
- The fonts and images used in assets folder.   
The **shopping interface output** in **images** folder.                       
Other App components is stored in lib/utils folder.       

---------------------------------------

## How to Run

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the app.

----------------------------

# Notes:

- **Note 1** ---> **the sign up page task** in the same repository in branch sign_up_feature.              
- **Note 2** ---> **the animation task** in animation branch.                   
- **Note 3** ---> **the localization task** in localization branch.                  
- **Note 4** ---> **the firebase auth task** in login_with_Firebase_feature branch.                    
- **Note 5** ---> **the fingerprint auth task** in fingerprint_feature branch.                           

