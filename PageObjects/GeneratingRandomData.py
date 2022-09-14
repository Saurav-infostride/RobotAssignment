import random
import string
import allure
from allure_commons.types import AttachmentType

EMAIL = ''.join(random.choice(string.ascii_letters) for _ in range(5, 10)) + '@gmail.com'
PASSWORD = ''.join(random.choice(string.ascii_letters) for _ in range(10))
FIRST_NAME = ''.join(random.choice(string.ascii_letters) for _ in range(5, 10))
LAST_NAME = ''.join(random.choice(string.ascii_letters) for _ in range(4, 6))


def takeScreenshot(self):
    Screenshot = allure.attach(self.driver.get_screenshot_as_png(), attachment_type=AttachmentType.PNG)
