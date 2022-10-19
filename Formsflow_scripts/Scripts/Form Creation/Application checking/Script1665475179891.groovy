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

WebUI.callTestCase(findTestCase('Login_client'), [:], FailureHandling.STOP_ON_FAILURE)

WebUI.setText(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/input_Forms_form1'), 
    ' Automation testing demo')

WebUI.click(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/button_Forms_search-button'))

WebUI.verifyElementClickable(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/button_Submit New'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/button_Submit New'))

WebUI.setText(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/input_Text Field_datatextField'), 
    'abc')

WebUI.verifyElementClickable(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/button_Submit'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/button_Submit'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/a_Applications'))

WebUI.verifyElementPresent(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/label_Automation Testing Demo'), 
    0)

WebUI.click(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/a_1596'))

WebUI.verifyElementPresent(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/div_Applications  Automation Testing DemoDe_fc7834'), 
    0)

WebUI.click(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/a_History'))

WebUI.verifyElementPresent(findTestObject('Object Repository/NewFormCreation/newform submission/Page_formsflow.ai/td_john-smith'), 
    0)

WebUI.callTestCase(findTestCase('logout'), [:], FailureHandling.STOP_ON_FAILURE)

