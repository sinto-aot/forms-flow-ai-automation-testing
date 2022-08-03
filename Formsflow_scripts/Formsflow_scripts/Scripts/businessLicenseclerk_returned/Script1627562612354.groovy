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

WebUI.click(findTestObject('Object Repository/business_test/Page_formsflow.ai/a_Tasks'))

WebUI.click(findTestObject('Object Repository/business_test/Page_formsflow.ai/a_Clerk Tasks (181)'))

WebUI.click(findTestObject('Object Repository/business_test/Page_formsflow.ai/span_Two Step Approval-listener'))

WebUI.click(findTestObject('Object Repository/businessform_clerk-reviewer/Page_formsflow.ai/span_Claim'))

WebUI.scrollToElement(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/div_Select Clerk Action_dropdown'), 
    3)

WebUI.click(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/div_Select Clerk Action_dropdown'))

WebUI.setText(findTestObject('clerk/Page_formsflow.ai/input_Select Clerk Action_choices'), 'Returned')

WebUI.sendKeys(findTestObject('clerk/Page_formsflow.ai/input_Select Clerk Action_choices'), Keys.chord(Keys.ENTER))

WebUI.selectOptionByValue(findTestObject('Object Repository/clerk/Page_formsflow.ai/select_spanReturnedspan'), 'Returned', 
    true)

WebUI.scrollToElement(findTestObject('clerk/Page_formsflow.ai/textarea_Clerk Comments_dataclerkComments'), 3)

WebUI.setText(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/textarea_Clerk Comments_returned'), 'change mail')

WebUI.scrollToElement(findTestObject('businessform_clerk-reviewer/Page_formsflow.ai/button_Submit'), 3)

WebUI.click(findTestObject('Object Repository/businessform_clerk-reviewer/Page_formsflow.ai/button_Submit'))

