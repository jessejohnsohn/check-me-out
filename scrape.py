import csv
import requests
from BeautifulSoup import BeautifulSoup
from operator import itemgetter

url = 'http://espn.go.com/mlb/stats/batting/_/year/2016/seasontype/2'
response = requests.get(url)
html = response.content

soup = BeautifulSoup(html)
table = soup.find('div', attrs={'id': 'my-players-table'})

list_of_rows = []

for row in table.findAll('tr'):
    list_of_cells = []
    for cell in row.findAll('td'):
        text = cell.text.replace('', '')
        list_of_cells.append(text)
    list_of_rows.append(list_of_cells)

outfile = open("baseball.csv", "wb")
writer = csv.writer(outfile)
writer.writerows(list_of_rows)
outfile.close()
