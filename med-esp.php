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
      border: 1px solid blue;
      text-align: center;
      background-color: lightcyan;
    }
    
  </style>
</head>

<body>
  <main>
    <form method="post">
      <table>
            <tr>
            <td>Médico</td>
            <td>Especialidade</td>
            <td><button formaction="./create-mes.php">create</button></td>
        </tr>
        <?php
        $db = new SQLite3("hosp.db");
        $db->exec("PRAGMA foreign_keys = ON");
        $results = $db->query("SELECT * FROM medicos_especialidades");
        while ($row = $results->fetchArray(SQLITE3_ASSOC)) {
          echo "<tr>";
          foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
          }
          echo "<td>";
          echo "<button formaction='./update-mes.php' name='id_especialidade' value='" . $row["id_especialidade"] . "'>U</button>";
          echo "<button formaction='./delete-mes.php' name='id_especialidade' value='" . $row["id_especialidade"] . "'>D</button>";
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