*** Variables ***

&{ANDROID_CAPABILITIES}    
...    platformName=Android
...    appium:deviceName=emulator-5554
...    appium:automationName=UiAutomator2
...    noReset=${False}
...    autoGrantPermissions=${True}
...    appium:appPackage=com.example.avjindersinghsekhon.minimaltodo
...    appium:appActivity=com.example.avjindersinghsekhon.minimaltodo.MainActivity

${APPIUM_SERVER}     http://127.0.0.1:4723/wd/hub
