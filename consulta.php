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
    <form action="consulta-vali.php" method="post">  
      
      <table>
        <tr>
            <td>Consulta</td>
            
            </tr>
            <tr>
            <td>id</td>
            <td>Data</td>
            <td>Hora</td>
            <td>Diagnostico</td>
            <td>Médico</td>
            <td>Paciente</td>
            <td><button formaction="./create-cons.php">create</button></td>
        </tr>
        <?php
        $db = new SQLite3("hosp.db");
        $db->exec("PRAGMA foreign_keys = ON");
        $results = $db->query("SELECT * FROM consultas");
        while ($row = $results->fetchArray(SQLITE3_ASSOC)) {
          echo "<tr>";
          foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
          }
          echo "<td>";
          echo "<button formaction='./update-cons.php' name='id_consulta' value='" . $row["id_consulta"] . "'>U</button>";
          echo "<button formaction='./delete-cons.php' name='id_consulta' value='" . $row["id_consulta"] . "'>D</button>";
          echo "</td>";
          echo "</tr>";
        }
        $db->close();
        ?>
      </table>
    </form></form>
  </main>
  
</body>

</html>