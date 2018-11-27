
URL="https://platform.qa.cloud.bionexo.com.br/cotacoes#/open/1/opening_desc";
preScript="./prescript/login.js";

version="1.209.0_2018-11-27v";
endSelector="#quotes-listing-page > div.col-md-9.list-content-container > div > div:nth-child(3) > div > div.quotes-list.default-list > div.list-group-item.quote-marked-as-read > div > div.col-md-6.col-sm-6.col-xs-6 > p.quote-kind-description";
endSelectorValue="Cotação PDC"
condition="var element = document.querySelector(\"$endSelector\"); if (element == null) return false; else return element.textContent.trim() == \"$endSelectorValue\";"
path_performance=performance-report/bionexo/$version/cotacao-$(date +%Y-%m-%d-%H-%M-%S)

sitespeed.io --preScript $preScript $URL --browsertime.pageCompleteCheck "var element = document.querySelector(\"$endSelector\"); if (element == null) return false; else return element.textContent.trim() == \"$endSelectorValue\";" -b firefox  --outputFolder performance-report/bionexo/$version/cotacao-$(date +%Y-%m-%d-%H-%M-%S) -n 1