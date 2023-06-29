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

WebUI.setText(findTestObject('Business_Licence/search_form name'), findTestData('New Form Data').getValue(1, 2))

WebUI.click(findTestObject('Business_Licence/button_Forms_search-button'))

WebUI.delay(2)

WebUI.click(findTestObject('business/Page_formsflow.ai/button_Submit New'))

Form_name = WebUI.getText(findTestObject('General tests/h3_Form Name'))

//WebUI.verifyElementPresent(findTestObject('General tests/span_Saved to ApplicationsDrafts'), 0)
//WebUI.click(findTestObject('BusinessLicense/a_Applications'))
//WebUI.click(findTestObject('General tests/div_Drafts(20)'))
//WebUI.click(findTestObject('General tests/span_Edit'))
//Form_name_draft = WebUI.getText(findTestObject('General tests/h3_Form Name'))
WebUI.setText(findTestObject('General tests/input_Name_formcomponenet'), findTestData('New Form Data').getValue(4, 3))

WebUI.setText(findTestObject('General tests/input_, numeric_formcomponent'), findTestData('New Form Data').getValue(4, 4))

WebUI.click(findTestObject('General tests/button_Submit'))

WebUI.click(findTestObject('General tests/a_Applications'))

//WebUI.click(findTestObject('General tests/a_Applications-sub'))
WebUI.setText(findTestObject('General tests/input_Filter byApplication Name_text-filter-column-applicationName'), findTestData(
        'New Form Data').getValue(1, 2))

WebUI.click(findTestObject('General tests/span_View'))

WebUI.switchToWindowIndex(1)

WebUI.verifyElementText(findTestObject('General tests/h3_New Resource June 26'), findTestData('New Form Data').getValue(
        1, 2))

WebUI.switchToWindowIndex(0)

