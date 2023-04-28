//+------------------------------------------------------------------+
//|                                              Data_extraction.mq4 |
//|                                                         Garfield |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Garfield"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
/*
int OnInit()
  {
//--- create timer
   EventSetTimer(60);
   
//---
   return(INIT_SUCCEEDED);
  }
*/  
void OnInit()
{
    // Define variables
    datetime from_date, to_date;
    MqlRates prices[];

    // Set the date range to the last week
    to_date = TimeCurrent();
    from_date = to_date - PeriodSeconds(PERIOD_M1) * 60 * 10080;

    // Get the price data for XAUUSD in 1 minute time frame for the specified date range
    int copied = CopyRates("XAUUSD", PERIOD_M1, from_date, to_date, prices);

    // Open the file for writing
    int file_handle = FileOpen("xauusd_candles.txt", FILE_WRITE|FILE_TXT);

    // Write the header line
    if (file_handle != INVALID_HANDLE) {
        FileWrite(file_handle, "Time,Open,High,Low,Close");

        // Write the OHLC data of each candle to the file
        for (int i = 0; i < copied; i++) {
            string line = TimeToString(prices[i].time) + "," + DoubleToString(prices[i].open, _Digits) + "," + DoubleToString(prices[i].high, _Digits) + "," + DoubleToString(prices[i].low, _Digits) + "," + DoubleToString(prices[i].close, _Digits);
            FileWrite(file_handle, line);
        }
        FileClose(file_handle);
    }
}



//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
//---
   double ret=0.0;
//---

//---
   return(ret);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
  }
//+------------------------------------------------------------------+


