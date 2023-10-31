from bs4 import BeautifulSoup
import csv
import requests

url = "https://gestion.inase.gob.ar/empresas/empresas"

all_data = []

response = requests.get(url)

if response.status_code == 200:
    html = response.text
    soup = BeautifulSoup(html, "html.parser")

    page_info = soup.find("p", text=lambda text: "Página" in text)
    if page_info:
        page_info_text = page_info.get_text()
        start_index = page_info_text.find("Página 1 de ") + len("Página 1 de ")
        end_index = page_info_text.find(",", start_index)
        total_pages = int(page_info_text[start_index:end_index])

        for current_page in range(1, total_pages + 1):
            page_url = f"{url}/index/page:{current_page}"
            response = requests.get(page_url)

            if response.status_code == 200:
                html = response.text
                soup = BeautifulSoup(html, "html.parser")
                table = soup.find("table")

                if current_page == 1:
                    header_row = table.find("tr")
                    column_names = [
                        cell.get_text(strip=True)
                        for cell in header_row.find_all("th")
                    ]
                    all_data.append(column_names)

                data = []
                for row in table.find_all("tr"):
                    cells = row.find_all("td")
                    row_data = [cell.get_text(strip=True) for cell in cells]
                    if any(row_data):
                        data.append(row_data)

                all_data.extend(data)
                print(f"Page {current_page} proccessed")
            else:
                print(f"Error in page {current_page}")
                break

        with open("inase_empresas.csv", "w", newline="") as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerows(all_data)

        print("File saved as inase_empresas.csv")
    else:
        print("Total pages not found.")
else:
    print("Error in the request")
