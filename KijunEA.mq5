//+------------------------------------------------------------------+
//|                                                      KijunEA.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
#include <Indicators/Trend.mqh>
CiIchimoku*Ichimoku;


input double Lot = 0.1;

//+------------------------------------------------------------------+
void OnInit()
  {
   Ichimoku = new CiIchimoku();
   Ichimoku.Create(_Symbol,PERIOD_CURRENT,9,26,52);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

CTrade trade;

void OnTick()
  {
   Ichimoku.Refresh(-1);
   //p means previuos and c means current
   double ppp = iClose(_Symbol, _Period, 3) - Ichimoku.KijunSen(3);
   double pp = iClose(_Symbol, _Period, 2) - Ichimoku.KijunSen(2);
   double p = iClose(_Symbol, _Period, 1) - Ichimoku.KijunSen(1);
   double c = iClose(_Symbol, _Period, 0) - Ichimoku.KijunSen(0);
   
   
   //checks the conditions to trade 
   if (ppp*p > 0 && pp*p < 0)
   {
      //checks the type of order
      if(p > 0 && c > 0)
      {
         //Buy!
         trade.Buy(Lot,_Symbol, (iClose(_Symbol, _Period, 0)-10), (iClose(_Symbol, _Period, 0)+10));

      }
      else if(p < 0 && c < 0)
      {
         //Sell!
         trade.Sell(Lot,_Symbol, (iClose(_Symbol, _Period, 0)+10), (iClose(_Symbol, _Period, 0)-10));
      }
   
   }
   
   Comment("ppp is: ",ppp,"\n"
           "pp is: ",pp,"\n"
           "p is: ",p,"\n"
           "c is: ",c);
  }
  
  
  