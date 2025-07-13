# NetWorthCalculator
A program that calculates a person's net worth by connecting an excel file to an intraday stock API.

# In Depth Description:
This MATLAB code allows for a user to link an excel file saved on their computer to a stock search program that extracts intraday stock data from the alfavantage 
API.  The Excel file is formatted so that the stock ticker is placed in the first column, and the number of shares in the second. After the data is extracted, the 
program multiplies the share price with the number of shares and then does a final summation of the total value.  

In the terminal, the program prints the share price and the total value that the user has in each stock, with a final combined total value at the end.
