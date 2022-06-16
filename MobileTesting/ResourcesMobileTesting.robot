*** Settings ***
Documentation                                  Simple example using AppiumLibrary
Library                                        AppiumLibrary
Library                                        urllib3


*** Variables ***
${ANDROID_AUTOMATION_NAME}                      UIAutomator2
${ANDROID_APP}                                  ${CURDIR}/sunflower.apk
${ANDROID_PLATFORM_NAME}                        Android
${DEVICE_NAME}                                  android_01

${CABECALHO_APP_SUNFLOWER}                      xpath=//*[@content-desc="Sunflower"]
${BOTAO_ADD_PLANTA}	                            id=com.google.samples.apps.sunflower:id/add_plant
${IMAGEM_PLANTA}                                id=com.google.samples.apps.sunflower:id/plant_item_image
${APPLE_PLANTA}                                 xpath=//*[@text="Apple"]
${APPLE_PLANTA_DETALHES}                        id=com.google.samples.apps.sunflower:id/plant_watering_header
${BOTAO_ADD_PLANTA_DETALHES}                    id=com.google.samples.apps.sunflower:id/fab
${BOTAO_COMPARTILHA}                            id=com.google.samples.apps.sunflower:id/action_share
${BOTAO_VOLTAR}                                 class=android.widget.ImageButton
${MENU_MY_GARDEN}                               xpath=//*[@content-desc="My garden"]
${PLANTA_INSERIDA}                              xpath=//*[@text="Planted"]
${PLANTA_INSERIDA_ULTIMA_REGA}                  xpath=//*[@text="Last Watered"]
${PLANTA_INSERIDA_PRAZO_REGA}                   xpath=//*[@text="water in 30 days."]


*** Keywords ***
Open Test Application
  Open Application                              http://127.0.0.1:4723/wd/hub
  ...                                           automationName=${ANDROID_AUTOMATION_NAME}
  ...                                           platformName=${ANDROID_PLATFORM_NAME}
  ...                                           app=${ANDROID_APP}

que estou na home do app
    Wait Until Element Is Visible               locator=${CABECALHO_APP_SUNFLOWER}
    Capture Page Screenshot

adiciono planta no meu jardim
    Click Element                               locator=${BOTAO_ADD_PLANTA}
    Wait Until Element Is Visible               locator=${IMAGEM_PLANTA}
    Click Element                               locator=${APPLE_PLANTA}
    Wait Until Element Is Visible               locator=${APPLE_PLANTA_DETALHES}
    Click Element                               locator=${BOTAO_ADD_PLANTA_DETALHES}
    Capture Page Screenshot

planta adicionada no meu jardim
    Wait Until Element Is Visible               locator=${BOTAO_COMPARTILHA}
    Wait Until Page Does Not Contain Element    locator=${BOTAO_ADD_PLANTA_DETALHES}
    Click Element                               locator=${BOTAO_VOLTAR}
    Wait Until Element Is Visible               locator=${MENU_MY_GARDEN}
    Click Element                               locator=${MENU_MY_GARDEN}
    Element Should Be Visible                   locator=${APPLE_PLANTA}
    Element Should Be Visible                   locator=${PLANTA_INSERIDA}
    Element Should Be Visible                   locator=${PLANTA_INSERIDA_ULTIMA_REGA}
    Element Should Be Visible                   locator=${PLANTA_INSERIDA_PRAZO_REGA}
    Capture Page Screenshot