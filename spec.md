# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
    ##### Executable in `bin` folder.
    1. created `book-deals` executable and called `Launcher` from it.
    
    ##### `CLI` and `Launcher` interact with user and application
    1. In order to keep the code loosely coupled, I created two classes `CLI` and `Launcher`.
    2. `CLI` - interacts with the user and asks to enter a choice or displays the required output.
    3. `Launcher` - It is the starting point of the application. It interacts with `CLI` and the application and contains the logic from greeting the user to exiting the application. 
   
- [x] Pull data from an external source
   ##### `Scraper` to extract data from Goodreads website.
   1. `Scraper` extracts the data which is constructed into models by `Category`, `Book` and `Deal`.
  
   
- [x] Implement both list and detail views
  ##### `Scraper` scrapes data of each category and the book deals related to that category.
  1. `Scraper` extracts the categories information from the `All Deals` page of Goodreads and displays to the user to select the category whose deals user wants to see.
  2. After user selects the category he/she wants to view, it displays all the book deals related to the category and also displays the total number of deals found for the category in the end.
