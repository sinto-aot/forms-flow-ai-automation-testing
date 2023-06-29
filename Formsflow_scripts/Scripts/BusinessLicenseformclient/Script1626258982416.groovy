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

WebUI.setText(findTestObject('Business_Licence/search_form name'), findTestData('Search_values').getValue(2, 2))

WebUI.click(findTestObject('Business_Licence/button_Forms_search-button'))

WebUI.delay(2)

WebUI.click(findTestObject('business/Page_formsflow.ai/button_Submit New'))

'Verify the form opened is correct'
WebUI.verifyElementPresent(findTestObject('Business_Licence/b_NEW BUSINESS LICENCE APPLICATION'), 2)

WebUI.setText(findTestObject('Object Repository/FOI_client_submitform/Page_formsflow.ai/input_Business Operating Name_databusinessO_c3a9d7'), 
    findTestData('data for other fields').getValue(1, 2))

WebUI.verifyElementPresent(findTestObject('Business_Licence/span_Saved to ApplicationsDrafts'), 2)

WebUI.sendKeys(findTestObject('FOI_client_submitform/Page_formsflow.ai/input_Business Operating Name_databusinessO_c3a9d7'), 
    Keys.chord(Keys.TAB))

WebUI.click(findTestObject('Business_Licence/input_Proposed Business Start Date_form-control input active'))

WebUI.setText(findTestObject('Business_Licence/input_Proposed Business Start Date_form-control input active'), '04/29/2022')

WebUI.sendKeys(findTestObject('Business_Licence/input_Proposed Business Start Date_form-control input active'), Keys.chord(
        Keys.ENTER))

WebUI.setText(findTestObject('business/Page_formsflow.ai/input_Business E-Mail_dataeMail'), findTestData('data for other fields').getValue(
        8, 2))

WebUI.setText(findTestObject('FOI_client_submitform/Page_formsflow.ai/input_Nature of Business_datanatureOfBusiness'), findTestData(
        'data for other fields').getValue(9, 2))

WebUI.setText(findTestObject('FOI_client_submitform/Page_formsflow.ai/input_Number of Employees_datanumberOfEmployees'), 
    findTestData('Data_FOI_businessLIcense').getValue(12, 2))

WebUI.click(findTestObject('Object Repository/business test/Page_formsflow.ai/span_Sole Proprietor'))

WebUI.click(findTestObject('business/Page_formsflow.ai/label_No'))

WebUI.click(findTestObject('FOI_client_submitform/Page_formsflow.ai/intermuncipal_license'))

WebUI.click(findTestObject('FOI_client_submitform/Page_formsflow.ai/BuildingPermitRequired'))

WebUI.scrollToElement(findTestObject('business/Page_formsflow.ai/button_Submit'), 3)

WebUI.click(findTestObject('business/Page_formsflow.ai/button_Submit'))

WebUI.delay(3)

WebUI.verifyTextPresent('Submission Saved', false)

WebUI.delay(3)

WebUI.click(findTestObject('BusinessLicense/a_Applications'))

GlobalVariable.ApplicationId = WebUI.getText(findTestObject('Reviewer_task/Page_formsflow.ai/a_23'))

WebUI.click(findTestObject('Reviewer_task/Page_formsflow.ai/a_23'))

WebUI.verifyElementText(findTestObject('Business_Licence/td_5118'), GlobalVariable.ApplicationId)

'Verify Application Status'
WebUI.verifyElementText(findTestObject('Business_Licence/td_Application Status'), 'New')

WebUI.click(findTestObject('Object Repository/Reviewer_task/Page_formsflow.ai/a_Form'))

WebUI.verifyElementPresent(findTestObject('Business_Licence/b_NEW BUSINESS LICENCE APPLICATION-application'), 0)

WebUI.verifyElementClickable(findTestObject('Business_Licence/button_Export PDF'), FailureHandling.STOP_ON_FAILURE)

WebUI.click(findTestObject('Object Repository/Reviewer_task/Page_formsflow.ai/a_History'))

'Verify History tab has details'
WebUI.verifyElementPresent(findTestObject('Business_Licence/td_New'), 0)

WebUI.verifyElementPresent(findTestObject('Business_Licence/td_john-smith'), 0)

//WebUI.switchToWindowIndex(1)
//WebUI.executeJavaScript('window.scrollTo(0, document.body.scrollHeight)', null)
//WebUI.delay(3)
//WebUI.closeWindowIndex(1)
//WebUI.switchToWindowIndex(0)
WebUI.click(findTestObject('Reviewer_task/Page_formsflow.ai/a_Process Diagram'))

