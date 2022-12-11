<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <title>Document</title> -->
  <style>
    body {
      margin: unset;
    }

    main {
      height: 100vh;
      display: grid;
      place-items: center;
    }

    table,
    td {
      border: 1px solid black;
    }
  </style>
</head>

<body>
  <main>
    <form method="post">
      <table>
        <tr>
            <td>cnpj</td>
            <td>Nome</td>
            <td>Endereço</td>
        </tr>
        <?php
        $db = new SQLite3("hosp.db");
        $db->exec("PRAGMA foreign_keys = ON");
        $results = $db->query("SELECT * FROM hospital WHERE cnpj =" . $_POST["cnpj"]);
        while ($row = $results->fetchArray(SQLITE3_ASSOC)) {
          echo "<tr>";
          foreach ($row as $key => $value) {
          $key == "cnpj";
          echo "<td><input type='text' name='" . $key . "' value='" . $value . "'></td>";
          }
          echo "<td>";
          echo "<button formaction='./update2-hosp.php' name='cnpj' value='" . $row["cnpj"] . "'>update</button>";
          echo "</td>";
          echo "</tr>";
        }
        $db->close();
        ?>
      </table>
    </form>
  </main>
</body>

</html>