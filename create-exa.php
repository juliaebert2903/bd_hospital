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
            <td>id_exame</td>
            <td>descricao</td>
            <td>data</td>
            <td>valor</td>
            <td>consulta</td>
            <td>medico</td>
        </tr>
        <?php
        $db = new SQLite3("hosp.db");
        $db->exec("PRAGMA foreign_keys = ON");
        $results = $db->query("PRAGMA table_info(exames)");
        echo "<tr>";
        while ($row = $results->fetchArray(SQLITE3_ASSOC)) {
          echo "<td><input type='text' name='" . $row["name"] . "'></td>";
        }
        echo "<td>";
        echo "<button formaction='./create2-exa.php'>create</button>";
        echo "</td>";
        echo "</tr>";
        $db->close();
        ?>
      </table>
    </form>
  </main>
</body>

</html>