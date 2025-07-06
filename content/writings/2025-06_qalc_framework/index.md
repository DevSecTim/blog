---
draft: false
title: Rhodes to Riches: Poolside Python and Trading Bots
date: 2025-06-07
cover:
  image: "holiday.jpg"
---

As I write this, the Aegean sun glints off the water and my daughter cannonballs into the pool for the third time this morning. We're on a family holiday on the beautiful Greek island of Rhodes—an ideal mix of history, relaxation, and, somewhat unexpectedly, a productive coding sprint. Because yes, once again, I’ve found myself writing yet another algo-trading framework. I think this must be the third or fourth time I’ve gone down this rabbit hole.

In the past, these projects often spiraled into something far too complex. A big reason for that was my enduring love of complex languages like Go and C++: strong typing, clean concurrency, and the temptation to engineer elegant but ultimately over-abstracted systems. They were interesting projects, but they tended to collapse under their own weight before they could do any meaningful trading. 

In my heart though, I always knew Python was the right fit for this kind of project lightweight and productive, with access to its vibrant data science ecosystem—with libraries like Pandas, NumPy, and TA-Lib—it’s an excellent fit for financial modelling, time series manipulation, and technical analysis.

I also fully embraced AI tools like GitHub Copilot to help me stay focused and avoid overengineering and speed through the boilerplate while sipping piña coladas. The result is a new project called **Qalc**, which you can find [on GitHub](https://github.com/DevSecTim/qalc). It’s deliberately minimal, flexible, and modular—the kind of tool I wish I’d had the first few times around.

## First Strategy: RSI Trailing Stop

The first strategy implemented in Qalc is a momentum-based approach that combines the classic RSI (Relative Strength Index) indicator with a trailing stop mechanism. Here’s how it works:

1. **Entry Signal**: The strategy looks for a crossover event where the RSI crosses above a specified threshold (e.g., 30). This suggests a potential bullish reversal.
2. **Exit Conditions**:

   * If RSI crosses below a higher threshold (e.g., 70), indicating a possible trend exhaustion.
   * Or if the price falls by more than a set trailing stop amount from the peak since entry.

This gives it a bit more nuance than basic RSI strategies. The trailing stop acts as a dynamic safety net, locking in gains without relying solely on indicator flips. In early backtests, it appears to strike a reasonable balance between riding trends and protecting capital—though more rigorous testing is coming.

## Backtesting: Up and Running

Initially I'm using a free [Alpaca](https://alpaca.markets/) account for my backtesting, using its [Market Data API](https://alpaca.markets/sdks/python/market_data.html) - with a view to expanding to use its Trading API later for execution of actual trades. The platform provides access to historical candles that the framework runs a given strategy against and prints the results.

Here are the results of a backtest of the RSI Trailing Stop strategy against the last 30 days of trading data on AAPL, divided into 15 minute candles, using 100,000 fake dollers:

```
2025-05-07 17:45 BUY @ 194.60, shares=513
2025-05-19 13:30 SELL @ 205.52, shares=513, PnL=5601.96
2025-05-19 13:45 BUY @ 205.73, shares=513
2025-05-21 17:15 SELL @ 202.07, shares=513, PnL=-1877.58
2025-05-21 18:45 BUY @ 201.38, shares=515
2025-05-23 12:30 SELL @ 195.39, shares=515, PnL=-3084.85
2025-05-23 13:00 BUY @ 193.95, shares=518
2025-05-30 16:30 SELL @ 197.34, shares=518, PnL=1756.02
2025-06-09 17:15 BUY @ 200.74, shares=510
2025-06-12 13:30 SELL @ 197.85, shares=510, PnL=-1471.35
2025-06-12 13:45 BUY @ 197.94, shares=509
2025-07-03 17:45 FINAL SELL @ 213.36, shares=509,PnL=7848.78

[💰 Final Value]: $108772.98 | PnL: $8772.98
```

This is obviously just one result, and a lot more testing and analysis is required, but this proves both the framework, and to an extent, the strategy.  Although in this case the strategy was roughly breaking even until the end.

This alone marks a huge milestone compared to previous projects. Being able to validate a strategy with historical data quickly and transparently makes iteration so much easier - and believe me, there will be iterations! Possible with fewer piña coladas though...

---

## Future Plans

Now that the core is functional, here’s what’s on the roadmap:

* ✅ **Alpaca Market Data API support** – Done
* ⏳ **Alpaca Trading API support** – Full trade execution from the framework
* ⏳ **Coinbase API support** – Especially for crypto strategies
* ⏳ **More strategies** – Including breakout and mean-reversion types
* ⏳ **Month-long live test** – Run on Alpaca’s paper trading environment

---

Whether anything profitable comes from this is secondary (though let’s hope!). For now, I’m enjoying the process—lightweight, AI-assisted, and written under the sun with the scent of grilled souvlaki in the air. If you've ever wanted to write your own trading bot without spiraling into unnecessary architecture patterns, I highly recommend giving it a go on your next beach break.

If you want to follow along or contribute, check out the project here: [https://github.com/DevSecTim/qalc](https://github.com/DevSecTim/qalc)

— Tim 🍹
