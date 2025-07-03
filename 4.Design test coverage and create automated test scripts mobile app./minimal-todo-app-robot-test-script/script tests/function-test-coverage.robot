*** Settings ***
Library    AppiumLibrary
Resource   ../resources/android/android_caps.robot
Resource   ../resources/data/account.robot


*** Variables ***
${MAIN_ACTIVITY_XPATH}           //xpath  หน้าหลัก
${FlOATING_BUTTON_XPATH}         //xpath  ปุ่ม Floating
${CALENDAR_INSTANCE_XPATH}       //xpath  Layout Calendar
${LIST_TODO_INSTANCE_XPATH}      //xpath  Layout List TO-DO
${TODO_ABOUT_INSTANCE_XPATH}     //xpath  Layout หน้ารายละเอียด To-DO
${ADD_TODO__BUTTON_XPATH}        //xpath  ปุ่มสร้างรายการ TO-DO
${SAVE_TODO__BUTTON_XPATH}       //xpath  ปุ่มบันทึกรายการ TO-DO
${REMOVE_TODO__BUTTON_XPATH}     //xpath  ปุ่มลบรายการ TO-DO
${TEXT_VIEW_XPATH}               //xpath  ช่องกรอก Title To-DO
${NOTIFICATION_VIEW_XPATH}       //xpath  Icon notification
${DATE_SPINNER_ITEMSTYLE}        //xpath  Icon เลือกเวลา
${SAVE_TODO_DATE_BUTTON_XPATH}   //xpath  ปุ่มบันทึกวัน/เดือน/ปีรายการ TO-DO



*** Test Cases ***
TC-01 Add To-Do Item
    Open Application                    ${APPIUM_SERVER}    &{ANDROID_CAPABILITIES}
    Wait Until Element Is Visible       ${MAIN_ACTIVITY_XPATH}    10s
    Click Element                       ${FlOATING_BUTTON_XPATH}
    Sleep                               300s
    Click Element                       ${ADD_TODO__BUTTON_XPATH}
    Sleep                               300s
    Input Text                          ${TEXT_VIEW_XPATH}    ${TITLE_TODO}
    Sleep                               300s
    Click Element                       ${CALENDAR_INSTANCE_XPATH}   10s
    Sleep                               300s
    Click Element                       ${SAVE_TODO__BUTTON_XPATH}
    Sleep                               300s
    Log To Console                      Minimal Application save to-do lists successfully and the item is displayed in the task list.
    Close Application


TC-02 Add To-Do Item with Alert
    Open Application                    ${APPIUM_SERVER}    &{ANDROID_CAPABILITIES}
    Wait Until Element Is Visible       ${MAIN_ACTIVITY_XPATH}    10s
    Click Element                       ${LIST_TODO_INSTANCE_XPATH}
    Sleep                               300s
    Wait Until Element Is Visible       ${TODO_ABOUT_INSTANCE_XPATH}    10s
    Page Should Contain Element         ${NOTIFICATION_VIEW_XPATH}  #Check display NotificationIcon
    Log To Console                      The item is saved and displays a notification icon.
    Close Application


TC-03 Set Notification
    Open Application                    ${APPIUM_SERVER}    &{ANDROID_CAPABILITIES}
    Wait Until Element Is Visible       ${MAIN_ACTIVITY_XPATH}    10s
    Click Element                       ${LIST_TODO_INSTANCE_XPATH}
    Sleep                               300s
    Wait Until Element Is Visible       ${TODO_ABOUT_INSTANCE_XPATH}    10s
    Click Element                       ${NOTIFICATION_VIEW_XPATH}      10s
    Click Element                       ${DATE_SPINNER_ITEMSTYLE}   ${DATE_TODO}  
    Sleep                               300s
    Click Element                       ${SAVE_TODO_DATE_BUTTON_XPATH}
    Log To Console                      The selected time is shown and the timer is set correctly.
    Close Application

TC-04 Set Recurring Notification



TC-05 Disable Notification

TC-06 Delete To-Do with Alert

TC-07 Bulk Delete Notifications

TC-08 Notification Trigger

TC-09 Background Notification

TC-10 Notification Reliability




