<?php
	$pdo = new PDO('mysql:host=localhost;dbname=e-commerce','root');
	try {
		$pdo = new PDO('mysql:host=localhost;dbname=e-commerce','root');
	} catch (Exception $e) {
		$errors[] = "Erreur de connexion à la bdd {$e->getMessage()}";
	}
?>