<?php
session_start();
include_once '../clases/Conexion.php';

    $acta  = filter_input(INPUT_POST, 'acta');
?>

    <select class="form-control select2" style="width: 35%;" name="responsable" id="responsable" required>
                                        <option value="-1">-- Seleccione --</option>
                                        <?php
                                                try {
                                                    $sql = "SELECT DISTINCT
                                                    pe.id_persona,
                                                    CONCAT_WS(' ', pe.nombres, pe.apellidos) nombres
                                                FROM
                                                    tbl_participantes t1
                                                INNER JOIN tbl_personas pe ON
                                                    pe.id_persona = t1.id_persona
                                                INNER JOIN tbl_reunion r ON
                                                    r.id_reunion = t1.id_reunion
                                                    INNER JOIN tbl_acta t2 ON t2.id_reunion = r.id_reunion
                                                WHERE
                                                    t2.id_acta = $acta";
                                                    $resultado = $mysqli->query($sql);
                                                    while ($resp= $resultado->fetch_assoc()) { ?>
                                                        <option value="<?php echo $resp['id_persona']; ?>">  
                                                            <?php echo $resp['nombres']; ?>
                                                        </option>
                                                <?php }
                                                } catch (Exception $e) {
                                                    echo "Error: " . $e->getMessage();
                                                }
                                                ?>                                    
    </select>