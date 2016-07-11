<?php
//Include do menu e do rodapé que devem estar presentes em todas as páginas
include 'menu-rodape.php';

function __autoload($class_name){
		require_once 'classes/' . $class_name . '.php';
	}

	require_once 'ius/equipamento.php'; //nesse arquivo estão o insert e o update do equipamento, criem os arquivos de vocês adaptando as classes dele. Na pasta ius devem estar os arquivos que realizam insert e update

?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cadastro de Equipamentos -  Sistema de Agendamento e Estoque FATEC </title>



<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
<link href="css-extra/cad_equipamentos.css" rel="stylesheet">

<!-- Para compatibilidade com o IE -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
<?php
	
		$equipamento = new Equipamentos();

		if(isset($_POST['cadastrar'])):

			$nome  = $_POST['nome'];
			$cod_patrimonial = $_POST['cod_patrimonial'];
			$descricao = $_POST['descricao'];

			$equipamento->setNome($nome);
			$equipamento->setCod_patrimonial($cod_patrimonial);
			$equipamento->setDescricao($descricao);

			# Insert
			if($equipamento->insert()){
				echo "<script>alert('Atualizado com sucesso!');</script>";
			}

		endif;

		?>

<?php 
		if(isset($_POST['atualizar'])):

			$id = $_POST['id'];
			$nome = $_POST['nome'];
			$cod_patrimonial = $_POST['cod_patrimonial'];
			$descricao = $_POST['descricao'];

			$equipamento->setNome($nome);
			$equipamento->setCod_patrimonial($cod_patrimonial);
			$equipamento->setDescricao($descricao);

			if($equipamento->update($id)){
				echo "<script>alert('Atualizado com sucesso!');</script>";
			}

		endif;
		?>

		<?php
		if(isset($_GET['acao']) && $_GET['acao'] == 'deletar'):

			$id = (int)$_GET['id'];
			if($equipamento->deletaID($id)){
				echo "<script> alert('Deletado com sucesso!');</script>";
			}

		endif;
		?>

		<?php
		if(isset($_GET['acao']) && $_GET['acao'] == 'editar'){

			$id = (int)$_GET['id'];
			$resultado = $equipamento->buscaID($id);
			
		?>

		

<div class="container">
<div class="col-md-10 col-md-offset-1">
<!-- Painel do formulário -->
<div class="panel panel-default">
<div class="panel-heading"><h4>Formulário de Cadastro de Equipamentos</h4>

</div>

<div class="panel-body">




<!--formulário-->
<form class="" action="" method="post">

<div class="row">
<!--Esse conteúdo ocupa 8 de 12 col -->
<div class="col-md-8 ">


<div class="form-group">
<label for="NomeEquipamento">Nome</label>
<input type="text" class="form-control" id="NomeEquipamento" name="nome" value="<?php echo $resultado->nome; ?>" placeholder="Nome do Equipamento">
</div> <!--/ form-group -->
</div> <!--/ col-md-8 -->

<div class="col-md-4">

<div class="form-group">
<label for="CodigoPatrimonial">Código Patrimonial</label>
<input type="text" class="form-control" id="CodigoPatrimonial" name="cod_patrimonial" value="<?php echo $resultado->cod_patrimonial; ?>" placeholder="Código Patrimonial do Equipamento">
</div><!--/ form-group -->
</div><!--/ col-md-4 -->
</div><!--/ row -->

<div class="form-group">
<label for="DescricaoEquipamento">Descrição</label>
<input type="text" class="form-control" name="descricao" value="<?php echo $resultado->descricao; ?>" placeholder="Descrição">
</div><!--/ form-group -->

<input type="hidden" name="id" value="<?php echo $resultado->id; ?>">

<div class="row">
<div class="col-md-1">

<button type="" class="btn btn-default">Cancelar</button>

</div><!--/ col-md-4 -->

<div class="col-md-1 col-md-offset-9">

<button type="submit" class="btn btn-success salvar" name="atualizar" value="Atualizar dados" ><b>Salvar</b></button>
</div><!--/ col-md-1 -->
</div><!--/ row -->

</form>
</div><!--/ panel-body -->
</div><!--/ panel -->

</div><!--/ col-md-10 -->


<?php }else{ ?>

<div class="container">
<div class="col-md-10 col-md-offset-1">
<!-- Painel do formulário -->
<div class="panel panel-default">
<div class="panel-heading"><h4>Formulário de Cadastro de Equipamentos</h4>

</div>

<div class="panel-body">




<!--formulário-->
<form class="" action="" method="post">

<div class="row">
<!--Esse conteúdo ocupa 8 de 12 col -->
<div class="col-md-8 ">


<div class="form-group">
<label for="NomeEquipamento">Nome</label>
<input type="text" class="form-control" id="NomeEquipamento" name="nome" placeholder="Nome do Equipamento">
</div> <!--/ form-group -->
</div> <!--/ col-md-8 -->

<div class="col-md-4">

<div class="form-group">
<label for="CodigoPatrimonial">Código Patrimonial</label>
<input type="text" class="form-control" id="CodigoPatrimonial" name="cod_patrimonial" placeholder="Código Patrimonial do Equipamento">
</div><!--/ form-group -->
</div><!--/ col-md-4 -->
</div><!--/ row -->

<div class="form-group">
<label for="DescricaoEquipamento">Descrição</label>
<input type="text" class="form-control descricao" id="descricao" name="descricao" value="" placeholder="Descrição">
</div><!--/ form-group -->
<div class="row">
<div class="col-md-1">

<button type="" class="btn btn-default">Cancelar</button>

</div><!--/ col-md-4 -->

<div class="col-md-1 col-md-offset-9">

<button type="submit" name="cadastrar" class="btn btn-success salvar" ><b>Salvar</b></button>
</div><!--/ col-md-1 -->
</div><!--/ row -->

</form>
</div><!--/ panel-body -->
</div><!--/ panel -->

</div><!--/ col-md-10 -->

<?php } ?>

		<table class="table table-hover">
			
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Cod. Patrimonial</th>
					<th>Descrição</th>
					
				</tr>
			</thead>
			
			<?php foreach($equipamento->buscaGeral() as $key => $value): ?>

			<tbody>
				<tr>
					<td><?php echo $value->id; ?></td>
					<td><?php echo $value->nome; ?></td>
					<td><?php echo $value->cod_patrimonial; ?></td>
					<td><?php echo $value->descricao; ?></td>
					<td>
						<?php echo "<a href='cad_equipamentos.php?acao=editar&id=" . $value->id . "'>Editar</a>"; ?>
						<?php echo "<a href='cad_equipamentos.php?acao=deletar&id=" . $value->id . "' onclick='return confirm(\"Deseja realmente deletar?\")'>Deletar</a>"; ?>
					</td>
				</tr>
			</tbody>

			<?php endforeach; ?>

		</table>





 
</div><!--/ container-->

<!-- jQuery (não apagar) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
