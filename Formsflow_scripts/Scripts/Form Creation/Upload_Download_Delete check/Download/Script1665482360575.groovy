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

WebUI.setText(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/input_Download Form_form1'), findTestData(
        'Search_values').getValue(2, 2))

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/i_Download Form_fa fa-search'))

WebUI.delay(2)

WebUI.check(findTestObject('NewFormCreation/Page_formsflow.ai/input_ViewEdit Form_form-check-input'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Download Form'))

WebUI.verifyElementPresent(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/div_1 Form Downloaded Successfully'), 
    0)

