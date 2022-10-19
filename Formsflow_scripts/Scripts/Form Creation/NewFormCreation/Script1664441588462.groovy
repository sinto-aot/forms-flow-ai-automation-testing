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

WebUI.verifyElementClickable(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/a_Create Form'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/a_Create Form'))

WebUI.setText(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/input_Title_title'), findTestData('NewForms').getValue(
        1, 1))

WebUI.dragAndDropToObject(findTestObject('Object Repository/DragDropComponents/Page_formsflow.ai/span_Text Field'), findTestObject(
        'Object Repository/DragDropComponents/Page_formsflow.ai/div_Drag and Drop a form component'))

WebUI.click(findTestObject('Object Repository/DragDropComponents/Page_formsflow.ai/button_Save'))

WebUI.verifyElementClickable(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Save  Preview'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Save  Preview'))

WebUI.verifyElementText(findTestObject('NewFormCreation/Page_formsflow.ai/div_Form Saved'), 'Form Saved.')

WebUI.verifyElementClickable(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Next'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Next'))

WebUI.verifyElementText(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/div_Default Flow'), 'Default Flow')

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Next'))

unchecked = WebUI.verifyElementNotChecked(findTestObject('DragDropComponents/publish_checkbox/Page_formsflow.ai/input_Publish'), 
    0)

if (unchecked == true) {
    WebUI.check(findTestObject('DragDropComponents/publish_checkbox/Page_formsflow.ai/input_Publish'))
}

WebUI.verifyElementClickable(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Save_1'))

WebUI.click(findTestObject('Object Repository/NewFormCreation/Page_formsflow.ai/button_Save_1'))

