# Mercedes Benz Challenge

# Robot-Framework


Robot Framework is implemented with Python, so you need to have Python installed.
On Windows machines, make sure to add Python to PATH during installation.

## Installing Robot Framework with pip is simple:

```
pip install robotframework
```
To check that the installation was successful, run
```
robot --version
```
For a full guide, please see [Installation instructions](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst)

It also covers topics such as running Robot Framework on Jython (JVM) and IronPython (.NET).

Now you are ready to write your first tests!

## Here are some useful commands:


* Run tests with command `robot -d Reports <test_file>`. 
This will create a new directory `Reports` where output files will be
  stored.

* Run tests with command `robot -i <tag_name> <test_file>`. 
This will run all the tests with the selected `tag`.

* Run tests with command `robot -e <tag_name> <test_file>`. 
This will run all the tests excluding the `tag` entered.

* Run tests with command `robot -v BROWSER:Firefox <tests file>`. 
This will run all the tests with the given `browser`.

* Run tests headless with command `robot -v BROWSER:Fireheadlesschrome <tests file>`. 
This will run the tests `headless`.

* Framework supports taking screenshot for each and every step using `Take Screenshot` keyword. Image file is attached
  to relevant step automatically in `Reports` file.

``--For example, you can combine commands:``
* Run tests with command `robot -d Reports -i <tag_name> -v BROWSER:Firefox <tests file>`. 
This will run the tests for the `tag` entered, creating `reports` in the Reports folder and running all the tests in the firefox `browser`.





* Browser drivers
After installing the library, you still need to install browser and operating system specific browser drivers for all those browsers you want to use in tests. These are the exact same drivers you need to use with Selenium also when not using SeleniumLibrary. More information about drivers can be found from [Selenium documentation](https://www.selenium.dev/selenium/docs/api/py/index.html#drivers)
The general approach to install a browser driver is downloading a right driver, such as chromedriver for Chrome, and placing it into a directory that is in ``--PATH``. Drivers for different browsers can be found via Selenium documentation or by using your favorite search engine with a search term like ``--selenium chrome browser driver``. New browser driver versions are released to support features in new browsers, fix bug, or otherwise, and you need to keep an eye on them to know when to update drivers you use.

* Documentation
  for [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#library-documentation-top) can
  be found here

* Documentation
  for [BuiltIn library](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#library-documentation-top)
  can
  be found here