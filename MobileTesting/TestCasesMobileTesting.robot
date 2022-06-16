*** Settings ***
Documentation       Testes cases APP Sunflower
Resource            ResourcesMobileTesting.robot
Test Setup          Open Test Application

*** Test Cases ***

CT001 - Validar cadastro de planta no jardim
    Given que estou na home do app
    When adiciono planta no meu jardim
    Then planta adicionada no meu jardim