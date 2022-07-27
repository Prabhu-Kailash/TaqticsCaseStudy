# TaqticsCaseStudy
## Guidelines for Test (Robot) Execution
### Prerequisites to run the Test Suites :-

Make sure below important packages are installed for the Test Execution.

* RobotFrameWork module/package `pip install robotframework`
* SeleniumLib module/package `pip install robotframework-seleniumlibrary`

**To install all dependecies together** :- Run `pip3 install -r requirements.txt` (Python 3)

**Note** :- Python **3.7** higher versions required.

### Guidelines and Terminal Commands

* All Test Suites are as default configured to run in "HeadlessChrome" mode it can be changed by editing below line in the Test Suites (i.e., .robot files under the directory Test_Suites) -

    `*** Variables ***`

    `${BROWSER} =    headlesschrome    #Options = headlesschrome, chrome, firefox, edge` 

    **Note** :- Relative Chromedriver/edgedriver/geckodriver (firefox) binary (Depending on the choice of your Browser/Version) needs to be downloaded on your machine and should be placed at root folder of this repo.


* Below command runs the test suites (if there are multiple test suites) synchronously and generates output under results directory

    `robot -d Results Test_Suites`

* To pass variable at command line

    `robot -d Results -v BROWSER:chrome Test_Suites`

    By adding this to your command variables can be passed at run time in command line `-v VariableName(Specified in the Script):ValueToPass`

* Running a specific test case (Matches the tags) instead of running a whole test suite

    `robot -d Results -i Smoke -v BROWSER:chrome Test_Suites/*.robot`

    Above command run test case tagged "Smoke" under the Test Suite (Login_Logout.robot) and passes variable to overwrite HeadlessChrome to Chrome at run time.
    By adding `-i TagName` it invokes specific test cases rather than running whole test suite.

* Sample Automation results are placed under results folder for reference.