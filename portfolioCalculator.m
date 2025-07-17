%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose of the Program: The purpose of this program is to utilize realime
% data stock price data to calculate my total net worth whenever i need it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           -=Portfolio Calculator (Time Series Intraday)=-               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Filename: portfolioMATLAB.xlsx;
%portfolio = input('Enter your portfolio here: ', 's');
portfolio = readtable('portfolioMATLAB.xlsx');

% Split table into two halves
half = round(height(portfolio) / 2);
portfolio1 = portfolio(1:half, :);         % First half
portfolio2 = portfolio(half+1:end, :);     % Second half

% Extract Data from the Portfolio 1
total_value = 0;
for i = 1:height(portfolio1)
    ticker = portfolio1.Ticker{i};
    shares = portfolio1.Shares(i);
    apikey1 = '----------------';

    % Initialize the API Key:
    url = ['https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=' ticker '&interval=5min&apikey=' apikey1];
    data = webread(url);

    % Extract the Stock Data from "data"
    prices = data.('TimeSeries_5min_'); % 25 uses per day
    fields = fieldnames(prices);
    latest_data = prices.(fields{1});
    latest_price = str2double(latest_data.('x4_Close'));

    % Calculate Stock Value
    stock_value = latest_price * shares;
    total_value = total_value + stock_value;

    % Display the results
    fprintf('Stock: %s, Share Price: $%.2f\n, Value: $%.2f\n', ticker, latest_price, stock_value);
    pause(1);
end

% Extract Data from Portfolio 2
for i = 1:height(portfolio2)
    ticker = portfolio2.Ticker{i};
    shares = portfolio2.Shares(i);
    apikey2 = '----------------';

    % Initialize the API Key:
    url = ['https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=' ticker '&interval=5min&apikey=' apikey2];
    data = webread(url);

    % Extract the Stock Data from "data"
    prices = data.('TimeSeries_5min_'); % 25 uses per day
    fields = fieldnames(prices);
    latest_data = prices.(fields{1});
    latest_price = str2double(latest_data.('x4_Close'));

    % Calculate Stock Value
    stock_value = latest_price * shares;
    total_value = total_value + stock_value;

    % Display the results
    fprintf('Stock: %s, Share Price: $%.2f\n, Value: $%.2f\n', ticker, latest_price, stock_value);
    pause(1);
end

timestamp = fields{1};  % Extract the latest timestamp
disp(['Total portfolio value: $' num2str(total_value)])
disp(['Timestamp: ', timestamp])
