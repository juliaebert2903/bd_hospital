<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM exames WHERE id_exame = " . $_POST["id_exame"]);
$db->close();
header("Location: /exame.php");
