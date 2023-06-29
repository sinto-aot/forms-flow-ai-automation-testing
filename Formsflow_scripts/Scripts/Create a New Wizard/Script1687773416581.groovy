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

//WebUI.click(findTestObject('Object Repository/Designer-Create form/div_formsflow.ai_productfruits--container'))
WebUI.click(findTestObject('Object Repository/Designer-Create form/a_Create Form'))

WebUI.setText(findTestObject('Object Repository/Designer-Create form/input_Title_title'), findTestData('New Form Data').getValue(
        1, 6))

'Make the resource available for anonymous users'
WebUI.click(findTestObject('Object Repository/Designer-Create form/span_Make this form public'))

WebUI.selectOptionByValue(findTestObject('General tests/select_FormWizard'), 'wizard', false)

WebUI.verifyElementPresent(findTestObject('General tests/span_Page 1_wizard'), 0)

WebUI.verifyElementPresent(findTestObject('General tests/span_addwizardPage'), 0)

WebUI.click(findTestObject('Designer-Create form/span_Text Field'))

WebUI.dragAndDropToObject(findTestObject('Designer-Create form/span_Text Field'), findTestObject('General tests/div_Drag and Drop a form component'))

WebUI.waitForElementPresent(findTestObject('Designer-Create form/input_Label_datalabel'), 0)

WebUI.setText(findTestObject('Designer-Create form/input_Label_datalabel'), findTestData('New Form Data').getValue(1, 3))

WebUI.click(findTestObject('Object Repository/Designer-Create form/button_Save'))

WebUI.click(findTestObject('General tests/span_addwizardPage'))

WebUI.click(findTestObject('General tests/span_Page 2_wizard'))

WebUI.click(findTestObject('Designer-Create form/span_Text Field'))

WebUI.dragAndDropToObject(findTestObject('Designer-Create form/span_Number'), findTestObject('Designer-Create form/form_builder'))

WebUI.waitForElementPresent(findTestObject('Designer-Create form/span_Number'), 0)

WebUI.setText(findTestObject('Designer-Create form/input_Label_datalabel'), findTestData('New Form Data').getValue(1, 4))

WebUI.click(findTestObject('Object Repository/Designer-Create form/button_Save'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/button_Save  Preview'))

WebUI.verifyElementPresent(findTestObject('Object Repository/Designer-Create form/div_Form Saved'), 2)

'Verify Page 1 and Page 2 are present in the preview'
WebUI.verifyElementClickable(findTestObject('General tests/button_Page 1_preview'), FailureHandling.STOP_ON_FAILURE)

WebUI.verifyElementClickable(findTestObject('General tests/button_Next_nextpage_wizard'), FailureHandling.STOP_ON_FAILURE)

WebUI.verifyElementPresent(findTestObject('General tests/label_wizardform1'), 0)

WebUI.click(findTestObject('General tests/button_Page 2_preview'), FailureHandling.STOP_ON_FAILURE)

WebUI.verifyElementPresent(findTestObject('General tests/label_wizardpage2_label'), 0)

WebUI.click(findTestObject('General tests/button_Previous_wizard'))

WebUI.verifyElementPresent(findTestObject('General tests/label_wizardform1'), 0)

'Verify Previous and Next are clickable and  the fields are present in the pages'
WebUI.verifyElementClickable(findTestObject('General tests/button_Next_nextpage_wizard'), FailureHandling.STOP_ON_FAILURE)

WebUI.verifyElementPresent(findTestObject('General tests/label_wizardpage2_label'), 0)

WebUI.verifyElementPresent(findTestObject('General tests/label_wizardform1'), 0)

WebUI.verifyElementPresent(findTestObject('Designer-Create form/button_Edit Form'), 0)

WebUI.verifyElementPresent(findTestObject('Designer-Create form/button_Form History'), 0)

WebUI.verifyElementPresent(findTestObject('Designer-Create form/button_Duplicate Form'), 0)

WebUI.click(findTestObject('Designer-Create form/button_Next -to publish-wizard'))

WebUI.verifyElementClickable(findTestObject('Object Repository/Designer-Create form/span_Task variable'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/button_Edit'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/div_Default Flow'))

WebUI.setText(findTestObject('Designer-Create form/input_Please select from one of the followi_37d3dd - 3rd form'), 'one step')

WebUI.sendKeys(findTestObject('Designer-Create form/input_Please select from one of the followi_37d3dd - 3rd form'), Keys.chord(
        Keys.ENTER))

WebUI.click(findTestObject('Object Repository/Designer-Create form/button_Next'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/div_Form Name   west'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/div_Workflow Name  One Step Approval task l_e4d256'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/label_Publish this form for Client Users'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/input_Publish this form for Client Users_Ch_a04cc3'))

'Verify element url is available'
WebUI.verifyElementPresent(findTestObject('General tests/div_Copy anonymous form URL'), 0)

WebUI.click(findTestObject('General tests/i_Copy anonymous form URL_fa fa-copy'))

WebUI.click(findTestObject('Object Repository/Designer-Create form/button_Save_1'))

WebUI.delay(2)

