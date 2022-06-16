*** Settings ***
Documentation   Documentacao da API:             http://fakerestapi.azurewebsites.net/index.html
Library         RequestsLibrary
Library         Collections
Library         SeleniumLibrary


*** Variables ***
${URL}                                            http://fakerestapi.azurewebsites.net/api/v1/

*** Keywords ***
Conectar minha API
    Create Session                                fakeRestApi    ${URL}

Cadastrar um novo usuario
    [Arguments]                                   ${UserID}     ${UserName}    ${UserPasswd}
    ${HEADERS}      Create Dictionary             content-type=application/json
    ${RESPOSTA}     POST On Session               fakeRestApi         Users  data={"id":"${UserID}", "userName":"${UserName}","password":"${UserPasswd}"}
    ...                                           headers=${HEADERS}
    Set Test Variable                             ${RESPOSTA}
    Set Suite Variable                            ${UserID}
    Set Suite Variable                            ${UserName}
    Set Suite Variable                            ${UserPasswd}
    Log                                           ${RESPOSTA.text}

Alterar usuario existente
    [Arguments]                                   ${UserID}     ${UserName}    ${UserPasswd}
    ${HEADERS}      Create Dictionary             content-type=application/json
    ${RESPOSTA}     PUT On Session                fakeRestApi    Users/${UserID}    data={"id":"${UserID}", "userName":"${UserName}","password":"${UserPasswd}"}
    ...                                           headers=${HEADERS}
    Log                                           ${RESPOSTA.text}
    Set Test Variable                             ${RESPOSTA}
    Set Suite Variable                            ${UserIDAlterado}              ${UserID}
    Set Suite Variable                            ${UserNameAlterado}            ${UserName}
    Set Suite Variable                            ${UserPasswdAlterado}          ${UserPasswd}

Conferir se retorna todos os dados corretos do usuario cadastrado
    Dictionary Should Contain Item                ${RESPOSTA.json()}                id              ${UserID}
    Dictionary Should Contain Item                ${RESPOSTA.json()}                userName        ${UserName}
    Dictionary Should Contain Item                ${RESPOSTA.json()}                password        ${UserPasswd}
    Log                                           ${UserID}

Conferir se retorna todos os dados corretos do usuario alterado
    Dictionary Should Contain Item                ${RESPOSTA.json()}                id              ${UserIDAlterado}
    Dictionary Should Contain Item                ${RESPOSTA.json()}                userName        ${UserNameAlterado}
    Dictionary Should Contain Item                ${RESPOSTA.json()}                password        ${UserPasswdAlterado}
    Log                                           ${UserIDAlterado}

Consultar o usuario
    ${RESPOSTA}     GET On Session                fakeRestApi     Users/${UserID}
    Set Global Variable                           ${RESPOSTA}
    Should Be Equal As Strings                    ${RESPOSTA.status_code}                           200
    Should Be Equal As Strings                    ${RESPOSTA.json()}[id]                            ${UserID}
    Should Be Equal As Strings                    ${RESPOSTA.json()}[userName]                      ${UserName}
    Should Be Equal As Strings                    ${RESPOSTA.json()}[password]                      ${UserPasswd}

Deletar usuario existente
    ${RESPOSTA}     DELETE On Session             fakeRestApi     Users/${UserID}
    Log                                           ${RESPOSTA.text}
    Set Test Variable                             ${RESPOSTA}

Conferir o status code
    [Arguments]                                   ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings                    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]                                   ${REASON_DESEJADO}
    Should Be Equal As Strings                    ${RESPOSTA.reason}         ${REASON_DESEJADO}

######################################Utilizados Steps BDD#############################################
cadastro novo usuario
    Cadastrar um novo usuario    10    User 10    Password10

recebo retorno positivo da API
    Conferir o status code  200
    Conferir o reason       OK

todos os dados do usuario foram cadastrados com sucesso
    Conferir se retorna todos os dados corretos do usuario cadastrado

que consulto usuario criado no CT001
    Consultar o usuario

altero usuario usuario criado no CT001
    Alterar usuario existente    2    User 2    Password2

todos os dados do usuario foram alterados com sucesso
    Conferir se retorna todos os dados corretos do usuario alterado

deleto usuario criado no CT001
    Deletar usuario existente

todos os dados do usuario foram deletados com sucesso
    recebo retorno positivo da API