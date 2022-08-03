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

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/a_Forms'))

WebUI.setText(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_search_form name'), findTestData('Search_values').getValue(
        3, 2))

WebUI.delay(2)

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_ViewEdit Form'))

WebUI.click(findTestObject('Taskvariable/Page_formsflow.ai/button_Next -design'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/span_Task variable'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_Edit'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_Add'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/div_Select form field'))

WebUI.setText(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_Form field_react-select-2-input'), 
    'applicationid')

WebUI.sendKeys(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_Form field_react-select-2-input'), 
    Keys.chord(Keys.ENTER))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/span_Add'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_Add'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/div_Select form field'))

WebUI.setText(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_Form field_react-select-3-input'), 
    'applicationStatus')

WebUI.sendKeys(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_Form field_react-select-3-input'), 
    Keys.chord(Keys.ENTER))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/span_Add'))

WebUI.click(findTestObject('Taskvariable/Page_formsflow.ai/button_Next'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_Save'))

WebUI.verifyTextPresent('Form Workflow Association Saved', false)

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_Submit New'))

WebUI.setText(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_Name_dataname'), findTestData('Search_values').getValue(
        4, 2))

WebUI.setText(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_, numeric only,_datanumber'), findTestData(
        'Search_values').getValue(4, 3))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_, numeric only,_dataagree'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/button_Submit'))

WebUI.verifyTextPresent('Submission Saved', false)

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/a_Tasks'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_Created_filter'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/div_Process Variables'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/span_'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/span_(Form Name)'))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/span__1'))

WebUI.setText(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/input_formName_filters'), findTestData('Search_values').getValue(
        3, 2))

WebUI.sendKeys(findTestObject('Taskvariable/Page_formsflow.ai/input_formName_filters'), Keys.chord(Keys.ENTER))

WebUI.click(findTestObject('Object Repository/Taskvariable/Page_formsflow.ai/div_Review SubmissionOne Step Approval task_45e5da'))

