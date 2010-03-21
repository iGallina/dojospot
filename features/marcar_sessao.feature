# language: pt
Funcionalidade: Propor uma sessão de dojo

	Para poder convidar pessoas
	Como um participante
	Eu quero propor uma sessão de dojo
	
	Cenário: Não existem sessões marcadas
		
		Dado que não existem sessões marcadas
		E que eu estou na "página inicial"
		Então eu devo ver "Nenhuma sessão marcada" 
		
	Cenário: Iniciando a marcação de uma nova sessão
		
		Dado que eu estou na "página inicial"
		Quando eu clico em "marcar uma nova sessão"
		Então eu devo estar na página de nova sessão
		
	Cenário: Propondo uma sessão
	
		Dado que não existem sessões marcadas
		E eu estou na página de nova sessão
		Quando eu preencho a proposta de sessão com título, texto, local, data, e horario
		E eu aperto "propor sessão"
		Então eu devo estar na página inicial
		E eu devo ver a sessão proposta com título, texto, local, data e horario informados