# E-Commerce-Project
This project is a web-based e-commerce application. The requirements for this website and the database to be used are explained below. First, the database was 
created, and then this database was included in the ASP.NET MVC project. Access to the database from within the project is done with the entity framework. In order 
to use this project on your own computer, you need to make some changes. First, clone the project to your own computer. Then open the script file in an editor. Copy 
all the codes. Then open a database management system (e.g. SQL Server). Create a new query. Paste the code you copied. At the top of the code you will see the file 
extensions shown in the image below.

<img width="902" alt="dbms2" src="https://user-images.githubusercontent.com/129083272/229394270-5c2aa99b-950e-4183-b8f6-be3f88987727.png">

The meaning of the codes here is the creation of Data.mdf and Data_log.ldf files that will be required for the database management system. You should edit the path 
settings here according to your own computer. If there are databases you have created before in SQL Server, SQL Server has created files with ".mdf" and ".ldf" 
extensions in those databases. I recommend that you discover where SQL Server creates these files and set a path accordingly. Execute it. The database is now ready. 
Open the project in Visual Studio.In the web config section, come to the section where the "connection string" tags are. Among these tags, there is a long "add" tag. 
Replace the data source part in this "add" tag with the name of your own sql server and save it. When you open SQL Server, you will see the server name. You can copy 
it from there. Your project is now ready to use.

What kind of requirements did I create the database for?

A clothing company wants to market its textile products to its users through its website. The company has women's, men's, children's, beauty products available. 
Women's products are grouped as new arrivals, bestsellers, basic, coat, jacket, blazer, vest, dress, knitwear, shirt, top, t-shirt, sweatshirt, trousers, Jean, 
skirt, suit, shoes, bag, accessory. Men's products: Basic, coat, coat, blazer, vest, sweatshirt, sweater, trousers, jeans, shirt, t-shirt, tracksuit, shoes, bag 
sub-areas. The child category is primarily divided into girls and boys, and each subgroup is further subdivided into 6-14 years, 6 months, 5 years, and 0-6 months. 
Beauty products, on the other hand, include subsections such as perfume, lips, eyes, face, nail polish and brushes.

- The user should be able to search by word and barcode in the sub-fields of women, men, children and beauty products on all products available in the system.
- It should be possible to search among the existing branches of the company on the basis of city, street and zip code.
- User's previous orders can be kept and order slips
should be viewable.
- The user should be able to change the e-mail account in his profile, change the password and delete his account if necessary.
- The user must be able to define more than one address.
- The user must have a wallet and this wallet must be able to hold more than one credit card.
- The user should be able to add the products selected in the system to his favourites, and then add these products to his cart if he wishes.
- The user should be able to add the products he wants to his cart, and make the necessary updates to his cart whenever he wants. While shopping, he should be able 
to choose the address he wants for delivery.
- Distribution of monthly shopping of users in categories of women, men and children should be displayed under the user interface as bar graphs. The user should be 
able to see the distribution of the purchases made in that month by selecting the desired month.
- The user should be able to filter the data by using different filters (color, size, category, etc.) in a sub-category they want.
- The user should be able to add a photo taken with the product he bought to the system,
and should be able to evaluate the product he bought. If necessary, do
be able to edit or delete the evaluation.
- Each user should be able to get 5 points for each of their shopping and comments. Point
Users whose quantity exceeds 50 should be given a 5% discount on products.
- A list of returned products should be kept and the maximum number of items per month should be kept.
The returned product should be displayed in the admin panel.
- The administrator can also manage the subgroups of women, men and children on the basis of the User's city.
should be able to display the three best-selling products in their field on a monthly basis.
- Manager, monthly total sales in categories of women, men and children
to see the amount.
- Top three favorites for each sub-category in the admin panel
should be listed.
- Discounts should be available for a certain product in the admin panel. at the same time
Discounts can be applied by choosing more than one product.
- Each month, at least ten products sold that month must be discounted at a certain rate, and
should be displayed to users.
- The administrator should be able to view the top ten users who have collected the most points, and increase the discount amounts if necessary.
- Admins should have the authority to delete comments and images added by users.

<img width="789" alt="dbms3" src="https://user-images.githubusercontent.com/129083272/229398100-6ae797cb-bb5f-45a1-a879-8e51b34275a4.png">




