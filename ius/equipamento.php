<?php
	//classe com os métodos relativos aos usuarios que não estão declarados em CRUD e com a implementação dos métodos abstratos

	require_once('classes/CRUD.php');

	class Equipamentos extends CRUD{

		protected $tabela = 'equipamento';

		//variáveis que armazenarão os dados a serem inseridos.

		
		private $nome;
		private $cod_patrimonial;
		private $descricao;


		//setters das variáveis globais. A classe não terá getters, pois, como se conecta com o banco, pega os valores direto dele
		public function setId($id){
			$this->id = $id;
		}
		

		public function setNome($nome){
			$this->nome = $nome;
		}

		public function setCod_patrimonial($cod_patrimonial){
			$this->cod_patrimonial = $cod_patrimonial;
		}


		public function setDescricao($descricao){
			$this->descricao = $descricao;
		}

		public function insert(){
			$sql 	= "INSERT INTO $this->tabela (nome, cod_patrimonial, descricao) VALUES (:nome,:cod_patrimonial,:descricao)";
			$stmt 	= BD::prepare($sql);
			//usa-se $this->id e não $id porque se está acessando uma variável global
			
			$stmt->bindParam(':nome', 	$this->nome);
			$stmt->bindParam(':cod_patrimonial',	$this->cod_patrimonial);
			$stmt->bindParam(':descricao',	$this->descricao);
			return $stmt->execute();

		}

		public function update($id){
			$sql	= "UPDATE $this->tabela SET nome = :nome, cod_patrimonial = :cod_patrimonial, descricao = :descricao WHERE id = :id";
			$stmt 		= BD::prepare($sql);

			
			$stmt->bindParam(':nome', 	$this->nome);
			$stmt->bindParam(':cod_patrimonial',	$this->cod_patrimonial);
			$stmt->bindParam(':descricao',	$this->descricao);
			$stmt->bindParam(':id', $id);
			return $stmt->execute();

		}

	
		

		
	}
?>
