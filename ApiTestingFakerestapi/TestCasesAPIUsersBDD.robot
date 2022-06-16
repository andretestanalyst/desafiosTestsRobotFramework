*** Settings ***
Documentation   Documentacao da API:     https://fakerestapi.azurewebsites.net/index.html
Suite Setup     Conectar minha API
Resource        ResourcesAPIUsers.robot

*** Test Cases ***
CT001 - Cadastrar novo usuario(POST)
    Given cadastro novo usuario
    When recebo retorno positivo da API
    Then todos os dados do usuario foram cadastrados com sucesso

CT002 - Buscar usuario criado no CT001(GET)
    Given Que consulto usuario criado no CT001
    When recebo retorno positivo da API
    Then todos os dados do usuario foram cadastrados com sucesso

CT003 - Alterar usuario criado no CT001(PUT)
    Given altero usuario usuario criado no CT001
    When recebo retorno positivo da API
    Then todos os dados do usuario foram alterados com sucesso
#
CT004 - Deletar usuario criado no CT001(DELETE)
    Given deleto usuario criado no CT001
    When recebo retorno positivo da API
    Then todos os dados do usuario foram deletados com sucesso