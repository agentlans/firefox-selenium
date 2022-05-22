# firefox-selenium
Automate the Firefox browser

What's included:
- Firefox 100.0.2 installed on Debian
- Selenium WebDriver
- Python 3.9 bindings for Selenium

# How to use

```bash
# Clone this repository
git clone https://github.com/agentlans/firefox-selenium && cd firefox-selenium

# Build the image from the Dockerfile
docker build -t firefox-selenium .
# Wait a few minutes.

# Start a temporary container from the image.
# By default, goes straight to the Python prompt.
# Ctrl + D will stop and delete the container.
docker run --rm -ti firefox-selenium
```

```python
# Try running this code by copying and pasting to the Python prompt:
from selenium import webdriver
from selenium.webdriver.common.by import By  # for selecting HTML tags
from selenium.webdriver import FirefoxOptions

options = FirefoxOptions()
options.headless = True # No GUI
driver = webdriver.Firefox(options=options)

driver.get("https://www.google.com")

driver.title # => "Google"
driver.quit()
```

# Author, License

The Dockerfile is Copyright ©️ 2022 Alan Tseng

GNU General Public License v3

The *actual* built image is covered by the licenses of Debian, Firefox, Python, and Selenium.
Please see their websites for more details.
