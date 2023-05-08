#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Indicators/Trend.mqh>
CiIchimoku*Ichimoku;
//+------------------------------------------------------------------+
void OnInit()
  {
   Ichimoku = new CiIchimoku();
   Ichimoku.Create(_Symbol,PERIOD_CURRENT,9,26,52);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   Ichimoku.Refresh(-1);
   //the argument of Ichimoku.KijunSen shows the previus valuse of our indicator:)
   double KijunVal= Ichimoku.KijunSen(0);
   double pKijunVal= Ichimoku.KijunSen(1);
   double ppKijunVal= Ichimoku.KijunSen(2);
   double pppKijunVal= Ichimoku.KijunSen(3);

   
   double previousClose = iClose(_Symbol, _Period, 1);

   
   
   
   
   
   
   
   


   Comment("Kijun Sen Value is: ",KijunVal,"\n"
           "Kijun Sen pValue is: ",pKijunVal,"\n"
           "Kijun Sen ppValue is: ",ppKijunVal,"\n" 
           "Kijun Sen pppValue is: ",pppKijunVal,"\n"
           "previousCandleClose : ",previousClose);
  }
  
  
  