import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.click(findTestObject('Business_Licence/Tasks'))

WebUI.click(findTestObject('Business_Licence/div_Review ApplicationsTwo Step Approval-listener      Created 5 minutes ago50'))

WebUI.verifyElementPresent(findTestObject('Business_Licence/span_formsflowformsflow-reviewerclerk'), 0)

WebUI.verifyElementPresent(findTestObject('Business_Licence/a_Form'), 0)

WebUI.verifyElementPresent(findTestObject('Business_Licence/b_NEW BUSINESS LICENCE APPLICATION-task'), 0)

WebUI.click(findTestObject('Business_Licence/a_History'))

WebUI.verifyElementPresent(findTestObject('Business_Licence/td_New'), 0)

WebUI.verifyElementPresent(findTestObject('Business_Licence/td_john-smith'), 0)

WebUI.verifyElementClickable(findTestObject('Business_Licence/span_View Submission'), FailureHandling.STOP_ON_FAILURE)

WebUI.click(findTestObject('Business_Licence/a_Form'))

WebUI.click(findTestObject('Business_Licence/span_Claim'))

WebUI.scrollToElement(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/div_Select Clerk Action_dropdown'), 
    3)

WebUI.click(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/div_Select Clerk Action_dropdown'))

WebUI.delay(2)

WebUI.setText(findTestObject('clerk/Page_formsflow.ai/input_Select Clerk Action_choices'), 'Returned')

WebUI.sendKeys(findTestObject('clerk/Page_formsflow.ai/input_Select Clerk Action_choices'), Keys.chord(Keys.ENTER))

WebUI.selectOptionByValue(findTestObject('Object Repository/clerk/Page_formsflow.ai/select_spanReturnedspan'), 'Returned', 
    true)

WebUI.scrollToElement(findTestObject('clerk/Page_formsflow.ai/textarea_Clerk Comments_dataclerkComments'), 3)

WebUI.setText(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/textarea_Clerk Comments_returned'), 'change mail')

WebUI.scrollToElement(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/button_Submit'), 3)

WebUI.click(findTestObject('Object Repository/businessform_clerk-reviewer/Page_formsflow.ai/button_Submit'))

WebUI.click(findTestObject('BusinessLicense/a_Applications'))

WebUI.click(findTestObject('Reviewer_task/Page_formsflow.ai/a_23'))

'Verify Application Status'
WebUI.verifyElementText(findTestObject('Business_Licence/td_Application Status'), 'Resubmit')

