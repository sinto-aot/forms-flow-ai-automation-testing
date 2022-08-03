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

WebUI.openBrowser('')

WebUI.navigateToUrl('https://app2.aot-technologies.com/')

WebUI.setText(findTestObject('Object Repository/search_task/Page_Log in to forms-flow-mahagony/input_Username or email_username'), 
    'john.honai')

WebUI.setEncryptedText(findTestObject('Object Repository/search_task/Page_Log in to forms-flow-mahagony/input_Password_password'), 
    '76bZg6XXmfs=')

WebUI.click(findTestObject('Object Repository/search_task/Page_Log in to forms-flow-mahagony/input_Password_login'))

WebUI.maximizeWindow()

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/input_Created_filter'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/div_Name'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/span_'))

WebUI.setText(findTestObject('Object Repository/search_task/Page_formsflow.ai/input_Name_filters'), 'Review Submission')

WebUI.sendKeys(findTestObject('Object Repository/search_task/Page_formsflow.ai/input_Name_filters'), Keys.chord(Keys.ENTER))

WebUI.delay(2)

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/i_of the criteria are met_fa fa-times'))

WebUI.click(findTestObject('search_task/Page_formsflow.ai/input_Created_filter'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/div_Assignee'))

WebUI.click(findTestObject('search_task/Page_formsflow.ai/span_'))

WebUI.setText(findTestObject('Object Repository/search_task/Page_formsflow.ai/input_Name_filters'), 'john')

WebUI.sendKeys(findTestObject('Object Repository/search_task/Page_formsflow.ai/input_Name_filters'), Keys.chord(Keys.ENTER))

WebUI.delay(2)

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/i_of the criteria are met_fa fa-times'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/input_Created_filter'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/div_Due Date'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/span_'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/div_'))

WebUI.click(findTestObject('Object Repository/search_task/Page_formsflow.ai/div_31'))

WebUI.selectOptionByValue(findTestObject('Object Repository/search_task/Page_formsflow.ai/select_beforeafter'), 'after', 
    true)

KeywordLogger log = new KeywordLogger()

log.equals('Completed')

