//+------------------------------------------------------------------+
//|                                                        basic.mq4 |
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
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
      
      
      Comment("The Current spread (is): ", Cal(Bid, Ask)); 
      
  }
//+------------------------------------------------------------------+


double Cal(double pBid,double pAsk)
{
      double current_spread = (pAsk-pBid)/_Point;
      return current_spread;
}