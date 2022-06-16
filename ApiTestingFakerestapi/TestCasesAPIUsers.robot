#*** Settings ***
#Documentation   Documentacao da API:     https://fakerestapi.azurewebsites.net/index.html
#Suite Setup     Conectar minha API
#Resource        ResourcesAPIUsers.robot
#
#
#*** Test Cases ***
#
#CT001 - Cadastrar novo usuario(POST)
#    Cadastro novo usuario    10    User 10    Password10
#    Conferir o status code  200
#    Conferir o reason       OK
#    Conferir se retorna todos os dados corretos do usuario cadastrado
#
#CT002 - Buscar usuario criado no CT001(GET)
#    Consultar o usuario
#    Conferir o status code  200
#    Conferir o reason       OK
#
#CT003 - Alterar usuario criado no CT001(PUT)
#    Alterar usuario existente    2    User 2    Password2
#    Conferir o status code  200
#    Conferir o reason       OK
#    Conferir se retorna todos os dados corretos do usuario alterado
#
#CT004 - Deletar usuario criado no CT001(DELETE)
#    Deletar usuario existente
#    Conferir o status code  200
#    Conferir o reason       OK
#
#
##CT001 - Cadastrar novo usuario(POST)
##    Cadastrar um novo usuario   Manuel
##    Conferir o status code  201
##    Conferir o reason       Created
##    Conferir se retorna todos os dados corretos do usuaio   Manuel  manuel@manuelfoiproceu.com.br   timmaiaehmelhor
#
#
##CT000 - Listar usuarios
##    Requisitar todos os usuarios
##    Conferir o status code  200
##    Conferir o reason       OK
##    Conferir se retorna uma lista com "200" livros
#
#
#
##CT001 - Cadastrar novo usuario(POST)
##    Cadastrar um novo usuario
##    Conferir o status code  201
##    Conferir o reason       Created
##    Conferir se retorna todos os dados corretos do livro    743 André QA
#
#
#
#
#
#
#
#
##
##
#
##
##
#
##
##CT004 - Alterar um livro(PUT)
##    Alterar livro existente 743
##    Conferir o status code  200
##    Conferir o reason       OK
##    Conferir se retorna todos os dados corretos do livro    743
##
##
##CT005 - Deletar um livro(DELETE)
##    Deletar livro existente 52687563
##    Conferir o status code  200
##    Conferir o reason       OK
#
#
#
#
#
#
#
#
#
#
#
#
#
#
