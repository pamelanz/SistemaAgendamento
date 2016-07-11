<?php
	//classe com os métodos relativos aos usuarios que não estão declarados em CRUD e com a implementação dos métodos abstratos

	require_once('CRUD.php');

	class Usuario extends CRUD{

		protected $tabela = 'usuario';

		//variáveis que armazenarão os dados a serem inseridos.

		private $id;
		private $nome;
		private $login;
		private $senha;
		private $id_instituicao;
		private $cargo;
		private $email;
		private $observacao;

		public function insert(){
			$sql 	= "INSERT INTO $this->tabela VALUES :id,:nome,:login,:senha,:id_instituicao,:senha";
			$stmt 	= BD::prepare($sql);
			//usa-se $this->id e não $id porque se está acessando uma variável global
			$stmt->bindParam(':id', 	$this->id);
			$stmt->bindParam(':nome', 	$this->nome);
			$stmt->bindParam(':login',	$this->login);
			$stmt->bindParam('senha',	$this->senha);
			$stmt->bindParam(':id_instituicao',	$this->id_instituicao);
			$stmt->bindParam(':cargo',	$this->cargo);
			$stmt->bindParam(':email',	$this->email);
			$stmt->bindParam(':observacao',	$this->observacao);

		}

		public function update(){
			$sql	 	= "UPDATE $this->tabela SET nome = :nome, login = :login, senha = :senha, id_instituicao = :id_instituicao, cargo =:cargo, email =:email, observacao =:observacao WHERE id = :id";
			$stmt 		= BD::prepare($sql);

			$stmt->bindParam(':id', 	$this->id);
			$stmt->bindParam(':nome', 	$this->nome);
			$stmt->bindParam(':login',	$this->login);
			$stmt->bindParam('senha',	$this->senha);
			$stmt->bindParam(':id_instituicao',	$this->id_instituicao);
			$stmt->bindParam(':cargo',	$this->cargo);
			$stmt->bindParam(':email',	$this->email);
			$stmt->bindParam(':observacao',	$this->observacao);

		}

		//função que realiza o login do usuario no sistema. Possui um parâmetro senha, pois precisa comparar a string em texto plano com a senha criptografada no banco e a variável global $senha, só recebe o valor já criptografado.

		public function login($senha){



			//chama a função "buscaid" da classe mãe e armazena seu valor em uma variável
			$valor = parent::buscaid($id);
			//se a variável não estiver vazia, verifica se a senha em texto plano bate com a senha criptografada(hash) no banco
			if(!empty($valor)){
				$hash = $valor->senha;
				//função que compara a string em texto plano e a hash
				if(password_verify($senha,$hash)){
					//se os valores baterem, a função retorna o id do usuario, que será passado para a próxima tela
					return $valor->id;
				}
				else{
					return false;
				}
			}
			else{
				return false;
			}
		}

		//setters das variáveis globais. A classe não terá getters, pois, como se conecta com o banco, pega os valores direto dele

		public function setId($id){
			$this->id = $id;
		}

		public function setNome($nome){
			$this->nome = $nome;
		}

		public function setLogin($login){
			$this->login = $login;
		}

		public function setSenha($senha){
			//atribui à variável global "senha", o valor criptorafado da senha cadastrada pelo usuário
			$this->senha = password_hash($senha,PASSWORD_DEFAULT);
		}

		public function setId_instituicao($id_instituicao){
			$this->id_instituicao = $id_instituicao;
		}

		public function setCargo($cargo){
			$this->cargo = $cargo;
		}

		public function setEmail($email){
			$this->email = $email;
		}

		public function setObservacao($observacao){
			$this->observacao = $observacao;
		}
	}
?>
