-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2021 at 04:33 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `automatizacion`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_docente` (IN `_id_supervisor` INT, IN `_id_docente` INT)  BEGIN
START TRANSACTION;
set @nombre_docente =(select nombres from tbl_personas where id_persona=_id_docente);
UPDATE tbl_practica_estudiantes SET docente_supervisor = @nombre_docente WHERE id_persona=_id_supervisor;

COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_aldeas` (IN `nombre_` VARCHAR(80), IN `codigo_` INT, IN `creado_por_` VARCHAR(80), IN `id_municipio_` BIGINT)  BEGIN
INSERT INTO tbl_aldeas_caserios_hn(nombre_aldea_caserio, codigo, fecha_creacion, creado_por, id_municipio) 
VALUES (nombre_, codigo_, SYSDATE(), creado_por_, id_municipio_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_prueba` (IN `dias` VARCHAR(50))  INSERT INTO tbl_carga_dias(dias) VALUES 
('dias')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_estudiantes` (IN `cod_usuario` BIGINT(16), IN `nombres` VARCHAR(255), IN `apellidos` VARCHAR(255), IN `numero_cuenta` BIGINT(16), IN `correo_electronico` VARCHAR(255), IN `identidad` INT(13), IN `telefono` INT(8))  BEGIN
START TRANSACTION;
INSERT INTO `tbl_telefonos`
(
`telefono`
)
VALUES
(
telefono
);
SELECT @cod_telefono := MAX(id_telefono) FROM `tbl_telefonos`;
insert into `tbl_estudiantes`(
`id_telefono`,
`nombres`,
`apellidos`,
`numero_cuenta`,
`correo_electronico`,
`id_usuario`,
`fecha_creacion`,
`identidad`
)
values
(
@cod_telefono,
nombres,
apellidos,
numero_cuenta,
correo_electronico,
cod_usuario,
now(),
identidad
);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_himno` (IN `ncuenta` BIGINT(20), IN `id` BIGINT(10))  BEGIN
START TRANSACTION;
/*###################################*/
SELECT @id_persona := id_persona, @id_horario := hh.id_horario_himno
FROM tbl_personas p, tbl_horario_himno hh
WHERE P.documento = ncuenta
AND hh.id_horario_himno = id;
/*###################################*/
insert into `tbl_alumnos_himno`(
`id_persona`,
`aprobado`,
`Fecha_creacion`,
`id_horario_himno`
)
values
(
@id_persona,
'desaprobado',
now(),
@id_horario
);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_primera_visita` (IN `cuenta` VARCHAR(255), IN `comentario` VARCHAR(255), IN `nombre` VARCHAR(255), IN `lugar` VARCHAR(255), IN `numero` VARCHAR(255), IN `funciones_an` VARCHAR(255), IN `funciones_di` VARCHAR(255), IN `funciones_re` VARCHAR(255), IN `funciones_ca` VARCHAR(255), IN `funciones_se` VARCHAR(255), IN `funciones_au` VARCHAR(255), IN `funciones_ba` VARCHAR(255), IN `funciones_so` VARCHAR(255), IN `funciones_pr` VARCHAR(255), IN `comunicacion` VARCHAR(255), IN `puntualidad` VARCHAR(255), IN `responsabilidad` VARCHAR(255), IN `creatividad` VARCHAR(255), IN `presentacion` VARCHAR(255), IN `atencion` VARCHAR(255), IN `colaborativo` VARCHAR(255), IN `trabajo` VARCHAR(255), IN `proactivo` VARCHAR(255), IN `relacion` VARCHAR(255), IN `analisis` VARCHAR(255), IN `diseno` VARCHAR(255), IN `programador` VARCHAR(255), IN `mantenimiento` VARCHAR(255), IN `aspecto_a` VARCHAR(255), IN `aspecto_s` VARCHAR(255))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona FROM tbl_personas_extendidas
WHERE valor = cuenta;
INSERT INTO `tbl_comentarios_alumnos`
(
`id_persona`,
`comentario_evaluacion`,
`nombre_representante`,
`lugar`,
`fecha`,
`numero_visita`
)
VALUES
(
@id_persona,
comentario,
nombre,
lugar,
now(),
numero
);
INSERT INTO `tbl_funciones_practica`
(
`id_persona`,
`funciones_analisis`,
`funciones_diseno`,
`funciones_redes`,
`funciones_capacitacion`,
`funciones_seguridad`,
`funciones_auditoria`,
`funciones_base`,
`funciones_soporte`,
`funciones_programacion`,
`numero_visita`
)
VALUES
(
@id_persona,
funciones_an,
funciones_di,
funciones_re,
funciones_ca,
funciones_se,
funciones_au,
funciones_ba,
funciones_so,
funciones_pr,
numero
);
INSERT INTO `tbl_evaluaciones_practica`
(
`id_persona`,
`comunicacion`,
`puntualidad`,
`responsabilidad`,
`creatividad`,
`presentacion`,
`atencion_cliente`,
`colaborativo`,
`trabajo_equipo`,
`proactivo_iniciativa`,
`relacion_interpersonal`,
`analisis_sistema`,
`diseno_aplicacion`,
`programador_aplicacion`,
`mantenimiento_aplicacion`,
`aspecto_auditoria`,
`aspecto_seguridad`,
`numero_visita`
)
VALUES
(
@id_persona,
comunicacion,
puntualidad,
responsabilidad,
creatividad,
presentacion,
atencion,
colaborativo,
trabajo,
proactivo,
relacion,
analisis,
diseno,
programador,
mantenimiento,
aspecto_a,
aspecto_s,
numero
);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_segunda_visita` (IN `cuenta` VARCHAR(255), IN `comentario` VARCHAR(255), IN `area` VARCHAR(255), IN `calificacion` VARCHAR(255), IN `solicitar` VARCHAR(255), IN `oportunidad` VARCHAR(255), IN `nombre` VARCHAR(255), IN `lugar` VARCHAR(255), IN `numero` VARCHAR(255), IN `asistencia` VARCHAR(255), IN `horario` VARCHAR(255), IN `adaptacion` VARCHAR(255), IN `cumplimiento` VARCHAR(255), IN `calidad` VARCHAR(255), IN `percepcion_c` VARCHAR(255), IN `percepcion_h` VARCHAR(255))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona FROM tbl_personas_extendidas
WHERE valor = cuenta;
INSERT INTO `tbl_comentarios_alumnos`
(
`id_persona`,
`comentario_evaluacion`,
`area_refuerzo`,
`calificacion_global`,
`solicitar_practicante`,
`oportunidad_empleo`,
`nombre_representante`,
`lugar`,
`fecha`,
`numero_visita`
)
VALUES
(
@id_persona,
comentario,
area,
calificacion,
solicitar,
oportunidad,
nombre,
lugar,
now(),
numero
);
INSERT INTO `tbl_desempeno_practica`
(
`id_persona`,
`asistencia_practicante`,
`horario_practicante`,
`adaptacion_practicante`,
`cumplimiento_practicante`,
`calidad_trabajo_practicante`,
`percepcion_conocimiento`,
`percepcion_habilidades`,
`numero_visita`
)
VALUES
(
@id_persona,
asistencia,
horario,
adaptacion,
cumplimiento,
calidad,
percepcion_c,
percepcion_h,
numero
);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_unica_visita` (IN `cuenta` VARCHAR(255), IN `comentario` VARCHAR(255), IN `area` VARCHAR(255), IN `calificacion` VARCHAR(255), IN `solicitar` VARCHAR(255), IN `oportunidad` VARCHAR(255), IN `nombre` VARCHAR(255), IN `lugar` VARCHAR(255), IN `numero` VARCHAR(255), IN `funciones_an` VARCHAR(255), IN `funciones_di` VARCHAR(255), IN `funciones_re` VARCHAR(255), IN `funciones_ca` VARCHAR(255), IN `funciones_se` VARCHAR(255), IN `funciones_au` VARCHAR(255), IN `funciones_ba` VARCHAR(255), IN `funciones_so` VARCHAR(255), IN `funciones_pr` VARCHAR(255), IN `comunicacion` VARCHAR(255), IN `puntualidad` VARCHAR(255), IN `responsabilidad` VARCHAR(255), IN `creatividad` VARCHAR(255), IN `presentacion` VARCHAR(255), IN `atencion` VARCHAR(255), IN `colaborativo` VARCHAR(255), IN `trabajo` VARCHAR(255), IN `proactivo` VARCHAR(255), IN `relacion` VARCHAR(255), IN `analisis` VARCHAR(255), IN `diseno` VARCHAR(255), IN `programador` VARCHAR(255), IN `mantenimiento` VARCHAR(255), IN `aspecto_a` VARCHAR(255), IN `aspecto_s` VARCHAR(255), IN `asistencia` VARCHAR(255), IN `horario` VARCHAR(255), IN `adaptacion` VARCHAR(255), IN `cumplimiento` VARCHAR(255), IN `calidad` VARCHAR(255), IN `percepcion_c` VARCHAR(255), IN `percepcion_h` VARCHAR(255))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona FROM tbl_personas_extendidas
WHERE valor = cuenta;
INSERT INTO `tbl_comentarios_alumnos`
(
`id_persona`,
`comentario_evaluacion`,
`area_refuerzo`,
`calificacion_global`,
`solicitar_practicante`,
`oportunidad_empleo`,
`nombre_representante`,
`lugar`,
`fecha`,
`numero_visita`
)
VALUES
(
@id_persona,
comentario,
area,
calificacion,
solicitar,
oportunidad,
nombre,
lugar,
now(),
numero
);
INSERT INTO `tbl_funciones_practica`
(
`id_persona`,
`funciones_analisis`,
`funciones_diseno`,
`funciones_redes`,
`funciones_capacitacion`,
`funciones_seguridad`,
`funciones_auditoria`,
`funciones_base`,
`funciones_soporte`,
`funciones_programacion`,
`numero_visita`
)
VALUES
(
@id_persona,
funciones_an,
funciones_di,
funciones_re,
funciones_ca,
funciones_se,
funciones_au,
funciones_ba,
funciones_so,
funciones_pr,
numero
);
INSERT INTO `tbl_evaluaciones_practica`
(
`id_persona`,
`comunicacion`,
`puntualidad`,
`responsabilidad`,
`creatividad`,
`presentacion`,
`atencion_cliente`,
`colaborativo`,
`trabajo_equipo`,
`proactivo_iniciativa`,
`relacion_interpersonal`,
`analisis_sistema`,
`diseno_aplicacion`,
`programador_aplicacion`,
`mantenimiento_aplicacion`,
`aspecto_auditoria`,
`aspecto_seguridad`,
`numero_visita`
)
VALUES
(
@id_persona,
comunicacion,
puntualidad,
responsabilidad,
creatividad,
presentacion,
atencion,
colaborativo,
trabajo,
proactivo,
relacion,
analisis,
diseno,
programador,
mantenimiento,
aspecto_a,
aspecto_s,
numero
);
INSERT INTO `tbl_desempeno_practica`
(
`id_persona`,
`asistencia_practicante`,
`horario_practicante`,
`adaptacion_practicante`,
`cumplimiento_practicante`,
`calidad_trabajo_practicante`,
`percepcion_conocimiento`,
`percepcion_habilidades`,
`numero_visita`
)
VALUES
(
@id_persona,
asistencia,
horario,
adaptacion,
cumplimiento,
calidad,
percepcion_c,
percepcion_h,
numero
);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_actividades` (IN `actividad_` VARCHAR(150), IN `descripcion_` VARCHAR(50), IN `nombre_proyecto_` VARCHAR(50), IN `horas_semanales_` VARCHAR(50), IN `id_comisiones_` BIGINT, IN `Usuario_` VARCHAR(50), IN `id_actividad_` VARCHAR(50))  BEGIN
UPDATE tbl_actividades SET   actividad=actividad_, descripcion=descripcion_, nombre_proyecto=nombre_proyecto_, horas_semanales=horas_semanales_ ,id_comisiones=id_comisiones_,  Fecha_modificación=sysdate() , Modificado_por=Usuario_ WHERE id_actividad= id_actividad_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_area` (IN `area_` VARCHAR(50), IN `id_area_` INT)  BEGIN
UPDATE tbl_areas SET area = area_, descripcion = area_ WHERE id_area = id_area_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_asistencia_charla` (IN `Id_charla_` BIGINT, IN `jornada_` VARCHAR(50), IN `asistencia_` INT, IN `fecha_recibida_` DATE)  BEGIN
update tbl_charla_practica set fecha_recibida=fecha_recibida_,estado_asistencia_charla=asistencia_, fecha_valida=(select DATE_ADD(fecha_recibida_,INTERVAL (select valor from tbl_parametros where parametro="DIAS_CHARLA") DAY))
where Id_charla=Id_charla_ and jornada=jornada_;
update tbl_charla_practica set charla_impartida=1 where fecha_recibida=fecha_recibida_;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_atributo` (IN `atributo_` VARCHAR(50), IN `requerido_` VARCHAR(50), IN `id_tipo_persona_` INT, IN `Usuario_` VARCHAR(50), IN `id_atributos_` VARCHAR(50))  BEGIN
UPDATE tbl_atributos SET   atributo=atributo_, requerido=requerido_, id_tipo_persona=id_tipo_persona_,  Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_atributos= id_atributos_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_aula` (IN `codigo_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `capacidad_` INT, IN `id_edificio_` INT, IN `id_tipo_aula_` INT, IN `Usuario_` VARCHAR(50), IN `id_aula_` INT)  BEGIN
UPDATE tbl_aula SET  id_aula=id_aula_, codigo=codigo_, descripcion=descripcion_, capacidad=capacidad_, id_edificio=id_edificio_ ,id_tipo_aula=id_tipo_aula_,  Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_aula= id_aula_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_cambio_empresa_estudiante_practica` (IN `cuenta_` VARCHAR(255))  BEGIN
UPDATE tbl_subida_documentacion set estado_vinculacion=3 , estado_coordinacion=null where Id_usuario=(select Id_usuario from tbl_usuarios where numero_cuenta=cuenta_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_carga_academica` (IN `control_` VARCHAR(50), IN `seccion_` VARCHAR(50), IN `hora_inicial_` VARCHAR(50), IN `hora_final_` VARCHAR(50), IN `num_alumnos_` INT, IN `id_aula_` BIGINT, IN `id_asignatura_` BIGINT, IN `dias_` VARCHAR(50), IN `id_modalidad_` BIGINT, IN `id_carga_academica_` BIGINT)  BEGIN
UPDATE tbl_carga_academica
SET 
control=control_,
seccion=seccion_,
hora_inicial=hora_inicial_,
hora_final=hora_final_,
num_alumnos=num_alumnos_,
id_aula=id_aula_,
id_asignatura=id_asignatura_,
dias=dias_,
id_modalidad=id_modalidad_
WHERE id_carga_academica=id_carga_academica_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_carga_academica_virtual` (IN `control_` VARCHAR(50), IN `seccion_` VARCHAR(50), IN `hora_inicial_` VARCHAR(50), IN `hora_final_` VARCHAR(50), IN `num_alumnos_` INT, IN `id_asignatura_` BIGINT, IN `dias_` VARCHAR(50), IN `id_modalidad_` BIGINT, IN `id_carga_academica_` BIGINT)  BEGIN
UPDATE tbl_carga_academica
SET 
control=control_,
seccion=seccion_,
hora_inicial=hora_inicial_,
hora_final=hora_final_,
num_alumnos=num_alumnos_,
id_aula=NULL,
id_asignatura=id_asignatura_,
dias=dias_,
id_modalidad=id_modalidad_
WHERE id_carga_academica=id_carga_academica_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_carrera` (IN `Descripcion_` VARCHAR(50), IN `Id_facultad_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `Id_carrera_` INT)  BEGIN
UPDATE tbl_carrera SET   Descripcion=Descripcion_, Id_facultad=Id_facultad_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_carrera= id_carrera_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_categoria` (IN `categoria_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_categoria_` VARCHAR(50))  BEGIN
UPDATE tbl_categorias SET  categoria=categoria_, descripcion=descripcion_, Fecha_modificacion=SYSDATE(), Modificado_por=Usuario_ WHERE id_categoria= id_categoria_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_clave_x_pregunta` (`contrasena_` VARCHAR(150), `Id_usuario_` INTEGER)  begin
UPDATE tbl_usuarios SET    Contrasena=contrasena_ WHERE Id_usuario=Id_usuario_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_comisiones` (IN `comision_` VARCHAR(50), IN `carrera_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_comisiones_` INT)  begin
UPDATE tbl_comisiones SET   comision=comision_, id_carrera=carrera_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_comisiones= id_comisiones_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_departamento` (IN `departamento_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_departamento_` VARCHAR(50))  BEGIN
UPDATE tbl_departamentos SET   departamento=departamento_,  Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_departamento= id_departamento_ ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_documentos_practica_vinculacion` (IN `cuenta_` VARCHAR(255), IN `vinculacion_` INT, IN `observacion_vinculacion_` VARCHAR(255))  BEGIN
UPDATE `tbl_subida_documentacion` SET `fecha_vinculacion`=sysdate(),`estado_vinculacion`=vinculacion_,`observacion_vinculacion`=observacion_vinculacion_
 WHERE `id_persona`=(SELECT p.id_persona from tbl_personas p, tbl_personas_extendidas px WHERE px.id_persona=p.id_persona and px.valor=cuenta_ );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_edificio` (IN `nombre_` VARCHAR(50), IN `codigo_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_edificio_` VARCHAR(50))  BEGIN
UPDATE tbl_edificios SET   nombre= nombre_, codigo=codigo_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_edificio= id_edificio_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_empresa_practica` (IN `nombre_empresa_` VARCHAR(255), IN `direccion_empresa_` VARCHAR(255), IN `departamento_empresa_` VARCHAR(255), IN `jefe_inmediato_` VARCHAR(255), IN `titulo_jefe_inmediato_` VARCHAR(255), IN `cargo_jefe_inmediato_` VARCHAR(255), IN `correo_jefe_inmediato_` VARCHAR(255), IN `telefono_jefe_inmediato_` VARCHAR(10), IN `id_persona_` BIGINT(16), IN `Id_empresa_` BIGINT(16))  BEGIN
UPDATE tbl_empresas_practica
SET nombre_empresa = nombre_empresa_,
direccion_empresa= direccion_empresa_,
departamento_empresa = departamento_empresa_,
jefe_inmediato = jefe_inmediato_,
titulo_jefe_inmediato =titulo_jefe_inmediato_,
cargo_jefe_inmediato =cargo_jefe_inmediato_,
correo_jefe_inmediato =correo_jefe_inmediato_,
telefono_jefe_inmediato =telefono_jefe_inmediato_,
id_persona=id_persona_
WHERE
Id_empresa = Id_empresa_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_estado_civil` (IN `estado_civil_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_estado_civil_` VARCHAR(50))  begin
UPDATE tbl_estadocivil SET   estado_civil=estado_civil_, descripcion=descripcion_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_estado_civil= id_estado_civil_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_genero` (IN `genero_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_genero_` VARCHAR(50))  BEGIN
UPDATE tbl_genero SET genero=genero_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_genero= id_genero_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_grados_academicos` (IN `grado_academico_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_grado_academico_` BIGINT)  BEGIN
UPDATE tbl_grados_academicos SET  grado_academico=grado_academico_, descripcion=descripcion_,
 Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_grado_academico= id_grado_academico_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_horario_docente` (IN `hora_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `horario_` VARCHAR(50))  BEGIN
UPDATE tbl_hora SET hora=hora_,Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE hora=horario_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_horas` (IN `horas_semanales_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_actividad_` INT)  BEGIN
UPDATE tbl_actividades SET horas_semanales = horas_semanales_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_actividad= id_actividad_; 

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_jornada` (IN `jornada_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_jornada_` INT)  BEGIN
UPDATE tbl_jornadas SET   jornada=jornada_, descripcion=descripcion_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_jornada= id_jornada_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_municipio` (IN `municipio_` VARCHAR(50), IN `codigo_` VARCHAR(50), IN `id_departamento_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_municipio_` INT)  BEGIN
UPDATE tbl_municipios_hn SET   municipio=municipio_, codigo=codigo_, id_departamento=id_departamento_,  Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_municipio= id_municipio_ ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_nacionalidad` (IN `nacionalidad_` VARCHAR(50), IN `PAIS_NAC_` CHAR(50), IN `Usuario_` VARCHAR(50), IN `id_nacionalidad_` VARCHAR(50))  BEGIN
UPDATE tbl_nacionalidad SET nacionalidad=nacionalidad_, PAIS_NAC=PAIS_NAC_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_nacionalidad= id_nacionalidad_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_periodo_carga` (IN `fecha_inicio_` DATE, IN `fecha_final_` DATE, IN `Usuario_` VARCHAR(50), IN `id_tipo_periodo_` INT, IN `fecha_adic_canc_` DATE, IN `fecha_desbloqueo_` DATE, IN `num_periodo_` BIGINT, IN `num_anno_` YEAR, IN `id_periodo_` BIGINT)  BEGIN
UPDATE tbl_periodo SET fecha_inicio = fecha_inicio_, fecha_final = fecha_final_, 
Fecha_modificacion=sysdate() , Modificado_por = Usuario_, id_tipo_periodo = id_tipo_periodo_, fecha_adic_canc = fecha_adic_canc_, fecha_desbloqueo = fecha_desbloqueo_, num_periodo = num_periodo_, num_anno = num_anno_ WHERE id_periodo= id_periodo_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_periodo_plan` (IN `periodo_` VARCHAR(50), IN `Usuario_` VARCHAR(50), IN `id_periodo_plan_` INT)  begin
UPDATE tbl_periodo_plan SET  periodo=periodo_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_
 WHERE id_periodo_plan= id_periodo_plan_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_permiso_usuario` (IN `insertar_` INT, IN `Modificar_` INT, IN `Eliminar_` INT, IN `Visualizar_` INT, IN `usuario_` VARCHAR(150), IN `id_permiso_` INT)  BEGIN
UPDATE tbl_permisos_usuarios SET   insertar=insertar_ , modificar=Modificar_, eliminar=Eliminar_, visualizar=Visualizar_ , Fecha_modificacion=sysdate() , Modificado_por=usuario_ WHERE Id_permisos_usuario= id_permiso_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_plan_estudio` (IN `nombre_` VARCHAR(50), IN `num_clases_` INT, IN `codigo_plan_` VARCHAR(50), IN `id_tipo_plan_` BIGINT, IN `fecha_modificacion_` DATE, IN `modificado_por_` VARCHAR(50), IN `id_plan_estudio_` BIGINT)  BEGIN
UPDATE tbl_plan_estudio
SET 
nombre=nombre_,
num_clases=num_clases_,
codigo_plan=codigo_plan_,
id_tipo_plan=id_tipo_plan_,
fecha_modificacion=fecha_modificacion_,
modificado_por=modificado_por_
WHERE id_plan_estudio=id_plan_estudio_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_plan_estudio_vigente` (IN `nombre_` VARCHAR(50), IN `num_clases_` INT, IN `codigo_plan_` VARCHAR(50), IN `id_tipo_plan_` BIGINT, IN `fecha_modificacion_` DATE, IN `modificado_por_` VARCHAR(50), IN `plan_vigente_` VARCHAR(50), IN `id_plan_estudio_` BIGINT)  BEGIN

UPDATE tbl_plan_estudio
SET 
nombre=nombre_,
num_clases=num_clases_,
codigo_plan=codigo_plan_,
id_tipo_plan=id_tipo_plan_,
fecha_modificacion=fecha_modificacion_,
modificado_por=modificado_por_,
plan_vigente=plan_vigente_
WHERE id_plan_estudio=id_plan_estudio_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_pregunta` (IN `pregunta` VARCHAR(150), IN `estado` INT, IN `usuario` VARCHAR(100), IN `cod_pregunta` INT)  BEGIN
UPDATE `tbl_preguntas` SET `pregunta`=pregunta,`estado`=estado,`Modificado_por`=usuario,`Fecha_modificacion`=sysdate() WHERE Id_pregunta=cod_pregunta;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_respuesta_seguridad` (IN `Respuesta_` VARCHAR(150), IN `pregunta_` INT(150), IN `Usuario_` INT)  begin
UPDATE tbl_preguntas_seguridad SET Respuesta=Respuesta_
where Id_pregunta=pregunta_ and Id_usuario=usuario_;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_rol` (`Rol_` VARCHAR(150), `Descripcion_` VARCHAR(150), `Estado_` INTEGER, `Usuario_` VARCHAR(150), `Id_rol_` INTEGER)  begin
UPDATE tbl_roles SET   Rol=Rol_, descripcion=Descripcion_, estado=Estado_, Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE Id_rol= Id_rol_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actualizar_usuario` (IN `Usuario_` VARCHAR(150), IN `Id_rol_` INT, IN `Modificado_` VARCHAR(150), IN `Id_usuario_` INT, IN `Estado_` INT)  begin
UPDATE tbl_usuarios SET   Usuario=Usuario_, Id_rol=Id_rol_,  Fecha_modificacion=sysdate() , Modificado_por=Modificado_ ,Estado=Estado_  WHERE Id_usuario= Id_usuario_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actulizar_egresado` (IN `tel_fijo_` VARCHAR(13), IN `celular_` VARCHAR(13), IN `correo_personal_` VARCHAR(100), IN `posee_maestria_` VARCHAR(2), IN `maestria_` VARCHAR(100), IN `posee_certificado_` VARCHAR(2), IN `certificado_` VARCHAR(100), IN `labora_` VARCHAR(2), IN `empresa_` VARCHAR(100), IN `departamento_` VARCHAR(100), IN `direccion_` VARCHAR(100), IN `tel_empresa_` VARCHAR(13), IN `correo_profesional_` VARCHAR(130), IN `nombre_` VARCHAR(150), IN `id_egresado_` VARCHAR(20))  BEGIN
UPDATE
tbl_egresados
SET
telefono_egresado = tel_fijo_,
celular_egresado = celular_,
correo_electronico = correo_personal_,
posee_maestria = posee_maestria_,
maestria = maestria_,
posee_certificado = posee_certificado_,
certificado = certificado_,
labora = labora_,
nombre_empresa = empresa_,
departamento_egresado = departamento_,
direccion_empresa = direccion_,
telefono_empresa = tel_empresa_,
correo_profesional = correo_profesional_
WHERE
Id_egresado = Id_egresado_ AND nombre = nombre_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_actulizar_parametro` (`descripcion_` VARCHAR(150), `valor_` VARCHAR(150), `modificado_` VARCHAR(150), `id_parametro_` INTEGER)  begin
UPDATE tbl_parametros SET  Descripcion=descripcion_, Valor=valor_ , Fecha_modificacion=sysdate() , Modificado_por=modificado_ WHERE Id_parametro= id_parametro_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_agregar_especialidad` (IN `par_id_grado_academico` INT, IN `par_especialidad` VARCHAR(100), IN `id_persona_` INT)  BEGIN

INSERT INTO tbl_especialidad_grado (ID_GRADO_ACADEMICO,ESPECIALIDAD) VALUES(par_id_grado_academico,par_especialidad);
SET @id_especialidad:=(select id_especialidad FROM  tbl_especialidad_grado where ESPECIALIDAD=par_especialidad);
INSERT INTO tbl_grados_academicos_personas(ID_ESPECIALIDAD,ID_PERSONA) VALUES(@id_especialidad, id_persona_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_aprobacion_practica` (IN `cuenta_` VARCHAR(50), IN `obs_` VARCHAR(255), IN `tipo_` INT, IN `empresa_` VARCHAR(255), IN `horas_pps_` INT, IN `fecha_inicio_` DATE, IN `fecha_finaliza_` DATE)  BEGIN
IF tipo_=1 THEN
UPDATE tbl_subida_documentacion set estado_coordinacion=1, fecha_coordinacion=sysdate(),motivo_coordinacion=obs_ 
where id_persona=(SELECT p.id_persona from tbl_personas p , tbl_personas_extendidas px WHERE  px.id_persona=p.id_persona and px.valor=cuenta_);
update tbl_practica_estudiantes SET horas=horas_pps_, fecha_inicio=fecha_inicio_, fecha_finaliza=fecha_finaliza_ where id_persona=(SELECT p.id_persona from tbl_personas p , tbl_personas_extendidas px WHERE  px.id_persona=p.id_persona and px.valor=cuenta_);
ELSEIF tipo_=0 then
UPDATE tbl_subida_documentacion set estado_coordinacion=0 , fecha_coordinacion=sysdate(), motivo_coordinacion=obs_ 
where id_persona=(SELECT p.id_persona from tbl_personas p , tbl_personas_extendidas px WHERE  px.id_persona=p.id_persona and px.valor=cuenta_);
INSERT INTO `tbl_practica_rechazo`(`id_persona`, `nombre_empresa`, `motivo`, `fecha_creacion`)
 VALUES ((SELECT p.id_persona from tbl_personas p , tbl_personas_extendidas px WHERE  px.id_persona=p.id_persona and px.valor=cuenta_),empresa_,obs_,sysdate());
ELSE
UPDATE tbl_subida_documentacion set estado_coordinacion=NULL, estado_vinculacion=0, fecha_coordinacion=sysdate(), observacion_vinculacion=obs_ 
where id_persona=(SELECT p.id_persona from tbl_personas p , tbl_personas_extendidas px WHERE  px.id_persona=p.id_persona AND  px.valor=cuenta_);
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_count_carga` (IN `id_persona_` INT)  BEGIN
SELECT COUNT(id_persona) AS carga FROM tbl_carga_academica WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_count_preg1` (IN `id_persona_` BIGINT)  BEGIN
SELECT COUNT(id_pref_area_doce) AS registro FROM tbl_pref_area_docen WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_count_preg2` (IN `id_persona_` BIGINT)  BEGIN
SELECT COUNT(id_expe_academi_docente) AS registro FROM tbl_expe_academica_docente WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_count_preg3` (IN `id_persona_` BIGINT)  BEGIN
SELECT COUNT(id_pref_asig_docen) AS registro FROM tbl_pref_asig_docen WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_count_preg4` (IN `id_persona_` BIGINT)  BEGIN
SELECT COUNT(id_desea_asig_doce) AS registro FROM tbl_desea_asig_doce WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_actividades` (IN `actividad_` VARCHAR(50))  BEGIN
DELETE FROM tbl_actividades WHERE actividad = actividad_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_area` (IN `id_area_` INT)  BEGIN
DELETE FROM tbl_areas WHERE id_area = id_area_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_atributo` (IN `atributo_` VARCHAR(50))  BEGIN
DELETE FROM tbl_atributos WHERE atributo = atributo_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_aula` (IN `id_aula_` INT)  BEGIN
DELETE FROM tbl_aula WHERE id_aula = id_aula_; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_carga_academica` (IN `id_carga_academica_` BIGINT)  BEGIN
DELETE FROM tbl_carga_academica WHERE id_carga_academica =id_carga_academica_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_carrera` (IN `Descripcion_` VARCHAR(50))  BEGIN
DELETE FROM tbl_carrera WHERE Descripcion = Descripcion_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_categoria` (IN `categoria_` VARCHAR(50))  BEGIN
DELETE FROM tbl_categorias WHERE categoria = categoria_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_comision` (IN `comision_` VARCHAR(50))  BEGIN
DELETE FROM tbl_comisiones WHERE comision = comision_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_departamento` (IN `departamento_` VARCHAR(50))  BEGIN
DELETE FROM tbl_departamentos WHERE departamento = departamento_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_edificio` (IN `nombre_` VARCHAR(50))  BEGIN
DELETE FROM tbl_edificios WHERE nombre = nombre_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_estado_civil` (IN `estado_civil_` VARCHAR(50))  BEGIN
DELETE FROM tbl_estadocivil WHERE estado_civil = estado_civil_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_genero` (IN `genero_` VARCHAR(50))  BEGIN
DELETE FROM tbl_genero WHERE genero = genero_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_grados_academicos` (IN `grado_academico_` VARCHAR(50))  BEGIN
DELETE FROM tbl_grados_academicos WHERE grado_academico = grado_academico_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_horario_docente` (IN `hora_` INT)  BEGIN
DELETE FROM tbl_hora WHERE hora = hora_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_jornada` (IN `jornada` VARCHAR(50))  BEGIN
DELETE FROM tbl_jornadas WHERE jornada = jornada_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_municipio` (IN `municipio_` VARCHAR(50))  BEGIN
DELETE FROM tbl_municipios_hn WHERE municipio = municipio_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_nacionalidad` (IN `nacionalidad_` VARCHAR(50))  BEGIN
DELETE FROM tbl_nacionalidad WHERE nacionalidad = nacionalidad_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_periodo` (IN `id_periodo_` INT)  BEGIN
DELETE FROM tbl_periodo WHERE id_periodo = id_periodo_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_pregunta` (`preguntaname` VARCHAR(100))  BEGIN
DELETE FROM tbl_preguntas WHERE Pregunta =preguntaname;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_rol` (IN `rol_` VARCHAR(150))  BEGIN
DELETE FROM tbl_roles WHERE Rol = rol_ ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_eliminar_usuario` (`usuario_` VARCHAR(150))  BEGIN
DELETE FROM tbl_usuarios WHERE Usuario =usuario_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_estado_usuario` (IN `estado_` VARCHAR(50), IN `id_persona_` BIGINT)  BEGIN
UPDATE tbl_personas SET Estado= estado_
WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_existe_municipio_depto` (IN `codigo_` INT)  BEGIN
SELECT COUNT(codigo) AS regis FROM tbl_municipios_hn WHERE codigo = codigo_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_gestion_docente` ()  BEGIN
set @idnumero_empleado=(select id_atributos from tbl_atributos where atributo="numero_empleado" or atributo="NUMERO_EMPLEADO");
set @idfecha_ingreso=(select id_atributos from tbl_atributos where atributo="fecha_ingreso" or atributo="FECHA_INGRESO");
set @id_tipo_docente=(select id_atributos from tbl_atributos where atributo="SUED" or atributo="sued");



select DISTINCT tp.id_persona,tp.identidad, tp.nacionalidad,tp.Estado, concat(tp.nombres," ",tp.apellidos) as "nombre"
,tj.jornada,tj.id_jornada,thd.hr_inicial, thd.hr_final,tca.categoria,tca.id_categoria,(SELECT GROUP_CONCAT( DISTINCT valor, "\n") from tbl_contactos tc1,
tbl_tipo_contactos ttc1, tbl_personas tp1 where ttc1.id_tipo_contacto=tc1.id_tipo_contacto and ttc1.descripcion="TELEFONO CELULAR" and tp1.id_persona=tc1.id_persona and tp.id_persona=tp1.id_persona) as contactos ,
(SELECT GROUP_CONCAT( DISTINCT valor,  "\n") from tbl_contactos tc2, tbl_personas tp2, tbl_tipo_contactos ttc2 
where tp2.id_persona=tc2.id_persona and tp.id_persona=tp2.id_persona and tc2.id_tipo_contacto=ttc2.id_tipo_contacto and ttc2.descripcion="CORREO") as correos,
tpx1.valor numero_empleado, tpx3.valor as sued, tpx2.valor as fecha_ingreso ,(select GROUP_CONCAT( DISTINCT concat(tga.grado_academico,":",teg.especialidad,"\n")) from tbl_personas tp5, tbl_especialidad_grado teg, tbl_grados_academicos tga,tbl_grados_academicos_personas tgap where tgap.id_persona=tp5.id_persona and tgap.id_persona=tp.id_persona and tgap.id_especialidad=teg.id_especialidad and tga.id_grado_academico=teg.id_grado_academico ) as formacion_academica, (select GROUP_CONCAT( DISTINCT concat(tcom.comision,":",tac.actividad,"\n")) FROM tbl_personas tp6, tbl_actividades tac, tbl_comisiones tcom, tbl_actividades_persona tap WHERE tap.id_persona=tp6.id_persona AND tap.id_persona=tp.id_persona AND tap.id_actividad=tac.id_actividad AND tcom.id_comisiones=tac.id_comisiones) AS Comisiones_Actividades
from tbl_personas tp
JOIN tbl_contactos tc on tp.id_persona=tc.id_persona
JOIN tbl_personas_extendidas tpx1 on tp.id_persona=tpx1.id_persona
    JOIN tbl_personas_extendidas tpx2 on tp.id_persona=tpx2.id_persona
    JOIN tbl_personas_extendidas tpx3 on tp.id_persona=tpx3.id_persona
    JOIN tbl_personas_extendidas tpx4 ON tp.id_persona=tpx4.id_persona
    JOIN tbl_personas_extendidas tpx5 ON tp.id_persona=tpx5.id_persona
JOIN tbl_atributos ta1 on tpx1.id_atributo=ta1.id_atributos and @idnumero_empleado=ta1.id_atributos
    JOIN tbl_atributos ta2 on tpx2.id_atributo=ta2.id_atributos and @idfecha_ingreso=ta2.id_atributos
    JOIN tbl_atributos ta3 on tpx3.id_atributo=ta3.id_atributos and @id_tipo_docente=ta3.id_atributos
     
   
JOIN tbl_horario_docentes thd on tp.id_persona=thd.id_persona
JOIN tbl_jornadas tj on thd.id_jornada = tj.id_jornada AND tj.id_jornada = tj.id_jornada AND thd.hr_inicial = thd.hr_inicial AND thd.hr_final = thd.hr_final
JOIN tbl_categoria_personas tcap on tp.id_persona = tcap.id_persona
JOIN tbl_categorias tca on tcap.id_categoria = tca.id_categoria AND tca.id_categoria = tca.id_categoria


where ta1.id_atributos = tpx1.id_atributo  AND ta2.id_atributos=tpx2.id_atributo and ta3.id_atributos=tpx3.id_atributo
;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_guardar_solicitud_practica` (IN `_id_persona` INT, IN `_telefono` VARCHAR(50), IN `_celular` VARCHAR(50), IN `_direccion` VARCHAR(255), IN `_fecha_nacimiento` VARCHAR(50), IN `_tipo_empresa` VARCHAR(255), IN `_labora_dentro` VARCHAR(255), IN `_fecha_inicio` VARCHAR(255), IN `_fecha_finalizada` VARCHAR(255), IN `_identidad` VARCHAR(16))  BEGIN
set @id_telefono_fijo=(select id_tipo_contacto from tbl_tipo_contactos where descripcion='TELEFONO FIJO');
set @id_telefono_celular=(select id_tipo_contacto from tbl_tipo_contactos where descripcion='TELEFONO CELULAR');
set @id_direccion=(select id_tipo_contacto from tbl_tipo_contactos where descripcion='DIRECCION');
set @id_empresa=(select Id_empresa from tbl_empresas_practica where id_persona=_id_persona);
/*update datos del estudiantes*/
UPDATE tbl_personas SET fecha_nacimiento=_fecha_nacimiento , identidad=_identidad WHERE id_persona=_id_persona ;
/*insert telefono fijo*/
insert into tbl_contactos (id_persona, id_tipo_contacto, valor)
values (_id_persona,@id_telefono_fijo,_telefono);
/*insert telefono celular*/
insert into tbl_contactos (id_persona, id_tipo_contacto, valor)
values (_id_persona,@id_telefono_celular,_celular);
/*insert direccion*/
insert into tbl_contactos (id_persona, id_tipo_contacto, valor)
values (_id_persona,@id_direccion,_direccion);
/*update datos de la empresa*/
UPDATE tbl_empresas_practica set tipo_empresa=_tipo_empresa, labora_dentro=_labora_dentro WHERE id_persona=_id_persona  ;
/*insert fecha de inicio y finalizacion*/
insert into tbl_practica_estudiantes(id_persona, Id_empresa, fecha_inicio, fecha_finaliza, docente_supervisor)
values (_id_persona,@id_empresa,_fecha_inicio,_fecha_finalizada,'');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_actividades` (IN `actividad_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `nombre_proyecto_` VARCHAR(50), IN `horas_semanales_` VARCHAR(50), IN `id_comisiones_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_actividades (actividad,descripcion,nombre_proyecto,horas_semanales, id_comisiones, Fecha_creacion,Creado_por)
VALUES (actividad_, descripcion_,nombre_proyecto_,horas_semanales_, id_comisiones_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_actividades_gestion` (IN `id_actividad_` INT, IN `id_persona_` INT)  BEGIN

INSERT INTO tbl_actividades_persona(id_actividad, id_persona)
VALUES(id_actividad_, id_persona_);
SELECT LAST_INSERT_ID() AS id_act_persona;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_asignaturas_aprobadas` (IN `Id_asignatura_` INT, IN `id_persona_` INT)  BEGIN
INSERT INTO `tbl_asignaturas_aprobadas`( `Id_asignatura`, `id_persona`, `Fecha_creacion`)
VALUES (Id_asignatura_ ,id_persona_, sysdate());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_atributo` (IN `atributo_` VARCHAR(50), IN `requerido_` VARCHAR(50), IN `id_tipo_persona_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_atributos(atributo, requerido, id_tipo_persona, Fecha_creacion,Creado_por)
VALUES (atributo_, requerido_, id_tipo_persona_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_atributos` (IN `valor_` VARCHAR(50), IN `valor2_` VARCHAR(50), IN `valor3_` VARCHAR(50), IN `valor4_` VARCHAR(50))  BEGIN
set @idnumero_empleado:=(select id_atributos from tbl_atributos where atributo="numero_empleado" or atributo="NUMERO_EMPLEADO");
set @idfecha_ingreso:=(select id_atributos from tbl_atributos where atributo="fecha_ingreso" or atributo="FECHA_INGRESO");
SET @idcurriculum:=(select id_atributos from tbl_atributos where atributo="curriculum" or atributo="CURRICULUM");
SET @idfoto:=(select id_atributos from tbl_atributos where atributo="foto" or atributo="FOTO");

INSERT INTO tbl_personas_extendidas(id_atributo, id_persona, valor)
VALUES(@idnumero_empleado, (SELECT MAX(id_persona)FROM tbl_personas), valor_),
(@idfecha_ingreso, (SELECT MAX(id_persona)FROM tbl_personas), valor2_),
(@idcurriculum, (SELECT MAX(id_persona)FROM tbl_personas), valor3_),
(@idfoto, (SELECT MAX(id_persona)FROM tbl_personas), valor4_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_aula` (IN `codigo_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `capacidad_` INT, IN `id_edificio_` BIGINT, IN `id_tipo_aula_` BIGINT, IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_aula (codigo,descripcion,capacidad,id_edificio, id_tipo_aula, Fecha_creacion,Creado_por)
VALUES (codigo_,descripcion_,capacidad_,id_edificio_, id_tipo_aula_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_carrera` (IN `descripcion_` VARCHAR(50), IN `Id_facultad_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_carrera(descripcion, Id_facultad, Fecha_creacion,Creado_por)
VALUES (descripcion_, Id_facultad_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_comision` (IN `comision_` VARCHAR(50), IN `id_carrera_` BIGINT, IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_comisiones(comision, id_carrera, Fecha_creacion,Creado_por)
VALUES (comision_, id_carrera_, SYSDATE(),usuario_);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_comisiones_actividades` (IN `id_actividad_` INT)  BEGIN

INSERT INTO tbl_actividades_persona(id_actividad, id_persona)
VALUES(id_actividad_,(SELECT MAX(id_persona)FROM tbl_personas));
SELECT LAST_INSERT_ID() AS id_act_persona;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_copia_carga` (IN `id_periodo_nuevo_` INT, IN `id_periodo_antiguo_` BIGINT)  BEGIN

INSERT INTO tbl_carga_academica(control, seccion, num_alumnos, id_persona, id_aula, id_asignatura, id_periodo, dias, id_modalidad, hora_inicial, hora_final) 
SELECT control, seccion, num_alumnos, id_persona, id_aula, id_asignatura, id_periodo_nuevo_, dias, id_modalidad, hora_inicial, hora_final 
from tbl_carga_academica 
WHERE id_periodo = id_periodo_antiguo_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_correos` (IN `valor_` VARCHAR(50))  BEGIN 
SET @idcorreo:=(select id_tipo_contacto from tbl_tipo_contactos where descripcion="CORREO" or descripcion="correo");

INSERT INTO tbl_contactos(id_persona, id_tipo_contacto, valor)
VALUES((SELECT MAX(id_persona)FROM tbl_personas),@idcorreo, valor_);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_curriculum` (IN `valor1_` VARCHAR(50))  BEGIN
SET @idcurriculum:=(select id_atributos from tbl_atributos where atributo="curriculum" or atributo="CURRICULUM");

INSERT INTO tbl_personas_extendidas(id_atributo, id_persona, valor)
VALUES(@idcurriculum, (SELECT MAX(id_persona)FROM tbl_personas), valor1_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_departamento` (IN `departamento_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_departamentos(departamento, Fecha_creacion,Creado_por)
VALUES (departamento_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_desea_asig_docen` (IN `Id_asignatura_` BIGINT, IN `id_persona_` BIGINT)  BEGIN
INSERT INTO tbl_desea_asig_doce(Id_asignatura,id_persona)
VALUES (Id_asignatura_,id_persona_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_docentes_personas` (IN `nombres_` VARCHAR(50), IN `apellidos_` VARCHAR(50), IN `sexo_` VARCHAR(50), IN `identidad_` VARCHAR(50), IN `nacionalidad_` VARCHAR(50), IN `estado_civil_` VARCHAR(50), IN `fecha_nacimiento_` VARCHAR(50), IN `id_tipo_persona_` VARCHAR(50), IN `Estado_` VARCHAR(50), IN `id_categoria_` INT, IN `id_jornada_` BIGINT, IN `hr_inicial_` VARCHAR(50), IN `hr_final_` VARCHAR(50), IN `valor_` VARCHAR(50), IN `valor2_` VARCHAR(50), IN `sued_` VARCHAR(50))  BEGIN
set @idnumero_empleado:=(select id_atributos from tbl_atributos where atributo="numero_empleado" or atributo="NUMERO_EMPLEADO");
set @idfecha_ingreso:=(select id_atributos from tbl_atributos where atributo="fecha_ingreso" or atributo="FECHA_INGRESO");
set @tipo_docente:=(select id_atributos from tbl_atributos where atributo="sued" or atributo="SUED");

INSERT INTO tbl_personas(nombres, apellidos, sexo, identidad, nacionalidad, estado_civil, fecha_nacimiento, id_tipo_persona, Estado)
VALUES (nombres_, apellidos_, sexo_,identidad_,nacionalidad_, estado_civil_, fecha_nacimiento_, id_tipo_persona_, Estado_);

INSERT INTO tbl_categoria_personas(id_persona, id_categoria)
VALUES ((SELECT MAX(id_persona)FROM tbl_personas), id_categoria_);

INSERT INTO tbl_horario_docentes(id_jornada, id_categoria_persona, hr_inicial, hr_final, id_persona)
VALUES (id_jornada_, (SELECT MAX(id_categoria_persona)FROM tbl_categoria_personas), hr_inicial_, hr_final_, (SELECT MAX(id_persona)FROM tbl_personas));


INSERT INTO tbl_personas_extendidas(id_atributo, id_persona, valor)
VALUES(@idnumero_empleado, (SELECT MAX(id_persona)FROM tbl_personas), valor_),
(@tipo_docente, (SELECT MAX(id_persona)FROM tbl_personas), sued_),
(@idfecha_ingreso, (SELECT MAX(id_persona)FROM tbl_personas), valor2_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_edificio` (IN `nombre_` VARCHAR(50), IN `codigo_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_edificios (nombre, codigo, Fecha_creacion,Creado_por)
VALUES (nombre_, codigo_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_egresado` (IN `nombre_` VARCHAR(255), IN `cuenta_` BIGINT(13), IN `correo_` VARCHAR(255), IN `celular_` VARCHAR(12), IN `telefono_` VARCHAR(12), IN `fecha_graduacion_` VARCHAR(5), IN `posee_maestria_` CHAR(2), IN `maestria_` VARCHAR(255), IN `posee_certificado_` CHAR(2), IN `certificado_` VARCHAR(255), IN `labora_` CHAR(2), IN `nombre_empresa_` VARCHAR(255), IN `direccion_empresa_` VARCHAR(255), IN `telefono_empresa_` VARCHAR(12), IN `departamento_egresado_` VARCHAR(255), IN `correo_profesional_` VARCHAR(255))  BEGIN
INSERT INTO tbl_egresados(nombre, cuenta, correo_electronico, celular_egresado,telefono_egresado, fecha_graduacion,posee_maestria,maestria,posee_certificado,certificado,labora,nombre_empresa,direccion_empresa, telefono_empresa,departamento_egresado,correo_profesional,Fecha_creacion) VALUES (nombre_,cuenta_,correo_, celular_,telefono_,fecha_graduacion_,posee_maestria_,maestria_,posee_certificado_,certificado_, labora_, nombre_empresa_,direccion_empresa_,telefono_empresa_,departamento_egresado_,correo_profesional_,sysdate());
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_empresa_practica` (IN `nombre_empresa_` VARCHAR(255), IN `direccion_empresa_` VARCHAR(255), IN `departamento_empresa_` VARCHAR(255), IN `jefe_inmediato_` VARCHAR(255), IN `titulo_jefe_inmediato_` VARCHAR(255), IN `cargo_jefe_inmediato_` VARCHAR(255), IN `correo_jefe_inmediato_` VARCHAR(255), IN `telefono_jefe_inmediato_` VARCHAR(10), IN `id_persona_` BIGINT(16))  BEGIN
INSERT INTO `tbl_empresas_practica`(`id_persona`, `nombre_empresa`, `direccion_empresa`, `departamento_empresa`, `jefe_inmediato`, `titulo_jefe_inmediato`, `cargo_jefe_inmediato`, `correo_jefe_inmediato`, `telefono_jefe_inmediato`, `Fecha_creacion`)
VALUES( id_persona_,nombre_empresa_ , direccion_empresa_ , departamento_empresa_ , jefe_inmediato_ , titulo_jefe_inmediato_ , cargo_jefe_inmediato_ , correo_jefe_inmediato_ ,telefono_jefe_inmediato_  ,SYSDATE());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_estado_civil` (IN `estado_civil_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_estadocivil(estado_civil, descripcion, Fecha_creacion,Creado_por)
VALUES (estado_civil_, descripcion_, SYSDATE(),usuario_);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_estudiante` (IN `nombre_` VARCHAR(255), IN `apellido_` VARCHAR(255), IN `numero_cuenta_` BIGINT(16), IN `correo_` VARCHAR(50), IN `contraseña_` VARCHAR(255), IN `sexo_` VARCHAR(255), IN `usuario_` VARCHAR(20))  BEGIN
/*insert en tabla personas*/
SET @tpersona=(select id_tipo_persona from tbl_tipos_persona where tipo_persona='ESTUDIANTE');
insert into tbl_personas
(nombres, apellidos, sexo,id_tipo_persona)
value
(
  nombre_,apellido_,sexo_,@tpersona
);
SET  @id_persona = (SELECT LAST_INSERT_ID());
SET  @id_atributo=(select id_atributos from tbl_atributos where atributo='numero_cuenta');
SET  @rol=(select Id_rol from tbl_roles where Rol='ESTUDIANTE');
/*insert en tabla personas extendidas*/
insert into tbl_personas_extendidas(id_atributo, id_persona, valor)
value (@id_atributo,@id_persona,numero_cuenta_);
/*insert en tabla usuarios*/
INSERT INTO tbl_usuarios
        (
       id_persona, Usuario, Id_rol, estado, Contrasena, Fec_vence_contrasena,Fecha_creacion
        )
        VALUES(
        @id_persona,
        usuario_,
        @rol,
        2,
        contraseña_,
        sysdate(),
        sysdate()
        );
/*insert en tabla contactos*/
insert into tbl_contactos
(id_persona, id_tipo_contacto, valor)
value
(@id_persona,4,correo_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_expe_asig_docen` (IN `Id_asignatura_` BIGINT, IN `id_persona_` BIGINT)  BEGIN
INSERT INTO tbl_pref_asig_docen(Id_asignatura,id_persona)
VALUES (Id_asignatura_,id_persona_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_extendidas` (IN `valor_` BIGINT, IN `valor1_` DATE, IN `valor2_` VARCHAR(50), IN `valor3_` VARCHAR(50))  BEGIN
set @idnumero_empleado:=(select id_atributos from tbl_atributos where atributo="numero_empleado" or atributo="NUMERO_EMPLEADO");
set @idfecha_ingreso:=(select id_atributos from tbl_atributos where atributo="fecha_ingreso" or atributo="FECHA_INGRESO");
set @idcurriculum:=(select id_atributos from tbl_atributos where atributo="curriculum" or atributo="CURRICULUM");
set @idfoto:=(select id_atributos from tbl_atributos where atributo="foto" or atributo="FOTO");

INSERT INTO  tbl_personas_extendidas(id_persona, id_atributo, valor) 
VALUES((SELECT MAX(id_persona)FROM tbl_personas),@idnumero_empleado, valor_);

INSERT INTO  tbl_personas_extendidas(id_persona, id_atributo, valor)  
VALUES((SELECT MAX(id_persona)FROM tbl_personas),@idfecha_ingreso, valor1_);

INSERT INTO  tbl_personas_extendidas(id_persona, id_atributo, valor) 
VALUES((SELECT MAX(id_persona)FROM tbl_personas),@idcurriculum, valor2_);

INSERT INTO  tbl_personas_extendidas(id_persona, id_atributo, valor) 
VALUES((SELECT MAX(id_persona)FROM tbl_personas),@idfoto, valor3_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_foto` (IN `valor1_` VARCHAR(50))  BEGIN
SET @idfoto:=(select id_atributos from tbl_atributos where atributo="foto" or atributo="FOTO");

INSERT INTO tbl_personas_extendidas(id_atributo, id_persona, valor)
VALUES(@idfoto, (SELECT MAX(id_persona)FROM tbl_personas), valor1_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_gacademico` (IN `id_grado_academico_` INT, IN `especialidad_` VARCHAR(50))  BEGIN

INSERT INTO tbl_especialidad_grado(id_grado_academico, especialidad)
VALUES(id_grado_academico_,especialidad_);

INSERT INTO tbl_grados_academicos_personas(id_especialidad, id_persona)
VALUES((SELECT MAX(id_especialidad)FROM tbl_especialidad_grado),(SELECT MAX(id_persona)FROM tbl_personas));


SELECT LAST_INSERT_ID() AS id_grado_academico;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_genero` (IN `genero_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_genero(genero,Fecha_creacion,Creado_por)
VALUES (genero_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_grado_academico` (IN `grados_academicos_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `usuario_` VARCHAR(50))  INSERT INTO  tbl_grados_academicos(grado_academico, descripcion, Fecha_creacion,Creado_por)
VALUES (grados_academicos_, descripcion_, SYSDATE(),usuario_)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_horario_docente` (IN `hora_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_hora(hora,Fecha_creacion,Creado_por)
VALUES (hora_,SYSDATE(),usuario_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_inscripcion_charla` (IN `id_persona_` BIGINT(16), IN `no_constancia_` VARCHAR(15), IN `promedio_global_` VARCHAR(15), IN `clases_aprobadas_` VARCHAR(15), IN `porcentaje_clases_` VARCHAR(10), IN `jornada_` VARCHAR(50))  BEGIN
INSERT INTO tbl_charla_practica ( `id_persona`, `no_constancia`, `promedio_global`, `clases_aprobadas`, `porcentaje_clases`, `jornada`, `estado_asistencia_charla`,`charla_impartida`) VALUES (id_persona_,no_constancia_,promedio_global_, clases_aprobadas_,porcentaje_clases_,jornada_,0,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_jornada` (IN `jornada_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN

INSERT INTO  tbl_jornadas(jornada, descripcion, Fecha_creacion,Creado_por)
VALUES (jornada_, descripcion_, SYSDATE(),usuario_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_municipio` (IN `municipio_` VARCHAR(50), IN `codigo_` VARCHAR(50), IN `id_departamento_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_municipios_hn(municipio, codigo, id_departamento, Fecha_creacion,Creado_por)
VALUES (municipio_, codigo_, id_departamento_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_nacionalidad` (IN `nacionalidad_` VARCHAR(50), IN `pais_nac_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO  tbl_nacionalidad(nacionalidad, PAIS_NAC, Fecha_creacion,Creado_por)
VALUES (nacionalidad_, pais_nac_, SYSDATE(),usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_periodo_plan` (IN `periodo_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN
INSERT INTO tbl_periodo_plan(periodo, Fecha_creacion, Creado_por) 
VALUES (periodo_, SYSDATE(), usuario_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_personas` (IN `nombres_` VARCHAR(2555), IN `apellidos_` VARCHAR(50), IN `sexo_` VARCHAR(255), IN `identidad_` VARCHAR(255), IN `nacionalidad_` VARCHAR(50), IN `estado_civil_` VARCHAR(25), IN `fecha_nacimiento_` DATE)  BEGIN

INSERT INTO tbl_personas(nombres, apellidos, sexo, identidad, nacionalidad, estado_civil, fecha_nacimiento)
VALUES (nombres_, apellidos_, sexo_, identidad_,nacionalidad_, estado_civil_, fecha_nacimiento_);



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_persona_estudiante` (IN `numero_cuenta_` BIGINT(16), IN `nombre_` VARCHAR(255), IN `apellido_` VARCHAR(255), IN `identidad_` VARCHAR(255), IN `nacionalidad_` VARCHAR(50), IN `fecha_nacimiento_` DATE, IN `estado_civil_` VARCHAR(25), IN `sexo_` VARCHAR(255), IN `telefono_` VARCHAR(50), IN `correo_` VARCHAR(50), IN `direccion_` VARCHAR(50))  BEGIN
/*insert en tabla personas*/
SET @tpersona=(select id_tipo_persona from tbl_tipos_persona where tipo_persona='ESTUDIANTE');
insert into tbl_personas
(nombres, apellidos, identidad, nacionalidad, estado_civil, fecha_nacimiento, sexo, id_tipo_persona)
value
(
  nombre_,apellido_,  identidad_, nacionalidad_, estado_civil_,  fecha_nacimiento_, sexo_,    @tpersona
);
SET  @id_persona = (SELECT LAST_INSERT_ID());
SET  @id_atributo=(select id_atributos from tbl_atributos where atributo='numero_cuenta');
/*insert en tabla personas extendidas*/
insert into tbl_personas_extendidas(id_atributo, id_persona, valor)
value (@id_atributo,@id_persona,numero_cuenta_);
/*insert en tabla contactos telefono*/
insert into tbl_contactos
(id_persona, id_tipo_contacto, valor)
value
(@id_persona,1,telefono_);
/*insert en tabla contactos correo*/
insert into tbl_contactos
(id_persona, id_tipo_contacto, valor)
value
(@id_persona,4,correo_);
/*insert en tabla contactos direccion*/
insert into tbl_contactos
(id_persona, id_tipo_contacto, valor)
value
(@id_persona,3,direccion_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_plan_estudio` (IN `nombre_` VARCHAR(50), IN `num_clases_` INT, IN `fecha_creacion_` DATE, IN `codigo_plan_` VARCHAR(50), IN `plan_vigente_` VARCHAR(50), IN `id_tipo_plan_` BIGINT, IN `creado_por_` VARCHAR(50))  BEGIN
INSERT INTO tbl_plan_estudio(nombre, num_clases, fecha_creacion, codigo_plan, plan_vigente, id_tipo_plan,creado_por) 
VALUES (nombre_, num_clases_, fecha_creacion_, codigo_plan_, plan_vigente_, id_tipo_plan_,creado_por_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_pref_area_docen` (IN `id_area_` VARCHAR(50), IN `id_persona_` INT)  BEGIN
INSERT INTO tbl_pref_area_docen(id_area,id_persona)
VALUES (id_area_,id_persona_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_pregunta` (`preguntav` VARCHAR(150), `estadov` INTEGER, `Creado_porv` VARCHAR(200))  BEGIN
INSERT INTO  tbl_preguntas(pregunta,estado,Fecha_creacion,Creado_por)
VALUES (preguntav,estadov,sysdate(),Creado_porv);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_pregunta_usuario` (`Id_pregunta_` INTEGER, `Id_usuario_` INTEGER, `Respuesta_` VARCHAR(150))  begin
INSERT INTO  tbl_preguntas_seguridad (Id_pregunta,Id_usuario,Respuesta)
VALUES (Id_pregunta_,Id_usuario_, Respuesta_ );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_proyecto` (IN `Id_tipo_v_` BIGINT(16), IN `Id_modalidad_` BIGINT(16), IN `nombre_` VARCHAR(255), IN `codigo_proyecto_` BIGINT(16), IN `estado_` BIGINT(16), IN `beneficiarios_directos_` BIGINT(16), IN `beneficiarios_indirectos_` BIGINT(16), IN `nombre_empresa_` VARCHAR(255), IN `nombre_contacto_institucional_` VARCHAR(255), IN `cargo_contacto_institucional_` VARCHAR(255), IN `telefono_contacto_institucional_` VARCHAR(50), IN `correo_contacto_institucional_` VARCHAR(255), IN `cant_beneficiarios_` BIGINT(16), IN `fecha_inicio_ejecucion_` DATE, IN `fecha_final_ejecucion_` DATE, IN `fecha_inicio_evaluacion_` DATE, IN `fecha_final_evaluacion_` DATE, IN `costo_` INT, IN `Id_tipo_formalizacion_` BIGINT(16), IN `Id_aporte_` BIGINT(16), IN `region_` VARCHAR(255), IN `departamento_pais_` VARCHAR(255), IN `municipio_` VARCHAR(255), IN `aldea_caserio_` VARCHAR(255), IN `barrio_colonia_` VARCHAR(255), IN `entidad_beneficiaria_` VARCHAR(255), IN `objetivos_desarrollo_` VARCHAR(255), IN `objetivos_inmediatos_` VARCHAR(255), IN `resultados_` VARCHAR(255), IN `actividades_` VARCHAR(255), IN `departamento_` VARCHAR(255), IN `tipo_proyecto_` VARCHAR(255), IN `nombre_estudiante_` VARCHAR(100), IN `cargo_estudiante_` VARCHAR(100), IN `telefono_estudiante_` INT, IN `correo_estudiante_` VARCHAR(150), IN `numero_empleado_` INT, IN `direccion_estudiante_` VARCHAR(200))  BEGIN
INSERT
INTO
tbl_proyectos(
Id_tipo_v,
Id_modalidad,
nombre,
codigo_proyecto,
estado,
beneficiarios_directos,
beneficiarios_indirectos,
nombre_empresa,
nombre_contacto_institucional,
cargo_contacto_institucional,
telefono_contacto_institucional,
correo_contacto_institucional,
cant_beneficiarios,
fecha_inicio_ejecucion,
fecha_final_ejecucion,
fecha_inicio_evaluacion,
fecha_final_evaluacion,
costo,
Fecha_creación,
Id_tipo_formalizacion,
Id_aporte,
region,
departamento_pais,
municipio,
aldea_caserio,
barrio_colonia,
entidad_beneficiaria,
objetivos_desarrollo,
objetivos_inmediatos,
resultados,
actividades,
departamento,
tipo_proyecto
)
VALUES(
Id_tipo_v_,
Id_modalidad_,
nombre_,
codigo_proyecto_,
estado_,
beneficiarios_directos_,
beneficiarios_indirectos_,
nombre_empresa_,
nombre_contacto_institucional_,
cargo_contacto_institucional_,
telefono_contacto_institucional_,
correo_contacto_institucional_,
cant_beneficiarios_,
fecha_inicio_ejecucion_, 
fecha_final_ejecucion_, 
fecha_inicio_evaluacion_,
fecha_final_evaluacion_, 
costo_,
SYSDATE(), 
Id_tipo_formalizacion_, 
Id_aporte_, 
region_, 
departamento_pais_, 
municipio_, 
aldea_caserio_, 
barrio_colonia_, 
entidad_beneficiaria_, 	
objetivos_desarrollo_, 
objetivos_inmediatos_, 
resultados_, 
actividades_, 
departamento_,
tipo_proyecto_);

INSERT INTO tbl_estudiantes_proyecto(nombre_estudiante, cargo_estudiante, telefono_estudiante, 
correo_estudiante, numero_empleado, direccion_estudiante, id_proyecto)
VALUES(nombre_estudiante_, cargo_estudiante_, telefono_estudiante_, correo_estudiante_, numero_empleado_, direccion_estudiante_, (SELECT MAX(Id_proyecto)FROM tbl_proyectos));
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_rol` (`n_rol` VARCHAR(150), `descripcionrol` VARCHAR(250), `estado_` INTEGER, `usuario_` VARCHAR(150))  BEGIN
INSERT INTO  tbl_roles(rol, descripcion, estado,Fecha_creacion,Creado_por)
VALUES (n_rol, descripcionrol, estado_, sysdate()
,usuario_);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_subida_informacion` (IN `id_persona_` BIGINT(16))  begin
INSERT INTO `tbl_subida_documentacion`( `id_persona`,`fecha_creacion`) VALUES (id_persona_,sysdate());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_tabla_categoria` (IN `categoria_` VARCHAR(50), IN `descripcion_` VARCHAR(50), IN `usuario_` VARCHAR(50))  BEGIN

INSERT INTO tbl_categorias(categoria, descripcion, Fecha_creacion, Creado_por)
VALUES(categoria_, descripcion_, SYSDATE(), usuario_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_tabla_comisiones` (IN `comision_` VARCHAR(50), IN `carrera_` VARCHAR(50))  BEGIN

INSERT INTO tbl_comisiones(comision, carrera)
VALUES(comision_, carrera_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_tabla_grados` (IN `grados_` VARCHAR(50), IN `descripcion_` VARCHAR(50))  BEGIN

INSERT INTO tbl_grados_academicos(grado_academico, descripcion)
VALUES(grados_, descripcion_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_telefonos` (IN `valor_` VARCHAR(50))  BEGIN 
set @idtelefonocelular:=(select id_tipo_contacto from tbl_tipo_contactos where descripcion="TELEFONO CELULAR" or descripcion="telefono celular");

INSERT INTO tbl_contactos(id_persona, id_tipo_contacto, valor)
VALUES((SELECT MAX(id_persona)FROM tbl_personas),@idtelefonocelular, valor_);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_usuario` (`Id_persona_` BIGINT(16), `Usuario_` VARCHAR(150), `Id_rol_` INTEGER, `Contrasena_` VARCHAR(150), `creado_por_` VARCHAR(255))  BEGIN
INSERT INTO  tbl_usuarios(id_persona, usuario, Id_rol , Contrasena, estado,Fecha_creacion, Creado_por)
VALUES (Id_persona_, Usuario_ ,Id_rol_, Contrasena_,2, sysdate(), creado_por_);




end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_area` (IN `area_` VARCHAR(100), IN `descripcion_` VARCHAR(100))  BEGIN
INSERT INTO tbl_areas(AREA, descripcion) 
VALUES (area_, descripcion_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_aula_carga` (IN `codigo_` INT, IN `descripcion_` VARCHAR(50), IN `capacidad_` INT, IN `id_edificio_` INT, IN `id_tipo_aula_` INT)  BEGIN
INSERT INTO tbl_aula(codigo, descripcion, capacidad, id_edificio, id_tipo_aula) 
VALUES (codigo_, descripcion_, capacidad_, id_edificio_, id_tipo_aula_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_carga_academica` (IN `control_` VARCHAR(50), IN `seccion_` VARCHAR(50), IN `num_alumnos_` INT, IN `id_persona_` BIGINT, IN `id_aula_` BIGINT, IN `id_asignatura_` BIGINT, IN `dias_` VARCHAR(50), IN `id_modalidad_` BIGINT, IN `hora_inicial_` VARCHAR(50), IN `hora_final_` VARCHAR(50))  BEGIN
INSERT INTO tbl_carga_academica(control, seccion, num_alumnos, id_persona, id_aula, id_asignatura, id_periodo, dias, id_modalidad, hora_inicial, hora_final) 
VALUES (control_, seccion_, num_alumnos_, id_persona_, id_aula_, id_asignatura_, (SELECT MAX(id_periodo)FROM tbl_periodo), dias_, id_modalidad_, hora_inicial_, hora_final_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_carga_virtual` (IN `control_` VARCHAR(50), IN `seccion_` VARCHAR(50), IN `num_alumnos_` INT, IN `id_persona_` BIGINT, IN `id_asignatura_` BIGINT, IN `dias_` VARCHAR(50), IN `id_modalidad_` BIGINT, IN `hora_inicial_` VARCHAR(50), IN `hora_final_` VARCHAR(50))  BEGIN
INSERT INTO tbl_carga_academica(control, seccion, num_alumnos, id_persona, id_asignatura, id_periodo, dias, id_modalidad, hora_inicial, hora_final) 
VALUES (control_, seccion_, num_alumnos_, id_persona_, id_asignatura_, (SELECT MAX(id_periodo)FROM tbl_periodo), dias_, id_modalidad_, hora_inicial_, hora_final_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_edifico_carga` (IN `nombre_` VARCHAR(50), IN `codigo_` VARCHAR(50))  BEGIN
INSERT INTO tbl_edificios(nombre, codigo) 
VALUES (nombre_, codigo_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_exp_area_docen` (IN `id_area_` BIGINT, IN `id_persona_` BIGINT)  BEGIN
INSERT INTO tbl_expe_academica_docente(id_area,id_persona)
VALUES (id_area_,id_persona_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_periodo_carga` (IN `num_periodo_` INT, IN `num_anno_` YEAR, IN `fecha_inicio_` DATE, IN `fecha_final_` DATE, IN `usuario_` VARCHAR(50), IN `id_tipo_periodo_` INT, IN `fecha_adic_canc_` DATE, IN `fecha_desbloqueo_` DATE)  BEGIN
INSERT INTO tbl_periodo(num_periodo, num_anno, fecha_inicio, fecha_final, Fecha_creacion,Creado_por, id_tipo_periodo, fecha_adic_canc, fecha_desbloqueo) 
VALUES (num_periodo_, num_anno_, fecha_inicio_, fecha_final_, SYSDATE(),usuario_, id_tipo_periodo_, fecha_adic_canc_, fecha_desbloqueo_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_ins_personas` (IN `nombre_` VARCHAR(255), IN `apellido_` VARCHAR(255), IN `sexo_` VARCHAR(255), IN `identidad_` VARCHAR(255), IN `nacionalidad_` VARCHAR(50), IN `estado_civil_` VARCHAR(25), IN `fecha_nacimiento_` DATE, IN `tipo_persona_` INT, IN `telefono_` VARCHAR(50), `correo_` VARCHAR(50), IN `direccion_` VARCHAR(50))  BEGIN
INSERT INTO tbl_personas(nombres, apellidos, sexo, identidad, nacionalidad, estado_civil, fecha_nacimiento, id_tipo_persona)
VALUES(nombre_, apellido_, sexo_, identidad_, nacionalidad_, estado_civil_, fecha_nacimiento_, tipo_persona_);   

SET @id_persona=(last_insert_id()); 
SET @id_telefono=(SELECT id_tipo_contacto FROM tbl_tipo_contactos WHERE descripcion = 'TELEFONO CELULAR');
SET @id_correo=(SELECT id_tipo_contacto FROM tbl_tipo_contactos WHERE descripcion = 'CORREO');
SET @id_direccion=(SELECT id_tipo_contacto FROM tbl_tipo_contactos WHERE descripcion = 'DIRECCION');
/*INSERTAR TELEFONO */
INSERT INTO tbl_contactos(id_persona, id_tipo_contacto, valor)
VALUES(@id_persona, @id_telefono, telefono_);
/*INSERTAR CORREO */
INSERT INTO tbl_contactos(id_persona, id_tipo_contacto, valor)
VALUES(@id_persona, @id_correo, correo_);
/*INSERTAR DIRECCION */
INSERT INTO tbl_contactos(id_persona, id_tipo_contacto, valor)
VALUES(@id_persona, @id_direccion, direccion_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_modificar_gestion` (IN `valor1_` VARCHAR(50), IN `valor_` VARCHAR(50), IN `identidad_` VARCHAR(50), IN `id_jornada_` INT, IN `id_categoria_` INT, IN `hr_inicial_` VARCHAR(50), IN `hr_final_` VARCHAR(50), IN `id_persona_` INT)  BEGIN
UPDATE tbl_horario_docentes hd
INNER JOIN tbl_categoria_personas cp ON cp.id_persona=hd.id_persona
INNER JOIN tbl_personas p ON p.id_persona=hd.id_persona
INNER JOIN tbl_personas_extendidas pe ON pe.id_persona=hd.id_persona AND pe.id_atributo=1
INNER JOIN tbl_personas_extendidas pe1 ON pe1.id_persona=hd.id_persona AND pe1.id_atributo=14
SET 
pe1.valor= valor1_,
pe.valor=valor_,
p.identidad=identidad_,
hd.id_jornada=id_jornada_, cp.id_categoria=id_categoria_, 
hr_inicial=hr_inicial_, hr_final=hr_final_ WHERE hd.id_persona=id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_modificar_horas` (IN `horas_semanales_` VARCHAR(50), IN `id_actividad_` INT)  BEGIN
UPDATE tbl_actividades SET horas_semanales=horas_semanales_
WHERE id_actividad=id_actividad_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_prueba_api` (IN `id_actividad_` INT, IN `id_persona_` INT)  BEGIN
INSERT INTO tbl_actividades_persona(id_actividad, id_persona)
VALUES(id_actividad_,id_persona_);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sel_actividad` (IN `actividad_` VARCHAR(50))  BEGIN
SELECT ac.id_actividad, c.comision, ac.actividad, ac.horas_semanales
FROM tbl_comisiones c
INNER JOIN tbl_personas p 
INNER JOIN tbl_usuarios u ON u.id_persona=p.id_persona
inner JOIN tbl_actividades ac ON ac.id_comisiones=c.id_comisiones
INNER JOIN tbl_actividades_persona ap ON ac.id_actividad=ap.id_actividad and u.id_persona=ap.id_persona
WHERE ac.actividad= actividad_ AND u.Id_usuario=8;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sel_actividad_docente` (IN `id_persona_` BIGINT)  BEGIN
SELECT ACTP.id_actividad, COM.comision, ACT.actividad  FROM tbl_actividades ACT
JOIN tbl_actividades_persona ACTP ON ACT.id_actividad= ACTP.id_actividad
JOIN tbl_comisiones COM ON COM.id_comisiones = ACT.id_comisiones
WHERE ACTP.id_persona = id_persona_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_sel_tabla_historial` ()  BEGIN
SELECT p.id_periodo, num_periodo,p.num_anno,count(id_carga_academica) AS total_carga FROM tbl_periodo p JOIN tbl_carga_academica ca ON ca.id_periodo=p.id_periodo 
GROUP BY(p.id_periodo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_periodo_carga` (IN `num_periodo_` INT, IN `num_anno_` INT, IN `fecha_inicio_` DATE, IN `fecha_final_` DATE, IN `Usuario_` VARCHAR(50), IN `id_periodo_` INT)  BEGIN

UPDATE tbl_periodo SET  num_periodo= num_periodo_,  num_anno=num_anno_, fecha_inicio=fecha_inicio_, fecha_final=fecha_final_, 
Fecha_modificacion=sysdate() , Modificado_por=Usuario_ WHERE id_periodo= id_periodo_ ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_personas` (IN `nombre_` VARCHAR(255), IN `apellido_` VARCHAR(255), IN `identidad_` VARCHAR(255), IN `nacionalidad_` VARCHAR(50), IN `estado_civil_` VARCHAR(25), IN `telefono_` VARCHAR(50), `correo_` VARCHAR(50), IN `direccion_` VARCHAR(50), IN `id_persona_` BIGINT(16))  BEGIN
UPDATE tbl_personas SET nombres=nombre_, 
						apellidos=apellido_,
						identidad=identidad_,
                        nacionalidad=nacionalidad_,
                        estado_civil=estado_civil_
                        WHERE id_persona=id_persona_;
                        
SET @id_telefono=(SELECT id_tipo_contacto FROM tbl_tipo_contactos WHERE descripcion = 'TELEFONO CELULAR');
SET @id_correo=(SELECT id_tipo_contacto FROM tbl_tipo_contactos WHERE descripcion = 'CORREO');
SET @id_direccion=(SELECT id_tipo_contacto FROM tbl_tipo_contactos WHERE descripcion = 'DIRECCION');

UPDATE tbl_contactos SET valor=telefono_
WHERE id_persona=id_persona_ AND id_tipo_contacto=@id_telefono;

UPDATE tbl_contactos SET valor=correo_
WHERE id_persona=id_persona_ AND id_tipo_contacto=@id_correo;

UPDATE tbl_contactos SET valor=direccion_
WHERE id_persona=id_persona_ AND id_tipo_contacto=@id_direccion;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_verificar_carga_modificar` (IN `hora_inicial_` VARCHAR(4), IN `id_aula_` BIGINT, IN `id_periodo_` BIGINT, IN `hora_final_` BIGINT)  BEGIN
SELECT COUNT(id_carga_academica) as registro FROM tbl_carga_academica WHERE hora_inicial= hora_inicial_ AND id_aula=id_aula_
AND id_periodo=id_periodo_ AND hora_final=hora_final_ LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_verificar_nombre_plan` (IN `nombre_` VARCHAR(50))  BEGIN
SELECT COUNT(id_plan_estudio) as registro FROM tbl_plan_estudio WHERE nombre = nombre_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_verificar_plan_activo` (IN `opcion_` VARCHAR(50))  BEGIN
SELECT COUNT(id_plan_estudio) as registro FROM tbl_plan_estudio WHERE plan_vigente = opcion_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_verifica_carga_crear` (IN `hora_inicial_` INT, IN `id_periodo_` INT, IN `hora_final_` INT, IN `id_aula_` INT)  BEGIN
SELECT COUNT(id_carga_academica) as registro FROM tbl_carga_academica WHERE hora_inicial = hora_inicial_
AND id_periodo = id_periodo_ AND hora_final = hora_final_ AND id_aula = id_aula_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_verifica_periodo` (IN `fecha_inicio_` DATE, IN `fecha_final_` DATE)  BEGIN
SELECT fecha_inicio, fecha_final FROM tbl_periodo WHERE fecha_inicio >= fecha_inicio_ AND fecha_final <= fecha_final_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertar_permisos` (`Id_rol_` INTEGER, `Id_objeto_` INTEGER, `Insertar_` INTEGER, `Modificar_` INTEGER, `Eliminar_` INTEGER, `Visualizar_` INTEGER, `Creado_por_` VARCHAR(150))  BEGIN
INSERT INTO  tbl_permisos_usuarios(Id_rol, Id_objeto, Insertar , Modificar, Eliminar, Visualizar,Fecha_creacion,Creado_por)
VALUES (Id_rol_, Id_objeto_, Insertar_ , Modificar_, Eliminar_, Visualizar_, sysdate(),Creado_por_);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_himno` ()  BEGIN
START TRANSACTION;
SELECT e.nombre_completo,e.numero_cuenta,e.correo_electronico
FROM tbl_usuarios e, tbl_carta_egresado f
WHERE e.Id_usuario = f.Id_usuario
AND
f.aprobado = 'aprobado';
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_actividad` (IN `actividad_` VARCHAR(50))  SELECT ac.id_actividad, c.comision, ac.actividad, ac.horas_semanales
FROM tbl_comisiones c
INNER JOIN tbl_personas p 
INNER JOIN tbl_usuarios u ON u.id_persona=p.id_persona
inner JOIN tbl_actividades ac ON ac.id_comisiones=c.id_comisiones
INNER JOIN tbl_actividades_persona ap ON ac.id_actividad=ap.id_actividad and u.id_persona=ap.id_persona
 WHERE ac.actividad= actividad_ AND u.Id_usuario=8$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_actividades_personas` (IN `persona_` INT, IN `actividad_` INT)  BEGIN
SELECT id_persona, id_actividad FROM tbl_actividades_persona
WHERE id_persona = persona_ AND id_actividad = actividad_ ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_area_pref_doce` (IN `id_persona_` BIGINT)  BEGIN
SELECT id_pref_area_doce,
(SELECT a.area FROM tbl_areas AS a WHERE a.id_area = tbl_pref_area_docen.id_area LIMIT 8) area_docente
FROM tbl_pref_area_docen
WHERE id_persona = id_persona_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_asignaturas_ca` ()  begin
SELECT *
from tbl_asignaturas
commit;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_aula_ca` ()  BEGIN

SELECT tbl_aula.id_aula, tbl_aula.codigo, tbl_aula.descripcion, tbl_aula.capacidad,

(SELECT edif.nombre FROM tbl_edificios AS edif INNER JOIN  tbl_aula AS aula ON edif.id_edificio = aula.id_aula LIMIT 1) AS nombre,
(SELECT edif.id_edificio FROM tbl_edificios AS edif LIMIT 1) AS id_edificio,
(SELECT tp.id_tipo_aula FROM tbl_tipo_aula AS tp LIMIT 1) AS id_tipo_aula,
(SELECT tp.tipo_aula FROM tbl_tipo_aula AS tp INNER JOIN tbl_tipo_aula AS ta ON tp.id_tipo_aula=ta.id_tipo_aula LIMIT 1) AS tipo_aula

FROM tbl_aula;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_busca_historial_plan` (IN `nombre_plan_` VARCHAR(50), IN `codigo_plan_` VARCHAR(50))  BEGIN
SET @STRING = (SELECT id_plan_estudio FROM tbl_plan_estudio WHERE nombre = nombre_plan_  AND codigo_plan = codigo_plan_);
SELECT plan.id_plan_estudio AS id_plan_estudio, plan.nombre AS nombre, plan.num_clases, plan.codigo_plan AS codigo_plan, tperi.periodo AS periodo_plan, a.Id_asignatura, a.asignatura AS asig_vigente,
a.codigo AS codigo_asig, a.uv AS uv, a.equivalencias AS equi, rasig.asignatura_requisito AS requisito 
FROM tbl_asignaturas a
JOIN tbl_tipo_plan tplan 
JOIN tbl_plan_estudio plan ON a.id_plan_estudio=plan.id_plan_estudio AND plan.id_tipo_plan=tplan.id_tipo_plan
JOIN tbl_periodo_plan tperi ON a.id_periodo_plan=tperi.id_periodo_plan
JOIN tbl_requisito_asignatura rasig 
WHERE plan.id_plan_estudio = @STRING AND rasig.Id_asignatura=a.Id_asignatura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_campos_carga` ()  BEGIN
SELECT tbl_carga_academica.id_carga_academica,
(SELECT tbl_carga_academica.control),
(SELECT tbl_carga_academica.seccion),
(SELECT tbl_carga_academica.hra_inicio),
(select tbl_carga_academica.hra_final),
(SELECT tbl_carga_academica.num_alumnos)
FROM tbl_carga_academica;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_carga_historial_ca` (IN `num_anno_` INT, IN `num_periodo_` INT)  BEGIN
SET @STRING = (SELECT id_periodo FROM tbl_periodo WHERE num_periodo = num_periodo_  AND num_anno = num_anno_);


SELECT tbl_carga_academica.id_carga_academica AS id_carga_academica,
(SELECT pe.valor FROM tbl_personas_extendidas AS pe WHERE pe.id_persona = tbl_carga_academica.id_persona AND id_atributo = 1 LIMIT 1) AS num_empleado,	
(SELECT CONCAT(p.nombres,' ', p.apellidos) nombres FROM tbl_personas p WHERE p.id_persona = tbl_carga_academica.id_persona LIMIT 1) AS nombres,
(SELECT id_persona FROM tbl_personas p where p.id_persona = tbl_carga_academica.id_persona LIMIT 1 )as id_persona,
(SELECT tbl_carga_academica.control) AS control,
(SELECT a.codigo FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS codigo,
(SELECT a.asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS asignatura,
(SELECT a.id_asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS id_asignatura,
(SELECT tbl_carga_academica.seccion) AS seccion,
(SELECT tbl_carga_academica.hora_inicial) AS hra_inicio,
(select tbl_carga_academica.hora_final) AS hra_final,
(SELECT a.codigo FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS aula,
(SELECT a.id_aula FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS id_aula,
        
(SELECT a.id_edificio FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS id_edificio,
        
(SELECT e.nombre FROM tbl_edificios AS e INNER JOIN tbl_aula AS au ON e.id_edificio=au.id_edificio
       WHERE au.id_aula=tbl_carga_academica.id_aula  LIMIT 1) AS edificio,
(SELECT tbl_carga_academica.num_alumnos) AS  num_alumnos,
(SELECT tbl_carga_academica.dias) AS dia

FROM tbl_carga_academica WHERE id_periodo = @STRING;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_carga_id_periodo_nuevo` (IN `id_periodo_` BIGINT)  BEGIN
SELECT COUNT(id_carga_academica) AS suma FROM tbl_carga_academica WHERE id_periodo=id_periodo_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_carta_presentacion` (IN `cod_empresa` BIGINT)  begin
select ep.cod_empresa,  ep.nombre
,ep.contacto_interno, ep.puesto,
ep.grado_academico, e.nombre, e.numero_cuenta
from empresas ep, estudiantes e
where  cp.cod_estudiante= e.cod_estudiante
group by cp.cod_estudiante;
commit;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_comisiones_reporte` (IN `Id_usuario_` BIGINT)  BEGIN
SELECT tac.id_actividad, tcom.comision, tac.actividad, tac.horas_semanales
FROM tbl_personas tp
INNER JOIN tbl_usuarios us ON us.id_persona=tp.id_persona
INNER JOIN tbl_comisiones tcom
INNER JOIN tbl_actividades tac on tcom.id_comisiones = tac.id_comisiones
INNER JOIN tbl_actividades_persona tap on tac.id_actividad = tap.id_actividad and us.id_persona=tap.id_persona
WHERE us.Id_usuario = Id_usuario_  and tp.id_tipo_persona = 1;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_constancia_clases` (IN `cod_estudiante` BIGINT)  begin
select e.cod_estudiante,  e.nombres
,e.apellidos,e.numero_cuenta, cp.clases_aprobadas,
cp.porcentaje_clases
from charla_practica cp, estudiantes e
where  cp.cod_estudiante= e.cod_estudiante
group by cp.cod_estudiante;
commit;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_datos_usuario` (IN `usuario_` VARCHAR(255))  BEGIN
set @id_persona=(select id_persona from tbl_personas_extendidas where valor=usuario_);
select id_usuario,id_persona,usuario, estado from tbl_usuarios where id_persona=@id_persona;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_docente_ca` ()  begin
SELECT id_persona,nombres,apellidos
from tbl_personas
WHERE id_tipo_persona = 1;
COMMIT;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_editar_ca` ()  BEGIN
SELECT tbl_carga_academica.id_carga_academica AS id,tbl_carga_academica.control AS control,
(SELECT a.codigo FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS codigo,
(SELECT a.asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS asignatura,
(SELECT tbl_carga_academica.seccion) AS seccion,
(SELECT tbl_carga_academica.hra_inicio) AS hra_inicio,
(select tbl_carga_academica.hra_final) AS hra_final,
(SELECT d.dia FROM tbl_dias AS d INNER JOIN  tbl_carga_dias AS cd ON d.id_dia = cd.id_dia
        WHERE cd.id_carga_academica = tbl_carga_academica.id_carga_academica LIMIT 1) AS dia,
(SELECT a.codigo FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS aula,
(SELECT e.nombre FROM tbl_edificios AS e INNER JOIN tbl_aula AS au ON e.id_edificio=au.id_edificio
       WHERE au.id_aula=tbl_carga_academica.id_aula  LIMIT 1) AS edificio,
(SELECT tbl_carga_academica.num_alumnos) AS  num_alumnos
FROM tbl_carga_academica
WHERE id_persona = 18;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_estudiante_charla` (IN `cod_charla` BIGINT)  begin
select cp.cod_charla, cp.no_constancia
,e.numero_cuenta, e.nombres
,e.apellidos, cp.fecha_valida,
cp.fecha_recibida, d.cod_docente,
d.nombres, d.apellidos
from charla_practica cp, docentes d,
estudiantes e
where  cp.cod_estudiante= e.cod_estudiante
and cp.cod_docente= d.cod_docente
group by cp.cod_charla;
commit;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_existe_usuario` (IN `usuario_` VARCHAR(255), IN `contraseña_` VARCHAR(255))  BEGIN
set @id_persona=(select id_persona from tbl_personas_extendidas where valor=usuario_);
select count(p.valor) as usuario  from tbl_usuarios u, tbl_personas_extendidas p where u.id_persona=@id_persona and p.id_persona and p.valor=usuario_;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_gestion_ca` ()  BEGIN
SELECT tbl_carga_academica.id_carga_academica AS id_carga_academica,
(SELECT pe.valor FROM tbl_personas_extendidas AS pe WHERE pe.id_persona = tbl_carga_academica.id_persona AND id_atributo = 1 LIMIT 1) AS num_empleado,	
(SELECT CONCAT(p.nombres,' ', p.apellidos) nombres FROM tbl_personas p WHERE p.id_persona = tbl_carga_academica.id_persona LIMIT 1) AS nombres,
(SELECT id_persona FROM tbl_personas p where p.id_persona = tbl_carga_academica.id_persona LIMIT 1 )as idpersona,
(SELECT tbl_carga_academica.control) AS control,
(SELECT a.codigo FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS codigo,
(SELECT a.asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS asignatura,
(SELECT a.id_asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS id_asignatura,

(SELECT a.uv FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS unidades_valorativas,

(SELECT tbl_carga_academica.seccion) AS seccion,
(SELECT tbl_carga_academica.hora_inicial) AS hra_inicio,
(select tbl_carga_academica.hora_final) AS hra_final,
(SELECT a.codigo FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS aula,
(SELECT a.id_aula FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS id_aula,
        
(SELECT a.id_edificio FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS id_edificio,
        
(SELECT e.nombre FROM tbl_edificios AS e INNER JOIN tbl_aula AS au ON e.id_edificio=au.id_edificio
       WHERE au.id_aula=tbl_carga_academica.id_aula  LIMIT 1) AS edificio,
       
(SELECT tbl_carga_academica.num_alumnos) AS  num_alumnos,
(SELECT tbl_carga_academica.num_alumnos) AS  num_alumnos,
(SELECT tbl_carga_academica.dias) AS dia,
(SELECT m.modalidad FROM tbl_modalidad AS m INNER JOIN tbl_carga_academica AS ca ON m.id_modalidad=ca.id_modalidad 
			WHERE m.id_modalidad = tbl_carga_academica.id_modalidad LIMIT 1) AS modalidad,
(SELECT m.id_modalidad FROM tbl_modalidad AS m INNER JOIN tbl_carga_academica AS ca ON m.id_modalidad=ca.id_modalidad 
			WHERE m.id_modalidad = tbl_carga_academica.id_modalidad LIMIT 1) AS id_modalidad

FROM tbl_carga_academica WHERE id_periodo = (SELECT MAX(id_periodo)FROM tbl_periodo);


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_gestion_plan_estudio` ()  BEGIN
SELECT tbl_plan_estudio.id_plan_estudio AS id_plan_estudio,

(SELECT tp.nombre FROM tbl_tipo_plan tp WHERE tp.id_tipo_plan = tbl_plan_estudio.id_tipo_plan LIMIT 1) AS nombre_tipo_plan,
(SELECT tbl_plan_estudio.nombre) AS  nombre_plan,
(SELECT tbl_plan_estudio.num_clases) AS  num_clases,
(SELECT tbl_plan_estudio.codigo_plan) AS codigo_plan,
(SELECT tbl_plan_estudio.plan_vigente) AS plan_vigente,
(SELECT tbl_plan_estudio.id_tipo_plan) AS id_tipo_plan


FROM tbl_plan_estudio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_himno` (IN `jornada` VARCHAR(255))  BEGIN
SELECT p.nombre,p.documento, c.valor, h.fecha, h.hora
from tbl_personas p, tbl_contactos c,tbl_alumnos_himno ah,tbl_horario_himno h,tbl_tipo_contactos t
WHERE p.id_persona = c.id_persona
AND ah.id_persona = p.id_persona
AND ah.id_horario_himno = h.id_horario_himno
AND h.jornada  = jornada
AND ah.aprobado !='aprobado'
AND t.descripcion ='CORREO'
AND t.id_tipo_contacto= c.id_tipo_contacto;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_himno_unica` (IN `numero_cuenta` BIGINT(25))  BEGIN
SELECT p.nombre,p.documento,c.valor
FROM tbl_personas p, tbl_contactos c
WHERE  p.documento = numero_cuenta
AND c.id_persona = p.id_persona
AND c.id_tipo_contacto = 4;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_historial_plan_estudio` ()  BEGIN
SELECT plan.id_plan_estudio, plan.nombre, plan.codigo_plan, plan.num_clases, plan.fecha_creacion, plan.plan_vigente
FROM tbl_plan_estudio plan 
WHERE plan.plan_vigente = 'NO'; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_historial_plan_vigente` ()  BEGIN
 SELECT plan.id_plan_estudio AS id_plan_estudio, plan.nombre AS nombre, plan.num_clases, plan.codigo_plan AS codigo_plan, tperi.periodo AS periodo_plan, a.Id_asignatura, a.asignatura AS asig_vigente,
a.codigo AS codigo_asig, a.uv AS uv, a.equivalencias AS equi, rasig.asignatura_requisito AS requisito 
FROM tbl_asignaturas a
 JOIN tbl_tipo_plan tplan 
 JOIN tbl_plan_estudio plan ON a.id_plan_estudio=plan.id_plan_estudio AND plan.id_tipo_plan=tplan.id_tipo_plan
 JOIN tbl_periodo_plan tperi ON a.id_periodo_plan=tperi.id_periodo_plan
 JOIN tbl_requisito_asignatura rasig 
WHERE plan.plan_vigente = 'SI' AND rasig.Id_asignatura=a.Id_asignatura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_asignatura_ca` (IN `id_asignatura_` INT)  BEGIN
SELECT Id_asignatura AS id_a, asignatura AS asig, codigo AS codA, uv AS uv FROM tbl_asignaturas WHERE Id_asignatura = id_asignatura_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_dia_ca` (IN `id_dia_` INT)  BEGIN
SELECT Id_dia, dia FROM tbl_dias WHERE Id_dia = id_dia_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_edificio` (IN `id_edificio_` INT)  BEGIN
SELECT id_edificio, nombre FROM tbl_edificios WHERE id_edificio = id_edificio_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_estado_civil_ca` (IN `id_estado_civil_` INT)  BEGIN
SELECT id_estado_civil FROM tbl_estadocivil WHERE id_estado_civil = id_estado_civil_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_genero_ca` (IN `id_genero_` INT)  BEGIN
SELECT id_genero FROM tbl_genero WHERE id_genero = id_genero_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_hora_ca` (IN `hora_` INT)  BEGIN
SELECT hora FROM tbl_hora WHERE hora = hora_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_jornada` (IN `id_jornada_` VARCHAR(50))  BEGIN
SELECT id_jornada FROM tbl_jornadas WHERE id_jornada = id_jornada_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_modalidad_ca` (IN `id_modalidad_` INT)  BEGIN
SELECT id_modalidad, modalidad FROM tbl_modalidad WHERE id_modalidad = id_modalidad_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_periodo_ca` (IN `num_anno_` INT, IN `num_periodo_` INT)  BEGIN
SELECT id_periodo FROM tbl_periodo WHERE num_anno=num_anno_ AND num_periodo=num_periodo_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_id_tipo_periodo` (IN `id_periodo_` INT)  BEGIN
SELECT descripcion FROM tbl_tipo_periodo WHERE id_periodo = id_periodo_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_jornada_docente` (IN `id_jornada_` BIGINT)  BEGIN
SELECT jornada FROM tbl_jornadas WHERE id_jornada = id_jornada_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_modal_ca` (IN `id_persona_` BIGINT)  BEGIN

set @idnumero_empleado=(select id_atributos from tbl_atributos where atributo="numero_empleado" or atributo="NUMERO_EMPLEADO");

select DISTINCT tp.id_persona, concat(tp.nombres," ",tp.apellidos) as "nombre",tpx1.valor as numero_empleado,(select GROUP_CONCAT( DISTINCT concat(tga.grado_academico,": ",teg.especialidad," \n")) from tbl_personas tp5, tbl_especialidad_grado teg, tbl_grados_academicos tga,tbl_grados_academicos_personas tgap where tgap.id_persona=tp5.id_persona and tgap.id_persona=tp.id_persona and tgap.id_especialidad=teg.id_especialidad and tga.id_grado_academico=teg.id_grado_academico ) as formacion_academica,
tj.jornada as Jornada,tca.categoria as Categoria,thd.hr_inicial as 'Hora_Entrada', thd.hr_final as 'Hora_Salida',

(SELECT IFNULL(GROUP_CONCAT(a.area SEPARATOR ', '), '') FROM tbl_areas AS a 
JOIN tbl_pref_area_docen on a.id_area = tbl_pref_area_docen.id_area) AS pregunta1,

(SELECT  IFNULL(GROUP_CONCAT(a.area SEPARATOR ', '), '') FROM tbl_areas AS a 
JOIN tbl_expe_academica_docente on a.id_area = tbl_expe_academica_docente.id_area) AS pregunta2,

(SELECT  IFNULL(GROUP_CONCAT(a.asignatura SEPARATOR ', '), '') FROM tbl_asignaturas AS a 
JOIN tbl_pref_asig_docen on a.Id_asignatura = tbl_pref_asig_docen.Id_asignatura) AS pregunta3,

(SELECT IFNULL(GROUP_CONCAT(a.asignatura SEPARATOR ', '), '') FROM tbl_asignaturas AS a 
JOIN tbl_desea_asig_doce on a.Id_asignatura = tbl_desea_asig_doce.Id_asignatura) AS pregunta4

from tbl_personas tp

JOIN tbl_personas_extendidas tpx1 on tp.id_persona=tpx1.id_persona
JOIN tbl_atributos ta1 on tpx1.id_atributo=ta1.id_atributos and @idnumero_empleado=ta1.id_atributos
JOIN tbl_horario_docentes thd on tp.id_persona=thd.id_persona
JOIN tbl_jornadas tj on thd.id_jornada = tj.id_jornada
JOIN tbl_categoria_personas tcap on tp.id_persona = tcap.id_persona
JOIN tbl_categorias tca on tcap.id_categoria = tca.id_categoria
JOIN tbl_comisiones tcom
JOIN tbl_areas tas
JOIN tbl_actividades tac on tcom.id_comisiones = tac.id_comisiones
JOIN tbl_actividades_persona tap on tac.id_actividad = tap.id_actividad and tp.id_persona=tap.id_persona
where ta1.id_atributos = tpx1.id_atributo  and tp.id_persona = id_persona_;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_municipio` ()  BEGIN
SELECT tbl_municipios_hn.id_municipio AS id_municipio,tbl_municipios_hn.municipio AS municipio,tbl_municipios_hn.codigo AS codigo,
(SELECT d.departamento FROM tbl_departamentos d WHERE d.id_departamento= tbl_municipios_hn.id_departamento LIMIT 1) AS departamento
FROM tbl_municipios_hn;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_periodo_ca` ()  BEGIN
SELECT id_periodo, num_periodo, num_anno FROM tbl_periodo;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_reporte_carga` (IN `id_periodo_` BIGINT)  SELECT tbl_carga_academica.id_carga_academica AS id_carga_academica,	
(SELECT p.nombres FROM tbl_personas p WHERE p.id_persona = tbl_carga_academica.id_persona LIMIT 1) AS nombres,
(SELECT tbl_carga_academica.control) AS control,
(SELECT a.codigo FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS codigo,
(SELECT a.asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS asignatura,
(SELECT tbl_carga_academica.seccion) AS seccion,
(SELECT tbl_carga_academica.hora_inicial) AS hra_inicio,
(select tbl_carga_academica.hora_final) AS hra_final,
(SELECT tbl_carga_academica.dias LIMIT 1) AS dia,
(SELECT a.codigo FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS aula,
(SELECT e.nombre FROM tbl_edificios AS e INNER JOIN tbl_aula AS au ON e.id_edificio=au.id_edificio
       WHERE au.id_aula=tbl_carga_academica.id_aula  LIMIT 1) AS edificio,
(SELECT tbl_carga_academica.num_alumnos) AS  num_alumnos
FROM tbl_carga_academica WHERE id_periodo=id_periodo_$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_reporte_docente` (IN `Id_persona_` BIGINT)  BEGIN
SELECT tbl_carga_academica.id_carga_academica AS id,tbl_carga_academica.control AS control,
(SELECT a.codigo FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS codigo,
(SELECT a.asignatura FROM tbl_asignaturas a WHERE a.Id_asignatura = tbl_carga_academica.id_asignatura LIMIT 1) AS asignatura,
(SELECT tbl_carga_academica.seccion) AS seccion,
(SELECT tbl_carga_academica.hora_inicial) AS hra_inicial,
(select tbl_carga_academica.hora_final) AS hra_final,
(SELECT tbl_carga_academica.dias) AS dia,
(SELECT a.codigo FROM tbl_aula AS a INNER JOIN tbl_tipo_aula AS ta ON a.id_tipo_aula=ta.id_tipo_aula
        WHERE a.id_aula = tbl_carga_academica.id_aula LIMIT 1) AS aula,
(SELECT e.nombre FROM tbl_edificios AS e INNER JOIN tbl_aula AS au ON e.id_edificio=au.id_edificio
       WHERE au.id_aula=tbl_carga_academica.id_aula  LIMIT 1) AS edificio,
(SELECT tbl_carga_academica.num_alumnos) AS  num_alumnos

FROM tbl_carga_academica
WHERE id_persona = Id_persona_;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_simultanea` (IN `tipo` VARCHAR(255))  BEGIN
SELECT p.nombre, p.documento, c.valor, cc.razon_cambio
FROM tbl_personas p, tbl_cambio_carrera cc, tbl_contactos c, tbl_tipo_contactos t
WHERE cc.id_persona = p.id_persona
AND cc.tipo = tipo
AND cc.aprobado != 'aprobado'
AND t.id_tipo_contacto = 4
AND c.id_persona = p.id_persona
GROUP BY p.nombre;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sel_tipo_aula_carga` (IN `id_tipo_aula_` INT)  BEGIN
SELECT id_tipo_aula, tipo_aula FROM tbl_tipo_aula WHERE id_tipo_aula = id_tipo_aula_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_cambio_carrera` (IN `APROBADO` VARCHAR(50), IN `ncuenta` BIGINT(20), IN `tipo` VARCHAR(50))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona
FROM tbl_personas
WHERE documento = ncuenta;
UPDATE `tbl_cambio_carrera`
SET `aprobado` = APROBADO,
`fecha_creacion` = now()
WHERE id_persona = @id_persona
AND tipo = tipo;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_cambio_carrera_observacion` (IN `APROBADO` VARCHAR(50), IN `OBSERVACION` VARCHAR(255), IN `ncuenta` BIGINT(20))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona
FROM tbl_personas
WHERE documento = ncuenta;
UPDATE `tbl_cambio_carrera`
SET `aprobado`        = APROBADO,
`observacion`     = OBSERVACION,
`fecha_creacion`  = now()
WHERE id_persona = @id_persona;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_equivalencias` (IN `APROBADO` VARCHAR(50), IN `ncuenta` BIGINT(20))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona
FROM tbl_personas
WHERE documento = ncuenta;
UPDATE `tbl_equivalencias`
SET `aprobado` = APROBADO,
`fecha_creacion` = now()
WHERE id_persona = @id_persona;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_equivalencias_observacion` (IN `APROBADO` VARCHAR(50), IN `OBSERVACION` VARCHAR(255), IN `ncuenta` BIGINT(20))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona
FROM tbl_personas
WHERE documento = ncuenta;
UPDATE `tbl_equivalencias`
SET `aprobado` = APROBADO,
`observacion`     = OBSERVACION,
`fecha_creacion`  = now()
WHERE id_persona = @id_persona;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_finalizacion_practica_observacion` (IN `aprobado` VARCHAR(255), IN `observacion` VARCHAR(255), IN `ncuenta` BIGINT(20))  BEGIN
START TRANSACTION;
SELECT @id_persona := id_persona
FROM tbl_personas
WHERE documento = ncuenta;
UPDATE `tbl_finalizacion_practica`
SET `aprobado`        = APROBADO,
`observacion`     = OBSERVACION,
`fecha_creacion`  = now()
WHERE id_persona = @id_persona;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `upd_himno` (IN `aprobado` VARCHAR(255), IN `ncuenta` BIGINT(20), IN `jornada` VARCHAR(255))  BEGIN
START TRANSACTION;
SELECT @id_persona := p.id_persona,  @id_horario := hh.id_horario_himno
FROM tbl_personas p, tbl_horario_himno hh
WHERE p.documento = ncuenta
AND hh.jornada = jornada;
UPDATE `tbl_alumnos_himno`
SET `aprobado` = aprobado,
`fecha_creacion` = now()
WHERE id_persona = @id_persona
AND id_horario_himno = @id_horario ;
COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_acta`
--

CREATE TABLE `tbl_acta` (
  `id_acta` int(11) NOT NULL,
  `id_estado` int(2) NOT NULL,
  `id_tipo` int(2) NOT NULL,
  `id_reunion` int(15) NOT NULL,
  `num_acta` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora_inicial` time NOT NULL,
  `hora_final` time NOT NULL,
  `desarrollo` text COLLATE utf8mb4_spanish2_ci,
  `fecha_edicion` datetime DEFAULT NULL,
  `redactor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_acta`
--

INSERT INTO `tbl_acta` (`id_acta`, `id_estado`, `id_tipo`, `id_reunion`, `num_acta`, `fecha`, `hora_inicial`, `hora_final`, `desarrollo`, `fecha_edicion`, `redactor`) VALUES
(2, 3, 2, 18, 'REU-0621', '2021-07-05', '12:30:00', '12:45:00', 'SSD,FJSDJKBFKJS \r\nSDFJKNSDJFNSDF\r\n', '2021-07-23 14:12:14', 1),
(8, 3, 2, 9, 'REU-2021/070', '2021-06-22', '15:00:00', '16:30:00', '1. sdfsd\r\n2. hjk\r\n3. dfffffffff\r\n4. dfgdfgdfg\r\n5. dfgdfgdfg\r\n6. dfgdfgdfg\r\n', '2021-07-30 12:55:05', 1),
(14, 2, 2, 24, 'REU-2021-08', '2021-07-10', '17:00:00', '18:00:00', 'DFGFGDFGDFFSDFG\r\n1. GDFGDFGDFG\r\n2. DFGDFGDFGD\r\n3. DFGDFGDFGDFG\r\n4. DFGDFGDFGDFG', '2021-08-01 15:28:45', 1),
(22, 3, 1, 17, 'REU-2021-066', '2021-07-18', '17:00:00', '18:00:00', 'DGHFGHFGHFGHFGHFGHF6\r\nGH6\r\nFG6\r\nH6\r\nFGH6\r\nF6\r\nGH6\r\nFG6\r\nH6\r\nFG6\r\nH\r\nFGHFGKHFJHJFGOIHJOIDJOBJOIDJOIDGF\r\nDFKGNDNBNDKBJNJKDVKJNDFV\r\nDKLGDNBJNFGBFG', '2021-07-30 18:51:19', 1),
(23, 2, 1, 18, 'REU-2021-07', '2021-07-18', '12:30:00', '12:45:00', 'FGHFGGHDGFDGFGDDGFASDDDFSAD', '2021-07-31 11:42:56', 1),
(25, 2, 2, 1, 'REU-3107/2021', '2021-07-31', '14:20:00', '16:25:00', '1 .- DSFGGFDFGDFG\r\n2.- DFGDFGDGDFGDFG', '2021-07-31 16:45:48', 1),
(26, 2, 1, 17, NULL, '2021-08-01', '14:39:09', '14:39:09', NULL, '2021-08-01 14:39:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_acta_recursos`
--

CREATE TABLE `tbl_acta_recursos` (
  `id_recursos` int(11) NOT NULL,
  `id_acta` int(100) NOT NULL,
  `formato` varchar(5) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `fecha_carga` datetime NOT NULL,
  `redactor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_acta_recursos`
--

INSERT INTO `tbl_acta_recursos` (`id_recursos`, `id_acta`, `formato`, `url`, `nombre`, `fecha_carga`, `redactor`) VALUES
(1, 22, 'docx', '../archivos/archivoactas/22/', 'ajustes a bbdd.docx', '2021-07-24 16:45:54', 1),
(2, 22, 'docx', '../archivos/archivoactas/22/', 'asignaciones.docx', '2021-07-24 16:45:54', 1),
(3, 22, 'docx', '../archivos/archivoactas/22/', 'aspectos con ámbito tecnológico que aborda Ley de Administración Publica.docx', '2021-07-24 16:45:54', 1),
(4, 22, 'zip', '../archivos/archivoactas/22/', 'mca.sql.zip', '2021-07-24 16:45:54', 1),
(5, 2, 'docx', '../archivos/archivoactas/2/', 'ajustes a bbdd.docx', '2021-07-14 17:12:22', 1),
(6, 8, 'docx', '../archivos/archivoactas/8/', 'ajustes a bbdd.docx', '2021-07-30 12:21:02', 1),
(7, 8, 'docx', '../archivos/archivoactas/8/', 'asignaciones.docx', '2021-07-30 12:21:02', 1),
(8, 8, 'docx', '../archivos/archivoactas/8/', 'aspectos con ámbito tecnológico que aborda Ley de Administración Publica.docx', '2021-07-30 12:21:02', 1),
(9, 8, 'mpp', '../archivos/archivoactas/8/', 'CAPACITACION.mpp', '2021-07-30 12:21:02', 1),
(10, 8, 'mpp', '../archivos/archivoactas/8/', 'IMPLEMENTACIOON.mpp', '2021-07-30 12:21:02', 1),
(11, 8, 'mpp', '../archivos/archivoactas/8/', 'MODULOS.mpp', '2021-07-30 12:21:02', 1),
(12, 25, 'zip', '../archivos/archivoactas/25/', 'es-ES.zip', '2021-07-31 16:45:07', 1),
(13, 14, 'docx', '../archivos/archivoactas/14/', 'ajustes a bbdd.docx', '2021-08-01 15:28:45', 1),
(14, 14, 'docx', '../archivos/archivoactas/14/', 'asignaciones.docx', '2021-08-01 15:28:45', 1),
(15, 14, 'docx', '../archivos/archivoactas/14/', 'aspectos con ámbito tecnológico que aborda Ley de Administración Publica.docx', '2021-08-01 15:28:45', 1),
(16, 14, 'mpp', '../archivos/archivoactas/14/', 'CAPACITACION.mpp', '2021-08-01 15:28:45', 1),
(17, 14, 'zip', '../archivos/archivoactas/14/', 'es-ES.zip', '2021-08-01 15:28:45', 1),
(18, 14, 'mpp', '../archivos/archivoactas/14/', 'IMPLEMENTACIOON.mpp', '2021-08-01 15:28:45', 1),
(19, 14, 'zip', '../archivos/archivoactas/14/', 'mca.sql.zip', '2021-08-01 15:28:45', 1),
(20, 14, 'mpp', '../archivos/archivoactas/14/', 'MODULOS.mpp', '2021-08-01 15:28:45', 1),
(21, 14, 'zip', '../archivos/archivoactas/14/', 'Update.zip', '2021-08-01 15:28:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_actividades`
--

CREATE TABLE `tbl_actividades` (
  `id_actividad` int(11) NOT NULL,
  `actividad` varchar(150) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `nombre_proyecto` varchar(50) DEFAULT NULL,
  `horas_semanales` varchar(50) DEFAULT NULL,
  `id_comisiones` int(11) NOT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificación` date DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_actividades`
--

INSERT INTO `tbl_actividades` (`id_actividad`, `actividad`, `descripcion`, `nombre_proyecto`, `horas_semanales`, `id_comisiones`, `Fecha_creacion`, `Creado_por`, `Fecha_modificación`, `Modificado_por`) VALUES
(1, 'Supervisar Práctica Profesional', 'prueba', 'prueba', '11', 1, '2021-03-16', NULL, '2021-03-16', NULL),
(2, 'actividad2', '', '', '', 2, '2021-03-16', NULL, '2021-04-29', 'ADMIN'),
(3, 'ACTIVIDAD 3', ' B', 'B', '2', 4, NULL, NULL, NULL, NULL),
(4, 'ACTIVIDAD 5', 'BB', 'B', '5', 3, NULL, NULL, NULL, NULL),
(5, 'ACTIVIDAD 6', 'B', 'B', '0', 4, NULL, NULL, NULL, NULL),
(6, 'ACTIVIDAD 4', 'B', 'B', '4', 2, NULL, NULL, NULL, NULL),
(7, '1. PROMOVER EL DESARROLLO DE LA REFORMA UNIVERSITA', 'BASCI', 'B', '5', 19, NULL, NULL, '2021-04-29', 'ADMIN'),
(8, '2. ASESORAR AL JEFE  EN TODOS LOS ASUNTOS ACA-CIEN', 'B', 'B', '6', 19, NULL, NULL, NULL, NULL),
(9, '3. DICTAMINAR SOBRE LAS PROPUESTAS DE CREACIÓN. ', 'B', 'B', '3', 19, NULL, NULL, NULL, NULL),
(10, '4. REVISAR LOS OBJETIVOS, CONTENIDO DE CADA UNIDAD', NULL, NULL, '4', 19, NULL, NULL, NULL, NULL),
(11, '5. EVALUAR EL FUNCIONAMIENTO GLOBAL DEL DEPARTAMEN', NULL, NULL, '6', 19, NULL, NULL, NULL, NULL),
(12, '6. PROMOVER PRIORIDADES Y LÍNEAS DE INVESTIGACIÓN ', NULL, NULL, '4', 19, NULL, NULL, NULL, NULL),
(13, '1. DIRIGIR LOS PROCESOS ACADÉMICOS DE LA CARRERA', 'PRUEBA', 'PROBANDO', '3', 13, NULL, NULL, '2021-04-29', 'ADMIN'),
(14, '2. DESARROLLAR LA PROPUESTA DEL MODELO EDUCATIVO ', NULL, NULL, '9', 13, NULL, NULL, NULL, NULL),
(15, '3. VIGILAR EL CUMPLIMIENTO DEL PLAN CURRICULAR ', NULL, NULL, '8', 13, NULL, NULL, NULL, NULL),
(16, '4. EVALUAR PERMANENTEMENTE LOS PROGRAMAS DE LA CAR', NULL, NULL, '6', 13, NULL, NULL, NULL, NULL),
(17, '5. GESTIONAR RECURSOS PARA EL DESARROLLO DE LA CAR', NULL, NULL, '6', 13, NULL, NULL, NULL, NULL),
(18, '7. RECOMENDAR SANCIONES PARA PROFESORES Y ESTUDIAN', NULL, NULL, '8', 13, NULL, NULL, NULL, NULL),
(19, '1. VELAR POR LAS RELACIONES PUBLICAS Y LA PROMOCIO', NULL, NULL, '5', 17, NULL, NULL, NULL, NULL),
(20, '2. PROMOCIONAR LAS ACTIVIDADES DE COMITÉ DE VINCU.', NULL, NULL, '5', 17, NULL, NULL, NULL, NULL),
(21, '3. PRESENTAR INFORMES POR PERIODO DE LAS ACTIVIDAD', NULL, NULL, '4', 17, NULL, NULL, NULL, NULL),
(22, '1- PLANIFICAR Y SISTEMATIZAR ACCIONES DE VINCUL.', 'HOLA', 'PRUEBA', '4', 27, NULL, NULL, '2021-04-29', 'ADMIN'),
(23, '2. HACER EL REGISTRO DE LOS PROYECTOS EN LA OFICIN', NULL, NULL, '7', 14, NULL, NULL, NULL, NULL),
(24, '3. ACTUALIZAR Y PROMOCIONAR SU OFERTA DE VINCULACI', NULL, NULL, '3', 14, NULL, NULL, NULL, NULL),
(25, '4. DESARROLLAR ACCIONES DE IDENTIFICACIÓN Y ATENCI', NULL, NULL, '4', 14, NULL, NULL, NULL, NULL),
(26, '5. COORDINAR CON QUIEN CORRESPONDA, DENTRO Y FUERA', NULL, NULL, '8', 14, NULL, NULL, NULL, NULL),
(27, '6. PROMOVER EVENTOS DE EDUCACIÓN NO FORMAL Y DE FO', NULL, NULL, '6', 14, NULL, NULL, NULL, NULL),
(28, '7. IMPLEMENTAR PROGRAMAS Y MEDIDAS ORIENTADAS A LA', NULL, NULL, '9', 14, NULL, NULL, NULL, NULL),
(29, '8. ESTABLECER MECANISMOS PARA SEGUIMIENTO A EGRESA', NULL, NULL, '6', 14, NULL, NULL, NULL, NULL),
(30, '9. PROPICIAR MEDIDAS Y ACCIONES DE VINCULACIÓN ', NULL, NULL, '7', 14, NULL, NULL, NULL, NULL),
(31, '10. IMPLEMENTAR Y DIFUNDIR ACTIVIDADES CULTURALES ', NULL, NULL, '4', 14, NULL, NULL, NULL, NULL),
(32, '11. ORGANIZAR Y EJECUTAR EL REGISTRO DEL PENSUM AC', NULL, NULL, '4', 14, NULL, NULL, NULL, NULL),
(33, '12. APLICAR E INTRODUCIR EN LA BASE DE DATOS LOS I', NULL, NULL, '7', 14, NULL, NULL, NULL, NULL),
(34, '1. DEBE LLEVAR UN EXPEDIENTE DE CONTROL DE HORAS VOAE', 'HOLA', '', '8', 15, NULL, NULL, '2021-04-29', 'ADMIN'),
(35, '2. DEBE REGISTRAR LAS ACTIVIDADES A PROGRAMAR CON ESTUDIANTE', NULL, NULL, '5', 15, NULL, NULL, NULL, NULL),
(36, '3. REGISTRAR LOS PROYECTOS JUNTO CON EL COORDINADO', NULL, NULL, '6', 15, NULL, NULL, NULL, NULL),
(37, '1. IDENTIFICAR, DISEÑAR LAS PRIORIDADES DE INVESTIGACION', NULL, NULL, '3', 18, NULL, NULL, NULL, NULL),
(38, '2. EJECUTAR ORGANIZAR Y PROMOVER ACTIVIDADES DE GE', NULL, NULL, '7', 18, NULL, NULL, NULL, NULL),
(39, '3. REVISAR Y DAR SEGUIMIENTO AL DESARROLLO DE LA E', NULL, NULL, '3', 18, NULL, NULL, NULL, NULL),
(40, '4. APROBAR EN PRIMERA INSTANCIA LOS PROYECTOS DE I', NULL, NULL, '2', 18, NULL, NULL, NULL, NULL),
(41, '5. DICTAMINAR SOBRE LOS AVANCES E INFORMES FINALES', NULL, NULL, '8', 18, NULL, NULL, NULL, NULL),
(42, '1. ELABORACIÓN Y CUSTODIA DE LAS ACTAS Y DOCUMENTO', NULL, NULL, '4', 26, NULL, NULL, NULL, NULL),
(43, '2. LA COLABORACIÓN EN LA COORDINACIÓN DE LA GESTIÓ', NULL, NULL, '3', 26, NULL, NULL, NULL, NULL),
(44, '3. DAR FE DE LOS ACUERDOS DE LA ASAMBLEA DEL DEPARTAMENTO', NULL, NULL, '6', 26, NULL, NULL, NULL, NULL),
(45, '4. ASISTIR A LAS ASAMBLEAS DEL DEPARTAMENTO', NULL, NULL, '4', 26, NULL, NULL, NULL, NULL),
(46, '5. CUANTAS FUNCIONES PUEDAN SERLE CONSIGNADAS POR ', NULL, NULL, '8', 26, NULL, NULL, NULL, NULL),
(47, '1.RESPONSABLE DE MONITOREAR EL REGISTRO DEL PLAN DE ESTUDIOS', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(48, '2.RESPONSABLE DE REDISEÑAR EL PLAN DE ESTUDIO Y DEL PROCESO ', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(49, '3.RESPONSABLE DE MANTENER EL COMPENDIO DOCUMENTAL DEL PROCES', NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(51, 'ZRR', 'ZRR', 'ZRR', '1', 4, '2021-04-08', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_actividades_persona`
--

CREATE TABLE `tbl_actividades_persona` (
  `id_act_persona` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_persona` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_actividades_persona`
--

INSERT INTO `tbl_actividades_persona` (`id_act_persona`, `id_actividad`, `id_persona`) VALUES
(1, 1, 6),
(132, 6, 81),
(133, 1, 82),
(134, 4, 83),
(135, 2, 84),
(136, 5, 85),
(137, 6, 86),
(138, 6, 87),
(139, 4, 88),
(140, 6, 89),
(141, 14, 90),
(142, 35, 91),
(143, 21, 92),
(144, 21, 93),
(145, 48, 94),
(146, 47, 95),
(147, 28, 96),
(148, 35, 97),
(149, 30, 98),
(150, 17, 99),
(151, 1, 100),
(152, 27, 101),
(153, 49, 102),
(154, 25, 103),
(155, 6, 104),
(156, 1, 105),
(157, 1, 106),
(158, 34, 107),
(159, 6, 108),
(160, 48, 109),
(161, 48, 110),
(162, 49, 111),
(163, 4, 112),
(164, 5, 113),
(165, 36, 114),
(166, 1, 115),
(167, 6, 116),
(168, 1, 117),
(169, 6, 118),
(197, 37, 24),
(212, 2, 108),
(213, 1, 108),
(217, 3, 149),
(219, 37, 149);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_acuerdos`
--

CREATE TABLE `tbl_acuerdos` (
  `id_acuerdo` int(11) NOT NULL,
  `id_acta` int(10) DEFAULT NULL,
  `id_participante` bigint(20) DEFAULT NULL,
  `id_estado` int(100) DEFAULT NULL,
  `nombre_acuerdo` varchar(150) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_spanish2_ci,
  `resolucion` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `mensaje` varchar(15000) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_acuerdos`
--

INSERT INTO `tbl_acuerdos` (`id_acuerdo`, `id_acta`, `id_participante`, `id_estado`, `nombre_acuerdo`, `descripcion`, `resolucion`, `fecha_expiracion`, `fecha_modificacion`, `mensaje`) VALUES
(1, 14, 159, 1, 'entrega listado de alumno', 'listado de alumnos por egresar', 'PENDIENTE', '2021-08-07', NULL, NULL),
(2, 14, 116, 1, 'entrega documentosss', 'Documento de word y pdfsss', 'PENDIENTE', '2021-08-13', NULL, NULL),
(3, 25, 24, 1, 'hola hola', 'hola hola hola hola', 'PENDIENTE', '2021-08-25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_aldeas_caserios_hn`
--

CREATE TABLE `tbl_aldeas_caserios_hn` (
  `id_aldea_caserio` bigint(20) NOT NULL,
  `nombre_aldea_caserio` varchar(100) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `creado_por` varchar(80) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `modificado_por` varchar(80) DEFAULT NULL,
  `id_municipio` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_aldeas_caserios_hn`
--

INSERT INTO `tbl_aldeas_caserios_hn` (`id_aldea_caserio`, `nombre_aldea_caserio`, `codigo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `id_municipio`) VALUES
(1, 'La Ceiba', 10101, '2021-05-31 21:53:52', 'ADMIN', NULL, NULL, 1),
(2, 'Armenia Bonito ', 10102, '2021-05-31 21:54:30', 'ADMIN', NULL, NULL, 1),
(3, 'Bontilo', 10103, '2021-05-31 21:54:58', 'ADMIN', NULL, NULL, 1),
(4, 'Coroza', 10104, '2021-05-31 21:56:14', 'ADMIN', NULL, NULL, 1),
(5, 'Dantilo', 10105, '2021-05-31 21:56:38', 'ADMIN', NULL, NULL, 1),
(6, 'El Búfalo', 10106, '2021-05-31 21:57:01', 'ADMIN', NULL, NULL, 1),
(7, 'El paralso o Bataca', 10107, '2021-05-31 21:57:43', 'ADMIN', NULL, NULL, 1),
(8, 'El Perú', 10108, '2021-05-31 21:58:08', 'ADMIN', NULL, NULL, 1),
(9, 'El Pital', 10109, '2021-05-31 21:58:41', 'ADMIN', NULL, NULL, 1),
(10, 'La Ausencia', 10110, '2021-05-31 21:59:00', 'ADMIN', NULL, NULL, 1),
(11, 'La Presa', 10111, '2021-05-31 21:59:14', 'ADMIN', NULL, NULL, 1),
(12, 'Las Mangas', 10112, '2021-05-31 21:59:35', 'ADMIN', NULL, NULL, 1),
(13, 'Los Limpios', 10113, '2021-05-31 21:59:53', 'ADMIN', NULL, NULL, 1),
(14, 'Piedra Pintada o la Cok>rada', 10114, '2021-05-31 22:00:36', 'ADMIN', NULL, NULL, 1),
(15, 'Rlo Marta', 10115, '2021-05-31 22:00:47', 'ADMIN', NULL, NULL, 1),
(16, 'Rlo Viejo', 10116, '2021-05-31 22:01:14', 'ADMIN', NULL, NULL, 1),
(17, 'Sambo Creek', 10117, '2021-05-31 22:01:33', 'ADMIN', NULL, NULL, 1),
(18, 'Satuye', 10118, '2021-05-31 22:01:49', 'ADMIN', NULL, NULL, 1),
(19, 'Toncontin', 10119, '2021-05-31 22:02:05', 'ADMIN', NULL, NULL, 1),
(20, 'El Urraco', 10120, '2021-05-31 22:02:19', 'ADMIN', NULL, NULL, 1),
(21, 'Yaruca', 10121, '2021-05-31 22:02:36', 'ADMIN', NULL, NULL, 1),
(22, 'El Porvenir', 10201, '2021-05-31 22:03:28', 'ADMIN', NULL, NULL, 2),
(23, 'Burgos', 10202, '2021-05-31 22:04:43', 'ADMIN', NULL, NULL, 2),
(24, 'Cáceres', 10203, '2021-05-31 22:04:53', 'ADMIN', NULL, NULL, 2),
(25, 'Campo Salado Barra', 10204, '2021-05-31 22:05:14', 'ADMIN', NULL, NULL, 2),
(26, 'Caracas', 10205, '2021-05-31 22:05:28', 'ADMIN', NULL, NULL, 2),
(27, 'Ceiba Mocha', 10206, '2021-05-31 22:05:42', 'ADMIN', NULL, NULL, 2),
(28, 'El Pino', 10208, '2021-05-31 22:06:15', 'ADMIN', NULL, NULL, 2),
(29, 'La Ruidosa', 10209, '2021-05-31 22:06:29', 'ADMIN', NULL, NULL, 2),
(30, 'La Unión', 10210, '2021-05-31 22:06:44', 'ADMIN', NULL, NULL, 2),
(31, 'López Bonito', 10211, '2021-05-31 22:07:02', 'ADMIN', NULL, NULL, 2),
(32, 'Orotino', 10212, '2021-05-31 22:07:20', 'ADMIN', NULL, NULL, 2),
(33, 'San José de Montevideo', 10213, '2021-05-31 22:08:00', 'ADMIN', NULL, NULL, 2),
(34, 'Esparta', 10301, '2021-05-31 22:08:25', 'ADMIN', NULL, NULL, 3),
(35, 'Agua Caliente', 10302, '2021-05-31 22:40:00', 'ADMIN', NULL, NULL, 3),
(36, 'Barranquilla Norte', 10303, '2021-05-31 22:40:35', 'ADMIN', NULL, NULL, 3),
(37, 'Buenos Aires', 10304, '2021-05-31 22:40:52', 'ADMIN', NULL, NULL, 3),
(38, 'Campo Nuevo', 10305, '2021-05-31 22:41:09', 'ADMIN', NULL, NULL, 3),
(39, 'Cayo de Venado ', 10306, '2021-05-31 22:41:28', 'ADMIN', NULL, NULL, 3),
(40, 'Ceibita Way', 10307, '2021-05-31 22:42:05', 'ADMIN', NULL, NULL, 3),
(41, 'Colonia Brisas de América', 10308, '2021-05-31 22:42:33', 'ADMIN', NULL, NULL, 3),
(42, 'Colorado Barra', 10309, '2021-05-31 22:42:48', 'ADMIN', NULL, NULL, 3),
(43, 'El Jazmin', 10310, '2021-05-31 22:43:02', 'ADMIN', NULL, NULL, 3),
(44, 'El Suspiro', 10311, '2021-05-31 22:43:15', 'ADMIN', NULL, NULL, 3),
(45, 'Flores de Italia', 10312, '2021-05-31 22:44:04', 'ADMIN', NULL, NULL, 3),
(46, 'La Guadalupe', 10313, '2021-05-31 22:44:32', 'ADMIN', NULL, NULL, 3),
(47, 'La libertad', 10314, '2021-05-31 22:44:54', 'ADMIN', NULL, NULL, 3),
(48, 'La Tarralosa', 10315, '2021-05-31 22:45:09', 'ADMIN', NULL, NULL, 3),
(49, 'Las Américas', 10316, '2021-05-31 22:45:47', 'ADMIN', NULL, NULL, 3),
(50, 'Las Delicias', 10317, '2021-05-31 22:46:11', 'ADMIN', NULL, NULL, 3),
(51, 'Las Delicias del Norte', 10318, '2021-05-31 22:46:38', 'ADMIN', NULL, NULL, 3),
(52, 'Las Flores de Leán', 10319, '2021-05-31 22:46:53', 'ADMIN', NULL, NULL, 3),
(53, 'Lombardilla o la Curva', 10320, '2021-05-31 22:47:23', 'ADMIN', NULL, NULL, 3),
(54, 'Los Cerritos', 10321, '2021-05-31 22:47:44', 'ADMIN', NULL, NULL, 3),
(55, 'Manta de Guineo', 10322, '2021-05-31 22:48:01', 'ADMIN', NULL, NULL, 3),
(56, 'Nueva Esperanza', 10323, '2021-05-31 22:48:38', 'ADMIN', NULL, NULL, 3),
(57, 'Nueva Go', 10324, '2021-05-31 22:48:48', 'ADMIN', NULL, NULL, 3),
(58, 'Paris de Leán', 10325, '2021-05-31 22:49:09', 'ADMIN', NULL, NULL, 3),
(59, 'Piedras de Afilar', 10326, '2021-05-31 22:49:26', 'ADMIN', NULL, NULL, 3),
(60, 'Rio Chiquito Norte', 10327, '2021-05-31 22:49:49', 'ADMIN', NULL, NULL, 3),
(61, 'Rosita', 10328, '2021-05-31 22:50:09', 'ADMIN', NULL, NULL, 3),
(62, 'San José', 10329, '2021-05-31 22:50:22', 'ADMIN', NULL, NULL, 3),
(63, 'Siempre Viva', 10330, '2021-05-31 22:50:37', 'ADMIN', NULL, NULL, 3),
(64, 'Sombre Verde', 10331, '2021-05-31 22:51:04', 'ADMIN', NULL, NULL, 3),
(67, 'Jutiapa', 10401, '2021-05-31 23:03:01', 'ADMIN', NULL, NULL, 310),
(68, 'Berlín No. 1', 10402, '2021-05-31 23:03:36', 'ADMIN', NULL, NULL, 310),
(69, 'Cantor', 10403, '2021-05-31 23:03:49', 'ADMIN', NULL, NULL, 310),
(70, 'Cefalú', 10404, '2021-05-31 23:04:07', 'ADMIN', NULL, NULL, 310),
(71, 'Ceiba Grande', 10405, '2021-05-31 23:04:27', 'ADMIN', NULL, NULL, 310),
(72, 'Corralitos', 10406, '2021-05-31 23:04:47', 'ADMIN', NULL, NULL, 310),
(73, 'Descombros', 10407, '2021-05-31 23:05:00', 'ADMIN', NULL, NULL, 310),
(74, 'El Aguacate en Linea', 10408, '2021-05-31 23:05:19', 'ADMIN', NULL, NULL, 310),
(75, 'El Cacao', 10409, '2021-05-31 23:05:32', 'ADMIN', NULL, NULL, 310),
(76, 'El Cacao', 10409, '2021-05-31 23:05:48', 'ADMIN', NULL, NULL, 310),
(77, 'El Diamante', 10410, '2021-05-31 23:12:09', 'ADMIN', NULL, NULL, 310),
(78, 'El Urraco', 10412, '2021-05-31 23:12:49', 'ADMIN', NULL, NULL, 310),
(79, 'El Zapotal', 10413, '2021-05-31 23:13:02', 'ADMIN', NULL, NULL, 310),
(80, 'El Zapote', 10412, '2021-05-31 23:13:10', 'ADMIN', NULL, NULL, 310),
(81, 'Enteina', 10413, '2021-05-31 23:13:49', 'ADMIN', NULL, NULL, 310),
(82, 'Llamapa', 10416, '2021-05-31 23:14:10', 'ADMIN', NULL, NULL, 310),
(83, 'La Bomba', 10418, '2021-05-31 23:14:41', 'ADMIN', NULL, NULL, 310),
(84, 'Las Marias', 10419, '2021-05-31 23:14:54', 'ADMIN', NULL, NULL, 310),
(85, 'Los Olanchitos', 10420, '2021-05-31 23:15:24', 'ADMIN', NULL, NULL, 310),
(86, 'Papaloteca', 10422, '2021-05-31 23:20:20', 'ADMIN', NULL, NULL, 310),
(87, 'Piedras Amarilas', 10423, '2021-05-31 23:20:32', 'ADMIN', NULL, NULL, 310),
(88, 'Roma', 10425, '2021-05-31 23:20:56', 'ADMIN', NULL, NULL, 310),
(89, 'Saltos', 10427, '2021-05-31 23:21:33', 'ADMIN', NULL, NULL, 310),
(90, 'Sonaguerita', 10429, '2021-05-31 23:22:05', 'ADMIN', NULL, NULL, 310),
(91, 'Subirana', 10430, '2021-05-31 23:22:20', 'ADMIN', NULL, NULL, 310),
(92, 'Tomalá', 10431, '2021-05-31 23:22:33', 'ADMIN', NULL, NULL, 310),
(93, 'La Masica', 10501, '2021-05-31 23:26:15', 'ADMIN', NULL, NULL, 5),
(94, 'Agua Caliente', 10502, '2021-05-31 23:26:46', 'ADMIN', NULL, NULL, 5),
(95, 'Agua Fría', 10503, '2021-05-31 23:26:55', 'ADMIN', NULL, NULL, 5),
(96, 'Boca Cerrada', 10504, '2021-05-31 23:28:22', 'ADMIN', NULL, NULL, 5),
(97, 'Colinas', 10505, '2021-05-31 23:28:34', 'ADMIN', NULL, NULL, 5),
(98, 'El Desvio', 10506, '2021-05-31 23:28:47', 'ADMIN', NULL, NULL, 5),
(99, 'El Naranjal', 10507, '2021-05-31 23:29:00', 'ADMIN', NULL, NULL, 5),
(100, 'El Oro', 10508, '2021-05-31 23:30:15', 'ADMIN', NULL, NULL, 5),
(101, 'San Antonio', 10512, '2021-05-31 23:32:10', 'ADMIN', NULL, NULL, 5),
(102, 'San Juan Benque', 10513, '2021-05-31 23:34:42', 'ADMIN', NULL, NULL, 5),
(103, 'San Juan Pueblo', 10514, '2021-05-31 23:34:58', 'ADMIN', NULL, NULL, 5),
(104, 'San Marcos', 10515, '2021-05-31 23:35:12', 'ADMIN', NULL, NULL, 5),
(105, 'Santa Fé', 10516, '2021-05-31 23:35:31', 'ADMIN', NULL, NULL, 5),
(106, 'Soledad', 10517, '2021-05-31 23:35:44', 'ADMIN', NULL, NULL, 5),
(107, 'Tierra Firme', 10518, '2021-05-31 23:35:57', 'ADMIN', NULL, NULL, 5),
(108, 'Trípoli', 10519, '2021-05-31 23:36:19', 'ADMIN', NULL, NULL, 5),
(109, 'San Francisco', 10601, '2021-05-31 23:37:01', 'ADMIN', NULL, NULL, 6),
(110, 'Frisco No.1', 10602, '2021-05-31 23:37:30', 'ADMIN', NULL, NULL, 6),
(111, 'La Frutera', 10603, '2021-05-31 23:37:51', 'ADMIN', NULL, NULL, 6),
(112, 'La Llave', 10604, '2021-05-31 23:38:02', 'ADMIN', NULL, NULL, 6),
(113, 'Las Camelias', 10605, '2021-05-31 23:38:17', 'ADMIN', NULL, NULL, 6),
(114, 'Micelly', 10606, '2021-05-31 23:38:35', 'ADMIN', NULL, NULL, 6),
(115, 'Paguales', 10607, '2021-05-31 23:38:47', 'ADMIN', NULL, NULL, 6),
(116, 'Río Cuero', 10608, '2021-05-31 23:39:02', 'ADMIN', NULL, NULL, 6),
(117, 'Saladito', 10609, '2021-05-31 23:39:14', 'ADMIN', NULL, NULL, 6),
(118, 'Santa Ana', 10609, '2021-05-31 23:39:37', 'ADMIN', NULL, NULL, 6),
(119, 'Santiago', 10610, '2021-05-31 23:39:51', 'ADMIN', NULL, NULL, 6),
(120, 'Santiago Aniba', 10611, '2021-05-31 23:40:01', 'ADMIN', NULL, NULL, 6),
(121, 'Tela', 10701, '2021-05-31 23:40:30', 'ADMIN', NULL, NULL, 7),
(122, 'Agua Blanca', 10702, '2021-05-31 23:40:44', 'ADMIN', NULL, NULL, 7),
(123, 'Agua Chiquita', 10703, '2021-05-31 23:40:54', 'ADMIN', NULL, NULL, 7),
(124, '8arra Ulúa ', 10704, '2021-05-31 23:41:13', 'ADMIN', NULL, NULL, 7),
(125, '8risas de Leán ', 10705, '2021-05-31 23:41:36', 'ADMIN', NULL, NULL, 7),
(126, 'Buena Vista', 10706, '2021-05-31 23:41:49', 'ADMIN', NULL, NULL, 7),
(127, 'Buenos Aires No.1 ', 10707, '2021-05-31 23:42:14', 'ADMIN', NULL, NULL, 7),
(128, 'Buenos Aires No.2 ', 10708, '2021-05-31 23:42:20', 'ADMIN', NULL, NULL, 7),
(129, 'Campo Elvir', 10709, '2021-05-31 23:42:41', 'ADMIN', NULL, NULL, 7),
(130, 'Camngelica o el Corozal', 10710, '2021-05-31 23:43:11', 'ADMIN', NULL, NULL, 7),
(131, 'Cangeliquilla Abajo', 10711, '2021-05-31 23:43:33', 'ADMIN', NULL, NULL, 7),
(132, 'Cangeliquilla Arriba', 10712, '2021-05-31 23:43:49', 'ADMIN', NULL, NULL, 7),
(133, 'Colonia los Laureles', 10713, '2021-05-31 23:44:12', 'ADMIN', NULL, NULL, 7),
(134, 'Concepción la Florida Vieja ', 10714, '2021-05-31 23:44:41', 'ADMIN', NULL, NULL, 7),
(135, 'Creek Martínez', 10715, '2021-05-31 23:45:16', 'ADMIN', NULL, NULL, 7),
(136, 'Champerío o el Triunfo de Esquipulas', 10716, '2021-05-31 23:45:45', 'ADMIN', NULL, NULL, 7),
(137, 'El Barrio o Buena Vista', 10717, '2021-05-31 23:46:02', 'ADMIN', NULL, NULL, 7),
(138, 'El Cedro', 10718, '2021-05-31 23:47:00', 'ADMIN', NULL, NULL, 7),
(139, 'El Desvío del Zapote Mojimán', 10719, '2021-05-31 23:47:37', 'ADMIN', NULL, NULL, 7),
(140, 'El Dorado', 10720, '2021-05-31 23:47:48', 'ADMIN', NULL, NULL, 7),
(141, 'El Encanto', 10721, '2021-05-31 23:48:00', 'ADMIN', NULL, NULL, 7),
(142, 'El Guáno', 10722, '2021-05-31 23:48:28', 'ADMIN', NULL, NULL, 7),
(143, 'El Guayabal', 10723, '2021-05-31 23:48:40', 'ADMIN', NULL, NULL, 7),
(144, 'El Junco', 10724, '2021-05-31 23:48:50', 'ADMIN', NULL, NULL, 7),
(145, 'El Jute', 10725, '2021-05-31 23:48:59', 'ADMIN', NULL, NULL, 7),
(146, 'El Rodeo', 10726, '2021-05-31 23:49:08', 'ADMIN', NULL, NULL, 7),
(147, 'El Tigre', 10727, '2021-05-31 23:49:19', 'ADMIN', NULL, NULL, 7),
(148, 'El Triunfo de la Crúz', 10728, '2021-05-31 23:49:34', 'ADMIN', NULL, NULL, 7),
(149, 'El Zapote No 1', 10729, '2021-05-31 23:50:32', 'ADMIN', NULL, NULL, 7),
(150, 'El Zapote No 2', 10730, '2021-05-31 23:50:38', 'ADMIN', NULL, NULL, 7),
(151, 'Kiómetro Trece', 10731, '2021-05-31 23:50:53', 'ADMIN', NULL, NULL, 7),
(152, 'Lanncetila ', 10732, '2021-05-31 23:51:12', 'ADMIN', NULL, NULL, 7),
(153, 'La Ezperanza ', 10733, '2021-05-31 23:51:25', 'ADMIN', NULL, NULL, 7),
(154, 'La Ezperanza de Santiago', 10734, '2021-05-31 23:51:39', 'ADMIN', NULL, NULL, 7),
(155, 'La Fortuna', 10735, '2021-05-31 23:51:59', 'ADMIN', NULL, NULL, 7),
(156, 'La Páz', 10737, '2021-05-31 23:52:20', 'ADMIN', NULL, NULL, 7),
(157, 'La Unión', 10738, '2021-05-31 23:52:39', 'ADMIN', NULL, NULL, 7),
(158, 'La Yusa', 10739, '2021-05-31 23:53:06', 'ADMIN', NULL, NULL, 7),
(159, 'Las Mercedes', 10741, '2021-06-01 17:22:16', 'ADMIN', NULL, NULL, 7),
(160, 'Las Meta6as', 10742, '2021-06-01 17:22:30', 'ADMIN', NULL, NULL, 7),
(161, 'Las Minas', 10743, '2021-06-01 17:22:45', 'ADMIN', NULL, NULL, 7),
(162, 'Las Palmas', 10744, '2021-06-01 17:22:55', 'ADMIN', NULL, NULL, 7),
(163, 'Las Quebradas', 10745, '2021-06-01 17:23:04', 'ADMIN', NULL, NULL, 7),
(164, 'Las Cerritos', 10746, '2021-06-01 17:23:13', 'ADMIN', NULL, NULL, 7),
(165, 'Mecher Diez y Siete', 10747, '2021-06-01 17:23:47', 'ADMIN', NULL, NULL, 7),
(166, 'Meroa Ocho', 10748, '2021-06-01 17:24:14', 'ADMIN', NULL, NULL, 7),
(167, 'Meroa Río', 10749, '2021-06-01 17:24:32', 'ADMIN', NULL, NULL, 7),
(168, 'Mezapa o Santa Rosa del Norte', 10750, '2021-06-01 17:24:59', 'ADMIN', NULL, NULL, 7),
(169, 'Monte Si6n', 10751, '2021-06-01 17:25:18', 'ADMIN', NULL, NULL, 7),
(170, 'Morazán', 10752, '2021-06-01 17:25:39', 'ADMIN', NULL, NULL, 7),
(171, 'Nombre de Dtos', 10753, '2021-06-01 17:26:00', 'ADMIN', NULL, NULL, 7),
(172, 'Nueva Esperanza', 10754, '2021-06-01 17:26:20', 'ADMIN', NULL, NULL, 7),
(173, 'Nuevo Ber1ín o Las Jicoteas', 10756, '2021-06-01 17:27:24', 'ADMIN', NULL, NULL, 7),
(174, 'Paujiles', 10757, '2021-06-01 17:27:42', 'ADMIN', NULL, NULL, 7),
(175, 'Peman o Otuita Adentro', 10758, '2021-06-01 17:28:00', 'ADMIN', NULL, NULL, 7),
(176, 'Piedras Gordas', 10759, '2021-06-01 17:28:18', 'ADMIN', NULL, NULL, 7),
(177, 'Planes', 10760, '2021-06-01 17:28:41', 'ADMIN', NULL, NULL, 7),
(178, 'Procon', 10761, '2021-06-01 17:28:55', 'ADMIN', NULL, NULL, 7),
(179, 'Puerto Arturo', 10762, '2021-06-01 17:29:20', 'ADMIN', NULL, NULL, 7),
(180, 'Río Tinto', 10763, '2021-06-01 17:29:50', 'ADMIN', NULL, NULL, 7),
(181, 'San Alejo', 10764, '2021-06-01 17:29:58', 'ADMIN', NULL, NULL, 7),
(182, 'San Antonio', 10765, '2021-06-01 17:30:09', 'ADMIN', NULL, NULL, 7),
(183, 'San Antonio de Villa Franca', 10766, '2021-06-01 17:30:40', 'ADMIN', NULL, NULL, 7),
(184, 'San José', 10767, '2021-06-01 17:30:58', 'ADMIN', NULL, NULL, 7),
(187, 'San Juan', 10768, '2021-06-01 17:32:49', 'ADMIN', NULL, NULL, 7),
(188, 'San Juan Lempira', 10769, '2021-06-01 17:33:01', 'ADMIN', NULL, NULL, 7),
(189, 'Santiago', 10770, '2021-06-01 17:33:16', 'ADMIN', NULL, NULL, 7),
(190, 'Tarralosa', 10771, '2021-06-01 17:33:29', 'ADMIN', NULL, NULL, 7),
(191, 'Toloa Adentro', 10772, '2021-06-01 17:33:50', 'ADMIN', NULL, NULL, 7),
(192, 'Toloa Creek', 10773, '2021-06-01 17:34:02', 'ADMIN', NULL, NULL, 7),
(193, 'Tornabé', 10774, '2021-06-01 17:34:18', 'ADMIN', NULL, NULL, 7),
(194, 'Villa Franca', 10775, '2021-06-01 17:34:34', 'ADMIN', NULL, NULL, 7),
(195, 'Zollabé', 10776, '2021-06-01 17:34:49', 'ADMIN', NULL, NULL, 7),
(196, 'La Grant', 10777, '2021-06-01 17:35:07', 'ADMIN', NULL, NULL, 7),
(197, 'Arizona', 10801, '2021-06-01 17:38:21', 'ADMIN', NULL, NULL, 8),
(198, 'Agua Caliente', 10802, '2021-06-01 17:38:31', 'ADMIN', NULL, NULL, 8),
(199, 'Atenas de San Cristobal', 10803, '2021-06-01 17:38:58', 'ADMIN', NULL, NULL, 8),
(200, 'Barranquilla Sur', 10804, '2021-06-01 17:39:20', 'ADMIN', NULL, NULL, 8),
(201, 'Colonia Río Platano', 10805, '2021-06-01 17:39:47', 'ADMIN', NULL, NULL, 8),
(202, 'Coloradillo', 10806, '2021-06-01 17:40:52', 'ADMIN', NULL, NULL, 8),
(203, 'El Coco', 10807, '2021-06-01 17:41:12', 'ADMIN', NULL, NULL, 8),
(204, 'El Empalme', 10808, '2021-06-01 17:41:28', 'ADMIN', NULL, NULL, 8),
(205, 'El Retiro', 10809, '2021-06-01 17:41:36', 'ADMIN', NULL, NULL, 8),
(206, 'El Hicaque', 10810, '2021-06-01 17:41:48', 'ADMIN', NULL, NULL, 8),
(207, 'Hisopo', 10811, '2021-06-01 17:41:59', 'ADMIN', NULL, NULL, 8),
(208, 'Jilamito Nuevo', 10812, '2021-06-01 17:42:15', 'ADMIN', NULL, NULL, 8),
(209, 'Jilamito Viejo', 10813, '2021-06-01 17:42:30', 'ADMIN', NULL, NULL, 8),
(210, 'Jilamo Nuevo', 10814, '2021-06-01 17:42:47', 'ADMIN', NULL, NULL, 8),
(211, 'Jilamo Viejo', 10815, '2021-06-01 17:42:55', 'ADMIN', NULL, NULL, 8),
(212, 'La Leona', 10816, '2021-06-01 17:43:08', 'ADMIN', NULL, NULL, 8),
(213, 'Las Lomas', 10817, '2021-06-01 17:43:22', 'ADMIN', NULL, NULL, 8),
(214, 'Mezapa', 10818, '2021-06-01 17:43:35', 'ADMIN', NULL, NULL, 8),
(215, 'Mezapita', 10819, '2021-06-01 17:43:46', 'ADMIN', NULL, NULL, 8),
(216, 'Planes de Hicaque', 10820, '2021-06-01 17:44:03', 'ADMIN', NULL, NULL, 8),
(217, 'Rio Chiquito Sur', 10821, '2021-06-01 17:44:22', 'ADMIN', NULL, NULL, 8),
(218, 'San Francisco de Saco', 10822, '2021-06-01 17:44:45', 'ADMIN', NULL, NULL, 8),
(219, 'San José de Texiguat', 10823, '2021-06-01 17:45:16', 'ADMIN', NULL, NULL, 8),
(220, 'San José de Tiburón', 10824, '2021-06-01 17:45:33', 'ADMIN', NULL, NULL, 8),
(221, 'Santa Maria', 10825, '2021-06-01 17:45:52', 'ADMIN', NULL, NULL, 8),
(222, 'Sisama', 10826, '2021-06-01 17:46:00', 'ADMIN', NULL, NULL, 8),
(223, 'Suyapa de Leán o Mataras', 10827, '2021-06-01 17:46:20', 'ADMIN', NULL, NULL, 8),
(224, 'Trujillo', 20101, '2021-06-01 17:49:33', 'ADMIN', NULL, NULL, 9),
(225, 'Colonia Aguán', 20102, '2021-06-01 17:49:47', 'ADMIN', NULL, NULL, 9),
(226, 'Chapagua', 20103, '2021-06-01 17:49:59', 'ADMIN', NULL, NULL, 9),
(227, 'El Coco N.1', 20104, '2021-06-01 17:50:31', 'ADMIN', NULL, NULL, 9),
(228, 'Ilanga', 20105, '2021-06-01 17:50:50', 'ADMIN', NULL, NULL, 9),
(229, 'Jericó', 20106, '2021-06-01 17:53:50', 'ADMIN', NULL, NULL, 9),
(230, 'La Brea', 20107, '2021-06-01 17:54:05', 'ADMIN', NULL, NULL, 9),
(231, 'Puerto Castilla', 20108, '2021-06-01 17:54:21', 'ADMIN', NULL, NULL, 9),
(232, 'Tarros', 20109, '2021-06-01 17:55:53', 'ADMIN', NULL, NULL, 9),
(233, 'Balfate', 20201, '2021-06-01 17:56:47', 'ADMIN', NULL, NULL, 10),
(234, 'Arenaloza', 20202, '2021-06-01 17:57:06', 'ADMIN', NULL, NULL, 10),
(235, 'Bambú', 20203, '2021-06-01 17:57:19', 'ADMIN', NULL, NULL, 10),
(236, 'Cuyamel', 20204, '2021-06-01 17:57:32', 'ADMIN', NULL, NULL, 10),
(237, 'El Cenizo', 20205, '2021-06-01 17:57:51', 'ADMIN', NULL, NULL, 10),
(238, 'El Porvenir', 20206, '2021-06-01 17:58:04', 'ADMIN', NULL, NULL, 10),
(239, 'El Satal', 20207, '2021-06-01 17:58:17', 'ADMIN', NULL, NULL, 10),
(240, 'El Satalito', 20208, '2021-06-01 17:58:29', 'ADMIN', NULL, NULL, 10),
(241, 'Las Cruzitas', 20209, '2021-06-01 17:58:49', 'ADMIN', NULL, NULL, 10),
(242, 'Las Flores', 20210, '2021-06-01 17:59:02', 'ADMIN', NULL, NULL, 10),
(243, 'Las Mangas', 20211, '2021-06-01 17:59:33', 'ADMIN', NULL, NULL, 10),
(244, 'Limera', 20212, '2021-06-01 17:59:46', 'ADMIN', NULL, NULL, 10),
(245, 'Lis Lis', 20213, '2021-06-01 18:00:00', 'ADMIN', NULL, NULL, 10),
(246, 'Lucinda', 20214, '2021-06-01 18:00:12', 'ADMIN', NULL, NULL, 10),
(247, 'Planes de Bambú', 20215, '2021-06-01 18:00:24', 'ADMIN', NULL, NULL, 10),
(248, 'Rio Coco', 20216, '2021-06-01 18:00:48', 'ADMIN', NULL, NULL, 10),
(249, 'Rio Esteban', 20217, '2021-06-01 18:00:59', 'ADMIN', NULL, NULL, 10),
(250, 'San Luis', 20218, '2021-06-01 18:01:08', 'ADMIN', NULL, NULL, 10),
(251, 'Iriona', 20301, '2021-06-01 18:01:50', 'ADMIN', NULL, NULL, 11),
(252, 'Ciriboya', 20302, '2021-06-01 18:02:02', 'ADMIN', NULL, NULL, 11),
(253, 'Cusuna', 20303, '2021-06-01 18:02:13', 'ADMIN', NULL, NULL, 11),
(254, 'Iriona Viejo', 20304, '2021-06-01 18:02:23', 'ADMIN', NULL, NULL, 11),
(255, 'Las Champas u Ocotales', 20305, '2021-06-01 18:02:53', 'ADMIN', NULL, NULL, 11),
(256, 'Punta de Piedra', 20307, '2021-06-01 18:03:16', 'ADMIN', NULL, NULL, 11),
(257, 'San José de La Punta', 20308, '2021-06-01 18:03:41', 'ADMIN', NULL, NULL, 11),
(258, 'Sangrelaya', 20309, '2021-06-01 18:04:21', 'ADMIN', NULL, NULL, 11),
(259, 'Sico', 20310, '2021-06-01 18:04:45', 'ADMIN', NULL, NULL, 11),
(260, 'Tocamacho', 20311, '2021-06-01 18:04:58', 'ADMIN', NULL, NULL, 11),
(262, 'Paya', 20306, '2021-06-08 10:46:26', 'ADMIN', NULL, NULL, 11),
(263, 'Francia', 20402, '2021-06-01 18:12:14', 'ADMIN', NULL, NULL, 12),
(264, 'Vallecito', 20403, '2021-06-01 18:12:24', 'ADMIN', NULL, NULL, 12),
(265, 'Sabá', 20501, '2021-06-01 18:12:34', 'ADMIN', NULL, NULL, 13),
(266, 'Barranco Chele', 20502, '2021-06-01 18:15:21', 'ADMIN', NULL, NULL, 13),
(267, 'Campo Bohemio o Alianza', 20503, '2021-06-01 18:15:43', 'ADMIN', NULL, NULL, 13),
(268, 'Campo Copete', 20504, '2021-06-01 18:16:00', 'ADMIN', NULL, NULL, 13),
(269, 'Campo Nerones', 20505, '2021-06-01 18:16:11', 'ADMIN', NULL, NULL, 13),
(270, 'Campo Vally', 20506, '2021-06-01 18:16:19', 'ADMIN', NULL, NULL, 13),
(271, 'Ceibita', 20507, '2021-06-01 18:16:28', 'ADMIN', NULL, NULL, 13),
(272, 'Cooperativa El Esfuerzo', 20508, '2021-06-01 18:16:44', 'ADMIN', NULL, NULL, 13),
(273, 'El Achiote', 20509, '2021-06-01 18:17:16', 'ADMIN', NULL, NULL, 13),
(274, 'El Jaguillo Muerto', 20510, '2021-06-01 18:17:38', 'ADMIN', NULL, NULL, 13),
(275, 'Elixir', 20511, '2021-06-01 18:17:51', 'ADMIN', NULL, NULL, 13),
(276, 'Finca El Carmen', 20512, '2021-06-01 18:18:08', 'ADMIN', NULL, NULL, 13),
(277, 'Las Golondrinas', 20513, '2021-06-01 18:18:37', 'ADMIN', NULL, NULL, 13),
(278, 'Orica', 20514, '2021-06-01 18:18:52', 'ADMIN', NULL, NULL, 13),
(279, 'Paguates', 20515, '2021-06-01 18:19:01', 'ADMIN', NULL, NULL, 13),
(280, 'Palos de Agua Abajo', 20516, '2021-06-01 18:19:18', 'ADMIN', NULL, NULL, 13),
(281, 'Sonámbula', 20517, '2021-06-01 18:19:45', 'ADMIN', NULL, NULL, 13),
(282, 'Tiburones', 20518, '2021-06-01 18:19:57', 'ADMIN', NULL, NULL, 13),
(283, 'Santa Fe', 20601, '2021-06-01 18:20:31', 'ADMIN', NULL, NULL, 14),
(284, 'Guadalpue', 20602, '2021-06-01 18:21:02', 'ADMIN', NULL, NULL, 14),
(285, 'Plan Grande', 20603, '2021-06-01 18:21:11', 'ADMIN', NULL, NULL, 14),
(286, 'San Antonio', 20604, '2021-06-01 18:21:22', 'ADMIN', NULL, NULL, 14),
(287, 'Santa Rosa de Aguán', 20701, '2021-06-01 18:21:41', 'ADMIN', NULL, NULL, 15),
(288, 'Vuelta Grande', 20702, '2021-06-01 18:23:20', 'ADMIN', NULL, NULL, 15),
(289, 'Sonaguera', 20801, '2021-06-01 18:24:15', 'ADMIN', NULL, NULL, 16),
(290, 'Agua Caliente', 20802, '2021-06-01 18:24:38', 'ADMIN', NULL, NULL, 16),
(291, 'Alto Seco', 20803, '2021-06-01 18:25:06', 'ADMIN', NULL, NULL, 16),
(292, 'Colonia El Sinal', 20804, '2021-06-01 18:25:23', 'ADMIN', NULL, NULL, 16),
(293, 'Campo El Olvido', 20805, '2021-06-01 18:26:15', 'ADMIN', NULL, NULL, 16),
(294, 'Campo Guanacaste', 20806, '2021-06-01 18:26:26', 'ADMIN', NULL, NULL, 16),
(295, 'Campo La Paz', 20807, '2021-06-01 18:26:36', 'ADMIN', NULL, NULL, 16),
(296, 'Cooperativa 21 de Noviembre', 20808, '2021-06-01 18:27:26', 'ADMIN', NULL, NULL, 16),
(297, 'Churrusquera', 20809, '2021-06-01 18:27:53', 'ADMIN', NULL, NULL, 16),
(298, 'El Café', 20810, '2021-06-01 18:28:12', 'ADMIN', NULL, NULL, 16),
(299, 'El Guayabal', 20811, '2021-06-01 18:28:49', 'ADMIN', NULL, NULL, 16),
(300, 'El Limón', 20812, '2021-06-01 18:29:03', 'ADMIN', NULL, NULL, 16),
(301, 'El Porvenir de Aída o El Berrinche', 20813, '2021-06-01 18:29:35', 'ADMIN', NULL, NULL, 16),
(302, 'El Sastre', 20814, '2021-06-01 18:29:47', 'ADMIN', NULL, NULL, 16),
(303, 'Fausto', 20815, '2021-06-01 18:30:00', 'ADMIN', NULL, NULL, 16),
(304, 'Flores del Este', 20816, '2021-06-01 18:30:10', 'ADMIN', NULL, NULL, 16),
(305, 'Flores del Terreno', 20817, '2021-06-01 18:30:25', 'ADMIN', NULL, NULL, 16),
(306, 'Gioconda', 20818, '2021-06-01 18:30:38', 'ADMIN', NULL, NULL, 16),
(307, 'Isleta Central', 20819, '2021-06-01 18:30:56', 'ADMIN', NULL, NULL, 16),
(308, 'Juan Lázaro Abajo', 20820, '2021-06-01 18:31:12', 'ADMIN', NULL, NULL, 16),
(309, 'La Cubana', 20821, '2021-06-01 18:31:27', 'ADMIN', NULL, NULL, 16),
(310, 'La Curva de Isleta', 20822, '2021-06-01 18:31:41', 'ADMIN', NULL, NULL, 16),
(311, 'La Hoya de Arriba', 20823, '2021-06-01 18:31:56', 'ADMIN', NULL, NULL, 16),
(312, 'La Presa o Juan Lázaro de Arriba', 20824, '2021-06-01 18:32:16', 'ADMIN', NULL, NULL, 16),
(313, 'Lanza', 20825, '2021-06-01 18:32:29', 'ADMIN', NULL, NULL, 16),
(314, 'Lezcano', 20826, '2021-06-01 18:32:38', 'ADMIN', NULL, NULL, 16),
(315, 'Lorelay', 20827, '2021-06-01 18:32:48', 'ADMIN', NULL, NULL, 16),
(316, 'Lorencillo', 20828, '2021-06-01 18:33:00', 'ADMIN', NULL, NULL, 16),
(317, 'Lucía', 20829, '2021-06-01 18:33:32', 'ADMIN', NULL, NULL, 16),
(318, 'Los Carrioles', 20830, '2021-06-01 18:33:48', 'ADMIN', NULL, NULL, 16),
(319, 'Los Planes', 20831, '2021-06-01 18:33:57', 'ADMIN', NULL, NULL, 16),
(320, 'Miramar', 20832, '2021-06-01 18:34:15', 'ADMIN', NULL, NULL, 16),
(321, 'Monte de Oro', 20833, '2021-06-01 18:34:39', 'ADMIN', NULL, NULL, 16),
(322, 'Parnas', 20834, '2021-06-01 18:34:57', 'ADMIN', NULL, NULL, 16),
(323, 'Puente Alto', 20835, '2021-06-01 18:35:08', 'ADMIN', NULL, NULL, 16),
(324, 'Quebrada de Arena', 20836, '2021-06-01 18:35:23', 'ADMIN', NULL, NULL, 16),
(325, 'Rio de Piedra', 20837, '2021-06-01 18:35:41', 'ADMIN', NULL, NULL, 16),
(326, 'Sabana de la Pita', 20838, '2021-06-01 18:35:53', 'ADMIN', NULL, NULL, 16),
(327, 'Sabana de Utila', 20839, '2021-06-01 18:36:03', 'ADMIN', NULL, NULL, 16),
(328, 'Tres Luces', 20840, '2021-06-01 18:36:20', 'ADMIN', NULL, NULL, 16),
(329, 'Tosca', 20841, '2021-06-01 18:36:32', 'ADMIN', NULL, NULL, 16),
(330, 'Trovador', 20842, '2021-06-01 18:37:38', 'ADMIN', NULL, NULL, 16),
(331, 'Utila', 20843, '2021-06-01 18:37:53', 'ADMIN', NULL, NULL, 16),
(332, 'Tocoa', 20901, '2021-06-01 18:51:15', 'ADMIN', NULL, NULL, 17),
(333, 'Cayo Sierra', 20902, '2021-06-01 18:51:53', 'ADMIN', NULL, NULL, 17),
(334, 'Cuaca Nueva o Jaral', 20903, '2021-06-01 18:52:19', 'ADMIN', NULL, NULL, 17),
(335, 'Cuaca Vieja o Cuaca Zona', 20904, '2021-06-01 18:52:46', 'ADMIN', NULL, NULL, 17),
(336, 'Chiripa', 20905, '2021-06-01 18:53:02', 'ADMIN', NULL, NULL, 17),
(337, 'El Guapinol', 20906, '2021-06-01 18:53:12', 'ADMIN', NULL, NULL, 17),
(338, 'Juan Antonio', 20907, '2021-06-01 18:53:25', 'ADMIN', NULL, NULL, 17),
(339, 'La Abisinia', 20908, '2021-06-01 18:53:41', 'ADMIN', NULL, NULL, 17),
(340, 'La Ceibita', 20909, '2021-06-01 18:53:59', 'ADMIN', NULL, NULL, 17),
(341, 'La Concepción', 20910, '2021-06-01 18:54:08', 'ADMIN', NULL, NULL, 17),
(342, 'Las Mangas', 20911, '2021-06-01 18:54:22', 'ADMIN', NULL, NULL, 17),
(343, 'Lirida', 20912, '2021-06-01 18:54:36', 'ADMIN', NULL, NULL, 17),
(344, 'Prieta', 20913, '2021-06-01 18:54:44', 'ADMIN', NULL, NULL, 17),
(345, 'Quebrada de Agua', 20914, '2021-06-01 18:54:58', 'ADMIN', NULL, NULL, 17),
(346, 'Quebrada de Arena', 20915, '2021-06-01 18:55:09', 'ADMIN', NULL, NULL, 17),
(347, 'Salam', 20916, '2021-06-01 18:55:19', 'ADMIN', NULL, NULL, 17),
(348, 'Taujica', 20917, '2021-06-01 18:55:32', 'ADMIN', NULL, NULL, 17),
(349, 'Zamora', 20918, '2021-06-01 18:55:50', 'ADMIN', NULL, NULL, 17),
(350, 'Bonito Oriente', 21001, '2021-06-01 18:56:24', 'ADMIN', NULL, NULL, 18),
(351, 'Corocito', 21002, '2021-06-01 18:56:47', 'ADMIN', NULL, NULL, 18),
(352, 'El Achiote', 21003, '2021-06-01 18:57:00', 'ADMIN', NULL, NULL, 18),
(353, 'El Antigual', 21004, '2021-06-01 18:57:11', 'ADMIN', NULL, NULL, 18),
(354, 'Feo', 21005, '2021-06-01 18:57:22', 'ADMIN', NULL, NULL, 18),
(355, 'La Esperanza', 21006, '2021-06-01 18:57:34', 'ADMIN', NULL, NULL, 18),
(356, 'Playa de Ganado', 21007, '2021-06-01 18:57:45', 'ADMIN', NULL, NULL, 18),
(357, 'Rio Piedra Blanca', 21008, '2021-06-01 18:58:02', 'ADMIN', NULL, NULL, 18),
(358, 'San josé del Cinco', 21009, '2021-06-01 18:58:20', 'ADMIN', NULL, NULL, 18),
(359, 'Vista Hermosa', 21010, '2021-06-01 18:58:34', 'ADMIN', NULL, NULL, 18),
(360, 'Comayagua', 30101, '2021-06-01 22:47:46', 'ADMIN', NULL, NULL, 23),
(361, 'Agua Salada', 30102, '2021-06-01 22:49:57', 'ADMIN', NULL, NULL, 23),
(362, 'Cacahuapa', 30103, '2021-06-01 22:50:12', 'ADMIN', NULL, NULL, 23),
(363, 'Cantoral', 30104, '2021-06-01 22:50:21', 'ADMIN', NULL, NULL, 23),
(364, 'El Ciruelo', 30105, '2021-06-01 22:51:38', 'ADMIN', NULL, NULL, 23),
(365, 'El Guachipilin', 30106, '2021-06-01 22:53:06', 'ADMIN', NULL, NULL, 23),
(366, 'El Horno', 30107, '2021-06-01 22:53:26', 'ADMIN', NULL, NULL, 23),
(367, 'El Plan de la Rosa', 30109, '2021-06-01 22:54:44', 'ADMIN', NULL, NULL, 23),
(369, 'El Paralso', 30108, '2021-06-01 23:00:46', 'ADMIN', NULL, NULL, 23),
(370, 'El Portillo de La More', 30110, '2021-06-01 23:01:27', 'ADMIN', NULL, NULL, 23),
(371, 'El Resumidero', 30111, '2021-06-01 23:01:40', 'ADMIN', NULL, NULL, 23),
(372, 'El Sauce', 30112, '2021-06-01 23:01:52', 'ADMIN', NULL, NULL, 23),
(373, 'El Sitio', 30113, '2021-06-01 23:02:02', 'ADMIN', NULL, NULL, 23),
(374, 'El Taladro', 30114, '2021-06-01 23:02:12', 'ADMIN', NULL, NULL, 23),
(375, 'El Volcán', 30115, '2021-06-01 23:02:21', 'ADMIN', NULL, NULL, 23),
(376, 'Guacamaya', 30116, '2021-06-01 23:02:40', 'ADMIN', NULL, NULL, 23),
(377, 'La Cooperativa', 30117, '2021-06-01 23:02:55', 'ADMIN', NULL, NULL, 23),
(378, 'La Escalera', 30118, '2021-06-01 23:03:08', 'ADMIN', NULL, NULL, 23),
(379, 'La Flor', 30119, '2021-06-01 23:03:18', 'ADMIN', NULL, NULL, 23),
(380, 'La Jaguita', 30120, '2021-06-01 23:03:38', 'ADMIN', NULL, NULL, 23),
(381, 'La Laguna', 30121, '2021-06-01 23:04:35', 'ADMIN', NULL, NULL, 23),
(382, 'La Palma', 30122, '2021-06-01 23:04:53', 'ADMIN', NULL, NULL, 23),
(383, 'La Sampedrana', 30123, '2021-06-01 23:05:29', 'ADMIN', NULL, NULL, 23),
(384, 'Las Anonas', 30124, '2021-06-01 23:06:17', 'ADMIN', NULL, NULL, 23),
(385, 'Las Liconas', 30125, '2021-06-01 23:06:47', 'ADMIN', NULL, NULL, 23),
(386, 'Las Mesas', 30126, '2021-06-01 23:07:00', 'ADMIN', NULL, NULL, 23),
(387, 'Lomas del Cordero', 30127, '2021-06-01 23:07:45', 'ADMIN', NULL, NULL, 23),
(388, 'Lomas Planes', 30128, '2021-06-01 23:08:08', 'ADMIN', NULL, NULL, 23),
(389, 'Motagua del Roblito', 30129, '2021-06-01 23:09:58', 'ADMIN', NULL, NULL, 23),
(390, 'Nueva Valladolid de Capiro', 30130, '2021-06-01 23:10:43', 'ADMIN', NULL, NULL, 23),
(391, 'Palo Pintado', 30131, '2021-06-01 23:11:11', 'ADMIN', NULL, NULL, 23),
(392, 'Piedraz Azules', 30132, '2021-06-01 23:11:38', 'ADMIN', NULL, NULL, 23),
(393, 'Planes de Churune', 30133, '2021-06-01 23:11:57', 'ADMIN', NULL, NULL, 23),
(394, 'Rio Blanco', 30134, '2021-06-01 23:12:22', 'ADMIN', NULL, NULL, 23),
(395, 'San Antonio de Cañas', 30135, '2021-06-01 23:13:05', 'ADMIN', NULL, NULL, 23),
(396, 'San Antonio de La Libertad', 30136, '2021-06-01 23:13:45', 'ADMIN', NULL, NULL, 23),
(397, 'San José de Pane', 30137, '2021-06-01 23:14:19', 'ADMIN', NULL, NULL, 23),
(398, 'San Miguel de Selguapa', 30138, '2021-06-01 23:15:34', 'ADMIN', NULL, NULL, 23),
(399, 'Valle de Angeles', 30139, '2021-06-01 23:15:50', 'ADMIN', NULL, NULL, 23),
(400, 'Veracrúz', 30140, '2021-06-01 23:16:13', 'ADMIN', NULL, NULL, 23),
(401, 'La Libertad', 30601, '2021-06-01 23:18:59', 'ADMIN', NULL, NULL, 24),
(402, 'Cabeceras', 30602, '2021-06-01 23:19:59', 'ADMIN', NULL, NULL, 24),
(403, 'Cantón San Antonio', 30603, '2021-06-01 23:20:34', 'ADMIN', NULL, NULL, 24),
(404, 'Cuesta del Neo', 30604, '2021-06-01 23:20:52', 'ADMIN', NULL, NULL, 24),
(405, 'El Higuerón', 30605, '2021-06-01 23:21:11', 'ADMIN', NULL, NULL, 24),
(406, 'El Olvido', 30606, '2021-06-01 23:21:30', 'ADMIN', NULL, NULL, 24),
(407, 'El Pinabetoso', 30607, '2021-06-01 23:21:48', 'ADMIN', NULL, NULL, 24),
(408, 'Goteras', 30608, '2021-06-01 23:21:57', 'ADMIN', NULL, NULL, 24),
(409, 'La Pita', 30609, '2021-06-01 23:22:11', 'ADMIN', NULL, NULL, 24),
(410, 'Loma Alta', 30610, '2021-06-01 23:22:29', 'ADMIN', NULL, NULL, 24),
(411, 'Los Alfaros', 30611, '2021-06-01 23:22:44', 'ADMIN', NULL, NULL, 24),
(412, 'Montañuelas', 30612, '2021-06-01 23:22:59', 'ADMIN', NULL, NULL, 24),
(413, 'Plan de Alejandro', 30613, '2021-06-01 23:23:19', 'ADMIN', NULL, NULL, 24),
(414, 'San Andrés', 30614, '2021-06-01 23:23:41', 'ADMIN', NULL, NULL, 24),
(415, 'San Antonio de Saque ', 30615, '2021-06-01 23:24:12', 'ADMIN', NULL, NULL, 24),
(416, 'San José', 30616, '2021-06-01 23:25:26', 'ADMIN', NULL, NULL, 24),
(417, 'Santa Fe', 30617, '2021-06-01 23:25:56', 'ADMIN', NULL, NULL, 24),
(418, 'Terreritos', 30618, '2021-06-01 23:26:14', 'ADMIN', NULL, NULL, 24),
(419, 'Valle Bonito', 30619, '2021-06-01 23:26:34', 'ADMIN', NULL, NULL, 24),
(420, 'Valle de Angeles', 30620, '2021-06-01 23:26:49', 'ADMIN', NULL, NULL, 24),
(421, 'Vallecitos', 30621, '2021-06-01 23:27:08', 'ADMIN', NULL, NULL, 24),
(422, 'Zacatalitos', 30622, '2021-06-01 23:27:28', 'ADMIN', NULL, NULL, 24),
(423, 'Lamaní', 30701, '2021-06-01 23:29:27', 'ADMIN', NULL, NULL, 25),
(424, 'Guachipilin', 30702, '2021-06-01 23:29:55', 'ADMIN', NULL, NULL, 25),
(425, 'Lagunetas', 30703, '2021-06-01 23:30:06', 'ADMIN', NULL, NULL, 25),
(426, 'Las Mesetas', 30704, '2021-06-01 23:30:17', 'ADMIN', NULL, NULL, 25),
(427, 'Mulacagua', 30705, '2021-06-01 23:30:35', 'ADMIN', NULL, NULL, 25),
(428, 'Ojo de Agua', 30706, '2021-06-01 23:30:51', 'ADMIN', NULL, NULL, 25),
(429, 'Tablazón', 30707, '2021-06-01 23:31:07', 'ADMIN', NULL, NULL, 25),
(430, 'Valladolid', 30708, '2021-06-01 23:31:31', 'ADMIN', NULL, NULL, 25),
(431, 'La Trinidad', 30801, '2021-06-01 23:32:29', 'ADMIN', NULL, NULL, 26),
(432, 'El Cordoncillo', 30802, '2021-06-01 23:32:46', 'ADMIN', NULL, NULL, 26),
(433, 'El Peñón', 30803, '2021-06-01 23:33:23', 'ADMIN', NULL, NULL, 26),
(434, 'Guacamaya', 30804, '2021-06-01 23:34:16', 'ADMIN', NULL, NULL, 26),
(435, 'Las Tierras', 30805, '2021-06-01 23:34:30', 'ADMIN', NULL, NULL, 26),
(436, 'Los Anises', 30806, '2021-06-01 23:34:55', 'ADMIN', NULL, NULL, 26),
(437, 'Tierra Blanca', 30807, '2021-06-01 23:35:16', 'ADMIN', NULL, NULL, 26),
(438, 'Lejamaní', 30901, '2021-06-01 23:37:15', 'ADMIN', NULL, NULL, 27),
(439, 'Membar', 31001, '2021-06-01 23:38:31', 'ADMIN', NULL, NULL, 28),
(440, 'Agua Caliente', 31003, '2021-06-01 23:38:47', 'ADMIN', NULL, NULL, 28),
(441, 'Chichipate', 31004, '2021-06-01 23:40:47', 'ADMIN', NULL, NULL, 28),
(442, 'El Aguaje', 31005, '2021-06-01 23:41:04', 'ADMIN', NULL, NULL, 28),
(443, 'El Buen Pastor', 31006, '2021-06-01 23:41:42', 'ADMIN', NULL, NULL, 28),
(444, 'El Cienegal', 31007, '2021-06-01 23:42:06', 'ADMIN', NULL, NULL, 28),
(445, 'El Palmital', 31008, '2021-06-01 23:42:32', 'ADMIN', NULL, NULL, 28),
(446, 'El Zapote', 31009, '2021-06-01 23:42:46', 'ADMIN', NULL, NULL, 28),
(447, 'Jicaro', 31010, '2021-06-01 23:43:04', 'ADMIN', NULL, NULL, 28),
(448, 'La Concepción', 31011, '2021-06-01 23:43:22', 'ADMIN', NULL, NULL, 28),
(449, 'La Joya', 31012, '2021-06-01 23:43:44', 'ADMIN', NULL, NULL, 28),
(450, 'La Mesa', 31013, '2021-06-01 23:43:56', 'ADMIN', NULL, NULL, 28),
(451, 'La Pimienta', 31014, '2021-06-01 23:44:09', 'ADMIN', NULL, NULL, 28),
(452, 'La Lajas', 31015, '2021-06-01 23:44:20', 'ADMIN', NULL, NULL, 28),
(453, 'Los Globos', 31016, '2021-06-01 23:44:38', 'ADMIN', NULL, NULL, 28),
(454, 'Los Planes', 31017, '2021-06-01 23:44:50', 'ADMIN', NULL, NULL, 28),
(455, 'Matapalo', 31018, '2021-06-01 23:45:04', 'ADMIN', NULL, NULL, 28),
(456, 'Monte de Dios', 31019, '2021-06-01 23:45:20', 'ADMIN', NULL, NULL, 28),
(457, 'Ojo de Agua', 31020, '2021-06-01 23:45:34', 'ADMIN', NULL, NULL, 28),
(458, 'Potrerilios', 31021, '2021-06-01 23:45:54', 'ADMIN', NULL, NULL, 28),
(459, 'Pueblo Nuevo', 31022, '2021-06-01 23:46:09', 'ADMIN', NULL, NULL, 28),
(460, 'San Antonio de Buenos Aires', 31023, '2021-06-01 23:46:36', 'ADMIN', NULL, NULL, 28),
(461, 'San Isidro', 31024, '2021-06-01 23:47:11', 'ADMIN', NULL, NULL, 28),
(462, 'Santa Ana', 31025, '2021-06-01 23:47:29', 'ADMIN', NULL, NULL, 28),
(463, 'Santa Elena', 31026, '2021-06-01 23:47:44', 'ADMIN', NULL, NULL, 28),
(464, 'Minas de Oro', 31101, '2021-06-01 23:52:16', 'ADMIN', NULL, NULL, 29),
(465, 'Agua Blanca', 31102, '2021-06-01 23:52:36', 'ADMIN', NULL, NULL, 29),
(466, 'El Socorro', 31103, '2021-06-01 23:52:55', 'ADMIN', NULL, NULL, 29),
(468, 'El Zompopero', 31104, '2021-06-01 23:55:32', 'ADMIN', NULL, NULL, 29),
(469, 'La Hoya de la Puerta', 31105, '2021-06-01 23:56:02', 'ADMIN', NULL, NULL, 29),
(470, 'Las Huertas', 31106, '2021-06-01 23:56:18', 'ADMIN', NULL, NULL, 29),
(471, 'Minas de San Antonio', 31107, '2021-06-01 23:57:18', 'ADMIN', NULL, NULL, 29),
(472, 'Montecitos', 31108, '2021-06-01 23:57:53', 'ADMIN', NULL, NULL, 29),
(473, 'San Isidro del Mal Paso', 31110, '2021-06-01 23:58:48', 'ADMIN', NULL, NULL, 29),
(474, 'Santa Cruz', 31111, '2021-06-01 23:59:10', 'ADMIN', NULL, NULL, 29),
(475, 'Ojos de Agua', 31201, '2021-06-02 00:00:32', 'ADMIN', NULL, NULL, 30),
(476, 'Agua Blanca', 31202, '2021-06-02 00:00:48', 'ADMIN', NULL, NULL, 30),
(477, 'Buen Pastor', 31203, '2021-06-02 00:01:04', 'ADMIN', NULL, NULL, 30),
(478, 'Campo Dos', 31204, '2021-06-02 00:01:29', 'ADMIN', NULL, NULL, 30),
(479, 'Corralitos', 31205, '2021-06-02 00:01:46', 'ADMIN', NULL, NULL, 30),
(480, 'El Hielo', 31206, '2021-06-02 00:02:30', 'ADMIN', NULL, NULL, 30),
(481, 'El Payacal', 31207, '2021-06-02 00:02:57', 'ADMIN', NULL, NULL, 30),
(482, 'El Pinabetoso', 31208, '2021-06-02 00:03:13', 'ADMIN', NULL, NULL, 30),
(483, 'El Robledal', 31209, '2021-06-02 00:03:32', 'ADMIN', NULL, NULL, 30),
(484, 'La Balastrera o Buenos Aires', 31210, '2021-06-02 00:04:20', 'ADMIN', NULL, NULL, 30),
(485, 'La Candelaria', 31211, '2021-06-02 00:05:28', 'ADMIN', NULL, NULL, 30),
(486, 'La Cañada', 31212, '2021-06-02 00:06:40', 'ADMIN', NULL, NULL, 30),
(487, 'La Providencia', 31213, '2021-06-02 00:06:52', 'ADMIN', NULL, NULL, 30),
(488, 'Los Anises', 31214, '2021-06-02 00:07:07', 'ADMIN', NULL, NULL, 30),
(489, 'Los Dos Rios', 31215, '2021-06-02 00:07:23', 'ADMIN', NULL, NULL, 30),
(490, 'Los Guineos', 31216, '2021-06-02 00:07:43', 'ADMIN', NULL, NULL, 30),
(491, 'Portillo Grande', 31217, '2021-06-02 00:08:11', 'ADMIN', NULL, NULL, 30),
(492, 'San Rafael', 31218, '2021-06-02 00:08:34', 'ADMIN', NULL, NULL, 30),
(493, 'San José de Comayagua', 31401, '2021-06-02 00:10:54', 'ADMIN', NULL, NULL, 32),
(494, 'El Calichito', 31402, '2021-06-02 00:11:25', 'ADMIN', NULL, NULL, 32),
(495, 'El Chaparral', 31403, '2021-06-02 00:11:42', 'ADMIN', NULL, NULL, 32),
(496, 'El Porvenir', 31404, '2021-06-02 00:11:57', 'ADMIN', NULL, NULL, 32),
(497, 'El Zarzal', 31405, '2021-06-02 00:12:14', 'ADMIN', NULL, NULL, 32),
(498, 'Higuerones', 31406, '2021-06-02 00:12:31', 'ADMIN', NULL, NULL, 32),
(499, 'La Laguna Seca', 31407, '2021-06-02 00:12:56', 'ADMIN', NULL, NULL, 32),
(500, 'La Pimienta', 31408, '2021-06-02 00:13:15', 'ADMIN', NULL, NULL, 32),
(501, 'La Pita', 31409, '2021-06-02 00:13:27', 'ADMIN', NULL, NULL, 32),
(502, 'Las Delicias', 31410, '2021-06-02 00:13:40', 'ADMIN', NULL, NULL, 32),
(503, 'Las Anises', 31411, '2021-06-02 00:13:53', 'ADMIN', NULL, NULL, 32),
(504, 'Los llanos de San José o Sunzapote ', 31412, '2021-06-02 00:15:08', 'ADMIN', NULL, NULL, 32),
(505, 'Puerta del Potrero', 31413, '2021-06-02 00:15:37', 'ADMIN', NULL, NULL, 32),
(506, 'San José del Potrero', 31501, '2021-06-02 00:21:21', 'ADMIN', NULL, NULL, 33),
(507, 'El Chorro', 31502, '2021-06-02 00:22:30', 'ADMIN', NULL, NULL, 33),
(508, 'Minas de Plata', 31503, '2021-06-02 00:22:49', 'ADMIN', NULL, NULL, 33),
(509, 'Ojo de Agua', 31504, '2021-06-02 00:23:04', 'ADMIN', NULL, NULL, 33),
(510, 'Potreritos', 31505, '2021-06-02 00:23:17', 'ADMIN', NULL, NULL, 33),
(511, 'Quezalapa', 31506, '2021-06-02 00:23:38', 'ADMIN', NULL, NULL, 33),
(512, 'Terreritos', 31507, '2021-06-02 00:23:49', 'ADMIN', NULL, NULL, 33),
(513, 'Terreritos de Las Trancas', 31508, '2021-06-02 00:24:19', 'ADMIN', NULL, NULL, 33),
(514, 'San Luis', 31601, '2021-06-02 00:25:02', 'ADMIN', NULL, NULL, 34),
(515, 'El Tablón', 31602, '2021-06-02 00:25:21', 'ADMIN', NULL, NULL, 34),
(516, 'El Tule', 31603, '2021-06-02 00:25:37', 'ADMIN', NULL, NULL, 34),
(517, 'Las Minitas', 31604, '2021-06-02 00:25:50', 'ADMIN', NULL, NULL, 34),
(518, 'Las Quebradas', 31605, '2021-06-02 00:26:07', 'ADMIN', NULL, NULL, 34),
(519, 'Loma Pelada', 31606, '2021-06-02 00:26:21', 'ADMIN', NULL, NULL, 34),
(520, 'Los Anisales', 31607, '2021-06-02 00:26:35', 'ADMIN', NULL, NULL, 34),
(521, 'Los Puentes', 31608, '2021-06-02 00:26:46', 'ADMIN', NULL, NULL, 34),
(522, 'Los Tres Palos', 31609, '2021-06-02 00:27:04', 'ADMIN', NULL, NULL, 34),
(523, 'Los Zacatales', 31610, '2021-06-02 00:27:20', 'ADMIN', NULL, NULL, 34),
(524, 'El Plan Grande', 31611, '2021-06-02 00:27:34', 'ADMIN', NULL, NULL, 34),
(525, 'Quebrada Amarilla', 31612, '2021-06-02 00:27:51', 'ADMIN', NULL, NULL, 34),
(526, 'Trojes', 31613, '2021-06-02 00:28:05', 'ADMIN', NULL, NULL, 34),
(527, 'San Sebastián', 31701, '2021-06-02 00:29:17', 'ADMIN', NULL, NULL, 35),
(528, 'El Ojo de Agua', 31702, '2021-06-02 00:29:32', 'ADMIN', NULL, NULL, 35),
(529, 'La Peñita', 31703, '2021-06-02 00:29:53', 'ADMIN', NULL, NULL, 35),
(530, 'Siguatepeque', 31801, '2021-06-02 00:30:27', 'ADMIN', NULL, NULL, 36),
(531, 'Agua Dulce', 31802, '2021-06-02 00:30:40', 'ADMIN', NULL, NULL, 36),
(532, 'Aguas del Padre', 31803, '2021-06-02 00:30:56', 'ADMIN', NULL, NULL, 36),
(533, 'Buena Vistor del Río Bonito', 31804, '2021-06-02 00:31:23', 'ADMIN', NULL, NULL, 36),
(534, 'Chorreritas', 31805, '2021-06-02 00:31:58', 'ADMIN', NULL, NULL, 36),
(535, 'El Achiote', 31806, '2021-06-02 00:32:19', 'ADMIN', NULL, NULL, 36),
(536, 'El Caobanál', 31807, '2021-06-02 00:32:41', 'ADMIN', NULL, NULL, 36),
(537, 'El Payacal', 31808, '2021-06-02 00:33:00', 'ADMIN', NULL, NULL, 36),
(538, 'El Pito', 31809, '2021-06-02 00:33:21', 'ADMIN', NULL, NULL, 36),
(539, 'El Porvenir', 31810, '2021-06-02 00:33:37', 'ADMIN', NULL, NULL, 36),
(540, 'El Potrerón', 31811, '2021-06-02 00:33:56', 'ADMIN', NULL, NULL, 36),
(541, 'El Rincón', 31812, '2021-06-02 00:34:13', 'ADMIN', NULL, NULL, 36),
(542, 'El Sauce', 31813, '2021-06-02 00:34:24', 'ADMIN', NULL, NULL, 36),
(543, 'El Socorro', 31814, '2021-06-02 00:34:34', 'ADMIN', NULL, NULL, 36),
(544, 'El Zapote', 31815, '2021-06-02 00:34:50', 'ADMIN', NULL, NULL, 36),
(545, 'Guarajao Nuevo', 31816, '2021-06-02 00:35:09', 'ADMIN', NULL, NULL, 36),
(546, 'Guarajao Nuevo No.1', 31817, '2021-06-02 00:35:18', 'ADMIN', NULL, NULL, 36),
(547, 'La Crucita', 31818, '2021-06-02 00:35:45', 'ADMIN', NULL, NULL, 36),
(548, 'La Unión del Sute', 31819, '2021-06-02 00:35:58', 'ADMIN', NULL, NULL, 36),
(549, 'Ojo de Agua', 31820, '2021-06-02 00:36:15', 'ADMIN', NULL, NULL, 36),
(550, 'Potrerillos', 31821, '2021-06-02 00:36:29', 'ADMIN', NULL, NULL, 36),
(551, 'Río Bonito', 31822, '2021-06-02 00:36:46', 'ADMIN', NULL, NULL, 36),
(552, 'San Antonio de la Chuchilla', 31823, '2021-06-02 00:37:11', 'ADMIN', NULL, NULL, 36),
(553, 'San Ignacio', 31824, '2021-06-02 00:37:25', 'ADMIN', NULL, NULL, 36),
(554, 'San José de La Cuesta', 31825, '2021-06-02 00:37:48', 'ADMIN', NULL, NULL, 36),
(555, 'San José de Los Changuites', 31826, '2021-06-02 00:38:18', 'ADMIN', NULL, NULL, 36),
(556, 'San Cruz del Dulce', 31827, '2021-06-02 00:38:31', 'ADMIN', NULL, NULL, 36),
(557, 'Santa Rosita', 31828, '2021-06-02 00:38:48', 'ADMIN', NULL, NULL, 36),
(558, 'Taupaz', 31829, '2021-06-02 00:38:59', 'ADMIN', NULL, NULL, 36),
(559, 'Villa de San Antonio', 31901, '2021-06-02 00:41:09', 'ADMIN', NULL, NULL, 37),
(560, 'Flores', 31902, '2021-06-02 00:41:39', 'ADMIN', NULL, NULL, 37),
(561, 'Las Botijas', 31903, '2021-06-02 00:41:52', 'ADMIN', NULL, NULL, 37),
(562, 'Los Cimientos', 31904, '2021-06-02 00:42:19', 'ADMIN', NULL, NULL, 37),
(563, 'Potero Grande o Quebrada Honda', 31905, '2021-06-02 00:42:52', 'ADMIN', NULL, NULL, 37),
(564, 'Protección', 31906, '2021-06-02 00:43:07', 'ADMIN', NULL, NULL, 37),
(565, 'Las Lajas', 31907, '2021-06-02 00:44:11', 'ADMIN', NULL, NULL, 38),
(566, 'Las Lajas', 32001, '2021-06-02 00:45:32', 'ADMIN', NULL, NULL, 38),
(567, 'Buen Pastor', 32002, '2021-06-02 00:45:53', 'ADMIN', NULL, NULL, 38),
(568, 'La Dalia', 32004, '2021-06-02 00:46:18', 'ADMIN', NULL, NULL, 38),
(569, 'Las Piñas', 32005, '2021-06-02 00:46:50', 'ADMIN', NULL, NULL, 38),
(570, 'Los Portones', 32006, '2021-06-02 00:47:07', 'ADMIN', NULL, NULL, 38),
(571, 'Nueva Concepción ', 32007, '2021-06-02 00:47:33', 'ADMIN', NULL, NULL, 38),
(572, 'San Manuel de La Parra', 32008, '2021-06-02 00:47:56', 'ADMIN', NULL, NULL, 38),
(573, 'Santa Rosa', 32009, '2021-06-02 00:48:16', 'ADMIN', NULL, NULL, 38),
(574, 'Valle Sucio', 32010, '2021-06-02 00:48:29', 'ADMIN', NULL, NULL, 38),
(575, 'Taulabé', 32101, '2021-06-02 00:49:17', 'ADMIN', NULL, NULL, 39),
(576, 'Buena Vista de Varsonia', 32102, '2021-06-02 00:50:01', 'ADMIN', NULL, NULL, 39),
(577, 'Buenos Aires', 32103, '2021-06-02 00:50:14', 'ADMIN', NULL, NULL, 39),
(578, 'Camalotales', 32104, '2021-06-02 00:50:27', 'ADMIN', NULL, NULL, 39),
(579, 'Cerro Azul', 32105, '2021-06-02 00:50:38', 'ADMIN', NULL, NULL, 39),
(580, 'Choloma', 32106, '2021-06-02 00:50:49', 'ADMIN', NULL, NULL, 39),
(581, 'El Carrizal', 32107, '2021-06-02 00:51:02', 'ADMIN', NULL, NULL, 39),
(582, 'El Cerrón', 32108, '2021-06-02 00:51:15', 'ADMIN', NULL, NULL, 39),
(583, 'El Palmichal o La Fátima', 32109, '2021-06-02 00:51:33', 'ADMIN', NULL, NULL, 39),
(584, 'Jaitique', 32110, '2021-06-02 00:51:54', 'ADMIN', NULL, NULL, 39),
(585, 'Jardines', 32111, '2021-06-02 00:52:05', 'ADMIN', NULL, NULL, 39),
(586, 'La Angostura', 32112, '2021-06-02 00:52:17', 'ADMIN', NULL, NULL, 39),
(587, 'La Misión', 32113, '2021-06-02 00:52:30', 'ADMIN', NULL, NULL, 39),
(588, 'La Unión de San Antonio', 32114, '2021-06-02 00:52:53', 'ADMIN', NULL, NULL, 39),
(589, 'Las Alejandras', 32115, '2021-06-02 00:53:08', 'ADMIN', NULL, NULL, 39),
(590, 'Las Conchas', 32116, '2021-06-02 00:53:20', 'ADMIN', NULL, NULL, 39),
(591, 'Las Lajas', 32117, '2021-06-02 00:53:30', 'ADMIN', NULL, NULL, 39),
(592, 'Montañuelas', 32118, '2021-06-02 00:53:45', 'ADMIN', NULL, NULL, 39),
(593, 'Ocomán', 32119, '2021-06-02 00:54:01', 'ADMIN', NULL, NULL, 39),
(594, 'Quebraditas', 32120, '2021-06-02 00:54:19', 'ADMIN', NULL, NULL, 39),
(595, 'Terrero Blanco', 32122, '2021-06-02 00:54:55', 'ADMIN', NULL, NULL, 39),
(596, 'Vocadilla', 32123, '2021-06-02 00:55:25', 'ADMIN', NULL, NULL, 39),
(597, 'Varsovia', 32124, '2021-06-02 00:55:39', 'ADMIN', NULL, NULL, 39),
(598, 'Santa Rosa de Copán', 40101, '2021-06-02 22:53:01', 'ADMIN', NULL, NULL, 40),
(599, 'Calzontes', 40102, '2021-06-02 22:53:19', 'ADMIN', NULL, NULL, 40),
(600, 'Conal Trincheras', 40103, '2021-06-02 22:53:38', 'ADMIN', NULL, NULL, 40),
(601, 'El Callejón', 40104, '2021-06-02 22:54:26', 'ADMIN', NULL, NULL, 40),
(602, 'El Carrizal', 40105, '2021-06-02 22:55:50', 'ADMIN', NULL, NULL, 40),
(603, 'El Corralito', 40107, '2021-06-02 22:56:09', 'ADMIN', NULL, NULL, 40),
(604, 'El Derrumbo', 40108, '2021-06-02 22:56:18', 'ADMIN', NULL, NULL, 40),
(605, 'El Periconal', 40109, '2021-06-02 22:56:28', 'ADMIN', NULL, NULL, 40),
(606, 'El Pinalito', 40110, '2021-06-02 22:56:40', 'ADMIN', NULL, NULL, 40),
(607, 'El Rodeo', 40111, '2021-06-02 22:56:50', 'ADMIN', NULL, NULL, 40),
(608, 'El Rosario', 40112, '2021-06-02 22:56:59', 'ADMIN', NULL, NULL, 40),
(609, 'El Saitrilo', 40113, '2021-06-02 22:57:16', 'ADMIN', NULL, NULL, 40),
(610, 'El Zapote', 40114, '2021-06-02 22:57:33', 'ADMIN', NULL, NULL, 40),
(611, 'Inchuma', 40115, '2021-06-02 23:02:23', 'ADMIN', NULL, NULL, 40),
(612, 'Las delicias o Las Pilas', 40116, '2021-06-02 23:02:42', 'ADMIN', NULL, NULL, 40),
(613, 'Las Sandias', 40117, '2021-06-02 23:02:58', 'ADMIN', NULL, NULL, 40),
(614, 'Oromilaca', 40118, '2021-06-02 23:03:23', 'ADMIN', NULL, NULL, 40),
(615, 'Potrerillo', 40119, '2021-06-02 23:03:39', 'ADMIN', NULL, NULL, 40),
(616, 'Quezailica', 40120, '2021-06-02 23:04:01', 'ADMIN', NULL, NULL, 40),
(617, 'Yarushin', 40121, '2021-06-02 23:04:28', 'ADMIN', NULL, NULL, 40),
(618, 'Cabañas', 40201, '2021-06-02 23:04:45', 'ADMIN', NULL, NULL, 41),
(619, 'Barbasqueadero', 40202, '2021-06-02 23:06:26', 'ADMIN', NULL, NULL, 41),
(620, 'Descombros', 40203, '2021-06-02 23:07:55', 'ADMIN', NULL, NULL, 41),
(621, 'El Guayabo', 40204, '2021-06-02 23:08:11', 'ADMIN', NULL, NULL, 41),
(622, 'El Liano', 40205, '2021-06-02 23:08:27', 'ADMIN', NULL, NULL, 41),
(623, 'Guarumal', 40206, '2021-06-02 23:09:57', 'ADMIN', NULL, NULL, 41),
(624, 'Ingenios', 40207, '2021-06-02 23:10:25', 'ADMIN', NULL, NULL, 41),
(625, 'La Cumbre de San Juan', 40208, '2021-06-02 23:10:46', 'ADMIN', NULL, NULL, 41),
(626, 'Las Juntas N. 1', 40210, '2021-06-02 23:12:14', 'ADMIN', NULL, NULL, 41),
(627, 'Las Peñas N. 1', 40211, '2021-06-02 23:12:33', 'ADMIN', NULL, NULL, 41),
(628, 'Lomas de La Esperanza', 40212, '2021-06-02 23:12:52', 'ADMIN', NULL, NULL, 41),
(629, 'Miramar', 40213, '2021-06-02 23:13:05', 'ADMIN', NULL, NULL, 41),
(630, 'La Unión de San Juan', 40209, '2021-06-02 15:18:38', 'ADMIN', NULL, NULL, 41),
(631, 'Mirasolito de La Esperanza', 40214, '2021-06-02 23:18:05', 'ADMIN', NULL, NULL, 41),
(632, 'Mirasolito de Rio Negro', 40215, '2021-06-02 23:18:20', 'ADMIN', NULL, NULL, 41),
(633, 'Motagua', 40216, '2021-06-02 23:21:02', 'ADMIN', NULL, NULL, 41),
(634, 'Pinalito', 40217, '2021-06-02 23:21:15', 'ADMIN', NULL, NULL, 41),
(635, 'Platanares', 40218, '2021-06-02 23:21:26', 'ADMIN', NULL, NULL, 41),
(636, 'Pueblo Viejo', 40219, '2021-06-02 23:21:37', 'ADMIN', NULL, NULL, 41),
(637, 'Rio Negro', 40220, '2021-06-02 23:21:53', 'ADMIN', NULL, NULL, 41),
(638, 'San José de Miramar', 40221, '2021-06-02 23:22:14', 'ADMIN', NULL, NULL, 41),
(639, 'Concepción', 40301, '2021-06-02 23:23:05', 'ADMIN', NULL, NULL, 42),
(640, 'Aldea Nueva', 40302, '2021-06-02 23:23:17', 'ADMIN', NULL, NULL, 42),
(641, 'Bañaderos', 40303, '2021-06-02 23:23:50', 'ADMIN', NULL, NULL, 42),
(642, 'Barbascales', 40304, '2021-06-02 23:24:00', 'ADMIN', NULL, NULL, 42),
(643, 'Candelaria', 40305, '2021-06-02 23:24:11', 'ADMIN', NULL, NULL, 42),
(644, 'Las Delicias', 40306, '2021-06-02 23:24:23', 'ADMIN', NULL, NULL, 42),
(645, 'Las Pavas', 40307, '2021-06-02 23:24:36', 'ADMIN', NULL, NULL, 42),
(646, 'Piedras Coloradas', 40308, '2021-06-02 23:24:47', 'ADMIN', NULL, NULL, 42),
(647, 'Plan Grande', 40309, '2021-06-02 23:24:58', 'ADMIN', NULL, NULL, 42),
(648, 'San José de Las Quebraditas', 40310, '2021-06-02 23:33:41', 'ADMIN', NULL, NULL, 42),
(649, 'San Juan', 40311, '2021-06-02 23:33:58', 'ADMIN', NULL, NULL, 42),
(650, 'Vertientes', 40312, '2021-06-02 23:34:11', 'ADMIN', NULL, NULL, 42),
(651, 'Copán Ruinas', 40401, '2021-06-02 23:38:57', 'ADMIN', NULL, NULL, 43),
(652, 'Agua Buena Arriba', 40402, '2021-06-02 23:39:12', 'ADMIN', NULL, NULL, 43),
(653, 'Agua Caliente', 40403, '2021-06-02 23:39:22', 'ADMIN', NULL, NULL, 43),
(654, 'Barbasqueadero', 40404, '2021-06-02 23:39:36', 'ADMIN', NULL, NULL, 43),
(655, 'Boca del Monte', 40405, '2021-06-02 23:39:47', 'ADMIN', NULL, NULL, 43),
(656, 'Buena Vista', 40406, '2021-06-02 23:39:59', 'ADMIN', NULL, NULL, 43),
(657, 'Buenos Aires', 40407, '2021-06-02 23:40:09', 'ADMIN', NULL, NULL, 43),
(658, 'Carrizalón', 40408, '2021-06-02 23:40:23', 'ADMIN', NULL, NULL, 43),
(659, 'Ceiba Primera', 40409, '2021-06-02 23:40:37', 'ADMIN', NULL, NULL, 43),
(660, 'Ceiba Segunda', 40410, '2021-06-02 23:40:47', 'ADMIN', NULL, NULL, 43),
(661, 'Colón Jubuco', 40411, '2021-06-02 23:40:59', 'ADMIN', NULL, NULL, 43),
(662, 'Corralito', 40412, '2021-06-02 23:41:09', 'ADMIN', NULL, NULL, 43),
(663, 'El Cisne', 40413, '2021-06-02 23:41:27', 'ADMIN', NULL, NULL, 43),
(664, 'El Cordoncillo', 40414, '2021-06-02 23:41:40', 'ADMIN', NULL, NULL, 43),
(665, 'El Chical', 40415, '2021-06-02 23:41:56', 'ADMIN', NULL, NULL, 43),
(666, 'El Chilar o Agua Zarca', 40416, '2021-06-02 23:42:31', 'ADMIN', NULL, NULL, 43);
INSERT INTO `tbl_aldeas_caserios_hn` (`id_aldea_caserio`, `nombre_aldea_caserio`, `codigo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `id_municipio`) VALUES
(667, 'El Chispal', 40417, '2021-06-02 23:42:46', 'ADMIN', NULL, NULL, 43),
(668, 'El Encino', 40418, '2021-06-02 23:42:54', 'ADMIN', NULL, NULL, 43),
(669, 'El Horno', 40419, '2021-06-02 23:43:09', 'ADMIN', NULL, NULL, 43),
(670, 'El Ocote', 40420, '2021-06-02 23:44:02', 'ADMIN', NULL, NULL, 43),
(671, 'El Porvenir Primero', 40421, '2021-06-02 23:44:21', 'ADMIN', NULL, NULL, 43),
(672, 'El Porvenir Segundo', 40422, '2021-06-02 23:44:29', 'ADMIN', NULL, NULL, 43),
(673, 'El Quebracho', 40423, '2021-06-02 23:44:42', 'ADMIN', NULL, NULL, 43),
(674, 'El Salitrón', 40424, '2021-06-02 23:44:53', 'ADMIN', NULL, NULL, 43),
(675, 'El Tesorito', 40425, '2021-06-02 23:45:10', 'ADMIN', NULL, NULL, 43),
(676, 'El Triunfo', 40426, '2021-06-02 23:45:20', 'ADMIN', NULL, NULL, 43),
(677, 'hacienda Grande', 40427, '2021-06-02 23:45:34', 'ADMIN', NULL, NULL, 43),
(678, 'Jubucón', 40428, '2021-06-02 23:45:52', 'ADMIN', NULL, NULL, 43),
(679, 'La Esperanza', 40429, '2021-06-02 23:46:02', 'ADMIN', NULL, NULL, 43),
(680, 'La Estanzuela', 40430, '2021-06-02 23:46:13', 'ADMIN', NULL, NULL, 43),
(681, 'La Laguna', 40431, '2021-06-02 23:47:14', 'ADMIN', NULL, NULL, 43),
(682, 'Las Delicias', 40432, '2021-06-02 23:47:24', 'ADMIN', NULL, NULL, 43),
(683, 'Las Flores', 40433, '2021-06-02 23:47:36', 'ADMIN', NULL, NULL, 43),
(684, 'Los Arcos', 40434, '2021-06-02 23:47:48', 'ADMIN', NULL, NULL, 43),
(685, 'Llanelitos', 40435, '2021-06-02 23:48:00', 'ADMIN', NULL, NULL, 43),
(686, 'Monte de Los Negros', 40436, '2021-06-02 23:48:17', 'ADMIN', NULL, NULL, 43),
(687, 'Montecristo', 40437, '2021-06-02 23:48:29', 'ADMIN', NULL, NULL, 43),
(688, 'Nueva Armenia', 40438, '2021-06-02 23:48:38', 'ADMIN', NULL, NULL, 43),
(689, 'Ostumán', 40439, '2021-06-02 23:48:53', 'ADMIN', NULL, NULL, 43),
(690, 'San Antonio Tapesco', 40440, '2021-06-02 23:51:04', 'ADMIN', NULL, NULL, 43),
(691, 'San Cristobál', 40441, '2021-06-02 23:51:13', 'ADMIN', NULL, NULL, 43),
(692, 'San Francisco', 40442, '2021-06-02 23:51:23', 'ADMIN', NULL, NULL, 43),
(693, 'San Isidro', 40443, '2021-06-02 23:51:32', 'ADMIN', NULL, NULL, 43),
(694, 'San Rafael', 40444, '2021-06-02 23:51:40', 'ADMIN', NULL, NULL, 43),
(695, 'Santa Cruz de Virginia', 40445, '2021-06-02 23:52:05', 'ADMIN', NULL, NULL, 43),
(696, 'Santa Rosita', 40446, '2021-06-02 23:52:19', 'ADMIN', NULL, NULL, 43),
(697, 'Sesesmil Primero', 40447, '2021-06-02 23:52:32', 'ADMIN', NULL, NULL, 43),
(698, 'Sesesmil Segundo', 40448, '2021-06-02 23:52:50', 'ADMIN', NULL, NULL, 43),
(699, 'Unión Central', 40449, '2021-06-02 23:53:02', 'ADMIN', NULL, NULL, 43),
(700, 'Virginia N.1', 40450, '2021-06-02 23:53:17', 'ADMIN', NULL, NULL, 43),
(701, 'Corquin', 40451, '2021-06-02 23:53:31', 'ADMIN', NULL, NULL, 44),
(702, 'Agua Caliente', 40502, '2021-06-02 23:55:33', 'ADMIN', NULL, NULL, 44),
(703, 'Boca del Monte', 40503, '2021-06-02 23:55:46', 'ADMIN', NULL, NULL, 44),
(704, 'Capucas', 40504, '2021-06-02 23:55:58', 'ADMIN', NULL, NULL, 44),
(705, 'El Carrizal', 40505, '2021-06-02 23:56:07', 'ADMIN', NULL, NULL, 44),
(706, 'Gualme', 40506, '2021-06-02 23:56:18', 'ADMIN', NULL, NULL, 44),
(707, 'Jimillile', 40507, '2021-06-02 23:56:59', 'ADMIN', NULL, NULL, 44),
(708, 'Las Casitas', 40508, '2021-06-02 23:57:07', 'ADMIN', NULL, NULL, 44),
(709, 'Potrerillos', 40509, '2021-06-02 23:57:16', 'ADMIN', NULL, NULL, 44),
(710, 'Cucuyagua', 40601, '2021-06-02 23:57:46', 'ADMIN', NULL, NULL, 45),
(711, 'Cartagua', 40602, '2021-06-02 23:57:53', 'ADMIN', NULL, NULL, 45),
(712, 'El Nispero', 40603, '2021-06-02 23:58:02', 'ADMIN', NULL, NULL, 45),
(713, 'El Portillo', 40604, '2021-06-02 23:58:25', 'ADMIN', NULL, NULL, 45),
(714, 'El Tránsito', 40605, '2021-06-02 23:58:37', 'ADMIN', NULL, NULL, 45),
(715, 'Gualtaya', 40606, '2021-06-02 23:58:48', 'ADMIN', NULL, NULL, 45),
(716, 'Ojos de Agua', 40607, '2021-06-02 23:58:58', 'ADMIN', NULL, NULL, 45),
(717, 'San José de Las Palmas', 40608, '2021-06-02 23:59:16', 'ADMIN', NULL, NULL, 45),
(718, 'Dolores', 40701, '2021-06-03 00:00:29', 'ADMIN', NULL, NULL, 46),
(719, 'Agua Buena', 40702, '2021-06-03 00:00:39', 'ADMIN', NULL, NULL, 46),
(720, 'El Báisamo o La Canteada', 40703, '2021-06-03 00:00:58', 'ADMIN', NULL, NULL, 46),
(721, 'El Camalote', 40704, '2021-06-03 00:01:12', 'ADMIN', NULL, NULL, 46),
(722, 'Joyas Galanas', 40705, '2021-06-03 00:02:30', 'ADMIN', NULL, NULL, 46),
(723, 'Pasquingual', 40706, '2021-06-03 00:02:43', 'ADMIN', NULL, NULL, 46),
(724, 'Plan del Naranjo', 40707, '2021-06-03 00:02:53', 'ADMIN', NULL, NULL, 46),
(725, 'San Antonio', 40708, '2021-06-03 00:03:04', 'ADMIN', NULL, NULL, 46),
(726, 'Vega Redonda o San Antonio', 40709, '2021-06-03 00:03:20', 'ADMIN', NULL, NULL, 46),
(727, 'Yaruconte', 40710, '2021-06-03 00:03:41', 'ADMIN', NULL, NULL, 46),
(728, 'Dulce Nombre', 40801, '2021-06-03 00:04:02', 'ADMIN', NULL, NULL, 47),
(729, 'Agua Buena', 40802, '2021-06-03 00:04:13', 'ADMIN', NULL, NULL, 47),
(730, 'El Limón', 40803, '2021-06-03 00:04:22', 'ADMIN', NULL, NULL, 47),
(731, 'El Prado de La Cruz', 40804, '2021-06-03 00:05:07', 'ADMIN', NULL, NULL, 47),
(732, 'EEl Zapote', 40805, '2021-06-03 00:05:21', 'ADMIN', NULL, NULL, 47),
(733, 'Las Caleras o El Horno', 40806, '2021-06-03 00:05:38', 'ADMIN', NULL, NULL, 47),
(734, 'San Jerónimo', 40807, '2021-06-03 00:05:55', 'ADMIN', NULL, NULL, 47),
(735, 'Agua Buena', 408902, '2021-06-03 00:06:34', 'ADMIN', NULL, NULL, 48),
(736, 'Buena Vista', 408903, '2021-06-03 00:06:44', 'ADMIN', NULL, NULL, 48),
(737, 'El Charcón', 408904, '2021-06-03 00:06:54', 'ADMIN', NULL, NULL, 48),
(738, 'El Infiernillo o Nuevo T', 408905, '2021-06-03 00:07:22', 'ADMIN', NULL, NULL, 48),
(739, 'El Limón', 408906, '2021-06-03 00:07:34', 'ADMIN', NULL, NULL, 48),
(740, 'El Manacal', 408907, '2021-06-03 00:07:46', 'ADMIN', NULL, NULL, 48),
(741, 'El Manguito', 408908, '2021-06-03 00:07:54', 'ADMIN', NULL, NULL, 48),
(742, 'El Tesoro', 408909, '2021-06-03 00:08:00', 'ADMIN', NULL, NULL, 48),
(743, 'La Cumbre', 408910, '2021-06-03 00:08:11', 'ADMIN', NULL, NULL, 48),
(744, 'La Laguna', 408911, '2021-06-03 00:08:24', 'ADMIN', NULL, NULL, 48),
(745, 'La Peña', 408912, '2021-06-03 00:08:32', 'ADMIN', NULL, NULL, 48),
(746, 'La Pimienta', 408913, '2021-06-03 00:08:43', 'ADMIN', NULL, NULL, 48),
(747, 'La Playona', 408914, '2021-06-03 00:08:52', 'ADMIN', NULL, NULL, 48),
(748, 'Las Delicias del Chispal', 408915, '2021-06-03 00:09:05', 'ADMIN', NULL, NULL, 48),
(749, 'Las Flores', 408916, '2021-06-03 00:09:15', 'ADMIN', NULL, NULL, 48),
(750, 'Las Juntas', 408917, '2021-06-03 00:09:26', 'ADMIN', NULL, NULL, 48),
(751, 'Las Orquideas o El Astillero', 408918, '2021-06-03 00:10:06', 'ADMIN', NULL, NULL, 48),
(752, 'Libertad Nueva', 408919, '2021-06-03 00:10:21', 'ADMIN', NULL, NULL, 48),
(753, 'Libertad Vieja', 408920, '2021-06-03 00:10:37', 'ADMIN', NULL, NULL, 48),
(754, 'Naranjito', 408921, '2021-06-03 00:12:25', 'ADMIN', NULL, NULL, 48),
(755, 'Rio Lindo', 408922, '2021-06-03 00:12:39', 'ADMIN', NULL, NULL, 48),
(756, 'San Antonio de Las Crucitas', 408923, '2021-06-03 00:12:58', 'ADMIN', NULL, NULL, 48),
(757, 'San Cristóbal', 408924, '2021-06-03 00:13:22', 'ADMIN', NULL, NULL, 48),
(758, 'San Marcos', 408925, '2021-06-03 00:13:35', 'ADMIN', NULL, NULL, 48),
(759, 'Santa Cruz', 408926, '2021-06-03 00:13:56', 'ADMIN', NULL, NULL, 48),
(760, 'Santa Lucía', 408927, '2021-06-03 00:14:07', 'ADMIN', NULL, NULL, 48),
(761, 'Florida', 41001, '2021-06-03 00:15:06', 'ADMIN', NULL, NULL, 49),
(762, 'Arranca Barba', 41002, '2021-06-03 00:18:36', 'ADMIN', NULL, NULL, 49),
(763, 'Barranca Grita', 41003, '2021-06-03 00:18:51', 'ADMIN', NULL, NULL, 49),
(764, 'Buena Vista', 41004, '2021-06-03 00:19:01', 'ADMIN', NULL, NULL, 49),
(765, 'Buenos Aires', 41005, '2021-06-03 00:20:15', 'ADMIN', NULL, NULL, 49),
(766, 'Concepción deLa Barranca', 41006, '2021-06-03 00:20:35', 'ADMIN', NULL, NULL, 49),
(767, 'El Dormitorio N.2', 41007, '2021-06-03 00:20:52', 'ADMIN', NULL, NULL, 49),
(768, 'El Espiritu Santo', 41008, '2021-06-03 00:21:07', 'ADMIN', NULL, NULL, 49),
(769, 'El Jardin', 41009, '2021-06-03 00:21:18', 'ADMIN', NULL, NULL, 49),
(770, 'El Nuevo Porvenir', 41010, '2021-06-03 00:21:29', 'ADMIN', NULL, NULL, 49),
(771, 'El Porvenir o San Marcos', 41011, '2021-06-03 00:22:14', 'ADMIN', NULL, NULL, 49),
(772, 'El Rosario Zompopero', 41012, '2021-06-03 00:22:30', 'ADMIN', NULL, NULL, 49),
(773, 'Gritaderos', 41013, '2021-06-03 00:22:45', 'ADMIN', NULL, NULL, 49),
(774, 'La Cumbre de Las Flores', 41014, '2021-06-03 00:22:58', 'ADMIN', NULL, NULL, 49),
(775, 'La Elencia', 41015, '2021-06-03 00:23:11', 'ADMIN', NULL, NULL, 49),
(776, 'La Elencita', 41016, '2021-06-03 00:23:53', 'ADMIN', NULL, NULL, 49),
(777, 'La Laguna de San José', 41017, '2021-06-03 00:24:13', 'ADMIN', NULL, NULL, 49),
(778, 'La Ruidosa', 41018, '2021-06-03 00:24:31', 'ADMIN', NULL, NULL, 49),
(779, 'La Sierra', 41019, '2021-06-03 00:24:39', 'ADMIN', NULL, NULL, 49),
(780, 'La Unión', 41020, '2021-06-03 00:24:49', 'ADMIN', NULL, NULL, 49),
(781, 'Las Cañas', 41021, '2021-06-03 00:24:59', 'ADMIN', NULL, NULL, 49),
(782, 'Las Flores de Techin', 41022, '2021-06-03 00:25:11', 'ADMIN', NULL, NULL, 49),
(783, 'Las Palmeras de La Plana', 41023, '2021-06-03 00:25:30', 'ADMIN', NULL, NULL, 49),
(784, 'Los Dubones', 41024, '2021-06-03 00:25:43', 'ADMIN', NULL, NULL, 49),
(785, 'Los Lesquines', 41025, '2021-06-03 00:25:52', 'ADMIN', NULL, NULL, 49),
(786, 'Pastoreadero', 41026, '2021-06-03 00:26:04', 'ADMIN', NULL, NULL, 49),
(787, 'Plancitos o  Berlín', 41027, '2021-06-03 00:26:26', 'ADMIN', NULL, NULL, 49),
(788, 'Potrerillos', 41028, '2021-06-03 00:26:48', 'ADMIN', NULL, NULL, 49),
(789, 'Pueblo Negro', 41029, '2021-06-03 00:27:01', 'ADMIN', NULL, NULL, 49),
(790, 'Ratrojitos', 41030, '2021-06-03 00:27:19', 'ADMIN', NULL, NULL, 49),
(791, 'San Antonio', 41031, '2021-06-03 00:27:27', 'ADMIN', NULL, NULL, 49),
(792, 'SanJosé de La Frontera', 41032, '2021-06-03 00:27:40', 'ADMIN', NULL, NULL, 49),
(793, 'San Lorenzo de Techin', 41033, '2021-06-03 00:27:57', 'ADMIN', NULL, NULL, 49),
(794, 'San Rafael', 41034, '2021-06-03 00:36:33', 'ADMIN', NULL, NULL, 49),
(795, 'Siete Cuchillas', 41035, '2021-06-03 00:36:45', 'ADMIN', NULL, NULL, 49),
(796, 'La Jigua', 41101, '2021-06-03 19:40:40', 'ADMIN', NULL, NULL, 50),
(797, 'Aldea Nueva', 41102, '2021-06-03 19:40:54', 'ADMIN', NULL, NULL, 50),
(798, 'Chepelares', 41103, '2021-06-03 19:41:05', 'ADMIN', NULL, NULL, 50),
(799, 'El Campanario', 41104, '2021-06-03 19:41:16', 'ADMIN', NULL, NULL, 50),
(800, 'El Puente Goascorán', 41105, '2021-06-03 19:42:05', 'ADMIN', NULL, NULL, 50),
(801, 'El Rincón o San Francisco', 41106, '2021-06-03 19:43:26', 'ADMIN', NULL, NULL, 50),
(802, 'La Colmena', 41107, '2021-06-03 19:43:39', 'ADMIN', NULL, NULL, 50),
(803, 'La Cuchilla de Platanares', 41108, '2021-06-03 19:43:56', 'ADMIN', NULL, NULL, 50),
(804, 'La Nueva Unión', 41109, '2021-06-03 19:44:17', 'ADMIN', NULL, NULL, 50),
(805, 'Piedra Pintada', 41110, '2021-06-03 19:44:36', 'ADMIN', NULL, NULL, 50),
(806, 'Valle de Magdalena', 41111, '2021-06-03 19:44:53', 'ADMIN', NULL, NULL, 50),
(807, 'La Unión', 41201, '2021-06-03 19:45:10', 'ADMIN', NULL, NULL, 51),
(808, 'Azacualpa', 41202, '2021-06-03 19:45:40', 'ADMIN', NULL, NULL, 51),
(809, 'El Corpus', 41203, '2021-06-03 19:45:50', 'ADMIN', NULL, NULL, 51),
(810, 'El Junco', 41204, '2021-06-03 19:46:00', 'ADMIN', NULL, NULL, 51),
(811, 'El Trigo', 41205, '2021-06-03 19:46:08', 'ADMIN', NULL, NULL, 51),
(812, 'La Arena', 41206, '2021-06-03 19:46:22', 'ADMIN', NULL, NULL, 51),
(813, 'Las Minas de San Andrés', 41207, '2021-06-03 19:46:35', 'ADMIN', NULL, NULL, 51),
(814, 'San Miguel', 41208, '2021-06-03 19:46:47', 'ADMIN', NULL, NULL, 51),
(815, 'Santa Cruz', 41209, '2021-06-03 19:46:58', 'ADMIN', NULL, NULL, 51),
(816, 'Nueva Arcadia', 41301, '2021-06-03 19:47:57', 'ADMIN', NULL, NULL, 52),
(817, 'La Entrada', 41302, '2021-06-03 19:48:06', 'ADMIN', NULL, NULL, 52),
(818, 'Agua Buena', 41303, '2021-06-03 19:48:16', 'ADMIN', NULL, NULL, 52),
(819, 'Buenos Aires', 41304, '2021-06-03 19:48:57', 'ADMIN', NULL, NULL, 52),
(820, 'Chalmeca', 41305, '2021-06-03 19:49:17', 'ADMIN', NULL, NULL, 52),
(821, 'Jimerico o Piedra Parada', 41306, '2021-06-03 19:49:30', 'ADMIN', NULL, NULL, 52),
(822, 'La Cuchilla', 41307, '2021-06-03 19:49:41', 'ADMIN', NULL, NULL, 52),
(823, 'La Unión', 41308, '2021-06-03 19:49:56', 'ADMIN', NULL, NULL, 52),
(824, 'Los Pozos', 41309, '2021-06-03 19:50:09', 'ADMIN', NULL, NULL, 52),
(825, 'Los Tangos', 41310, '2021-06-03 19:50:25', 'ADMIN', NULL, NULL, 52),
(826, 'Quebrada Seca', 41311, '2021-06-03 19:50:49', 'ADMIN', NULL, NULL, 52),
(827, 'San Isidro', 41312, '2021-06-03 19:51:01', 'ADMIN', NULL, NULL, 52),
(828, 'San Pablo del Roble', 41313, '2021-06-03 19:51:14', 'ADMIN', NULL, NULL, 52),
(829, 'San Agustin', 41401, '2021-06-03 19:51:33', 'ADMIN', NULL, NULL, 53),
(830, 'Cerro Negro', 41402, '2021-06-03 19:52:35', 'ADMIN', NULL, NULL, 53),
(831, 'El Descombro', 41403, '2021-06-03 19:52:46', 'ADMIN', NULL, NULL, 53),
(832, 'Granadilla', 41404, '2021-06-03 19:52:57', 'ADMIN', NULL, NULL, 53),
(833, 'San Antonio', 41501, '2021-06-03 19:53:06', 'ADMIN', NULL, NULL, 54),
(834, 'Concepción', 41502, '2021-06-03 19:54:23', 'ADMIN', NULL, NULL, 54),
(835, 'El Ocotón o Villa Nueva', 41503, '2021-06-03 19:54:51', 'ADMIN', NULL, NULL, 54),
(836, 'La Reina', 41504, '2021-06-03 19:55:02', 'ADMIN', NULL, NULL, 54),
(837, 'La Zumadora', 41505, '2021-06-03 19:55:13', 'ADMIN', NULL, NULL, 54),
(838, 'Loma Ancha', 41506, '2021-06-03 19:55:26', 'ADMIN', NULL, NULL, 54),
(839, 'Peña Blanca', 41507, '2021-06-03 19:55:37', 'ADMIN', NULL, NULL, 54),
(840, 'Pueblo Nuevo', 41508, '2021-06-03 19:55:53', 'ADMIN', NULL, NULL, 54),
(841, 'Quebrada Grande', 41509, '2021-06-03 19:56:05', 'ADMIN', NULL, NULL, 54),
(842, 'Quebrada Honda', 41510, '2021-06-03 19:56:12', 'ADMIN', NULL, NULL, 54),
(843, 'San Joaquin', 41511, '2021-06-03 19:56:22', 'ADMIN', NULL, NULL, 54),
(844, 'San Luis', 41512, '2021-06-03 19:56:31', 'ADMIN', NULL, NULL, 54),
(845, 'San Raimundo', 41513, '2021-06-03 19:56:41', 'ADMIN', NULL, NULL, 54),
(846, 'Tierra Colorada', 41514, '2021-06-03 19:56:53', 'ADMIN', NULL, NULL, 54),
(847, 'San Jeronimo', 41601, '2021-06-03 19:57:38', 'ADMIN', NULL, NULL, 55),
(848, 'Agua Zarca', 41602, '2021-06-03 19:57:50', 'ADMIN', NULL, NULL, 55),
(849, 'El Rosario', 41603, '2021-06-03 19:58:00', 'ADMIN', NULL, NULL, 55),
(850, 'El Tránsito', 41604, '2021-06-03 19:58:11', 'ADMIN', NULL, NULL, 55),
(851, 'El Volcán', 41605, '2021-06-03 19:58:21', 'ADMIN', NULL, NULL, 55),
(852, 'La Esperanza', 41606, '2021-06-03 19:58:35', 'ADMIN', NULL, NULL, 55),
(853, 'Santa Elena', 41607, '2021-06-03 19:58:44', 'ADMIN', NULL, NULL, 55),
(854, 'Tierra Blanca', 41608, '2021-06-03 19:58:54', 'ADMIN', NULL, NULL, 55),
(855, 'San José', 41701, '2021-06-03 19:59:19', 'ADMIN', NULL, NULL, 56),
(856, 'Buena Vista', 41702, '2021-06-03 19:59:32', 'ADMIN', NULL, NULL, 56),
(857, 'El Porvenir', 41703, '2021-06-03 19:59:44', 'ADMIN', NULL, NULL, 56),
(858, 'Las Delicias', 41704, '2021-06-03 19:59:54', 'ADMIN', NULL, NULL, 56),
(859, 'Plan de San Jerónimo', 41705, '2021-06-03 20:00:18', 'ADMIN', NULL, NULL, 56),
(860, 'Vivistorio', 41706, '2021-06-03 20:00:38', 'ADMIN', NULL, NULL, 56),
(861, 'San Juan de Opoa', 41801, '2021-06-03 20:01:02', 'ADMIN', NULL, NULL, 57),
(862, 'La Colatina', 41802, '2021-06-03 20:01:14', 'ADMIN', NULL, NULL, 57),
(863, 'EL Contamal', 41803, '2021-06-03 20:01:31', 'ADMIN', NULL, NULL, 57),
(864, 'EL Coyotal', 41804, '2021-06-03 20:01:41', 'ADMIN', NULL, NULL, 57),
(865, 'EL Limón', 41805, '2021-06-03 20:01:53', 'ADMIN', NULL, NULL, 57),
(866, 'EL Pinal', 41806, '2021-06-03 20:02:04', 'ADMIN', NULL, NULL, 57),
(867, 'EL Portillo', 41807, '2021-06-03 20:02:18', 'ADMIN', NULL, NULL, 57),
(868, 'La Cebratana', 41808, '2021-06-03 20:02:31', 'ADMIN', NULL, NULL, 57),
(869, 'La Laguna Negra', 41809, '2021-06-03 20:02:42', 'ADMIN', NULL, NULL, 57),
(870, 'La Majada', 41810, '2021-06-03 20:02:52', 'ADMIN', NULL, NULL, 57),
(871, 'Las Sandias', 41811, '2021-06-03 20:03:09', 'ADMIN', NULL, NULL, 57),
(872, 'Los Linderos', 41812, '2021-06-03 20:03:20', 'ADMIN', NULL, NULL, 57),
(873, 'Los Pozos', 41813, '2021-06-03 20:03:27', 'ADMIN', NULL, NULL, 57),
(874, 'Santa Elena', 41814, '2021-06-03 20:03:39', 'ADMIN', NULL, NULL, 57),
(875, 'Torihuaque', 41815, '2021-06-03 20:03:56', 'ADMIN', NULL, NULL, 57),
(876, 'San Nicolás', 41901, '2021-06-03 20:04:39', 'ADMIN', NULL, NULL, 58),
(877, 'Buena Vista o El Tablón', 41902, '2021-06-03 20:05:15', 'ADMIN', NULL, NULL, 58),
(878, 'El Achiotal', 41903, '2021-06-03 20:05:32', 'ADMIN', NULL, NULL, 58),
(879, 'El Modelo', 41904, '2021-06-03 20:05:41', 'ADMIN', NULL, NULL, 58),
(880, 'El Porvenir', 41905, '2021-06-03 20:05:49', 'ADMIN', NULL, NULL, 58),
(881, 'El Puerta', 41906, '2021-06-03 20:05:59', 'ADMIN', NULL, NULL, 58),
(882, 'Nueva Concepción', 41907, '2021-06-03 20:06:30', 'ADMIN', NULL, NULL, 58),
(883, 'San Pedro', 42001, '2021-06-03 20:07:03', 'ADMIN', NULL, NULL, 59),
(884, 'Cartagua', 42002, '2021-06-03 20:08:12', 'ADMIN', NULL, NULL, 59),
(885, 'El Zapote', 42003, '2021-06-03 20:08:19', 'ADMIN', NULL, NULL, 59),
(886, 'Las Capucas', 42004, '2021-06-03 20:08:30', 'ADMIN', NULL, NULL, 59),
(887, 'San Francisco o El Ejido', 42005, '2021-06-03 20:08:51', 'ADMIN', NULL, NULL, 59),
(888, 'Yaunera', 42006, '2021-06-03 20:09:09', 'ADMIN', NULL, NULL, 59),
(889, 'Santa Rita', 42101, '2021-06-03 20:09:19', 'ADMIN', NULL, NULL, 60),
(890, 'Agua Caliente', 42102, '2021-06-03 20:12:37', 'ADMIN', NULL, NULL, 60),
(891, 'Buena Vista', 42103, '2021-06-03 20:12:47', 'ADMIN', NULL, NULL, 60),
(892, 'Campamento', 42104, '2021-06-03 20:12:59', 'ADMIN', NULL, NULL, 60),
(893, 'El Goblado', 42105, '2021-06-03 20:13:09', 'ADMIN', NULL, NULL, 60),
(894, 'El Jaral', 42106, '2021-06-03 20:13:28', 'ADMIN', NULL, NULL, 60),
(895, 'El Mirador', 42107, '2021-06-03 20:13:37', 'ADMIN', NULL, NULL, 60),
(896, 'El Plantón', 42108, '2021-06-03 20:13:48', 'ADMIN', NULL, NULL, 60),
(897, 'El Raizal', 42109, '2021-06-03 20:13:58', 'ADMIN', NULL, NULL, 60),
(898, 'El Rosario', 42110, '2021-06-03 20:14:21', 'ADMIN', NULL, NULL, 60),
(899, 'El Tamarindo', 42111, '2021-06-03 20:14:37', 'ADMIN', NULL, NULL, 60),
(900, 'Gotas de Sangre', 42112, '2021-06-03 20:14:50', 'ADMIN', NULL, NULL, 60),
(901, 'La Canteada', 42113, '2021-06-03 20:15:08', 'ADMIN', NULL, NULL, 60),
(902, 'La Libertad', 42115, '2021-06-03 20:22:25', 'ADMIN', NULL, NULL, 60),
(903, 'La Reforma', 42116, '2021-06-03 20:22:38', 'ADMIN', NULL, NULL, 60),
(904, 'La Unión Otuta', 42117, '2021-06-03 20:22:53', 'ADMIN', NULL, NULL, 60),
(905, 'Las Medias', 42118, '2021-06-03 20:23:03', 'ADMIN', NULL, NULL, 60),
(906, 'Las Mesas', 42119, '2021-06-03 20:23:12', 'ADMIN', NULL, NULL, 60),
(907, 'Los Achiotes', 42120, '2021-06-03 20:23:24', 'ADMIN', NULL, NULL, 60),
(908, 'Los Planes de La Brea', 42121, '2021-06-03 20:23:42', 'ADMIN', NULL, NULL, 60),
(909, 'Los Ranchos', 42122, '2021-06-03 20:23:53', 'ADMIN', NULL, NULL, 60),
(910, 'Minas de Piedra', 42123, '2021-06-03 20:24:12', 'ADMIN', NULL, NULL, 60),
(911, 'Mirasol', 42124, '2021-06-03 20:24:34', 'ADMIN', NULL, NULL, 60),
(912, 'Plan Grande', 42125, '2021-06-03 20:24:53', 'ADMIN', NULL, NULL, 60),
(913, 'Rastrojitos', 42126, '2021-06-03 20:25:07', 'ADMIN', NULL, NULL, 60),
(914, 'Rio Amarillo', 42127, '2021-06-03 20:25:17', 'ADMIN', NULL, NULL, 60),
(915, 'Rio Blanco', 42128, '2021-06-03 20:25:29', 'ADMIN', NULL, NULL, 60),
(916, 'San Jerónimo', 42129, '2021-06-03 20:25:42', 'ADMIN', NULL, NULL, 60),
(917, 'Tierra Fria N.1', 42130, '2021-06-03 20:25:55', 'ADMIN', NULL, NULL, 60),
(918, 'Tierra Fria N.2', 42131, '2021-06-03 20:26:05', 'ADMIN', NULL, NULL, 60),
(919, 'Vara de Cohete', 42132, '2021-06-03 20:26:17', 'ADMIN', NULL, NULL, 60),
(920, 'Trinidad de Copán', 42201, '2021-06-03 20:26:40', 'ADMIN', NULL, NULL, 61),
(921, 'La Cumbre', 42203, '2021-06-03 20:27:43', 'ADMIN', NULL, NULL, 61),
(922, 'Lepaerita', 42204, '2021-06-03 20:27:53', 'ADMIN', NULL, NULL, 61),
(923, 'Quebraditas', 42205, '2021-06-03 20:28:06', 'ADMIN', NULL, NULL, 61),
(924, 'San Juan de Planes', 42206, '2021-06-03 20:28:18', 'ADMIN', NULL, NULL, 61),
(925, 'Veracruz', 42301, '2021-06-03 20:28:53', 'ADMIN', NULL, NULL, 62),
(926, 'Agua Caliente', 42302, '2021-06-03 20:29:02', 'ADMIN', NULL, NULL, 62),
(927, 'El Triunfo', 42303, '2021-06-03 20:29:14', 'ADMIN', NULL, NULL, 62),
(928, 'San Antonio', 42304, '2021-06-03 20:29:23', 'ADMIN', NULL, NULL, 62),
(929, 'San Pedro Sula', 50101, '2021-06-03 21:36:26', 'ADMIN', NULL, NULL, 63),
(930, 'Artemisales', 50102, '2021-06-03 21:36:35', 'ADMIN', NULL, NULL, 63),
(931, 'Bañaderos o Guadalupe', 50103, '2021-06-03 21:36:48', 'ADMIN', NULL, NULL, 63),
(932, 'Berlin', 50104, '2021-06-03 21:36:58', 'ADMIN', NULL, NULL, 63),
(933, 'Buena Vista', 50105, '2021-06-03 21:37:06', 'ADMIN', NULL, NULL, 63),
(934, 'Buenos Aires de Bañaderos', 50106, '2021-06-03 21:37:20', 'ADMIN', NULL, NULL, 63),
(935, 'Campo La Mesa', 50107, '2021-06-03 21:37:33', 'ADMIN', NULL, NULL, 63),
(936, 'Cofradia', 50108, '2021-06-03 21:37:45', 'ADMIN', NULL, NULL, 63),
(937, 'Copán', 50109, '2021-06-03 21:37:58', 'ADMIN', NULL, NULL, 63),
(938, 'Corrientes', 50110, '2021-06-03 21:38:10', 'ADMIN', NULL, NULL, 63),
(939, 'Chotepe', 50111, '2021-06-03 21:38:19', 'ADMIN', NULL, NULL, 63),
(940, 'El Corbano', 50112, '2021-06-03 21:38:27', 'ADMIN', NULL, NULL, 63),
(941, 'El Gallito o Laguna de Tembladeros', 50113, '2021-06-03 21:38:48', 'ADMIN', NULL, NULL, 63),
(942, 'El Palmar', 50114, '2021-06-03 21:38:57', 'ADMIN', NULL, NULL, 63),
(943, 'El Zapotal Sur', 50115, '2021-06-03 21:39:07', 'ADMIN', NULL, NULL, 63),
(944, 'Flor del Valle', 50116, '2021-06-03 21:39:19', 'ADMIN', NULL, NULL, 63),
(945, 'La Ceibita', 50117, '2021-06-03 21:39:30', 'ADMIN', NULL, NULL, 63),
(946, 'La Cuchilla de La Nueva Concepción', 50118, '2021-06-03 21:39:46', 'ADMIN', NULL, NULL, 63),
(947, 'La Cumbre', 50119, '2021-06-03 21:40:06', 'ADMIN', NULL, NULL, 63),
(948, 'La Fortuna', 50120, '2021-06-03 21:40:17', 'ADMIN', NULL, NULL, 63),
(949, 'La Neblina de Miramar', 50122, '2021-06-03 21:40:28', 'ADMIN', NULL, NULL, 63),
(950, 'La Pita', 50123, '2021-06-03 21:40:37', 'ADMIN', NULL, NULL, 63),
(951, 'La Unión de Rio Frío', 50124, '2021-06-03 21:42:09', 'ADMIN', NULL, NULL, 63),
(952, 'La Virtud', 50125, '2021-06-03 21:42:22', 'ADMIN', NULL, NULL, 63),
(953, 'Laguna de Bañaderos', 50126, '2021-06-03 21:42:50', 'ADMIN', NULL, NULL, 63),
(954, 'Las Brisas del Merendón', 50127, '2021-06-03 21:43:09', 'ADMIN', NULL, NULL, 63),
(955, 'Las Delicias', 50128, '2021-06-03 21:43:21', 'ADMIN', NULL, NULL, 63),
(956, 'Las Flores del Río Frío', 50129, '2021-06-03 21:43:32', 'ADMIN', NULL, NULL, 63),
(957, 'Las Juntas de Bañaderos', 50130, '2021-06-03 21:43:45', 'ADMIN', NULL, NULL, 63),
(958, 'Mayán', 50131, '2021-06-03 21:43:59', 'ADMIN', NULL, NULL, 63),
(959, 'Miramelinida', 50132, '2021-06-03 21:44:08', 'ADMIN', NULL, NULL, 63),
(960, 'Naco', 50133, '2021-06-03 21:44:16', 'ADMIN', NULL, NULL, 63),
(961, 'Nueva Edén', 50134, '2021-06-03 21:44:39', 'ADMIN', NULL, NULL, 63),
(962, 'Peñitas Abajo', 50135, '2021-06-03 21:44:51', 'ADMIN', NULL, NULL, 63),
(963, 'Peñitas Arriba', 50136, '2021-06-03 21:45:00', 'ADMIN', NULL, NULL, 63),
(964, 'Pera', 50137, '2021-06-03 21:45:10', 'ADMIN', NULL, NULL, 63),
(965, 'Sabana de Jucutuma', 50138, '2021-06-03 21:45:21', 'ADMIN', NULL, NULL, 63),
(966, 'San Antonio de Las Palmas', 50139, '2021-06-03 21:45:36', 'ADMIN', NULL, NULL, 63),
(967, 'San Antonio del Perú o El Carmen', 50140, '2021-06-03 21:45:55', 'ADMIN', NULL, NULL, 63),
(968, 'San Cristóbal', 50141, '2021-06-03 21:46:15', 'ADMIN', NULL, NULL, 63),
(969, 'San José de Cortes', 50142, '2021-06-03 21:46:33', 'ADMIN', NULL, NULL, 63),
(970, 'San José del Boquerón', 50143, '2021-06-03 21:46:56', 'ADMIN', NULL, NULL, 63),
(972, 'San José de Manchaguala', 50144, '2021-06-03 21:47:46', 'ADMIN', NULL, NULL, 63),
(973, 'San Lorenzo', 50145, '2021-06-03 21:47:59', 'ADMIN', NULL, NULL, 63),
(974, 'San Martín', 50146, '2021-06-03 21:48:10', 'ADMIN', NULL, NULL, 63),
(975, 'Santa Ana', 50147, '2021-06-03 21:48:27', 'ADMIN', NULL, NULL, 63),
(976, 'Santa Elena', 50148, '2021-06-03 21:48:37', 'ADMIN', NULL, NULL, 63),
(977, 'Santa Lucía', 50149, '2021-06-03 21:48:44', 'ADMIN', NULL, NULL, 63),
(978, 'Santa Margarita o Guanales', 50150, '2021-06-03 21:48:57', 'ADMIN', NULL, NULL, 63),
(979, 'Santa Marta', 50151, '2021-06-03 21:49:08', 'ADMIN', NULL, NULL, 63),
(980, 'Santa Teresa de Bañaderos', 50152, '2021-06-03 21:49:18', 'ADMIN', NULL, NULL, 63),
(981, 'Tomai', 50153, '2021-06-03 21:49:42', 'ADMIN', NULL, NULL, 63),
(982, 'Zapotal del Norte', 50154, '2021-06-03 21:49:52', 'ADMIN', NULL, NULL, 63),
(983, 'Choloma', 50201, '2021-06-03 21:50:36', 'ADMIN', NULL, NULL, 64),
(984, 'Banderas', 50202, '2021-06-03 22:10:37', 'ADMIN', NULL, NULL, 64),
(985, 'Buenos Aires de California', 50203, '2021-06-03 22:10:53', 'ADMIN', NULL, NULL, 64),
(986, 'El Barreal N.1', 50204, '2021-06-03 22:11:07', 'ADMIN', NULL, NULL, 64),
(987, 'El Chorrerón', 50205, '2021-06-03 22:11:21', 'ADMIN', NULL, NULL, 64),
(988, 'El Guanacaste', 50206, '2021-06-03 22:11:31', 'ADMIN', NULL, NULL, 64),
(989, 'El Higuero', 50207, '2021-06-03 22:11:40', 'ADMIN', NULL, NULL, 64),
(990, 'El Ocotillo Occidental', 50208, '2021-06-03 22:11:54', 'ADMIN', NULL, NULL, 64),
(991, 'El Planchón de Lupo Viejo', 50209, '2021-06-03 22:12:10', 'ADMIN', NULL, NULL, 64),
(992, 'El Portillo N.1', 50210, '2021-06-03 22:12:23', 'ADMIN', NULL, NULL, 64),
(993, 'El Rancho', 50211, '2021-06-03 22:12:33', 'ADMIN', NULL, NULL, 64),
(994, 'El Tamarindo', 50212, '2021-06-03 22:12:42', 'ADMIN', NULL, NULL, 64),
(995, 'Finca Tibombo', 50213, '2021-06-03 22:12:54', 'ADMIN', NULL, NULL, 64),
(996, 'La Bueso', 50214, '2021-06-03 22:13:14', 'ADMIN', NULL, NULL, 64),
(997, 'La Ceibita', 50215, '2021-06-03 22:13:22', 'ADMIN', NULL, NULL, 64),
(998, 'La Danta N.1', 50216, '2021-06-03 22:13:33', 'ADMIN', NULL, NULL, 64),
(999, 'La Davis', 50217, '2021-06-03 22:13:45', 'ADMIN', NULL, NULL, 64),
(1000, 'La Funez', 50218, '2021-06-03 22:13:58', 'ADMIN', NULL, NULL, 64),
(1001, 'La Gálvez', 50219, '2021-06-03 22:14:08', 'ADMIN', NULL, NULL, 64),
(1002, 'La Hicaca o San Isidro', 50220, '2021-06-03 22:14:26', 'ADMIN', NULL, NULL, 64),
(1003, 'La Jutosa', 50221, '2021-06-03 22:14:38', 'ADMIN', NULL, NULL, 64),
(1004, 'La Lechuga N.1', 50222, '2021-06-03 22:14:49', 'ADMIN', NULL, NULL, 64),
(1005, 'La Protección', 50223, '2021-06-03 22:15:02', 'ADMIN', NULL, NULL, 64),
(1006, 'Las Delicias', 50224, '2021-06-03 22:15:24', 'ADMIN', NULL, NULL, 64),
(1007, 'Las Flores', 50225, '2021-06-03 22:15:34', 'ADMIN', NULL, NULL, 64),
(1008, 'Los Caraos', 50226, '2021-06-03 22:15:45', 'ADMIN', NULL, NULL, 64),
(1009, 'Los Planes', 50227, '2021-06-03 22:15:56', 'ADMIN', NULL, NULL, 64),
(1010, 'Montañuela', 50228, '2021-06-03 22:16:05', 'ADMIN', NULL, NULL, 64),
(1011, 'Monterrey', 50229, '2021-06-03 22:16:15', 'ADMIN', NULL, NULL, 64),
(1012, 'Poza del Riel', 50231, '2021-06-03 22:16:38', 'ADMIN', NULL, NULL, 64),
(1013, 'Quebrada Seca', 50232, '2021-06-03 22:16:50', 'ADMIN', NULL, NULL, 64),
(1014, 'Rio Arriba', 50233, '2021-06-03 22:17:01', 'ADMIN', NULL, NULL, 64),
(1015, 'Rio Abajo', 50234, '2021-06-03 22:17:07', 'ADMIN', NULL, NULL, 64),
(1016, 'Rio Blanquito', 50235, '2021-06-03 22:17:29', 'ADMIN', NULL, NULL, 64),
(1017, 'San José de Los Laureles', 50236, '2021-06-03 22:17:48', 'ADMIN', NULL, NULL, 64),
(1018, 'San Marcos de Majaine', 50237, '2021-06-03 22:18:04', 'ADMIN', NULL, NULL, 64),
(1019, 'Santa Marta', 50238, '2021-06-03 22:18:21', 'ADMIN', NULL, NULL, 64),
(1020, 'Ticamaya', 50239, '2021-06-03 22:18:32', 'ADMIN', NULL, NULL, 64),
(1021, 'Victoria de Cristales', 50240, '2021-06-03 22:18:44', 'ADMIN', NULL, NULL, 64),
(1022, 'Waler Adentro', 50241, '2021-06-03 22:19:04', 'ADMIN', NULL, NULL, 64),
(1023, 'Waler Bordo', 50242, '2021-06-03 22:19:11', 'ADMIN', NULL, NULL, 64),
(1024, 'Omoa', 50301, '2021-06-03 22:19:32', 'ADMIN', NULL, NULL, 65),
(1025, 'Barbas Cheles', 50302, '2021-06-03 22:19:57', 'ADMIN', NULL, NULL, 65),
(1026, 'Barra de Cuyamel', 50303, '2021-06-03 22:20:10', 'ADMIN', NULL, NULL, 65),
(1027, 'Barra del Motagua', 50304, '2021-06-03 22:20:21', 'ADMIN', NULL, NULL, 65),
(1028, 'Corinto', 50305, '2021-06-03 22:20:30', 'ADMIN', NULL, NULL, 65),
(1029, 'Cortesito', 50306, '2021-06-03 22:20:43', 'ADMIN', NULL, NULL, 65),
(1030, 'Cuyamel', 50307, '2021-06-03 22:20:51', 'ADMIN', NULL, NULL, 65),
(1031, 'Cuyamelito', 50308, '2021-06-03 22:21:00', 'ADMIN', NULL, NULL, 65),
(1032, 'Chachaguala o Colonia Tegucigalpa', 50309, '2021-06-03 22:21:15', 'ADMIN', NULL, NULL, 65),
(1033, 'Chivana', 50310, '2021-06-03 22:21:26', 'ADMIN', NULL, NULL, 65),
(1034, 'El Paraiso', 50311, '2021-06-03 22:21:36', 'ADMIN', NULL, NULL, 65),
(1035, 'La Camisa', 50312, '2021-06-03 22:21:45', 'ADMIN', NULL, NULL, 65),
(1038, 'Los Laures', 50313, '2021-06-03 22:25:48', 'ADMIN', NULL, NULL, 65),
(1039, 'Masca', 50314, '2021-06-03 22:26:01', 'ADMIN', NULL, NULL, 65),
(1040, 'Milla Tres', 50315, '2021-06-03 22:26:15', 'ADMIN', NULL, NULL, 65),
(1041, 'Muchilena', 50316, '2021-06-03 22:26:26', 'ADMIN', NULL, NULL, 65),
(1042, 'Nuevo Tulián', 50317, '2021-06-03 22:26:38', 'ADMIN', NULL, NULL, 65),
(1043, 'Potrerillos', 50318, '2021-06-03 22:26:59', 'ADMIN', NULL, NULL, 65),
(1044, 'Pueblo Nuevo', 50319, '2021-06-03 22:27:10', 'ADMIN', NULL, NULL, 65),
(1045, 'Rio Coto', 50320, '2021-06-03 22:27:23', 'ADMIN', NULL, NULL, 65),
(1046, 'Rio Chiquito', 50321, '2021-06-03 22:27:34', 'ADMIN', NULL, NULL, 65),
(1047, 'San Carlos', 50323, '2021-06-03 22:27:44', 'ADMIN', NULL, NULL, 65),
(1048, 'San José de Jalisco', 50324, '2021-06-03 22:28:24', 'ADMIN', NULL, NULL, 65),
(1049, 'Suyapa o Garcia', 50325, '2021-06-03 22:28:35', 'ADMIN', NULL, NULL, 65),
(1050, 'Tulián Campo', 50326, '2021-06-03 22:28:48', 'ADMIN', NULL, NULL, 65),
(1051, 'Tegucigalpa', 50327, '2021-06-03 22:29:08', 'ADMIN', NULL, NULL, 65),
(1052, 'Veracruz', 50328, '2021-06-03 22:29:20', 'ADMIN', NULL, NULL, 65),
(1053, 'Pimienta', 50401, '2021-06-03 22:29:45', 'ADMIN', NULL, NULL, 66),
(1054, 'Santiago', 50402, '2021-06-03 22:30:02', 'ADMIN', NULL, NULL, 66),
(1055, 'Potrerillos', 50501, '2021-06-03 22:30:34', 'ADMIN', NULL, NULL, 67),
(1056, 'Bejuco', 50502, '2021-06-03 22:30:43', 'ADMIN', NULL, NULL, 67),
(1057, 'Blanco Caserio', 50503, '2021-06-03 22:30:51', 'ADMIN', NULL, NULL, 67),
(1058, 'El Caracol', 50504, '2021-06-03 22:31:03', 'ADMIN', NULL, NULL, 67),
(1059, 'EL Manacal', 50505, '2021-06-03 22:31:15', 'ADMIN', NULL, NULL, 67),
(1060, 'Higuerito Central', 50506, '2021-06-03 22:31:35', 'ADMIN', NULL, NULL, 67),
(1061, 'La Garroba', 50507, '2021-06-03 22:31:48', 'ADMIN', NULL, NULL, 67),
(1062, 'San Miguel', 50508, '2021-06-03 22:32:00', 'ADMIN', NULL, NULL, 67),
(1063, 'Puerto Cortés', 50601, '2021-06-03 22:32:26', 'ADMIN', NULL, NULL, 68),
(1064, 'Agua Caliente', 50602, '2021-06-03 22:32:40', 'ADMIN', NULL, NULL, 68),
(1065, 'Bajamar', 50603, '2021-06-03 22:32:51', 'ADMIN', NULL, NULL, 68),
(1066, 'Baracoa', 50604, '2021-06-03 22:32:59', 'ADMIN', NULL, NULL, 68),
(1067, 'Barra de Chamelecón', 50605, '2021-06-03 22:33:11', 'ADMIN', NULL, NULL, 68),
(1068, 'Bullichampa', 50606, '2021-06-03 22:33:27', 'ADMIN', NULL, NULL, 68),
(1069, 'Calán', 50607, '2021-06-03 22:33:35', 'ADMIN', NULL, NULL, 68),
(1070, 'Cedros', 50608, '2021-06-03 22:33:44', 'ADMIN', NULL, NULL, 68),
(1071, 'Colonia Gracias a Dios', 50609, '2021-06-03 22:33:58', 'ADMIN', NULL, NULL, 68),
(1072, 'Concordia', 50610, '2021-06-03 22:34:10', 'ADMIN', NULL, NULL, 68),
(1073, 'Chameleconcito', 50611, '2021-06-03 22:34:20', 'ADMIN', NULL, NULL, 68),
(1074, 'El Bálsamos', 50612, '2021-06-03 22:34:34', 'ADMIN', NULL, NULL, 68),
(1075, 'El Bun', 50613, '2021-06-03 22:34:52', 'ADMIN', NULL, NULL, 68),
(1076, 'El Chile', 50614, '2021-06-03 22:35:02', 'ADMIN', NULL, NULL, 68),
(1077, 'El Nispero', 50615, '2021-06-03 22:35:27', 'ADMIN', NULL, NULL, 68),
(1078, 'El Seis', 50616, '2021-06-03 22:35:36', 'ADMIN', NULL, NULL, 68),
(1079, 'Guanacastales', 50617, '2021-06-03 22:35:48', 'ADMIN', NULL, NULL, 68),
(1080, 'Kele Kele', 50618, '2021-06-03 22:36:01', 'ADMIN', NULL, NULL, 68),
(1081, 'La Campana', 50619, '2021-06-03 22:36:13', 'ADMIN', NULL, NULL, 68),
(1082, 'La Caoba', 50620, '2021-06-03 22:36:22', 'ADMIN', NULL, NULL, 68),
(1083, 'La Junta', 50621, '2021-06-03 22:36:32', 'ADMIN', NULL, NULL, 68),
(1084, 'La Pita', 50622, '2021-06-03 22:36:38', 'ADMIN', NULL, NULL, 68),
(1085, 'La Sabana', 50623, '2021-06-03 22:36:46', 'ADMIN', NULL, NULL, 68),
(1086, 'Las Delicias', 50624, '2021-06-03 22:36:56', 'ADMIN', NULL, NULL, 68),
(1087, 'Manacalito', 50625, '2021-06-03 22:37:09', 'ADMIN', NULL, NULL, 68),
(1088, 'Medina Abajo', 50626, '2021-06-03 22:37:25', 'ADMIN', NULL, NULL, 68),
(1089, 'Nisperales', 50627, '2021-06-03 22:37:37', 'ADMIN', NULL, NULL, 68),
(1090, 'Nola', 50628, '2021-06-03 22:37:46', 'ADMIN', NULL, NULL, 68),
(1091, 'Paleto', 50629, '2021-06-03 22:38:05', 'ADMIN', NULL, NULL, 68),
(1092, 'Puente Alto', 50630, '2021-06-03 22:38:15', 'ADMIN', NULL, NULL, 68),
(1093, 'Puente Baracoa', 50631, '2021-06-03 22:38:26', 'ADMIN', NULL, NULL, 68),
(1094, 'Rio Arriba', 50632, '2021-06-03 22:38:37', 'ADMIN', NULL, NULL, 68),
(1095, 'Robles', 50633, '2021-06-03 22:39:10', 'ADMIN', NULL, NULL, 68),
(1096, 'Santa Inés', 50634, '2021-06-03 22:39:35', 'ADMIN', NULL, NULL, 68),
(1097, 'Saraguayna', 50635, '2021-06-03 22:39:47', 'ADMIN', NULL, NULL, 68),
(1098, 'Sauce', 50636, '2021-06-03 22:39:55', 'ADMIN', NULL, NULL, 68),
(1099, 'Ticayama', 50637, '2021-06-03 22:40:03', 'ADMIN', NULL, NULL, 68),
(1100, 'Travesia', 50638, '2021-06-03 22:40:12', 'ADMIN', NULL, NULL, 68),
(1101, 'San Antonio de Cortés', 50701, '2021-06-03 22:41:16', 'ADMIN', NULL, NULL, 69),
(1102, 'Buenos Aires', 50702, '2021-06-03 22:41:33', 'ADMIN', NULL, NULL, 69),
(1103, 'El Aguacate', 50703, '2021-06-03 22:41:48', 'ADMIN', NULL, NULL, 69),
(1104, 'El Encanto', 50704, '2021-06-03 22:42:00', 'ADMIN', NULL, NULL, 69),
(1105, 'El Pichacho', 50705, '2021-06-03 22:42:09', 'ADMIN', NULL, NULL, 69),
(1106, 'El Sitio', 50706, '2021-06-03 22:42:21', 'ADMIN', NULL, NULL, 69),
(1107, 'La Calera o Buena Vista', 50707, '2021-06-03 22:42:39', 'ADMIN', NULL, NULL, 69),
(1108, 'La Ceibita', 50708, '2021-06-03 22:42:50', 'ADMIN', NULL, NULL, 69),
(1109, 'La Chachona o El Paraiso', 50709, '2021-06-03 22:43:04', 'ADMIN', NULL, NULL, 69),
(1110, 'La Masica', 50710, '2021-06-03 22:43:16', 'ADMIN', NULL, NULL, 69),
(1111, 'La Providencia', 50711, '2021-06-03 22:43:31', 'ADMIN', NULL, NULL, 69),
(1112, 'Las Colmenas', 50713, '2021-06-03 22:43:49', 'ADMIN', NULL, NULL, 69),
(1113, 'Las Crucitas', 50714, '2021-06-03 22:43:56', 'ADMIN', NULL, NULL, 69),
(1114, 'Las Margaritas', 50715, '2021-06-03 22:44:11', 'ADMIN', NULL, NULL, 69),
(1115, 'Las Palomas', 50716, '2021-06-03 22:44:21', 'ADMIN', NULL, NULL, 69),
(1116, 'Loma Larga', 50717, '2021-06-03 22:44:30', 'ADMIN', NULL, NULL, 69),
(1117, 'Nueva Granada', 50718, '2021-06-03 22:44:42', 'ADMIN', NULL, NULL, 69),
(1118, 'Quebrada Seca', 50719, '2021-06-03 22:44:54', 'ADMIN', NULL, NULL, 69),
(1119, 'San José de Cortés o Condoncillos', 50720, '2021-06-03 22:45:16', 'ADMIN', NULL, NULL, 69),
(1120, 'San Luis', 50721, '2021-06-03 22:45:28', 'ADMIN', NULL, NULL, 69),
(1121, 'Santa Rita', 50722, '2021-06-03 22:45:36', 'ADMIN', NULL, NULL, 69),
(1122, 'Vallecito', 50723, '2021-06-03 22:45:47', 'ADMIN', NULL, NULL, 69),
(1123, 'San Francisco de Yojoa', 50801, '2021-06-03 22:46:25', 'ADMIN', NULL, NULL, 70),
(1124, 'Cañaveral', 500802, '2021-06-03 22:46:59', 'ADMIN', NULL, NULL, 70),
(1125, 'La Virtud', 50603, '2021-06-03 22:52:13', 'ADMIN', NULL, NULL, 70),
(1126, 'Las Hules', 50604, '2021-06-03 22:52:23', 'ADMIN', NULL, NULL, 70),
(1127, 'Pedernales', 50605, '2021-06-03 22:52:36', 'ADMIN', NULL, NULL, 70),
(1128, 'Quebrada de Agua', 50606, '2021-06-03 22:52:47', 'ADMIN', NULL, NULL, 70),
(1129, 'Rio Lindo', 50607, '2021-06-03 22:52:58', 'ADMIN', NULL, NULL, 70),
(1130, 'San Buena Aventura', 50608, '2021-06-03 22:53:14', 'ADMIN', NULL, NULL, 70),
(1131, 'Tapiquilares', 50609, '2021-06-03 22:53:31', 'ADMIN', NULL, NULL, 70),
(1132, 'San Manuel', 50901, '2021-06-03 22:54:01', 'ADMIN', NULL, NULL, 71),
(1133, 'Campo Casenave', 50902, '2021-06-03 22:54:25', 'ADMIN', NULL, NULL, 71),
(1134, 'Col. La Democracia', 50903, '2021-06-03 22:54:40', 'ADMIN', NULL, NULL, 71),
(1135, 'Col. La Guadalupe', 50904, '2021-06-03 22:55:06', 'ADMIN', NULL, NULL, 71),
(1136, 'Col. Pineda', 50905, '2021-06-03 22:55:19', 'ADMIN', NULL, NULL, 71),
(1137, 'Coulee', 50906, '2021-06-03 22:55:29', 'ADMIN', NULL, NULL, 71),
(1138, 'El Plan', 50907, '2021-06-03 22:55:37', 'ADMIN', NULL, NULL, 71),
(1139, 'El Porvenir', 50908, '2021-06-03 22:56:03', 'ADMIN', NULL, NULL, 71),
(1140, 'La Libertad o Las Lomas', 50909, '2021-06-03 22:56:18', 'ADMIN', NULL, NULL, 71),
(1141, 'La Sabana', 50910, '2021-06-03 22:56:50', 'ADMIN', NULL, NULL, 71),
(1142, 'Omonita', 50911, '2021-06-03 22:56:58', 'ADMIN', NULL, NULL, 71),
(1143, 'Omonita', 50911, '2021-06-03 22:57:12', 'ADMIN', NULL, NULL, 71),
(1144, 'Santa Cruz de Yojoa', 51001, '2021-06-03 22:57:36', 'ADMIN', NULL, NULL, 72),
(1145, 'Achiotal', 51002, '2021-06-03 22:58:10', 'ADMIN', NULL, NULL, 72),
(1146, 'Agua Azul Rancho', 51003, '2021-06-03 22:58:21', 'ADMIN', NULL, NULL, 72),
(1147, 'Agua Azul Sierra', 51004, '2021-06-03 22:58:30', 'ADMIN', NULL, NULL, 72),
(1148, 'Buena Vista', 51005, '2021-06-03 22:58:42', 'ADMIN', NULL, NULL, 72),
(1149, 'Campo Olivo', 51006, '2021-06-03 22:58:56', 'ADMIN', NULL, NULL, 72),
(1150, 'Casas Viejas', 51007, '2021-06-03 22:59:07', 'ADMIN', NULL, NULL, 72),
(1151, 'Concepción', 51009, '2021-06-03 22:59:25', 'ADMIN', NULL, NULL, 72),
(1152, 'Cordoncillo', 51010, '2021-06-03 22:59:43', 'ADMIN', NULL, NULL, 72),
(1153, 'El Cacao', 51011, '2021-06-03 22:59:52', 'ADMIN', NULL, NULL, 72),
(1154, 'El Changuitón', 51012, '2021-06-03 23:00:03', 'ADMIN', NULL, NULL, 72),
(1155, 'El Edén', 51013, '2021-06-03 23:00:13', 'ADMIN', NULL, NULL, 72),
(1156, 'El Jaral', 51014, '2021-06-03 23:00:26', 'ADMIN', NULL, NULL, 72),
(1157, 'El Liano', 51015, '2021-06-03 23:08:32', 'ADMIN', NULL, NULL, 72),
(1158, 'El Olivar', 51016, '2021-06-03 23:10:07', 'ADMIN', NULL, NULL, 72),
(1159, 'El Plan Grande', 51017, '2021-06-03 23:10:26', 'ADMIN', NULL, NULL, 72),
(1160, 'El Tigre', 51018, '2021-06-03 23:10:35', 'ADMIN', NULL, NULL, 72),
(1161, 'El Zapote', 51019, '2021-06-03 23:10:44', 'ADMIN', NULL, NULL, 72),
(1162, 'La Barca', 51020, '2021-06-03 23:10:59', 'ADMIN', NULL, NULL, 72),
(1163, 'La Ceibita', 51021, '2021-06-03 23:11:09', 'ADMIN', NULL, NULL, 72),
(1164, 'La Danta', 51022, '2021-06-03 23:11:19', 'ADMIN', NULL, NULL, 72),
(1165, 'La Estribana', 51023, '2021-06-03 23:11:34', 'ADMIN', NULL, NULL, 72),
(1166, 'La Guama', 51024, '2021-06-03 23:12:14', 'ADMIN', NULL, NULL, 72),
(1167, 'La Jutosa', 51025, '2021-06-03 23:12:23', 'ADMIN', NULL, NULL, 72),
(1168, 'La Laguna', 51026, '2021-06-03 23:12:32', 'ADMIN', NULL, NULL, 72),
(1169, 'La Quesera o El Paraiso', 51027, '2021-06-03 23:12:51', 'ADMIN', NULL, NULL, 72),
(1170, 'Las Cañas', 51028, '2021-06-03 23:13:01', 'ADMIN', NULL, NULL, 72),
(1171, 'Las Delicias', 51029, '2021-06-03 23:13:12', 'ADMIN', NULL, NULL, 72),
(1172, 'Las Marias', 51030, '2021-06-03 23:13:21', 'ADMIN', NULL, NULL, 72),
(1173, 'Los Caminos', 51031, '2021-06-03 23:13:33', 'ADMIN', NULL, NULL, 72),
(1174, 'Los Mangos', 51033, '2021-06-03 23:13:50', 'ADMIN', NULL, NULL, 72),
(1175, 'Los Naranjos', 51034, '2021-06-03 23:13:59', 'ADMIN', NULL, NULL, 72),
(1176, 'Montaña de la Reina', 51035, '2021-06-03 23:14:12', 'ADMIN', NULL, NULL, 72),
(1177, 'Monte Verde', 51036, '2021-06-03 23:14:24', 'ADMIN', NULL, NULL, 72),
(1178, 'Nueva Esperanza', 51037, '2021-06-03 23:14:34', 'ADMIN', NULL, NULL, 72),
(1179, 'Oropéndolas', 51038, '2021-06-03 23:14:54', 'ADMIN', NULL, NULL, 72),
(1180, 'Peña Blanca', 51039, '2021-06-03 23:15:05', 'ADMIN', NULL, NULL, 72),
(1181, 'Pinolapa', 51040, '2021-06-03 23:15:15', 'ADMIN', NULL, NULL, 72),
(1182, 'Pueblo Quemado', 51041, '2021-06-03 23:15:24', 'ADMIN', NULL, NULL, 72),
(1183, 'San Antonio', 51042, '2021-06-03 23:15:35', 'ADMIN', NULL, NULL, 72),
(1184, 'San Isidro', 51043, '2021-06-03 23:15:48', 'ADMIN', NULL, NULL, 72),
(1185, 'San José de Balincito', 51044, '2021-06-03 23:16:04', 'ADMIN', NULL, NULL, 72),
(1186, 'San Luis de Zacatales', 51045, '2021-06-03 23:16:19', 'ADMIN', NULL, NULL, 72),
(1187, 'Santa Elena', 51046, '2021-06-03 23:16:29', 'ADMIN', NULL, NULL, 72),
(1188, 'Terreritos de la Libertad', 51047, '2021-06-03 23:16:43', 'ADMIN', NULL, NULL, 72),
(1189, 'Victoria', 51048, '2021-06-03 23:16:54', 'ADMIN', NULL, NULL, 72),
(1190, 'Yojoa', 51049, '2021-06-03 23:17:02', 'ADMIN', NULL, NULL, 72),
(1191, 'Villanueva', 51101, '2021-06-03 23:20:45', 'ADMIN', NULL, NULL, 73),
(1192, 'Buenos Aires', 51102, '2021-06-03 23:20:56', 'ADMIN', NULL, NULL, 73),
(1193, 'Calán', 51103, '2021-06-03 23:21:04', 'ADMIN', NULL, NULL, 73),
(1194, 'Campo Dos Caminos', 51104, '2021-06-03 23:21:14', 'ADMIN', NULL, NULL, 73),
(1195, 'El Cubano', 51105, '2021-06-03 23:21:24', 'ADMIN', NULL, NULL, 73),
(1196, 'El Marañón', 51106, '2021-06-03 23:21:37', 'ADMIN', NULL, NULL, 73),
(1197, 'El Milagro', 51107, '2021-06-03 23:21:47', 'ADMIN', NULL, NULL, 73),
(1198, 'El Sauce', 51108, '2021-06-03 23:21:56', 'ADMIN', NULL, NULL, 73),
(1199, 'Guaruma Dos', 51109, '2021-06-03 23:22:17', 'ADMIN', NULL, NULL, 73),
(1200, 'La Bolsa', 51110, '2021-06-03 23:22:30', 'ADMIN', NULL, NULL, 73),
(1201, 'La Cebadilla', 51111, '2021-06-03 23:22:36', 'ADMIN', NULL, NULL, 73),
(1202, 'La Coroza', 51112, '2021-06-03 23:22:46', 'ADMIN', NULL, NULL, 73),
(1203, 'La Esperanza o El Venado', 51113, '2021-06-03 23:22:58', 'ADMIN', NULL, NULL, 73),
(1204, 'Las Cañadas', 51114, '2021-06-03 23:23:19', 'ADMIN', NULL, NULL, 73),
(1205, 'Nuevo Chamelecón', 51115, '2021-06-03 23:24:00', 'ADMIN', NULL, NULL, 73),
(1206, 'Palos Blancos', 51116, '2021-06-03 23:24:10', 'ADMIN', NULL, NULL, 73),
(1207, 'Pueblo Nuevo', 51117, '2021-06-03 23:24:23', 'ADMIN', NULL, NULL, 73),
(1208, 'San Francisco o El Coyolón', 51118, '2021-06-03 23:24:47', 'ADMIN', NULL, NULL, 73),
(1209, 'San Isidro', 51119, '2021-06-03 23:24:58', 'ADMIN', NULL, NULL, 73),
(1210, 'Santa Anda de Chanigua', 51120, '2021-06-03 23:25:11', 'ADMIN', NULL, NULL, 73),
(1211, 'La Lima', 51201, '2021-06-03 23:25:39', 'ADMIN', NULL, NULL, 74),
(1212, 'Cruz de Valencia', 51202, '2021-06-03 23:25:50', 'ADMIN', NULL, NULL, 74),
(1213, 'El Paraiso', 51203, '2021-06-03 23:26:00', 'ADMIN', NULL, NULL, 74),
(1214, 'Flor de Oriente', 51204, '2021-06-03 23:26:16', 'ADMIN', NULL, NULL, 74),
(1215, 'Choluteca', 60101, '2021-06-07 19:51:23', 'ADMIN', NULL, NULL, 75),
(1216, 'Agua Caliente de Linaca', 60102, '2021-06-07 19:51:36', 'ADMIN', NULL, NULL, 75),
(1217, 'Copal Abajo', 60103, '2021-06-07 19:51:51', 'ADMIN', NULL, NULL, 75),
(1218, 'Copal Arriba', 60104, '2021-06-07 19:52:03', 'ADMIN', NULL, NULL, 75),
(1219, 'El Apintal', 60105, '2021-06-07 19:52:16', 'ADMIN', NULL, NULL, 75),
(1220, 'El Carrizo', 60106, '2021-06-07 19:52:25', 'ADMIN', NULL, NULL, 75),
(1221, 'El Palenque', 60107, '2021-06-07 19:52:33', 'ADMIN', NULL, NULL, 75),
(1222, 'El Pillado', 60108, '2021-06-07 19:53:33', 'ADMIN', NULL, NULL, 75),
(1223, 'El Terreno Blanco', 60110, '2021-06-07 19:54:42', 'ADMIN', NULL, NULL, 75),
(1224, 'El Trapiche', 60111, '2021-06-07 19:54:53', 'ADMIN', NULL, NULL, 75),
(1225, 'Fray Lázaro', 60112, '2021-06-07 19:55:10', 'ADMIN', NULL, NULL, 75),
(1226, 'Hato Nuevo', 60113, '2021-06-07 19:55:25', 'ADMIN', NULL, NULL, 75),
(1227, 'La Castaña', 60114, '2021-06-07 19:55:36', 'ADMIN', NULL, NULL, 75),
(1228, 'La Picola', 60115, '2021-06-07 19:57:08', 'ADMIN', NULL, NULL, 75),
(1229, 'Linaca', 60116, '2021-06-07 19:57:20', 'ADMIN', NULL, NULL, 75),
(1230, 'Madrial', 60117, '2021-06-07 19:57:31', 'ADMIN', NULL, NULL, 75),
(1231, 'Pavana', 60118, '2021-06-07 19:57:39', 'ADMIN', NULL, NULL, 75),
(1232, 'San José de Landa', 60119, '2021-06-07 19:57:52', 'ADMIN', NULL, NULL, 75),
(1233, 'San Martín', 60120, '2021-06-07 19:58:07', 'ADMIN', NULL, NULL, 75),
(1234, 'San Rafael', 60121, '2021-06-07 19:58:17', 'ADMIN', NULL, NULL, 75),
(1235, 'San Ramón Abajo', 60122, '2021-06-07 19:58:29', 'ADMIN', NULL, NULL, 75),
(1236, 'San Ramón Arriba', 60123, '2021-06-07 19:58:39', 'ADMIN', NULL, NULL, 75),
(1237, 'Santa Rosa de Sampite', 60124, '2021-06-07 19:58:55', 'ADMIN', NULL, NULL, 75),
(1238, 'Tapaire', 60125, '2021-06-07 19:59:05', 'ADMIN', NULL, NULL, 75),
(1239, 'Tapatoca', 60126, '2021-06-07 19:59:14', 'ADMIN', NULL, NULL, 75),
(1240, 'Apacilagua', 60201, '2021-06-07 19:59:49', 'ADMIN', NULL, NULL, 76),
(1241, 'La Albarrada', 60202, '2021-06-07 20:00:05', 'ADMIN', NULL, NULL, 76),
(1242, 'La Garza', 60203, '2021-06-07 20:00:11', 'ADMIN', NULL, NULL, 76),
(1243, 'Los Limones', 60204, '2021-06-07 20:00:24', 'ADMIN', NULL, NULL, 76),
(1244, 'Los Mezcales', 60205, '2021-06-07 20:00:32', 'ADMIN', NULL, NULL, 76),
(1245, 'Monte Grande', 60206, '2021-06-07 20:00:41', 'ADMIN', NULL, NULL, 76),
(1246, 'San Felipe', 60207, '2021-06-07 20:00:54', 'ADMIN', NULL, NULL, 76),
(1247, 'Somuina', 60208, '2021-06-07 20:01:06', 'ADMIN', NULL, NULL, 76),
(1248, 'Concepción de Maria', 60301, '2021-06-07 20:01:45', 'ADMIN', NULL, NULL, 77),
(1249, 'Cerro Colorado', 60302, '2021-06-07 20:01:55', 'ADMIN', NULL, NULL, 77),
(1250, 'El Aguacatal', 60303, '2021-06-07 20:02:07', 'ADMIN', NULL, NULL, 77),
(1251, 'El Cacao', 60304, '2021-06-07 20:02:21', 'ADMIN', NULL, NULL, 77),
(1252, 'El Cerrón', 60305, '2021-06-07 20:02:30', 'ADMIN', NULL, NULL, 77),
(1253, 'El Jicarillo', 60306, '2021-06-07 20:02:42', 'ADMIN', NULL, NULL, 77),
(1254, 'El Pacón', 60307, '2021-06-07 20:02:52', 'ADMIN', NULL, NULL, 77),
(1255, 'El Palito', 60308, '2021-06-07 20:03:08', 'ADMIN', NULL, NULL, 77),
(1256, 'El Papalón', 60309, '2021-06-07 20:03:15', 'ADMIN', NULL, NULL, 77),
(1257, 'El Peñón', 60310, '2021-06-07 20:03:26', 'ADMIN', NULL, NULL, 77),
(1258, 'El Potrerillo', 60311, '2021-06-07 20:03:36', 'ADMIN', NULL, NULL, 77),
(1259, 'El Sunzapote', 60312, '2021-06-07 20:03:45', 'ADMIN', NULL, NULL, 77),
(1260, 'El Tejar', 60313, '2021-06-07 20:03:53', 'ADMIN', NULL, NULL, 77),
(1261, 'El Terrero', 60314, '2021-06-07 20:04:03', 'ADMIN', NULL, NULL, 77),
(1262, 'Guanacaste', 60315, '2021-06-07 20:04:14', 'ADMIN', NULL, NULL, 77),
(1263, 'La Guaruma', 60316, '2021-06-07 20:04:30', 'ADMIN', NULL, NULL, 77),
(1264, 'La Joya', 60317, '2021-06-07 20:04:39', 'ADMIN', NULL, NULL, 77),
(1265, 'La Majada', 60318, '2021-06-07 20:04:49', 'ADMIN', NULL, NULL, 77),
(1266, 'La Montaña', 60319, '2021-06-07 20:04:57', 'ADMIN', NULL, NULL, 77),
(1267, 'La Pabellona', 60320, '2021-06-07 20:05:07', 'ADMIN', NULL, NULL, 77),
(1268, 'La Plomosa N.2', 60321, '2021-06-07 20:05:20', 'ADMIN', NULL, NULL, 77),
(1270, 'La Veta', 60322, '2021-06-07 20:06:00', 'ADMIN', NULL, NULL, 77),
(1271, 'Las Chapernas', 60323, '2021-06-07 20:06:14', 'ADMIN', NULL, NULL, 77),
(1272, 'Las Mesas', 60324, '2021-06-07 20:06:31', 'ADMIN', NULL, NULL, 77),
(1273, 'Las Pintadas', 60325, '2021-06-07 20:06:39', 'ADMIN', NULL, NULL, 77),
(1274, 'Los Espaveles', 60326, '2021-06-07 20:06:57', 'ADMIN', NULL, NULL, 77),
(1275, 'Los Llanitos', 60327, '2021-06-07 20:07:07', 'ADMIN', NULL, NULL, 77),
(1276, 'Los Matapalos', 60328, '2021-06-07 20:07:18', 'ADMIN', NULL, NULL, 77),
(1277, 'Nance Dulce', 60329, '2021-06-07 20:07:33', 'ADMIN', NULL, NULL, 77),
(1278, 'Palo Solo', 60330, '2021-06-07 20:07:44', 'ADMIN', NULL, NULL, 77),
(1279, 'Santa Rosa', 60331, '2021-06-07 20:07:56', 'ADMIN', NULL, NULL, 77),
(1280, 'Santa Benito Nuevo', 60332, '2021-06-07 20:08:04', 'ADMIN', NULL, NULL, 77),
(1281, 'Santa Benito Viejo', 60333, '2021-06-07 20:08:11', 'ADMIN', NULL, NULL, 77),
(1282, 'Duyure', 60401, '2021-06-07 20:08:42', 'ADMIN', NULL, NULL, 78),
(1283, 'Arado Grande', 60402, '2021-06-07 20:09:03', 'ADMIN', NULL, NULL, 78),
(1284, 'El Carrizal Prieto', 60403, '2021-06-07 20:09:13', 'ADMIN', NULL, NULL, 78),
(1285, 'El Horno', 60404, '2021-06-07 20:09:24', 'ADMIN', NULL, NULL, 78),
(1286, 'Liraqui', 60405, '2021-06-07 20:09:34', 'ADMIN', NULL, NULL, 78),
(1287, 'Tierra Colorada', 60406, '2021-06-07 20:09:46', 'ADMIN', NULL, NULL, 78),
(1288, 'El Corpus', 60501, '2021-06-07 20:10:09', 'ADMIN', NULL, NULL, 79),
(1289, 'Agua Fría', 60502, '2021-06-07 20:14:19', 'ADMIN', NULL, NULL, 79),
(1290, 'Calaire', 60503, '2021-06-07 20:14:33', 'ADMIN', NULL, NULL, 79),
(1291, 'Cayanini', 60504, '2021-06-07 20:14:42', 'ADMIN', NULL, NULL, 79),
(1292, 'El Baldoquín', 60505, '2021-06-07 20:14:54', 'ADMIN', NULL, NULL, 79),
(1293, 'El Banquito', 60506, '2021-06-07 20:15:07', 'ADMIN', NULL, NULL, 79),
(1294, 'El Despoblado', 60507, '2021-06-07 20:15:16', 'ADMIN', NULL, NULL, 79),
(1295, 'El Naranjal', 60508, '2021-06-07 20:15:24', 'ADMIN', NULL, NULL, 79),
(1296, 'El Pedregal', 60509, '2021-06-07 20:15:44', 'ADMIN', NULL, NULL, 79),
(1297, 'El Zapotal', 60510, '2021-06-07 20:16:17', 'ADMIN', NULL, NULL, 79),
(1298, 'La Albarrada', 60511, '2021-06-07 20:16:27', 'ADMIN', NULL, NULL, 79),
(1299, 'La Fortuna', 60512, '2021-06-07 20:16:36', 'ADMIN', NULL, NULL, 79),
(1300, 'La Galeria', 60513, '2021-06-07 20:16:43', 'ADMIN', NULL, NULL, 79),
(1301, 'San Isidro', 60514, '2021-06-07 20:16:55', 'ADMIN', NULL, NULL, 79),
(1302, 'San Juan Abajo', 60515, '2021-06-07 20:17:04', 'ADMIN', NULL, NULL, 79),
(1303, 'San Juan Arriba', 60516, '2021-06-07 20:17:15', 'ADMIN', NULL, NULL, 79),
(1304, 'El Triunfo', 60601, '2021-06-07 20:17:45', 'ADMIN', NULL, NULL, 80),
(1305, 'Azacualpa', 60602, '2021-06-07 20:18:24', 'ADMIN', NULL, NULL, 80),
(1306, 'El Cedrito', 60603, '2021-06-07 20:18:38', 'ADMIN', NULL, NULL, 80),
(1307, 'El Perico', 60604, '2021-06-07 20:18:48', 'ADMIN', NULL, NULL, 80),
(1308, 'La Calera', 60605, '2021-06-07 20:18:59', 'ADMIN', NULL, NULL, 80),
(1309, 'Las Haciendas', 60606, '2021-06-07 20:19:12', 'ADMIN', NULL, NULL, 80),
(1310, 'Nance Dulce', 60607, '2021-06-07 20:19:22', 'ADMIN', NULL, NULL, 80),
(1311, 'Río Grande', 60608, '2021-06-07 20:19:34', 'ADMIN', NULL, NULL, 80),
(1312, 'San Juan', 60609, '2021-06-07 20:19:48', 'ADMIN', NULL, NULL, 80),
(1313, 'Santa Maria', 60610, '2021-06-07 20:20:00', 'ADMIN', NULL, NULL, 80),
(1314, 'Santa Teresa', 60611, '2021-06-07 20:20:08', 'ADMIN', NULL, NULL, 80),
(1315, 'Marcovia', 60701, '2021-06-07 20:20:20', 'ADMIN', NULL, NULL, 81),
(1316, 'Cedeño', 60702, '2021-06-07 20:20:55', 'ADMIN', NULL, NULL, 81),
(1317, 'Colonia Buena Vista', 60703, '2021-06-07 20:21:26', 'ADMIN', NULL, NULL, 81),
(1318, 'El Botadero', 60704, '2021-06-07 20:24:12', 'ADMIN', NULL, NULL, 81),
(1319, 'El Obraje', 60705, '2021-06-07 20:24:38', 'ADMIN', NULL, NULL, 81);
INSERT INTO `tbl_aldeas_caserios_hn` (`id_aldea_caserio`, `nombre_aldea_caserio`, `codigo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `id_municipio`) VALUES
(1320, 'El Papalón', 60706, '2021-06-07 20:24:47', 'ADMIN', NULL, NULL, 81),
(1321, 'Guapinol', 60707, '2021-06-07 20:25:03', 'ADMIN', NULL, NULL, 81),
(1322, 'La Gervancia', 60708, '2021-06-07 20:25:20', 'ADMIN', NULL, NULL, 81),
(1323, 'La Joyada', 60709, '2021-06-07 20:25:32', 'ADMIN', NULL, NULL, 81),
(1324, 'Las Arenas', 60710, '2021-06-07 20:25:40', 'ADMIN', NULL, NULL, 81),
(1325, 'Las Pozas', 60711, '2021-06-07 20:25:48', 'ADMIN', NULL, NULL, 81),
(1326, 'Los Llanitos', 60712, '2021-06-07 20:25:58', 'ADMIN', NULL, NULL, 81),
(1327, 'Los Mangles', 60713, '2021-06-07 20:26:05', 'ADMIN', NULL, NULL, 81),
(1328, 'Monjarás', 60714, '2021-06-07 20:26:15', 'ADMIN', NULL, NULL, 81),
(1329, 'Piedra de Agua', 60715, '2021-06-07 20:26:27', 'ADMIN', NULL, NULL, 81),
(1330, 'Pueblo Nuevo', 60716, '2021-06-07 20:26:40', 'ADMIN', NULL, NULL, 81),
(1331, 'Punta Ratón', 60717, '2021-06-07 20:26:52', 'ADMIN', NULL, NULL, 81),
(1332, 'San José de Las Conchas', 60718, '2021-06-07 20:27:08', 'ADMIN', NULL, NULL, 81),
(1333, 'San Juan Bosco N.2', 60719, '2021-06-07 20:27:30', 'ADMIN', NULL, NULL, 81),
(1334, 'Santa Crúz', 60720, '2021-06-07 20:27:41', 'ADMIN', NULL, NULL, 81),
(1335, 'Tambor Abajo', 60721, '2021-06-07 20:27:55', 'ADMIN', NULL, NULL, 81),
(1336, 'Morolica', 60801, '2021-06-07 20:28:16', 'ADMIN', NULL, NULL, 82),
(1337, 'Agualcaguaire', 60802, '2021-06-07 20:30:40', 'ADMIN', NULL, NULL, 82),
(1338, 'Cerco de Piedra', 60803, '2021-06-07 20:30:53', 'ADMIN', NULL, NULL, 82),
(1339, 'El Potrero', 60804, '2021-06-07 20:31:06', 'ADMIN', NULL, NULL, 82),
(1340, 'La Enea', 60805, '2021-06-07 20:31:15', 'ADMIN', NULL, NULL, 82),
(1341, 'San Marquitos', 60806, '2021-06-07 20:31:25', 'ADMIN', NULL, NULL, 82),
(1342, 'Namasigue', 60901, '2021-06-07 20:31:47', 'ADMIN', NULL, NULL, 83),
(1343, 'San Bernando', 60902, '2021-06-07 20:31:59', 'ADMIN', NULL, NULL, 83),
(1344, 'San Francisco', 60903, '2021-06-07 20:32:12', 'ADMIN', NULL, NULL, 83),
(1345, 'San Francisco', 60903, '2021-06-07 20:32:16', 'ADMIN', NULL, NULL, 83),
(1346, 'San Isidro', 60904, '2021-06-07 20:32:25', 'ADMIN', NULL, NULL, 83),
(1347, 'San Jerónimo', 60905, '2021-06-07 20:32:34', 'ADMIN', NULL, NULL, 83),
(1348, 'San Rafael', 60906, '2021-06-07 20:32:44', 'ADMIN', NULL, NULL, 83),
(1349, 'Santa Irene', 60907, '2021-06-07 20:32:55', 'ADMIN', NULL, NULL, 83),
(1350, 'Tierra Blanca', 60908, '2021-06-07 20:33:06', 'ADMIN', NULL, NULL, 83),
(1351, 'Yorolán', 60909, '2021-06-07 20:33:15', 'ADMIN', NULL, NULL, 83),
(1352, 'Orocuina', 61001, '2021-06-07 20:33:42', 'ADMIN', NULL, NULL, 84),
(1353, 'Concepción', 61002, '2021-06-07 20:33:56', 'ADMIN', NULL, NULL, 84),
(1354, 'El Barreal', 61003, '2021-06-07 20:34:10', 'ADMIN', NULL, NULL, 84),
(1355, 'Mal Paso', 61004, '2021-06-07 20:34:19', 'ADMIN', NULL, NULL, 84),
(1356, 'San Andrés', 61005, '2021-06-07 20:34:31', 'ADMIN', NULL, NULL, 84),
(1357, 'San José', 61006, '2021-06-07 20:34:39', 'ADMIN', NULL, NULL, 84),
(1358, 'Santa Ana', 61007, '2021-06-07 20:34:50', 'ADMIN', NULL, NULL, 84),
(1359, 'Santa Crúz', 61008, '2021-06-07 20:35:00', 'ADMIN', NULL, NULL, 84),
(1360, 'Santa Lucía', 61009, '2021-06-07 20:35:23', 'ADMIN', NULL, NULL, 84),
(1361, 'Pespire', 61101, '2021-06-07 20:35:43', 'ADMIN', NULL, NULL, 85),
(1362, 'Cacautare', 61102, '2021-06-07 20:35:52', 'ADMIN', NULL, NULL, 85),
(1363, 'Concepción El Brasilar', 61103, '2021-06-07 20:36:07', 'ADMIN', NULL, NULL, 85),
(1364, 'El Espinal', 61104, '2021-06-07 20:36:20', 'ADMIN', NULL, NULL, 85),
(1365, 'El Guayabo', 61105, '2021-06-07 20:36:28', 'ADMIN', NULL, NULL, 85),
(1366, 'Esquimay Arriba o La Ermita', 61106, '2021-06-07 20:36:45', 'ADMIN', NULL, NULL, 85),
(1367, 'Marilica', 61107, '2021-06-07 20:36:55', 'ADMIN', NULL, NULL, 85),
(1368, 'San antonio de Padua', 61108, '2021-06-07 20:37:06', 'ADMIN', NULL, NULL, 85),
(1369, 'San Juan Bautista', 61109, '2021-06-07 20:37:18', 'ADMIN', NULL, NULL, 85),
(1370, 'San Juan Bosco', 61110, '2021-06-07 20:37:27', 'ADMIN', NULL, NULL, 85),
(1371, 'San Antonio de Flores', 61201, '2021-06-07 20:37:56', 'ADMIN', NULL, NULL, 86),
(1372, 'El Jicaro', 61202, '2021-06-07 20:38:20', 'ADMIN', NULL, NULL, 86),
(1373, 'Las Playitas', 61203, '2021-06-07 20:38:33', 'ADMIN', NULL, NULL, 86),
(1374, 'Moramuica', 61204, '2021-06-07 20:38:46', 'ADMIN', NULL, NULL, 86),
(1375, 'San Isidro', 61301, '2021-06-07 20:39:08', 'ADMIN', NULL, NULL, 87),
(1376, 'El Caulote', 61302, '2021-06-07 20:39:28', 'ADMIN', NULL, NULL, 87),
(1377, 'El Obrajito', 61303, '2021-06-07 20:39:45', 'ADMIN', NULL, NULL, 87),
(1378, 'Sonit', 61304, '2021-06-07 20:39:55', 'ADMIN', NULL, NULL, 87),
(1379, 'San José', 61401, '2021-06-07 20:40:12', 'ADMIN', NULL, NULL, 88),
(1380, 'Coraycito', 61402, '2021-06-07 20:40:24', 'ADMIN', NULL, NULL, 88),
(1381, 'El Cacao', 61403, '2021-06-07 20:40:45', 'ADMIN', NULL, NULL, 88),
(1382, 'El Macuelizo', 61404, '2021-06-07 20:40:57', 'ADMIN', NULL, NULL, 88),
(1383, 'La Cruicita', 61405, '2021-06-07 20:41:12', 'ADMIN', NULL, NULL, 88),
(1384, 'Las Marias', 61406, '2021-06-07 20:41:21', 'ADMIN', NULL, NULL, 88),
(1385, 'San Marcos de Colón', 61501, '2021-06-07 20:41:46', 'ADMIN', NULL, NULL, 89),
(1386, 'Cacamuya', 61502, '2021-06-07 20:41:57', 'ADMIN', NULL, NULL, 89),
(1387, 'Caire', 61503, '2021-06-07 20:42:08', 'ADMIN', NULL, NULL, 89),
(1388, 'Comalí', 61504, '2021-06-07 20:42:25', 'ADMIN', NULL, NULL, 89),
(1389, 'El Inventario', 61505, '2021-06-07 20:42:35', 'ADMIN', NULL, NULL, 89),
(1390, 'El Ojo de Agua', 61506, '2021-06-07 20:42:47', 'ADMIN', NULL, NULL, 89),
(1391, 'El Rodeo', 61507, '2021-06-07 20:43:03', 'ADMIN', NULL, NULL, 89),
(1392, 'Jayacayán', 61508, '2021-06-07 20:43:14', 'ADMIN', NULL, NULL, 89),
(1393, 'La Joya', 61509, '2021-06-07 20:43:24', 'ADMIN', NULL, NULL, 89),
(1394, 'La Quesera', 61510, '2021-06-07 20:43:38', 'ADMIN', NULL, NULL, 89),
(1395, 'Las Mesas de Colón', 61511, '2021-06-07 20:43:49', 'ADMIN', NULL, NULL, 89),
(1396, 'Los Encuentros', 61512, '2021-06-07 20:44:07', 'ADMIN', NULL, NULL, 89),
(1397, 'Oyoto', 61513, '2021-06-07 20:44:19', 'ADMIN', NULL, NULL, 89),
(1398, 'San Diego', 61514, '2021-06-07 20:44:27', 'ADMIN', NULL, NULL, 89),
(1399, 'San Frnacisco', 61515, '2021-06-07 20:44:36', 'ADMIN', NULL, NULL, 89),
(1400, 'San Juan de Duyusupo', 61516, '2021-06-07 20:44:49', 'ADMIN', NULL, NULL, 89),
(1401, 'Santa Rita', 61517, '2021-06-07 20:45:01', 'ADMIN', NULL, NULL, 89),
(1402, 'Santa Ana de Yusguare', 61601, '2021-06-07 20:45:20', 'ADMIN', NULL, NULL, 90),
(1403, 'Cerco de Piedra', 61602, '2021-06-07 20:45:48', 'ADMIN', NULL, NULL, 90),
(1404, 'El Cerro', 61603, '2021-06-07 20:45:58', 'ADMIN', NULL, NULL, 90),
(1405, 'La Tajeada', 61604, '2021-06-07 20:46:16', 'ADMIN', NULL, NULL, 90),
(1406, 'Pueblo Nuevo', 61605, '2021-06-07 20:46:26', 'ADMIN', NULL, NULL, 90),
(1407, 'Tablones abajo', 61606, '2021-06-07 20:46:39', 'ADMIN', NULL, NULL, 90),
(1408, 'Tablones Arriba', 61607, '2021-06-07 20:46:51', 'ADMIN', NULL, NULL, 90),
(1409, 'Yuscarán', 70101, '2021-06-07 20:54:06', 'ADMIN', NULL, NULL, 91),
(1410, 'El Barro', 70102, '2021-06-07 20:54:19', 'ADMIN', NULL, NULL, 91),
(1411, 'El Cordoncillo', 70103, '2021-06-07 20:54:31', 'ADMIN', NULL, NULL, 91),
(1412, 'El Chaguite de Oriente', 70104, '2021-06-07 20:54:44', 'ADMIN', NULL, NULL, 91),
(1413, 'El Chaguite Sur', 70105, '2021-06-07 20:55:00', 'ADMIN', NULL, NULL, 91),
(1414, 'El Ocotal', 70106, '2021-06-07 20:55:10', 'ADMIN', NULL, NULL, 91),
(1415, 'El Pericón', 70107, '2021-06-07 20:55:20', 'ADMIN', NULL, NULL, 91),
(1416, 'El Rancho del Obispo', 70108, '2021-06-07 20:55:32', 'ADMIN', NULL, NULL, 91),
(1417, 'El Robledal', 70109, '2021-06-07 20:55:46', 'ADMIN', NULL, NULL, 91),
(1418, 'El Rodeo', 70110, '2021-06-07 20:55:53', 'ADMIN', NULL, NULL, 91),
(1419, 'El Teñidero', 70111, '2021-06-07 20:56:03', 'ADMIN', NULL, NULL, 91),
(1420, 'El Zarpal', 70112, '2021-06-07 20:56:14', 'ADMIN', NULL, NULL, 91),
(1421, 'La Ciénega', 70113, '2021-06-07 20:56:33', 'ADMIN', NULL, NULL, 91),
(1422, 'La Insula', 70114, '2021-06-07 20:56:45', 'ADMIN', NULL, NULL, 91),
(1423, 'Las Crucitas', 70115, '2021-06-07 20:56:55', 'ADMIN', NULL, NULL, 91),
(1424, 'Los Laínez', 70116, '2021-06-07 20:57:16', 'ADMIN', NULL, NULL, 91),
(1425, 'Ojo de Agua', 70117, '2021-06-07 20:57:28', 'ADMIN', NULL, NULL, 91),
(1426, 'Sabana Redonda', 70118, '2021-06-07 20:57:39', 'ADMIN', NULL, NULL, 91),
(1427, 'Alauca', 70201, '2021-06-07 20:57:55', 'ADMIN', NULL, NULL, 92),
(1428, 'Buena Vista', 70202, '2021-06-07 20:58:04', 'ADMIN', NULL, NULL, 92),
(1429, 'Chaguite Grande', 70203, '2021-06-07 20:58:26', 'ADMIN', NULL, NULL, 92),
(1430, 'Chinampa o Chilampa', 70204, '2021-06-07 20:58:39', 'ADMIN', NULL, NULL, 92),
(1431, 'El Jicaro', 70205, '2021-06-07 20:58:50', 'ADMIN', NULL, NULL, 92),
(1432, 'El Malapalo', 70206, '2021-06-07 20:58:59', 'ADMIN', NULL, NULL, 92),
(1433, 'El Pedregalito', 70207, '2021-06-07 20:59:09', 'ADMIN', NULL, NULL, 92),
(1434, 'La Chichigua', 70208, '2021-06-07 20:59:20', 'ADMIN', NULL, NULL, 92),
(1435, 'La Jagua', 70209, '2021-06-07 20:59:32', 'ADMIN', NULL, NULL, 92),
(1436, 'La Manzanilla', 70210, '2021-06-07 20:59:45', 'ADMIN', NULL, NULL, 92),
(1437, 'Las Limas', 70211, '2021-06-07 20:59:53', 'ADMIN', NULL, NULL, 92),
(1438, 'Las Manos', 70212, '2021-06-07 21:00:02', 'ADMIN', NULL, NULL, 92),
(1439, 'Los Matasanos de Rio Arriba', 70213, '2021-06-07 21:00:18', 'ADMIN', NULL, NULL, 92),
(1440, 'San Antonio', 70214, '2021-06-07 21:00:35', 'ADMIN', NULL, NULL, 92),
(1441, 'Danlí', 70301, '2021-06-07 21:01:02', 'ADMIN', NULL, NULL, 93),
(1442, 'Agua Fría', 70302, '2021-06-07 21:01:31', 'ADMIN', NULL, NULL, 93),
(1443, 'Apali', 70303, '2021-06-07 21:01:46', 'ADMIN', NULL, NULL, 93),
(1444, 'Araulí', 70304, '2021-06-07 21:01:56', 'ADMIN', NULL, NULL, 93),
(1445, 'Bañaderos', 70305, '2021-06-07 21:02:06', 'ADMIN', NULL, NULL, 93),
(1446, 'Buena Esperanza de Azabache', 70306, '2021-06-07 21:02:23', 'ADMIN', NULL, NULL, 93),
(1447, 'Chirinos', 70307, '2021-06-07 21:02:33', 'ADMIN', NULL, NULL, 93),
(1448, 'El Arenal', 70308, '2021-06-07 21:02:42', 'ADMIN', NULL, NULL, 93),
(1449, 'El Barro', 70309, '2021-06-07 21:04:27', 'ADMIN', NULL, NULL, 93),
(1450, 'El Chichicaste', 70310, '2021-06-07 21:04:38', 'ADMIN', NULL, NULL, 93),
(1451, 'El Maguelar', 70311, '2021-06-07 21:04:47', 'ADMIN', NULL, NULL, 93),
(1452, 'El Matasano', 70312, '2021-06-07 21:04:54', 'ADMIN', NULL, NULL, 93),
(1453, 'El Obraje', 70313, '2021-06-07 21:05:03', 'ADMIN', NULL, NULL, 93),
(1454, 'El Olingo o El Porvenir', 70314, '2021-06-07 21:05:14', 'ADMIN', NULL, NULL, 93),
(1455, 'El Pataste', 70315, '2021-06-07 21:05:24', 'ADMIN', NULL, NULL, 93),
(1456, 'El Pescadero', 70316, '2021-06-07 21:05:35', 'ADMIN', NULL, NULL, 93),
(1457, 'El Porvenir', 70317, '2021-06-07 21:05:42', 'ADMIN', NULL, NULL, 93),
(1458, 'El Pozo Bendito', 70318, '2021-06-07 21:05:55', 'ADMIN', NULL, NULL, 93),
(1459, 'El Tablón', 70319, '2021-06-07 21:06:37', 'ADMIN', NULL, NULL, 93),
(1460, 'El Zamorano', 70320, '2021-06-07 21:06:45', 'ADMIN', NULL, NULL, 93),
(1461, 'El Zapotillo', 70321, '2021-06-07 21:06:56', 'ADMIN', NULL, NULL, 93),
(1462, 'El Zarzal', 70322, '2021-06-07 21:07:05', 'ADMIN', NULL, NULL, 93),
(1463, 'Gualiqueme', 70323, '2021-06-07 21:07:17', 'ADMIN', NULL, NULL, 93),
(1464, 'Jutiapa', 70324, '2021-06-07 21:07:24', 'ADMIN', NULL, NULL, 93),
(1465, 'La Lima', 70325, '2021-06-07 21:07:32', 'ADMIN', NULL, NULL, 93),
(1466, 'La Lodosa', 70326, '2021-06-07 21:07:40', 'ADMIN', NULL, NULL, 93),
(1467, 'La Trinidad o Sartenejas', 70327, '2021-06-07 21:07:53', 'ADMIN', NULL, NULL, 93),
(1468, 'Las Animas', 70328, '2021-06-07 21:08:06', 'ADMIN', NULL, NULL, 93),
(1469, 'Linaca', 70329, '2021-06-07 21:08:15', 'ADMIN', NULL, NULL, 93),
(1470, 'Palmillas', 70330, '2021-06-07 21:08:31', 'ADMIN', NULL, NULL, 93),
(1471, 'Quebrada Arriba u Oculí', 70331, '2021-06-07 21:08:46', 'ADMIN', NULL, NULL, 93),
(1472, 'Quebrada Larga', 70332, '2021-06-07 21:09:02', 'ADMIN', NULL, NULL, 93),
(1473, 'San Diego', 70333, '2021-06-07 21:09:10', 'ADMIN', NULL, NULL, 93),
(1474, 'San Julián', 70334, '2021-06-07 21:09:20', 'ADMIN', NULL, NULL, 93),
(1475, 'San Marcos Abajo', 70335, '2021-06-07 21:09:33', 'ADMIN', NULL, NULL, 93),
(1476, 'Santa Maria', 70336, '2021-06-07 21:09:42', 'ADMIN', NULL, NULL, 93),
(1477, 'Villa Santa', 70337, '2021-06-07 21:09:51', 'ADMIN', NULL, NULL, 93),
(1478, 'El Paraíso', 70401, '2021-06-07 21:10:13', 'ADMIN', NULL, NULL, 94),
(1479, 'Cuyalí', 70402, '2021-06-07 21:13:00', 'ADMIN', NULL, NULL, 94),
(1480, 'Dificultades', 70403, '2021-06-07 21:13:12', 'ADMIN', NULL, NULL, 94),
(1481, 'Granadillos', 70404, '2021-06-07 21:13:22', 'ADMIN', NULL, NULL, 94),
(1482, 'La Unión', 70405, '2021-06-07 21:13:30', 'ADMIN', NULL, NULL, 94),
(1483, 'Las Cañas', 70406, '2021-06-07 21:13:40', 'ADMIN', NULL, NULL, 94),
(1484, 'Las Flores', 70407, '2021-06-07 21:13:51', 'ADMIN', NULL, NULL, 94),
(1485, 'Las Manos', 70408, '2021-06-07 21:13:58', 'ADMIN', NULL, NULL, 94),
(1486, 'Las Selvas', 70409, '2021-06-07 21:14:04', 'ADMIN', NULL, NULL, 94),
(1487, 'Los Terrones', 70410, '2021-06-07 21:14:15', 'ADMIN', NULL, NULL, 94),
(1488, 'Los Volcanes', 70411, '2021-06-07 21:14:27', 'ADMIN', NULL, NULL, 94),
(1489, 'San Antonio de Conchagua', 70412, '2021-06-07 21:14:42', 'ADMIN', NULL, NULL, 94),
(1490, 'Santa Crúz', 70413, '2021-06-07 21:14:53', 'ADMIN', NULL, NULL, 94),
(1491, 'Guinope', 70501, '2021-06-07 21:15:03', 'ADMIN', NULL, NULL, 95),
(1492, 'Arrayanes', 70502, '2021-06-07 21:15:58', 'ADMIN', NULL, NULL, 95),
(1493, 'Casitas', 70503, '2021-06-07 21:16:08', 'ADMIN', NULL, NULL, 95),
(1494, 'Galeras', 70504, '2021-06-07 21:16:17', 'ADMIN', NULL, NULL, 95),
(1495, 'Las Liquidámbas', 70505, '2021-06-07 21:16:31', 'ADMIN', NULL, NULL, 95),
(1496, 'Lavanderos', 70506, '2021-06-07 21:16:42', 'ADMIN', NULL, NULL, 95),
(1497, 'Mansaragua', 70507, '2021-06-07 21:16:52', 'ADMIN', NULL, NULL, 95),
(1498, 'Pacayas', 70508, '2021-06-07 21:17:00', 'ADMIN', NULL, NULL, 95),
(1499, 'Santa Rosa', 70509, '2021-06-07 21:17:07', 'ADMIN', NULL, NULL, 95),
(1500, 'Silisgualagua', 70510, '2021-06-07 21:17:41', 'ADMIN', NULL, NULL, 95),
(1501, 'Jacaleapa', 70601, '2021-06-07 21:18:03', 'ADMIN', NULL, NULL, 96),
(1502, 'La Chorrera', 70602, '2021-06-07 21:18:15', 'ADMIN', NULL, NULL, 96),
(1503, 'Lomas Limpias', 70603, '2021-06-07 21:18:27', 'ADMIN', NULL, NULL, 96),
(1504, 'Liure', 70701, '2021-06-07 21:18:39', 'ADMIN', NULL, NULL, 97),
(1505, 'Asunción', 70702, '2021-06-07 21:19:00', 'ADMIN', NULL, NULL, 97),
(1506, 'Bocuire', 70703, '2021-06-07 21:19:28', 'ADMIN', NULL, NULL, 97),
(1507, 'Monte Grande', 70704, '2021-06-07 21:19:41', 'ADMIN', NULL, NULL, 97),
(1508, 'Santa Ramón', 70705, '2021-06-07 21:19:56', 'ADMIN', NULL, NULL, 97),
(1509, 'Santa Cruz', 70706, '2021-06-07 21:20:10', 'ADMIN', NULL, NULL, 97),
(1510, 'Morocelí', 70801, '2021-06-07 21:20:41', 'ADMIN', NULL, NULL, 98),
(1511, 'Buena Vista', 70802, '2021-06-07 21:20:56', 'ADMIN', NULL, NULL, 98),
(1512, 'El Chile o Quebrada Grande', 70803, '2021-06-07 21:21:12', 'ADMIN', NULL, NULL, 98),
(1513, 'El Chilito', 70804, '2021-06-07 21:21:23', 'ADMIN', NULL, NULL, 98),
(1514, 'El Llano', 70805, '2021-06-07 21:21:34', 'ADMIN', NULL, NULL, 98),
(1515, 'El Plan', 70806, '2021-06-07 21:21:42', 'ADMIN', NULL, NULL, 98),
(1516, 'El Retiro', 70807, '2021-06-07 21:21:50', 'ADMIN', NULL, NULL, 98),
(1517, 'El Suyate', 70808, '2021-06-07 21:22:01', 'ADMIN', NULL, NULL, 98),
(1518, 'Guadalajara', 70809, '2021-06-07 21:22:10', 'ADMIN', NULL, NULL, 98),
(1519, 'Hoya Grande', 70810, '2021-06-07 21:22:25', 'ADMIN', NULL, NULL, 98),
(1520, 'Los Limones', 70811, '2021-06-07 21:22:34', 'ADMIN', NULL, NULL, 98),
(1521, 'Los Liquidámbos', 70812, '2021-06-07 21:22:47', 'ADMIN', NULL, NULL, 98),
(1522, 'Los Pozos', 70813, '2021-06-07 21:22:57', 'ADMIN', NULL, NULL, 98),
(1523, 'Mata de Plátano', 70814, '2021-06-07 21:23:12', 'ADMIN', NULL, NULL, 98),
(1524, 'Valle Arriba', 70815, '2021-06-07 21:23:25', 'ADMIN', NULL, NULL, 98),
(1525, 'Oropolí', 70901, '2021-06-07 21:24:12', 'ADMIN', NULL, NULL, 99),
(1526, 'Chaguite Grande', 70902, '2021-06-07 21:24:24', 'ADMIN', NULL, NULL, 99),
(1527, 'El Barro', 70903, '2021-06-07 21:24:34', 'ADMIN', NULL, NULL, 99),
(1528, 'El Corralito', 70904, '2021-06-07 21:24:43', 'ADMIN', NULL, NULL, 99),
(1529, 'El Deshecho', 70905, '2021-06-07 21:24:53', 'ADMIN', NULL, NULL, 99),
(1530, 'El Jicaro', 70906, '2021-06-07 21:25:06', 'ADMIN', NULL, NULL, 99),
(1531, 'La Mesa', 70907, '2021-06-07 21:25:15', 'ADMIN', NULL, NULL, 99),
(1532, 'Las Casitas', 70908, '2021-06-07 21:25:28', 'ADMIN', NULL, NULL, 99),
(1533, 'Las Crucitas', 70909, '2021-06-07 21:25:37', 'ADMIN', NULL, NULL, 99),
(1534, 'Orealí', 70910, '2021-06-07 21:25:51', 'ADMIN', NULL, NULL, 99),
(1535, 'Samayare', 70911, '2021-06-07 21:26:03', 'ADMIN', NULL, NULL, 99),
(1537, 'Potrerillos', 71001, '2021-06-07 21:26:33', 'ADMIN', NULL, NULL, 100),
(1538, 'El Junquillo', 71002, '2021-06-07 21:26:59', 'ADMIN', NULL, NULL, 100),
(1539, 'El Limoncillo', 71003, '2021-06-07 21:27:13', 'ADMIN', NULL, NULL, 100),
(1540, 'Las Crucitas', 71004, '2021-06-07 21:27:26', 'ADMIN', NULL, NULL, 100),
(1541, 'Las Delicias', 71005, '2021-06-07 21:27:35', 'ADMIN', NULL, NULL, 100),
(1542, 'Loma de Enmedio', 71006, '2021-06-07 21:27:50', 'ADMIN', NULL, NULL, 100),
(1543, 'Lomanillos', 71007, '2021-06-07 21:27:59', 'ADMIN', NULL, NULL, 100),
(1544, 'Sabana Redonda', 71008, '2021-06-07 21:28:13', 'ADMIN', NULL, NULL, 100),
(1545, 'San Antonio de Flores', 71101, '2021-06-07 21:28:39', 'ADMIN', NULL, NULL, 101),
(1546, 'Apalipi', 71102, '2021-06-07 21:28:51', 'ADMIN', NULL, NULL, 101),
(1547, 'Comunidad', 71103, '2021-06-07 21:29:30', 'ADMIN', NULL, NULL, 101),
(1548, 'El Changuite', 71104, '2021-06-07 21:29:41', 'ADMIN', NULL, NULL, 101),
(1549, 'El Espinal', 71105, '2021-06-07 21:30:03', 'ADMIN', NULL, NULL, 101),
(1550, 'Mandasta', 71106, '2021-06-07 21:30:11', 'ADMIN', NULL, NULL, 101),
(1551, 'Orilica', 71107, '2021-06-07 21:30:21', 'ADMIN', NULL, NULL, 101),
(1552, 'Quebrada Grande', 71108, '2021-06-07 21:30:32', 'ADMIN', NULL, NULL, 101),
(1553, 'Tolobrito', 71109, '2021-06-07 21:30:52', 'ADMIN', NULL, NULL, 101),
(1555, 'San Lucas', 71201, '2021-06-07 21:31:35', 'ADMIN', NULL, NULL, 102),
(1556, 'Apalipi', 71202, '2021-06-07 21:32:04', 'ADMIN', NULL, NULL, 102),
(1557, 'Candelaria', 71203, '2021-06-07 21:32:23', 'ADMIN', NULL, NULL, 102),
(1558, 'Junacatal', 71204, '2021-06-07 21:32:34', 'ADMIN', NULL, NULL, 102),
(1559, 'La Montañita', 71205, '2021-06-07 21:32:44', 'ADMIN', NULL, NULL, 102),
(1560, 'Los Quebrachos', 71206, '2021-06-07 21:32:59', 'ADMIN', NULL, NULL, 102),
(1561, 'Mactuca', 71207, '2021-06-07 21:33:10', 'ADMIN', NULL, NULL, 102),
(1562, 'Navijupe', 71208, '2021-06-07 21:33:21', 'ADMIN', NULL, NULL, 102),
(1563, 'Surule', 71209, '2021-06-07 21:33:29', 'ADMIN', NULL, NULL, 102),
(1564, 'Tapahuasca', 71210, '2021-06-07 21:33:39', 'ADMIN', NULL, NULL, 102),
(1565, 'San Matías', 71301, '2021-06-07 21:34:00', 'ADMIN', NULL, NULL, 103),
(1566, 'Corral Falso', 71302, '2021-06-07 21:34:11', 'ADMIN', NULL, NULL, 103),
(1567, 'El Espinito', 71303, '2021-06-07 21:34:22', 'ADMIN', NULL, NULL, 103),
(1568, 'El Guayacán', 71304, '2021-06-07 21:34:36', 'ADMIN', NULL, NULL, 103),
(1569, 'El Robledal', 71305, '2021-06-07 21:34:49', 'ADMIN', NULL, NULL, 103),
(1570, 'La Concepción', 71306, '2021-06-07 21:35:00', 'ADMIN', NULL, NULL, 103),
(1571, 'Las Tunas', 71307, '2021-06-07 21:35:36', 'ADMIN', NULL, NULL, 103),
(1572, 'San Jerónimo', 71308, '2021-06-07 21:35:58', 'ADMIN', NULL, NULL, 103),
(1573, 'Santa Rosa', 71309, '2021-06-07 21:36:06', 'ADMIN', NULL, NULL, 103),
(1574, 'Soledad', 71401, '2021-06-07 21:36:25', 'ADMIN', NULL, NULL, 104),
(1575, 'La Paz o Rodeito', 71402, '2021-06-07 21:36:39', 'ADMIN', NULL, NULL, 104),
(1576, 'La Victoria', 71403, '2021-06-07 21:36:50', 'ADMIN', NULL, NULL, 104),
(1577, 'Las Marias', 71404, '2021-06-07 21:37:11', 'ADMIN', NULL, NULL, 104),
(1578, 'Los Alpes', 71405, '2021-06-07 21:37:23', 'ADMIN', NULL, NULL, 104),
(1579, 'San Diego', 71406, '2021-06-07 21:37:36', 'ADMIN', NULL, NULL, 104),
(1580, 'San Marcos', 71407, '2021-06-07 21:37:52', 'ADMIN', NULL, NULL, 104),
(1581, 'Santo Domingo', 71408, '2021-06-07 21:38:00', 'ADMIN', NULL, NULL, 104),
(1582, 'Teupasenti', 71501, '2021-06-07 21:38:27', 'ADMIN', NULL, NULL, 105),
(1583, 'Agua Fría', 71502, '2021-06-07 21:38:39', 'ADMIN', NULL, NULL, 105),
(1584, 'Bañaderos', 71503, '2021-06-07 21:38:49', 'ADMIN', NULL, NULL, 105),
(1585, 'El Cantón', 71504, '2021-06-07 21:38:58', 'ADMIN', NULL, NULL, 105),
(1586, 'El Corralito', 71505, '2021-06-07 21:39:08', 'ADMIN', NULL, NULL, 105),
(1587, 'El Chelón N.1', 71506, '2021-06-07 21:39:18', 'ADMIN', NULL, NULL, 105),
(1588, 'El Chilito', 71507, '2021-06-07 21:39:29', 'ADMIN', NULL, NULL, 105),
(1589, 'El Encino', 71508, '2021-06-07 21:39:42', 'ADMIN', NULL, NULL, 105),
(1590, 'El Jute', 71509, '2021-06-07 21:39:48', 'ADMIN', NULL, NULL, 105),
(1591, 'El Ocotal', 71510, '2021-06-07 21:39:57', 'ADMIN', NULL, NULL, 105),
(1592, 'El Rilto N.1', 71511, '2021-06-07 21:40:07', 'ADMIN', NULL, NULL, 105),
(1593, 'El Rilto N.2', 71512, '2021-06-07 21:40:26', 'ADMIN', NULL, NULL, 105),
(1594, 'El Rilto del Esquillal', 71513, '2021-06-07 21:41:02', 'ADMIN', NULL, NULL, 105),
(1595, 'El Rodeo', 71514, '2021-06-07 21:41:11', 'ADMIN', NULL, NULL, 105),
(1596, 'El Suyatal', 71515, '2021-06-07 21:41:21', 'ADMIN', NULL, NULL, 105),
(1597, 'Escobas Amarillas', 71516, '2021-06-07 21:41:32', 'ADMIN', NULL, NULL, 105),
(1598, 'La Aguja', 71517, '2021-06-07 21:41:42', 'ADMIN', NULL, NULL, 105),
(1599, 'La Cebadilla', 71518, '2021-06-07 21:41:59', 'ADMIN', NULL, NULL, 105),
(1600, 'La Comunidad', 71519, '2021-06-07 21:42:06', 'ADMIN', NULL, NULL, 105),
(1601, 'La Granja', 71520, '2021-06-07 21:42:14', 'ADMIN', NULL, NULL, 105),
(1602, 'La Laguna N.1', 71521, '2021-06-07 21:42:33', 'ADMIN', NULL, NULL, 105),
(1603, 'La Laguna N.2', 71521, '2021-06-07 21:42:43', 'ADMIN', NULL, NULL, 105),
(1604, 'La Zacatera', 71523, '2021-06-07 21:43:07', 'ADMIN', NULL, NULL, 105),
(1605, 'Las Cortinas', 71524, '2021-06-07 21:43:18', 'ADMIN', NULL, NULL, 105),
(1606, 'Las Delicias', 71525, '2021-06-07 21:43:25', 'ADMIN', NULL, NULL, 105),
(1607, 'Las Flores', 71526, '2021-06-07 21:43:34', 'ADMIN', NULL, NULL, 105),
(1608, 'Las Uvas', 71527, '2021-06-07 21:43:43', 'ADMIN', NULL, NULL, 105),
(1609, 'Los Plancitos', 71528, '2021-06-07 21:43:59', 'ADMIN', NULL, NULL, 105),
(1610, 'Paso Hondo', 71529, '2021-06-07 21:44:55', 'ADMIN', NULL, NULL, 105),
(1611, 'Pedríos', 71530, '2021-06-07 21:45:07', 'ADMIN', NULL, NULL, 105),
(1612, 'Peña Blanca', 71531, '2021-06-07 21:45:16', 'ADMIN', NULL, NULL, 105),
(1613, 'Potrerillos', 71532, '2021-06-07 21:45:29', 'ADMIN', NULL, NULL, 105),
(1614, 'Quebrada del Zapotillo', 71533, '2021-06-07 21:45:39', 'ADMIN', NULL, NULL, 105),
(1615, 'Saladino N.1', 71534, '2021-06-07 21:46:07', 'ADMIN', NULL, NULL, 105),
(1616, 'San Isidro', 71535, '2021-06-07 21:46:18', 'ADMIN', NULL, NULL, 105),
(1617, 'San José del Potrero', 71536, '2021-06-07 21:46:29', 'ADMIN', NULL, NULL, 105),
(1618, 'Santa Cruz', 71537, '2021-06-07 21:46:39', 'ADMIN', NULL, NULL, 105),
(1619, 'Santa Rosa N.1', 71538, '2021-06-07 21:46:53', 'ADMIN', NULL, NULL, 105),
(1620, 'Santa Rosa N.2', 71539, '2021-06-07 21:47:05', 'ADMIN', NULL, NULL, 105),
(1621, 'Texiguat', 71601, '2021-06-07 21:47:44', 'ADMIN', NULL, NULL, 106),
(1622, 'Asunción', 71602, '2021-06-07 21:47:55', 'ADMIN', NULL, NULL, 106),
(1623, 'El Zapotal', 71603, '2021-06-07 21:48:05', 'ADMIN', NULL, NULL, 106),
(1624, 'Guinopito', 71604, '2021-06-07 21:48:21', 'ADMIN', NULL, NULL, 106),
(1625, 'Jamayupe', 71605, '2021-06-07 21:48:30', 'ADMIN', NULL, NULL, 106),
(1626, 'Rio Arriba', 71606, '2021-06-07 21:48:40', 'ADMIN', NULL, NULL, 106),
(1627, 'San Lorenzo', 71607, '2021-06-07 21:48:49', 'ADMIN', NULL, NULL, 106),
(1628, 'San Sebastián', 71608, '2021-06-07 21:49:01', 'ADMIN', NULL, NULL, 106),
(1629, 'Vado Ancho', 71701, '2021-06-07 21:49:36', 'ADMIN', NULL, NULL, 107),
(1630, 'Apausupo', 71702, '2021-06-07 21:49:47', 'ADMIN', NULL, NULL, 107),
(1631, 'Las Uvitas', 71703, '2021-06-07 21:50:02', 'ADMIN', NULL, NULL, 107),
(1632, 'San Jerónimo de Vado Ancho', 71704, '2021-06-07 21:50:42', 'ADMIN', NULL, NULL, 107),
(1633, 'Tolobre', 71705, '2021-06-07 21:50:52', 'ADMIN', NULL, NULL, 107),
(1634, 'Yauyupe', 71801, '2021-06-07 21:51:12', 'ADMIN', NULL, NULL, 108),
(1635, 'El Changuitillo', 71802, '2021-06-07 21:51:25', 'ADMIN', NULL, NULL, 108),
(1636, 'El Hornito', 71803, '2021-06-07 21:51:34', 'ADMIN', NULL, NULL, 108),
(1637, 'Trojes', 71901, '2021-06-07 21:51:58', 'ADMIN', NULL, NULL, 109),
(1638, 'Arenales', 71902, '2021-06-07 21:52:09', 'ADMIN', NULL, NULL, 109),
(1639, 'Capire', 71903, '2021-06-07 21:52:16', 'ADMIN', NULL, NULL, 109),
(1640, 'Cifuentes', 71904, '2021-06-07 21:52:26', 'ADMIN', NULL, NULL, 109),
(1641, 'El Guineo', 71905, '2021-06-07 21:52:34', 'ADMIN', NULL, NULL, 109),
(1642, 'Taipachi', 71906, '2021-06-07 21:52:44', 'ADMIN', NULL, NULL, 109),
(1643, 'Yamales', 71907, '2021-06-07 21:52:57', 'ADMIN', NULL, NULL, 109),
(1644, 'Distrito Central', 80101, '2021-06-08 00:01:55', 'ADMIN', NULL, NULL, 110),
(1645, 'Amarateca', 80102, '2021-06-08 00:02:12', 'ADMIN', NULL, NULL, 110),
(1646, 'Azacualpa', 80103, '2021-06-08 00:02:22', 'ADMIN', NULL, NULL, 110),
(1647, 'Carpintero', 80104, '2021-06-08 00:02:33', 'ADMIN', NULL, NULL, 110),
(1648, 'Cerro Grande', 80105, '2021-06-08 00:02:41', 'ADMIN', NULL, NULL, 110),
(1649, 'Coa Abajo', 80106, '2021-06-08 00:02:51', 'ADMIN', NULL, NULL, 110),
(1650, 'Coa Arriba', 80107, '2021-06-08 00:02:58', 'ADMIN', NULL, NULL, 110),
(1651, 'Cofradia', 80108, '2021-06-08 00:03:06', 'ADMIN', NULL, NULL, 110),
(1652, 'Concepción de Rio Grande', 80109, '2021-06-08 00:03:19', 'ADMIN', NULL, NULL, 110),
(1653, 'El Pilinguín', 80111, '2021-06-08 00:03:46', 'ADMIN', NULL, NULL, 110),
(1654, 'El Tizatillo', 80112, '2021-06-08 00:03:58', 'ADMIN', NULL, NULL, 110),
(1655, 'Germania', 80113, '2021-06-08 00:04:07', 'ADMIN', NULL, NULL, 110),
(1656, 'Guanagololo', 80114, '2021-06-08 00:04:20', 'ADMIN', NULL, NULL, 110),
(1657, 'Guasculile', 80115, '2021-06-08 00:04:39', 'ADMIN', NULL, NULL, 110),
(1658, 'Jacaleapa', 80116, '2021-06-08 00:04:51', 'ADMIN', NULL, NULL, 110),
(1659, 'Jutiapa', 80117, '2021-06-08 00:04:59', 'ADMIN', NULL, NULL, 110),
(1660, 'La Calera', 80118, '2021-06-08 00:05:08', 'ADMIN', NULL, NULL, 110),
(1661, 'La Cuesta N.2', 80119, '2021-06-08 00:05:22', 'ADMIN', NULL, NULL, 110),
(1662, 'La Montañita', 80120, '2021-06-08 00:05:33', 'ADMIN', NULL, NULL, 110),
(1663, 'La Sabana', 80121, '2021-06-08 00:05:43', 'ADMIN', NULL, NULL, 110),
(1664, 'La Venta', 80122, '2021-06-08 00:05:49', 'ADMIN', NULL, NULL, 110),
(1665, 'Las Casitas', 80123, '2021-06-08 00:05:57', 'ADMIN', NULL, NULL, 110),
(1666, 'Las Flores', 80124, '2021-06-08 00:06:06', 'ADMIN', NULL, NULL, 110),
(1667, 'Las Tapias', 80125, '2021-06-08 00:06:15', 'ADMIN', NULL, NULL, 110),
(1668, 'Los Jutes', 80126, '2021-06-08 00:06:26', 'ADMIN', NULL, NULL, 110),
(1669, 'Mateo', 80127, '2021-06-08 00:06:35', 'ADMIN', NULL, NULL, 110),
(1670, 'Monte Redondo', 80128, '2021-06-08 00:06:46', 'ADMIN', NULL, NULL, 110),
(1671, 'Nueva Aldea', 80129, '2021-06-08 00:07:00', 'ADMIN', NULL, NULL, 110),
(1672, 'Rio Abajo', 80130, '2021-06-08 00:07:21', 'ADMIN', NULL, NULL, 110),
(1673, 'Rio Hondo', 80131, '2021-06-08 00:07:31', 'ADMIN', NULL, NULL, 110),
(1674, 'San Francisco de Soroguara', 80132, '2021-06-08 00:07:47', 'ADMIN', NULL, NULL, 110),
(1675, 'San Juancito', 80133, '2021-06-08 00:07:58', 'ADMIN', NULL, NULL, 110),
(1676, 'San Juan del Rancho', 80134, '2021-06-08 00:08:08', 'ADMIN', NULL, NULL, 110),
(1677, 'San Juan del Rio Grande', 80135, '2021-06-08 00:08:20', 'ADMIN', NULL, NULL, 110),
(1678, 'San Matías', 80136, '2021-06-08 00:08:34', 'ADMIN', NULL, NULL, 110),
(1679, 'Santa Cruz Abajo', 80137, '2021-06-08 00:09:41', 'ADMIN', NULL, NULL, 110),
(1680, 'Santa Cruz Arriba', 80138, '2021-06-08 00:09:50', 'ADMIN', NULL, NULL, 110),
(1681, 'Santa Rosa', 80139, '2021-06-08 00:10:03', 'ADMIN', NULL, NULL, 110),
(1682, 'Soroguara', 80140, '2021-06-08 00:10:14', 'ADMIN', NULL, NULL, 110),
(1683, 'Támara', 80141, '2021-06-08 00:10:23', 'ADMIN', NULL, NULL, 110),
(1684, 'Villa Nueva', 80142, '2021-06-08 00:10:32', 'ADMIN', NULL, NULL, 110),
(1685, 'Yaguacire', 80143, '2021-06-08 00:10:45', 'ADMIN', NULL, NULL, 110),
(1686, 'Zambrano', 80144, '2021-06-08 00:10:56', 'ADMIN', NULL, NULL, 110),
(1687, 'Alubarén', 80201, '2021-06-08 00:11:17', 'ADMIN', NULL, NULL, 111),
(1688, 'La Concepción', 80202, '2021-06-08 00:11:27', 'ADMIN', NULL, NULL, 111),
(1689, 'Los Tablones', 80203, '2021-06-08 00:11:38', 'ADMIN', NULL, NULL, 111),
(1690, 'Rio Arriba', 80204, '2021-06-08 00:11:47', 'ADMIN', NULL, NULL, 111),
(1691, 'Cedros', 80301, '2021-06-08 00:12:01', 'ADMIN', NULL, NULL, 112),
(1692, 'Agalteca', 80302, '2021-06-08 00:12:11', 'ADMIN', NULL, NULL, 112),
(1693, 'Cedros Abajo', 80303, '2021-06-08 00:12:18', 'ADMIN', NULL, NULL, 112),
(1694, 'El Guante', 80304, '2021-06-08 00:12:35', 'ADMIN', NULL, NULL, 112),
(1695, 'El Suyatal', 80305, '2021-06-08 00:12:46', 'ADMIN', NULL, NULL, 112),
(1696, 'El Tablón', 80306, '2021-06-08 00:12:55', 'ADMIN', NULL, NULL, 112),
(1697, 'La Guadalupe', 80307, '2021-06-08 00:13:11', 'ADMIN', NULL, NULL, 112),
(1698, 'Las Animas', 80308, '2021-06-08 00:13:20', 'ADMIN', NULL, NULL, 112),
(1699, 'Mata de Plátano', 80309, '2021-06-08 00:13:33', 'ADMIN', NULL, NULL, 112),
(1700, 'Pueblo Nuevo', 80310, '2021-06-08 00:13:45', 'ADMIN', NULL, NULL, 112),
(1701, 'Siria', 80311, '2021-06-08 00:13:54', 'ADMIN', NULL, NULL, 112),
(1702, 'Tamarindo', 80312, '2021-06-08 00:14:03', 'ADMIN', NULL, NULL, 112),
(1703, 'Curarén', 80401, '2021-06-08 00:14:27', 'ADMIN', NULL, NULL, 113),
(1704, 'Cartagua', 80402, '2021-06-08 00:14:40', 'ADMIN', NULL, NULL, 113),
(1705, 'Cunismica', 80403, '2021-06-08 00:14:47', 'ADMIN', NULL, NULL, 113),
(1706, 'El Portillo de San Juan Bosco', 80404, '2021-06-08 00:15:02', 'ADMIN', NULL, NULL, 113),
(1707, 'El Porvenir', 80405, '2021-06-08 00:15:12', 'ADMIN', NULL, NULL, 113),
(1708, 'Emituca', 80406, '2021-06-08 00:15:32', 'ADMIN', NULL, NULL, 113),
(1709, 'Hato Viejo', 80407, '2021-06-08 00:15:41', 'ADMIN', NULL, NULL, 113),
(1710, 'La Costilla', 80408, '2021-06-08 00:15:53', 'ADMIN', NULL, NULL, 113),
(1711, 'La Manzanilla', 80409, '2021-06-08 00:16:03', 'ADMIN', NULL, NULL, 113),
(1712, 'La Victoria', 80410, '2021-06-08 00:16:13', 'ADMIN', NULL, NULL, 113),
(1713, 'Lodo Negro', 80411, '2021-06-08 00:16:23', 'ADMIN', NULL, NULL, 113),
(1714, 'Macancicre', 80412, '2021-06-08 00:16:33', 'ADMIN', NULL, NULL, 113),
(1715, 'Mandasta', 80413, '2021-06-08 00:16:42', 'ADMIN', NULL, NULL, 113),
(1716, 'San José del Potrero', 80414, '2021-06-08 00:16:57', 'ADMIN', NULL, NULL, 113),
(1717, 'San Marcos', 80415, '2021-06-08 00:17:07', 'ADMIN', NULL, NULL, 113),
(1718, 'Toncontín', 80416, '2021-06-08 00:17:18', 'ADMIN', NULL, NULL, 113),
(1719, 'El Porvenir', 80501, '2021-06-08 00:17:33', 'ADMIN', NULL, NULL, 114),
(1720, 'El Agua Caliente', 80502, '2021-06-08 00:18:01', 'ADMIN', NULL, NULL, 114),
(1721, 'El Escanito', 80503, '2021-06-08 00:18:12', 'ADMIN', NULL, NULL, 114),
(1722, 'El Guantillo', 80504, '2021-06-08 00:18:32', 'ADMIN', NULL, NULL, 114),
(1723, 'El Pedernal', 80505, '2021-06-08 00:18:40', 'ADMIN', NULL, NULL, 114),
(1724, 'El Terrero', 80506, '2021-06-08 00:18:48', 'ADMIN', NULL, NULL, 114),
(1725, 'Guayabillas', 80507, '2021-06-08 00:19:05', 'ADMIN', NULL, NULL, 114),
(1726, 'Pueblo Nuevo', 80508, '2021-06-08 00:19:14', 'ADMIN', NULL, NULL, 114),
(1727, 'Guaimaca', 80601, '2021-06-08 00:19:40', 'ADMIN', NULL, NULL, 115),
(1728, 'Casas Viejas', 80602, '2021-06-08 00:19:53', 'ADMIN', NULL, NULL, 115),
(1729, 'Cerro Bonito', 80603, '2021-06-08 00:20:03', 'ADMIN', NULL, NULL, 115),
(1730, 'El Guanacaste', 80604, '2021-06-08 00:20:15', 'ADMIN', NULL, NULL, 115),
(1731, 'El Tomate', 80605, '2021-06-08 00:20:25', 'ADMIN', NULL, NULL, 115),
(1732, 'Gones', 80606, '2021-06-08 00:20:35', 'ADMIN', NULL, NULL, 115),
(1733, 'La Aserradera', 80607, '2021-06-08 00:20:46', 'ADMIN', NULL, NULL, 115),
(1734, 'La Laguna N.1', 80608, '2021-06-08 00:20:55', 'ADMIN', NULL, NULL, 115),
(1735, 'Rio abajo', 80609, '2021-06-08 00:21:06', 'ADMIN', NULL, NULL, 115),
(1736, 'Sabana Grande', 80610, '2021-06-08 00:21:18', 'ADMIN', NULL, NULL, 115),
(1737, 'San José', 80611, '2021-06-08 00:21:27', 'ADMIN', NULL, NULL, 115),
(1738, 'San Marcos', 80612, '2021-06-08 00:21:36', 'ADMIN', NULL, NULL, 115),
(1739, 'Sanquín', 80613, '2021-06-08 00:21:45', 'ADMIN', NULL, NULL, 115),
(1741, 'La Libertad', 80701, '2021-06-08 00:22:22', 'ADMIN', NULL, NULL, 116),
(1742, 'El Pedrero', 80702, '2021-06-08 00:22:54', 'ADMIN', NULL, NULL, 116),
(1743, 'Quebrachal', 80703, '2021-06-08 00:23:05', 'ADMIN', NULL, NULL, 116),
(1744, 'La Venta', 80801, '2021-06-08 00:23:27', 'ADMIN', NULL, NULL, 117),
(1745, 'El Porvenir', 80802, '2021-06-08 00:23:58', 'ADMIN', NULL, NULL, 117),
(1746, 'Ojos de Agua', 80803, '2021-06-08 00:24:06', 'ADMIN', NULL, NULL, 117),
(1747, 'Opimuca', 80804, '2021-06-08 00:24:21', 'ADMIN', NULL, NULL, 117),
(1748, 'San Jorge', 80805, '2021-06-08 00:24:30', 'ADMIN', NULL, NULL, 117),
(1750, 'Lepaterique', 80901, '2021-06-08 00:24:56', 'ADMIN', NULL, NULL, 118),
(1751, 'Culguaque', 80902, '2021-06-08 00:25:19', 'ADMIN', NULL, NULL, 118),
(1752, 'El Carrizal', 80903, '2021-06-08 00:25:26', 'ADMIN', NULL, NULL, 118),
(1753, 'El Espino', 80904, '2021-06-08 00:25:35', 'ADMIN', NULL, NULL, 118),
(1754, 'Hierbabuena', 80905, '2021-06-08 00:25:46', 'ADMIN', NULL, NULL, 118),
(1755, 'La Brea', 80906, '2021-06-08 00:25:56', 'ADMIN', NULL, NULL, 118),
(1756, 'Mulhuaca o El Llano', 80907, '2021-06-08 00:26:20', 'ADMIN', NULL, NULL, 118),
(1757, 'Maraita', 81001, '2021-06-08 00:26:50', 'ADMIN', NULL, NULL, 118),
(1758, 'Coato', 81002, '2021-06-08 00:27:14', 'ADMIN', NULL, NULL, 119),
(1759, 'El Chaguite', 81003, '2021-06-08 00:27:56', 'ADMIN', NULL, NULL, 119),
(1760, 'El Retiro', 81004, '2021-06-08 00:28:07', 'ADMIN', NULL, NULL, 119),
(1761, 'La Unión', 81005, '2021-06-08 00:28:16', 'ADMIN', NULL, NULL, 119),
(1762, 'Lizapa', 81006, '2021-06-08 00:28:32', 'ADMIN', NULL, NULL, 119),
(1763, 'Reducto', 81007, '2021-06-08 00:28:40', 'ADMIN', NULL, NULL, 119),
(1764, 'San Pedro', 81008, '2021-06-08 00:28:49', 'ADMIN', NULL, NULL, 119),
(1765, 'Terrero Blanco', 81009, '2021-06-08 00:29:03', 'ADMIN', NULL, NULL, 119),
(1766, 'Terrero Prieto', 81010, '2021-06-08 00:29:09', 'ADMIN', NULL, NULL, 119),
(1767, 'Marale', 81101, '2021-06-08 00:30:01', 'ADMIN', NULL, NULL, 120),
(1768, 'El Carrizal', 81102, '2021-06-08 00:30:10', 'ADMIN', NULL, NULL, 120),
(1769, 'El Panal', 81103, '2021-06-08 00:30:16', 'ADMIN', NULL, NULL, 120),
(1770, 'El Paraiso', 81104, '2021-06-08 00:30:27', 'ADMIN', NULL, NULL, 120),
(1771, 'La Esperanza o El Cacao', 81105, '2021-06-08 00:30:41', 'ADMIN', NULL, NULL, 120),
(1772, 'La Travesía', 81106, '2021-06-08 00:30:54', 'ADMIN', NULL, NULL, 120),
(1773, 'Las Casitas', 81107, '2021-06-08 00:31:05', 'ADMIN', NULL, NULL, 120),
(1774, 'Las Lagunas', 81108, '2021-06-08 00:31:14', 'ADMIN', NULL, NULL, 120),
(1775, 'Los Naranjos', 81109, '2021-06-08 00:31:24', 'ADMIN', NULL, NULL, 120),
(1776, 'Los Planes', 81110, '2021-06-08 00:31:40', 'ADMIN', NULL, NULL, 120),
(1777, 'Rio Abajo', 81111, '2021-06-08 00:31:49', 'ADMIN', NULL, NULL, 120),
(1779, 'Nueva Armenia', 81201, '2021-06-08 00:32:18', 'ADMIN', NULL, NULL, 121),
(1780, 'Adurasta', 81202, '2021-06-08 00:32:59', 'ADMIN', NULL, NULL, 121),
(1781, 'Barajana', 81203, '2021-06-08 00:33:08', 'ADMIN', NULL, NULL, 121),
(1782, 'Cuesta Chiquita', 81204, '2021-06-08 00:33:17', 'ADMIN', NULL, NULL, 121),
(1783, 'El Platanar o Platanal', 81205, '2021-06-08 00:33:32', 'ADMIN', NULL, NULL, 121),
(1784, 'Las Piñuelas', 81206, '2021-06-08 00:33:45', 'ADMIN', NULL, NULL, 121),
(1785, 'Salalica', 81207, '2021-06-08 00:33:56', 'ADMIN', NULL, NULL, 121),
(1786, 'Ojojona', 81301, '2021-06-08 00:34:04', 'ADMIN', NULL, NULL, 122),
(1787, 'Aragua', 81302, '2021-06-08 00:34:09', 'ADMIN', NULL, NULL, 122),
(1788, 'El Aguacatal', 81303, '2021-06-08 00:34:19', 'ADMIN', NULL, NULL, 122),
(1789, 'El Curculo', 81304, '2021-06-08 00:34:46', 'ADMIN', NULL, NULL, 122),
(1790, 'El Jicaro', 81305, '2021-06-08 00:35:31', 'ADMIN', NULL, NULL, 122),
(1791, 'Guasucarán', 81306, '2021-06-08 00:36:50', 'ADMIN', NULL, NULL, 122),
(1792, 'Guerisne', 81307, '2021-06-08 00:37:01', 'ADMIN', NULL, NULL, 122),
(1793, 'Santa Cruz', 81308, '2021-06-08 00:37:09', 'ADMIN', NULL, NULL, 122),
(1794, 'Surcos de Caña', 81310, '2021-06-08 00:39:00', 'ADMIN', NULL, NULL, 122),
(1795, 'Orica', 81401, '2021-06-08 00:39:20', 'ADMIN', NULL, NULL, 123),
(1796, 'El Encino', 81402, '2021-06-08 00:39:27', 'ADMIN', NULL, NULL, 123),
(1797, 'El Nance', 81403, '2021-06-08 00:39:36', 'ADMIN', NULL, NULL, 123),
(1798, 'Guatemalita', 81404, '2021-06-08 00:39:47', 'ADMIN', NULL, NULL, 123),
(1799, 'La Joya del Quebracho', 81405, '2021-06-08 00:39:59', 'ADMIN', NULL, NULL, 123),
(1800, 'San Francisco de Orica', 81406, '2021-06-08 00:40:13', 'ADMIN', NULL, NULL, 123),
(1801, 'San Marquitos', 81407, '2021-06-08 00:40:24', 'ADMIN', NULL, NULL, 123),
(1802, 'Reitoca', 81501, '2021-06-08 00:40:57', 'ADMIN', NULL, NULL, 124),
(1803, 'Azacualpa', 81502, '2021-06-08 00:41:06', 'ADMIN', NULL, NULL, 124),
(1804, 'Cerro del Señor', 81503, '2021-06-08 00:41:15', 'ADMIN', NULL, NULL, 124),
(1805, 'El Rodeo', 81504, '2021-06-08 00:41:28', 'ADMIN', NULL, NULL, 124),
(1806, 'La Guadalupe', 81505, '2021-06-08 00:41:37', 'ADMIN', NULL, NULL, 124),
(1807, 'Sabanetas', 81506, '2021-06-08 00:41:50', 'ADMIN', NULL, NULL, 124),
(1808, 'San Carlos', 81507, '2021-06-08 00:41:57', 'ADMIN', NULL, NULL, 124),
(1809, 'San José del Naranjo', 81508, '2021-06-08 00:42:07', 'ADMIN', NULL, NULL, 124),
(1810, 'Santa Cruz', 81509, '2021-06-08 00:42:19', 'ADMIN', NULL, NULL, 124),
(1811, 'Saracarán', 81510, '2021-06-08 00:42:28', 'ADMIN', NULL, NULL, 124),
(1812, 'Sabanagrande', 81601, '2021-06-08 00:42:44', 'ADMIN', NULL, NULL, 125),
(1813, 'Apasinigua', 81602, '2021-06-08 00:42:56', 'ADMIN', NULL, NULL, 125),
(1814, 'Dulce Nombre', 81603, '2021-06-08 00:43:05', 'ADMIN', NULL, NULL, 125),
(1815, 'El Calvario N.1', 81604, '2021-06-08 00:43:18', 'ADMIN', NULL, NULL, 125),
(1816, 'El Calvario N.2', 81605, '2021-06-08 00:43:29', 'ADMIN', NULL, NULL, 125),
(1817, 'El Carrizal', 81606, '2021-06-08 00:43:52', 'ADMIN', NULL, NULL, 125),
(1818, 'El Divisadero', 81607, '2021-06-08 00:44:09', 'ADMIN', NULL, NULL, 125),
(1819, 'El Vino', 81608, '2021-06-08 00:44:19', 'ADMIN', NULL, NULL, 125),
(1820, 'La Ceiba', 81609, '2021-06-08 00:44:27', 'ADMIN', NULL, NULL, 125),
(1821, 'La Trinidad', 81610, '2021-06-08 00:44:39', 'ADMIN', NULL, NULL, 125),
(1822, 'Los Nanzales', 81611, '2021-06-08 00:44:52', 'ADMIN', NULL, NULL, 125),
(1823, 'Sacahuato', 81612, '2021-06-08 00:45:04', 'ADMIN', NULL, NULL, 125),
(1824, 'San Antonio', 81613, '2021-06-08 00:45:15', 'ADMIN', NULL, NULL, 125),
(1825, 'San Nicol o El Zapote', 81614, '2021-06-08 00:45:26', 'ADMIN', NULL, NULL, 125),
(1826, 'San Antonio de Oriente', 81701, '2021-06-08 00:46:07', 'ADMIN', NULL, NULL, 126),
(1827, 'El Jicarito', 81702, '2021-06-08 00:46:43', 'ADMIN', NULL, NULL, 126),
(1828, 'El Limón', 81703, '2021-06-08 00:46:54', 'ADMIN', NULL, NULL, 126),
(1829, 'Hoya Grande', 81704, '2021-06-08 00:47:06', 'ADMIN', NULL, NULL, 126),
(1830, 'La Ciénega', 81705, '2021-06-08 00:47:19', 'ADMIN', NULL, NULL, 126),
(1831, 'Las Mesas', 81706, '2021-06-08 00:47:30', 'ADMIN', NULL, NULL, 126),
(1832, 'Las Playas', 81707, '2021-06-08 00:47:40', 'ADMIN', NULL, NULL, 126),
(1833, 'Los Ranchos de Flor Azul', 81708, '2021-06-08 00:47:53', 'ADMIN', NULL, NULL, 126),
(1834, 'San Francisco', 81710, '2021-06-08 00:48:58', 'ADMIN', NULL, NULL, 126),
(1835, 'Santa Inés', 81711, '2021-06-08 00:49:10', 'ADMIN', NULL, NULL, 126),
(1836, 'S.O.S. (Aldeas)', 81712, '2021-06-08 00:49:31', 'ADMIN', NULL, NULL, 126),
(1837, 'Tabla Grande', 81713, '2021-06-08 00:49:44', 'ADMIN', NULL, NULL, 126),
(1838, 'San Buenaventura', 81801, '2021-06-08 00:50:06', 'ADMIN', NULL, NULL, 127),
(1839, 'El Calvario', 81802, '2021-06-08 00:50:18', 'ADMIN', NULL, NULL, 127),
(1840, 'El Ciruelo', 81803, '2021-06-08 00:50:31', 'ADMIN', NULL, NULL, 127),
(1841, 'El Horno', 81804, '2021-06-08 00:50:38', 'ADMIN', NULL, NULL, 127),
(1842, 'San Ignacio', 81901, '2021-06-08 00:51:05', 'ADMIN', NULL, NULL, 128),
(1843, 'El Escano de Tepate', 81902, '2021-06-08 00:51:19', 'ADMIN', NULL, NULL, 128),
(1844, 'El Naranjal', 81903, '2021-06-08 00:51:38', 'ADMIN', NULL, NULL, 128),
(1845, 'El Portillo de Siate', 81904, '2021-06-08 00:51:51', 'ADMIN', NULL, NULL, 128),
(1846, 'San Miguel de Barrosa', 81905, '2021-06-08 00:52:03', 'ADMIN', NULL, NULL, 128),
(1847, 'Urrutia', 81906, '2021-06-08 00:52:15', 'ADMIN', NULL, NULL, 128),
(1848, 'Yoculateca', 81907, '2021-06-08 00:52:24', 'ADMIN', NULL, NULL, 128),
(1849, 'San Juan de Flores', 82001, '2021-06-08 00:52:44', 'ADMIN', NULL, NULL, 129),
(1850, 'Cerro Bonito', 82002, '2021-06-08 00:52:56', 'ADMIN', NULL, NULL, 129),
(1851, 'Cofradia', 82003, '2021-06-08 00:53:17', 'ADMIN', NULL, NULL, 129),
(1852, 'Chandala', 82004, '2021-06-08 00:53:26', 'ADMIN', NULL, NULL, 129),
(1853, 'El Carbón', 82005, '2021-06-08 00:53:37', 'ADMIN', NULL, NULL, 129),
(1854, 'El Jicarito', 82006, '2021-06-08 00:54:24', 'ADMIN', NULL, NULL, 129),
(1855, 'El Ocote', 82007, '2021-06-08 00:54:32', 'ADMIN', NULL, NULL, 129),
(1856, 'El Zarzal', 82008, '2021-06-08 00:54:40', 'ADMIN', NULL, NULL, 129),
(1857, 'El Zurzular', 82009, '2021-06-08 00:54:50', 'ADMIN', NULL, NULL, 129),
(1858, 'Joyas de Carbalto', 82010, '2021-06-08 00:55:04', 'ADMIN', NULL, NULL, 129),
(1859, 'La Cruz o Suyapa', 82011, '2021-06-08 00:55:16', 'ADMIN', NULL, NULL, 129),
(1860, 'Las Delicias', 82012, '2021-06-08 00:55:27', 'ADMIN', NULL, NULL, 129),
(1861, 'Marcos', 82013, '2021-06-08 00:55:38', 'ADMIN', NULL, NULL, 129),
(1862, 'Miravalle', 82014, '2021-06-08 00:55:45', 'ADMIN', NULL, NULL, 129),
(1863, 'Pacayas', 82015, '2021-06-08 00:55:53', 'ADMIN', NULL, NULL, 129),
(1864, 'Pajarillos', 82016, '2021-06-08 00:56:05', 'ADMIN', NULL, NULL, 129),
(1865, 'San José de Ramos', 82017, '2021-06-08 00:56:15', 'ADMIN', NULL, NULL, 129),
(1866, 'San Luis', 82018, '2021-06-08 00:56:25', 'ADMIN', NULL, NULL, 129),
(1867, 'Sicaguara', 82019, '2021-06-08 00:56:39', 'ADMIN', NULL, NULL, 129),
(1868, 'Yamaguare', 82020, '2021-06-08 00:56:51', 'ADMIN', NULL, NULL, 129),
(1869, 'San Miguelito', 82101, '2021-06-08 00:57:13', 'ADMIN', NULL, NULL, 130),
(1870, 'El Hato', 82102, '2021-06-08 00:57:24', 'ADMIN', NULL, NULL, 130),
(1871, 'Santa Marta', 82103, '2021-06-08 00:57:34', 'ADMIN', NULL, NULL, 130),
(1872, 'Santa Ana', 82201, '2021-06-08 00:57:55', 'ADMIN', NULL, NULL, 131),
(1873, 'Cicatacare', 82202, '2021-06-08 00:58:21', 'ADMIN', NULL, NULL, 131),
(1874, 'El Limón', 82203, '2021-06-08 00:58:32', 'ADMIN', NULL, NULL, 131),
(1875, 'La Bodega', 82204, '2021-06-08 00:58:45', 'ADMIN', NULL, NULL, 131),
(1876, 'Nueva Arcadia', 82205, '2021-06-08 00:59:35', 'ADMIN', NULL, NULL, 131),
(1877, 'San isidro de Hisopo', 82206, '2021-06-08 00:59:48', 'ADMIN', NULL, NULL, 131),
(1878, 'Santa Lucía', 82301, '2021-06-08 01:00:05', 'ADMIN', NULL, NULL, 132),
(1879, 'El Chimbo', 82302, '2021-06-08 01:00:16', 'ADMIN', NULL, NULL, 132),
(1880, 'El Edén', 82303, '2021-06-08 01:00:24', 'ADMIN', NULL, NULL, 132),
(1881, 'El Piliguín', 82304, '2021-06-08 01:00:39', 'ADMIN', NULL, NULL, 132),
(1882, 'Montaña Grande o de Los Lagos', 82305, '2021-06-08 01:01:01', 'ADMIN', NULL, NULL, 132),
(1883, 'Zarabanda', 82306, '2021-06-08 01:01:12', 'ADMIN', NULL, NULL, 132),
(1884, 'Talanga', 82401, '2021-06-08 01:01:20', 'ADMIN', NULL, NULL, 133),
(1885, 'Agua Blanca', 82402, '2021-06-08 01:01:28', 'ADMIN', NULL, NULL, 133),
(1886, 'Corralitos', 82403, '2021-06-08 01:04:26', 'ADMIN', NULL, NULL, 133),
(1887, 'El Ocotal', 82404, '2021-06-08 01:04:35', 'ADMIN', NULL, NULL, 133),
(1888, 'El Rosario o Laja Picada', 82405, '2021-06-08 01:04:51', 'ADMIN', NULL, NULL, 133),
(1889, 'Jalaca', 82406, '2021-06-08 01:05:04', 'ADMIN', NULL, NULL, 133),
(1890, 'La Ermita', 82407, '2021-06-08 01:05:15', 'ADMIN', NULL, NULL, 133),
(1891, 'La Esperanza', 82408, '2021-06-08 01:05:24', 'ADMIN', NULL, NULL, 133),
(1892, 'La Labranza', 82409, '2021-06-08 01:05:34', 'ADMIN', NULL, NULL, 133),
(1893, 'La Majada Verde', 82410, '2021-06-08 01:05:45', 'ADMIN', NULL, NULL, 133),
(1894, 'Las Quebradas', 82411, '2021-06-08 01:06:00', 'ADMIN', NULL, NULL, 133),
(1895, 'Los Charcos', 82412, '2021-06-08 01:06:11', 'ADMIN', NULL, NULL, 133),
(1896, 'Palmira', 82413, '2021-06-08 01:06:19', 'ADMIN', NULL, NULL, 133),
(1897, 'Rio Dulce', 82414, '2021-06-08 01:06:27', 'ADMIN', NULL, NULL, 133),
(1898, 'San Antonio de Pastos', 82415, '2021-06-08 01:06:39', 'ADMIN', NULL, NULL, 133),
(1899, 'Valle Arriba', 82416, '2021-06-08 01:06:53', 'ADMIN', NULL, NULL, 133),
(1900, 'Tatumbla', 82501, '2021-06-08 01:07:19', 'ADMIN', NULL, NULL, 134),
(1901, 'Crofradia', 82502, '2021-06-08 01:07:30', 'ADMIN', NULL, NULL, 134),
(1902, 'Cuesta Grande', 82503, '2021-06-08 01:07:41', 'ADMIN', NULL, NULL, 134),
(1903, 'La Lima', 82504, '2021-06-08 01:07:51', 'ADMIN', NULL, NULL, 134),
(1904, 'La Unión', 82505, '2021-06-08 01:08:03', 'ADMIN', NULL, NULL, 134),
(1905, 'Linaca', 82506, '2021-06-08 01:08:18', 'ADMIN', NULL, NULL, 134),
(1906, 'Valle de Angeles', 82601, '2021-06-08 01:08:33', 'ADMIN', NULL, NULL, 135),
(1907, 'Cerro Grande', 82602, '2021-06-08 01:08:52', 'ADMIN', NULL, NULL, 135),
(1908, 'El Guanacaste', 82603, '2021-06-08 01:09:02', 'ADMIN', NULL, NULL, 135),
(1909, 'El Liquidámbar', 82604, '2021-06-08 01:09:14', 'ADMIN', NULL, NULL, 135),
(1910, 'La Sabaneta', 82605, '2021-06-08 01:09:27', 'ADMIN', NULL, NULL, 135),
(1911, 'Las Cañadas', 82606, '2021-06-08 01:09:38', 'ADMIN', NULL, NULL, 135),
(1912, 'Rio Abajo o Playas', 82607, '2021-06-08 01:09:52', 'ADMIN', NULL, NULL, 135),
(1913, 'Villa de San Francisco', 82701, '2021-06-08 01:10:21', 'ADMIN', NULL, NULL, 136),
(1914, 'El Coyolito', 82702, '2021-06-08 01:10:35', 'ADMIN', NULL, NULL, 136),
(1915, 'El Hato', 82703, '2021-06-08 01:10:44', 'ADMIN', NULL, NULL, 136),
(1916, 'El Pedregal', 82704, '2021-06-08 01:10:53', 'ADMIN', NULL, NULL, 136),
(1917, 'Guarumas', 82705, '2021-06-08 01:11:08', 'ADMIN', NULL, NULL, 136),
(1918, 'Vallecillo', 82801, '2021-06-08 01:11:24', 'ADMIN', NULL, NULL, 137),
(1919, 'Trinidad de Quebradas', 82802, '2021-06-08 01:11:39', 'ADMIN', NULL, NULL, 137);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_alumnos_himno`
--

CREATE TABLE `tbl_alumnos_himno` (
  `Id_himno` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `id_horario_himno` bigint(20) NOT NULL,
  `aprobado` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha_creacion` datetime NOT NULL,
  `entregado` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_alumnos_himno`
--

INSERT INTO `tbl_alumnos_himno` (`Id_himno`, `id_persona`, `id_horario_himno`, `aprobado`, `Fecha_creacion`, `entregado`) VALUES
(18, 6, 12, 'desaprobado', '2020-10-19 19:09:14', NULL),
(19, 6, 13, 'aprobado', '2020-10-26 16:55:49', NULL),
(20, 3, 12, 'desaprobado', '2020-10-22 20:05:22', NULL),
(21, 3, 13, 'desaprobado', '2020-10-22 20:07:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_areas`
--

CREATE TABLE `tbl_areas` (
  `id_area` bigint(20) NOT NULL,
  `area` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `Fecha_creacion` time DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` time DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL,
  `id_carrera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_areas`
--

INSERT INTO `tbl_areas` (`id_area`, `area`, `descripcion`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`, `id_carrera`) VALUES
(7, 'DISEÑO', 'DISEÑO', '16:42:22', 'ADMIN', '16:42:26', 'ADMIN', 1),
(8, 'PROGRAMACIONN', 'PROGRAMACIONN', '16:42:57', 'ADMIN', '16:43:02', 'ADMIN', 1),
(10, 'SDSD', 'SDSD', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_asignaturas`
--

CREATE TABLE `tbl_asignaturas` (
  `Id_asignatura` bigint(20) NOT NULL,
  `asignatura` varchar(255) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `uv` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_tipo_asignatura` bigint(20) DEFAULT NULL,
  `id_area` bigint(20) DEFAULT NULL,
  `id_plan_estudio` bigint(20) DEFAULT NULL,
  `id_periodo_plan` bigint(20) DEFAULT NULL,
  `equivalencias` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_asignaturas`
--

INSERT INTO `tbl_asignaturas` (`Id_asignatura`, `asignatura`, `codigo`, `uv`, `estado`, `id_tipo_asignatura`, `id_area`, `id_plan_estudio`, `id_periodo_plan`, `equivalencias`) VALUES
(9, 'TALLER DE HARDWARE I', 'TA-111', 4, 0, 1, 7, 1, 1, 'cosas'),
(10, 'METODOLOGIA DE LA PROGRAMACION', 'IA-033', 4, 0, 1, 7, 1, NULL, NULL),
(11, 'INTRODUCCION A LA INFORMATICA', 'IA-012', 4, 0, 1, 7, 1, NULL, NULL),
(16, 'LENGUAJE DE PROGRAMACION I', 'IA-044', 4, 0, 1, 8, 2, NULL, NULL),
(19, 'TALLER DE HARDWARE II', 'IA-054', 4, 0, 1, 8, 2, NULL, NULL),
(20, 'LENGUAJE DE PROGRAMACION III', 'IA-118', 4, 0, 1, NULL, NULL, NULL, NULL),
(21, 'LENGUAJE DE PROGRAMACION II', 'IA-150', 4, 0, 1, NULL, NULL, NULL, NULL),
(22, 'SISTEMAS OPERATIVOS I', 'IA-075', 4, 0, 1, NULL, NULL, NULL, NULL),
(24, 'ANALISIS NUMERICO', 'IA-222', 5, 0, 1, 8, 1, 1, NULL),
(26, 'PERSPECTIVAS DE LA TECNOLOGIA INFORMATICA', 'IA-112', 4, 0, 1, NULL, NULL, NULL, NULL),
(27, 'SISTEMAS OPERATIVOS II', 'IA-096', 4, 0, 1, NULL, NULL, NULL, NULL),
(29, 'BASE DE DATOS I', 'IA-106', 4, 0, 1, NULL, NULL, NULL, NULL),
(31, 'LENGUAJE DE PROGRAMACION IV', 'IA-150', 4, 0, 1, NULL, NULL, NULL, NULL),
(32, 'TEORIA DE SISTEMAS', 'IA-127', 4, 0, 1, NULL, NULL, NULL, NULL),
(33, 'BASE DE DATOS II', 'IA-137', 4, 0, 1, 7, 1, 2, NULL),
(36, 'COMUNICACION ELECTRONICA DE DATOS', 'IA-148', 4, 0, 1, NULL, NULL, NULL, NULL),
(37, 'ANALISIS Y DISEÑO DE SISTEMAS', 'IA-158', 4, 0, 1, NULL, NULL, NULL, NULL),
(38, 'RECURSOS HUMANOS EN INFORMATICA', 'IA-168', 4, 0, 1, NULL, NULL, NULL, NULL),
(40, 'REDES DE COMPUTADORAS', 'IA-179', 4, 0, 1, NULL, NULL, NULL, NULL),
(41, 'PROGRAMACION E IMPLEMENTACION DE SISTEMAS', 'IA-153', 4, 0, 1, NULL, NULL, NULL, NULL),
(42, 'ADMINISTRACION PUBLICA Y POLITICA INFORMATICA', 'IA-199', 4, 0, 1, NULL, 2, 1, 'cosasq\r\n'),
(44, 'ORGANIZACION Y METODOS DE LA INFORMATICA', 'IA-200', 4, 0, 1, NULL, NULL, NULL, NULL),
(45, 'GERENCIA EN INFORMATICA I', 'IA-210', 4, 0, 1, NULL, NULL, NULL, NULL),
(46, 'EVALUACION DE SISTEMAS', 'IA-220', 4, 0, 1, NULL, NULL, NULL, NULL),
(48, 'PERSPECTIVA DE LA TECNOLOGIA INFORMATICA', 'IA-231', 3, 0, 1, NULL, NULL, NULL, NULL),
(49, 'AUDITORIA EN INFORMATICA', 'IA-241', 4, 0, 1, NULL, NULL, NULL, NULL),
(50, 'GERENCIA EN INFORMATICA II', 'IA-251', 4, 0, 1, NULL, NULL, NULL, NULL),
(51, 'SEMINARIO DE INVESTIGACION', 'IA-271', 4, 0, 1, NULL, NULL, NULL, NULL),
(52, 'ADMON Y EVALUACION DE PROYECTOS EN INFORMATICA', 'IA-261', 4, 0, 1, NULL, NULL, NULL, NULL),
(53, 'COMERCIO ELECTRONICO', 'IA-1778', 4, 0, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_asignaturas_aprobadas`
--

CREATE TABLE `tbl_asignaturas_aprobadas` (
  `Id_asignatura_aprobada` bigint(20) NOT NULL,
  `Id_asignatura` bigint(20) NOT NULL DEFAULT '0',
  `id_persona` bigint(20) NOT NULL DEFAULT '0',
  `Fecha_creacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_asignaturas_aprobadas`
--

INSERT INTO `tbl_asignaturas_aprobadas` (`Id_asignatura_aprobada`, `Id_asignatura`, `id_persona`, `Fecha_creacion`) VALUES
(1, 27, 27, '2021-03-24 18:26:18'),
(2, 52, 27, '2021-03-24 18:26:19'),
(3, 24, 27, '2021-03-24 18:26:20'),
(4, 22, 22, '2021-03-24 18:46:52'),
(5, 27, 22, '2021-03-24 18:46:53'),
(6, 9, 22, '2021-03-24 18:46:54'),
(7, 19, 22, '2021-03-24 18:46:55'),
(8, 32, 22, '2021-03-24 18:46:57'),
(10, 52, 22, '2021-03-25 05:36:52'),
(11, 52, 27, '2021-03-25 05:48:29'),
(12, 42, 27, '2021-03-25 05:50:28'),
(13, 37, 22, '2021-03-25 05:53:26'),
(14, 49, 27, '2021-03-25 05:56:56'),
(15, 42, 26, '2021-03-26 20:24:49'),
(16, 52, 26, '2021-03-26 20:24:50'),
(17, 24, 26, '2021-03-26 20:24:51'),
(18, 37, 26, '2021-03-26 20:24:52'),
(19, 49, 26, '2021-03-26 20:24:55'),
(20, 29, 26, '2021-03-26 20:24:57'),
(21, 33, 26, '2021-03-26 20:24:58'),
(22, 36, 26, '2021-03-26 20:25:00'),
(23, 46, 26, '2021-03-26 20:25:01'),
(24, 37, 27, '2021-03-26 20:28:02'),
(25, 33, 27, '2021-03-26 20:28:06'),
(26, 36, 27, '2021-03-26 20:28:09'),
(27, 46, 27, '2021-03-26 20:28:13'),
(28, 45, 27, '2021-03-26 20:28:17'),
(29, 50, 27, '2021-03-26 20:28:18'),
(30, 11, 27, '2021-03-26 20:28:21'),
(31, 16, 27, '2021-03-26 20:28:25'),
(32, 21, 27, '2021-03-26 20:28:27'),
(33, 42, 22, '2021-03-26 20:30:06'),
(34, 24, 22, '2021-03-26 20:30:07'),
(35, 49, 22, '2021-03-26 20:30:09'),
(36, 29, 22, '2021-03-26 20:30:10'),
(37, 33, 22, '2021-03-26 20:30:11'),
(38, 42, 61, '2021-03-26 23:40:25'),
(39, 52, 61, '2021-03-26 23:40:26'),
(40, 24, 61, '2021-03-26 23:40:27'),
(41, 37, 61, '2021-03-26 23:40:28'),
(42, 49, 61, '2021-03-26 23:40:30'),
(43, 29, 61, '2021-03-26 23:40:31'),
(44, 33, 61, '2021-03-26 23:40:32'),
(45, 36, 61, '2021-03-26 23:40:33'),
(46, 46, 61, '2021-03-26 23:40:34'),
(47, 45, 61, '2021-03-26 23:40:35'),
(48, 50, 61, '2021-03-26 23:40:36'),
(49, 22, 61, '2021-03-26 23:43:12'),
(50, 27, 61, '2021-03-26 23:43:13'),
(51, 9, 61, '2021-03-26 23:43:14'),
(52, 19, 61, '2021-03-26 23:43:16'),
(53, 32, 61, '2021-03-26 23:43:17'),
(54, 42, 77, '2021-04-14 02:15:29'),
(55, 52, 77, '2021-04-14 02:15:29'),
(56, 24, 77, '2021-04-14 02:15:29'),
(57, 37, 77, '2021-04-14 02:15:29'),
(58, 49, 77, '2021-04-14 02:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_atributos`
--

CREATE TABLE `tbl_atributos` (
  `id_atributos` int(11) NOT NULL,
  `atributo` varchar(50) NOT NULL,
  `requerido` varchar(50) NOT NULL,
  `id_tipo_persona` int(11) NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_atributos`
--

INSERT INTO `tbl_atributos` (`id_atributos`, `atributo`, `requerido`, `id_tipo_persona`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'numero_empleado', '1', 1, NULL, NULL, NULL, NULL),
(3, 'fecha_ingreso', '1', 1, NULL, NULL, NULL, NULL),
(8, 'curriculum', '1', 1, NULL, NULL, NULL, NULL),
(11, 'foto', '1', 1, NULL, NULL, NULL, NULL),
(12, 'numero_cuenta', '1', 2, NULL, NULL, NULL, NULL),
(14, 'SUED', '1', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_aula`
--

CREATE TABLE `tbl_aula` (
  `id_aula` bigint(20) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `id_edificio` bigint(20) DEFAULT NULL,
  `id_tipo_aula` bigint(20) DEFAULT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` date DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_aula`
--

INSERT INTO `tbl_aula` (`id_aula`, `codigo`, `descripcion`, `capacidad`, `id_edificio`, `id_tipo_aula`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(7, '100', 'INSERT', 200, 6, 2, NULL, NULL, '2021-06-02', 'ADMIN'),
(8, '100', 'inserto', 80, 6, 1, NULL, NULL, NULL, NULL),
(9, '201', 'aula', 50, 2, 2, NULL, NULL, NULL, NULL),
(11, '404', 'AULA', 35, 6, 2, NULL, NULL, NULL, NULL),
(14, '500', 'PRUEBAS', 20, 7, 1, '2021-04-08', 'ADMIN', '2021-04-13', 'ADMIN'),
(16, '346', 'AULA', 400, 6, 2, '2021-04-08', 'ADMIN', '2021-04-08', 'ADMIN'),
(17, '203', 'AULA ', 45, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(18, '205', 'AULA', 50, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(19, '302', 'AULA', 50, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(20, '303', 'AULA', 50, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(21, '304', 'AULA', 45, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(22, '305', 'AULA', 50, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(23, '306', 'AULA', 40, 7, 2, '2021-04-09', 'ADMIN', '2021-04-13', 'ADMIN'),
(24, '200', 'AULA', 55, 1, 2, '2021-04-09', 'ADMIN', '2021-04-16', 'ADMIN'),
(25, '308', 'AULA', 35, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(26, '401', 'AULA', 46, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(27, '402', 'AULA', 52, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(28, '408', 'AULA', 45, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(29, '409', 'AULA', 50, 1, 2, '2021-04-09', 'ADMIN', NULL, NULL),
(30, '410', 'AULA', 40, 2, 2, '2021-04-09', 'ADMIN', '2021-04-16', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `Id_bitacora` bigint(20) NOT NULL,
  `Id_usuario` bigint(20) NOT NULL,
  `Id_objeto` bigint(20) NOT NULL,
  `Fecha` varchar(255) NOT NULL,
  `Accion` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(1, 1, 2, '2021-06-17 11:34:46', 'Ingreso', 'A Gestion de Preguntas'),
(2, 1, 54, '2021-06-17 14:01:56', 'Ingreso', 'A Gestion de Roles'),
(3, 1, 8, '2021-06-17 14:02:38', 'Ingreso', 'A Bitacora del sistema'),
(4, 1, 57, '2021-06-18 11:44:40', 'Ingreso', 'A Mantenimiento Comisiones'),
(5, 1, 51, '2021-06-18 11:46:39', 'Ingreso', 'A gestion docentes'),
(6, 1, 8, '2021-06-18 11:51:13', 'Ingreso', 'A Bitacora del sistema'),
(7, 1, 51, '2021-06-18 11:51:45', 'Ingreso', 'mantenimiento reunion/acta'),
(8, 1, 8, '2021-06-18 11:51:56', 'Ingreso', 'A Bitacora del sistema'),
(9, 1, 8, '2021-06-18 11:54:04', 'Ingreso', 'A Bitacora del sistema'),
(10, 1, 8, '2021-06-18 11:54:15', 'Ingreso', 'A Bitacora del sistema'),
(11, 1, 8, '2021-06-18 11:54:35', 'Ingreso', 'mantenimiento reunion/acta'),
(12, 1, 8, '2021-06-18 11:54:44', 'Ingreso', 'A Bitacora del sistema'),
(13, 1, 8, '2021-06-18 18:23:39', 'Ingreso', 'mantenimiento reunion/acta'),
(14, 1, 8, '2021-06-18 18:24:02', 'Ingreso', 'mantenimiento reunion/acta'),
(15, 1, 8, '2021-06-19 12:33:32', 'Ingreso', 'mantenimiento reunion/acta'),
(16, 1, 8, '2021-06-19 12:33:38', 'Ingreso', 'mantenimiento reunion/acta'),
(17, 1, 8, '2021-06-19 12:33:51', 'Ingreso', 'mantenimiento reunion/acta'),
(18, 1, 8, '2021-06-19 12:43:46', 'Ingreso', 'mantenimiento reunion/acta'),
(19, 1, 8, '2021-06-19 12:44:42', 'Ingreso', 'mantenimiento reunion/acta'),
(20, 1, 8, '2021-06-19 12:44:46', 'Ingreso', 'mantenimiento reunion/acta'),
(21, 1, 51, '2021-06-19 14:32:15', 'Ingreso', 'A gestion docentes'),
(24, 1, 156, '2021-06-19 17:58:31', 'Ingreso', 'A Mantenimiento Estado Acta'),
(25, 1, 158, '2021-06-19 17:58:45', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(26, 1, 158, '2021-06-19 17:58:48', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(27, 1, 156, '2021-06-19 17:58:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(28, 1, 156, '2021-06-19 17:58:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(29, 1, 156, '2021-06-19 17:59:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(30, 1, 146, '2021-06-19 17:59:47', 'Ingreso', 'A crear Reunion'),
(31, 1, 146, '2021-06-19 17:59:49', 'Ingreso', 'A crear Reunion'),
(32, 1, 156, '2021-06-19 18:02:04', 'Ingreso', 'A Mantenimiento Estado Acta'),
(33, 1, 157, '2021-06-19 18:03:25', 'Ingreso', 'A Mantenimiento Estado Acta'),
(34, 1, 157, '2021-06-19 18:03:27', 'Ingreso', 'A Mantenimiento Estado Acta'),
(35, 1, 156, '2021-06-19 18:03:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(36, 1, 156, '2021-06-19 18:03:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(37, 1, 156, '2021-06-19 18:03:39', 'Ingreso', 'A Mantenimiento Estado Acta'),
(38, 1, 156, '2021-06-19 18:05:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(39, 1, 156, '2021-06-19 18:05:44', 'Ingreso', 'A Mantenimiento Estado Acta'),
(40, 1, 146, '2021-06-19 18:06:16', 'Ingreso', 'A crear Reunion'),
(41, 1, 160, '2021-06-19 18:06:45', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(42, 1, 66, '2021-06-19 18:06:45', 'Ingreso', 'A Mantenimiento/Crear Categoría'),
(43, 1, 159, '2021-06-19 18:06:48', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(44, 1, 158, '2021-06-19 18:06:49', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(45, 1, 157, '2021-06-19 18:06:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(46, 1, 156, '2021-06-19 18:06:52', 'Ingreso', 'A Mantenimiento Estado Acta'),
(47, 1, 156, '2021-06-19 18:06:58', 'Ingreso', 'A Mantenimiento Estado Acta'),
(48, 1, 156, '2021-06-19 18:10:19', 'Ingreso', 'A Mantenimiento Estado Acta'),
(49, 1, 2, '2021-06-19 18:10:30', 'Ingreso', 'A Gestion de Preguntas'),
(50, 1, 3, '2021-06-19 18:10:47', 'Ingreso', 'A Crear Usuarios'),
(51, 1, 160, '2021-06-19 18:12:29', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(52, 1, 66, '2021-06-19 18:12:29', 'Ingreso', 'A Mantenimiento/Crear Categoría'),
(53, 1, 8, '2021-06-19 18:15:33', 'Ingreso', 'mantenimiento reunion/acta'),
(54, 1, 8, '2021-06-19 18:15:40', 'Ingreso', 'mantenimiento reunion/acta'),
(55, 1, 8, '2021-06-19 18:15:49', 'Ingreso', 'mantenimiento reunion/acta'),
(56, 1, 8, '2021-06-19 18:15:55', 'Ingreso', 'mantenimiento reunion/acta'),
(57, 1, 9, '2021-06-19 18:32:12', 'Ingreso', 'A Permisos a roles y pantallas'),
(58, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Control Actas'),
(59, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Agendar Reunion '),
(60, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Reunion Pendiente '),
(61, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Lista Reunion '),
(62, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Acta Pendiente '),
(63, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Lista Actas Menu'),
(64, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Mantenimiento Tipo Reunion '),
(65, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Mantenimiento Estado Acta '),
(66, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Mantenimiento Estado Reunión'),
(67, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Mantenimiento Estado Acuerdo'),
(68, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Mantenimiento Estado Notificación'),
(69, 1, 8, '2021-06-19 18:33:16', 'INSERTO', 'EL PERMISO Mantenimiento Estado Participante'),
(70, 1, 9, '2021-06-19 18:33:16', 'Ingreso', 'A Permisos a roles y pantallas'),
(71, 1, 156, '2021-06-19 18:33:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(72, 1, 156, '2021-06-19 18:33:30', 'Ingreso', 'A Mantenimiento Estado Acta'),
(73, 1, 156, '2021-06-19 18:33:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(74, 1, 9, '2021-06-19 18:39:05', 'Ingreso', 'A Permisos a roles y pantallas'),
(75, 1, 10, '2021-06-19 18:39:47', 'Ingreso', 'A Gestion de permisos usuarios'),
(76, 1, 10, '2021-06-19 18:40:13', 'Ingreso', 'A Gestion de permisos usuarios'),
(77, 1, 10, '2021-06-19 18:40:20', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(78, 1, 10, '2021-06-19 18:40:20', 'Ingreso', 'A Gestion de permisos usuarios'),
(79, 1, 156, '2021-06-19 18:40:28', 'Ingreso', 'A Mantenimiento Estado Acta'),
(80, 1, 10, '2021-06-19 18:40:48', 'Ingreso', 'A Gestion de permisos usuarios'),
(81, 1, 10, '2021-06-19 18:40:56', 'Ingreso', 'A Gestion de permisos usuarios'),
(82, 1, 10, '2021-06-19 18:41:01', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(83, 1, 10, '2021-06-19 18:41:01', 'Ingreso', 'A Gestion de permisos usuarios'),
(84, 1, 156, '2021-06-19 18:41:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(85, 1, 10, '2021-06-19 18:42:16', 'Ingreso', 'A Gestion de permisos usuarios'),
(86, 1, 10, '2021-06-19 18:42:29', 'Ingreso', 'A Gestion de permisos usuarios'),
(87, 1, 10, '2021-06-19 18:42:39', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(88, 1, 10, '2021-06-19 18:42:39', 'Ingreso', 'A Gestion de permisos usuarios'),
(89, 1, 156, '2021-06-19 18:42:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(90, 1, 10, '2021-06-19 18:43:02', 'Ingreso', 'A Gestion de permisos usuarios'),
(91, 1, 10, '2021-06-19 18:43:09', 'Ingreso', 'A Gestion de permisos usuarios'),
(92, 1, 10, '2021-06-19 18:43:14', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO '),
(93, 1, 10, '2021-06-19 18:43:14', 'Ingreso', 'A Gestion de permisos usuarios'),
(94, 1, 156, '2021-06-19 18:43:23', 'Ingreso', 'A Mantenimiento Estado Acta'),
(95, 1, 156, '2021-06-19 18:43:25', 'Ingreso', 'A Mantenimiento Estado Acta'),
(96, 1, 10, '2021-06-19 18:46:14', 'Ingreso', 'A Gestion de permisos usuarios'),
(97, 1, 10, '2021-06-19 18:46:22', 'Ingreso', 'A Gestion de permisos usuarios'),
(98, 1, 157, '2021-06-19 18:46:31', 'Ingreso', 'A Mantenimiento Estado Acta'),
(99, 1, 157, '2021-06-19 18:46:39', 'Ingreso', 'A Mantenimiento Estado Acta'),
(100, 1, 157, '2021-06-19 18:46:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(101, 1, 146, '2021-06-19 18:49:26', 'Ingreso', 'A crear Reunion'),
(102, 1, 8, '2021-06-19 19:04:21', 'Ingreso', 'mantenimiento reunion/acta'),
(103, 1, 10, '2021-06-19 19:04:26', 'Ingreso', 'A Gestion de permisos usuarios'),
(104, 1, 156, '2021-06-19 19:07:29', 'Ingreso', 'A Mantenimiento Estado Acta'),
(105, 1, 10, '2021-06-19 19:08:35', 'Ingreso', 'A Gestion de permisos usuarios'),
(106, 1, 10, '2021-06-19 19:08:45', 'Ingreso', 'A Gestion de permisos usuarios'),
(107, 1, 10, '2021-06-19 19:08:49', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO '),
(108, 1, 10, '2021-06-19 19:08:49', 'Ingreso', 'A Gestion de permisos usuarios'),
(109, 1, 156, '2021-06-19 19:08:55', 'Ingreso', 'A Mantenimiento Estado Acta'),
(110, 1, 10, '2021-06-19 19:09:04', 'Ingreso', 'A Gestion de permisos usuarios'),
(111, 1, 10, '2021-06-19 19:09:28', 'Ingreso', 'A Gestion de permisos usuarios'),
(112, 1, 10, '2021-06-19 19:09:32', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(113, 1, 10, '2021-06-19 19:09:32', 'Ingreso', 'A Gestion de permisos usuarios'),
(114, 1, 156, '2021-06-19 19:09:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(115, 1, 156, '2021-06-19 19:13:44', 'Ingreso', 'A Mantenimiento Estado Acta'),
(116, 1, 146, '2021-06-19 19:55:11', 'Ingreso', 'A crear Reunion'),
(117, 1, 156, '2021-06-20 15:31:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(118, 1, 156, '2021-06-20 15:44:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(119, 1, 156, '2021-06-20 15:45:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(120, 1, 156, '2021-06-20 15:52:27', 'Ingreso', 'A Mantenimiento Estado Acta'),
(121, 1, 156, '2021-06-20 15:52:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(122, 1, 156, '2021-06-20 15:59:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(123, 1, 156, '2021-06-20 15:59:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(124, 1, 156, '2021-06-20 16:01:33', 'Ingreso', 'A Mantenimiento Estado Acta'),
(125, 1, 156, '2021-06-20 16:02:13', 'Ingreso', 'A Mantenimiento Estado Acta'),
(126, 1, 156, '2021-06-20 16:02:23', 'Ingreso', 'A Mantenimiento Estado Acta'),
(127, 1, 156, '2021-06-20 16:03:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(128, 1, 156, '2021-06-20 16:04:30', 'Ingreso', 'A Mantenimiento Estado Acta'),
(129, 1, 156, '2021-06-20 16:05:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(130, 1, 156, '2021-06-20 16:05:45', 'Ingreso', 'A Mantenimiento Estado Acta'),
(131, 1, 156, '2021-06-20 16:06:33', 'Ingreso', 'A Mantenimiento Estado Acta'),
(132, 1, 7, '2021-06-20 16:06:46', 'Ingreso', 'A Gestion de Parametros'),
(133, 1, 10, '2021-06-20 16:07:06', 'Ingreso', 'A Gestion de permisos usuarios'),
(134, 1, 10, '2021-06-20 16:07:13', 'Ingreso', 'A Gestion de permisos usuarios'),
(135, 1, 10, '2021-06-20 16:07:17', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(136, 1, 10, '2021-06-20 16:07:17', 'Ingreso', 'A Gestion de permisos usuarios'),
(137, 1, 156, '2021-06-20 16:07:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(138, 1, 156, '2021-06-20 16:08:33', 'Ingreso', 'A Mantenimiento Estado Acta'),
(139, 1, 156, '2021-06-20 16:21:25', 'Ingreso', 'A Mantenimiento Estado Acta'),
(140, 1, 157, '2021-06-20 16:22:06', 'Ingreso', 'A Mantenimiento Estado Acta'),
(141, 1, 157, '2021-06-20 16:22:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(142, 1, 157, '2021-06-20 16:23:55', 'Ingreso', 'A Mantenimiento Estado Acta'),
(143, 1, 157, '2021-06-20 16:24:05', 'Ingreso', 'A Mantenimiento Estado Acta'),
(144, 1, 156, '2021-06-20 16:24:13', 'Ingreso', 'A Mantenimiento Estado Acta'),
(145, 1, 156, '2021-06-20 16:29:20', 'Ingreso', 'A Mantenimiento Estado Acta'),
(146, 1, 156, '2021-06-20 16:30:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(147, 1, 157, '2021-06-20 16:44:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(148, 1, 146, '2021-06-20 16:48:05', 'Ingreso', 'A crear Reunion'),
(149, 1, 10, '2021-06-20 17:07:24', 'Ingreso', 'A Gestion de permisos usuarios'),
(150, 1, 10, '2021-06-20 17:07:36', 'Ingreso', 'A Gestion de permisos usuarios'),
(151, 1, 10, '2021-06-20 17:07:44', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO '),
(152, 1, 10, '2021-06-20 17:07:44', 'Ingreso', 'A Gestion de permisos usuarios'),
(153, 1, 156, '2021-06-20 17:07:52', 'Ingreso', 'A Mantenimiento Estado Acta'),
(154, 1, 157, '2021-06-20 17:07:57', 'Ingreso', 'A Mantenimiento Estado Acta'),
(155, 1, 156, '2021-06-20 17:08:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(156, 1, 10, '2021-06-20 17:08:10', 'Ingreso', 'A Gestion de permisos usuarios'),
(157, 1, 10, '2021-06-20 17:08:23', 'Ingreso', 'A Gestion de permisos usuarios'),
(158, 1, 10, '2021-06-20 17:08:31', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(159, 1, 10, '2021-06-20 17:08:31', 'Ingreso', 'A Gestion de permisos usuarios'),
(160, 1, 156, '2021-06-20 17:08:39', 'Ingreso', 'A Mantenimiento Estado Acta'),
(161, 1, 156, '2021-06-20 17:08:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(162, 1, 10, '2021-06-20 17:09:04', 'Ingreso', 'A Gestion de permisos usuarios'),
(163, 1, 10, '2021-06-20 17:09:13', 'Ingreso', 'A Gestion de permisos usuarios'),
(164, 1, 10, '2021-06-20 17:09:16', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(165, 1, 10, '2021-06-20 17:09:16', 'Ingreso', 'A Gestion de permisos usuarios'),
(166, 1, 156, '2021-06-20 17:09:26', 'Ingreso', 'A Mantenimiento Estado Acta'),
(167, 1, 12, '2021-06-20 17:32:52', 'Ingreso', 'A Cambiar clave como usuario'),
(168, 1, 11, '2021-06-20 17:32:58', 'Ingreso', 'A Gestion de respuestas a preguntas de seguridad'),
(169, 1, 156, '2021-06-20 17:42:00', 'Ingreso', 'A Mantenimiento Estado Acta'),
(170, 1, 10, '2021-06-20 17:42:10', 'Ingreso', 'A Gestion de permisos usuarios'),
(171, 1, 10, '2021-06-20 17:42:21', 'Ingreso', 'A Gestion de permisos usuarios'),
(172, 1, 10, '2021-06-20 17:42:27', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO '),
(173, 1, 10, '2021-06-20 17:42:27', 'Ingreso', 'A Gestion de permisos usuarios'),
(174, 1, 157, '2021-06-20 17:42:37', 'Ingreso', 'A Mantenimiento Estado Acta'),
(175, 1, 156, '2021-06-20 17:42:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(176, 1, 10, '2021-06-20 17:42:51', 'Ingreso', 'A Gestion de permisos usuarios'),
(177, 1, 10, '2021-06-20 17:42:59', 'Ingreso', 'A Gestion de permisos usuarios'),
(178, 1, 10, '2021-06-20 17:43:07', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(179, 1, 10, '2021-06-20 17:43:07', 'Ingreso', 'A Gestion de permisos usuarios'),
(180, 1, 156, '2021-06-20 17:43:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(181, 1, 10, '2021-06-20 17:43:30', 'Ingreso', 'A Gestion de permisos usuarios'),
(182, 1, 10, '2021-06-20 17:43:37', 'Ingreso', 'A Gestion de permisos usuarios'),
(183, 1, 10, '2021-06-20 17:43:41', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(184, 1, 10, '2021-06-20 17:43:41', 'Ingreso', 'A Gestion de permisos usuarios'),
(185, 1, 156, '2021-06-20 17:43:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(186, 1, 156, '2021-06-20 17:43:53', 'Ingreso', 'A Mantenimiento Estado Acta'),
(187, 1, 156, '2021-06-20 17:44:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(188, 1, 157, '2021-06-20 17:44:26', 'Ingreso', 'A Mantenimiento Estado Acta'),
(189, 1, 156, '2021-06-20 17:44:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(190, 1, 158, '2021-06-20 17:45:55', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(191, 1, 157, '2021-06-20 17:46:12', 'Ingreso', 'A Mantenimiento Estado Acta'),
(192, 1, 10, '2021-06-20 17:46:19', 'Ingreso', 'A Gestion de permisos usuarios'),
(193, 1, 10, '2021-06-20 17:46:26', 'Ingreso', 'A Gestion de permisos usuarios'),
(194, 1, 10, '2021-06-20 17:46:29', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(195, 1, 10, '2021-06-20 17:46:29', 'Ingreso', 'A Gestion de permisos usuarios'),
(196, 1, 156, '2021-06-20 17:46:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(197, 1, 156, '2021-06-20 17:47:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(198, 1, 156, '2021-06-20 17:48:05', 'Ingreso', 'A Mantenimiento Estado Acta'),
(199, 1, 146, '2021-06-20 17:55:04', 'Ingreso', 'A crear Reunion'),
(200, 1, 160, '2021-06-21 10:02:45', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(201, 1, 66, '2021-06-21 10:02:45', 'Ingreso', 'A Mantenimiento/Crear Categoría'),
(202, 1, 160, '2021-06-21 10:02:54', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(203, 1, 66, '2021-06-21 10:02:54', 'Ingreso', 'A Mantenimiento/Crear Categoría'),
(204, 1, 161, '2021-06-21 10:02:57', 'Ingreso', 'A Mantenimiento Categorías'),
(205, 1, 161, '2021-06-21 10:03:34', 'Ingreso', 'A Mantenimiento Categorías'),
(206, 1, 157, '2021-06-21 10:07:07', 'Ingreso', 'A Mantenimiento Estado Acta'),
(207, 1, 157, '2021-06-21 10:07:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(208, 1, 157, '2021-06-21 10:07:23', 'Ingreso', 'A Mantenimiento Estado Acta'),
(209, 1, 157, '2021-06-21 10:07:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(210, 1, 160, '2021-06-21 10:09:05', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(211, 1, 66, '2021-06-21 10:09:05', 'Ingreso', 'A Mantenimiento/Crear Categoría'),
(212, 1, 158, '2021-06-21 10:15:26', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(213, 1, 159, '2021-06-21 10:15:29', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(214, 1, 156, '2021-06-21 10:15:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(215, 1, 156, '2021-06-21 12:18:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(216, 1, 156, '2021-06-21 12:20:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(217, 1, 156, '2021-06-21 12:24:10', 'Ingreso', 'A Mantenimiento Estado Acta'),
(218, 1, 157, '2021-06-21 12:24:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(219, 1, 156, '2021-06-21 12:26:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(220, 1, 156, '2021-06-21 12:27:44', 'Ingreso', 'A Mantenimiento Estado Acta'),
(221, 1, 156, '2021-06-21 12:27:59', 'Ingreso', 'A Mantenimiento Estado Acta'),
(222, 1, 51, '2021-06-21 12:28:59', 'Ingreso', 'A gestion docentes'),
(223, 1, 146, '2021-06-21 13:12:15', 'Ingreso', 'A crear Reunion'),
(224, 1, 146, '2021-06-21 13:14:03', 'Ingreso', 'A crear Reunion'),
(225, 1, 146, '2021-06-21 13:14:37', 'Ingreso', 'A crear Reunion'),
(226, 1, 146, '2021-06-21 13:22:54', 'Ingreso', 'A crear Reunion'),
(227, 1, 146, '2021-06-21 13:25:09', 'Ingreso', 'A crear Reunion'),
(228, 1, 146, '2021-06-21 13:46:40', 'Ingreso', 'A crear Reunion'),
(229, 1, 146, '2021-06-21 13:46:56', 'Ingreso', 'A crear Reunion'),
(230, 1, 146, '2021-06-21 13:50:10', 'Ingreso', 'A crear Reunion'),
(231, 1, 158, '2021-06-21 18:20:53', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(232, 1, 159, '2021-06-21 18:20:56', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(233, 1, 46, '2021-06-21 18:21:16', 'Ingreso', 'A Mantenimiento de Estado de Notificación de Reunión'),
(234, 1, 46, '2021-06-21 18:21:21', 'Ingreso', 'A Mantenimiento de Estado de Notificación de Reunión'),
(235, 1, 103, '2021-06-21 18:21:49', 'Ingreso', 'A Lista de Reuniones'),
(236, 1, 46, '2021-06-21 18:24:06', 'Ingreso', 'A Mantenimiento de Estado de Notificación de Reunión'),
(237, 1, 46, '2021-06-21 18:32:40', 'Ingreso', 'A Mantenimiento de Estado de Notificación de Reunión'),
(238, 1, 46, '2021-06-21 18:32:52', 'Ingreso', 'A Mantenimiento de Estado de Notificación de Reunión'),
(239, 1, 46, '2021-06-21 18:33:01', 'Ingreso', 'A Mantenimiento de Estado de Notificación de Reunión'),
(240, 1, 9, '2021-06-21 18:33:16', 'Ingreso', 'A Permisos a roles y pantallas'),
(241, 1, 10, '2021-06-21 18:35:21', 'Ingreso', 'A Gestion de permisos usuarios'),
(242, 1, 10, '2021-06-21 18:35:33', 'Ingreso', 'A Gestion de permisos usuarios'),
(243, 1, 10, '2021-06-21 18:35:38', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(244, 1, 10, '2021-06-21 18:35:38', 'Ingreso', 'A Gestion de permisos usuarios'),
(245, 1, 156, '2021-06-21 18:35:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(246, 1, 146, '2021-06-21 18:51:48', 'Ingreso', 'A crear Reunion'),
(247, 1, 146, '2021-06-21 18:54:31', 'Ingreso', 'A crear Reunion'),
(248, 1, 159, '2021-06-22 10:16:03', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(249, 1, 159, '2021-06-22 10:16:15', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(250, 1, 159, '2021-06-22 10:16:23', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(251, 1, 10, '2021-06-22 10:16:36', 'Ingreso', 'A Gestion de permisos usuarios'),
(252, 1, 10, '2021-06-22 10:16:42', 'Ingreso', 'A Gestion de permisos usuarios'),
(253, 1, 10, '2021-06-22 10:16:48', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(254, 1, 10, '2021-06-22 10:16:48', 'Ingreso', 'A Gestion de permisos usuarios'),
(255, 1, 159, '2021-06-22 10:16:55', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(256, 1, 10, '2021-06-22 10:17:24', 'Ingreso', 'A Gestion de permisos usuarios'),
(257, 1, 10, '2021-06-22 10:17:30', 'Ingreso', 'A Gestion de permisos usuarios'),
(258, 1, 10, '2021-06-22 10:17:35', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(259, 1, 10, '2021-06-22 10:17:35', 'Ingreso', 'A Gestion de permisos usuarios'),
(260, 1, 146, '2021-06-22 10:17:46', 'Ingreso', 'A crear Reunion'),
(261, 1, 146, '2021-06-22 10:27:41', 'Ingreso', 'A crear Reunion'),
(262, 1, 146, '2021-06-22 13:02:58', 'Ingreso', 'A crear Reunion'),
(263, 1, 146, '2021-06-22 13:21:51', 'Ingreso', 'A crear Reunion'),
(264, 1, 146, '2021-06-22 13:21:54', 'Ingreso', 'A crear Reunion'),
(265, 1, 146, '2021-06-22 13:21:56', 'Ingreso', 'A crear Reunion'),
(266, 1, 146, '2021-06-22 14:19:00', 'Ingreso', 'A crear Reunion'),
(267, 1, 146, '2021-06-22 14:24:27', 'Ingreso', 'A crear Reunion'),
(268, 1, 146, '2021-06-22 14:57:07', 'Ingreso', 'A crear Reunion'),
(269, 1, 146, '2021-06-22 14:59:17', 'Ingreso', 'A crear Reunion'),
(270, 1, 103, '2021-06-22 15:00:13', 'Ingreso', 'A Lista de Reuniones'),
(271, 1, 103, '2021-06-22 15:34:48', 'Ingreso', 'A Lista de Reuniones'),
(272, 1, 9, '2021-06-22 21:06:00', 'Ingreso', 'A Permisos a roles y pantallas'),
(273, 1, 8, '2021-06-22 21:07:28', 'INSERTO', 'EL PERMISO Nuevo Acuerdo'),
(274, 1, 8, '2021-06-22 21:07:28', 'INSERTO', 'EL PERMISO Acuerdos Pendientes'),
(275, 1, 8, '2021-06-22 21:07:28', 'INSERTO', 'EL PERMISO Lista Persona'),
(276, 1, 9, '2021-06-22 21:07:28', 'Ingreso', 'A Permisos a roles y pantallas'),
(277, 1, 158, '2021-06-22 21:09:03', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(278, 1, 158, '2021-06-22 21:09:13', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(279, 1, 158, '2021-06-22 21:09:36', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(280, 1, 10, '2021-06-22 21:11:51', 'Ingreso', 'A Gestion de permisos usuarios'),
(281, 1, 10, '2021-06-22 21:18:34', 'Ingreso', 'A Gestion de permisos usuarios'),
(282, 1, 10, '2021-06-22 21:18:40', 'Ingreso', 'A Gestion de permisos usuarios'),
(283, 1, 10, '2021-06-22 21:18:46', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO '),
(284, 1, 10, '2021-06-22 21:18:46', 'Ingreso', 'A Gestion de permisos usuarios'),
(285, 1, 10, '2021-06-23 09:44:24', 'Ingreso', 'A Gestion de permisos usuarios'),
(286, 1, 10, '2021-06-23 09:44:31', 'Ingreso', 'A Gestion de permisos usuarios'),
(287, 1, 10, '2021-06-23 09:44:39', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(288, 1, 10, '2021-06-23 09:44:39', 'Ingreso', 'A Gestion de permisos usuarios'),
(289, 1, 146, '2021-06-23 09:44:55', 'Ingreso', 'A crear Reunion'),
(290, 1, 38, '2021-06-23 09:45:14', 'INGRESO', 'A REVISION LISTA CANCELAR CLASES'),
(291, 1, 10, '2021-06-23 09:45:20', 'Ingreso', 'A Gestion de permisos usuarios'),
(292, 1, 10, '2021-06-23 09:45:28', 'Ingreso', 'A Gestion de permisos usuarios'),
(293, 1, 10, '2021-06-23 09:45:33', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(294, 1, 10, '2021-06-23 09:45:33', 'Ingreso', 'A Gestion de permisos usuarios'),
(295, 1, 156, '2021-06-23 09:45:50', 'Ingreso', 'A Mantenimiento Estado Acta'),
(296, 1, 10, '2021-06-23 09:45:57', 'Ingreso', 'A Gestion de permisos usuarios'),
(297, 1, 10, '2021-06-23 09:46:03', 'Ingreso', 'A Gestion de permisos usuarios'),
(298, 1, 10, '2021-06-23 09:46:07', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(299, 1, 10, '2021-06-23 09:46:07', 'Ingreso', 'A Gestion de permisos usuarios'),
(300, 1, 146, '2021-06-23 11:58:31', 'Ingreso', 'A crear Reunion'),
(301, 1, 146, '2021-06-23 11:58:40', 'Ingreso', 'A crear Reunion'),
(302, 1, 146, '2021-06-23 12:00:37', 'Ingreso', 'A crear Reunion'),
(303, 1, 146, '2021-06-23 12:02:01', 'Ingreso', 'A crear Reunion'),
(304, 1, 146, '2021-06-23 12:15:53', 'Ingreso', 'A crear Reunion'),
(305, 1, 146, '2021-06-23 12:29:56', 'Ingreso', 'A crear Reunion'),
(306, 1, 146, '2021-06-23 12:31:50', 'Ingreso', 'A crear Reunion'),
(307, 1, 146, '2021-06-23 12:32:50', 'Ingreso', 'A crear Reunion'),
(308, 1, 146, '2021-06-23 12:35:07', 'Ingreso', 'A crear Reunion'),
(309, 1, 146, '2021-06-23 12:36:35', 'Ingreso', 'A crear Reunion'),
(310, 1, 146, '2021-06-23 12:37:07', 'Ingreso', 'A crear Reunion'),
(311, 1, 51, '2021-06-23 12:37:37', 'Ingreso', 'A gestion docentes'),
(312, 1, 4, '2021-06-23 12:37:46', 'Ingreso', 'A Gestion de Usuarios'),
(313, 1, 7, '2021-06-23 12:37:54', 'Ingreso', 'A Gestion de Parametros'),
(314, 1, 7, '2021-06-23 12:38:03', 'Ingreso', 'A Gestion de Parametros'),
(315, 1, 6, '2021-06-23 12:38:23', 'Ingreso', 'A Gestion de Roles'),
(316, 1, 9, '2021-06-23 12:38:31', 'Ingreso', 'A Permisos a roles y pantallas'),
(317, 1, 9, '2021-06-23 12:47:22', 'Ingreso', 'A Permisos a roles y pantallas'),
(318, 1, 146, '2021-06-23 12:47:25', 'Ingreso', 'A crear Reunion'),
(319, 1, 146, '2021-06-23 12:56:31', 'Ingreso', 'A crear Reunion'),
(320, 1, 146, '2021-06-23 13:10:18', 'Ingreso', 'A crear Reunion'),
(321, 1, 146, '2021-06-23 13:19:50', 'Ingreso', 'A crear Reunion'),
(322, 1, 146, '2021-06-23 13:22:24', 'Ingreso', 'A crear Reunion'),
(323, 1, 146, '2021-06-23 13:23:12', 'Ingreso', 'A crear Reunion'),
(324, 1, 146, '2021-06-23 13:24:27', 'Ingreso', 'A crear Reunion'),
(325, 1, 146, '2021-06-23 13:26:45', 'Ingreso', 'A crear Reunion'),
(326, 1, 146, '2021-06-23 13:29:50', 'Ingreso', 'A crear Reunion'),
(327, 1, 146, '2021-06-23 13:32:30', 'Ingreso', 'A crear Reunion'),
(328, 1, 146, '2021-06-23 13:36:59', 'Ingreso', 'A crear Reunion'),
(329, 1, 146, '2021-06-23 13:38:28', 'Ingreso', 'A crear Reunion'),
(330, 1, 146, '2021-06-23 13:43:09', 'Ingreso', 'A crear Reunion'),
(331, 1, 146, '2021-06-23 13:46:51', 'Ingreso', 'A crear Reunion'),
(332, 1, 146, '2021-06-23 13:48:21', 'Ingreso', 'A crear Reunion'),
(333, 1, 146, '2021-06-23 13:48:50', 'Ingreso', 'A crear Reunion'),
(334, 1, 146, '2021-06-23 13:49:31', 'Ingreso', 'A crear Reunion'),
(335, 1, 146, '2021-06-23 13:54:04', 'Ingreso', 'A crear Reunion'),
(336, 1, 146, '2021-06-23 14:00:42', 'Ingreso', 'A crear Reunion'),
(337, 1, 156, '2021-06-23 16:49:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(338, 1, 156, '2021-06-23 16:49:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(339, 1, 156, '2021-06-23 16:49:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(340, 1, 146, '2021-06-23 16:49:58', 'Ingreso', 'A crear Reunion'),
(341, 1, 146, '2021-06-23 16:53:35', 'Ingreso', 'A crear Reunion'),
(342, 1, 146, '2021-06-23 16:54:39', 'Ingreso', 'A crear Reunion'),
(343, 1, 146, '2021-06-23 16:56:03', 'Ingreso', 'A crear Reunion'),
(344, 1, 146, '2021-06-23 16:57:33', 'Ingreso', 'A crear Reunion'),
(345, 1, 146, '2021-06-23 17:00:55', 'Ingreso', 'A crear Reunion'),
(346, 1, 146, '2021-06-23 17:02:38', 'Ingreso', 'A crear Reunion'),
(347, 1, 146, '2021-06-23 17:43:50', 'Ingreso', 'A crear Reunion'),
(348, 1, 146, '2021-06-23 17:50:21', 'Ingreso', 'A crear Reunion'),
(349, 1, 146, '2021-06-23 17:53:24', 'Ingreso', 'A crear Reunion'),
(350, 1, 146, '2021-06-23 17:55:38', 'Ingreso', 'A crear Reunion'),
(351, 1, 146, '2021-06-23 17:55:48', 'Ingreso', 'A crear Reunion'),
(352, 1, 146, '2021-06-23 17:56:03', 'Ingreso', 'A crear Reunion'),
(353, 1, 146, '2021-06-23 17:56:37', 'Ingreso', 'A crear Reunion'),
(354, 1, 146, '2021-06-23 17:56:54', 'Ingreso', 'A crear Reunion'),
(355, 1, 146, '2021-06-23 17:57:10', 'Ingreso', 'A crear Reunion'),
(356, 1, 146, '2021-06-23 17:57:29', 'Ingreso', 'A crear Reunion'),
(357, 1, 146, '2021-06-23 17:57:44', 'Ingreso', 'A crear Reunion'),
(358, 1, 146, '2021-06-23 17:57:57', 'Ingreso', 'A crear Reunion'),
(359, 1, 146, '2021-06-23 17:58:16', 'Ingreso', 'A crear Reunion'),
(360, 1, 146, '2021-06-23 17:58:55', 'Ingreso', 'A crear Reunion'),
(361, 1, 146, '2021-06-23 18:05:42', 'Ingreso', 'A crear Reunion'),
(362, 1, 156, '2021-06-23 18:05:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(363, 1, 156, '2021-06-23 18:06:01', 'Ingreso', 'A Mantenimiento Estado Acta'),
(364, 1, 156, '2021-06-23 18:06:10', 'Ingreso', 'A Mantenimiento Estado Acta'),
(365, 1, 146, '2021-06-23 18:09:53', 'Ingreso', 'A crear Reunion'),
(366, 1, 9, '2021-06-23 18:41:48', 'Ingreso', 'A Permisos a roles y pantallas'),
(367, 1, 146, '2021-06-23 18:42:19', 'Ingreso', 'A crear Reunion'),
(368, 1, 146, '2021-06-23 18:50:59', 'Ingreso', 'A crear Reunion'),
(369, 1, 146, '2021-06-23 18:52:23', 'Ingreso', 'A crear Reunion'),
(370, 1, 146, '2021-06-23 18:52:32', 'Ingreso', 'A crear Reunion'),
(371, 1, 146, '2021-06-23 18:52:47', 'Ingreso', 'A crear Reunion'),
(372, 1, 146, '2021-06-23 18:53:56', 'Ingreso', 'A crear Reunion'),
(373, 1, 146, '2021-06-23 18:54:57', 'Ingreso', 'A crear Reunion'),
(374, 1, 146, '2021-06-23 18:55:23', 'Ingreso', 'A crear Reunion'),
(375, 1, 146, '2021-06-23 18:56:18', 'Ingreso', 'A crear Reunion'),
(376, 1, 146, '2021-06-23 18:56:30', 'Ingreso', 'A crear Reunion'),
(377, 1, 146, '2021-06-23 18:56:40', 'Ingreso', 'A crear Reunion'),
(378, 1, 146, '2021-06-23 18:57:27', 'Ingreso', 'A crear Reunion'),
(379, 1, 146, '2021-06-23 19:03:03', 'Ingreso', 'A crear Reunion'),
(380, 1, 146, '2021-06-23 19:05:17', 'Ingreso', 'A crear Reunion'),
(381, 1, 146, '2021-06-23 19:07:10', 'Ingreso', 'A crear Reunion'),
(382, 1, 146, '2021-06-23 19:07:36', 'Ingreso', 'A crear Reunion'),
(383, 1, 146, '2021-06-23 19:09:19', 'Ingreso', 'A crear Reunion'),
(384, 1, 146, '2021-06-23 19:13:24', 'Ingreso', 'A crear Reunion'),
(385, 1, 146, '2021-06-23 19:15:18', 'Ingreso', 'A crear Reunion'),
(386, 1, 146, '2021-06-23 19:16:24', 'Ingreso', 'A crear Reunion'),
(387, 1, 146, '2021-06-23 19:16:40', 'Ingreso', 'A crear Reunion'),
(388, 1, 146, '2021-06-23 19:17:00', 'Ingreso', 'A crear Reunion'),
(389, 1, 146, '2021-06-23 19:21:30', 'Ingreso', 'A crear Reunion'),
(390, 1, 146, '2021-06-23 19:22:54', 'Ingreso', 'A crear Reunion'),
(391, 1, 146, '2021-06-23 20:07:13', 'Ingreso', 'A crear Reunion'),
(392, 1, 158, '2021-06-24 11:37:58', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(393, 1, 159, '2021-06-24 11:44:20', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(394, 1, 159, '2021-06-24 11:46:27', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(395, 1, 159, '2021-06-24 11:47:04', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(396, 1, 159, '2021-06-24 11:48:22', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(397, 1, 159, '2021-06-24 12:06:17', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(398, 1, 159, '2021-06-24 12:07:15', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(399, 1, 159, '2021-06-24 12:08:39', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(400, 1, 159, '2021-06-24 12:08:47', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(401, 1, 159, '2021-06-24 12:12:59', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(402, 1, 159, '2021-06-24 12:19:02', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(403, 1, 159, '2021-06-24 12:19:24', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(404, 1, 159, '2021-06-24 12:19:37', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(405, 1, 159, '2021-06-24 12:19:40', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(406, 1, 159, '2021-06-24 12:25:25', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(407, 1, 159, '2021-06-24 12:26:05', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(408, 1, 159, '2021-06-24 12:26:17', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(409, 1, 159, '2021-06-24 12:26:29', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(410, 1, 159, '2021-06-24 12:27:12', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(411, 1, 156, '2021-06-24 12:29:39', 'Ingreso', 'A Mantenimiento Estado Acta'),
(412, 1, 156, '2021-06-24 12:29:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(413, 1, 156, '2021-06-24 12:30:01', 'Ingreso', 'A Mantenimiento Estado Acta'),
(414, 1, 159, '2021-06-24 12:30:13', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(415, 1, 159, '2021-06-24 12:30:21', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(416, 1, 159, '2021-06-24 12:34:28', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(417, 1, 159, '2021-06-24 12:34:37', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(418, 1, 159, '2021-06-24 12:36:38', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(419, 1, 159, '2021-06-24 12:36:41', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(420, 1, 159, '2021-06-24 12:38:32', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(421, 1, 159, '2021-06-24 12:38:41', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(422, 1, 158, '2021-06-24 12:43:35', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(423, 1, 158, '2021-06-24 12:48:58', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(424, 1, 158, '2021-06-24 12:54:42', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(425, 1, 158, '2021-06-24 12:57:28', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(426, 1, 158, '2021-06-24 13:09:09', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(427, 1, 158, '2021-06-24 13:09:36', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(428, 1, 158, '2021-06-24 13:09:39', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(429, 1, 158, '2021-06-24 13:11:24', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(430, 1, 158, '2021-06-24 13:13:08', 'Ingreso', 'A Mantenimiento Estado Notificacion'),
(431, 1, 158, '2021-06-24 13:15:26', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(432, 1, 158, '2021-06-24 13:15:29', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(433, 1, 158, '2021-06-24 13:20:32', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(434, 1, 158, '2021-06-24 13:20:40', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(435, 1, 159, '2021-06-24 15:22:51', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(436, 1, 159, '2021-06-24 15:24:01', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(437, 1, 159, '2021-06-24 15:28:13', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(438, 1, 159, '2021-06-24 15:28:23', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(439, 1, 159, '2021-06-24 15:28:59', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(440, 1, 159, '2021-06-24 15:29:25', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(441, 1, 159, '2021-06-24 15:36:00', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(442, 1, 159, '2021-06-24 15:36:44', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(443, 1, 159, '2021-06-24 15:39:02', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(444, 1, 159, '2021-06-24 15:39:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(445, 1, 159, '2021-06-24 15:40:03', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(446, 1, 159, '2021-06-24 15:43:05', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(447, 1, 159, '2021-06-24 15:43:17', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(448, 1, 159, '2021-06-24 16:07:48', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(449, 1, 159, '2021-06-24 16:08:08', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(450, 1, 159, '2021-06-24 16:08:40', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(451, 1, 159, '2021-06-24 16:08:47', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(452, 1, 159, '2021-06-24 16:12:10', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(453, 1, 159, '2021-06-24 16:12:13', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(454, 1, 159, '2021-06-24 16:13:16', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(455, 1, 159, '2021-06-24 16:13:36', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(456, 1, 159, '2021-06-24 16:14:06', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(457, 1, 159, '2021-06-24 16:22:06', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(458, 1, 159, '2021-06-24 16:22:20', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(459, 1, 159, '2021-06-24 16:22:48', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(460, 1, 159, '2021-06-24 16:23:04', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(461, 1, 159, '2021-06-24 16:25:55', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(462, 1, 159, '2021-06-24 16:25:59', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(463, 1, 159, '2021-06-24 16:34:19', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(464, 1, 159, '2021-06-24 16:34:28', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(465, 1, 159, '2021-06-24 16:35:26', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(466, 1, 159, '2021-06-24 16:36:22', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(467, 1, 159, '2021-06-24 16:42:05', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(468, 1, 159, '2021-06-24 16:42:28', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(469, 1, 159, '2021-06-24 16:42:42', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(470, 1, 159, '2021-06-24 16:45:49', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(471, 1, 159, '2021-06-24 16:45:54', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(472, 1, 159, '2021-06-24 16:46:11', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(473, 1, 159, '2021-06-24 19:06:24', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(474, 1, 159, '2021-06-24 19:06:36', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(475, 1, 159, '2021-06-24 19:06:51', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(476, 1, 158, '2021-06-24 19:16:59', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(477, 1, 158, '2021-06-24 19:25:04', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(478, 1, 158, '2021-06-24 19:27:27', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(479, 1, 158, '2021-06-24 19:28:00', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(480, 1, 158, '2021-06-24 19:28:16', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(481, 1, 158, '2021-06-24 19:28:20', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(482, 1, 158, '2021-06-24 19:28:30', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(483, 1, 158, '2021-06-24 19:43:43', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(484, 1, 158, '2021-06-24 19:44:43', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(485, 1, 158, '2021-06-24 19:45:16', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(486, 1, 158, '2021-06-24 19:45:27', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(487, 1, 158, '2021-06-24 19:45:57', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(488, 1, 158, '2021-06-24 19:46:46', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(489, 1, 158, '2021-06-24 19:46:55', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(490, 1, 158, '2021-06-24 19:47:07', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(491, 1, 158, '2021-06-24 19:47:44', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(492, 1, 158, '2021-06-24 19:47:53', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(493, 1, 158, '2021-06-25 10:04:59', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(494, 1, 158, '2021-06-25 10:05:18', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(495, 1, 158, '2021-06-25 10:05:23', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(496, 1, 158, '2021-06-25 10:05:41', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(497, 1, 158, '2021-06-25 10:06:04', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(498, 1, 158, '2021-06-25 10:06:44', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(499, 1, 158, '2021-06-25 10:11:23', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(500, 1, 158, '2021-06-25 10:11:41', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(501, 1, 158, '2021-06-25 10:13:58', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(502, 1, 158, '2021-06-25 10:14:14', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(503, 1, 159, '2021-06-25 10:15:23', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(504, 1, 159, '2021-06-25 10:15:30', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(505, 1, 158, '2021-06-25 10:16:06', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(506, 1, 158, '2021-06-25 10:16:16', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(507, 1, 158, '2021-06-25 10:19:07', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(508, 1, 158, '2021-06-25 10:19:17', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(509, 1, 158, '2021-06-25 10:19:27', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(510, 1, 158, '2021-06-25 10:21:49', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(511, 1, 158, '2021-06-25 10:22:08', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(512, 1, 158, '2021-06-25 10:22:53', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(513, 1, 158, '2021-06-25 10:23:24', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(514, 1, 158, '2021-06-25 10:23:43', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(515, 1, 158, '2021-06-25 10:24:05', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(516, 1, 158, '2021-06-25 10:24:21', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(517, 1, 158, '2021-06-25 10:29:20', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(518, 1, 158, '2021-06-25 10:35:38', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(519, 1, 158, '2021-06-25 10:35:48', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(520, 1, 158, '2021-06-25 10:37:11', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(521, 1, 158, '2021-06-25 10:38:27', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(522, 1, 158, '2021-06-25 10:40:07', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(523, 1, 158, '2021-06-25 10:40:13', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(524, 1, 158, '2021-06-25 10:40:31', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(525, 1, 158, '2021-06-25 10:41:36', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(526, 1, 158, '2021-06-25 10:41:43', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(527, 1, 158, '2021-06-25 10:44:07', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(528, 1, 158, '2021-06-25 10:45:05', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(529, 1, 158, '2021-06-25 10:47:14', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(530, 1, 158, '2021-06-25 10:52:15', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(531, 1, 158, '2021-06-25 10:52:25', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(532, 1, 158, '2021-06-25 10:55:06', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(533, 1, 158, '2021-06-25 10:55:46', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(534, 1, 158, '2021-06-25 10:55:57', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(535, 1, 158, '2021-06-25 10:56:07', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(536, 1, 157, '2021-06-25 10:57:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(537, 1, 157, '2021-06-25 10:57:30', 'Ingreso', 'A Mantenimiento Estado Acta'),
(538, 1, 157, '2021-06-25 10:57:40', 'Ingreso', 'A Mantenimiento Estado Acta'),
(539, 1, 158, '2021-06-25 11:01:18', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(540, 1, 158, '2021-06-25 11:02:37', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(541, 1, 158, '2021-06-25 11:03:57', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(542, 1, 158, '2021-06-25 11:03:59', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(543, 1, 158, '2021-06-25 11:04:49', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(544, 1, 158, '2021-06-25 11:53:39', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(545, 1, 158, '2021-06-25 11:53:51', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(546, 1, 158, '2021-06-25 11:54:09', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(547, 1, 158, '2021-06-25 11:58:40', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(548, 1, 158, '2021-06-25 11:59:31', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(549, 1, 158, '2021-06-25 11:59:50', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(550, 1, 158, '2021-06-25 12:01:24', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(551, 1, 158, '2021-06-25 12:01:32', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(552, 1, 158, '2021-06-25 12:01:39', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(553, 1, 158, '2021-06-25 12:01:46', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(554, 1, 158, '2021-06-25 12:01:55', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(555, 1, 158, '2021-06-25 12:02:56', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(556, 1, 158, '2021-06-25 12:05:32', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(557, 1, 158, '2021-06-25 12:06:02', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(558, 1, 158, '2021-06-25 12:06:09', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(559, 1, 158, '2021-06-25 12:06:22', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(560, 1, 158, '2021-06-25 12:06:29', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(561, 1, 146, '2021-06-25 12:06:49', 'Ingreso', 'A crear Reunion'),
(562, 1, 103, '2021-06-25 12:09:45', 'Ingreso', 'A Lista de Reuniones'),
(563, 1, 103, '2021-06-25 12:11:34', 'Ingreso', 'A Lista de Reuniones'),
(564, 1, 146, '2021-06-25 12:12:25', 'Ingreso', 'A crear Reunion'),
(565, 1, 157, '2021-06-25 12:38:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(566, 1, 156, '2021-06-25 12:39:03', 'Ingreso', 'A Mantenimiento Estado Acta'),
(567, 1, 156, '2021-06-25 12:39:13', 'Ingreso', 'A Mantenimiento Estado Acta'),
(568, 1, 156, '2021-06-25 12:39:57', 'Ingreso', 'A Mantenimiento Estado Acta'),
(569, 1, 156, '2021-06-25 12:43:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(570, 1, 158, '2021-06-25 12:44:00', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(571, 1, 159, '2021-06-25 12:45:22', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(572, 1, 10, '2021-06-25 12:48:40', 'Ingreso', 'A Gestion de permisos usuarios'),
(573, 1, 10, '2021-06-25 12:48:46', 'Ingreso', 'A Gestion de permisos usuarios'),
(574, 1, 10, '2021-06-25 12:48:50', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(575, 1, 10, '2021-06-25 12:48:50', 'Ingreso', 'A Gestion de permisos usuarios'),
(576, 1, 158, '2021-06-25 12:48:55', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(577, 1, 158, '2021-06-25 13:05:26', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(578, 1, 158, '2021-06-25 13:05:33', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(579, 1, 146, '2021-06-25 13:05:57', 'Ingreso', 'A crear Reunion'),
(580, 1, 146, '2021-06-25 13:07:17', 'Ingreso', 'A crear Reunion'),
(581, 1, 9, '2021-06-25 13:08:48', 'Ingreso', 'A Permisos a roles y pantallas'),
(582, 1, 146, '2021-06-25 13:09:13', 'Ingreso', 'A crear Reunion'),
(583, 1, 146, '2021-06-25 13:14:37', 'Ingreso', 'A crear Reunion'),
(584, 1, 146, '2021-06-25 13:15:07', 'Ingreso', 'A crear Reunion'),
(585, 1, 146, '2021-06-25 13:16:40', 'Ingreso', 'A crear Reunion'),
(586, 1, 146, '2021-06-25 13:20:15', 'Ingreso', 'A crear Reunion'),
(587, 1, 146, '2021-06-25 13:20:33', 'Ingreso', 'A crear Reunion'),
(588, 1, 146, '2021-06-25 13:22:08', 'Ingreso', 'A crear Reunion'),
(589, 1, 146, '2021-06-25 13:24:19', 'Ingreso', 'A crear Reunion'),
(590, 1, 146, '2021-06-25 13:24:56', 'Ingreso', 'A crear Reunion'),
(591, 1, 146, '2021-06-25 13:25:28', 'Ingreso', 'A crear Reunion'),
(592, 1, 146, '2021-06-25 13:25:46', 'Ingreso', 'A crear Reunion'),
(593, 1, 146, '2021-06-25 13:25:54', 'Ingreso', 'A crear Reunion'),
(594, 1, 146, '2021-06-25 13:26:22', 'Ingreso', 'A crear Reunion'),
(595, 1, 146, '2021-06-25 13:26:53', 'Ingreso', 'A crear Reunion'),
(596, 1, 146, '2021-06-25 13:30:58', 'Ingreso', 'A crear Reunion'),
(597, 1, 146, '2021-06-25 13:31:37', 'Ingreso', 'A crear Reunion'),
(598, 1, 146, '2021-06-25 13:32:31', 'Ingreso', 'A crear Reunion'),
(599, 1, 146, '2021-06-25 13:32:45', 'Ingreso', 'A crear Reunion'),
(600, 1, 146, '2021-06-25 13:32:52', 'Ingreso', 'A crear Reunion'),
(601, 1, 146, '2021-06-25 13:34:55', 'Ingreso', 'A crear Reunion'),
(602, 1, 146, '2021-06-25 13:35:17', 'Ingreso', 'A crear Reunion'),
(603, 1, 146, '2021-06-25 13:36:38', 'Ingreso', 'A crear Reunion'),
(604, 1, 146, '2021-06-25 13:38:47', 'Ingreso', 'A crear Reunion'),
(605, 1, 146, '2021-06-25 13:41:42', 'Ingreso', 'A crear Reunion'),
(606, 1, 146, '2021-06-25 13:43:04', 'Ingreso', 'A crear Reunion'),
(607, 1, 146, '2021-06-25 13:43:26', 'Ingreso', 'A crear Reunion'),
(608, 1, 146, '2021-06-25 13:44:09', 'Ingreso', 'A crear Reunion'),
(609, 1, 146, '2021-06-25 13:44:29', 'Ingreso', 'A crear Reunion'),
(610, 1, 160, '2021-06-25 13:47:55', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(611, 1, 10, '2021-06-25 13:48:16', 'Ingreso', 'A Gestion de permisos usuarios'),
(612, 1, 10, '2021-06-25 13:48:21', 'Ingreso', 'A Gestion de permisos usuarios'),
(613, 1, 10, '2021-06-25 13:48:25', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(614, 1, 10, '2021-06-25 13:48:25', 'Ingreso', 'A Gestion de permisos usuarios'),
(615, 1, 160, '2021-06-25 13:48:31', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(616, 1, 146, '2021-06-25 13:50:44', 'Ingreso', 'A crear Reunion'),
(617, 1, 146, '2021-06-25 13:52:42', 'Ingreso', 'A crear Reunion'),
(618, 1, 146, '2021-06-25 13:59:16', 'Ingreso', 'A crear Reunion'),
(619, 1, 156, '2021-06-25 14:09:19', 'Ingreso', 'A Mantenimiento Estado Acta'),
(620, 1, 146, '2021-06-25 14:09:42', 'Ingreso', 'A crear Reunion'),
(621, 1, 158, '2021-06-26 11:10:56', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(622, 1, 146, '2021-06-26 11:18:49', 'Ingreso', 'A crear Reunion'),
(623, 1, 156, '2021-06-27 15:21:31', 'Ingreso', 'A Mantenimiento Estado Acta'),
(624, 1, 160, '2021-06-28 12:58:56', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(625, 1, 160, '2021-06-28 12:59:09', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(626, 1, 160, '2021-06-28 12:59:25', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(627, 1, 146, '2021-06-28 12:59:49', 'Ingreso', 'A crear Reunion'),
(628, 1, 146, '2021-06-28 14:47:14', 'Ingreso', 'A crear Reunion'),
(629, 1, 146, '2021-06-28 14:57:50', 'Ingreso', 'A crear Reunion'),
(630, 1, 146, '2021-06-28 15:00:24', 'Ingreso', 'A crear Reunion'),
(631, 1, 146, '2021-06-28 15:00:52', 'Ingreso', 'A crear Reunion'),
(632, 1, 146, '2021-06-28 15:01:12', 'Ingreso', 'A crear Reunion'),
(633, 1, 146, '2021-06-28 15:01:52', 'Ingreso', 'A crear Reunion'),
(634, 1, 146, '2021-06-28 15:03:18', 'Ingreso', 'A crear Reunion'),
(635, 1, 146, '2021-06-28 15:03:28', 'Ingreso', 'A crear Reunion'),
(636, 1, 146, '2021-06-28 15:03:34', 'Ingreso', 'A crear Reunion'),
(637, 1, 146, '2021-06-28 15:07:29', 'Ingreso', 'A crear Reunion');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(638, 1, 146, '2021-06-28 15:09:37', 'Ingreso', 'A crear Reunion'),
(639, 1, 146, '2021-06-28 15:10:00', 'Ingreso', 'A crear Reunion'),
(640, 1, 146, '2021-06-28 15:10:30', 'Ingreso', 'A crear Reunion'),
(641, 1, 146, '2021-06-28 15:10:44', 'Ingreso', 'A crear Reunion'),
(642, 1, 146, '2021-06-28 15:11:11', 'Ingreso', 'A crear Reunion'),
(643, 1, 146, '2021-06-28 15:11:55', 'Ingreso', 'A crear Reunion'),
(644, 1, 146, '2021-06-28 15:14:27', 'Ingreso', 'A crear Reunion'),
(645, 1, 146, '2021-06-28 15:14:48', 'Ingreso', 'A crear Reunion'),
(646, 1, 146, '2021-06-28 15:17:51', 'Ingreso', 'A crear Reunion'),
(647, 1, 146, '2021-06-28 15:18:17', 'Ingreso', 'A crear Reunion'),
(648, 1, 146, '2021-06-28 15:18:32', 'Ingreso', 'A crear Reunion'),
(649, 1, 146, '2021-06-28 15:18:43', 'Ingreso', 'A crear Reunion'),
(650, 1, 146, '2021-06-28 15:18:52', 'Ingreso', 'A crear Reunion'),
(651, 1, 146, '2021-06-28 15:19:20', 'Ingreso', 'A crear Reunion'),
(652, 1, 146, '2021-06-28 15:21:05', 'Ingreso', 'A crear Reunion'),
(653, 1, 146, '2021-06-28 15:21:49', 'Ingreso', 'A crear Reunion'),
(654, 1, 146, '2021-06-28 15:21:59', 'Ingreso', 'A crear Reunion'),
(655, 1, 146, '2021-06-28 15:23:02', 'Ingreso', 'A crear Reunion'),
(656, 1, 146, '2021-06-28 15:23:26', 'Ingreso', 'A crear Reunion'),
(657, 1, 146, '2021-06-28 15:24:04', 'Ingreso', 'A crear Reunion'),
(658, 1, 146, '2021-06-28 15:25:01', 'Ingreso', 'A crear Reunion'),
(659, 1, 146, '2021-06-28 15:25:24', 'Ingreso', 'A crear Reunion'),
(660, 1, 146, '2021-06-28 15:25:41', 'Ingreso', 'A crear Reunion'),
(661, 1, 146, '2021-06-28 15:26:04', 'Ingreso', 'A crear Reunion'),
(662, 1, 146, '2021-06-28 15:38:35', 'Ingreso', 'A crear Reunion'),
(663, 1, 146, '2021-06-28 15:40:51', 'Ingreso', 'A crear Reunion'),
(664, 1, 146, '2021-06-28 15:43:05', 'Ingreso', 'A crear Reunion'),
(665, 1, 146, '2021-06-28 15:43:40', 'Ingreso', 'A crear Reunion'),
(666, 1, 146, '2021-06-28 15:45:02', 'Ingreso', 'A crear Reunion'),
(667, 1, 146, '2021-06-28 15:45:53', 'Ingreso', 'A crear Reunion'),
(668, 1, 9, '2021-06-28 15:46:20', 'Ingreso', 'A Permisos a roles y pantallas'),
(669, 1, 146, '2021-06-28 15:48:52', 'Ingreso', 'A crear Reunion'),
(670, 1, 146, '2021-06-28 15:52:19', 'Ingreso', 'A crear Reunion'),
(671, 1, 146, '2021-06-28 15:53:21', 'Ingreso', 'A crear Reunion'),
(672, 1, 9, '2021-06-28 15:53:30', 'Ingreso', 'A Permisos a roles y pantallas'),
(673, 1, 146, '2021-06-28 15:53:56', 'Ingreso', 'A crear Reunion'),
(674, 1, 156, '2021-06-29 10:49:56', 'Ingreso', 'A Mantenimiento Estado Acta'),
(675, 1, 156, '2021-06-29 10:50:03', 'Ingreso', 'A Mantenimiento Estado Acta'),
(676, 1, 156, '2021-06-29 10:50:13', 'Ingreso', 'A Mantenimiento Estado Acta'),
(677, 1, 156, '2021-06-29 10:50:29', 'Ingreso', 'A Mantenimiento Estado Acta'),
(678, 1, 146, '2021-06-29 10:51:23', 'Ingreso', 'A crear Reunion'),
(679, 1, 146, '2021-06-29 10:52:32', 'Ingreso', 'A crear Reunion'),
(680, 1, 146, '2021-06-29 10:52:46', 'Ingreso', 'A crear Reunion'),
(681, 1, 146, '2021-06-29 10:55:10', 'Ingreso', 'A crear Reunion'),
(682, 1, 146, '2021-06-29 10:57:16', 'Ingreso', 'A crear Reunion'),
(683, 1, 146, '2021-06-29 11:29:22', 'Ingreso', 'A crear Reunion'),
(684, 1, 146, '2021-06-29 11:36:18', 'Ingreso', 'A crear Reunion'),
(685, 1, 146, '2021-06-29 12:51:56', 'Ingreso', 'A crear Reunion'),
(686, 1, 146, '2021-06-29 12:58:23', 'Ingreso', 'A crear Reunion'),
(687, 1, 10, '2021-06-29 19:18:42', 'Ingreso', 'A Gestion de permisos usuarios'),
(688, 1, 10, '2021-06-29 19:18:49', 'Ingreso', 'A Gestion de permisos usuarios'),
(689, 1, 10, '2021-06-29 19:18:56', 'MODIFICO', 'EL INSERTAR AINACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AINACTIVO '),
(690, 1, 10, '2021-06-29 19:18:56', 'Ingreso', 'A Gestion de permisos usuarios'),
(691, 1, 156, '2021-06-29 19:19:04', 'Ingreso', 'A Mantenimiento Estado Acta'),
(692, 1, 9, '2021-06-29 19:19:22', 'Ingreso', 'A Permisos a roles y pantallas'),
(693, 1, 10, '2021-06-29 19:19:26', 'Ingreso', 'A Gestion de permisos usuarios'),
(694, 1, 10, '2021-06-29 19:19:33', 'Ingreso', 'A Gestion de permisos usuarios'),
(695, 1, 10, '2021-06-29 19:19:46', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(696, 1, 10, '2021-06-29 19:19:46', 'Ingreso', 'A Gestion de permisos usuarios'),
(697, 1, 156, '2021-06-29 19:19:53', 'Ingreso', 'A Mantenimiento Estado Acta'),
(698, 1, 10, '2021-06-29 19:20:11', 'Ingreso', 'A Gestion de permisos usuarios'),
(699, 1, 10, '2021-06-29 19:20:17', 'Ingreso', 'A Gestion de permisos usuarios'),
(700, 1, 10, '2021-06-29 19:20:21', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(701, 1, 10, '2021-06-29 19:20:21', 'Ingreso', 'A Gestion de permisos usuarios'),
(702, 1, 156, '2021-06-29 19:20:29', 'Ingreso', 'A Mantenimiento Estado Acta'),
(703, 1, 156, '2021-06-29 19:22:37', 'Ingreso', 'A Mantenimiento Estado Acta'),
(704, 1, 156, '2021-06-29 19:23:10', 'Ingreso', 'A Mantenimiento Estado Acta'),
(705, 1, 156, '2021-06-29 19:25:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(706, 1, 156, '2021-06-29 19:25:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(707, 1, 161, '2021-06-29 20:23:20', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(708, 1, 161, '2021-06-29 20:24:06', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(709, 1, 161, '2021-06-29 20:28:52', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(710, 1, 161, '2021-06-29 20:32:17', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(711, 1, 10, '2021-06-29 20:33:54', 'Ingreso', 'A Gestion de permisos usuarios'),
(712, 1, 10, '2021-06-29 20:34:02', 'Ingreso', 'A Gestion de permisos usuarios'),
(713, 1, 10, '2021-06-29 20:34:32', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AINACTIVO ,EL ELIMINAR AINACTIVO ,EL VISUALIZAR AACTIVO '),
(714, 1, 10, '2021-06-29 20:34:32', 'Ingreso', 'A Gestion de permisos usuarios'),
(715, 1, 161, '2021-06-29 20:34:39', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(716, 1, 156, '2021-06-29 20:35:07', 'Ingreso', 'A Mantenimiento Estado Acta'),
(717, 1, 156, '2021-06-29 20:37:13', 'Ingreso', 'A Mantenimiento Estado Acta'),
(718, 1, 156, '2021-06-29 20:37:40', 'Ingreso', 'A Mantenimiento Estado Acta'),
(719, 1, 156, '2021-06-29 20:38:01', 'Ingreso', 'A Mantenimiento Estado Acta'),
(720, 1, 156, '2021-06-29 20:38:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(721, 1, 159, '2021-06-29 20:40:58', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(722, 1, 159, '2021-06-29 20:41:24', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(723, 1, 159, '2021-06-29 20:41:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(724, 1, 159, '2021-06-29 20:42:04', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(725, 1, 146, '2021-06-29 20:42:33', 'Ingreso', 'A crear Reunion'),
(726, 1, 146, '2021-06-29 20:43:12', 'Ingreso', 'A crear Reunion'),
(727, 1, 146, '2021-06-29 20:52:05', 'Ingreso', 'A crear Reunion'),
(728, 1, 9, '2021-06-29 20:52:10', 'Ingreso', 'A Permisos a roles y pantallas'),
(729, 1, 146, '2021-06-30 13:17:20', 'Ingreso', 'A crear Reunion'),
(730, 1, 146, '2021-06-30 14:59:01', 'Ingreso', 'A crear Reunion'),
(731, 1, 146, '2021-06-30 15:04:20', 'Ingreso', 'A crear Reunion'),
(732, 1, 146, '2021-06-30 15:05:20', 'Ingreso', 'A crear Reunion'),
(733, 1, 146, '2021-06-30 15:14:18', 'Ingreso', 'A crear Reunion'),
(734, 1, 146, '2021-06-30 15:15:54', 'Ingreso', 'A crear Reunion'),
(735, 1, 146, '2021-06-30 15:16:01', 'Ingreso', 'A crear Reunion'),
(736, 1, 146, '2021-06-30 15:17:23', 'Ingreso', 'A crear Reunion'),
(737, 1, 146, '2021-06-30 15:18:09', 'Ingreso', 'A crear Reunion'),
(738, 1, 146, '2021-06-30 15:19:03', 'Ingreso', 'A crear Reunion'),
(739, 1, 146, '2021-06-30 15:20:50', 'Ingreso', 'A crear Reunion'),
(740, 1, 146, '2021-06-30 15:21:33', 'Ingreso', 'A crear Reunion'),
(741, 1, 146, '2021-06-30 15:26:52', 'Ingreso', 'A crear Reunion'),
(742, 1, 146, '2021-06-30 15:27:59', 'Ingreso', 'A crear Reunion'),
(743, 1, 146, '2021-06-30 15:35:10', 'Ingreso', 'A crear Reunion'),
(744, 1, 146, '2021-06-30 15:36:28', 'Ingreso', 'A crear Reunion'),
(745, 1, 146, '2021-06-30 15:37:33', 'Ingreso', 'A crear Reunion'),
(746, 1, 146, '2021-06-30 15:38:13', 'Ingreso', 'A crear Reunion'),
(747, 1, 146, '2021-06-30 15:41:52', 'Ingreso', 'A crear Reunion'),
(748, 1, 146, '2021-06-30 15:42:30', 'Ingreso', 'A crear Reunion'),
(749, 1, 146, '2021-06-30 15:42:54', 'Ingreso', 'A crear Reunion'),
(750, 1, 146, '2021-06-30 15:45:17', 'Ingreso', 'A crear Reunion'),
(751, 1, 146, '2021-06-30 15:46:28', 'Ingreso', 'A crear Reunion'),
(752, 1, 146, '2021-06-30 15:47:37', 'Ingreso', 'A crear Reunion'),
(753, 1, 146, '2021-06-30 15:49:43', 'Ingreso', 'A crear Reunion'),
(754, 1, 146, '2021-06-30 15:49:46', 'Ingreso', 'A crear Reunion'),
(755, 1, 146, '2021-06-30 15:50:17', 'Ingreso', 'A crear Reunion'),
(756, 1, 146, '2021-06-30 15:54:20', 'Ingreso', 'A crear Reunion'),
(757, 1, 146, '2021-06-30 15:56:57', 'Ingreso', 'A crear Reunion'),
(758, 1, 146, '2021-06-30 15:58:23', 'Ingreso', 'A crear Reunion'),
(759, 1, 146, '2021-06-30 15:59:33', 'Ingreso', 'A crear Reunion'),
(760, 1, 146, '2021-06-30 16:01:57', 'Ingreso', 'A crear Reunion'),
(761, 1, 146, '2021-06-30 16:02:17', 'Ingreso', 'A crear Reunion'),
(762, 1, 146, '2021-06-30 16:02:34', 'Ingreso', 'A crear Reunion'),
(763, 1, 146, '2021-06-30 16:02:59', 'Ingreso', 'A crear Reunion'),
(764, 1, 146, '2021-06-30 16:03:12', 'Ingreso', 'A crear Reunion'),
(765, 1, 146, '2021-06-30 16:06:07', 'Ingreso', 'A crear Reunion'),
(766, 1, 146, '2021-06-30 16:06:55', 'Ingreso', 'A crear Reunion'),
(767, 1, 146, '2021-06-30 16:07:45', 'Ingreso', 'A crear Reunion'),
(768, 1, 146, '2021-06-30 16:07:59', 'Ingreso', 'A crear Reunion'),
(769, 1, 146, '2021-06-30 16:08:17', 'Ingreso', 'A crear Reunion'),
(770, 1, 146, '2021-06-30 16:08:40', 'Ingreso', 'A crear Reunion'),
(771, 1, 146, '2021-06-30 16:09:34', 'Ingreso', 'A crear Reunion'),
(772, 1, 146, '2021-06-30 16:14:27', 'Ingreso', 'A crear Reunion'),
(773, 1, 146, '2021-06-30 16:16:41', 'Ingreso', 'A crear Reunion'),
(774, 1, 146, '2021-06-30 16:16:55', 'Ingreso', 'A crear Reunion'),
(775, 1, 146, '2021-06-30 16:22:16', 'Ingreso', 'A crear Reunion'),
(776, 1, 146, '2021-06-30 16:22:31', 'Ingreso', 'A crear Reunion'),
(777, 1, 146, '2021-06-30 16:23:28', 'Ingreso', 'A crear Reunion'),
(778, 1, 146, '2021-06-30 16:24:06', 'Ingreso', 'A crear Reunion'),
(779, 1, 146, '2021-06-30 16:26:40', 'Ingreso', 'A crear Reunion'),
(780, 1, 146, '2021-06-30 16:28:52', 'Ingreso', 'A crear Reunion'),
(781, 1, 146, '2021-06-30 16:30:46', 'Ingreso', 'A crear Reunion'),
(782, 1, 146, '2021-06-30 16:35:37', 'Ingreso', 'A crear Reunion'),
(783, 1, 146, '2021-06-30 16:36:04', 'Ingreso', 'A crear Reunion'),
(784, 1, 146, '2021-06-30 16:37:17', 'Ingreso', 'A crear Reunion'),
(785, 1, 146, '2021-06-30 16:37:43', 'Ingreso', 'A crear Reunion'),
(786, 1, 146, '2021-06-30 16:38:55', 'Ingreso', 'A crear Reunion'),
(787, 1, 146, '2021-06-30 16:39:12', 'Ingreso', 'A crear Reunion'),
(788, 1, 146, '2021-06-30 16:39:34', 'Ingreso', 'A crear Reunion'),
(789, 1, 146, '2021-06-30 16:39:46', 'Ingreso', 'A crear Reunion'),
(790, 1, 146, '2021-06-30 16:40:52', 'Ingreso', 'A crear Reunion'),
(791, 1, 146, '2021-06-30 16:46:27', 'Ingreso', 'A crear Reunion'),
(792, 1, 146, '2021-06-30 16:50:55', 'Ingreso', 'A crear Reunion'),
(793, 1, 146, '2021-06-30 16:51:20', 'Ingreso', 'A crear Reunion'),
(794, 1, 146, '2021-06-30 16:51:38', 'Ingreso', 'A crear Reunion'),
(795, 1, 146, '2021-06-30 16:54:09', 'Ingreso', 'A crear Reunion'),
(796, 1, 146, '2021-06-30 17:17:02', 'Ingreso', 'A crear Reunion'),
(797, 1, 156, '2021-06-30 18:18:55', 'Ingreso', 'A Mantenimiento Estado Acta'),
(798, 1, 103, '2021-06-30 18:24:16', 'Ingreso', 'A Lista de Reuniones'),
(799, 1, 146, '2021-06-30 18:28:24', 'Ingreso', 'A crear Reunion'),
(800, 1, 146, '2021-06-30 18:28:35', 'Ingreso', 'A crear Reunion'),
(801, 1, 146, '2021-06-30 18:29:05', 'Ingreso', 'A crear Reunion'),
(802, 1, 146, '2021-06-30 18:32:11', 'Ingreso', 'A crear Reunion'),
(803, 1, 103, '2021-06-30 18:38:29', 'Ingreso', 'A Lista de Reuniones'),
(804, 1, 103, '2021-06-30 18:40:40', 'Ingreso', 'A Lista de Reuniones'),
(805, 1, 103, '2021-06-30 18:46:01', 'Ingreso', 'A Lista de Reuniones'),
(806, 1, 156, '2021-06-30 18:48:59', 'Ingreso', 'A Mantenimiento Estado Acta'),
(807, 1, 156, '2021-06-30 18:49:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(808, 1, 157, '2021-06-30 18:49:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(809, 1, 157, '2021-06-30 18:50:34', 'Ingreso', 'A Mantenimiento Estado Acta'),
(810, 1, 161, '2021-06-30 18:51:30', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(811, 1, 161, '2021-06-30 18:52:38', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(812, 1, 103, '2021-06-30 18:52:50', 'Ingreso', 'A Lista de Reuniones'),
(813, 1, 103, '2021-06-30 18:55:04', 'Ingreso', 'A Lista de Reuniones'),
(814, 1, 146, '2021-07-01 11:41:31', 'Ingreso', 'A crear Reunion'),
(815, 1, 146, '2021-07-01 13:01:53', 'Ingreso', 'A crear Reunion'),
(816, 1, 146, '2021-07-01 13:02:47', 'Ingreso', 'A crear Reunion'),
(817, 1, 146, '2021-07-01 13:03:09', 'Ingreso', 'A crear Reunion'),
(818, 1, 146, '2021-07-01 13:03:28', 'Ingreso', 'A crear Reunion'),
(819, 1, 146, '2021-07-01 13:06:59', 'Ingreso', 'A crear Reunion'),
(820, 1, 146, '2021-07-01 13:07:25', 'Ingreso', 'A crear Reunion'),
(821, 1, 146, '2021-07-01 13:08:43', 'Ingreso', 'A crear Reunion'),
(822, 1, 146, '2021-07-01 13:09:09', 'Ingreso', 'A crear Reunion'),
(823, 1, 146, '2021-07-01 13:09:34', 'Ingreso', 'A crear Reunion'),
(824, 1, 146, '2021-07-01 13:10:13', 'Ingreso', 'A crear Reunion'),
(825, 1, 146, '2021-07-01 13:12:00', 'Ingreso', 'A crear Reunion'),
(826, 1, 146, '2021-07-01 13:16:52', 'Ingreso', 'A crear Reunion'),
(827, 1, 146, '2021-07-01 13:17:16', 'Ingreso', 'A crear Reunion'),
(828, 1, 146, '2021-07-01 13:17:41', 'Ingreso', 'A crear Reunion'),
(829, 1, 146, '2021-07-01 13:17:44', 'Ingreso', 'A crear Reunion'),
(830, 1, 146, '2021-07-01 13:20:01', 'Ingreso', 'A crear Reunion'),
(831, 1, 146, '2021-07-01 13:24:04', 'Ingreso', 'A crear Reunion'),
(832, 1, 146, '2021-07-01 13:25:08', 'Ingreso', 'A crear Reunion'),
(833, 1, 146, '2021-07-01 13:27:08', 'Ingreso', 'A crear Reunion'),
(834, 1, 146, '2021-07-01 13:43:44', 'Ingreso', 'A crear Reunion'),
(835, 1, 146, '2021-07-01 13:46:18', 'Ingreso', 'A crear Reunion'),
(836, 1, 146, '2021-07-01 13:50:22', 'Ingreso', 'A crear Reunion'),
(837, 1, 146, '2021-07-01 15:05:30', 'Ingreso', 'A crear Reunion'),
(838, 1, 146, '2021-07-01 15:47:59', 'Ingreso', 'A crear Reunion'),
(839, 1, 146, '2021-07-01 15:49:48', 'Ingreso', 'A crear Reunion'),
(840, 1, 146, '2021-07-01 15:52:25', 'Ingreso', 'A crear Reunion'),
(841, 1, 146, '2021-07-01 15:56:29', 'Ingreso', 'A crear Reunion'),
(842, 1, 146, '2021-07-01 15:57:41', 'Ingreso', 'A crear Reunion'),
(843, 1, 146, '2021-07-01 15:58:06', 'Ingreso', 'A crear Reunion'),
(844, 1, 146, '2021-07-01 15:58:57', 'Ingreso', 'A crear Reunion'),
(845, 1, 146, '2021-07-01 15:59:52', 'Ingreso', 'A crear Reunion'),
(846, 1, 146, '2021-07-01 16:03:18', 'Ingreso', 'A crear Reunion'),
(847, 1, 146, '2021-07-01 16:07:05', 'Ingreso', 'A crear Reunion'),
(848, 1, 146, '2021-07-01 16:07:24', 'Ingreso', 'A crear Reunion'),
(849, 1, 146, '2021-07-01 16:16:38', 'Ingreso', 'A crear Reunion'),
(850, 1, 146, '2021-07-01 16:18:54', 'Ingreso', 'A crear Reunion'),
(851, 1, 146, '2021-07-01 16:21:27', 'Ingreso', 'A crear Reunion'),
(852, 1, 146, '2021-07-01 16:22:52', 'Ingreso', 'A crear Reunion'),
(853, 1, 146, '2021-07-01 16:29:28', 'Ingreso', 'A crear Reunion'),
(854, 1, 146, '2021-07-01 16:30:36', 'Ingreso', 'A crear Reunion'),
(855, 1, 146, '2021-07-01 16:54:15', 'Ingreso', 'A crear Reunion'),
(856, 1, 146, '2021-07-01 16:54:19', 'Ingreso', 'A crear Reunion'),
(857, 1, 146, '2021-07-01 16:55:26', 'Ingreso', 'A crear Reunion'),
(858, 1, 146, '2021-07-01 16:57:01', 'Ingreso', 'A crear Reunion'),
(859, 1, 146, '2021-07-01 17:05:37', 'Ingreso', 'A crear Reunion'),
(860, 1, 146, '2021-07-01 17:13:12', 'Ingreso', 'A crear Reunion'),
(861, 1, 146, '2021-07-01 17:19:03', 'Ingreso', 'A crear Reunion'),
(862, 1, 146, '2021-07-01 17:22:08', 'Ingreso', 'A crear Reunion'),
(863, 1, 146, '2021-07-01 17:26:10', 'Ingreso', 'A crear Reunion'),
(864, 1, 146, '2021-07-01 17:26:27', 'Ingreso', 'A crear Reunion'),
(865, 1, 146, '2021-07-01 17:27:05', 'Ingreso', 'A crear Reunion'),
(866, 1, 146, '2021-07-01 17:27:56', 'Ingreso', 'A crear Reunion'),
(867, 1, 146, '2021-07-01 17:28:26', 'Ingreso', 'A crear Reunion'),
(868, 1, 146, '2021-07-01 17:28:48', 'Ingreso', 'A crear Reunion'),
(869, 1, 146, '2021-07-01 17:32:17', 'Ingreso', 'A crear Reunion'),
(870, 1, 146, '2021-07-01 17:34:08', 'Ingreso', 'A crear Reunion'),
(871, 1, 146, '2021-07-01 17:37:11', 'Ingreso', 'A crear Reunion'),
(872, 1, 146, '2021-07-01 17:52:34', 'Ingreso', 'A crear Reunion'),
(873, 1, 146, '2021-07-01 17:54:38', 'Ingreso', 'A crear Reunion'),
(874, 1, 146, '2021-07-01 17:56:58', 'Ingreso', 'A crear Reunion'),
(875, 1, 146, '2021-07-01 18:01:28', 'Ingreso', 'A crear Reunion'),
(876, 1, 146, '2021-07-01 18:02:08', 'Ingreso', 'A crear Reunion'),
(877, 1, 146, '2021-07-01 18:02:39', 'Ingreso', 'A crear Reunion'),
(878, 1, 146, '2021-07-01 18:03:49', 'Ingreso', 'A crear Reunion'),
(879, 1, 146, '2021-07-01 18:05:49', 'Ingreso', 'A crear Reunion'),
(880, 1, 146, '2021-07-01 18:08:27', 'Ingreso', 'A crear Reunion'),
(881, 1, 146, '2021-07-01 18:10:20', 'Ingreso', 'A crear Reunion'),
(882, 1, 146, '2021-07-01 18:16:05', 'Ingreso', 'A crear Reunion'),
(883, 1, 146, '2021-07-01 18:16:08', 'Ingreso', 'A crear Reunion'),
(884, 1, 146, '2021-07-01 18:18:35', 'Ingreso', 'A crear Reunion'),
(885, 1, 146, '2021-07-01 18:19:40', 'Ingreso', 'A crear Reunion'),
(886, 1, 146, '2021-07-01 18:24:05', 'Ingreso', 'A crear Reunion'),
(887, 1, 146, '2021-07-01 18:31:54', 'Ingreso', 'A crear Reunion'),
(888, 1, 146, '2021-07-01 18:33:32', 'Ingreso', 'A crear Reunion'),
(889, 1, 146, '2021-07-01 18:37:30', 'Ingreso', 'A crear Reunion'),
(890, 1, 146, '2021-07-01 18:47:29', 'Ingreso', 'A crear Reunion'),
(891, 1, 146, '2021-07-01 19:02:38', 'Ingreso', 'A crear Reunion'),
(892, 1, 146, '2021-07-01 19:02:45', 'Ingreso', 'A crear Reunion'),
(893, 1, 146, '2021-07-01 19:02:52', 'Ingreso', 'A crear Reunion'),
(894, 1, 146, '2021-07-01 19:04:12', 'Ingreso', 'A crear Reunion'),
(895, 1, 146, '2021-07-01 19:09:31', 'Ingreso', 'A crear Reunion'),
(896, 1, 146, '2021-07-01 19:13:50', 'Ingreso', 'A crear Reunion'),
(897, 1, 146, '2021-07-01 19:52:40', 'Ingreso', 'A crear Reunion'),
(898, 1, 146, '2021-07-01 19:54:12', 'Ingreso', 'A crear Reunion'),
(899, 1, 146, '2021-07-01 20:09:36', 'Ingreso', 'A crear Reunion'),
(900, 1, 146, '2021-07-02 09:59:20', 'Ingreso', 'A crear Reunion'),
(901, 1, 146, '2021-07-02 10:25:46', 'Ingreso', 'A crear Reunion'),
(902, 1, 146, '2021-07-02 11:29:50', 'Ingreso', 'A crear Reunion'),
(903, 1, 146, '2021-07-02 11:36:35', 'Ingreso', 'A crear Reunion'),
(904, 1, 146, '2021-07-02 11:39:52', 'Ingreso', 'A crear Reunion'),
(905, 1, 146, '2021-07-02 12:00:10', 'Ingreso', 'A crear Reunion'),
(906, 1, 146, '2021-07-02 12:37:46', 'Ingreso', 'A crear Reunion'),
(907, 1, 146, '2021-07-02 13:09:08', 'Ingreso', 'A crear Reunion'),
(908, 1, 146, '2021-07-02 16:05:55', 'Ingreso', 'A crear Reunion'),
(909, 1, 146, '2021-07-02 16:06:07', 'Ingreso', 'A crear Reunion'),
(910, 1, 146, '2021-07-02 16:06:48', 'Ingreso', 'A crear Reunion'),
(911, 1, 146, '2021-07-02 16:12:31', 'Ingreso', 'A crear Reunion'),
(912, 1, 146, '2021-07-02 16:14:36', 'Ingreso', 'A crear Reunion'),
(913, 1, 146, '2021-07-02 16:15:04', 'Ingreso', 'A crear Reunion'),
(914, 1, 146, '2021-07-02 16:16:26', 'Ingreso', 'A crear Reunion'),
(915, 1, 146, '2021-07-02 16:17:12', 'Ingreso', 'A crear Reunion'),
(916, 1, 146, '2021-07-02 16:18:21', 'Ingreso', 'A crear Reunion'),
(917, 1, 146, '2021-07-02 16:18:28', 'Ingreso', 'A crear Reunion'),
(918, 1, 146, '2021-07-02 16:27:35', 'Ingreso', 'A crear Reunion'),
(919, 1, 146, '2021-07-02 16:27:58', 'Ingreso', 'A crear Reunion'),
(920, 1, 146, '2021-07-02 16:29:13', 'Ingreso', 'A crear Reunion'),
(921, 1, 146, '2021-07-02 16:30:05', 'Ingreso', 'A crear Reunion'),
(922, 1, 146, '2021-07-02 16:30:43', 'Ingreso', 'A crear Reunion'),
(923, 1, 146, '2021-07-02 16:32:58', 'Ingreso', 'A crear Reunion'),
(924, 1, 146, '2021-07-02 16:33:15', 'Ingreso', 'A crear Reunion'),
(925, 1, 146, '2021-07-02 16:33:20', 'Ingreso', 'A crear Reunion'),
(926, 1, 146, '2021-07-02 16:35:08', 'Ingreso', 'A crear Reunion'),
(927, 1, 146, '2021-07-02 16:35:19', 'Ingreso', 'A crear Reunion'),
(928, 1, 146, '2021-07-02 16:35:27', 'Ingreso', 'A crear Reunion'),
(929, 1, 146, '2021-07-02 16:36:35', 'Ingreso', 'A crear Reunion'),
(930, 1, 146, '2021-07-02 16:36:39', 'Ingreso', 'A crear Reunion'),
(931, 1, 146, '2021-07-02 16:37:31', 'Ingreso', 'A crear Reunion'),
(932, 1, 156, '2021-07-02 16:37:52', 'Ingreso', 'A Mantenimiento Estado Acta'),
(933, 1, 156, '2021-07-02 16:38:11', 'Ingreso', 'A Mantenimiento Estado Acta'),
(934, 1, 156, '2021-07-02 16:38:21', 'Ingreso', 'A Mantenimiento Estado Acta'),
(935, 1, 146, '2021-07-02 16:38:27', 'Ingreso', 'A crear Reunion'),
(936, 1, 146, '2021-07-02 16:38:41', 'Ingreso', 'A crear Reunion'),
(937, 1, 146, '2021-07-02 17:00:29', 'Ingreso', 'A crear Reunion'),
(938, 1, 146, '2021-07-02 17:01:23', 'Ingreso', 'A crear Reunion'),
(939, 1, 146, '2021-07-02 17:01:41', 'Ingreso', 'A crear Reunion'),
(940, 1, 146, '2021-07-02 17:07:02', 'Ingreso', 'A crear Reunion'),
(941, 1, 146, '2021-07-02 17:07:28', 'Ingreso', 'A crear Reunion'),
(942, 1, 146, '2021-07-02 17:09:33', 'Ingreso', 'A crear Reunion'),
(943, 1, 146, '2021-07-02 17:09:49', 'Ingreso', 'A crear Reunion'),
(944, 1, 146, '2021-07-02 17:15:54', 'Ingreso', 'A crear Reunion'),
(945, 1, 146, '2021-07-02 17:16:24', 'Ingreso', 'A crear Reunion'),
(946, 1, 146, '2021-07-02 17:17:57', 'Ingreso', 'A crear Reunion'),
(947, 1, 146, '2021-07-02 17:19:35', 'Ingreso', 'A crear Reunion'),
(948, 1, 146, '2021-07-02 17:41:15', 'Ingreso', 'A crear Reunion'),
(949, 1, 146, '2021-07-02 17:53:48', 'Ingreso', 'A crear Reunion'),
(950, 1, 146, '2021-07-02 18:12:07', 'Ingreso', 'A crear Reunion'),
(951, 1, 146, '2021-07-02 18:16:15', 'Ingreso', 'A crear Reunion'),
(952, 1, 146, '2021-07-02 18:19:04', 'Ingreso', 'A crear Reunion'),
(953, 1, 146, '2021-07-02 18:19:25', 'Ingreso', 'A crear Reunion'),
(954, 1, 146, '2021-07-02 18:19:52', 'Ingreso', 'A crear Reunion'),
(955, 1, 146, '2021-07-02 18:21:19', 'Ingreso', 'A crear Reunion'),
(956, 1, 146, '2021-07-02 18:21:37', 'Ingreso', 'A crear Reunion'),
(957, 1, 146, '2021-07-03 09:58:30', 'Ingreso', 'A crear Reunion'),
(958, 1, 146, '2021-07-03 09:59:39', 'Ingreso', 'A crear Reunion'),
(959, 1, 146, '2021-07-03 10:07:41', 'Ingreso', 'A crear Reunion'),
(960, 1, 146, '2021-07-03 10:08:16', 'Ingreso', 'A crear Reunion'),
(961, 1, 146, '2021-07-03 10:20:06', 'Ingreso', 'A crear Reunion'),
(962, 1, 146, '2021-07-03 10:20:25', 'Ingreso', 'A crear Reunion'),
(963, 1, 146, '2021-07-03 10:29:19', 'Ingreso', 'A crear Reunion'),
(964, 1, 146, '2021-07-03 10:29:36', 'Ingreso', 'A crear Reunion'),
(965, 1, 146, '2021-07-03 10:29:54', 'Ingreso', 'A crear Reunion'),
(966, 1, 146, '2021-07-03 10:30:09', 'Ingreso', 'A crear Reunion'),
(967, 1, 146, '2021-07-03 10:30:59', 'Ingreso', 'A crear Reunion'),
(968, 1, 146, '2021-07-03 10:31:22', 'Ingreso', 'A crear Reunion'),
(969, 1, 146, '2021-07-03 10:43:38', 'Ingreso', 'A crear Reunion'),
(970, 1, 146, '2021-07-03 10:46:18', 'Ingreso', 'A crear Reunion'),
(971, 1, 146, '2021-07-03 10:51:00', 'Ingreso', 'A crear Reunion'),
(972, 1, 146, '2021-07-03 12:29:25', 'Ingreso', 'A crear Reunion'),
(973, 1, 146, '2021-07-03 12:36:29', 'Ingreso', 'A crear Reunion'),
(974, 1, 146, '2021-07-03 12:36:59', 'Ingreso', 'A crear Reunion'),
(975, 1, 146, '2021-07-03 12:40:28', 'Ingreso', 'A crear Reunion'),
(976, 1, 146, '2021-07-03 12:45:37', 'Ingreso', 'A crear Reunion'),
(977, 1, 146, '2021-07-03 12:45:51', 'Ingreso', 'A crear Reunion'),
(978, 1, 146, '2021-07-03 12:51:56', 'Ingreso', 'A crear Reunion'),
(979, 1, 146, '2021-07-03 12:52:27', 'Ingreso', 'A crear Reunion'),
(980, 1, 146, '2021-07-03 12:53:16', 'Ingreso', 'A crear Reunion'),
(981, 1, 146, '2021-07-03 13:06:05', 'Ingreso', 'A crear Reunion'),
(982, 1, 146, '2021-07-03 13:13:14', 'Ingreso', 'A crear Reunion'),
(983, 1, 146, '2021-07-03 13:14:19', 'Ingreso', 'A crear Reunion'),
(984, 1, 156, '2021-07-03 13:16:03', 'Ingreso', 'A Mantenimiento Estado Acta'),
(985, 1, 156, '2021-07-03 13:16:21', 'Ingreso', 'A Mantenimiento Estado Acta'),
(986, 1, 146, '2021-07-03 18:15:58', 'Ingreso', 'A crear Reunion'),
(987, 1, 156, '2021-07-03 18:24:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(988, 1, 146, '2021-07-03 18:27:54', 'Ingreso', 'A crear Reunion'),
(989, 1, 146, '2021-07-03 18:32:19', 'Ingreso', 'A crear Reunion'),
(990, 1, 146, '2021-07-03 18:32:47', 'Ingreso', 'A crear Reunion'),
(991, 1, 146, '2021-07-03 18:33:08', 'Ingreso', 'A crear Reunion'),
(992, 1, 146, '2021-07-03 18:45:06', 'Ingreso', 'A crear Reunion'),
(993, 1, 146, '2021-07-03 18:46:13', 'Ingreso', 'A crear Reunion'),
(994, 1, 146, '2021-07-03 18:46:31', 'Ingreso', 'A crear Reunion'),
(995, 1, 146, '2021-07-03 18:47:14', 'Ingreso', 'A crear Reunion'),
(996, 1, 146, '2021-07-03 18:48:05', 'Ingreso', 'A crear Reunion'),
(997, 1, 146, '2021-07-03 18:48:20', 'Ingreso', 'A crear Reunion'),
(998, 1, 146, '2021-07-03 18:50:23', 'Ingreso', 'A crear Reunion'),
(999, 1, 146, '2021-07-03 18:50:49', 'Ingreso', 'A crear Reunion'),
(1000, 1, 146, '2021-07-03 18:51:58', 'Ingreso', 'A crear Reunion'),
(1001, 1, 146, '2021-07-03 18:52:05', 'Ingreso', 'A crear Reunion'),
(1002, 1, 146, '2021-07-03 18:53:37', 'Ingreso', 'A crear Reunion'),
(1003, 1, 146, '2021-07-03 18:55:53', 'Ingreso', 'A crear Reunion'),
(1004, 1, 146, '2021-07-03 19:02:02', 'Ingreso', 'A crear Reunion'),
(1005, 1, 146, '2021-07-03 19:02:19', 'Ingreso', 'A crear Reunion'),
(1006, 1, 146, '2021-07-03 19:02:31', 'Ingreso', 'A crear Reunion'),
(1007, 1, 146, '2021-07-03 19:02:42', 'Ingreso', 'A crear Reunion'),
(1008, 1, 146, '2021-07-03 19:04:34', 'Ingreso', 'A crear Reunion'),
(1009, 1, 146, '2021-07-03 19:07:12', 'Ingreso', 'A crear Reunion'),
(1010, 1, 146, '2021-07-03 19:08:20', 'Ingreso', 'A crear Reunion'),
(1011, 1, 146, '2021-07-03 19:08:54', 'Ingreso', 'A crear Reunion'),
(1012, 1, 146, '2021-07-03 19:08:57', 'Ingreso', 'A crear Reunion'),
(1013, 1, 146, '2021-07-03 19:09:28', 'Ingreso', 'A crear Reunion'),
(1014, 1, 146, '2021-07-03 19:09:51', 'Ingreso', 'A crear Reunion'),
(1015, 1, 146, '2021-07-03 19:10:59', 'Ingreso', 'A crear Reunion'),
(1016, 1, 146, '2021-07-03 19:11:34', 'Ingreso', 'A crear Reunion'),
(1017, 1, 146, '2021-07-03 19:13:03', 'Ingreso', 'A crear Reunion'),
(1018, 1, 146, '2021-07-03 19:17:25', 'Ingreso', 'A crear Reunion'),
(1019, 1, 146, '2021-07-03 19:18:01', 'Ingreso', 'A crear Reunion'),
(1020, 1, 146, '2021-07-03 19:19:08', 'Ingreso', 'A crear Reunion'),
(1021, 1, 146, '2021-07-03 19:22:50', 'Ingreso', 'A crear Reunion'),
(1022, 1, 146, '2021-07-03 19:22:56', 'Ingreso', 'A crear Reunion'),
(1023, 1, 146, '2021-07-03 19:23:04', 'Ingreso', 'A crear Reunion'),
(1024, 1, 146, '2021-07-03 19:23:43', 'Ingreso', 'A crear Reunion'),
(1025, 1, 146, '2021-07-03 19:24:38', 'Ingreso', 'A crear Reunion'),
(1026, 1, 146, '2021-07-03 19:24:58', 'Ingreso', 'A crear Reunion'),
(1027, 1, 146, '2021-07-03 19:26:04', 'Ingreso', 'A crear Reunion'),
(1028, 1, 146, '2021-07-03 19:27:26', 'Ingreso', 'A crear Reunion'),
(1029, 1, 146, '2021-07-03 19:28:29', 'Ingreso', 'A crear Reunion'),
(1030, 1, 146, '2021-07-03 19:29:02', 'Ingreso', 'A crear Reunion'),
(1031, 1, 146, '2021-07-03 19:29:18', 'Ingreso', 'A crear Reunion'),
(1032, 1, 146, '2021-07-03 19:29:44', 'Ingreso', 'A crear Reunion'),
(1033, 1, 146, '2021-07-03 19:29:54', 'Ingreso', 'A crear Reunion'),
(1034, 1, 146, '2021-07-03 19:30:15', 'Ingreso', 'A crear Reunion'),
(1035, 1, 146, '2021-07-03 19:31:52', 'Ingreso', 'A crear Reunion'),
(1036, 1, 146, '2021-07-03 19:32:10', 'Ingreso', 'A crear Reunion'),
(1037, 1, 146, '2021-07-03 19:33:25', 'Ingreso', 'A crear Reunion'),
(1038, 1, 146, '2021-07-03 19:33:45', 'Ingreso', 'A crear Reunion'),
(1039, 1, 146, '2021-07-03 19:34:11', 'Ingreso', 'A crear Reunion'),
(1040, 1, 146, '2021-07-03 19:34:33', 'Ingreso', 'A crear Reunion'),
(1041, 1, 146, '2021-07-03 19:35:10', 'Ingreso', 'A crear Reunion'),
(1042, 1, 146, '2021-07-03 19:35:21', 'Ingreso', 'A crear Reunion'),
(1043, 1, 146, '2021-07-03 19:37:16', 'Ingreso', 'A crear Reunion'),
(1044, 1, 146, '2021-07-03 19:37:28', 'Ingreso', 'A crear Reunion'),
(1045, 1, 146, '2021-07-03 19:38:21', 'Ingreso', 'A crear Reunion'),
(1046, 1, 146, '2021-07-03 19:43:24', 'Ingreso', 'A crear Reunion'),
(1047, 1, 146, '2021-07-03 19:43:46', 'Ingreso', 'A crear Reunion'),
(1048, 1, 146, '2021-07-03 19:50:13', 'Ingreso', 'A crear Reunion'),
(1049, 1, 146, '2021-07-03 19:51:12', 'Ingreso', 'A crear Reunion'),
(1050, 1, 146, '2021-07-03 19:52:37', 'Ingreso', 'A crear Reunion'),
(1051, 1, 146, '2021-07-03 19:53:14', 'Ingreso', 'A crear Reunion'),
(1052, 1, 146, '2021-07-03 19:53:31', 'Ingreso', 'A crear Reunion'),
(1053, 1, 146, '2021-07-03 19:54:01', 'Ingreso', 'A crear Reunion'),
(1054, 1, 146, '2021-07-03 19:59:58', 'Ingreso', 'A crear Reunion'),
(1055, 1, 146, '2021-07-03 20:09:11', 'Ingreso', 'A crear Reunion'),
(1056, 1, 146, '2021-07-03 20:09:24', 'Ingreso', 'A crear Reunion'),
(1057, 1, 146, '2021-07-03 20:09:42', 'Ingreso', 'A crear Reunion'),
(1058, 1, 146, '2021-07-03 20:19:39', 'Ingreso', 'A crear Reunion'),
(1059, 1, 146, '2021-07-03 20:33:04', 'Ingreso', 'A crear Reunion'),
(1060, 1, 146, '2021-07-03 20:44:44', 'Ingreso', 'A crear Reunion'),
(1061, 1, 103, '2021-07-03 20:44:50', 'Ingreso', 'A Lista de Reuniones'),
(1062, 1, 146, '2021-07-03 20:47:54', 'Ingreso', 'A crear Reunion'),
(1063, 1, 103, '2021-07-03 20:50:42', 'Ingreso', 'A Lista de Reuniones'),
(1064, 1, 103, '2021-07-03 20:51:55', 'Ingreso', 'A Lista de Reuniones'),
(1065, 1, 146, '2021-07-04 17:47:12', 'Ingreso', 'A crear Reunion'),
(1066, 1, 146, '2021-07-04 17:48:33', 'Ingreso', 'A crear Reunion'),
(1067, 1, 146, '2021-07-04 17:49:35', 'Ingreso', 'A crear Reunion'),
(1068, 1, 146, '2021-07-04 17:52:25', 'Ingreso', 'A crear Reunion'),
(1069, 1, 146, '2021-07-04 17:53:59', 'Ingreso', 'A crear Reunion'),
(1070, 1, 146, '2021-07-04 17:55:09', 'Ingreso', 'A crear Reunion'),
(1071, 1, 146, '2021-07-04 17:56:02', 'Ingreso', 'A crear Reunion'),
(1072, 1, 146, '2021-07-04 18:21:27', 'Ingreso', 'A crear Reunion'),
(1073, 1, 146, '2021-07-05 10:41:53', 'Ingreso', 'A crear Reunion'),
(1074, 1, 103, '2021-07-05 10:43:23', 'Ingreso', 'A Lista de Reuniones'),
(1075, 1, 103, '2021-07-05 10:44:36', 'Ingreso', 'A Lista de Reuniones'),
(1076, 1, 103, '2021-07-05 10:45:38', 'Ingreso', 'A Lista de Reuniones'),
(1077, 1, 103, '2021-07-05 10:46:39', 'Ingreso', 'A Lista de Reuniones'),
(1078, 1, 103, '2021-07-05 10:47:03', 'Ingreso', 'A Lista de Reuniones'),
(1079, 1, 103, '2021-07-05 10:47:12', 'Ingreso', 'A Lista de Reuniones'),
(1080, 1, 103, '2021-07-05 10:49:04', 'Ingreso', 'A Lista de Reuniones'),
(1081, 1, 103, '2021-07-05 10:50:39', 'Ingreso', 'A Lista de Reuniones'),
(1082, 1, 103, '2021-07-05 11:10:44', 'Ingreso', 'A Lista de Reuniones'),
(1083, 1, 103, '2021-07-05 11:13:21', 'Ingreso', 'A Lista de Reuniones'),
(1084, 1, 103, '2021-07-05 11:15:02', 'Ingreso', 'A Lista de Reuniones'),
(1085, 1, 103, '2021-07-05 11:18:28', 'Ingreso', 'A Lista de Reuniones'),
(1086, 1, 103, '2021-07-05 11:18:39', 'Ingreso', 'A Lista de Reuniones'),
(1087, 1, 103, '2021-07-05 11:18:43', 'Ingreso', 'A Lista de Reuniones'),
(1088, 1, 103, '2021-07-05 11:19:21', 'Ingreso', 'A Lista de Reuniones'),
(1089, 1, 103, '2021-07-05 11:21:46', 'Ingreso', 'A Lista de Reuniones'),
(1090, 1, 103, '2021-07-05 11:23:09', 'Ingreso', 'A Lista de Reuniones'),
(1091, 1, 103, '2021-07-05 11:23:24', 'Ingreso', 'A Lista de Reuniones'),
(1092, 1, 103, '2021-07-05 11:23:30', 'Ingreso', 'A Lista de Reuniones'),
(1093, 1, 103, '2021-07-05 11:23:58', 'Ingreso', 'A Lista de Reuniones'),
(1094, 1, 103, '2021-07-05 11:24:04', 'Ingreso', 'A Lista de Reuniones'),
(1095, 1, 103, '2021-07-05 11:24:22', 'Ingreso', 'A Lista de Reuniones'),
(1096, 1, 103, '2021-07-05 11:25:44', 'Ingreso', 'A Lista de Reuniones'),
(1097, 1, 103, '2021-07-05 11:26:09', 'Ingreso', 'A Lista de Reuniones'),
(1098, 1, 103, '2021-07-05 11:26:17', 'Ingreso', 'A Lista de Reuniones'),
(1099, 1, 103, '2021-07-05 11:29:00', 'Ingreso', 'A Lista de Reuniones'),
(1100, 1, 103, '2021-07-05 11:29:30', 'Ingreso', 'A Lista de Reuniones'),
(1101, 1, 103, '2021-07-05 11:31:02', 'Ingreso', 'A Lista de Reuniones'),
(1102, 1, 103, '2021-07-05 11:34:15', 'Ingreso', 'A Lista de Reuniones'),
(1103, 1, 103, '2021-07-05 11:34:48', 'Ingreso', 'A Lista de Reuniones'),
(1104, 1, 103, '2021-07-05 11:35:51', 'Ingreso', 'A Lista de Reuniones'),
(1105, 1, 103, '2021-07-05 11:35:54', 'Ingreso', 'A Lista de Reuniones'),
(1106, 1, 103, '2021-07-05 11:36:45', 'Ingreso', 'A Lista de Reuniones'),
(1107, 1, 103, '2021-07-05 11:38:57', 'Ingreso', 'A Lista de Reuniones'),
(1108, 1, 103, '2021-07-05 11:39:25', 'Ingreso', 'A Lista de Reuniones'),
(1109, 1, 103, '2021-07-05 11:39:45', 'Ingreso', 'A Lista de Reuniones'),
(1110, 1, 103, '2021-07-05 11:43:09', 'Ingreso', 'A Lista de Reuniones'),
(1111, 1, 103, '2021-07-05 11:43:13', 'Ingreso', 'A Lista de Reuniones'),
(1112, 1, 103, '2021-07-05 11:44:33', 'Ingreso', 'A Lista de Reuniones'),
(1113, 1, 103, '2021-07-05 11:46:15', 'Ingreso', 'A Lista de Reuniones'),
(1114, 1, 103, '2021-07-05 11:49:02', 'Ingreso', 'A Lista de Reuniones'),
(1115, 1, 103, '2021-07-05 11:51:16', 'Ingreso', 'A Lista de Reuniones'),
(1116, 1, 103, '2021-07-05 11:51:19', 'Ingreso', 'A Lista de Reuniones'),
(1117, 1, 103, '2021-07-05 11:51:49', 'Ingreso', 'A Lista de Reuniones'),
(1118, 1, 103, '2021-07-05 11:52:03', 'Ingreso', 'A Lista de Reuniones'),
(1119, 1, 103, '2021-07-05 11:52:45', 'Ingreso', 'A Lista de Reuniones'),
(1120, 1, 103, '2021-07-05 11:53:58', 'Ingreso', 'A Lista de Reuniones'),
(1121, 1, 103, '2021-07-05 12:04:01', 'Ingreso', 'A Lista de Reuniones'),
(1122, 1, 103, '2021-07-05 12:04:54', 'Ingreso', 'A Lista de Reuniones'),
(1123, 1, 103, '2021-07-05 12:05:49', 'Ingreso', 'A Lista de Reuniones'),
(1124, 1, 103, '2021-07-05 12:06:15', 'Ingreso', 'A Lista de Reuniones'),
(1125, 1, 103, '2021-07-05 12:11:21', 'Ingreso', 'A Lista de Reuniones'),
(1126, 1, 103, '2021-07-05 12:11:36', 'Ingreso', 'A Lista de Reuniones'),
(1127, 1, 103, '2021-07-05 12:11:57', 'Ingreso', 'A Lista de Reuniones'),
(1128, 1, 103, '2021-07-05 12:12:35', 'Ingreso', 'A Lista de Reuniones'),
(1129, 1, 103, '2021-07-05 12:13:58', 'Ingreso', 'A Lista de Reuniones'),
(1130, 1, 103, '2021-07-05 12:17:59', 'Ingreso', 'A Lista de Reuniones'),
(1131, 1, 103, '2021-07-05 12:18:02', 'Ingreso', 'A Lista de Reuniones'),
(1132, 1, 103, '2021-07-05 12:18:05', 'Ingreso', 'A Lista de Reuniones'),
(1133, 1, 103, '2021-07-05 12:18:27', 'Ingreso', 'A Lista de Reuniones'),
(1134, 1, 103, '2021-07-05 12:19:03', 'Ingreso', 'A Lista de Reuniones'),
(1135, 1, 103, '2021-07-05 12:19:51', 'Ingreso', 'A Lista de Reuniones'),
(1136, 1, 103, '2021-07-05 12:20:00', 'Ingreso', 'A Lista de Reuniones'),
(1137, 1, 103, '2021-07-05 12:20:13', 'Ingreso', 'A Lista de Reuniones'),
(1138, 1, 103, '2021-07-05 12:20:17', 'Ingreso', 'A Lista de Reuniones'),
(1139, 1, 103, '2021-07-05 12:22:04', 'Ingreso', 'A Lista de Reuniones'),
(1140, 1, 103, '2021-07-05 12:22:24', 'Ingreso', 'A Lista de Reuniones'),
(1141, 1, 103, '2021-07-05 12:22:38', 'Ingreso', 'A Lista de Reuniones'),
(1142, 1, 146, '2021-07-05 12:24:09', 'Ingreso', 'A crear Reunion'),
(1143, 1, 103, '2021-07-05 12:26:16', 'Ingreso', 'A Lista de Reuniones'),
(1144, 1, 103, '2021-07-05 12:26:43', 'Ingreso', 'A Lista de Reuniones'),
(1145, 1, 103, '2021-07-05 12:27:12', 'Ingreso', 'A Lista de Reuniones'),
(1146, 1, 103, '2021-07-05 12:28:54', 'Ingreso', 'A Lista de Reuniones'),
(1147, 1, 103, '2021-07-05 12:29:13', 'Ingreso', 'A Lista de Reuniones'),
(1148, 1, 103, '2021-07-05 15:20:24', 'Ingreso', 'A Lista de Reuniones'),
(1149, 1, 151, '2021-07-05 15:30:58', 'Ingreso', 'A crear Acuerdo'),
(1150, 1, 7, '2021-07-05 15:31:28', 'Ingreso', 'A Gestion de Parametros'),
(1151, 1, 7, '2021-07-05 15:31:41', 'Ingreso', 'A Gestion de Parametros'),
(1152, 1, 7, '2021-07-05 15:31:46', 'Ingreso', 'A Gestion de Parametros'),
(1153, 1, 151, '2021-07-05 15:32:31', 'Ingreso', 'A crear Acuerdo'),
(1154, 1, 7, '2021-07-05 15:33:17', 'Ingreso', 'A Gestion de Parametros'),
(1155, 1, 151, '2021-07-05 15:37:50', 'Ingreso', 'A crear Acuerdo'),
(1156, 1, 151, '2021-07-05 15:40:39', 'Ingreso', 'A crear Acuerdo'),
(1157, 1, 151, '2021-07-05 15:43:53', 'Ingreso', 'A crear Acuerdo'),
(1158, 1, 151, '2021-07-05 15:44:15', 'Ingreso', 'A crear Acuerdo'),
(1159, 1, 151, '2021-07-05 15:44:19', 'Ingreso', 'A crear Acuerdo'),
(1160, 1, 151, '2021-07-05 15:44:54', 'Ingreso', 'A crear Acuerdo'),
(1161, 1, 151, '2021-07-05 15:47:53', 'Ingreso', 'A crear Acuerdo'),
(1162, 1, 151, '2021-07-05 15:48:14', 'Ingreso', 'A crear Acuerdo'),
(1163, 1, 151, '2021-07-05 15:48:17', 'Ingreso', 'A crear Acuerdo'),
(1164, 1, 7, '2021-07-05 15:49:59', 'Ingreso', 'A Gestion de Parametros'),
(1165, 1, 7, '2021-07-05 15:50:17', 'Ingreso', 'A Gestion de Parametros'),
(1166, 1, 7, '2021-07-05 15:50:22', 'Ingreso', 'A Gestion de Parametros'),
(1167, 1, 7, '2021-07-05 15:51:35', 'Ingreso', 'A Gestion de Parametros'),
(1168, 1, 151, '2021-07-05 15:52:07', 'Ingreso', 'A crear Acuerdo'),
(1169, 1, 151, '2021-07-05 15:54:25', 'Ingreso', 'A crear Acuerdo'),
(1170, 1, 7, '2021-07-05 15:54:40', 'Ingreso', 'A Gestion de Parametros'),
(1171, 1, 7, '2021-07-05 15:59:08', 'Ingreso', 'A Gestion de Parametros'),
(1172, 1, 7, '2021-07-05 16:00:02', 'Ingreso', 'A Gestion de Parametros'),
(1173, 1, 7, '2021-07-05 16:02:46', 'Ingreso', 'A Gestion de Parametros'),
(1174, 1, 7, '2021-07-05 16:12:45', 'Ingreso', 'A Gestion de Parametros'),
(1175, 1, 103, '2021-07-05 18:45:49', 'Ingreso', 'A Lista de Reuniones'),
(1176, 1, 103, '2021-07-05 18:46:04', 'Ingreso', 'A Lista de Reuniones'),
(1177, 1, 103, '2021-07-05 18:47:19', 'Ingreso', 'A Lista de Reuniones'),
(1178, 1, 103, '2021-07-05 18:47:27', 'Ingreso', 'A Lista de Reuniones'),
(1179, 1, 103, '2021-07-05 18:48:06', 'Ingreso', 'A Lista de Reuniones'),
(1180, 1, 103, '2021-07-05 18:49:13', 'Ingreso', 'A Lista de Reuniones'),
(1181, 1, 103, '2021-07-05 18:51:42', 'Ingreso', 'A Lista de Reuniones'),
(1182, 1, 103, '2021-07-05 18:52:08', 'Ingreso', 'A Lista de Reuniones'),
(1183, 1, 103, '2021-07-05 18:52:57', 'Ingreso', 'A Lista de Reuniones'),
(1184, 1, 103, '2021-07-05 18:53:48', 'Ingreso', 'A Lista de Reuniones'),
(1185, 1, 103, '2021-07-05 18:55:09', 'Ingreso', 'A Lista de Reuniones'),
(1186, 1, 103, '2021-07-05 19:05:52', 'Ingreso', 'A Lista de Reuniones'),
(1187, 1, 103, '2021-07-05 19:07:53', 'Ingreso', 'A Lista de Reuniones'),
(1188, 1, 161, '2021-07-05 19:08:14', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(1189, 1, 10, '2021-07-05 19:08:25', 'Ingreso', 'A Gestion de permisos usuarios'),
(1190, 1, 10, '2021-07-05 19:08:34', 'Ingreso', 'A Gestion de permisos usuarios'),
(1191, 1, 10, '2021-07-05 19:08:39', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(1192, 1, 10, '2021-07-05 19:08:39', 'Ingreso', 'A Gestion de permisos usuarios'),
(1193, 1, 161, '2021-07-05 19:08:45', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(1194, 1, 161, '2021-07-05 19:09:15', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(1195, 1, 103, '2021-07-05 19:09:21', 'Ingreso', 'A Lista de Reuniones'),
(1196, 1, 103, '2021-07-05 19:20:57', 'Ingreso', 'A Lista de Reuniones'),
(1197, 1, 103, '2021-07-05 19:21:49', 'Ingreso', 'A Lista de Reuniones'),
(1198, 1, 103, '2021-07-05 19:24:26', 'Ingreso', 'A Lista de Reuniones'),
(1199, 1, 103, '2021-07-05 19:24:33', 'Ingreso', 'A Lista de Reuniones'),
(1200, 1, 103, '2021-07-05 19:26:05', 'Ingreso', 'A Lista de Reuniones'),
(1201, 1, 103, '2021-07-05 19:29:05', 'Ingreso', 'A Lista de Reuniones'),
(1202, 1, 103, '2021-07-05 19:33:02', 'Ingreso', 'A Lista de Reuniones'),
(1203, 1, 103, '2021-07-05 19:33:07', 'Ingreso', 'A Lista de Reuniones'),
(1204, 1, 103, '2021-07-05 19:33:33', 'Ingreso', 'A Lista de Reuniones'),
(1205, 1, 151, '2021-07-05 20:28:06', 'Ingreso', 'A crear Acuerdo'),
(1206, 1, 103, '2021-07-06 10:28:32', 'Ingreso', 'A Lista de Reuniones'),
(1207, 1, 103, '2021-07-06 10:35:07', 'Ingreso', 'A Lista de Reuniones'),
(1208, 1, 103, '2021-07-06 10:36:39', 'Ingreso', 'A Lista de Reuniones'),
(1209, 1, 151, '2021-07-06 10:37:02', 'Ingreso', 'A crear Acuerdo'),
(1210, 1, 103, '2021-07-06 10:37:28', 'Ingreso', 'A Lista de Reuniones'),
(1211, 1, 151, '2021-07-06 10:40:35', 'Ingreso', 'A crear Acuerdo'),
(1212, 1, 151, '2021-07-06 10:41:22', 'Ingreso', 'A crear Acuerdo'),
(1213, 1, 151, '2021-07-06 10:42:42', 'Ingreso', 'A crear Acuerdo'),
(1214, 1, 151, '2021-07-06 10:43:10', 'Ingreso', 'A crear Acuerdo'),
(1215, 1, 103, '2021-07-06 10:43:17', 'Ingreso', 'A Lista de Reuniones'),
(1216, 1, 103, '2021-07-06 10:49:51', 'Ingreso', 'A Lista de Reuniones'),
(1217, 1, 103, '2021-07-06 10:55:38', 'Ingreso', 'A Lista de Reuniones'),
(1218, 1, 151, '2021-07-06 11:00:03', 'Ingreso', 'A crear Acuerdo'),
(1219, 1, 151, '2021-07-06 11:07:55', 'Ingreso', 'A crear Acuerdo'),
(1220, 1, 151, '2021-07-06 11:11:37', 'Ingreso', 'A crear Acuerdo'),
(1221, 1, 151, '2021-07-06 11:11:59', 'Ingreso', 'A crear Acuerdo'),
(1222, 1, 151, '2021-07-06 11:15:45', 'Ingreso', 'A crear Acuerdo'),
(1223, 1, 151, '2021-07-06 11:16:39', 'Ingreso', 'A crear Acuerdo'),
(1224, 1, 151, '2021-07-06 11:16:47', 'Ingreso', 'A crear Acuerdo'),
(1225, 1, 151, '2021-07-06 11:17:15', 'Ingreso', 'A crear Acuerdo'),
(1226, 1, 151, '2021-07-06 11:18:48', 'Ingreso', 'A crear Acuerdo'),
(1227, 1, 151, '2021-07-06 11:18:59', 'Ingreso', 'A crear Acuerdo'),
(1228, 1, 151, '2021-07-06 11:19:16', 'Ingreso', 'A crear Acuerdo'),
(1229, 1, 151, '2021-07-06 11:19:28', 'Ingreso', 'A crear Acuerdo'),
(1230, 1, 151, '2021-07-06 11:19:45', 'Ingreso', 'A crear Acuerdo'),
(1231, 1, 151, '2021-07-06 11:19:58', 'Ingreso', 'A crear Acuerdo'),
(1232, 1, 151, '2021-07-06 11:20:13', 'Ingreso', 'A crear Acuerdo'),
(1233, 1, 151, '2021-07-06 11:20:36', 'Ingreso', 'A crear Acuerdo'),
(1234, 1, 151, '2021-07-06 11:20:54', 'Ingreso', 'A crear Acuerdo'),
(1235, 1, 151, '2021-07-06 11:21:05', 'Ingreso', 'A crear Acuerdo'),
(1236, 1, 151, '2021-07-06 11:21:19', 'Ingreso', 'A crear Acuerdo'),
(1237, 1, 151, '2021-07-06 11:21:28', 'Ingreso', 'A crear Acuerdo'),
(1238, 1, 151, '2021-07-06 11:21:39', 'Ingreso', 'A crear Acuerdo'),
(1239, 1, 151, '2021-07-06 11:21:49', 'Ingreso', 'A crear Acuerdo'),
(1240, 1, 151, '2021-07-06 11:23:29', 'Ingreso', 'A crear Acuerdo'),
(1241, 1, 151, '2021-07-06 11:24:09', 'Ingreso', 'A crear Acuerdo'),
(1242, 1, 151, '2021-07-06 11:27:33', 'Ingreso', 'A crear Acuerdo'),
(1243, 1, 151, '2021-07-06 11:28:30', 'Ingreso', 'A crear Acuerdo'),
(1244, 1, 151, '2021-07-06 11:29:10', 'Ingreso', 'A crear Acuerdo'),
(1245, 1, 151, '2021-07-06 11:29:42', 'Ingreso', 'A crear Acuerdo'),
(1246, 1, 151, '2021-07-06 11:30:34', 'Ingreso', 'A crear Acuerdo'),
(1247, 1, 151, '2021-07-06 11:30:47', 'Ingreso', 'A crear Acuerdo'),
(1248, 1, 151, '2021-07-06 11:31:07', 'Ingreso', 'A crear Acuerdo'),
(1249, 1, 151, '2021-07-06 11:31:24', 'Ingreso', 'A crear Acuerdo'),
(1250, 1, 151, '2021-07-06 11:33:04', 'Ingreso', 'A crear Acuerdo'),
(1251, 1, 151, '2021-07-06 11:33:27', 'Ingreso', 'A crear Acuerdo'),
(1252, 1, 151, '2021-07-06 11:33:30', 'Ingreso', 'A crear Acuerdo'),
(1253, 1, 151, '2021-07-06 11:34:58', 'Ingreso', 'A crear Acuerdo'),
(1254, 1, 146, '2021-07-06 11:56:02', 'Ingreso', 'A crear Reunion'),
(1255, 1, 103, '2021-07-06 11:56:25', 'Ingreso', 'A Lista de Reuniones'),
(1256, 1, 103, '2021-07-06 11:56:51', 'Ingreso', 'A Lista de Reuniones'),
(1257, 1, 103, '2021-07-06 11:57:40', 'Ingreso', 'A Lista de Reuniones'),
(1258, 1, 103, '2021-07-06 11:58:07', 'Ingreso', 'A Lista de Reuniones'),
(1259, 1, 7, '2021-07-06 11:58:23', 'Ingreso', 'A Gestion de Parametros'),
(1260, 1, 7, '2021-07-06 11:58:40', 'Ingreso', 'A Gestion de Parametros'),
(1261, 1, 103, '2021-07-06 11:59:05', 'Ingreso', 'A Lista de Reuniones'),
(1262, 1, 156, '2021-07-06 11:59:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(1263, 1, 7, '2021-07-06 11:59:53', 'Ingreso', 'A Gestion de Parametros'),
(1264, 1, 7, '2021-07-06 12:00:25', 'Ingreso', 'A Gestion de Parametros'),
(1265, 1, 156, '2021-07-06 12:00:50', 'Ingreso', 'A Mantenimiento Estado Acta'),
(1266, 1, 103, '2021-07-06 12:02:06', 'Ingreso', 'A Lista de Reuniones'),
(1267, 1, 103, '2021-07-06 12:02:36', 'Ingreso', 'A Lista de Reuniones'),
(1268, 1, 103, '2021-07-06 12:05:33', 'Ingreso', 'A Lista de Reuniones'),
(1269, 1, 103, '2021-07-06 12:06:48', 'Ingreso', 'A Lista de Reuniones'),
(1270, 1, 103, '2021-07-06 12:10:13', 'Ingreso', 'A Lista de Reuniones'),
(1271, 1, 7, '2021-07-06 12:10:39', 'Ingreso', 'A Gestion de Parametros'),
(1272, 1, 7, '2021-07-06 12:10:46', 'Ingreso', 'A Gestion de Parametros'),
(1273, 1, 7, '2021-07-06 12:16:12', 'Ingreso', 'A Gestion de Parametros'),
(1274, 1, 7, '2021-07-06 12:16:18', 'Ingreso', 'A Gestion de Parametros'),
(1275, 1, 7, '2021-07-06 12:16:25', 'Ingreso', 'A Gestion de Parametros'),
(1276, 1, 7, '2021-07-06 12:17:00', 'Ingreso', 'A Gestion de Parametros'),
(1277, 1, 7, '2021-07-06 12:17:02', 'Ingreso', 'A Gestion de Parametros'),
(1278, 1, 7, '2021-07-06 12:18:34', 'Ingreso', 'A Gestion de Parametros'),
(1279, 1, 7, '2021-07-06 12:18:38', 'Ingreso', 'A Gestion de Parametros'),
(1280, 1, 7, '2021-07-06 12:18:43', 'Ingreso', 'A Gestion de Parametros'),
(1281, 1, 7, '2021-07-06 12:22:40', 'Ingreso', 'A Gestion de Parametros'),
(1282, 1, 7, '2021-07-06 12:23:44', 'Ingreso', 'A Gestion de Parametros'),
(1283, 1, 7, '2021-07-06 12:23:55', 'Ingreso', 'A Gestion de Parametros'),
(1284, 1, 7, '2021-07-06 12:24:25', 'Ingreso', 'A Gestion de Parametros'),
(1285, 1, 7, '2021-07-06 12:24:37', 'Ingreso', 'A Gestion de Parametros'),
(1286, 1, 7, '2021-07-06 12:24:42', 'Ingreso', 'A Gestion de Parametros'),
(1287, 1, 7, '2021-07-06 12:24:54', 'Ingreso', 'A Gestion de Parametros'),
(1288, 1, 7, '2021-07-06 12:28:12', 'Ingreso', 'A Gestion de Parametros'),
(1289, 1, 7, '2021-07-06 12:31:01', 'Ingreso', 'A Gestion de Parametros'),
(1290, 1, 146, '2021-07-06 12:31:02', 'Ingreso', 'A crear Reunion'),
(1291, 1, 146, '2021-07-06 12:32:17', 'Ingreso', 'A crear Reunion'),
(1292, 1, 146, '2021-07-06 12:32:43', 'Ingreso', 'A crear Reunion'),
(1293, 1, 146, '2021-07-06 12:34:37', 'Ingreso', 'A crear Reunion'),
(1294, 1, 24, '2021-07-06 13:02:44', 'INGRESO', 'A REGISTRAR PROYECTOS.'),
(1295, 1, 23, '2021-07-06 13:02:52', 'INGRESO', 'A GESTION DE PROYECTOS'),
(1296, 1, 103, '2021-07-06 13:03:06', 'Ingreso', 'A Lista de Reuniones'),
(1297, 1, 7, '2021-07-06 13:03:11', 'Ingreso', 'A Gestion de Parametros'),
(1298, 1, 146, '2021-07-06 13:03:12', 'Ingreso', 'A crear Reunion'),
(1299, 1, 146, '2021-07-06 13:05:16', 'Ingreso', 'A crear Reunion'),
(1300, 1, 7, '2021-07-06 13:05:26', 'Ingreso', 'A Gestion de Parametros'),
(1301, 1, 146, '2021-07-06 13:05:28', 'Ingreso', 'A crear Reunion'),
(1302, 1, 146, '2021-07-06 13:06:17', 'Ingreso', 'A crear Reunion'),
(1303, 1, 146, '2021-07-06 13:06:33', 'Ingreso', 'A crear Reunion'),
(1304, 1, 146, '2021-07-06 13:07:28', 'Ingreso', 'A crear Reunion'),
(1305, 1, 146, '2021-07-06 13:08:19', 'Ingreso', 'A crear Reunion'),
(1306, 1, 146, '2021-07-06 13:08:53', 'Ingreso', 'A crear Reunion'),
(1307, 1, 146, '2021-07-06 13:09:03', 'Ingreso', 'A crear Reunion'),
(1308, 1, 146, '2021-07-06 13:09:35', 'Ingreso', 'A crear Reunion'),
(1309, 1, 146, '2021-07-06 13:11:19', 'Ingreso', 'A crear Reunion'),
(1310, 1, 146, '2021-07-06 13:11:48', 'Ingreso', 'A crear Reunion'),
(1311, 1, 146, '2021-07-06 13:12:48', 'Ingreso', 'A crear Reunion'),
(1312, 1, 146, '2021-07-06 13:14:06', 'Ingreso', 'A crear Reunion'),
(1313, 1, 146, '2021-07-06 13:14:28', 'Ingreso', 'A crear Reunion'),
(1314, 1, 146, '2021-07-06 13:15:12', 'Ingreso', 'A crear Reunion'),
(1315, 1, 146, '2021-07-06 13:15:42', 'Ingreso', 'A crear Reunion'),
(1316, 1, 146, '2021-07-06 13:16:42', 'Ingreso', 'A crear Reunion'),
(1317, 1, 7, '2021-07-06 13:16:57', 'Ingreso', 'A Gestion de Parametros'),
(1318, 1, 146, '2021-07-06 13:17:00', 'Ingreso', 'A crear Reunion'),
(1319, 1, 146, '2021-07-06 13:38:20', 'Ingreso', 'A crear Reunion'),
(1320, 1, 146, '2021-07-06 13:38:54', 'Ingreso', 'A crear Reunion'),
(1321, 1, 7, '2021-07-06 13:39:04', 'Ingreso', 'A Gestion de Parametros'),
(1322, 1, 146, '2021-07-06 13:40:34', 'Ingreso', 'A crear Reunion'),
(1323, 1, 7, '2021-07-06 13:40:36', 'Ingreso', 'A Gestion de Parametros'),
(1324, 1, 146, '2021-07-06 13:40:37', 'Ingreso', 'A crear Reunion'),
(1325, 1, 146, '2021-07-06 13:40:53', 'Ingreso', 'A crear Reunion'),
(1326, 1, 146, '2021-07-06 13:43:03', 'Ingreso', 'A crear Reunion'),
(1327, 1, 146, '2021-07-06 13:43:11', 'Ingreso', 'A crear Reunion'),
(1328, 1, 146, '2021-07-06 13:45:02', 'Ingreso', 'A crear Reunion'),
(1329, 1, 146, '2021-07-06 13:45:35', 'Ingreso', 'A crear Reunion'),
(1330, 1, 146, '2021-07-06 13:46:14', 'Ingreso', 'A crear Reunion'),
(1331, 1, 146, '2021-07-06 13:46:24', 'Ingreso', 'A crear Reunion'),
(1332, 1, 7, '2021-07-06 13:47:24', 'Ingreso', 'A Gestion de Parametros'),
(1333, 1, 146, '2021-07-06 13:47:26', 'Ingreso', 'A crear Reunion'),
(1334, 1, 146, '2021-07-06 13:47:56', 'Ingreso', 'A crear Reunion'),
(1335, 1, 146, '2021-07-06 13:49:09', 'Ingreso', 'A crear Reunion'),
(1336, 1, 146, '2021-07-06 13:49:31', 'Ingreso', 'A crear Reunion'),
(1337, 1, 146, '2021-07-06 13:51:20', 'Ingreso', 'A crear Reunion'),
(1338, 1, 146, '2021-07-06 13:51:37', 'Ingreso', 'A crear Reunion'),
(1339, 1, 7, '2021-07-06 13:52:01', 'Ingreso', 'A Gestion de Parametros'),
(1340, 1, 146, '2021-07-06 13:53:06', 'Ingreso', 'A crear Reunion'),
(1341, 1, 7, '2021-07-06 13:53:39', 'Ingreso', 'A Gestion de Parametros'),
(1342, 1, 7, '2021-07-06 13:53:46', 'Ingreso', 'A Gestion de Parametros'),
(1343, 1, 146, '2021-07-06 13:53:53', 'Ingreso', 'A crear Reunion'),
(1344, 1, 7, '2021-07-06 13:53:59', 'Ingreso', 'A Gestion de Parametros'),
(1345, 1, 7, '2021-07-06 13:58:54', 'Ingreso', 'A Gestion de Parametros'),
(1346, 1, 146, '2021-07-06 14:31:23', 'Ingreso', 'A crear Reunion'),
(1347, 1, 7, '2021-07-06 14:31:27', 'Ingreso', 'A Gestion de Parametros'),
(1348, 1, 146, '2021-07-06 14:31:30', 'Ingreso', 'A crear Reunion'),
(1349, 1, 7, '2021-07-06 14:31:48', 'Ingreso', 'A Gestion de Parametros'),
(1350, 1, 146, '2021-07-06 14:31:50', 'Ingreso', 'A crear Reunion'),
(1351, 1, 146, '2021-07-06 14:33:08', 'Ingreso', 'A crear Reunion'),
(1352, 1, 146, '2021-07-06 14:34:07', 'Ingreso', 'A crear Reunion'),
(1353, 1, 146, '2021-07-06 14:34:27', 'Ingreso', 'A crear Reunion'),
(1354, 1, 146, '2021-07-06 14:34:43', 'Ingreso', 'A crear Reunion'),
(1355, 1, 146, '2021-07-06 14:37:27', 'Ingreso', 'A crear Reunion');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(1356, 1, 7, '2021-07-06 14:37:34', 'Ingreso', 'A Gestion de Parametros'),
(1357, 1, 146, '2021-07-06 14:37:36', 'Ingreso', 'A crear Reunion'),
(1358, 1, 7, '2021-07-06 14:37:39', 'Ingreso', 'A Gestion de Parametros'),
(1359, 1, 146, '2021-07-06 14:37:40', 'Ingreso', 'A crear Reunion'),
(1360, 1, 146, '2021-07-06 14:38:43', 'Ingreso', 'A crear Reunion'),
(1361, 1, 146, '2021-07-06 14:38:57', 'Ingreso', 'A crear Reunion'),
(1362, 1, 146, '2021-07-06 14:39:17', 'Ingreso', 'A crear Reunion'),
(1363, 1, 146, '2021-07-06 14:39:46', 'Ingreso', 'A crear Reunion'),
(1364, 1, 146, '2021-07-06 14:40:13', 'Ingreso', 'A crear Reunion'),
(1365, 1, 146, '2021-07-06 14:41:00', 'Ingreso', 'A crear Reunion'),
(1366, 1, 151, '2021-07-07 10:09:15', 'Ingreso', 'A crear Acuerdo'),
(1367, 1, 151, '2021-07-07 10:14:56', 'Ingreso', 'A crear Acuerdo'),
(1368, 1, 151, '2021-07-07 10:15:27', 'Ingreso', 'A crear Acuerdo'),
(1369, 1, 146, '2021-07-07 10:59:15', 'Ingreso', 'A crear Reunion'),
(1370, 1, 146, '2021-07-07 11:00:43', 'Ingreso', 'A crear Reunion'),
(1371, 1, 103, '2021-07-07 17:20:18', 'Ingreso', 'A Lista de Reuniones'),
(1372, 1, 7, '2021-07-07 17:20:25', 'Ingreso', 'A Gestion de Parametros'),
(1373, 1, 146, '2021-07-07 17:20:29', 'Ingreso', 'A crear Reunion'),
(1374, 1, 151, '2021-07-07 17:21:03', 'Ingreso', 'A crear Acuerdo'),
(1375, 1, 151, '2021-07-07 17:21:24', 'Ingreso', 'A crear Acuerdo'),
(1376, 1, 151, '2021-07-07 17:29:08', 'Ingreso', 'A crear Acuerdo'),
(1377, 1, 7, '2021-07-07 17:35:36', 'Ingreso', 'A Gestion de Parametros'),
(1378, 1, 146, '2021-07-07 17:35:47', 'Ingreso', 'A crear Reunion'),
(1379, 1, 7, '2021-07-07 17:35:50', 'Ingreso', 'A Gestion de Parametros'),
(1380, 1, 7, '2021-07-07 17:47:31', 'Ingreso', 'A Gestion de Parametros'),
(1381, 1, 146, '2021-07-07 17:47:34', 'Ingreso', 'A crear Reunion'),
(1382, 1, 146, '2021-07-07 17:48:50', 'Ingreso', 'A crear Reunion'),
(1383, 1, 146, '2021-07-07 17:49:01', 'Ingreso', 'A crear Reunion'),
(1384, 1, 146, '2021-07-07 17:49:06', 'Ingreso', 'A crear Reunion'),
(1385, 1, 146, '2021-07-07 17:49:14', 'Ingreso', 'A crear Reunion'),
(1386, 1, 146, '2021-07-07 17:51:16', 'Ingreso', 'A crear Reunion'),
(1387, 1, 7, '2021-07-07 17:51:22', 'Ingreso', 'A Gestion de Parametros'),
(1388, 1, 146, '2021-07-07 17:51:25', 'Ingreso', 'A crear Reunion'),
(1389, 1, 146, '2021-07-07 17:55:08', 'Ingreso', 'A crear Reunion'),
(1390, 1, 7, '2021-07-07 18:01:17', 'Ingreso', 'A Gestion de Parametros'),
(1391, 1, 146, '2021-07-07 18:01:20', 'Ingreso', 'A crear Reunion'),
(1392, 1, 7, '2021-07-07 18:01:24', 'Ingreso', 'A Gestion de Parametros'),
(1393, 1, 146, '2021-07-07 18:02:44', 'Ingreso', 'A crear Reunion'),
(1394, 1, 7, '2021-07-07 18:09:25', 'Ingreso', 'A Gestion de Parametros'),
(1395, 1, 146, '2021-07-07 18:09:29', 'Ingreso', 'A crear Reunion'),
(1396, 1, 146, '2021-07-07 18:12:13', 'Ingreso', 'A crear Reunion'),
(1397, 1, 146, '2021-07-07 18:18:37', 'Ingreso', 'A crear Reunion'),
(1398, 1, 146, '2021-07-07 18:31:13', 'Ingreso', 'A crear Reunion'),
(1399, 1, 146, '2021-07-07 18:32:27', 'Ingreso', 'A crear Reunion'),
(1400, 1, 146, '2021-07-07 18:36:21', 'Ingreso', 'A crear Reunion'),
(1401, 1, 146, '2021-07-07 18:36:24', 'Ingreso', 'A crear Reunion'),
(1402, 1, 146, '2021-07-07 18:37:13', 'Ingreso', 'A crear Reunion'),
(1403, 1, 146, '2021-07-07 18:40:08', 'Ingreso', 'A crear Reunion'),
(1404, 1, 146, '2021-07-07 18:43:16', 'Ingreso', 'A crear Reunion'),
(1405, 1, 146, '2021-07-07 18:44:48', 'Ingreso', 'A crear Reunion'),
(1406, 1, 146, '2021-07-07 18:45:18', 'Ingreso', 'A crear Reunion'),
(1407, 1, 146, '2021-07-07 18:46:19', 'Ingreso', 'A crear Reunion'),
(1408, 1, 146, '2021-07-07 18:46:52', 'Ingreso', 'A crear Reunion'),
(1409, 1, 146, '2021-07-07 18:46:54', 'Ingreso', 'A crear Reunion'),
(1410, 1, 146, '2021-07-07 18:47:47', 'Ingreso', 'A crear Reunion'),
(1411, 1, 146, '2021-07-07 18:49:38', 'Ingreso', 'A crear Reunion'),
(1412, 1, 146, '2021-07-07 18:49:41', 'Ingreso', 'A crear Reunion'),
(1413, 1, 146, '2021-07-07 18:52:04', 'Ingreso', 'A crear Reunion'),
(1414, 1, 146, '2021-07-07 18:53:21', 'Ingreso', 'A crear Reunion'),
(1415, 1, 146, '2021-07-07 18:53:32', 'Ingreso', 'A crear Reunion'),
(1416, 1, 146, '2021-07-07 18:53:34', 'Ingreso', 'A crear Reunion'),
(1417, 1, 146, '2021-07-07 18:55:16', 'Ingreso', 'A crear Reunion'),
(1418, 1, 146, '2021-07-07 18:55:32', 'Ingreso', 'A crear Reunion'),
(1419, 1, 146, '2021-07-07 19:06:07', 'Ingreso', 'A crear Reunion'),
(1420, 1, 146, '2021-07-07 19:07:39', 'Ingreso', 'A crear Reunion'),
(1421, 1, 146, '2021-07-07 19:07:50', 'Ingreso', 'A crear Reunion'),
(1422, 1, 146, '2021-07-07 19:09:12', 'Ingreso', 'A crear Reunion'),
(1423, 1, 146, '2021-07-07 19:10:26', 'Ingreso', 'A crear Reunion'),
(1424, 1, 7, '2021-07-07 19:10:42', 'Ingreso', 'A Gestion de Parametros'),
(1425, 1, 7, '2021-07-07 19:11:55', 'Ingreso', 'A Gestion de Parametros'),
(1426, 1, 7, '2021-07-07 19:14:11', 'Ingreso', 'A Gestion de Parametros'),
(1427, 1, 146, '2021-07-07 19:14:18', 'Ingreso', 'A crear Reunion'),
(1428, 1, 7, '2021-07-07 19:14:22', 'Ingreso', 'A Gestion de Parametros'),
(1429, 1, 146, '2021-07-07 19:14:28', 'Ingreso', 'A crear Reunion'),
(1430, 1, 7, '2021-07-07 19:14:38', 'Ingreso', 'A Gestion de Parametros'),
(1431, 1, 7, '2021-07-07 19:14:56', 'Ingreso', 'A Gestion de Parametros'),
(1432, 1, 7, '2021-07-07 19:16:28', 'Ingreso', 'A Gestion de Parametros'),
(1433, 1, 7, '2021-07-07 19:17:03', 'Ingreso', 'A Gestion de Parametros'),
(1434, 1, 146, '2021-07-07 19:17:22', 'Ingreso', 'A crear Reunion'),
(1435, 1, 146, '2021-07-07 19:17:52', 'Ingreso', 'A crear Reunion'),
(1436, 1, 146, '2021-07-07 19:19:13', 'Ingreso', 'A crear Reunion'),
(1437, 1, 146, '2021-07-07 19:20:20', 'Ingreso', 'A crear Reunion'),
(1438, 1, 7, '2021-07-07 19:20:21', 'Ingreso', 'A Gestion de Parametros'),
(1439, 1, 7, '2021-07-07 19:20:43', 'Ingreso', 'A Gestion de Parametros'),
(1440, 1, 103, '2021-07-07 19:22:13', 'Ingreso', 'A Lista de Reuniones'),
(1441, 1, 103, '2021-07-07 19:22:55', 'Ingreso', 'A Lista de Reuniones'),
(1442, 1, 7, '2021-07-07 19:23:56', 'Ingreso', 'A Gestion de Parametros'),
(1443, 1, 146, '2021-07-07 19:24:03', 'Ingreso', 'A crear Reunion'),
(1444, 1, 146, '2021-07-07 19:26:53', 'Ingreso', 'A crear Reunion'),
(1445, 1, 146, '2021-07-07 19:27:11', 'Ingreso', 'A crear Reunion'),
(1446, 1, 146, '2021-07-07 19:29:31', 'Ingreso', 'A crear Reunion'),
(1447, 1, 146, '2021-07-07 19:29:57', 'Ingreso', 'A crear Reunion'),
(1448, 1, 146, '2021-07-07 19:30:01', 'Ingreso', 'A crear Reunion'),
(1449, 1, 146, '2021-07-07 19:30:48', 'Ingreso', 'A crear Reunion'),
(1450, 1, 146, '2021-07-07 19:30:55', 'Ingreso', 'A crear Reunion'),
(1451, 1, 146, '2021-07-07 19:30:57', 'Ingreso', 'A crear Reunion'),
(1452, 1, 146, '2021-07-07 19:32:38', 'Ingreso', 'A crear Reunion'),
(1453, 1, 146, '2021-07-07 19:32:44', 'Ingreso', 'A crear Reunion'),
(1454, 1, 7, '2021-07-07 19:32:49', 'Ingreso', 'A Gestion de Parametros'),
(1455, 1, 7, '2021-07-07 19:32:59', 'Ingreso', 'A Gestion de Parametros'),
(1456, 1, 146, '2021-07-07 19:35:23', 'Ingreso', 'A crear Reunion'),
(1457, 1, 146, '2021-07-07 19:35:28', 'Ingreso', 'A crear Reunion'),
(1458, 1, 146, '2021-07-07 19:35:37', 'Ingreso', 'A crear Reunion'),
(1459, 1, 146, '2021-07-07 19:36:33', 'Ingreso', 'A crear Reunion'),
(1460, 1, 146, '2021-07-07 19:36:47', 'Ingreso', 'A crear Reunion'),
(1461, 1, 146, '2021-07-07 19:40:13', 'Ingreso', 'A crear Reunion'),
(1462, 1, 146, '2021-07-07 19:40:16', 'Ingreso', 'A crear Reunion'),
(1463, 1, 146, '2021-07-07 19:40:19', 'Ingreso', 'A crear Reunion'),
(1464, 1, 146, '2021-07-07 19:40:58', 'Ingreso', 'A crear Reunion'),
(1465, 1, 146, '2021-07-07 19:42:09', 'Ingreso', 'A crear Reunion'),
(1466, 1, 146, '2021-07-07 19:43:43', 'Ingreso', 'A crear Reunion'),
(1467, 1, 146, '2021-07-07 20:16:44', 'Ingreso', 'A crear Reunion'),
(1468, 1, 146, '2021-07-07 20:16:48', 'Ingreso', 'A crear Reunion'),
(1469, 1, 146, '2021-07-07 20:16:54', 'Ingreso', 'A crear Reunion'),
(1470, 1, 146, '2021-07-07 20:18:44', 'Ingreso', 'A crear Reunion'),
(1471, 1, 146, '2021-07-07 20:19:07', 'Ingreso', 'A crear Reunion'),
(1472, 1, 146, '2021-07-07 20:30:57', 'Ingreso', 'A crear Reunion'),
(1473, 1, 146, '2021-07-07 20:32:02', 'Ingreso', 'A crear Reunion'),
(1474, 1, 7, '2021-07-07 20:33:21', 'Ingreso', 'A Gestion de Parametros'),
(1475, 1, 146, '2021-07-07 20:33:25', 'Ingreso', 'A crear Reunion'),
(1476, 1, 146, '2021-07-07 20:34:21', 'Ingreso', 'A crear Reunion'),
(1477, 1, 146, '2021-07-07 20:36:04', 'Ingreso', 'A crear Reunion'),
(1478, 1, 7, '2021-07-07 20:36:13', 'Ingreso', 'A Gestion de Parametros'),
(1479, 1, 146, '2021-07-07 20:36:16', 'Ingreso', 'A crear Reunion'),
(1480, 1, 146, '2021-07-07 20:40:26', 'Ingreso', 'A crear Reunion'),
(1481, 1, 146, '2021-07-07 20:41:54', 'Ingreso', 'A crear Reunion'),
(1482, 1, 146, '2021-07-07 20:46:01', 'Ingreso', 'A crear Reunion'),
(1483, 1, 146, '2021-07-07 20:48:36', 'Ingreso', 'A crear Reunion'),
(1484, 1, 146, '2021-07-07 20:49:44', 'Ingreso', 'A crear Reunion'),
(1485, 1, 7, '2021-07-07 21:03:11', 'Ingreso', 'A Gestion de Parametros'),
(1486, 1, 146, '2021-07-07 21:03:19', 'Ingreso', 'A crear Reunion'),
(1487, 1, 7, '2021-07-08 11:54:48', 'Ingreso', 'A Gestion de Parametros'),
(1488, 1, 146, '2021-07-08 11:54:58', 'Ingreso', 'A crear Reunion'),
(1489, 1, 146, '2021-07-08 11:55:24', 'Ingreso', 'A crear Reunion'),
(1490, 1, 103, '2021-07-08 11:57:02', 'Ingreso', 'A Lista de Reuniones'),
(1491, 1, 103, '2021-07-08 11:57:15', 'Ingreso', 'A Lista de Reuniones'),
(1492, 1, 7, '2021-07-08 11:57:53', 'Ingreso', 'A Gestion de Parametros'),
(1493, 1, 146, '2021-07-08 11:57:55', 'Ingreso', 'A crear Reunion'),
(1494, 1, 7, '2021-07-08 12:00:07', 'Ingreso', 'A Gestion de Parametros'),
(1495, 1, 7, '2021-07-08 12:01:16', 'Ingreso', 'A Gestion de Parametros'),
(1496, 1, 146, '2021-07-08 12:01:19', 'Ingreso', 'A crear Reunion'),
(1497, 1, 146, '2021-07-08 12:01:42', 'Ingreso', 'A crear Reunion'),
(1498, 1, 7, '2021-07-08 12:01:44', 'Ingreso', 'A Gestion de Parametros'),
(1499, 1, 7, '2021-07-08 12:03:05', 'Ingreso', 'A Gestion de Parametros'),
(1500, 1, 146, '2021-07-08 12:03:07', 'Ingreso', 'A crear Reunion'),
(1501, 1, 146, '2021-07-08 12:03:20', 'Ingreso', 'A crear Reunion'),
(1502, 1, 7, '2021-07-08 12:03:21', 'Ingreso', 'A Gestion de Parametros'),
(1503, 1, 146, '2021-07-08 12:03:55', 'Ingreso', 'A crear Reunion'),
(1504, 1, 146, '2021-07-08 12:03:57', 'Ingreso', 'A crear Reunion'),
(1505, 1, 146, '2021-07-08 12:04:59', 'Ingreso', 'A crear Reunion'),
(1506, 1, 7, '2021-07-08 12:05:00', 'Ingreso', 'A Gestion de Parametros'),
(1507, 1, 7, '2021-07-08 13:01:21', 'Ingreso', 'A Gestion de Parametros'),
(1508, 1, 146, '2021-07-08 13:01:23', 'Ingreso', 'A crear Reunion'),
(1509, 1, 146, '2021-07-08 13:10:06', 'Ingreso', 'A crear Reunion'),
(1510, 1, 146, '2021-07-08 13:10:09', 'Ingreso', 'A crear Reunion'),
(1511, 1, 146, '2021-07-08 13:10:22', 'Ingreso', 'A crear Reunion'),
(1512, 1, 146, '2021-07-08 13:11:43', 'Ingreso', 'A crear Reunion'),
(1513, 1, 7, '2021-07-08 13:11:44', 'Ingreso', 'A Gestion de Parametros'),
(1514, 1, 7, '2021-07-08 13:15:31', 'Ingreso', 'A Gestion de Parametros'),
(1515, 1, 146, '2021-07-08 13:15:33', 'Ingreso', 'A crear Reunion'),
(1516, 1, 7, '2021-07-08 13:15:35', 'Ingreso', 'A Gestion de Parametros'),
(1517, 1, 146, '2021-07-08 13:15:37', 'Ingreso', 'A crear Reunion'),
(1518, 1, 7, '2021-07-08 13:15:45', 'Ingreso', 'A Gestion de Parametros'),
(1519, 1, 146, '2021-07-08 13:16:01', 'Ingreso', 'A crear Reunion'),
(1520, 1, 7, '2021-07-08 13:16:10', 'Ingreso', 'A Gestion de Parametros'),
(1521, 1, 7, '2021-07-08 13:16:54', 'Ingreso', 'A Gestion de Parametros'),
(1522, 1, 146, '2021-07-08 13:16:59', 'Ingreso', 'A crear Reunion'),
(1523, 1, 7, '2021-07-08 13:17:11', 'Ingreso', 'A Gestion de Parametros'),
(1524, 1, 7, '2021-07-08 13:17:23', 'Ingreso', 'A Gestion de Parametros'),
(1525, 1, 146, '2021-07-08 13:17:29', 'Ingreso', 'A crear Reunion'),
(1526, 1, 7, '2021-07-08 13:17:38', 'Ingreso', 'A Gestion de Parametros'),
(1527, 1, 7, '2021-07-08 13:18:40', 'Ingreso', 'A Gestion de Parametros'),
(1528, 1, 146, '2021-07-08 13:18:48', 'Ingreso', 'A crear Reunion'),
(1529, 1, 7, '2021-07-08 13:18:54', 'Ingreso', 'A Gestion de Parametros'),
(1530, 1, 146, '2021-07-08 13:19:08', 'Ingreso', 'A crear Reunion'),
(1531, 1, 7, '2021-07-08 13:19:27', 'Ingreso', 'A Gestion de Parametros'),
(1532, 1, 146, '2021-07-08 13:19:31', 'Ingreso', 'A crear Reunion'),
(1533, 1, 7, '2021-07-08 13:20:39', 'Ingreso', 'A Gestion de Parametros'),
(1534, 1, 103, '2021-07-08 13:20:50', 'Ingreso', 'A Lista de Reuniones'),
(1535, 1, 146, '2021-07-08 13:20:55', 'Ingreso', 'A crear Reunion'),
(1536, 1, 146, '2021-07-08 13:22:49', 'Ingreso', 'A crear Reunion'),
(1537, 1, 103, '2021-07-08 13:22:57', 'Ingreso', 'A Lista de Reuniones'),
(1538, 1, 103, '2021-07-08 13:23:26', 'Ingreso', 'A Lista de Reuniones'),
(1539, 1, 7, '2021-07-08 13:25:59', 'Ingreso', 'A Gestion de Parametros'),
(1540, 1, 146, '2021-07-08 13:26:03', 'Ingreso', 'A crear Reunion'),
(1541, 1, 7, '2021-07-08 14:27:54', 'Ingreso', 'A Gestion de Parametros'),
(1542, 1, 146, '2021-07-08 14:32:45', 'Ingreso', 'A crear Reunion'),
(1543, 1, 146, '2021-07-08 15:32:08', 'Ingreso', 'A crear Reunion'),
(1544, 1, 146, '2021-07-08 15:33:18', 'Ingreso', 'A crear Reunion'),
(1545, 1, 146, '2021-07-08 15:34:14', 'Ingreso', 'A crear Reunion'),
(1546, 1, 146, '2021-07-08 15:34:35', 'Ingreso', 'A crear Reunion'),
(1547, 1, 146, '2021-07-08 15:36:30', 'Ingreso', 'A crear Reunion'),
(1548, 1, 146, '2021-07-08 15:37:21', 'Ingreso', 'A crear Reunion'),
(1549, 1, 146, '2021-07-08 15:37:57', 'Ingreso', 'A crear Reunion'),
(1550, 1, 7, '2021-07-08 15:38:21', 'Ingreso', 'A Gestion de Parametros'),
(1551, 1, 146, '2021-07-08 15:38:24', 'Ingreso', 'A crear Reunion'),
(1552, 1, 7, '2021-07-08 15:38:36', 'Ingreso', 'A Gestion de Parametros'),
(1553, 1, 146, '2021-07-08 15:38:39', 'Ingreso', 'A crear Reunion'),
(1554, 1, 7, '2021-07-08 15:39:26', 'Ingreso', 'A Gestion de Parametros'),
(1555, 1, 146, '2021-07-08 15:39:29', 'Ingreso', 'A crear Reunion'),
(1556, 1, 146, '2021-07-08 15:43:03', 'Ingreso', 'A crear Reunion'),
(1557, 1, 146, '2021-07-08 15:43:19', 'Ingreso', 'A crear Reunion'),
(1558, 1, 146, '2021-07-08 15:43:33', 'Ingreso', 'A crear Reunion'),
(1559, 1, 146, '2021-07-08 15:44:24', 'Ingreso', 'A crear Reunion'),
(1560, 1, 146, '2021-07-08 15:45:09', 'Ingreso', 'A crear Reunion'),
(1561, 1, 146, '2021-07-08 15:47:29', 'Ingreso', 'A crear Reunion'),
(1562, 1, 146, '2021-07-08 15:49:30', 'Ingreso', 'A crear Reunion'),
(1563, 1, 146, '2021-07-08 15:51:01', 'Ingreso', 'A crear Reunion'),
(1564, 1, 146, '2021-07-08 15:51:17', 'Ingreso', 'A crear Reunion'),
(1565, 1, 146, '2021-07-08 15:51:34', 'Ingreso', 'A crear Reunion'),
(1566, 1, 146, '2021-07-08 15:52:14', 'Ingreso', 'A crear Reunion'),
(1567, 1, 146, '2021-07-08 15:54:12', 'Ingreso', 'A crear Reunion'),
(1568, 1, 146, '2021-07-08 15:54:48', 'Ingreso', 'A crear Reunion'),
(1569, 1, 146, '2021-07-08 15:55:14', 'Ingreso', 'A crear Reunion'),
(1570, 1, 146, '2021-07-08 15:56:03', 'Ingreso', 'A crear Reunion'),
(1571, 1, 146, '2021-07-08 15:56:48', 'Ingreso', 'A crear Reunion'),
(1572, 1, 146, '2021-07-08 15:57:06', 'Ingreso', 'A crear Reunion'),
(1573, 1, 146, '2021-07-08 15:57:51', 'Ingreso', 'A crear Reunion'),
(1574, 1, 146, '2021-07-08 15:59:35', 'Ingreso', 'A crear Reunion'),
(1575, 1, 146, '2021-07-08 16:01:06', 'Ingreso', 'A crear Reunion'),
(1576, 1, 146, '2021-07-08 16:05:56', 'Ingreso', 'A crear Reunion'),
(1577, 1, 146, '2021-07-08 16:07:16', 'Ingreso', 'A crear Reunion'),
(1578, 1, 146, '2021-07-08 16:07:54', 'Ingreso', 'A crear Reunion'),
(1579, 1, 146, '2021-07-08 16:08:18', 'Ingreso', 'A crear Reunion'),
(1580, 1, 146, '2021-07-08 16:09:06', 'Ingreso', 'A crear Reunion'),
(1581, 1, 146, '2021-07-08 16:10:33', 'Ingreso', 'A crear Reunion'),
(1582, 1, 146, '2021-07-08 16:11:08', 'Ingreso', 'A crear Reunion'),
(1583, 1, 146, '2021-07-08 16:12:47', 'Ingreso', 'A crear Reunion'),
(1584, 1, 146, '2021-07-08 16:13:14', 'Ingreso', 'A crear Reunion'),
(1585, 1, 146, '2021-07-08 16:13:45', 'Ingreso', 'A crear Reunion'),
(1586, 1, 146, '2021-07-08 16:14:33', 'Ingreso', 'A crear Reunion'),
(1587, 1, 146, '2021-07-08 16:14:46', 'Ingreso', 'A crear Reunion'),
(1588, 1, 146, '2021-07-08 16:17:44', 'Ingreso', 'A crear Reunion'),
(1589, 1, 146, '2021-07-08 16:19:36', 'Ingreso', 'A crear Reunion'),
(1590, 1, 146, '2021-07-08 16:20:39', 'Ingreso', 'A crear Reunion'),
(1591, 1, 146, '2021-07-08 16:20:47', 'Ingreso', 'A crear Reunion'),
(1592, 1, 146, '2021-07-08 16:21:24', 'Ingreso', 'A crear Reunion'),
(1593, 1, 146, '2021-07-08 16:22:38', 'Ingreso', 'A crear Reunion'),
(1594, 1, 146, '2021-07-08 16:23:33', 'Ingreso', 'A crear Reunion'),
(1595, 1, 146, '2021-07-08 16:23:46', 'Ingreso', 'A crear Reunion'),
(1596, 1, 146, '2021-07-08 16:24:52', 'Ingreso', 'A crear Reunion'),
(1597, 1, 146, '2021-07-08 16:25:35', 'Ingreso', 'A crear Reunion'),
(1598, 1, 146, '2021-07-08 16:26:08', 'Ingreso', 'A crear Reunion'),
(1599, 1, 146, '2021-07-08 16:27:02', 'Ingreso', 'A crear Reunion'),
(1600, 1, 146, '2021-07-08 16:27:19', 'Ingreso', 'A crear Reunion'),
(1601, 1, 146, '2021-07-08 16:27:46', 'Ingreso', 'A crear Reunion'),
(1602, 1, 146, '2021-07-08 16:28:18', 'Ingreso', 'A crear Reunion'),
(1603, 1, 146, '2021-07-08 16:29:18', 'Ingreso', 'A crear Reunion'),
(1604, 1, 146, '2021-07-08 16:30:24', 'Ingreso', 'A crear Reunion'),
(1605, 1, 146, '2021-07-08 16:32:15', 'Ingreso', 'A crear Reunion'),
(1606, 1, 146, '2021-07-08 16:32:29', 'Ingreso', 'A crear Reunion'),
(1607, 1, 146, '2021-07-08 16:33:07', 'Ingreso', 'A crear Reunion'),
(1608, 1, 146, '2021-07-08 16:33:32', 'Ingreso', 'A crear Reunion'),
(1609, 1, 146, '2021-07-08 16:35:52', 'Ingreso', 'A crear Reunion'),
(1610, 1, 146, '2021-07-08 16:37:15', 'Ingreso', 'A crear Reunion'),
(1611, 1, 146, '2021-07-08 16:37:34', 'Ingreso', 'A crear Reunion'),
(1612, 1, 146, '2021-07-08 16:38:26', 'Ingreso', 'A crear Reunion'),
(1613, 1, 146, '2021-07-08 16:38:48', 'Ingreso', 'A crear Reunion'),
(1614, 1, 146, '2021-07-08 16:42:28', 'Ingreso', 'A crear Reunion'),
(1615, 1, 146, '2021-07-08 16:42:58', 'Ingreso', 'A crear Reunion'),
(1616, 1, 146, '2021-07-08 16:44:32', 'Ingreso', 'A crear Reunion'),
(1617, 1, 146, '2021-07-08 16:47:44', 'Ingreso', 'A crear Reunion'),
(1618, 1, 7, '2021-07-08 16:47:55', 'Ingreso', 'A Gestion de Parametros'),
(1619, 1, 146, '2021-07-08 16:47:59', 'Ingreso', 'A crear Reunion'),
(1620, 1, 7, '2021-07-08 16:48:12', 'Ingreso', 'A Gestion de Parametros'),
(1621, 1, 146, '2021-07-08 16:48:15', 'Ingreso', 'A crear Reunion'),
(1622, 1, 7, '2021-07-08 16:48:24', 'Ingreso', 'A Gestion de Parametros'),
(1623, 1, 146, '2021-07-08 16:48:30', 'Ingreso', 'A crear Reunion'),
(1624, 1, 7, '2021-07-08 18:01:09', 'Ingreso', 'A Gestion de Parametros'),
(1625, 1, 146, '2021-07-08 18:01:12', 'Ingreso', 'A crear Reunion'),
(1626, 1, 146, '2021-07-08 18:02:20', 'Ingreso', 'A crear Reunion'),
(1627, 1, 7, '2021-07-08 18:02:35', 'Ingreso', 'A Gestion de Parametros'),
(1628, 1, 146, '2021-07-08 18:02:38', 'Ingreso', 'A crear Reunion'),
(1629, 1, 146, '2021-07-08 18:03:26', 'Ingreso', 'A crear Reunion'),
(1630, 1, 7, '2021-07-08 18:03:37', 'Ingreso', 'A Gestion de Parametros'),
(1631, 1, 146, '2021-07-08 18:03:40', 'Ingreso', 'A crear Reunion'),
(1632, 1, 7, '2021-07-08 18:03:50', 'Ingreso', 'A Gestion de Parametros'),
(1633, 1, 146, '2021-07-08 18:03:54', 'Ingreso', 'A crear Reunion'),
(1634, 1, 7, '2021-07-08 18:04:02', 'Ingreso', 'A Gestion de Parametros'),
(1635, 1, 146, '2021-07-08 18:04:52', 'Ingreso', 'A crear Reunion'),
(1636, 1, 7, '2021-07-08 18:05:03', 'Ingreso', 'A Gestion de Parametros'),
(1637, 1, 7, '2021-07-08 18:05:24', 'Ingreso', 'A Gestion de Parametros'),
(1638, 1, 146, '2021-07-08 18:05:26', 'Ingreso', 'A crear Reunion'),
(1639, 1, 7, '2021-07-08 18:05:33', 'Ingreso', 'A Gestion de Parametros'),
(1640, 1, 146, '2021-07-08 18:05:35', 'Ingreso', 'A crear Reunion'),
(1641, 1, 7, '2021-07-08 18:05:56', 'Ingreso', 'A Gestion de Parametros'),
(1642, 1, 146, '2021-07-08 18:06:02', 'Ingreso', 'A crear Reunion'),
(1643, 1, 151, '2021-07-08 18:23:03', 'Ingreso', 'A crear Acuerdo'),
(1644, 1, 151, '2021-07-08 18:24:42', 'Ingreso', 'A crear Acuerdo'),
(1645, 1, 103, '2021-07-08 18:24:49', 'Ingreso', 'A Lista de Reuniones'),
(1646, 1, 151, '2021-07-08 18:25:23', 'Ingreso', 'A crear Acuerdo'),
(1647, 1, 7, '2021-07-08 18:26:36', 'Ingreso', 'A Gestion de Parametros'),
(1648, 1, 7, '2021-07-08 18:27:29', 'Ingreso', 'A Gestion de Parametros'),
(1649, 1, 103, '2021-07-08 18:28:19', 'Ingreso', 'A Lista de Reuniones'),
(1650, 1, 103, '2021-07-08 18:28:33', 'Ingreso', 'A Lista de Reuniones'),
(1651, 1, 7, '2021-07-08 18:29:29', 'Ingreso', 'A Gestion de Parametros'),
(1652, 1, 7, '2021-07-08 18:29:43', 'Ingreso', 'A Gestion de Parametros'),
(1653, 1, 146, '2021-07-08 18:30:14', 'Ingreso', 'A crear Reunion'),
(1654, 1, 7, '2021-07-08 18:30:19', 'Ingreso', 'A Gestion de Parametros'),
(1655, 1, 146, '2021-07-08 18:30:24', 'Ingreso', 'A crear Reunion'),
(1656, 1, 7, '2021-07-08 18:30:47', 'Ingreso', 'A Gestion de Parametros'),
(1657, 1, 146, '2021-07-08 18:30:51', 'Ingreso', 'A crear Reunion'),
(1658, 1, 7, '2021-07-08 18:31:00', 'Ingreso', 'A Gestion de Parametros'),
(1659, 1, 146, '2021-07-08 18:31:05', 'Ingreso', 'A crear Reunion'),
(1660, 1, 146, '2021-07-08 18:33:13', 'Ingreso', 'A crear Reunion'),
(1661, 1, 146, '2021-07-08 18:43:55', 'Ingreso', 'A crear Reunion'),
(1662, 1, 146, '2021-07-08 18:44:23', 'Ingreso', 'A crear Reunion'),
(1663, 1, 103, '2021-07-08 18:44:54', 'Ingreso', 'A Lista de Reuniones'),
(1664, 1, 7, '2021-07-08 18:45:16', 'Ingreso', 'A Gestion de Parametros'),
(1665, 1, 103, '2021-07-08 18:45:21', 'Ingreso', 'A Lista de Reuniones'),
(1666, 1, 103, '2021-07-08 18:46:01', 'Ingreso', 'A Lista de Reuniones'),
(1667, 1, 7, '2021-07-08 18:46:34', 'Ingreso', 'A Gestion de Parametros'),
(1668, 1, 146, '2021-07-08 18:46:35', 'Ingreso', 'A crear Reunion'),
(1669, 1, 151, '2021-07-08 18:46:46', 'Ingreso', 'A crear Acuerdo'),
(1670, 1, 103, '2021-07-08 18:47:31', 'Ingreso', 'A Lista de Reuniones'),
(1671, 1, 103, '2021-07-08 18:48:10', 'Ingreso', 'A Lista de Reuniones'),
(1672, 1, 103, '2021-07-08 18:51:54', 'Ingreso', 'A Lista de Reuniones'),
(1673, 1, 151, '2021-07-08 18:53:28', 'Ingreso', 'A crear Acuerdo'),
(1674, 1, 151, '2021-07-08 18:53:35', 'Ingreso', 'A crear Acuerdo'),
(1675, 1, 7, '2021-07-08 18:54:48', 'Ingreso', 'A Gestion de Parametros'),
(1676, 1, 146, '2021-07-08 18:54:49', 'Ingreso', 'A crear Reunion'),
(1677, 1, 103, '2021-07-08 18:58:34', 'Ingreso', 'A Lista de Reuniones'),
(1678, 1, 103, '2021-07-08 19:18:38', 'Ingreso', 'A Lista de Reuniones'),
(1679, 1, 103, '2021-07-08 19:19:16', 'Ingreso', 'A Lista de Reuniones'),
(1680, 1, 103, '2021-07-08 19:22:50', 'Ingreso', 'A Lista de Reuniones'),
(1681, 1, 103, '2021-07-08 19:23:16', 'Ingreso', 'A Lista de Reuniones'),
(1682, 1, 103, '2021-07-08 19:23:27', 'Ingreso', 'A Lista de Reuniones'),
(1683, 1, 103, '2021-07-08 19:25:22', 'Ingreso', 'A Lista de Reuniones'),
(1684, 1, 103, '2021-07-08 19:31:08', 'Ingreso', 'A Lista de Reuniones'),
(1685, 1, 103, '2021-07-08 19:32:04', 'Ingreso', 'A Lista de Reuniones'),
(1686, 1, 146, '2021-07-08 19:39:12', 'Ingreso', 'A crear Reunion'),
(1687, 1, 146, '2021-07-08 19:39:34', 'Ingreso', 'A crear Reunion'),
(1688, 1, 146, '2021-07-08 19:39:49', 'Ingreso', 'A crear Reunion'),
(1689, 1, 146, '2021-07-08 19:41:40', 'Ingreso', 'A crear Reunion'),
(1690, 1, 146, '2021-07-08 19:42:09', 'Ingreso', 'A crear Reunion'),
(1691, 1, 146, '2021-07-08 19:49:38', 'Ingreso', 'A crear Reunion'),
(1692, 1, 146, '2021-07-08 19:49:46', 'Ingreso', 'A crear Reunion'),
(1693, 1, 103, '2021-07-08 19:49:53', 'Ingreso', 'A Lista de Reuniones'),
(1694, 1, 7, '2021-07-08 19:50:32', 'Ingreso', 'A Gestion de Parametros'),
(1695, 1, 146, '2021-07-08 19:50:35', 'Ingreso', 'A crear Reunion'),
(1696, 1, 7, '2021-07-08 19:50:42', 'Ingreso', 'A Gestion de Parametros'),
(1697, 1, 146, '2021-07-08 19:50:46', 'Ingreso', 'A crear Reunion'),
(1698, 1, 7, '2021-07-08 19:50:51', 'Ingreso', 'A Gestion de Parametros'),
(1699, 1, 146, '2021-07-08 19:51:00', 'Ingreso', 'A crear Reunion'),
(1700, 1, 7, '2021-07-08 19:51:13', 'Ingreso', 'A Gestion de Parametros'),
(1701, 1, 146, '2021-07-08 19:51:21', 'Ingreso', 'A crear Reunion'),
(1702, 1, 7, '2021-07-08 19:52:00', 'Ingreso', 'A Gestion de Parametros'),
(1703, 1, 146, '2021-07-08 19:52:03', 'Ingreso', 'A crear Reunion'),
(1704, 1, 7, '2021-07-08 19:52:17', 'Ingreso', 'A Gestion de Parametros'),
(1705, 1, 146, '2021-07-08 19:52:18', 'Ingreso', 'A crear Reunion'),
(1706, 1, 146, '2021-07-08 19:55:26', 'Ingreso', 'A crear Reunion'),
(1707, 1, 7, '2021-07-08 19:55:27', 'Ingreso', 'A Gestion de Parametros'),
(1708, 1, 146, '2021-07-08 19:55:32', 'Ingreso', 'A crear Reunion'),
(1709, 1, 7, '2021-07-08 19:55:37', 'Ingreso', 'A Gestion de Parametros'),
(1710, 1, 146, '2021-07-08 19:55:40', 'Ingreso', 'A crear Reunion'),
(1711, 1, 7, '2021-07-08 19:56:04', 'Ingreso', 'A Gestion de Parametros'),
(1712, 1, 146, '2021-07-08 20:13:06', 'Ingreso', 'A crear Reunion'),
(1713, 1, 146, '2021-07-08 20:18:59', 'Ingreso', 'A crear Reunion'),
(1714, 1, 146, '2021-07-08 20:19:35', 'Ingreso', 'A crear Reunion'),
(1715, 1, 146, '2021-07-08 20:20:56', 'Ingreso', 'A crear Reunion'),
(1716, 1, 146, '2021-07-08 20:29:12', 'Ingreso', 'A crear Reunion'),
(1717, 1, 146, '2021-07-08 20:30:50', 'Ingreso', 'A crear Reunion'),
(1718, 1, 7, '2021-07-08 20:31:00', 'Ingreso', 'A Gestion de Parametros'),
(1719, 1, 146, '2021-07-08 20:31:03', 'Ingreso', 'A crear Reunion'),
(1720, 1, 146, '2021-07-08 20:33:28', 'Ingreso', 'A crear Reunion'),
(1721, 1, 146, '2021-07-08 20:34:54', 'Ingreso', 'A crear Reunion'),
(1722, 1, 146, '2021-07-08 20:35:47', 'Ingreso', 'A crear Reunion'),
(1723, 1, 146, '2021-07-09 10:36:52', 'Ingreso', 'A crear Reunion'),
(1724, 1, 146, '2021-07-09 10:37:47', 'Ingreso', 'A crear Reunion'),
(1725, 1, 146, '2021-07-09 10:38:08', 'Ingreso', 'A crear Reunion'),
(1726, 1, 146, '2021-07-09 10:40:27', 'Ingreso', 'A crear Reunion'),
(1727, 1, 146, '2021-07-09 10:42:48', 'Ingreso', 'A crear Reunion'),
(1728, 1, 146, '2021-07-09 10:43:03', 'Ingreso', 'A crear Reunion'),
(1729, 1, 146, '2021-07-09 10:43:12', 'Ingreso', 'A crear Reunion'),
(1730, 1, 146, '2021-07-09 10:43:28', 'Ingreso', 'A crear Reunion'),
(1731, 1, 146, '2021-07-09 10:43:45', 'Ingreso', 'A crear Reunion'),
(1732, 1, 146, '2021-07-09 10:44:55', 'Ingreso', 'A crear Reunion'),
(1733, 1, 146, '2021-07-09 10:45:31', 'Ingreso', 'A crear Reunion'),
(1734, 1, 146, '2021-07-09 10:47:51', 'Ingreso', 'A crear Reunion'),
(1735, 1, 146, '2021-07-09 10:48:36', 'Ingreso', 'A crear Reunion'),
(1736, 1, 146, '2021-07-09 10:48:55', 'Ingreso', 'A crear Reunion'),
(1737, 1, 146, '2021-07-09 10:49:58', 'Ingreso', 'A crear Reunion'),
(1738, 1, 146, '2021-07-09 10:50:27', 'Ingreso', 'A crear Reunion'),
(1739, 1, 146, '2021-07-09 10:51:27', 'Ingreso', 'A crear Reunion'),
(1740, 1, 146, '2021-07-09 10:57:03', 'Ingreso', 'A crear Reunion'),
(1741, 1, 146, '2021-07-09 10:57:12', 'Ingreso', 'A crear Reunion'),
(1742, 1, 146, '2021-07-09 10:57:33', 'Ingreso', 'A crear Reunion'),
(1743, 1, 146, '2021-07-09 10:57:42', 'Ingreso', 'A crear Reunion'),
(1744, 1, 146, '2021-07-09 10:57:51', 'Ingreso', 'A crear Reunion'),
(1745, 1, 146, '2021-07-09 10:59:02', 'Ingreso', 'A crear Reunion'),
(1746, 1, 146, '2021-07-09 11:03:03', 'Ingreso', 'A crear Reunion'),
(1747, 1, 146, '2021-07-09 11:04:17', 'Ingreso', 'A crear Reunion'),
(1748, 1, 146, '2021-07-09 11:04:26', 'Ingreso', 'A crear Reunion'),
(1749, 1, 146, '2021-07-09 11:14:31', 'Ingreso', 'A crear Reunion'),
(1750, 1, 146, '2021-07-09 11:15:01', 'Ingreso', 'A crear Reunion'),
(1751, 1, 146, '2021-07-09 11:26:57', 'Ingreso', 'A crear Reunion'),
(1752, 1, 146, '2021-07-09 11:27:06', 'Ingreso', 'A crear Reunion'),
(1753, 1, 146, '2021-07-09 11:27:20', 'Ingreso', 'A crear Reunion'),
(1754, 1, 146, '2021-07-09 11:27:34', 'Ingreso', 'A crear Reunion'),
(1755, 1, 146, '2021-07-09 11:27:54', 'Ingreso', 'A crear Reunion'),
(1756, 1, 146, '2021-07-09 11:29:11', 'Ingreso', 'A crear Reunion'),
(1757, 1, 146, '2021-07-09 11:29:24', 'Ingreso', 'A crear Reunion'),
(1758, 1, 146, '2021-07-09 11:29:27', 'Ingreso', 'A crear Reunion'),
(1759, 1, 146, '2021-07-09 11:29:30', 'Ingreso', 'A crear Reunion'),
(1760, 1, 146, '2021-07-09 11:29:32', 'Ingreso', 'A crear Reunion'),
(1761, 1, 103, '2021-07-09 11:29:38', 'Ingreso', 'A Lista de Reuniones'),
(1762, 1, 7, '2021-07-09 11:29:49', 'Ingreso', 'A Gestion de Parametros'),
(1763, 1, 146, '2021-07-09 11:29:53', 'Ingreso', 'A crear Reunion'),
(1764, 1, 7, '2021-07-09 11:29:56', 'Ingreso', 'A Gestion de Parametros'),
(1765, 1, 146, '2021-07-09 11:29:58', 'Ingreso', 'A crear Reunion'),
(1766, 1, 7, '2021-07-09 11:31:50', 'Ingreso', 'A Gestion de Parametros'),
(1767, 1, 146, '2021-07-09 11:31:52', 'Ingreso', 'A crear Reunion'),
(1768, 1, 7, '2021-07-09 11:31:55', 'Ingreso', 'A Gestion de Parametros'),
(1769, 1, 146, '2021-07-09 11:32:02', 'Ingreso', 'A crear Reunion'),
(1770, 1, 7, '2021-07-09 11:32:11', 'Ingreso', 'A Gestion de Parametros'),
(1771, 1, 146, '2021-07-09 11:32:14', 'Ingreso', 'A crear Reunion'),
(1772, 1, 7, '2021-07-09 11:33:21', 'Ingreso', 'A Gestion de Parametros'),
(1773, 1, 146, '2021-07-09 11:33:24', 'Ingreso', 'A crear Reunion'),
(1774, 1, 7, '2021-07-09 11:33:29', 'Ingreso', 'A Gestion de Parametros'),
(1775, 1, 146, '2021-07-09 11:33:45', 'Ingreso', 'A crear Reunion'),
(1776, 1, 7, '2021-07-09 11:34:01', 'Ingreso', 'A Gestion de Parametros'),
(1777, 1, 146, '2021-07-09 11:34:19', 'Ingreso', 'A crear Reunion'),
(1778, 1, 146, '2021-07-09 11:34:28', 'Ingreso', 'A crear Reunion'),
(1779, 1, 7, '2021-07-09 11:34:35', 'Ingreso', 'A Gestion de Parametros'),
(1780, 1, 146, '2021-07-09 11:34:38', 'Ingreso', 'A crear Reunion'),
(1781, 1, 146, '2021-07-09 11:36:48', 'Ingreso', 'A crear Reunion'),
(1782, 1, 146, '2021-07-09 11:37:21', 'Ingreso', 'A crear Reunion'),
(1783, 1, 146, '2021-07-09 11:37:46', 'Ingreso', 'A crear Reunion'),
(1784, 1, 146, '2021-07-09 11:53:57', 'Ingreso', 'A crear Reunion'),
(1785, 1, 146, '2021-07-09 12:34:17', 'Ingreso', 'A crear Reunion'),
(1786, 1, 146, '2021-07-09 12:36:51', 'Ingreso', 'A crear Reunion'),
(1787, 1, 146, '2021-07-09 12:38:56', 'Ingreso', 'A crear Reunion'),
(1788, 1, 146, '2021-07-09 12:39:45', 'Ingreso', 'A crear Reunion'),
(1789, 1, 146, '2021-07-09 12:40:22', 'Ingreso', 'A crear Reunion'),
(1790, 1, 7, '2021-07-09 12:45:45', 'Ingreso', 'A Gestion de Parametros'),
(1791, 1, 146, '2021-07-09 12:45:48', 'Ingreso', 'A crear Reunion'),
(1792, 1, 146, '2021-07-09 12:45:55', 'Ingreso', 'A crear Reunion'),
(1793, 1, 146, '2021-07-09 12:46:08', 'Ingreso', 'A crear Reunion'),
(1794, 1, 7, '2021-07-09 13:38:22', 'Ingreso', 'A Gestion de Parametros'),
(1795, 1, 146, '2021-07-09 13:38:25', 'Ingreso', 'A crear Reunion'),
(1796, 1, 146, '2021-07-09 13:41:09', 'Ingreso', 'A crear Reunion'),
(1797, 1, 7, '2021-07-09 16:28:07', 'Ingreso', 'A Gestion de Parametros'),
(1798, 1, 146, '2021-07-09 16:28:09', 'Ingreso', 'A crear Reunion'),
(1799, 1, 7, '2021-07-09 16:28:16', 'Ingreso', 'A Gestion de Parametros'),
(1800, 1, 146, '2021-07-09 16:28:19', 'Ingreso', 'A crear Reunion'),
(1801, 1, 7, '2021-07-09 16:28:27', 'Ingreso', 'A Gestion de Parametros'),
(1802, 1, 146, '2021-07-09 16:30:16', 'Ingreso', 'A crear Reunion'),
(1803, 1, 7, '2021-07-09 16:30:20', 'Ingreso', 'A Gestion de Parametros'),
(1804, 1, 146, '2021-07-09 16:30:23', 'Ingreso', 'A crear Reunion'),
(1805, 1, 7, '2021-07-09 16:30:29', 'Ingreso', 'A Gestion de Parametros'),
(1806, 1, 146, '2021-07-09 16:30:31', 'Ingreso', 'A crear Reunion'),
(1807, 1, 7, '2021-07-09 16:30:47', 'Ingreso', 'A Gestion de Parametros'),
(1808, 1, 146, '2021-07-09 16:35:15', 'Ingreso', 'A crear Reunion'),
(1809, 1, 146, '2021-07-09 17:01:33', 'Ingreso', 'A crear Reunion'),
(1810, 1, 146, '2021-07-09 17:07:30', 'Ingreso', 'A crear Reunion'),
(1811, 1, 146, '2021-07-09 17:07:50', 'Ingreso', 'A crear Reunion'),
(1812, 1, 146, '2021-07-09 17:08:44', 'Ingreso', 'A crear Reunion'),
(1813, 1, 146, '2021-07-09 17:09:38', 'Ingreso', 'A crear Reunion'),
(1814, 1, 146, '2021-07-09 17:10:10', 'Ingreso', 'A crear Reunion'),
(1815, 1, 146, '2021-07-09 17:50:54', 'Ingreso', 'A crear Reunion'),
(1816, 1, 146, '2021-07-09 17:53:00', 'Ingreso', 'A crear Reunion'),
(1817, 1, 146, '2021-07-09 17:57:14', 'Ingreso', 'A crear Reunion'),
(1818, 1, 146, '2021-07-09 17:57:21', 'Ingreso', 'A crear Reunion'),
(1819, 1, 146, '2021-07-09 17:57:25', 'Ingreso', 'A crear Reunion'),
(1820, 1, 7, '2021-07-09 17:57:41', 'Ingreso', 'A Gestion de Parametros'),
(1821, 1, 146, '2021-07-09 17:57:42', 'Ingreso', 'A crear Reunion'),
(1822, 1, 146, '2021-07-09 18:00:22', 'Ingreso', 'A crear Reunion'),
(1823, 1, 146, '2021-07-09 18:01:17', 'Ingreso', 'A crear Reunion'),
(1824, 1, 146, '2021-07-09 18:12:01', 'Ingreso', 'A crear Reunion'),
(1825, 1, 146, '2021-07-09 18:16:19', 'Ingreso', 'A crear Reunion'),
(1826, 1, 146, '2021-07-09 18:30:16', 'Ingreso', 'A crear Reunion'),
(1827, 1, 146, '2021-07-09 18:31:13', 'Ingreso', 'A crear Reunion'),
(1828, 1, 146, '2021-07-09 18:31:51', 'Ingreso', 'A crear Reunion'),
(1829, 1, 146, '2021-07-09 18:33:14', 'Ingreso', 'A crear Reunion'),
(1830, 1, 146, '2021-07-09 18:33:46', 'Ingreso', 'A crear Reunion'),
(1831, 1, 146, '2021-07-09 18:39:32', 'Ingreso', 'A crear Reunion'),
(1832, 1, 146, '2021-07-09 18:40:28', 'Ingreso', 'A crear Reunion'),
(1833, 1, 146, '2021-07-09 18:40:46', 'Ingreso', 'A crear Reunion'),
(1834, 1, 146, '2021-07-09 18:44:15', 'Ingreso', 'A crear Reunion'),
(1835, 1, 146, '2021-07-09 19:08:38', 'Ingreso', 'A crear Reunion'),
(1836, 1, 7, '2021-07-09 19:08:48', 'Ingreso', 'A Gestion de Parametros'),
(1837, 1, 146, '2021-07-09 19:10:30', 'Ingreso', 'A crear Reunion'),
(1838, 1, 7, '2021-07-09 19:10:40', 'Ingreso', 'A Gestion de Parametros'),
(1839, 1, 146, '2021-07-10 10:54:01', 'Ingreso', 'A crear Reunion'),
(1840, 1, 103, '2021-07-10 10:54:23', 'Ingreso', 'A Lista de Reuniones'),
(1841, 1, 7, '2021-07-10 10:54:45', 'Ingreso', 'A Gestion de Parametros'),
(1842, 1, 146, '2021-07-10 10:54:50', 'Ingreso', 'A crear Reunion'),
(1843, 1, 7, '2021-07-10 10:55:26', 'Ingreso', 'A Gestion de Parametros'),
(1844, 1, 146, '2021-07-10 10:55:29', 'Ingreso', 'A crear Reunion'),
(1845, 1, 7, '2021-07-10 10:55:39', 'Ingreso', 'A Gestion de Parametros'),
(1846, 1, 146, '2021-07-10 10:55:41', 'Ingreso', 'A crear Reunion'),
(1847, 1, 146, '2021-07-10 11:03:58', 'Ingreso', 'A crear Reunion'),
(1848, 1, 146, '2021-07-10 11:05:52', 'Ingreso', 'A crear Reunion'),
(1849, 1, 146, '2021-07-10 11:07:32', 'Ingreso', 'A crear Reunion'),
(1850, 1, 146, '2021-07-10 11:09:22', 'Ingreso', 'A crear Reunion'),
(1851, 1, 146, '2021-07-10 11:09:33', 'Ingreso', 'A crear Reunion'),
(1852, 1, 146, '2021-07-10 11:11:16', 'Ingreso', 'A crear Reunion'),
(1853, 1, 146, '2021-07-10 11:12:36', 'Ingreso', 'A crear Reunion'),
(1854, 1, 146, '2021-07-10 11:14:53', 'Ingreso', 'A crear Reunion'),
(1855, 1, 146, '2021-07-10 11:15:03', 'Ingreso', 'A crear Reunion'),
(1856, 1, 146, '2021-07-10 11:15:37', 'Ingreso', 'A crear Reunion'),
(1857, 1, 146, '2021-07-10 11:17:50', 'Ingreso', 'A crear Reunion'),
(1858, 1, 146, '2021-07-10 11:18:04', 'Ingreso', 'A crear Reunion'),
(1859, 1, 146, '2021-07-10 11:18:22', 'Ingreso', 'A crear Reunion'),
(1860, 1, 146, '2021-07-10 11:18:40', 'Ingreso', 'A crear Reunion'),
(1861, 1, 146, '2021-07-10 11:19:10', 'Ingreso', 'A crear Reunion'),
(1862, 1, 146, '2021-07-10 11:19:41', 'Ingreso', 'A crear Reunion'),
(1863, 1, 146, '2021-07-10 11:20:33', 'Ingreso', 'A crear Reunion'),
(1864, 1, 146, '2021-07-10 11:21:33', 'Ingreso', 'A crear Reunion'),
(1865, 1, 146, '2021-07-10 11:23:31', 'Ingreso', 'A crear Reunion'),
(1866, 1, 146, '2021-07-10 11:38:21', 'Ingreso', 'A crear Reunion'),
(1867, 1, 146, '2021-07-10 11:44:13', 'Ingreso', 'A crear Reunion'),
(1868, 1, 7, '2021-07-10 11:51:31', 'Ingreso', 'A Gestion de Parametros'),
(1869, 1, 7, '2021-07-10 11:51:34', 'Ingreso', 'A Gestion de Parametros'),
(1870, 1, 146, '2021-07-10 11:52:06', 'Ingreso', 'A crear Reunion'),
(1871, 1, 7, '2021-07-10 11:54:39', 'Ingreso', 'A Gestion de Parametros'),
(1872, 1, 146, '2021-07-10 11:54:42', 'Ingreso', 'A crear Reunion'),
(1873, 1, 7, '2021-07-10 11:54:54', 'Ingreso', 'A Gestion de Parametros'),
(1874, 1, 146, '2021-07-10 11:55:31', 'Ingreso', 'A crear Reunion'),
(1875, 1, 146, '2021-07-10 11:57:33', 'Ingreso', 'A crear Reunion'),
(1876, 1, 7, '2021-07-10 11:58:21', 'Ingreso', 'A Gestion de Parametros'),
(1877, 1, 146, '2021-07-10 11:58:28', 'Ingreso', 'A crear Reunion'),
(1878, 1, 7, '2021-07-10 11:58:32', 'Ingreso', 'A Gestion de Parametros'),
(1879, 1, 146, '2021-07-10 11:58:33', 'Ingreso', 'A crear Reunion'),
(1880, 1, 7, '2021-07-10 11:58:34', 'Ingreso', 'A Gestion de Parametros'),
(1881, 1, 146, '2021-07-10 11:58:35', 'Ingreso', 'A crear Reunion'),
(1882, 1, 7, '2021-07-10 11:58:37', 'Ingreso', 'A Gestion de Parametros'),
(1883, 1, 146, '2021-07-10 11:58:42', 'Ingreso', 'A crear Reunion'),
(1884, 1, 7, '2021-07-10 12:04:43', 'Ingreso', 'A Gestion de Parametros'),
(1885, 1, 146, '2021-07-10 12:05:36', 'Ingreso', 'A crear Reunion'),
(1886, 1, 146, '2021-07-10 13:16:31', 'Ingreso', 'A crear Reunion'),
(1887, 1, 7, '2021-07-10 13:22:59', 'Ingreso', 'A Gestion de Parametros'),
(1888, 1, 146, '2021-07-10 13:23:06', 'Ingreso', 'A crear Reunion'),
(1889, 1, 7, '2021-07-10 13:27:03', 'Ingreso', 'A Gestion de Parametros'),
(1890, 1, 146, '2021-07-10 13:27:06', 'Ingreso', 'A crear Reunion'),
(1891, 1, 7, '2021-07-10 13:27:31', 'Ingreso', 'A Gestion de Parametros'),
(1892, 1, 146, '2021-07-10 13:28:04', 'Ingreso', 'A crear Reunion'),
(1893, 1, 7, '2021-07-10 13:30:51', 'Ingreso', 'A Gestion de Parametros'),
(1894, 1, 146, '2021-07-10 13:30:54', 'Ingreso', 'A crear Reunion'),
(1895, 1, 103, '2021-07-10 13:35:20', 'Ingreso', 'A Lista de Reuniones'),
(1896, 1, 7, '2021-07-10 13:35:36', 'Ingreso', 'A Gestion de Parametros'),
(1897, 1, 146, '2021-07-10 13:35:40', 'Ingreso', 'A crear Reunion'),
(1898, 1, 7, '2021-07-10 13:35:48', 'Ingreso', 'A Gestion de Parametros'),
(1899, 1, 103, '2021-07-10 13:35:54', 'Ingreso', 'A Lista de Reuniones'),
(1900, 1, 103, '2021-07-10 13:36:57', 'Ingreso', 'A Lista de Reuniones'),
(1901, 1, 103, '2021-07-10 13:37:16', 'Ingreso', 'A Lista de Reuniones'),
(1902, 1, 7, '2021-07-10 13:37:21', 'Ingreso', 'A Gestion de Parametros'),
(1903, 1, 146, '2021-07-10 13:41:59', 'Ingreso', 'A crear Reunion'),
(1904, 1, 7, '2021-07-10 13:42:25', 'Ingreso', 'A Gestion de Parametros'),
(1905, 1, 146, '2021-07-10 13:44:55', 'Ingreso', 'A crear Reunion'),
(1906, 1, 7, '2021-07-10 13:45:37', 'Ingreso', 'A Gestion de Parametros'),
(1907, 1, 146, '2021-07-10 13:45:42', 'Ingreso', 'A crear Reunion'),
(1908, 1, 7, '2021-07-10 13:45:47', 'Ingreso', 'A Gestion de Parametros'),
(1909, 1, 146, '2021-07-10 13:46:03', 'Ingreso', 'A crear Reunion'),
(1910, 1, 7, '2021-07-10 13:46:08', 'Ingreso', 'A Gestion de Parametros'),
(1911, 1, 7, '2021-07-10 13:52:19', 'Ingreso', 'A Gestion de Parametros'),
(1912, 1, 146, '2021-07-10 13:52:43', 'Ingreso', 'A crear Reunion'),
(1913, 1, 146, '2021-07-10 13:52:58', 'Ingreso', 'A crear Reunion'),
(1914, 1, 7, '2021-07-10 14:00:05', 'Ingreso', 'A Gestion de Parametros'),
(1915, 1, 146, '2021-07-10 14:00:08', 'Ingreso', 'A crear Reunion'),
(1916, 1, 146, '2021-07-10 14:00:11', 'Ingreso', 'A crear Reunion'),
(1917, 1, 7, '2021-07-10 14:00:18', 'Ingreso', 'A Gestion de Parametros'),
(1918, 1, 146, '2021-07-10 14:00:47', 'Ingreso', 'A crear Reunion'),
(1919, 1, 146, '2021-07-10 14:03:17', 'Ingreso', 'A crear Reunion'),
(1920, 1, 146, '2021-07-10 14:03:52', 'Ingreso', 'A crear Reunion'),
(1921, 1, 146, '2021-07-10 14:04:55', 'Ingreso', 'A crear Reunion'),
(1922, 1, 7, '2021-07-10 14:07:51', 'Ingreso', 'A Gestion de Parametros'),
(1923, 1, 146, '2021-07-10 14:08:36', 'Ingreso', 'A crear Reunion'),
(1924, 1, 7, '2021-07-10 14:08:42', 'Ingreso', 'A Gestion de Parametros'),
(1925, 1, 146, '2021-07-10 14:14:04', 'Ingreso', 'A crear Reunion'),
(1926, 1, 146, '2021-07-10 14:15:41', 'Ingreso', 'A crear Reunion'),
(1927, 1, 7, '2021-07-10 14:15:52', 'Ingreso', 'A Gestion de Parametros'),
(1928, 1, 146, '2021-07-10 14:16:04', 'Ingreso', 'A crear Reunion'),
(1929, 1, 146, '2021-07-10 14:17:29', 'Ingreso', 'A crear Reunion'),
(1930, 1, 7, '2021-07-10 14:17:38', 'Ingreso', 'A Gestion de Parametros'),
(1931, 1, 146, '2021-07-10 14:17:41', 'Ingreso', 'A crear Reunion'),
(1932, 1, 7, '2021-07-10 14:19:28', 'Ingreso', 'A Gestion de Parametros'),
(1933, 1, 146, '2021-07-10 14:19:35', 'Ingreso', 'A crear Reunion'),
(1934, 1, 7, '2021-07-10 14:19:41', 'Ingreso', 'A Gestion de Parametros'),
(1935, 1, 7, '2021-07-10 14:20:35', 'Ingreso', 'A Gestion de Parametros'),
(1936, 1, 146, '2021-07-10 14:20:37', 'Ingreso', 'A crear Reunion'),
(1937, 1, 7, '2021-07-10 14:22:32', 'Ingreso', 'A Gestion de Parametros'),
(1938, 1, 7, '2021-07-10 15:06:03', 'Ingreso', 'A Gestion de Parametros'),
(1939, 1, 7, '2021-07-10 15:06:11', 'Ingreso', 'A Gestion de Parametros'),
(1940, 1, 146, '2021-07-10 15:06:14', 'Ingreso', 'A crear Reunion'),
(1941, 1, 146, '2021-07-10 15:07:05', 'Ingreso', 'A crear Reunion'),
(1942, 1, 146, '2021-07-10 15:08:04', 'Ingreso', 'A crear Reunion'),
(1943, 1, 146, '2021-07-10 15:08:37', 'Ingreso', 'A crear Reunion'),
(1944, 1, 146, '2021-07-10 15:09:27', 'Ingreso', 'A crear Reunion'),
(1945, 1, 146, '2021-07-10 15:11:53', 'Ingreso', 'A crear Reunion'),
(1946, 1, 146, '2021-07-10 15:13:09', 'Ingreso', 'A crear Reunion'),
(1947, 1, 146, '2021-07-10 15:14:08', 'Ingreso', 'A crear Reunion'),
(1948, 1, 146, '2021-07-10 15:14:19', 'Ingreso', 'A crear Reunion'),
(1949, 1, 146, '2021-07-10 15:14:49', 'Ingreso', 'A crear Reunion'),
(1950, 1, 146, '2021-07-10 15:15:36', 'Ingreso', 'A crear Reunion'),
(1951, 1, 146, '2021-07-10 15:16:12', 'Ingreso', 'A crear Reunion'),
(1952, 1, 7, '2021-07-10 15:16:33', 'Ingreso', 'A Gestion de Parametros'),
(1953, 1, 146, '2021-07-10 15:16:53', 'Ingreso', 'A crear Reunion'),
(1954, 1, 7, '2021-07-10 15:17:02', 'Ingreso', 'A Gestion de Parametros'),
(1955, 1, 146, '2021-07-10 15:18:59', 'Ingreso', 'A crear Reunion'),
(1956, 1, 7, '2021-07-10 15:19:40', 'Ingreso', 'A Gestion de Parametros'),
(1957, 1, 146, '2021-07-10 15:19:44', 'Ingreso', 'A crear Reunion'),
(1958, 1, 7, '2021-07-10 15:19:55', 'Ingreso', 'A Gestion de Parametros'),
(1959, 1, 146, '2021-07-10 15:21:28', 'Ingreso', 'A crear Reunion'),
(1960, 1, 146, '2021-07-10 15:22:28', 'Ingreso', 'A crear Reunion'),
(1961, 1, 146, '2021-07-10 15:23:43', 'Ingreso', 'A crear Reunion'),
(1962, 1, 146, '2021-07-10 15:23:54', 'Ingreso', 'A crear Reunion'),
(1963, 1, 7, '2021-07-10 15:24:10', 'Ingreso', 'A Gestion de Parametros'),
(1964, 1, 146, '2021-07-10 15:24:13', 'Ingreso', 'A crear Reunion'),
(1965, 1, 7, '2021-07-10 15:24:38', 'Ingreso', 'A Gestion de Parametros'),
(1966, 1, 146, '2021-07-10 15:24:42', 'Ingreso', 'A crear Reunion'),
(1967, 1, 146, '2021-07-10 15:25:05', 'Ingreso', 'A crear Reunion'),
(1968, 1, 146, '2021-07-10 15:25:30', 'Ingreso', 'A crear Reunion'),
(1969, 1, 146, '2021-07-10 15:25:33', 'Ingreso', 'A crear Reunion'),
(1970, 1, 146, '2021-07-10 15:25:46', 'Ingreso', 'A crear Reunion'),
(1971, 1, 146, '2021-07-10 15:25:52', 'Ingreso', 'A crear Reunion'),
(1972, 1, 146, '2021-07-10 15:26:37', 'Ingreso', 'A crear Reunion'),
(1973, 1, 146, '2021-07-10 15:26:46', 'Ingreso', 'A crear Reunion'),
(1974, 1, 7, '2021-07-10 15:26:57', 'Ingreso', 'A Gestion de Parametros'),
(1975, 1, 146, '2021-07-10 15:26:59', 'Ingreso', 'A crear Reunion'),
(1976, 1, 7, '2021-07-10 15:27:03', 'Ingreso', 'A Gestion de Parametros'),
(1977, 1, 146, '2021-07-10 15:27:06', 'Ingreso', 'A crear Reunion'),
(1978, 1, 7, '2021-07-10 15:27:19', 'Ingreso', 'A Gestion de Parametros'),
(1979, 1, 146, '2021-07-10 15:27:26', 'Ingreso', 'A crear Reunion'),
(1980, 1, 7, '2021-07-10 15:27:41', 'Ingreso', 'A Gestion de Parametros'),
(1981, 1, 146, '2021-07-10 15:27:43', 'Ingreso', 'A crear Reunion'),
(1982, 1, 7, '2021-07-10 15:27:53', 'Ingreso', 'A Gestion de Parametros'),
(1983, 1, 146, '2021-07-10 15:27:55', 'Ingreso', 'A crear Reunion'),
(1984, 1, 7, '2021-07-10 15:28:34', 'Ingreso', 'A Gestion de Parametros'),
(1985, 1, 146, '2021-07-10 15:28:36', 'Ingreso', 'A crear Reunion'),
(1986, 1, 7, '2021-07-10 15:28:51', 'Ingreso', 'A Gestion de Parametros'),
(1987, 1, 146, '2021-07-10 15:28:52', 'Ingreso', 'A crear Reunion'),
(1988, 1, 7, '2021-07-10 15:29:04', 'Ingreso', 'A Gestion de Parametros'),
(1989, 1, 146, '2021-07-10 15:29:05', 'Ingreso', 'A crear Reunion'),
(1990, 1, 7, '2021-07-10 15:29:29', 'Ingreso', 'A Gestion de Parametros'),
(1991, 1, 146, '2021-07-10 15:29:31', 'Ingreso', 'A crear Reunion'),
(1992, 1, 7, '2021-07-10 15:29:37', 'Ingreso', 'A Gestion de Parametros'),
(1993, 1, 146, '2021-07-10 15:29:39', 'Ingreso', 'A crear Reunion'),
(1994, 1, 146, '2021-07-10 15:30:48', 'Ingreso', 'A crear Reunion'),
(1995, 1, 7, '2021-07-10 15:30:53', 'Ingreso', 'A Gestion de Parametros'),
(1996, 1, 146, '2021-07-10 15:30:58', 'Ingreso', 'A crear Reunion'),
(1997, 1, 146, '2021-07-10 15:32:24', 'Ingreso', 'A crear Reunion'),
(1998, 1, 146, '2021-07-10 15:32:31', 'Ingreso', 'A crear Reunion'),
(1999, 1, 146, '2021-07-10 15:33:44', 'Ingreso', 'A crear Reunion'),
(2000, 1, 7, '2021-07-10 15:34:21', 'Ingreso', 'A Gestion de Parametros'),
(2001, 1, 7, '2021-07-10 15:34:25', 'Ingreso', 'A Gestion de Parametros'),
(2002, 1, 146, '2021-07-10 15:34:26', 'Ingreso', 'A crear Reunion'),
(2003, 1, 7, '2021-07-10 15:34:33', 'Ingreso', 'A Gestion de Parametros'),
(2004, 1, 146, '2021-07-10 15:36:12', 'Ingreso', 'A crear Reunion'),
(2005, 1, 7, '2021-07-10 15:36:15', 'Ingreso', 'A Gestion de Parametros'),
(2006, 1, 146, '2021-07-10 15:36:16', 'Ingreso', 'A crear Reunion'),
(2007, 1, 7, '2021-07-10 15:36:18', 'Ingreso', 'A Gestion de Parametros'),
(2008, 1, 146, '2021-07-10 15:36:20', 'Ingreso', 'A crear Reunion'),
(2009, 1, 7, '2021-07-10 15:36:29', 'Ingreso', 'A Gestion de Parametros'),
(2010, 1, 146, '2021-07-10 15:36:31', 'Ingreso', 'A crear Reunion'),
(2011, 1, 7, '2021-07-10 15:36:41', 'Ingreso', 'A Gestion de Parametros'),
(2012, 1, 146, '2021-07-10 15:36:44', 'Ingreso', 'A crear Reunion'),
(2013, 1, 146, '2021-07-10 15:38:13', 'Ingreso', 'A crear Reunion'),
(2014, 1, 146, '2021-07-10 15:38:38', 'Ingreso', 'A crear Reunion'),
(2015, 1, 146, '2021-07-10 15:38:52', 'Ingreso', 'A crear Reunion'),
(2016, 1, 146, '2021-07-10 15:39:06', 'Ingreso', 'A crear Reunion'),
(2017, 1, 146, '2021-07-10 15:39:24', 'Ingreso', 'A crear Reunion'),
(2018, 1, 7, '2021-07-10 15:40:25', 'Ingreso', 'A Gestion de Parametros'),
(2019, 1, 7, '2021-07-10 15:41:04', 'Ingreso', 'A Gestion de Parametros'),
(2020, 1, 146, '2021-07-10 15:41:06', 'Ingreso', 'A crear Reunion'),
(2021, 1, 7, '2021-07-10 15:41:17', 'Ingreso', 'A Gestion de Parametros'),
(2022, 1, 146, '2021-07-10 15:41:19', 'Ingreso', 'A crear Reunion'),
(2023, 1, 146, '2021-07-10 15:41:35', 'Ingreso', 'A crear Reunion'),
(2024, 1, 7, '2021-07-10 15:41:42', 'Ingreso', 'A Gestion de Parametros'),
(2025, 1, 146, '2021-07-10 15:41:44', 'Ingreso', 'A crear Reunion'),
(2026, 1, 7, '2021-07-10 15:44:52', 'Ingreso', 'A Gestion de Parametros'),
(2027, 1, 146, '2021-07-10 15:44:53', 'Ingreso', 'A crear Reunion'),
(2028, 1, 7, '2021-07-10 15:44:54', 'Ingreso', 'A Gestion de Parametros'),
(2029, 1, 146, '2021-07-10 15:44:56', 'Ingreso', 'A crear Reunion'),
(2030, 1, 7, '2021-07-10 15:44:58', 'Ingreso', 'A Gestion de Parametros'),
(2031, 1, 146, '2021-07-10 15:44:59', 'Ingreso', 'A crear Reunion'),
(2032, 1, 7, '2021-07-10 15:45:01', 'Ingreso', 'A Gestion de Parametros'),
(2033, 1, 146, '2021-07-10 15:45:02', 'Ingreso', 'A crear Reunion'),
(2034, 1, 7, '2021-07-10 15:45:04', 'Ingreso', 'A Gestion de Parametros'),
(2035, 1, 146, '2021-07-10 15:45:05', 'Ingreso', 'A crear Reunion'),
(2036, 1, 7, '2021-07-10 15:45:08', 'Ingreso', 'A Gestion de Parametros'),
(2037, 1, 146, '2021-07-10 15:45:08', 'Ingreso', 'A crear Reunion'),
(2038, 1, 7, '2021-07-10 15:45:08', 'Ingreso', 'A Gestion de Parametros'),
(2039, 1, 146, '2021-07-10 15:45:09', 'Ingreso', 'A crear Reunion'),
(2040, 1, 146, '2021-07-10 15:45:18', 'Ingreso', 'A crear Reunion'),
(2041, 1, 146, '2021-07-10 15:45:26', 'Ingreso', 'A crear Reunion'),
(2042, 1, 146, '2021-07-10 15:45:39', 'Ingreso', 'A crear Reunion'),
(2043, 1, 146, '2021-07-10 15:45:47', 'Ingreso', 'A crear Reunion'),
(2044, 1, 7, '2021-07-10 15:45:54', 'Ingreso', 'A Gestion de Parametros'),
(2045, 1, 146, '2021-07-10 15:46:00', 'Ingreso', 'A crear Reunion'),
(2046, 1, 7, '2021-07-10 15:46:16', 'Ingreso', 'A Gestion de Parametros'),
(2047, 1, 146, '2021-07-10 15:46:18', 'Ingreso', 'A crear Reunion'),
(2048, 1, 7, '2021-07-10 15:46:21', 'Ingreso', 'A Gestion de Parametros'),
(2049, 1, 146, '2021-07-10 15:46:23', 'Ingreso', 'A crear Reunion'),
(2050, 1, 7, '2021-07-10 15:46:33', 'Ingreso', 'A Gestion de Parametros'),
(2051, 1, 146, '2021-07-10 15:46:37', 'Ingreso', 'A crear Reunion'),
(2052, 1, 146, '2021-07-10 15:47:22', 'Ingreso', 'A crear Reunion'),
(2053, 1, 146, '2021-07-10 15:47:54', 'Ingreso', 'A crear Reunion'),
(2054, 1, 7, '2021-07-10 15:51:32', 'Ingreso', 'A Gestion de Parametros'),
(2055, 1, 146, '2021-07-10 15:51:39', 'Ingreso', 'A crear Reunion'),
(2056, 1, 7, '2021-07-10 15:51:40', 'Ingreso', 'A Gestion de Parametros'),
(2057, 1, 103, '2021-07-10 15:51:43', 'Ingreso', 'A Lista de Reuniones'),
(2058, 1, 7, '2021-07-10 15:52:33', 'Ingreso', 'A Gestion de Parametros'),
(2059, 1, 146, '2021-07-10 15:52:35', 'Ingreso', 'A crear Reunion'),
(2060, 1, 7, '2021-07-10 15:53:05', 'Ingreso', 'A Gestion de Parametros'),
(2061, 1, 103, '2021-07-10 15:53:12', 'Ingreso', 'A Lista de Reuniones'),
(2062, 1, 103, '2021-07-10 15:53:24', 'Ingreso', 'A Lista de Reuniones'),
(2063, 1, 103, '2021-07-10 15:54:31', 'Ingreso', 'A Lista de Reuniones'),
(2064, 1, 103, '2021-07-10 15:55:02', 'Ingreso', 'A Lista de Reuniones'),
(2065, 1, 7, '2021-07-10 16:01:20', 'Ingreso', 'A Gestion de Parametros'),
(2066, 1, 7, '2021-07-10 16:02:35', 'Ingreso', 'A Gestion de Parametros'),
(2067, 1, 7, '2021-07-10 16:02:40', 'Ingreso', 'A Gestion de Parametros'),
(2068, 1, 7, '2021-07-10 16:02:41', 'Ingreso', 'A Gestion de Parametros'),
(2069, 1, 7, '2021-07-10 16:02:44', 'Ingreso', 'A Gestion de Parametros'),
(2070, 1, 7, '2021-07-10 16:02:49', 'Ingreso', 'A Gestion de Parametros'),
(2071, 1, 7, '2021-07-10 16:03:37', 'Ingreso', 'A Gestion de Parametros'),
(2072, 1, 146, '2021-07-10 16:03:51', 'Ingreso', 'A crear Reunion'),
(2073, 1, 7, '2021-07-10 16:04:06', 'Ingreso', 'A Gestion de Parametros'),
(2074, 1, 146, '2021-07-10 16:04:08', 'Ingreso', 'A crear Reunion'),
(2075, 1, 7, '2021-07-10 16:04:10', 'Ingreso', 'A Gestion de Parametros'),
(2076, 1, 146, '2021-07-10 16:04:11', 'Ingreso', 'A crear Reunion'),
(2077, 1, 7, '2021-07-10 16:04:14', 'Ingreso', 'A Gestion de Parametros'),
(2078, 1, 146, '2021-07-10 16:04:16', 'Ingreso', 'A crear Reunion'),
(2079, 1, 7, '2021-07-10 16:07:07', 'Ingreso', 'A Gestion de Parametros');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(2080, 1, 146, '2021-07-10 16:07:09', 'Ingreso', 'A crear Reunion'),
(2081, 1, 7, '2021-07-10 16:07:31', 'Ingreso', 'A Gestion de Parametros'),
(2082, 1, 146, '2021-07-10 16:07:38', 'Ingreso', 'A crear Reunion'),
(2083, 1, 146, '2021-07-10 16:07:51', 'Ingreso', 'A crear Reunion'),
(2084, 1, 146, '2021-07-10 16:08:54', 'Ingreso', 'A crear Reunion'),
(2085, 1, 146, '2021-07-10 16:09:02', 'Ingreso', 'A crear Reunion'),
(2086, 1, 146, '2021-07-10 16:33:57', 'Ingreso', 'A crear Reunion'),
(2087, 1, 146, '2021-07-10 16:44:00', 'Ingreso', 'A crear Reunion'),
(2088, 1, 7, '2021-07-10 16:44:10', 'Ingreso', 'A Gestion de Parametros'),
(2089, 1, 146, '2021-07-10 16:44:12', 'Ingreso', 'A crear Reunion'),
(2090, 1, 7, '2021-07-10 16:44:32', 'Ingreso', 'A Gestion de Parametros'),
(2091, 1, 146, '2021-07-10 16:44:35', 'Ingreso', 'A crear Reunion'),
(2092, 1, 7, '2021-07-10 16:49:56', 'Ingreso', 'A Gestion de Parametros'),
(2093, 1, 146, '2021-07-10 16:49:57', 'Ingreso', 'A crear Reunion'),
(2094, 1, 146, '2021-07-10 17:01:01', 'Ingreso', 'A crear Reunion'),
(2095, 1, 7, '2021-07-10 17:01:04', 'Ingreso', 'A Gestion de Parametros'),
(2096, 1, 146, '2021-07-10 17:01:28', 'Ingreso', 'A crear Reunion'),
(2097, 1, 7, '2021-07-10 17:07:31', 'Ingreso', 'A Gestion de Parametros'),
(2098, 1, 146, '2021-07-10 17:09:57', 'Ingreso', 'A crear Reunion'),
(2099, 1, 7, '2021-07-10 17:14:41', 'Ingreso', 'A Gestion de Parametros'),
(2100, 1, 146, '2021-07-10 17:14:59', 'Ingreso', 'A crear Reunion'),
(2101, 1, 7, '2021-07-10 17:15:05', 'Ingreso', 'A Gestion de Parametros'),
(2102, 1, 146, '2021-07-10 17:21:40', 'Ingreso', 'A crear Reunion'),
(2103, 1, 7, '2021-07-10 17:21:44', 'Ingreso', 'A Gestion de Parametros'),
(2104, 1, 146, '2021-07-10 17:22:10', 'Ingreso', 'A crear Reunion'),
(2105, 1, 7, '2021-07-10 17:25:02', 'Ingreso', 'A Gestion de Parametros'),
(2106, 1, 146, '2021-07-10 17:25:52', 'Ingreso', 'A crear Reunion'),
(2107, 1, 7, '2021-07-10 17:26:12', 'Ingreso', 'A Gestion de Parametros'),
(2108, 1, 7, '2021-07-11 14:02:51', 'Ingreso', 'A Gestion de Parametros'),
(2109, 1, 146, '2021-07-11 14:02:53', 'Ingreso', 'A crear Reunion'),
(2110, 1, 7, '2021-07-11 14:02:55', 'Ingreso', 'A Gestion de Parametros'),
(2111, 1, 146, '2021-07-11 14:02:57', 'Ingreso', 'A crear Reunion'),
(2112, 1, 7, '2021-07-11 14:02:59', 'Ingreso', 'A Gestion de Parametros'),
(2113, 1, 146, '2021-07-11 14:03:00', 'Ingreso', 'A crear Reunion'),
(2114, 1, 7, '2021-07-11 14:03:02', 'Ingreso', 'A Gestion de Parametros'),
(2115, 1, 146, '2021-07-11 14:03:04', 'Ingreso', 'A crear Reunion'),
(2116, 1, 7, '2021-07-11 14:03:07', 'Ingreso', 'A Gestion de Parametros'),
(2117, 1, 146, '2021-07-11 14:05:40', 'Ingreso', 'A crear Reunion'),
(2118, 1, 103, '2021-07-11 14:05:44', 'Ingreso', 'A Lista de Reuniones'),
(2119, 1, 7, '2021-07-11 14:06:19', 'Ingreso', 'A Gestion de Parametros'),
(2120, 1, 146, '2021-07-11 14:06:24', 'Ingreso', 'A crear Reunion'),
(2121, 1, 7, '2021-07-11 14:06:45', 'Ingreso', 'A Gestion de Parametros'),
(2122, 1, 146, '2021-07-11 14:06:49', 'Ingreso', 'A crear Reunion'),
(2123, 1, 146, '2021-07-11 14:07:35', 'Ingreso', 'A crear Reunion'),
(2124, 1, 7, '2021-07-11 14:07:45', 'Ingreso', 'A Gestion de Parametros'),
(2125, 1, 146, '2021-07-11 14:07:47', 'Ingreso', 'A crear Reunion'),
(2126, 1, 7, '2021-07-11 14:08:15', 'Ingreso', 'A Gestion de Parametros'),
(2127, 1, 146, '2021-07-11 14:08:17', 'Ingreso', 'A crear Reunion'),
(2128, 1, 7, '2021-07-11 14:16:48', 'Ingreso', 'A Gestion de Parametros'),
(2129, 1, 146, '2021-07-11 14:16:50', 'Ingreso', 'A crear Reunion'),
(2130, 1, 7, '2021-07-11 14:16:52', 'Ingreso', 'A Gestion de Parametros'),
(2131, 1, 103, '2021-07-11 14:16:54', 'Ingreso', 'A Lista de Reuniones'),
(2132, 1, 103, '2021-07-11 14:17:17', 'Ingreso', 'A Lista de Reuniones'),
(2133, 1, 151, '2021-07-11 14:18:09', 'Ingreso', 'A crear Acuerdo'),
(2134, 1, 103, '2021-07-11 14:18:20', 'Ingreso', 'A Lista de Reuniones'),
(2135, 1, 103, '2021-07-11 14:19:09', 'Ingreso', 'A Lista de Reuniones'),
(2136, 1, 7, '2021-07-11 14:21:09', 'Ingreso', 'A Gestion de Parametros'),
(2137, 1, 7, '2021-07-11 14:21:27', 'Ingreso', 'A Gestion de Parametros'),
(2138, 1, 7, '2021-07-11 14:24:22', 'Ingreso', 'A Gestion de Parametros'),
(2139, 1, 7, '2021-07-11 14:24:27', 'Ingreso', 'A Gestion de Parametros'),
(2140, 1, 7, '2021-07-11 14:28:25', 'Ingreso', 'A Gestion de Parametros'),
(2141, 1, 7, '2021-07-11 14:28:35', 'Ingreso', 'A Gestion de Parametros'),
(2142, 1, 7, '2021-07-11 14:29:45', 'Ingreso', 'A Gestion de Parametros'),
(2143, 1, 51, '2021-07-11 14:29:51', 'Ingreso', 'A gestion docentes'),
(2144, 1, 103, '2021-07-11 14:30:58', 'Ingreso', 'A Lista de Reuniones'),
(2145, 1, 103, '2021-07-11 14:32:25', 'Ingreso', 'A Lista de Reuniones'),
(2146, 1, 103, '2021-07-11 14:32:28', 'Ingreso', 'A Lista de Reuniones'),
(2147, 1, 103, '2021-07-11 14:32:33', 'Ingreso', 'A Lista de Reuniones'),
(2148, 1, 7, '2021-07-11 14:33:01', 'Ingreso', 'A Gestion de Parametros'),
(2149, 1, 7, '2021-07-11 14:33:34', 'Ingreso', 'A Gestion de Parametros'),
(2150, 1, 7, '2021-07-11 14:34:53', 'Ingreso', 'A Gestion de Parametros'),
(2151, 1, 51, '2021-07-11 14:36:03', 'Ingreso', 'A gestion docentes'),
(2152, 1, 7, '2021-07-11 14:36:57', 'Ingreso', 'A Gestion de Parametros'),
(2153, 1, 7, '2021-07-11 14:37:05', 'Ingreso', 'A Gestion de Parametros'),
(2154, 1, 7, '2021-07-11 14:40:21', 'Ingreso', 'A Gestion de Parametros'),
(2155, 1, 7, '2021-07-11 14:40:34', 'Ingreso', 'A Gestion de Parametros'),
(2156, 1, 7, '2021-07-11 14:40:38', 'Ingreso', 'A Gestion de Parametros'),
(2157, 1, 7, '2021-07-11 14:41:07', 'Ingreso', 'A Gestion de Parametros'),
(2158, 1, 7, '2021-07-11 14:42:16', 'Ingreso', 'A Gestion de Parametros'),
(2159, 1, 7, '2021-07-11 14:42:19', 'Ingreso', 'A Gestion de Parametros'),
(2160, 1, 7, '2021-07-11 14:42:32', 'Ingreso', 'A Gestion de Parametros'),
(2161, 1, 7, '2021-07-11 14:43:10', 'Ingreso', 'A Gestion de Parametros'),
(2162, 1, 51, '2021-07-11 15:02:08', 'Ingreso', 'A gestion docentes'),
(2163, 1, 103, '2021-07-11 15:05:43', 'Ingreso', 'A Lista de Reuniones'),
(2164, 1, 51, '2021-07-11 15:12:11', 'Ingreso', 'A gestion docentes'),
(2165, 1, 50, '2021-07-11 15:12:25', 'INGRESO', 'A REGISTRAR DOCENTE.'),
(2166, 1, 51, '2021-07-11 15:12:28', 'Ingreso', 'A gestion docentes'),
(2167, 1, 51, '2021-07-11 15:13:09', 'Ingreso', 'A gestion docentes'),
(2168, 1, 103, '2021-07-11 15:16:15', 'Ingreso', 'A Lista de Reuniones'),
(2169, 1, 56, '2021-07-11 15:25:54', 'Ingreso', 'A Mantenimiento Jornada'),
(2170, 1, 103, '2021-07-11 15:26:11', 'Ingreso', 'A Lista de Reuniones'),
(2171, 1, 62, '2021-07-11 15:26:16', 'Ingreso', 'A Mantenimiento Estado Civil'),
(2172, 1, 57, '2021-07-11 15:26:33', 'Ingreso', 'A Mantenimiento Comisiones'),
(2173, 1, 89, '2021-07-11 15:26:54', 'Ingreso', 'A Mantenimiento Carrera'),
(2174, 1, 79, '2021-07-11 15:27:21', 'Ingreso', 'A Mantenimiento Municipio'),
(2175, 1, 34, '2021-07-11 15:27:54', 'INGRESO', 'A REVISION LISTA DE FINALIZACION PRACTICA'),
(2176, 1, 79, '2021-07-11 15:27:57', 'Ingreso', 'A Mantenimiento Municipio'),
(2177, 1, 35, '2021-07-11 15:28:05', 'INGRESO', 'A REVISION LISTA CAMBIO DE CARRERA'),
(2178, 1, 35, '2021-07-11 15:28:08', 'INGRESO', 'A REVISION LISTA CAMBIO DE CARRERA'),
(2179, 1, 17, '2021-07-11 15:28:13', 'INGRESO', 'A REGISTRAR EMPRESAS PARA PRACTICA.'),
(2180, 1, 18, '2021-07-11 15:28:18', 'INGRESO', 'A  HISTORIAL DE PRACTICA APROBADAS '),
(2181, 1, 53, '2021-07-11 15:28:31', 'Ingreso', 'A Reporte Carga Academica Docente'),
(2182, 1, 51, '2021-07-11 15:28:39', 'Ingreso', 'A gestion docentes'),
(2183, 1, 103, '2021-07-11 15:31:42', 'Ingreso', 'A Lista de Reuniones'),
(2184, 1, 146, '2021-07-11 16:04:24', 'Ingreso', 'A crear Reunion'),
(2185, 1, 103, '2021-07-11 16:10:09', 'Ingreso', 'A Lista de Reuniones'),
(2186, 1, 103, '2021-07-11 16:10:21', 'Ingreso', 'A Lista de Reuniones'),
(2187, 1, 103, '2021-07-11 16:12:22', 'Ingreso', 'A Lista de Reuniones'),
(2188, 1, 103, '2021-07-11 16:12:25', 'Ingreso', 'A Lista de Reuniones'),
(2189, 1, 103, '2021-07-11 16:12:47', 'Ingreso', 'A Lista de Reuniones'),
(2190, 1, 103, '2021-07-11 16:17:36', 'Ingreso', 'A Lista de Reuniones'),
(2191, 1, 103, '2021-07-11 16:32:11', 'Ingreso', 'A Lista de Reuniones'),
(2192, 1, 103, '2021-07-11 17:34:04', 'Ingreso', 'A Lista de Reuniones'),
(2193, 1, 103, '2021-07-11 17:34:31', 'Ingreso', 'A Lista de Reuniones'),
(2194, 1, 103, '2021-07-11 17:35:35', 'Ingreso', 'A Lista de Reuniones'),
(2195, 1, 7, '2021-07-11 17:35:46', 'Ingreso', 'A Gestion de Parametros'),
(2196, 1, 146, '2021-07-11 17:35:50', 'Ingreso', 'A crear Reunion'),
(2197, 1, 7, '2021-07-11 17:36:11', 'Ingreso', 'A Gestion de Parametros'),
(2198, 1, 103, '2021-07-11 17:36:30', 'Ingreso', 'A Lista de Reuniones'),
(2199, 1, 103, '2021-07-11 17:37:35', 'Ingreso', 'A Lista de Reuniones'),
(2200, 1, 103, '2021-07-11 17:37:52', 'Ingreso', 'A Lista de Reuniones'),
(2201, 1, 7, '2021-07-11 17:38:20', 'Ingreso', 'A Gestion de Parametros'),
(2202, 1, 146, '2021-07-11 17:38:31', 'Ingreso', 'A crear Reunion'),
(2203, 1, 7, '2021-07-11 17:38:45', 'Ingreso', 'A Gestion de Parametros'),
(2204, 1, 146, '2021-07-11 17:38:51', 'Ingreso', 'A crear Reunion'),
(2205, 1, 7, '2021-07-11 17:39:11', 'Ingreso', 'A Gestion de Parametros'),
(2206, 1, 146, '2021-07-11 17:39:17', 'Ingreso', 'A crear Reunion'),
(2207, 1, 7, '2021-07-11 17:40:08', 'Ingreso', 'A Gestion de Parametros'),
(2208, 1, 146, '2021-07-11 17:40:10', 'Ingreso', 'A crear Reunion'),
(2209, 1, 103, '2021-07-11 17:42:30', 'Ingreso', 'A Lista de Reuniones'),
(2210, 1, 103, '2021-07-11 17:43:08', 'Ingreso', 'A Lista de Reuniones'),
(2211, 1, 103, '2021-07-11 17:43:40', 'Ingreso', 'A Lista de Reuniones'),
(2212, 1, 7, '2021-07-11 17:44:17', 'Ingreso', 'A Gestion de Parametros'),
(2213, 1, 146, '2021-07-11 17:44:19', 'Ingreso', 'A crear Reunion'),
(2214, 1, 103, '2021-07-11 17:44:34', 'Ingreso', 'A Lista de Reuniones'),
(2215, 1, 151, '2021-07-11 17:44:54', 'Ingreso', 'A crear Acuerdo'),
(2216, 1, 103, '2021-07-11 17:45:03', 'Ingreso', 'A Lista de Reuniones'),
(2217, 1, 103, '2021-07-11 17:51:13', 'Ingreso', 'A Lista de Reuniones'),
(2218, 1, 7, '2021-07-11 17:51:58', 'Ingreso', 'A Gestion de Parametros'),
(2219, 1, 146, '2021-07-11 17:52:00', 'Ingreso', 'A crear Reunion'),
(2220, 1, 156, '2021-07-11 17:52:31', 'Ingreso', 'A Mantenimiento Estado Acta'),
(2221, 1, 157, '2021-07-11 17:52:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(2222, 1, 151, '2021-07-11 17:53:15', 'Ingreso', 'A crear Acuerdo'),
(2223, 1, 7, '2021-07-11 17:58:41', 'Ingreso', 'A Gestion de Parametros'),
(2224, 1, 146, '2021-07-11 17:58:44', 'Ingreso', 'A crear Reunion'),
(2225, 1, 7, '2021-07-11 17:58:55', 'Ingreso', 'A Gestion de Parametros'),
(2226, 1, 146, '2021-07-11 17:59:10', 'Ingreso', 'A crear Reunion'),
(2227, 1, 7, '2021-07-11 17:59:23', 'Ingreso', 'A Gestion de Parametros'),
(2228, 1, 146, '2021-07-11 18:00:13', 'Ingreso', 'A crear Reunion'),
(2229, 1, 7, '2021-07-11 18:00:49', 'Ingreso', 'A Gestion de Parametros'),
(2230, 1, 146, '2021-07-11 18:00:51', 'Ingreso', 'A crear Reunion'),
(2231, 1, 7, '2021-07-11 18:01:01', 'Ingreso', 'A Gestion de Parametros'),
(2232, 1, 146, '2021-07-11 18:01:03', 'Ingreso', 'A crear Reunion'),
(2233, 1, 7, '2021-07-11 18:01:27', 'Ingreso', 'A Gestion de Parametros'),
(2234, 1, 146, '2021-07-11 18:01:35', 'Ingreso', 'A crear Reunion'),
(2235, 1, 7, '2021-07-11 18:01:51', 'Ingreso', 'A Gestion de Parametros'),
(2236, 1, 7, '2021-07-11 18:21:02', 'Ingreso', 'A Gestion de Parametros'),
(2237, 1, 146, '2021-07-11 18:21:04', 'Ingreso', 'A crear Reunion'),
(2238, 1, 146, '2021-07-11 18:21:25', 'Ingreso', 'A crear Reunion'),
(2239, 1, 146, '2021-07-11 18:21:38', 'Ingreso', 'A crear Reunion'),
(2240, 1, 146, '2021-07-11 18:25:12', 'Ingreso', 'A crear Reunion'),
(2241, 1, 146, '2021-07-11 18:25:20', 'Ingreso', 'A crear Reunion'),
(2242, 1, 146, '2021-07-11 18:26:36', 'Ingreso', 'A crear Reunion'),
(2243, 1, 146, '2021-07-11 18:26:47', 'Ingreso', 'A crear Reunion'),
(2244, 1, 146, '2021-07-11 18:27:10', 'Ingreso', 'A crear Reunion'),
(2245, 1, 146, '2021-07-11 18:27:40', 'Ingreso', 'A crear Reunion'),
(2246, 1, 146, '2021-07-11 18:27:56', 'Ingreso', 'A crear Reunion'),
(2247, 1, 146, '2021-07-11 19:05:56', 'Ingreso', 'A crear Reunion'),
(2248, 1, 7, '2021-07-11 19:06:11', 'Ingreso', 'A Gestion de Parametros'),
(2249, 1, 146, '2021-07-11 19:07:19', 'Ingreso', 'A crear Reunion'),
(2250, 1, 7, '2021-07-11 19:07:31', 'Ingreso', 'A Gestion de Parametros'),
(2251, 1, 146, '2021-07-11 19:19:21', 'Ingreso', 'A crear Reunion'),
(2252, 1, 146, '2021-07-11 19:20:00', 'Ingreso', 'A crear Reunion'),
(2253, 1, 146, '2021-07-11 19:20:25', 'Ingreso', 'A crear Reunion'),
(2254, 1, 146, '2021-07-11 19:20:42', 'Ingreso', 'A crear Reunion'),
(2255, 1, 146, '2021-07-11 19:32:11', 'Ingreso', 'A crear Reunion'),
(2256, 1, 146, '2021-07-11 20:37:20', 'Ingreso', 'A crear Reunion'),
(2257, 1, 146, '2021-07-11 20:37:23', 'Ingreso', 'A crear Reunion'),
(2258, 1, 146, '2021-07-11 20:39:54', 'Ingreso', 'A crear Reunion'),
(2259, 1, 146, '2021-07-11 20:39:56', 'Ingreso', 'A crear Reunion'),
(2260, 1, 7, '2021-07-11 20:40:00', 'Ingreso', 'A Gestion de Parametros'),
(2261, 1, 146, '2021-07-11 20:40:03', 'Ingreso', 'A crear Reunion'),
(2262, 1, 146, '2021-07-11 20:40:15', 'Ingreso', 'A crear Reunion'),
(2263, 1, 7, '2021-07-11 20:40:17', 'Ingreso', 'A Gestion de Parametros'),
(2264, 1, 103, '2021-07-11 20:40:24', 'Ingreso', 'A Lista de Reuniones'),
(2265, 1, 7, '2021-07-11 20:41:05', 'Ingreso', 'A Gestion de Parametros'),
(2266, 1, 146, '2021-07-11 20:41:07', 'Ingreso', 'A crear Reunion'),
(2267, 1, 146, '2021-07-11 20:44:45', 'Ingreso', 'A crear Reunion'),
(2268, 1, 103, '2021-07-11 20:44:51', 'Ingreso', 'A Lista de Reuniones'),
(2269, 1, 103, '2021-07-11 20:44:55', 'Ingreso', 'A Lista de Reuniones'),
(2270, 1, 103, '2021-07-11 20:55:08', 'Ingreso', 'A Lista de Reuniones'),
(2271, 1, 7, '2021-07-11 20:55:15', 'Ingreso', 'A Gestion de Parametros'),
(2272, 1, 103, '2021-07-11 20:55:20', 'Ingreso', 'A Lista de Reuniones'),
(2273, 1, 103, '2021-07-11 20:55:33', 'Ingreso', 'A Lista de Reuniones'),
(2274, 1, 103, '2021-07-11 20:55:44', 'Ingreso', 'A Lista de Reuniones'),
(2275, 1, 103, '2021-07-11 20:55:54', 'Ingreso', 'A Lista de Reuniones'),
(2276, 1, 103, '2021-07-11 20:56:06', 'Ingreso', 'A Lista de Reuniones'),
(2277, 1, 7, '2021-07-11 20:56:13', 'Ingreso', 'A Gestion de Parametros'),
(2278, 1, 146, '2021-07-11 20:56:17', 'Ingreso', 'A crear Reunion'),
(2279, 1, 146, '2021-07-11 20:56:51', 'Ingreso', 'A crear Reunion'),
(2280, 1, 7, '2021-07-11 20:56:52', 'Ingreso', 'A Gestion de Parametros'),
(2281, 1, 103, '2021-07-11 20:56:56', 'Ingreso', 'A Lista de Reuniones'),
(2282, 1, 103, '2021-07-11 20:57:47', 'Ingreso', 'A Lista de Reuniones'),
(2283, 1, 103, '2021-07-11 21:07:21', 'Ingreso', 'A Lista de Reuniones'),
(2284, 1, 7, '2021-07-11 21:08:16', 'Ingreso', 'A Gestion de Parametros'),
(2285, 1, 146, '2021-07-11 21:08:19', 'Ingreso', 'A crear Reunion'),
(2286, 1, 146, '2021-07-11 21:08:46', 'Ingreso', 'A crear Reunion'),
(2287, 1, 7, '2021-07-11 21:08:47', 'Ingreso', 'A Gestion de Parametros'),
(2288, 1, 146, '2021-07-11 21:08:49', 'Ingreso', 'A crear Reunion'),
(2289, 1, 7, '2021-07-11 21:16:37', 'Ingreso', 'A Gestion de Parametros'),
(2290, 1, 146, '2021-07-11 21:16:39', 'Ingreso', 'A crear Reunion'),
(2291, 1, 146, '2021-07-11 21:16:58', 'Ingreso', 'A crear Reunion'),
(2292, 1, 7, '2021-07-11 21:17:00', 'Ingreso', 'A Gestion de Parametros'),
(2293, 1, 146, '2021-07-11 21:17:02', 'Ingreso', 'A crear Reunion'),
(2294, 1, 146, '2021-07-11 21:19:39', 'Ingreso', 'A crear Reunion'),
(2295, 1, 146, '2021-07-11 21:20:36', 'Ingreso', 'A crear Reunion'),
(2296, 1, 146, '2021-07-11 21:30:07', 'Ingreso', 'A crear Reunion'),
(2297, 1, 146, '2021-07-11 21:30:09', 'Ingreso', 'A crear Reunion'),
(2298, 1, 7, '2021-07-11 21:34:01', 'Ingreso', 'A Gestion de Parametros'),
(2299, 1, 7, '2021-07-11 21:35:07', 'Ingreso', 'A Gestion de Parametros'),
(2300, 1, 7, '2021-07-11 21:35:55', 'Ingreso', 'A Gestion de Parametros'),
(2301, 1, 146, '2021-07-11 21:35:57', 'Ingreso', 'A crear Reunion'),
(2302, 1, 146, '2021-07-11 21:46:45', 'Ingreso', 'A crear Reunion'),
(2303, 1, 7, '2021-07-11 21:47:01', 'Ingreso', 'A Gestion de Parametros'),
(2304, 1, 7, '2021-07-11 21:47:04', 'Ingreso', 'A Gestion de Parametros'),
(2305, 1, 7, '2021-07-11 21:49:11', 'Ingreso', 'A Gestion de Parametros'),
(2306, 1, 7, '2021-07-11 21:49:21', 'Ingreso', 'A Gestion de Parametros'),
(2307, 1, 7, '2021-07-11 21:50:13', 'Ingreso', 'A Gestion de Parametros'),
(2308, 1, 7, '2021-07-11 21:50:22', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.mp4'),
(2309, 1, 7, '2021-07-11 21:50:22', 'Ingreso', 'A Gestion de Parametros'),
(2310, 1, 7, '2021-07-11 21:50:29', 'Ingreso', 'A Gestion de Parametros'),
(2311, 1, 146, '2021-07-11 21:50:32', 'Ingreso', 'A crear Reunion'),
(2312, 1, 146, '2021-07-11 21:53:01', 'Ingreso', 'A crear Reunion'),
(2313, 1, 146, '2021-07-11 21:53:04', 'Ingreso', 'A crear Reunion'),
(2314, 1, 7, '2021-07-11 21:53:23', 'Ingreso', 'A Gestion de Parametros'),
(2315, 1, 7, '2021-07-11 21:53:26', 'Ingreso', 'A Gestion de Parametros'),
(2316, 1, 7, '2021-07-11 21:53:39', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.mp4, .3gp'),
(2317, 1, 7, '2021-07-11 21:53:39', 'Ingreso', 'A Gestion de Parametros'),
(2318, 1, 7, '2021-07-11 21:53:44', 'Ingreso', 'A Gestion de Parametros'),
(2319, 1, 146, '2021-07-11 21:53:45', 'Ingreso', 'A crear Reunion'),
(2320, 1, 7, '2021-07-11 22:10:04', 'Ingreso', 'A Gestion de Parametros'),
(2321, 1, 7, '2021-07-11 22:11:10', 'Ingreso', 'A Gestion de Parametros'),
(2322, 1, 146, '2021-07-11 22:11:14', 'Ingreso', 'A crear Reunion'),
(2323, 1, 7, '2021-07-11 22:11:34', 'Ingreso', 'A Gestion de Parametros'),
(2324, 1, 146, '2021-07-11 22:14:12', 'Ingreso', 'A crear Reunion'),
(2325, 1, 7, '2021-07-11 22:14:22', 'Ingreso', 'A Gestion de Parametros'),
(2326, 1, 103, '2021-07-11 22:15:14', 'Ingreso', 'A Lista de Reuniones'),
(2327, 1, 103, '2021-07-11 22:15:22', 'Ingreso', 'A Lista de Reuniones'),
(2328, 1, 103, '2021-07-11 22:15:29', 'Ingreso', 'A Lista de Reuniones'),
(2329, 1, 103, '2021-07-11 22:15:31', 'Ingreso', 'A Lista de Reuniones'),
(2330, 1, 103, '2021-07-11 22:15:34', 'Ingreso', 'A Lista de Reuniones'),
(2331, 1, 103, '2021-07-11 22:16:51', 'Ingreso', 'A Lista de Reuniones'),
(2332, 1, 103, '2021-07-11 22:17:22', 'Ingreso', 'A Lista de Reuniones'),
(2333, 1, 7, '2021-07-12 10:08:00', 'Ingreso', 'A Gestion de Parametros'),
(2334, 1, 146, '2021-07-12 10:09:50', 'Ingreso', 'A crear Reunion'),
(2335, 1, 146, '2021-07-12 10:16:04', 'Ingreso', 'A crear Reunion'),
(2336, 1, 7, '2021-07-12 10:17:58', 'Ingreso', 'A Gestion de Parametros'),
(2337, 1, 146, '2021-07-12 10:19:21', 'Ingreso', 'A crear Reunion'),
(2338, 1, 7, '2021-07-12 10:19:35', 'Ingreso', 'A Gestion de Parametros'),
(2339, 1, 146, '2021-07-12 10:24:36', 'Ingreso', 'A crear Reunion'),
(2340, 1, 7, '2021-07-12 10:25:22', 'Ingreso', 'A Gestion de Parametros'),
(2341, 1, 146, '2021-07-12 10:25:27', 'Ingreso', 'A crear Reunion'),
(2342, 1, 7, '2021-07-12 10:26:08', 'Ingreso', 'A Gestion de Parametros'),
(2343, 1, 146, '2021-07-12 10:26:11', 'Ingreso', 'A crear Reunion'),
(2344, 1, 7, '2021-07-12 10:26:24', 'Ingreso', 'A Gestion de Parametros'),
(2345, 1, 146, '2021-07-12 10:29:25', 'Ingreso', 'A crear Reunion'),
(2346, 1, 7, '2021-07-12 10:29:39', 'Ingreso', 'A Gestion de Parametros'),
(2347, 1, 146, '2021-07-12 10:37:01', 'Ingreso', 'A crear Reunion'),
(2348, 1, 7, '2021-07-12 10:37:43', 'Ingreso', 'A Gestion de Parametros'),
(2349, 1, 146, '2021-07-12 11:06:42', 'Ingreso', 'A crear Reunion'),
(2350, 1, 7, '2021-07-12 11:08:49', 'Ingreso', 'A Gestion de Parametros'),
(2351, 1, 146, '2021-07-12 11:08:55', 'Ingreso', 'A crear Reunion'),
(2352, 1, 146, '2021-07-12 11:12:33', 'Ingreso', 'A crear Reunion'),
(2353, 1, 146, '2021-07-12 11:15:28', 'Ingreso', 'A crear Reunion'),
(2354, 1, 146, '2021-07-12 11:16:24', 'Ingreso', 'A crear Reunion'),
(2355, 1, 146, '2021-07-12 11:16:51', 'Ingreso', 'A crear Reunion'),
(2356, 1, 7, '2021-07-12 11:17:09', 'Ingreso', 'A Gestion de Parametros'),
(2357, 1, 146, '2021-07-12 11:17:11', 'Ingreso', 'A crear Reunion'),
(2358, 1, 7, '2021-07-12 11:17:33', 'Ingreso', 'A Gestion de Parametros'),
(2359, 1, 146, '2021-07-12 11:17:35', 'Ingreso', 'A crear Reunion'),
(2360, 1, 7, '2021-07-12 11:17:39', 'Ingreso', 'A Gestion de Parametros'),
(2361, 1, 146, '2021-07-12 11:17:41', 'Ingreso', 'A crear Reunion'),
(2362, 1, 7, '2021-07-12 11:17:43', 'Ingreso', 'A Gestion de Parametros'),
(2363, 1, 146, '2021-07-12 11:17:46', 'Ingreso', 'A crear Reunion'),
(2364, 1, 146, '2021-07-12 11:20:47', 'Ingreso', 'A crear Reunion'),
(2365, 1, 146, '2021-07-12 11:20:53', 'Ingreso', 'A crear Reunion'),
(2366, 1, 146, '2021-07-12 11:21:43', 'Ingreso', 'A crear Reunion'),
(2367, 1, 146, '2021-07-12 11:21:58', 'Ingreso', 'A crear Reunion'),
(2368, 1, 146, '2021-07-12 11:22:15', 'Ingreso', 'A crear Reunion'),
(2369, 1, 146, '2021-07-12 11:22:18', 'Ingreso', 'A crear Reunion'),
(2370, 1, 146, '2021-07-12 11:22:52', 'Ingreso', 'A crear Reunion'),
(2371, 1, 146, '2021-07-12 11:23:23', 'Ingreso', 'A crear Reunion'),
(2372, 1, 146, '2021-07-12 11:23:27', 'Ingreso', 'A crear Reunion'),
(2373, 1, 146, '2021-07-12 11:23:30', 'Ingreso', 'A crear Reunion'),
(2374, 1, 7, '2021-07-12 11:23:32', 'Ingreso', 'A Gestion de Parametros'),
(2375, 1, 7, '2021-07-12 11:24:37', 'Ingreso', 'A Gestion de Parametros'),
(2376, 1, 146, '2021-07-12 11:24:42', 'Ingreso', 'A crear Reunion'),
(2377, 1, 146, '2021-07-12 11:24:45', 'Ingreso', 'A crear Reunion'),
(2378, 1, 7, '2021-07-12 11:24:48', 'Ingreso', 'A Gestion de Parametros'),
(2379, 1, 146, '2021-07-12 11:24:55', 'Ingreso', 'A crear Reunion'),
(2380, 1, 146, '2021-07-12 11:26:34', 'Ingreso', 'A crear Reunion'),
(2381, 1, 146, '2021-07-12 11:27:00', 'Ingreso', 'A crear Reunion'),
(2382, 1, 7, '2021-07-12 11:27:32', 'Ingreso', 'A Gestion de Parametros'),
(2383, 1, 146, '2021-07-12 11:27:35', 'Ingreso', 'A crear Reunion'),
(2384, 1, 146, '2021-07-12 11:27:43', 'Ingreso', 'A crear Reunion'),
(2385, 1, 146, '2021-07-12 11:28:48', 'Ingreso', 'A crear Reunion'),
(2386, 1, 146, '2021-07-12 11:28:52', 'Ingreso', 'A crear Reunion'),
(2387, 1, 7, '2021-07-12 11:29:29', 'Ingreso', 'A Gestion de Parametros'),
(2388, 1, 146, '2021-07-12 11:29:34', 'Ingreso', 'A crear Reunion'),
(2389, 1, 146, '2021-07-12 11:29:53', 'Ingreso', 'A crear Reunion'),
(2390, 1, 146, '2021-07-12 11:30:38', 'Ingreso', 'A crear Reunion'),
(2391, 1, 146, '2021-07-12 11:31:38', 'Ingreso', 'A crear Reunion'),
(2392, 1, 7, '2021-07-12 11:31:51', 'Ingreso', 'A Gestion de Parametros'),
(2393, 1, 7, '2021-07-12 11:32:03', 'Ingreso', 'A Gestion de Parametros'),
(2394, 1, 7, '2021-07-12 11:32:14', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALORvideo/*'),
(2395, 1, 7, '2021-07-12 11:32:14', 'Ingreso', 'A Gestion de Parametros'),
(2396, 1, 7, '2021-07-12 11:32:22', 'Ingreso', 'A Gestion de Parametros'),
(2397, 1, 146, '2021-07-12 11:32:25', 'Ingreso', 'A crear Reunion'),
(2398, 1, 7, '2021-07-12 11:32:50', 'Ingreso', 'A Gestion de Parametros'),
(2399, 1, 7, '2021-07-12 11:32:56', 'Ingreso', 'A Gestion de Parametros'),
(2400, 1, 7, '2021-07-12 11:33:33', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.docx, .doc, .ptt'),
(2401, 1, 7, '2021-07-12 11:33:33', 'Ingreso', 'A Gestion de Parametros'),
(2402, 1, 7, '2021-07-12 11:33:39', 'Ingreso', 'A Gestion de Parametros'),
(2403, 1, 146, '2021-07-12 11:33:42', 'Ingreso', 'A crear Reunion'),
(2404, 1, 7, '2021-07-12 11:34:40', 'Ingreso', 'A Gestion de Parametros'),
(2405, 1, 146, '2021-07-12 11:34:44', 'Ingreso', 'A crear Reunion'),
(2406, 1, 7, '2021-07-12 11:34:47', 'Ingreso', 'A Gestion de Parametros'),
(2407, 1, 146, '2021-07-12 11:34:49', 'Ingreso', 'A crear Reunion'),
(2408, 1, 146, '2021-07-12 11:45:17', 'Ingreso', 'A crear Reunion'),
(2409, 1, 146, '2021-07-12 11:59:51', 'Ingreso', 'A crear Reunion'),
(2410, 1, 146, '2021-07-12 12:00:06', 'Ingreso', 'A crear Reunion'),
(2411, 1, 146, '2021-07-12 12:00:32', 'Ingreso', 'A crear Reunion'),
(2412, 1, 146, '2021-07-12 12:00:44', 'Ingreso', 'A crear Reunion'),
(2413, 1, 146, '2021-07-12 12:02:20', 'Ingreso', 'A crear Reunion'),
(2414, 1, 146, '2021-07-12 12:02:36', 'Ingreso', 'A crear Reunion'),
(2415, 1, 146, '2021-07-12 12:14:44', 'Ingreso', 'A crear Reunion'),
(2416, 1, 7, '2021-07-12 12:15:00', 'Ingreso', 'A Gestion de Parametros'),
(2417, 1, 146, '2021-07-12 12:15:03', 'Ingreso', 'A crear Reunion'),
(2418, 1, 146, '2021-07-12 12:15:31', 'Ingreso', 'A crear Reunion'),
(2419, 1, 146, '2021-07-12 12:16:18', 'Ingreso', 'A crear Reunion'),
(2420, 1, 146, '2021-07-12 12:17:08', 'Ingreso', 'A crear Reunion'),
(2421, 1, 146, '2021-07-12 12:17:42', 'Ingreso', 'A crear Reunion'),
(2422, 1, 146, '2021-07-12 12:22:59', 'Ingreso', 'A crear Reunion'),
(2423, 1, 146, '2021-07-12 12:25:13', 'Ingreso', 'A crear Reunion'),
(2424, 1, 7, '2021-07-12 12:26:04', 'Ingreso', 'A Gestion de Parametros'),
(2425, 1, 146, '2021-07-12 12:26:06', 'Ingreso', 'A crear Reunion'),
(2426, 1, 7, '2021-07-12 12:26:21', 'Ingreso', 'A Gestion de Parametros'),
(2427, 1, 146, '2021-07-12 12:26:25', 'Ingreso', 'A crear Reunion'),
(2428, 1, 146, '2021-07-12 12:30:29', 'Ingreso', 'A crear Reunion'),
(2429, 1, 7, '2021-07-12 12:30:36', 'Ingreso', 'A Gestion de Parametros'),
(2430, 1, 146, '2021-07-12 12:30:56', 'Ingreso', 'A crear Reunion'),
(2431, 1, 146, '2021-07-12 12:32:57', 'Ingreso', 'A crear Reunion'),
(2432, 1, 146, '2021-07-12 12:47:09', 'Ingreso', 'A crear Reunion'),
(2433, 1, 7, '2021-07-12 12:47:18', 'Ingreso', 'A Gestion de Parametros'),
(2434, 1, 146, '2021-07-12 12:47:21', 'Ingreso', 'A crear Reunion'),
(2435, 1, 146, '2021-07-12 12:47:54', 'Ingreso', 'A crear Reunion'),
(2436, 1, 146, '2021-07-12 12:48:40', 'Ingreso', 'A crear Reunion'),
(2437, 1, 7, '2021-07-12 12:48:50', 'Ingreso', 'A Gestion de Parametros'),
(2438, 1, 146, '2021-07-12 12:48:53', 'Ingreso', 'A crear Reunion'),
(2439, 1, 7, '2021-07-12 12:53:11', 'Ingreso', 'A Gestion de Parametros'),
(2440, 1, 146, '2021-07-12 12:53:13', 'Ingreso', 'A crear Reunion'),
(2441, 1, 7, '2021-07-12 12:53:31', 'Ingreso', 'A Gestion de Parametros'),
(2442, 1, 146, '2021-07-12 12:53:33', 'Ingreso', 'A crear Reunion'),
(2443, 1, 146, '2021-07-12 12:54:16', 'Ingreso', 'A crear Reunion'),
(2444, 1, 146, '2021-07-12 12:59:33', 'Ingreso', 'A crear Reunion'),
(2445, 1, 146, '2021-07-12 13:26:06', 'Ingreso', 'A crear Reunion'),
(2446, 1, 146, '2021-07-12 13:26:13', 'Ingreso', 'A crear Reunion'),
(2447, 1, 7, '2021-07-12 13:26:43', 'Ingreso', 'A Gestion de Parametros'),
(2448, 1, 146, '2021-07-12 13:26:45', 'Ingreso', 'A crear Reunion'),
(2449, 1, 7, '2021-07-12 13:27:14', 'Ingreso', 'A Gestion de Parametros'),
(2450, 1, 146, '2021-07-12 13:27:17', 'Ingreso', 'A crear Reunion'),
(2451, 1, 146, '2021-07-12 13:28:02', 'Ingreso', 'A crear Reunion'),
(2452, 1, 7, '2021-07-12 13:28:32', 'Ingreso', 'A Gestion de Parametros'),
(2453, 1, 146, '2021-07-12 13:28:35', 'Ingreso', 'A crear Reunion'),
(2454, 1, 7, '2021-07-12 13:28:37', 'Ingreso', 'A Gestion de Parametros'),
(2455, 1, 146, '2021-07-12 13:28:52', 'Ingreso', 'A crear Reunion'),
(2456, 1, 146, '2021-07-12 13:29:07', 'Ingreso', 'A crear Reunion'),
(2457, 1, 103, '2021-07-12 13:29:51', 'Ingreso', 'A Lista de Reuniones'),
(2458, 1, 7, '2021-07-12 13:29:58', 'Ingreso', 'A Gestion de Parametros'),
(2459, 1, 146, '2021-07-12 13:30:13', 'Ingreso', 'A crear Reunion'),
(2460, 1, 7, '2021-07-12 13:30:19', 'Ingreso', 'A Gestion de Parametros'),
(2461, 1, 103, '2021-07-12 13:30:23', 'Ingreso', 'A Lista de Reuniones'),
(2462, 1, 103, '2021-07-12 13:30:31', 'Ingreso', 'A Lista de Reuniones'),
(2463, 1, 103, '2021-07-12 13:30:35', 'Ingreso', 'A Lista de Reuniones'),
(2464, 1, 103, '2021-07-12 13:30:58', 'Ingreso', 'A Lista de Reuniones'),
(2465, 1, 7, '2021-07-12 13:31:06', 'Ingreso', 'A Gestion de Parametros'),
(2466, 1, 146, '2021-07-12 13:31:11', 'Ingreso', 'A crear Reunion'),
(2467, 1, 7, '2021-07-12 13:31:21', 'Ingreso', 'A Gestion de Parametros'),
(2468, 1, 146, '2021-07-12 13:31:23', 'Ingreso', 'A crear Reunion'),
(2469, 1, 7, '2021-07-12 13:31:25', 'Ingreso', 'A Gestion de Parametros'),
(2470, 1, 103, '2021-07-12 13:31:28', 'Ingreso', 'A Lista de Reuniones'),
(2471, 1, 151, '2021-07-12 13:32:54', 'Ingreso', 'A crear Acuerdo'),
(2472, 1, 103, '2021-07-12 13:33:47', 'Ingreso', 'A Lista de Reuniones'),
(2473, 1, 103, '2021-07-12 13:34:56', 'Ingreso', 'A Lista de Reuniones'),
(2474, 1, 103, '2021-07-12 13:42:47', 'Ingreso', 'A Lista de Reuniones'),
(2475, 1, 103, '2021-07-12 14:13:36', 'Ingreso', 'A Lista de Reuniones'),
(2476, 1, 154, '2021-07-12 14:14:02', 'Ingreso', 'A Lista de Reuniones'),
(2477, 1, 154, '2021-07-12 14:14:15', 'Ingreso', 'A Lista de Reuniones'),
(2478, 1, 7, '2021-07-12 14:24:54', 'Ingreso', 'A Gestion de Parametros'),
(2479, 1, 146, '2021-07-12 14:24:57', 'Ingreso', 'A crear Reunion'),
(2480, 1, 146, '2021-07-12 14:26:25', 'Ingreso', 'A crear Reunion'),
(2481, 1, 146, '2021-07-12 14:26:36', 'Ingreso', 'A crear Reunion'),
(2482, 1, 146, '2021-07-12 14:26:57', 'Ingreso', 'A crear Reunion'),
(2483, 1, 7, '2021-07-12 14:27:13', 'Ingreso', 'A Gestion de Parametros'),
(2484, 1, 146, '2021-07-12 14:28:54', 'Ingreso', 'A crear Reunion'),
(2485, 1, 7, '2021-07-12 14:29:22', 'Ingreso', 'A Gestion de Parametros'),
(2486, 1, 146, '2021-07-12 14:29:25', 'Ingreso', 'A crear Reunion'),
(2487, 1, 7, '2021-07-12 14:31:51', 'Ingreso', 'A Gestion de Parametros'),
(2488, 1, 146, '2021-07-12 14:44:11', 'Ingreso', 'A crear Reunion'),
(2489, 1, 7, '2021-07-12 14:44:51', 'Ingreso', 'A Gestion de Parametros'),
(2490, 1, 146, '2021-07-12 14:44:54', 'Ingreso', 'A crear Reunion'),
(2491, 1, 7, '2021-07-12 14:45:16', 'Ingreso', 'A Gestion de Parametros'),
(2492, 1, 146, '2021-07-12 14:45:18', 'Ingreso', 'A crear Reunion'),
(2493, 1, 146, '2021-07-12 14:50:55', 'Ingreso', 'A crear Reunion'),
(2494, 1, 7, '2021-07-12 14:51:12', 'Ingreso', 'A Gestion de Parametros'),
(2495, 1, 146, '2021-07-12 14:51:49', 'Ingreso', 'A crear Reunion'),
(2496, 1, 7, '2021-07-12 14:52:40', 'Ingreso', 'A Gestion de Parametros'),
(2497, 1, 146, '2021-07-12 14:52:42', 'Ingreso', 'A crear Reunion'),
(2498, 1, 7, '2021-07-12 14:52:56', 'Ingreso', 'A Gestion de Parametros'),
(2499, 1, 146, '2021-07-12 14:53:39', 'Ingreso', 'A crear Reunion'),
(2500, 1, 7, '2021-07-12 14:54:30', 'Ingreso', 'A Gestion de Parametros'),
(2501, 1, 146, '2021-07-12 14:54:32', 'Ingreso', 'A crear Reunion'),
(2502, 1, 7, '2021-07-12 14:55:04', 'Ingreso', 'A Gestion de Parametros'),
(2503, 1, 146, '2021-07-12 14:55:06', 'Ingreso', 'A crear Reunion'),
(2504, 1, 146, '2021-07-12 14:55:20', 'Ingreso', 'A crear Reunion'),
(2505, 1, 146, '2021-07-12 14:55:32', 'Ingreso', 'A crear Reunion'),
(2506, 1, 146, '2021-07-12 14:57:45', 'Ingreso', 'A crear Reunion'),
(2507, 1, 146, '2021-07-12 14:57:49', 'Ingreso', 'A crear Reunion'),
(2508, 1, 7, '2021-07-12 14:57:52', 'Ingreso', 'A Gestion de Parametros'),
(2509, 1, 146, '2021-07-12 14:57:54', 'Ingreso', 'A crear Reunion'),
(2510, 1, 7, '2021-07-12 14:58:20', 'Ingreso', 'A Gestion de Parametros'),
(2511, 1, 146, '2021-07-12 14:58:23', 'Ingreso', 'A crear Reunion'),
(2512, 1, 7, '2021-07-12 14:58:42', 'Ingreso', 'A Gestion de Parametros'),
(2513, 1, 146, '2021-07-12 14:58:45', 'Ingreso', 'A crear Reunion'),
(2514, 1, 146, '2021-07-12 14:59:10', 'Ingreso', 'A crear Reunion'),
(2515, 1, 7, '2021-07-12 15:15:04', 'Ingreso', 'A Gestion de Parametros'),
(2516, 1, 146, '2021-07-12 15:15:05', 'Ingreso', 'A crear Reunion'),
(2517, 1, 7, '2021-07-12 15:15:25', 'Ingreso', 'A Gestion de Parametros'),
(2518, 1, 146, '2021-07-12 15:15:28', 'Ingreso', 'A crear Reunion'),
(2519, 1, 7, '2021-07-12 15:15:39', 'Ingreso', 'A Gestion de Parametros'),
(2520, 1, 146, '2021-07-12 15:15:41', 'Ingreso', 'A crear Reunion'),
(2521, 1, 7, '2021-07-12 15:16:48', 'Ingreso', 'A Gestion de Parametros'),
(2522, 1, 146, '2021-07-12 15:16:52', 'Ingreso', 'A crear Reunion'),
(2523, 1, 7, '2021-07-12 15:23:24', 'Ingreso', 'A Gestion de Parametros'),
(2524, 1, 146, '2021-07-12 15:23:27', 'Ingreso', 'A crear Reunion'),
(2525, 1, 7, '2021-07-12 15:25:30', 'Ingreso', 'A Gestion de Parametros'),
(2526, 1, 146, '2021-07-12 15:25:32', 'Ingreso', 'A crear Reunion'),
(2527, 1, 7, '2021-07-12 15:25:47', 'Ingreso', 'A Gestion de Parametros'),
(2528, 1, 146, '2021-07-12 15:25:49', 'Ingreso', 'A crear Reunion'),
(2529, 1, 146, '2021-07-12 15:26:24', 'Ingreso', 'A crear Reunion'),
(2530, 1, 7, '2021-07-12 15:26:36', 'Ingreso', 'A Gestion de Parametros'),
(2531, 1, 146, '2021-07-12 15:26:38', 'Ingreso', 'A crear Reunion'),
(2532, 1, 146, '2021-07-12 15:28:39', 'Ingreso', 'A crear Reunion'),
(2533, 1, 146, '2021-07-12 15:40:52', 'Ingreso', 'A crear Reunion'),
(2534, 1, 7, '2021-07-12 15:41:06', 'Ingreso', 'A Gestion de Parametros'),
(2535, 1, 146, '2021-07-12 15:41:09', 'Ingreso', 'A crear Reunion'),
(2536, 1, 146, '2021-07-12 15:41:21', 'Ingreso', 'A crear Reunion'),
(2537, 1, 7, '2021-07-12 15:41:37', 'Ingreso', 'A Gestion de Parametros'),
(2538, 1, 7, '2021-07-12 15:41:54', 'Ingreso', 'A Gestion de Parametros'),
(2539, 1, 146, '2021-07-12 15:41:57', 'Ingreso', 'A crear Reunion'),
(2540, 1, 7, '2021-07-12 15:42:09', 'Ingreso', 'A Gestion de Parametros'),
(2541, 1, 146, '2021-07-12 15:42:12', 'Ingreso', 'A crear Reunion'),
(2542, 1, 146, '2021-07-12 15:42:45', 'Ingreso', 'A crear Reunion'),
(2543, 1, 146, '2021-07-12 15:43:24', 'Ingreso', 'A crear Reunion'),
(2544, 1, 7, '2021-07-12 15:46:31', 'Ingreso', 'A Gestion de Parametros'),
(2545, 1, 146, '2021-07-12 15:55:53', 'Ingreso', 'A crear Reunion'),
(2546, 1, 146, '2021-07-12 15:56:30', 'Ingreso', 'A crear Reunion'),
(2547, 1, 146, '2021-07-12 15:59:45', 'Ingreso', 'A crear Reunion'),
(2548, 1, 7, '2021-07-12 15:59:56', 'Ingreso', 'A Gestion de Parametros'),
(2549, 1, 146, '2021-07-12 15:59:58', 'Ingreso', 'A crear Reunion'),
(2550, 1, 7, '2021-07-12 16:09:42', 'Ingreso', 'A Gestion de Parametros'),
(2551, 1, 146, '2021-07-12 16:09:44', 'Ingreso', 'A crear Reunion'),
(2552, 1, 146, '2021-07-12 16:09:47', 'Ingreso', 'A crear Reunion'),
(2553, 1, 146, '2021-07-12 16:10:06', 'Ingreso', 'A crear Reunion'),
(2554, 1, 7, '2021-07-12 16:10:18', 'Ingreso', 'A Gestion de Parametros'),
(2555, 1, 146, '2021-07-12 16:10:20', 'Ingreso', 'A crear Reunion'),
(2556, 1, 146, '2021-07-12 16:12:03', 'Ingreso', 'A crear Reunion'),
(2557, 1, 146, '2021-07-12 16:12:09', 'Ingreso', 'A crear Reunion'),
(2558, 1, 146, '2021-07-12 16:12:15', 'Ingreso', 'A crear Reunion'),
(2559, 1, 7, '2021-07-12 16:13:07', 'Ingreso', 'A Gestion de Parametros'),
(2560, 1, 7, '2021-07-12 16:15:10', 'Ingreso', 'A Gestion de Parametros'),
(2561, 1, 7, '2021-07-12 16:22:42', 'Ingreso', 'A Gestion de Parametros'),
(2562, 1, 146, '2021-07-12 16:22:43', 'Ingreso', 'A crear Reunion'),
(2563, 1, 7, '2021-07-12 16:31:08', 'Ingreso', 'A Gestion de Parametros'),
(2564, 1, 7, '2021-07-12 16:31:22', 'Ingreso', 'A Gestion de Parametros'),
(2565, 1, 7, '2021-07-12 16:41:21', 'Ingreso', 'A Gestion de Parametros'),
(2566, 1, 7, '2021-07-12 16:42:43', 'Ingreso', 'A Gestion de Parametros'),
(2567, 1, 7, '2021-07-12 16:42:59', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.docx, .doc, .ptt, .jpg'),
(2568, 1, 7, '2021-07-12 16:42:59', 'Ingreso', 'A Gestion de Parametros'),
(2569, 1, 7, '2021-07-12 16:43:02', 'Ingreso', 'A Gestion de Parametros'),
(2570, 1, 7, '2021-07-12 16:43:10', 'MODIFICO', 'LA DESCRIPCION 1MB = 1 MILLóN DE BYTES, CON EL VALOR500000'),
(2571, 1, 7, '2021-07-12 16:43:10', 'Ingreso', 'A Gestion de Parametros'),
(2572, 1, 7, '2021-07-12 16:43:25', 'Ingreso', 'A Gestion de Parametros'),
(2573, 1, 146, '2021-07-12 16:43:27', 'Ingreso', 'A crear Reunion'),
(2574, 1, 7, '2021-07-12 17:00:35', 'Ingreso', 'A Gestion de Parametros'),
(2575, 1, 7, '2021-07-12 17:00:44', 'Ingreso', 'A Gestion de Parametros'),
(2576, 1, 7, '2021-07-12 17:00:54', 'MODIFICO', 'LA DESCRIPCION 1MB = 1 MILLóN DE BYTES, CON EL VALOR20000000'),
(2577, 1, 7, '2021-07-12 17:00:54', 'Ingreso', 'A Gestion de Parametros'),
(2578, 1, 7, '2021-07-12 17:01:12', 'Ingreso', 'A Gestion de Parametros'),
(2579, 1, 7, '2021-07-12 17:01:13', 'Ingreso', 'A Gestion de Parametros'),
(2580, 1, 146, '2021-07-12 17:01:14', 'Ingreso', 'A crear Reunion'),
(2581, 1, 7, '2021-07-12 17:01:54', 'Ingreso', 'A Gestion de Parametros'),
(2582, 1, 7, '2021-07-12 17:02:15', 'Ingreso', 'A Gestion de Parametros'),
(2583, 1, 7, '2021-07-12 17:02:26', 'MODIFICO', 'LA DESCRIPCION 1MB = 1 MILLóN DE BYTES, CON EL VALOR200000000'),
(2584, 1, 7, '2021-07-12 17:02:26', 'Ingreso', 'A Gestion de Parametros'),
(2585, 1, 7, '2021-07-12 17:02:29', 'Ingreso', 'A Gestion de Parametros'),
(2586, 1, 7, '2021-07-12 17:02:29', 'Ingreso', 'A Gestion de Parametros'),
(2587, 1, 146, '2021-07-12 17:02:31', 'Ingreso', 'A crear Reunion'),
(2588, 1, 7, '2021-07-12 17:03:23', 'Ingreso', 'A Gestion de Parametros'),
(2589, 1, 7, '2021-07-12 17:03:26', 'Ingreso', 'A Gestion de Parametros'),
(2590, 1, 7, '2021-07-12 17:04:21', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALORapplication/*, video/*'),
(2591, 1, 7, '2021-07-12 17:04:21', 'Ingreso', 'A Gestion de Parametros'),
(2592, 1, 7, '2021-07-12 17:04:23', 'Ingreso', 'A Gestion de Parametros'),
(2593, 1, 7, '2021-07-12 17:04:24', 'Ingreso', 'A Gestion de Parametros'),
(2594, 1, 146, '2021-07-12 17:04:26', 'Ingreso', 'A crear Reunion'),
(2595, 1, 7, '2021-07-12 17:05:23', 'Ingreso', 'A Gestion de Parametros'),
(2596, 1, 7, '2021-07-12 17:05:25', 'Ingreso', 'A Gestion de Parametros'),
(2597, 1, 7, '2021-07-12 17:05:36', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALORapplication/*, video/*'),
(2598, 1, 7, '2021-07-12 17:05:36', 'Ingreso', 'A Gestion de Parametros'),
(2599, 1, 7, '2021-07-12 17:05:38', 'Ingreso', 'A Gestion de Parametros'),
(2600, 1, 7, '2021-07-12 17:05:41', 'Ingreso', 'A Gestion de Parametros'),
(2601, 1, 146, '2021-07-12 17:05:42', 'Ingreso', 'A crear Reunion'),
(2602, 1, 7, '2021-07-12 17:07:43', 'Ingreso', 'A Gestion de Parametros'),
(2603, 1, 7, '2021-07-12 17:07:43', 'Ingreso', 'A Gestion de Parametros'),
(2604, 1, 7, '2021-07-12 17:07:47', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALORapplication/json'),
(2605, 1, 7, '2021-07-12 17:07:48', 'Ingreso', 'A Gestion de Parametros'),
(2606, 1, 7, '2021-07-12 17:07:53', 'Ingreso', 'A Gestion de Parametros'),
(2607, 1, 7, '2021-07-12 17:07:54', 'Ingreso', 'A Gestion de Parametros'),
(2608, 1, 146, '2021-07-12 17:07:55', 'Ingreso', 'A crear Reunion'),
(2609, 1, 7, '2021-07-12 17:08:13', 'Ingreso', 'A Gestion de Parametros'),
(2610, 1, 7, '2021-07-12 17:08:16', 'Ingreso', 'A Gestion de Parametros'),
(2611, 1, 7, '2021-07-12 17:08:18', 'Ingreso', 'A Gestion de Parametros'),
(2612, 1, 7, '2021-07-12 17:08:22', 'Ingreso', 'A Gestion de Parametros'),
(2613, 1, 7, '2021-07-12 17:08:30', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALORapplication/*'),
(2614, 1, 7, '2021-07-12 17:08:30', 'Ingreso', 'A Gestion de Parametros'),
(2615, 1, 7, '2021-07-12 17:08:32', 'Ingreso', 'A Gestion de Parametros'),
(2616, 1, 7, '2021-07-12 17:08:33', 'Ingreso', 'A Gestion de Parametros'),
(2617, 1, 7, '2021-07-12 17:08:34', 'Ingreso', 'A Gestion de Parametros'),
(2618, 1, 7, '2021-07-12 17:08:35', 'Ingreso', 'A Gestion de Parametros'),
(2619, 1, 7, '2021-07-12 17:08:36', 'Ingreso', 'A Gestion de Parametros'),
(2620, 1, 7, '2021-07-12 17:08:38', 'Ingreso', 'A Gestion de Parametros'),
(2621, 1, 146, '2021-07-12 17:08:39', 'Ingreso', 'A crear Reunion'),
(2622, 1, 7, '2021-07-12 17:09:47', 'Ingreso', 'A Gestion de Parametros'),
(2623, 1, 7, '2021-07-12 17:09:50', 'Ingreso', 'A Gestion de Parametros'),
(2624, 1, 7, '2021-07-12 17:09:53', 'Ingreso', 'A Gestion de Parametros'),
(2625, 1, 7, '2021-07-12 17:10:14', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALORapplication/*, .docx,.doc '),
(2626, 1, 7, '2021-07-12 17:10:14', 'Ingreso', 'A Gestion de Parametros'),
(2627, 1, 7, '2021-07-12 17:10:17', 'Ingreso', 'A Gestion de Parametros'),
(2628, 1, 7, '2021-07-12 17:10:18', 'Ingreso', 'A Gestion de Parametros'),
(2629, 1, 7, '2021-07-12 17:10:20', 'Ingreso', 'A Gestion de Parametros'),
(2630, 1, 146, '2021-07-12 17:10:23', 'Ingreso', 'A crear Reunion'),
(2631, 1, 7, '2021-07-12 17:12:56', 'Ingreso', 'A Gestion de Parametros'),
(2632, 1, 7, '2021-07-12 17:12:59', 'Ingreso', 'A Gestion de Parametros'),
(2633, 1, 7, '2021-07-12 17:14:02', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.docx,video/*,image/*,.doc'),
(2634, 1, 7, '2021-07-12 17:14:02', 'Ingreso', 'A Gestion de Parametros'),
(2635, 1, 7, '2021-07-12 17:14:20', 'Ingreso', 'A Gestion de Parametros'),
(2636, 1, 146, '2021-07-12 17:14:22', 'Ingreso', 'A crear Reunion'),
(2637, 1, 146, '2021-07-12 17:17:58', 'Ingreso', 'A crear Reunion'),
(2638, 1, 7, '2021-07-12 17:18:38', 'Ingreso', 'A Gestion de Parametros'),
(2639, 1, 7, '2021-07-12 17:18:40', 'Ingreso', 'A Gestion de Parametros'),
(2640, 1, 7, '2021-07-12 17:19:16', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.docx,.doc,.mpp,.pttx,.ptt,.zip'),
(2641, 1, 7, '2021-07-12 17:19:16', 'Ingreso', 'A Gestion de Parametros'),
(2642, 1, 7, '2021-07-12 17:19:19', 'Ingreso', 'A Gestion de Parametros'),
(2643, 1, 7, '2021-07-12 17:19:20', 'Ingreso', 'A Gestion de Parametros'),
(2644, 1, 146, '2021-07-12 17:19:22', 'Ingreso', 'A crear Reunion'),
(2645, 1, 7, '2021-07-12 19:16:50', 'Ingreso', 'A Gestion de Parametros'),
(2646, 1, 146, '2021-07-12 19:16:59', 'Ingreso', 'A crear Reunion'),
(2647, 1, 103, '2021-07-12 19:18:26', 'Ingreso', 'A Lista de Reuniones'),
(2648, 1, 151, '2021-07-12 19:20:10', 'Ingreso', 'A crear Acuerdo'),
(2649, 1, 103, '2021-07-12 19:20:19', 'Ingreso', 'A Lista de Reuniones'),
(2650, 1, 103, '2021-07-12 19:20:56', 'Ingreso', 'A Lista de Reuniones'),
(2651, 1, 7, '2021-07-12 19:22:02', 'Ingreso', 'A Gestion de Parametros'),
(2652, 1, 146, '2021-07-12 19:22:03', 'Ingreso', 'A crear Reunion'),
(2653, 1, 103, '2021-07-12 19:22:51', 'Ingreso', 'A Lista de Reuniones'),
(2654, 1, 7, '2021-07-12 19:24:53', 'Ingreso', 'A Gestion de Parametros'),
(2655, 1, 146, '2021-07-12 19:24:56', 'Ingreso', 'A crear Reunion'),
(2656, 1, 146, '2021-07-12 19:26:31', 'Ingreso', 'A crear Reunion'),
(2657, 1, 146, '2021-07-12 19:26:46', 'Ingreso', 'A crear Reunion'),
(2658, 1, 146, '2021-07-12 19:26:56', 'Ingreso', 'A crear Reunion'),
(2659, 1, 146, '2021-07-12 19:27:09', 'Ingreso', 'A crear Reunion'),
(2660, 1, 103, '2021-07-12 19:27:38', 'Ingreso', 'A Lista de Reuniones'),
(2661, 1, 7, '2021-07-12 19:29:05', 'Ingreso', 'A Gestion de Parametros'),
(2662, 1, 146, '2021-07-12 19:29:07', 'Ingreso', 'A crear Reunion'),
(2663, 1, 7, '2021-07-12 19:29:54', 'Ingreso', 'A Gestion de Parametros'),
(2664, 1, 146, '2021-07-12 19:29:58', 'Ingreso', 'A crear Reunion'),
(2665, 1, 7, '2021-07-12 19:30:15', 'Ingreso', 'A Gestion de Parametros'),
(2666, 1, 146, '2021-07-12 19:30:17', 'Ingreso', 'A crear Reunion'),
(2667, 1, 7, '2021-07-12 19:30:19', 'Ingreso', 'A Gestion de Parametros'),
(2668, 1, 7, '2021-07-12 19:30:25', 'Ingreso', 'A Gestion de Parametros'),
(2669, 1, 146, '2021-07-12 19:30:28', 'Ingreso', 'A crear Reunion'),
(2670, 1, 7, '2021-07-12 19:31:19', 'Ingreso', 'A Gestion de Parametros'),
(2671, 1, 146, '2021-07-12 19:31:21', 'Ingreso', 'A crear Reunion'),
(2672, 1, 7, '2021-07-12 19:31:42', 'Ingreso', 'A Gestion de Parametros'),
(2673, 1, 146, '2021-07-12 19:31:43', 'Ingreso', 'A crear Reunion'),
(2674, 1, 7, '2021-07-12 19:31:46', 'Ingreso', 'A Gestion de Parametros'),
(2675, 1, 103, '2021-07-12 19:31:50', 'Ingreso', 'A Lista de Reuniones'),
(2676, 1, 103, '2021-07-12 19:32:01', 'Ingreso', 'A Lista de Reuniones'),
(2677, 1, 7, '2021-07-12 19:33:11', 'Ingreso', 'A Gestion de Parametros'),
(2678, 1, 146, '2021-07-12 19:33:13', 'Ingreso', 'A crear Reunion'),
(2679, 1, 7, '2021-07-12 19:33:18', 'Ingreso', 'A Gestion de Parametros'),
(2680, 1, 146, '2021-07-12 19:33:24', 'Ingreso', 'A crear Reunion'),
(2681, 1, 7, '2021-07-12 19:33:34', 'Ingreso', 'A Gestion de Parametros'),
(2682, 1, 146, '2021-07-12 19:33:51', 'Ingreso', 'A crear Reunion'),
(2683, 1, 7, '2021-07-12 19:34:00', 'Ingreso', 'A Gestion de Parametros'),
(2684, 1, 146, '2021-07-12 19:34:02', 'Ingreso', 'A crear Reunion'),
(2685, 1, 7, '2021-07-12 19:34:05', 'Ingreso', 'A Gestion de Parametros'),
(2686, 1, 146, '2021-07-12 19:34:08', 'Ingreso', 'A crear Reunion'),
(2687, 1, 7, '2021-07-12 19:34:23', 'Ingreso', 'A Gestion de Parametros'),
(2688, 1, 146, '2021-07-12 19:34:24', 'Ingreso', 'A crear Reunion'),
(2689, 1, 151, '2021-07-12 19:34:53', 'Ingreso', 'A crear Acuerdo'),
(2690, 1, 151, '2021-07-12 19:35:04', 'Ingreso', 'A crear Acuerdo'),
(2691, 1, 103, '2021-07-12 19:36:01', 'Ingreso', 'A Lista de Reuniones'),
(2692, 1, 103, '2021-07-12 19:36:13', 'Ingreso', 'A Lista de Reuniones'),
(2693, 1, 151, '2021-07-12 19:37:01', 'Ingreso', 'A crear Acuerdo'),
(2694, 1, 7, '2021-07-12 19:37:45', 'Ingreso', 'A Gestion de Parametros'),
(2695, 1, 146, '2021-07-12 19:37:48', 'Ingreso', 'A crear Reunion'),
(2696, 1, 146, '2021-07-12 19:38:31', 'Ingreso', 'A crear Reunion'),
(2697, 1, 103, '2021-07-12 19:39:36', 'Ingreso', 'A Lista de Reuniones'),
(2698, 1, 151, '2021-07-12 19:39:42', 'Ingreso', 'A crear Acuerdo'),
(2699, 1, 146, '2021-07-12 19:41:35', 'Ingreso', 'A crear Reunion'),
(2700, 1, 146, '2021-07-12 19:44:02', 'Ingreso', 'A crear Reunion'),
(2701, 1, 151, '2021-07-12 19:44:33', 'Ingreso', 'A crear Acuerdo'),
(2702, 1, 7, '2021-07-13 12:24:28', 'Ingreso', 'A Gestion de Parametros'),
(2703, 1, 146, '2021-07-13 12:24:31', 'Ingreso', 'A crear Reunion'),
(2704, 1, 7, '2021-07-13 12:25:00', 'Ingreso', 'A Gestion de Parametros'),
(2705, 1, 151, '2021-07-13 12:25:07', 'Ingreso', 'A crear Acuerdo'),
(2706, 1, 151, '2021-07-13 12:33:19', 'Ingreso', 'A crear Acuerdo'),
(2707, 1, 151, '2021-07-13 12:57:59', 'Ingreso', 'A crear Acuerdo'),
(2708, 1, 7, '2021-07-13 13:01:20', 'Ingreso', 'A Gestion de Parametros'),
(2709, 1, 7, '2021-07-13 13:01:36', 'Ingreso', 'A Gestion de Parametros'),
(2710, 1, 7, '2021-07-13 13:02:02', 'Ingreso', 'A Gestion de Parametros'),
(2711, 1, 7, '2021-07-13 13:02:19', 'Ingreso', 'A Gestion de Parametros'),
(2712, 1, 7, '2021-07-13 13:02:43', 'Ingreso', 'A Gestion de Parametros'),
(2713, 1, 7, '2021-07-13 13:06:27', 'Ingreso', 'A Gestion de Parametros'),
(2714, 1, 7, '2021-07-13 13:06:52', 'Ingreso', 'A Gestion de Parametros'),
(2715, 1, 7, '2021-07-13 13:07:46', 'Ingreso', 'A Gestion de Parametros'),
(2716, 1, 7, '2021-07-13 13:08:03', 'Ingreso', 'A Gestion de Parametros'),
(2717, 1, 7, '2021-07-13 13:08:16', 'Ingreso', 'A Gestion de Parametros'),
(2718, 1, 7, '2021-07-13 13:09:41', 'Ingreso', 'A Gestion de Parametros'),
(2719, 1, 7, '2021-07-13 13:11:27', 'Ingreso', 'A Gestion de Parametros'),
(2720, 1, 7, '2021-07-13 13:11:54', 'Ingreso', 'A Gestion de Parametros'),
(2721, 1, 7, '2021-07-13 13:12:20', 'Ingreso', 'A Gestion de Parametros'),
(2722, 1, 7, '2021-07-13 13:12:51', 'Ingreso', 'A Gestion de Parametros'),
(2723, 1, 7, '2021-07-13 13:13:39', 'Ingreso', 'A Gestion de Parametros'),
(2724, 1, 7, '2021-07-13 13:14:23', 'Ingreso', 'A Gestion de Parametros'),
(2725, 1, 7, '2021-07-13 13:14:46', 'Ingreso', 'A Gestion de Parametros'),
(2726, 1, 7, '2021-07-13 13:15:52', 'Ingreso', 'A Gestion de Parametros'),
(2727, 1, 7, '2021-07-13 13:16:21', 'Ingreso', 'A Gestion de Parametros'),
(2728, 1, 7, '2021-07-13 13:16:46', 'Ingreso', 'A Gestion de Parametros'),
(2729, 1, 146, '2021-07-13 13:16:52', 'Ingreso', 'A crear Reunion'),
(2730, 1, 7, '2021-07-13 13:16:57', 'Ingreso', 'A Gestion de Parametros'),
(2731, 1, 7, '2021-07-13 13:18:14', 'Ingreso', 'A Gestion de Parametros'),
(2732, 1, 7, '2021-07-13 13:18:32', 'Ingreso', 'A Gestion de Parametros'),
(2733, 1, 7, '2021-07-13 13:18:50', 'Ingreso', 'A Gestion de Parametros'),
(2734, 1, 7, '2021-07-13 13:19:07', 'Ingreso', 'A Gestion de Parametros'),
(2735, 1, 7, '2021-07-13 13:19:22', 'Ingreso', 'A Gestion de Parametros'),
(2736, 1, 7, '2021-07-13 13:19:40', 'Ingreso', 'A Gestion de Parametros'),
(2737, 1, 146, '2021-07-13 13:20:01', 'Ingreso', 'A crear Reunion'),
(2738, 1, 7, '2021-07-13 13:20:05', 'Ingreso', 'A Gestion de Parametros'),
(2739, 1, 7, '2021-07-13 13:20:28', 'Ingreso', 'A Gestion de Parametros'),
(2740, 1, 146, '2021-07-13 13:21:17', 'Ingreso', 'A crear Reunion'),
(2741, 1, 7, '2021-07-13 13:21:44', 'Ingreso', 'A Gestion de Parametros'),
(2742, 1, 146, '2021-07-13 13:22:08', 'Ingreso', 'A crear Reunion'),
(2743, 1, 7, '2021-07-13 13:22:12', 'Ingreso', 'A Gestion de Parametros'),
(2744, 1, 146, '2021-07-13 13:22:14', 'Ingreso', 'A crear Reunion'),
(2745, 1, 7, '2021-07-13 13:22:19', 'Ingreso', 'A Gestion de Parametros'),
(2746, 1, 146, '2021-07-13 13:23:04', 'Ingreso', 'A crear Reunion'),
(2747, 1, 7, '2021-07-13 13:23:12', 'Ingreso', 'A Gestion de Parametros'),
(2748, 1, 146, '2021-07-13 13:23:18', 'Ingreso', 'A crear Reunion'),
(2749, 1, 7, '2021-07-13 13:23:38', 'Ingreso', 'A Gestion de Parametros'),
(2750, 1, 146, '2021-07-13 13:23:48', 'Ingreso', 'A crear Reunion'),
(2751, 1, 7, '2021-07-13 13:23:53', 'Ingreso', 'A Gestion de Parametros'),
(2752, 1, 7, '2021-07-13 13:41:50', 'Ingreso', 'A Gestion de Parametros'),
(2753, 1, 146, '2021-07-13 13:41:59', 'Ingreso', 'A crear Reunion'),
(2754, 1, 7, '2021-07-13 13:42:24', 'Ingreso', 'A Gestion de Parametros'),
(2755, 1, 146, '2021-07-13 13:42:27', 'Ingreso', 'A crear Reunion'),
(2756, 1, 7, '2021-07-13 13:42:28', 'Ingreso', 'A Gestion de Parametros'),
(2757, 1, 146, '2021-07-13 13:42:31', 'Ingreso', 'A crear Reunion'),
(2758, 1, 7, '2021-07-13 13:42:34', 'Ingreso', 'A Gestion de Parametros'),
(2759, 1, 7, '2021-07-13 13:44:36', 'Ingreso', 'A Gestion de Parametros'),
(2760, 1, 7, '2021-07-13 13:45:08', 'Ingreso', 'A Gestion de Parametros'),
(2761, 1, 146, '2021-07-13 13:45:12', 'Ingreso', 'A crear Reunion'),
(2762, 1, 7, '2021-07-13 13:45:24', 'Ingreso', 'A Gestion de Parametros'),
(2763, 1, 146, '2021-07-13 13:45:31', 'Ingreso', 'A crear Reunion'),
(2764, 1, 7, '2021-07-13 13:45:33', 'Ingreso', 'A Gestion de Parametros'),
(2765, 1, 146, '2021-07-13 14:13:53', 'Ingreso', 'A crear Reunion'),
(2766, 1, 146, '2021-07-13 14:18:50', 'Ingreso', 'A crear Reunion'),
(2767, 1, 146, '2021-07-13 14:23:54', 'Ingreso', 'A crear Reunion'),
(2768, 1, 146, '2021-07-13 14:25:34', 'Ingreso', 'A crear Reunion'),
(2769, 1, 146, '2021-07-13 14:26:42', 'Ingreso', 'A crear Reunion'),
(2770, 1, 146, '2021-07-13 14:44:26', 'Ingreso', 'A crear Reunion'),
(2771, 1, 146, '2021-07-13 14:45:21', 'Ingreso', 'A crear Reunion'),
(2772, 1, 146, '2021-07-13 14:46:59', 'Ingreso', 'A crear Reunion'),
(2773, 1, 146, '2021-07-13 14:47:22', 'Ingreso', 'A crear Reunion'),
(2774, 1, 146, '2021-07-13 14:48:30', 'Ingreso', 'A crear Reunion'),
(2775, 1, 146, '2021-07-13 14:49:00', 'Ingreso', 'A crear Reunion'),
(2776, 1, 158, '2021-07-13 14:54:17', 'Ingreso', 'A Mantenimiento Estado Reunion');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(2777, 1, 158, '2021-07-13 14:54:25', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2778, 1, 158, '2021-07-13 14:54:32', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2779, 1, 158, '2021-07-13 14:55:18', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2780, 1, 158, '2021-07-13 14:55:20', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2781, 1, 157, '2021-07-13 14:55:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(2782, 1, 158, '2021-07-13 14:56:16', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2783, 1, 158, '2021-07-13 14:56:30', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2784, 1, 158, '2021-07-13 14:56:34', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2785, 1, 158, '2021-07-13 14:56:42', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2786, 1, 158, '2021-07-13 15:01:32', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(2787, 1, 156, '2021-07-13 15:01:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(2788, 1, 157, '2021-07-13 15:01:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(2789, 1, 146, '2021-07-13 15:13:48', 'Ingreso', 'A crear Reunion'),
(2790, 1, 146, '2021-07-13 15:14:08', 'Ingreso', 'A crear Reunion'),
(2791, 1, 146, '2021-07-13 15:14:16', 'Ingreso', 'A crear Reunion'),
(2792, 1, 7, '2021-07-13 17:22:08', 'Ingreso', 'A Gestion de Parametros'),
(2793, 1, 7, '2021-07-13 17:22:13', 'Ingreso', 'A Gestion de Parametros'),
(2794, 1, 7, '2021-07-13 17:22:25', 'MODIFICO', 'LA DESCRIPCION 1MB = 1 MILLóN DE BYTES, CON EL VALOR2000000'),
(2795, 1, 7, '2021-07-13 17:22:25', 'Ingreso', 'A Gestion de Parametros'),
(2796, 1, 7, '2021-07-13 17:22:40', 'Ingreso', 'A Gestion de Parametros'),
(2797, 1, 146, '2021-07-13 17:22:43', 'Ingreso', 'A crear Reunion'),
(2798, 1, 7, '2021-07-13 17:23:20', 'Ingreso', 'A Gestion de Parametros'),
(2799, 1, 7, '2021-07-13 17:23:23', 'Ingreso', 'A Gestion de Parametros'),
(2800, 1, 7, '2021-07-13 17:24:42', 'Ingreso', 'A Gestion de Parametros'),
(2801, 1, 7, '2021-07-13 17:27:07', 'Ingreso', 'A Gestion de Parametros'),
(2802, 1, 146, '2021-07-13 17:27:11', 'Ingreso', 'A crear Reunion'),
(2803, 1, 7, '2021-07-13 17:27:55', 'Ingreso', 'A Gestion de Parametros'),
(2804, 1, 7, '2021-07-13 17:27:57', 'Ingreso', 'A Gestion de Parametros'),
(2805, 1, 103, '2021-07-13 17:27:59', 'Ingreso', 'A Lista de Reuniones'),
(2806, 1, 103, '2021-07-13 17:28:37', 'Ingreso', 'A Lista de Reuniones'),
(2807, 1, 7, '2021-07-13 17:34:13', 'Ingreso', 'A Gestion de Parametros'),
(2808, 1, 146, '2021-07-13 17:34:16', 'Ingreso', 'A crear Reunion'),
(2809, 1, 103, '2021-07-13 17:34:21', 'Ingreso', 'A Lista de Reuniones'),
(2810, 1, 7, '2021-07-13 17:34:29', 'Ingreso', 'A Gestion de Parametros'),
(2811, 1, 146, '2021-07-13 17:34:33', 'Ingreso', 'A crear Reunion'),
(2812, 1, 7, '2021-07-13 17:34:48', 'Ingreso', 'A Gestion de Parametros'),
(2813, 1, 146, '2021-07-13 17:34:58', 'Ingreso', 'A crear Reunion'),
(2814, 1, 7, '2021-07-13 17:35:23', 'Ingreso', 'A Gestion de Parametros'),
(2815, 1, 103, '2021-07-13 17:37:01', 'Ingreso', 'A Lista de Reuniones'),
(2816, 1, 103, '2021-07-13 17:37:58', 'Ingreso', 'A Lista de Reuniones'),
(2817, 1, 7, '2021-07-13 18:29:42', 'Ingreso', 'A Gestion de Parametros'),
(2818, 1, 146, '2021-07-13 18:35:45', 'Ingreso', 'A crear Reunion'),
(2819, 1, 146, '2021-07-13 18:46:41', 'Ingreso', 'A crear Reunion'),
(2820, 1, 146, '2021-07-13 18:50:23', 'Ingreso', 'A crear Reunion'),
(2821, 1, 103, '2021-07-13 18:53:22', 'Ingreso', 'A Lista de Reuniones'),
(2822, 1, 7, '2021-07-13 18:53:28', 'Ingreso', 'A Gestion de Parametros'),
(2823, 1, 146, '2021-07-13 18:53:55', 'Ingreso', 'A crear Reunion'),
(2824, 1, 7, '2021-07-13 18:56:36', 'Ingreso', 'A Gestion de Parametros'),
(2825, 1, 146, '2021-07-13 18:56:45', 'Ingreso', 'A crear Reunion'),
(2826, 1, 103, '2021-07-13 18:59:05', 'Ingreso', 'A Lista de Reuniones'),
(2827, 1, 151, '2021-07-13 19:00:41', 'Ingreso', 'A crear Acuerdo'),
(2828, 1, 103, '2021-07-13 19:01:13', 'Ingreso', 'A Lista de Reuniones'),
(2829, 1, 151, '2021-07-13 19:01:38', 'Ingreso', 'A crear Acuerdo'),
(2830, 1, 7, '2021-07-13 19:20:45', 'Ingreso', 'A Gestion de Parametros'),
(2831, 1, 146, '2021-07-13 19:20:48', 'Ingreso', 'A crear Reunion'),
(2832, 1, 146, '2021-07-13 19:21:04', 'Ingreso', 'A crear Reunion'),
(2833, 1, 146, '2021-07-13 19:21:19', 'Ingreso', 'A crear Reunion'),
(2834, 1, 146, '2021-07-14 11:35:43', 'Ingreso', 'A crear Reunion'),
(2835, 1, 146, '2021-07-14 11:37:39', 'Ingreso', 'A crear Reunion'),
(2836, 1, 146, '2021-07-14 11:38:15', 'Ingreso', 'A crear Reunion'),
(2837, 1, 146, '2021-07-14 11:38:56', 'Ingreso', 'A crear Reunion'),
(2838, 1, 146, '2021-07-14 12:00:15', 'Ingreso', 'A crear Reunion'),
(2839, 1, 146, '2021-07-14 12:19:45', 'Ingreso', 'A crear Reunion'),
(2840, 1, 146, '2021-07-14 12:30:15', 'Ingreso', 'A crear Reunion'),
(2841, 1, 146, '2021-07-14 12:31:52', 'Ingreso', 'A crear Reunion'),
(2842, 1, 146, '2021-07-14 12:42:04', 'Ingreso', 'A crear Reunion'),
(2843, 1, 146, '2021-07-14 12:48:06', 'Ingreso', 'A crear Reunion'),
(2844, 1, 146, '2021-07-14 12:49:10', 'Ingreso', 'A crear Reunion'),
(2845, 1, 146, '2021-07-14 12:56:01', 'Ingreso', 'A crear Reunion'),
(2846, 1, 146, '2021-07-14 12:58:18', 'Ingreso', 'A crear Reunion'),
(2847, 1, 146, '2021-07-14 13:08:00', 'Ingreso', 'A crear Reunion'),
(2848, 1, 146, '2021-07-14 13:12:51', 'Ingreso', 'A crear Reunion'),
(2849, 1, 146, '2021-07-14 13:14:00', 'Ingreso', 'A crear Reunion'),
(2850, 1, 146, '2021-07-14 13:15:56', 'Ingreso', 'A crear Reunion'),
(2851, 1, 146, '2021-07-14 13:16:38', 'Ingreso', 'A crear Reunion'),
(2852, 1, 146, '2021-07-14 13:17:11', 'Ingreso', 'A crear Reunion'),
(2853, 1, 146, '2021-07-14 13:17:35', 'Ingreso', 'A crear Reunion'),
(2854, 1, 146, '2021-07-14 13:19:31', 'Ingreso', 'A crear Reunion'),
(2855, 1, 146, '2021-07-14 13:20:38', 'Ingreso', 'A crear Reunion'),
(2856, 1, 146, '2021-07-14 13:22:49', 'Ingreso', 'A crear Reunion'),
(2857, 1, 146, '2021-07-14 13:23:19', 'Ingreso', 'A crear Reunion'),
(2858, 1, 146, '2021-07-14 13:24:03', 'Ingreso', 'A crear Reunion'),
(2859, 1, 146, '2021-07-14 13:24:19', 'Ingreso', 'A crear Reunion'),
(2860, 1, 146, '2021-07-14 13:25:34', 'Ingreso', 'A crear Reunion'),
(2861, 1, 146, '2021-07-14 13:26:45', 'Ingreso', 'A crear Reunion'),
(2862, 1, 146, '2021-07-14 13:27:34', 'Ingreso', 'A crear Reunion'),
(2863, 1, 146, '2021-07-14 13:27:42', 'Ingreso', 'A crear Reunion'),
(2864, 1, 146, '2021-07-14 13:27:53', 'Ingreso', 'A crear Reunion'),
(2865, 1, 146, '2021-07-14 13:27:57', 'Ingreso', 'A crear Reunion'),
(2866, 1, 146, '2021-07-14 13:28:30', 'Ingreso', 'A crear Reunion'),
(2867, 1, 146, '2021-07-14 13:33:18', 'Ingreso', 'A crear Reunion'),
(2868, 1, 146, '2021-07-14 13:33:47', 'Ingreso', 'A crear Reunion'),
(2869, 1, 7, '2021-07-14 13:38:17', 'Ingreso', 'A Gestion de Parametros'),
(2870, 1, 146, '2021-07-14 13:38:20', 'Ingreso', 'A crear Reunion'),
(2871, 1, 146, '2021-07-14 13:40:59', 'Ingreso', 'A crear Reunion'),
(2872, 1, 146, '2021-07-14 13:42:13', 'Ingreso', 'A crear Reunion'),
(2873, 1, 146, '2021-07-14 13:44:25', 'Ingreso', 'A crear Reunion'),
(2874, 1, 146, '2021-07-14 13:44:29', 'Ingreso', 'A crear Reunion'),
(2875, 1, 146, '2021-07-14 13:44:56', 'Ingreso', 'A crear Reunion'),
(2876, 1, 146, '2021-07-14 13:47:01', 'Ingreso', 'A crear Reunion'),
(2877, 1, 146, '2021-07-14 13:47:30', 'Ingreso', 'A crear Reunion'),
(2878, 1, 146, '2021-07-14 13:48:53', 'Ingreso', 'A crear Reunion'),
(2879, 1, 146, '2021-07-14 13:50:28', 'Ingreso', 'A crear Reunion'),
(2880, 1, 146, '2021-07-14 13:51:05', 'Ingreso', 'A crear Reunion'),
(2881, 1, 146, '2021-07-14 13:51:15', 'Ingreso', 'A crear Reunion'),
(2882, 1, 146, '2021-07-14 13:51:29', 'Ingreso', 'A crear Reunion'),
(2883, 1, 146, '2021-07-14 13:51:52', 'Ingreso', 'A crear Reunion'),
(2884, 1, 146, '2021-07-14 13:51:54', 'Ingreso', 'A crear Reunion'),
(2885, 1, 146, '2021-07-14 13:54:37', 'Ingreso', 'A crear Reunion'),
(2886, 1, 146, '2021-07-14 13:55:02', 'Ingreso', 'A crear Reunion'),
(2887, 1, 146, '2021-07-14 13:55:33', 'Ingreso', 'A crear Reunion'),
(2888, 1, 146, '2021-07-14 13:56:18', 'Ingreso', 'A crear Reunion'),
(2889, 1, 146, '2021-07-14 13:57:31', 'Ingreso', 'A crear Reunion'),
(2890, 1, 7, '2021-07-14 14:03:25', 'Ingreso', 'A Gestion de Parametros'),
(2891, 1, 146, '2021-07-14 14:03:27', 'Ingreso', 'A crear Reunion'),
(2892, 1, 7, '2021-07-14 14:03:29', 'Ingreso', 'A Gestion de Parametros'),
(2893, 1, 146, '2021-07-14 14:03:31', 'Ingreso', 'A crear Reunion'),
(2894, 1, 146, '2021-07-14 14:04:43', 'Ingreso', 'A crear Reunion'),
(2895, 1, 7, '2021-07-14 14:05:06', 'Ingreso', 'A Gestion de Parametros'),
(2896, 1, 146, '2021-07-14 14:05:12', 'Ingreso', 'A crear Reunion'),
(2897, 1, 7, '2021-07-14 14:05:28', 'Ingreso', 'A Gestion de Parametros'),
(2898, 1, 146, '2021-07-14 14:06:01', 'Ingreso', 'A crear Reunion'),
(2899, 1, 7, '2021-07-14 14:06:12', 'Ingreso', 'A Gestion de Parametros'),
(2900, 1, 146, '2021-07-14 14:06:15', 'Ingreso', 'A crear Reunion'),
(2901, 1, 7, '2021-07-14 14:06:45', 'Ingreso', 'A Gestion de Parametros'),
(2902, 1, 146, '2021-07-14 14:06:51', 'Ingreso', 'A crear Reunion'),
(2903, 1, 7, '2021-07-14 14:07:05', 'Ingreso', 'A Gestion de Parametros'),
(2904, 1, 146, '2021-07-14 14:37:03', 'Ingreso', 'A crear Reunion'),
(2905, 1, 146, '2021-07-14 14:38:22', 'Ingreso', 'A crear Reunion'),
(2906, 1, 7, '2021-07-14 14:38:38', 'Ingreso', 'A Gestion de Parametros'),
(2907, 1, 146, '2021-07-14 14:38:41', 'Ingreso', 'A crear Reunion'),
(2908, 1, 7, '2021-07-14 14:38:44', 'Ingreso', 'A Gestion de Parametros'),
(2909, 1, 146, '2021-07-14 14:38:46', 'Ingreso', 'A crear Reunion'),
(2910, 1, 7, '2021-07-14 14:38:51', 'Ingreso', 'A Gestion de Parametros'),
(2911, 1, 146, '2021-07-14 14:38:54', 'Ingreso', 'A crear Reunion'),
(2912, 1, 7, '2021-07-14 14:39:01', 'Ingreso', 'A Gestion de Parametros'),
(2913, 1, 146, '2021-07-14 14:39:04', 'Ingreso', 'A crear Reunion'),
(2914, 1, 7, '2021-07-14 14:39:06', 'Ingreso', 'A Gestion de Parametros'),
(2915, 1, 146, '2021-07-14 14:39:08', 'Ingreso', 'A crear Reunion'),
(2916, 1, 7, '2021-07-14 14:39:12', 'Ingreso', 'A Gestion de Parametros'),
(2917, 1, 146, '2021-07-14 14:39:14', 'Ingreso', 'A crear Reunion'),
(2918, 1, 146, '2021-07-14 14:45:04', 'Ingreso', 'A crear Reunion'),
(2919, 1, 7, '2021-07-14 14:50:25', 'Ingreso', 'A Gestion de Parametros'),
(2920, 1, 7, '2021-07-14 14:50:47', 'Ingreso', 'A Gestion de Parametros'),
(2921, 1, 103, '2021-07-14 14:51:11', 'Ingreso', 'A Lista de Reuniones'),
(2922, 1, 103, '2021-07-14 14:51:26', 'Ingreso', 'A Lista de Reuniones'),
(2923, 1, 151, '2021-07-14 14:53:22', 'Ingreso', 'A crear Acuerdo'),
(2924, 1, 156, '2021-07-14 14:54:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(2925, 1, 151, '2021-07-14 15:05:27', 'Ingreso', 'A crear Acuerdo'),
(2926, 1, 151, '2021-07-14 15:21:04', 'Ingreso', 'A crear Acuerdo'),
(2927, 1, 151, '2021-07-14 15:27:04', 'Ingreso', 'A crear Acuerdo'),
(2928, 1, 151, '2021-07-14 15:29:17', 'Ingreso', 'A crear Acuerdo'),
(2929, 1, 146, '2021-07-14 15:36:09', 'Ingreso', 'A crear Reunion'),
(2930, 1, 151, '2021-07-14 15:41:42', 'Ingreso', 'A crear Acuerdo'),
(2931, 1, 151, '2021-07-14 15:42:13', 'Ingreso', 'A crear Acuerdo'),
(2932, 1, 151, '2021-07-14 15:42:49', 'Ingreso', 'A crear Acuerdo'),
(2933, 1, 151, '2021-07-14 15:43:04', 'Ingreso', 'A crear Acuerdo'),
(2934, 1, 151, '2021-07-14 15:43:14', 'Ingreso', 'A crear Acuerdo'),
(2935, 1, 151, '2021-07-14 15:43:19', 'Ingreso', 'A crear Acuerdo'),
(2936, 1, 151, '2021-07-14 15:44:03', 'Ingreso', 'A crear Acuerdo'),
(2937, 1, 151, '2021-07-14 15:45:26', 'Ingreso', 'A crear Acuerdo'),
(2938, 1, 151, '2021-07-14 15:45:34', 'Ingreso', 'A crear Acuerdo'),
(2939, 1, 151, '2021-07-14 15:49:26', 'Ingreso', 'A crear Acuerdo'),
(2940, 1, 151, '2021-07-14 15:51:19', 'Ingreso', 'A crear Acuerdo'),
(2941, 1, 151, '2021-07-14 15:51:23', 'Ingreso', 'A crear Acuerdo'),
(2942, 1, 151, '2021-07-14 15:52:02', 'Ingreso', 'A crear Acuerdo'),
(2943, 1, 151, '2021-07-14 15:52:29', 'Ingreso', 'A crear Acuerdo'),
(2944, 1, 151, '2021-07-14 15:54:20', 'Ingreso', 'A crear Acuerdo'),
(2945, 1, 151, '2021-07-14 15:57:23', 'Ingreso', 'A crear Acuerdo'),
(2946, 1, 151, '2021-07-14 15:57:29', 'Ingreso', 'A crear Acuerdo'),
(2947, 1, 151, '2021-07-14 15:57:53', 'Ingreso', 'A crear Acuerdo'),
(2948, 1, 151, '2021-07-14 16:00:18', 'Ingreso', 'A crear Acuerdo'),
(2949, 1, 151, '2021-07-14 16:00:46', 'Ingreso', 'A crear Acuerdo'),
(2950, 1, 151, '2021-07-14 16:00:53', 'Ingreso', 'A crear Acuerdo'),
(2951, 1, 151, '2021-07-14 16:01:03', 'Ingreso', 'A crear Acuerdo'),
(2952, 1, 151, '2021-07-14 16:06:48', 'Ingreso', 'A crear Acuerdo'),
(2953, 1, 151, '2021-07-14 16:07:05', 'Ingreso', 'A crear Acuerdo'),
(2954, 1, 151, '2021-07-14 16:07:21', 'Ingreso', 'A crear Acuerdo'),
(2955, 1, 151, '2021-07-14 16:08:47', 'Ingreso', 'A crear Acuerdo'),
(2956, 1, 151, '2021-07-14 16:13:20', 'Ingreso', 'A crear Acuerdo'),
(2957, 1, 151, '2021-07-14 16:14:00', 'Ingreso', 'A crear Acuerdo'),
(2958, 1, 151, '2021-07-14 16:15:09', 'Ingreso', 'A crear Acuerdo'),
(2959, 1, 151, '2021-07-14 16:16:08', 'Ingreso', 'A crear Acuerdo'),
(2960, 1, 151, '2021-07-14 16:16:57', 'Ingreso', 'A crear Acuerdo'),
(2961, 1, 151, '2021-07-14 16:25:25', 'Ingreso', 'A crear Acuerdo'),
(2962, 1, 151, '2021-07-14 16:30:36', 'Ingreso', 'A crear Acuerdo'),
(2963, 1, 151, '2021-07-14 16:31:07', 'Ingreso', 'A crear Acuerdo'),
(2964, 1, 151, '2021-07-14 16:32:36', 'Ingreso', 'A crear Acuerdo'),
(2965, 1, 151, '2021-07-14 16:32:52', 'Ingreso', 'A crear Acuerdo'),
(2966, 1, 151, '2021-07-14 16:33:03', 'Ingreso', 'A crear Acuerdo'),
(2967, 1, 151, '2021-07-14 16:35:02', 'Ingreso', 'A crear Acuerdo'),
(2968, 1, 151, '2021-07-14 16:35:14', 'Ingreso', 'A crear Acuerdo'),
(2969, 1, 151, '2021-07-14 16:35:19', 'Ingreso', 'A crear Acuerdo'),
(2970, 1, 151, '2021-07-14 16:35:34', 'Ingreso', 'A crear Acuerdo'),
(2971, 1, 151, '2021-07-14 16:35:55', 'Ingreso', 'A crear Acuerdo'),
(2972, 1, 151, '2021-07-14 16:36:01', 'Ingreso', 'A crear Acuerdo'),
(2973, 1, 151, '2021-07-14 16:36:05', 'Ingreso', 'A crear Acuerdo'),
(2974, 1, 151, '2021-07-14 16:36:13', 'Ingreso', 'A crear Acuerdo'),
(2975, 1, 151, '2021-07-14 16:44:35', 'Ingreso', 'A crear Acuerdo'),
(2976, 1, 151, '2021-07-14 16:44:45', 'Ingreso', 'A crear Acuerdo'),
(2977, 1, 151, '2021-07-14 17:48:59', 'Ingreso', 'A crear Acuerdo'),
(2978, 1, 151, '2021-07-14 17:49:13', 'Ingreso', 'A crear Acuerdo'),
(2979, 1, 103, '2021-07-14 17:49:22', 'Ingreso', 'A Lista de Reuniones'),
(2980, 1, 103, '2021-07-14 17:50:56', 'Ingreso', 'A Lista de Reuniones'),
(2981, 1, 103, '2021-07-14 17:51:14', 'Ingreso', 'A Lista de Reuniones'),
(2982, 1, 151, '2021-07-14 17:57:31', 'Ingreso', 'A crear Acuerdo'),
(2983, 1, 151, '2021-07-14 17:58:17', 'Ingreso', 'A crear Acuerdo'),
(2984, 1, 151, '2021-07-14 17:58:23', 'Ingreso', 'A crear Acuerdo'),
(2985, 1, 151, '2021-07-14 17:59:43', 'Ingreso', 'A crear Acuerdo'),
(2986, 1, 151, '2021-07-14 18:01:53', 'Ingreso', 'A crear Acuerdo'),
(2987, 1, 151, '2021-07-14 18:02:36', 'Ingreso', 'A crear Acuerdo'),
(2988, 1, 151, '2021-07-14 18:04:07', 'Ingreso', 'A crear Acuerdo'),
(2989, 1, 151, '2021-07-14 18:04:10', 'Ingreso', 'A crear Acuerdo'),
(2990, 1, 151, '2021-07-14 18:04:12', 'Ingreso', 'A crear Acuerdo'),
(2991, 1, 103, '2021-07-14 18:04:16', 'Ingreso', 'A Lista de Reuniones'),
(2992, 1, 103, '2021-07-14 18:04:39', 'Ingreso', 'A Lista de Reuniones'),
(2993, 1, 151, '2021-07-14 18:16:24', 'Ingreso', 'A crear Acuerdo'),
(2994, 1, 151, '2021-07-14 18:16:31', 'Ingreso', 'A crear Acuerdo'),
(2995, 1, 151, '2021-07-14 18:16:36', 'Ingreso', 'A crear Acuerdo'),
(2996, 1, 151, '2021-07-14 18:16:38', 'Ingreso', 'A crear Acuerdo'),
(2997, 1, 103, '2021-07-14 18:16:42', 'Ingreso', 'A Lista de Reuniones'),
(2998, 1, 103, '2021-07-14 18:17:11', 'Ingreso', 'A Lista de Reuniones'),
(2999, 1, 151, '2021-07-14 18:27:27', 'Ingreso', 'A crear Acuerdo'),
(3000, 1, 151, '2021-07-14 18:27:38', 'Ingreso', 'A crear Acuerdo'),
(3001, 1, 151, '2021-07-14 18:27:51', 'Ingreso', 'A crear Acuerdo'),
(3002, 1, 151, '2021-07-14 18:27:53', 'Ingreso', 'A crear Acuerdo'),
(3003, 1, 103, '2021-07-14 18:27:59', 'Ingreso', 'A Lista de Reuniones'),
(3004, 1, 103, '2021-07-14 18:48:06', 'Ingreso', 'A Lista de Reuniones'),
(3005, 1, 103, '2021-07-14 18:48:27', 'Ingreso', 'A Lista de Reuniones'),
(3006, 1, 103, '2021-07-14 18:48:46', 'Ingreso', 'A Lista de Reuniones'),
(3007, 1, 7, '2021-07-14 18:50:01', 'Ingreso', 'A Gestion de Parametros'),
(3008, 1, 146, '2021-07-14 18:50:03', 'Ingreso', 'A crear Reunion'),
(3009, 1, 7, '2021-07-14 18:50:06', 'Ingreso', 'A Gestion de Parametros'),
(3010, 1, 146, '2021-07-14 18:50:09', 'Ingreso', 'A crear Reunion'),
(3011, 1, 7, '2021-07-14 18:52:10', 'Ingreso', 'A Gestion de Parametros'),
(3012, 1, 103, '2021-07-14 18:52:17', 'Ingreso', 'A Lista de Reuniones'),
(3013, 1, 103, '2021-07-14 18:54:07', 'Ingreso', 'A Lista de Reuniones'),
(3014, 1, 156, '2021-07-14 18:55:50', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3015, 1, 7, '2021-07-14 19:03:45', 'Ingreso', 'A Gestion de Parametros'),
(3016, 1, 146, '2021-07-14 19:03:48', 'Ingreso', 'A crear Reunion'),
(3017, 1, 7, '2021-07-14 19:03:50', 'Ingreso', 'A Gestion de Parametros'),
(3018, 1, 146, '2021-07-14 19:03:53', 'Ingreso', 'A crear Reunion'),
(3019, 1, 7, '2021-07-14 19:03:54', 'Ingreso', 'A Gestion de Parametros'),
(3020, 1, 146, '2021-07-14 19:03:56', 'Ingreso', 'A crear Reunion'),
(3021, 1, 151, '2021-07-15 10:35:01', 'Ingreso', 'A crear Acuerdo'),
(3022, 1, 151, '2021-07-15 10:36:25', 'Ingreso', 'A crear Acuerdo'),
(3023, 1, 151, '2021-07-15 10:56:15', 'Ingreso', 'A crear Acuerdo'),
(3024, 1, 103, '2021-07-15 10:56:23', 'Ingreso', 'A Lista de Reuniones'),
(3025, 1, 103, '2021-07-15 10:56:56', 'Ingreso', 'A Lista de Reuniones'),
(3026, 1, 103, '2021-07-15 10:57:01', 'Ingreso', 'A Lista de Reuniones'),
(3027, 1, 151, '2021-07-15 10:57:25', 'Ingreso', 'A crear Acuerdo'),
(3028, 1, 151, '2021-07-15 10:58:03', 'Ingreso', 'A crear Acuerdo'),
(3029, 1, 103, '2021-07-15 10:58:06', 'Ingreso', 'A Lista de Reuniones'),
(3030, 1, 103, '2021-07-15 11:03:15', 'Ingreso', 'A Lista de Reuniones'),
(3031, 1, 103, '2021-07-15 11:08:50', 'Ingreso', 'A Lista de Reuniones'),
(3032, 1, 103, '2021-07-15 11:11:08', 'Ingreso', 'A Lista de Reuniones'),
(3033, 1, 103, '2021-07-15 11:12:33', 'Ingreso', 'A Lista de Reuniones'),
(3034, 1, 103, '2021-07-15 11:13:27', 'Ingreso', 'A Lista de Reuniones'),
(3035, 1, 103, '2021-07-15 11:13:35', 'Ingreso', 'A Lista de Reuniones'),
(3036, 1, 103, '2021-07-15 11:13:40', 'Ingreso', 'A Lista de Reuniones'),
(3037, 1, 103, '2021-07-15 11:13:45', 'Ingreso', 'A Lista de Reuniones'),
(3038, 1, 103, '2021-07-15 11:13:49', 'Ingreso', 'A Lista de Reuniones'),
(3039, 1, 7, '2021-07-15 11:17:19', 'Ingreso', 'A Gestion de Parametros'),
(3040, 1, 146, '2021-07-15 11:17:23', 'Ingreso', 'A crear Reunion'),
(3041, 1, 7, '2021-07-15 11:17:38', 'Ingreso', 'A Gestion de Parametros'),
(3042, 1, 146, '2021-07-15 11:17:43', 'Ingreso', 'A crear Reunion'),
(3043, 1, 146, '2021-07-15 11:24:04', 'Ingreso', 'A crear Reunion'),
(3044, 1, 7, '2021-07-15 11:24:06', 'Ingreso', 'A Gestion de Parametros'),
(3045, 1, 146, '2021-07-15 11:24:10', 'Ingreso', 'A crear Reunion'),
(3046, 1, 7, '2021-07-15 11:24:11', 'Ingreso', 'A Gestion de Parametros'),
(3047, 1, 103, '2021-07-15 11:24:14', 'Ingreso', 'A Lista de Reuniones'),
(3048, 1, 146, '2021-07-15 11:27:10', 'Ingreso', 'A crear Reunion'),
(3049, 1, 146, '2021-07-15 11:27:32', 'Ingreso', 'A crear Reunion'),
(3050, 1, 146, '2021-07-15 11:27:42', 'Ingreso', 'A crear Reunion'),
(3051, 1, 146, '2021-07-15 11:29:00', 'Ingreso', 'A crear Reunion'),
(3052, 1, 146, '2021-07-15 11:30:31', 'Ingreso', 'A crear Reunion'),
(3053, 1, 146, '2021-07-15 11:32:39', 'Ingreso', 'A crear Reunion'),
(3054, 1, 146, '2021-07-15 11:33:17', 'Ingreso', 'A crear Reunion'),
(3055, 1, 146, '2021-07-15 11:33:33', 'Ingreso', 'A crear Reunion'),
(3056, 1, 146, '2021-07-15 11:33:54', 'Ingreso', 'A crear Reunion'),
(3057, 1, 146, '2021-07-15 11:34:21', 'Ingreso', 'A crear Reunion'),
(3058, 1, 7, '2021-07-15 11:34:39', 'Ingreso', 'A Gestion de Parametros'),
(3059, 1, 146, '2021-07-15 11:34:42', 'Ingreso', 'A crear Reunion'),
(3060, 1, 7, '2021-07-15 11:35:12', 'Ingreso', 'A Gestion de Parametros'),
(3061, 1, 146, '2021-07-15 11:35:15', 'Ingreso', 'A crear Reunion'),
(3062, 1, 7, '2021-07-15 11:35:15', 'Ingreso', 'A Gestion de Parametros'),
(3063, 1, 103, '2021-07-15 11:35:17', 'Ingreso', 'A Lista de Reuniones'),
(3064, 1, 146, '2021-07-15 11:35:20', 'Ingreso', 'A crear Reunion'),
(3065, 1, 146, '2021-07-15 11:36:21', 'Ingreso', 'A crear Reunion'),
(3066, 1, 146, '2021-07-15 11:37:35', 'Ingreso', 'A crear Reunion'),
(3067, 1, 146, '2021-07-15 11:38:30', 'Ingreso', 'A crear Reunion'),
(3068, 1, 146, '2021-07-15 11:39:05', 'Ingreso', 'A crear Reunion'),
(3069, 1, 146, '2021-07-15 11:39:22', 'Ingreso', 'A crear Reunion'),
(3070, 1, 146, '2021-07-15 11:39:41', 'Ingreso', 'A crear Reunion'),
(3071, 1, 146, '2021-07-15 11:40:30', 'Ingreso', 'A crear Reunion'),
(3072, 1, 146, '2021-07-15 11:41:43', 'Ingreso', 'A crear Reunion'),
(3073, 1, 146, '2021-07-15 11:44:39', 'Ingreso', 'A crear Reunion'),
(3074, 1, 146, '2021-07-15 11:44:43', 'Ingreso', 'A crear Reunion'),
(3075, 1, 146, '2021-07-15 11:45:06', 'Ingreso', 'A crear Reunion'),
(3076, 1, 146, '2021-07-15 11:45:22', 'Ingreso', 'A crear Reunion'),
(3077, 1, 146, '2021-07-15 11:45:26', 'Ingreso', 'A crear Reunion'),
(3078, 1, 146, '2021-07-15 11:45:29', 'Ingreso', 'A crear Reunion'),
(3079, 1, 146, '2021-07-15 11:46:33', 'Ingreso', 'A crear Reunion'),
(3080, 1, 146, '2021-07-15 11:47:46', 'Ingreso', 'A crear Reunion'),
(3081, 1, 146, '2021-07-15 11:48:16', 'Ingreso', 'A crear Reunion'),
(3082, 1, 146, '2021-07-15 11:49:01', 'Ingreso', 'A crear Reunion'),
(3083, 1, 146, '2021-07-15 11:49:16', 'Ingreso', 'A crear Reunion'),
(3084, 1, 146, '2021-07-15 11:53:12', 'Ingreso', 'A crear Reunion'),
(3085, 1, 146, '2021-07-15 11:55:58', 'Ingreso', 'A crear Reunion'),
(3086, 1, 146, '2021-07-15 11:56:43', 'Ingreso', 'A crear Reunion'),
(3087, 1, 146, '2021-07-15 12:01:16', 'Ingreso', 'A crear Reunion'),
(3088, 1, 146, '2021-07-15 12:01:58', 'Ingreso', 'A crear Reunion'),
(3089, 1, 146, '2021-07-15 12:02:14', 'Ingreso', 'A crear Reunion'),
(3090, 1, 146, '2021-07-15 12:02:20', 'Ingreso', 'A crear Reunion'),
(3091, 1, 146, '2021-07-15 12:02:27', 'Ingreso', 'A crear Reunion'),
(3092, 1, 146, '2021-07-15 12:02:41', 'Ingreso', 'A crear Reunion'),
(3093, 1, 146, '2021-07-15 12:03:37', 'Ingreso', 'A crear Reunion'),
(3094, 1, 146, '2021-07-15 12:04:18', 'Ingreso', 'A crear Reunion'),
(3095, 1, 146, '2021-07-15 12:05:59', 'Ingreso', 'A crear Reunion'),
(3096, 1, 146, '2021-07-15 12:06:46', 'Ingreso', 'A crear Reunion'),
(3097, 1, 146, '2021-07-15 12:06:56', 'Ingreso', 'A crear Reunion'),
(3098, 1, 146, '2021-07-15 12:07:08', 'Ingreso', 'A crear Reunion'),
(3099, 1, 146, '2021-07-15 12:14:36', 'Ingreso', 'A crear Reunion'),
(3100, 1, 156, '2021-07-15 12:15:01', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3101, 1, 103, '2021-07-15 12:16:14', 'Ingreso', 'A Lista de Reuniones'),
(3102, 1, 103, '2021-07-15 12:16:37', 'Ingreso', 'A Lista de Reuniones'),
(3103, 1, 103, '2021-07-15 12:19:28', 'Ingreso', 'A Lista de Reuniones'),
(3104, 1, 103, '2021-07-15 12:20:35', 'Ingreso', 'A Lista de Reuniones'),
(3105, 1, 103, '2021-07-15 12:21:38', 'Ingreso', 'A Lista de Reuniones'),
(3106, 1, 103, '2021-07-15 12:22:07', 'Ingreso', 'A Lista de Reuniones'),
(3107, 1, 103, '2021-07-15 12:22:58', 'Ingreso', 'A Lista de Reuniones'),
(3108, 1, 103, '2021-07-15 12:24:54', 'Ingreso', 'A Lista de Reuniones'),
(3109, 1, 103, '2021-07-15 12:35:52', 'Ingreso', 'A Lista de Reuniones'),
(3110, 1, 103, '2021-07-15 12:36:28', 'Ingreso', 'A Lista de Reuniones'),
(3111, 1, 103, '2021-07-15 12:36:36', 'Ingreso', 'A Lista de Reuniones'),
(3112, 1, 103, '2021-07-15 12:37:39', 'Ingreso', 'A Lista de Reuniones'),
(3113, 1, 156, '2021-07-15 12:41:17', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3114, 1, 156, '2021-07-15 12:43:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3115, 1, 158, '2021-07-15 12:44:03', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3116, 1, 158, '2021-07-15 12:44:24', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3117, 1, 158, '2021-07-15 12:44:49', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3118, 1, 158, '2021-07-15 12:46:53', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3119, 1, 158, '2021-07-15 12:46:56', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3120, 1, 158, '2021-07-15 12:48:34', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3121, 1, 158, '2021-07-15 12:49:07', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3122, 1, 156, '2021-07-15 13:01:18', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3123, 1, 156, '2021-07-15 13:03:13', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3124, 1, 156, '2021-07-15 13:03:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3125, 1, 157, '2021-07-15 13:04:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3126, 1, 157, '2021-07-15 13:05:40', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3127, 1, 157, '2021-07-15 13:06:03', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3128, 1, 157, '2021-07-15 13:06:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3129, 1, 157, '2021-07-15 13:07:03', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3130, 1, 157, '2021-07-15 13:07:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3131, 1, 157, '2021-07-15 13:09:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3132, 1, 157, '2021-07-15 13:09:28', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3133, 1, 157, '2021-07-15 13:10:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3134, 1, 157, '2021-07-15 13:11:25', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3135, 1, 157, '2021-07-15 13:11:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3136, 1, 157, '2021-07-15 13:11:53', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3137, 1, 157, '2021-07-15 13:12:18', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3138, 1, 157, '2021-07-15 13:13:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3139, 1, 157, '2021-07-15 13:13:17', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3140, 1, 157, '2021-07-15 13:13:19', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3141, 1, 156, '2021-07-15 13:13:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3142, 1, 157, '2021-07-15 13:13:32', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3143, 1, 158, '2021-07-15 13:13:40', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3144, 1, 159, '2021-07-15 13:13:49', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3145, 1, 159, '2021-07-15 13:15:18', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3146, 1, 159, '2021-07-15 13:15:27', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3147, 1, 159, '2021-07-15 13:15:49', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3148, 1, 159, '2021-07-15 13:16:05', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3149, 1, 159, '2021-07-15 13:17:07', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3150, 1, 159, '2021-07-15 13:18:08', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3151, 1, 159, '2021-07-15 13:18:11', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3152, 1, 160, '2021-07-15 13:18:15', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3153, 1, 160, '2021-07-15 13:21:30', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3154, 1, 160, '2021-07-15 13:21:45', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3155, 1, 160, '2021-07-15 13:22:10', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3156, 1, 161, '2021-07-15 13:26:48', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3157, 1, 161, '2021-07-15 13:28:04', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3158, 1, 161, '2021-07-15 13:28:43', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3159, 1, 159, '2021-07-15 13:32:58', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3160, 1, 156, '2021-07-15 13:34:06', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3161, 1, 157, '2021-07-15 13:34:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3162, 1, 158, '2021-07-15 13:34:13', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3163, 1, 158, '2021-07-15 13:34:36', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3164, 1, 158, '2021-07-15 13:34:55', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3165, 1, 158, '2021-07-15 13:35:05', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3166, 1, 158, '2021-07-15 13:35:46', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3167, 1, 158, '2021-07-15 13:35:50', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3168, 1, 158, '2021-07-15 13:35:54', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3169, 1, 159, '2021-07-15 13:35:58', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3170, 1, 160, '2021-07-15 13:36:02', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3171, 1, 160, '2021-07-15 13:36:14', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3172, 1, 160, '2021-07-15 13:36:59', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3173, 1, 160, '2021-07-15 13:37:11', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3174, 1, 161, '2021-07-15 13:37:15', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3175, 1, 161, '2021-07-15 13:37:28', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3176, 1, 161, '2021-07-15 13:37:40', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3177, 1, 161, '2021-07-15 13:37:50', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3178, 1, 7, '2021-07-15 13:38:02', 'Ingreso', 'A Gestion de Parametros'),
(3179, 1, 146, '2021-07-15 13:38:04', 'Ingreso', 'A crear Reunion'),
(3180, 1, 146, '2021-07-15 13:38:56', 'Ingreso', 'A crear Reunion'),
(3181, 1, 146, '2021-07-15 13:39:08', 'Ingreso', 'A crear Reunion'),
(3182, 1, 7, '2021-07-15 13:39:20', 'Ingreso', 'A Gestion de Parametros'),
(3183, 1, 146, '2021-07-15 13:39:22', 'Ingreso', 'A crear Reunion'),
(3184, 1, 7, '2021-07-15 13:39:31', 'Ingreso', 'A Gestion de Parametros'),
(3185, 1, 146, '2021-07-15 13:39:34', 'Ingreso', 'A crear Reunion'),
(3186, 1, 156, '2021-07-15 13:40:04', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3187, 1, 146, '2021-07-15 13:40:52', 'Ingreso', 'A crear Reunion'),
(3188, 1, 103, '2021-07-15 13:43:36', 'Ingreso', 'A Lista de Reuniones'),
(3189, 1, 7, '2021-07-15 13:44:32', 'Ingreso', 'A Gestion de Parametros'),
(3190, 1, 146, '2021-07-15 13:44:35', 'Ingreso', 'A crear Reunion'),
(3191, 1, 146, '2021-07-15 14:15:49', 'Ingreso', 'A crear Reunion'),
(3192, 1, 7, '2021-07-15 14:17:01', 'Ingreso', 'A Gestion de Parametros'),
(3193, 1, 157, '2021-07-15 14:59:33', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3194, 1, 157, '2021-07-15 15:00:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3195, 1, 158, '2021-07-15 15:02:17', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3196, 1, 158, '2021-07-15 15:03:09', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3197, 1, 158, '2021-07-15 15:04:38', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3198, 1, 157, '2021-07-15 15:04:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3199, 1, 156, '2021-07-15 15:05:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3200, 1, 156, '2021-07-15 15:05:10', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3201, 1, 156, '2021-07-15 15:05:32', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3202, 1, 156, '2021-07-15 15:06:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3203, 1, 156, '2021-07-15 15:07:12', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3204, 1, 156, '2021-07-15 15:07:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3205, 1, 156, '2021-07-15 15:08:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3206, 1, 157, '2021-07-15 15:10:46', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3207, 1, 156, '2021-07-15 15:10:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3208, 1, 156, '2021-07-15 15:11:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3209, 1, 156, '2021-07-15 15:11:26', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3210, 1, 156, '2021-07-15 15:13:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3211, 1, 156, '2021-07-15 15:13:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3212, 1, 156, '2021-07-15 15:14:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3213, 1, 156, '2021-07-15 15:14:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3214, 1, 156, '2021-07-15 15:14:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3215, 1, 156, '2021-07-15 15:14:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3216, 1, 156, '2021-07-15 15:14:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3217, 1, 157, '2021-07-15 15:15:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3218, 1, 156, '2021-07-15 15:15:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3219, 1, 161, '2021-07-15 15:27:53', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3220, 1, 161, '2021-07-15 15:28:29', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3221, 1, 157, '2021-07-15 15:31:07', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3222, 1, 156, '2021-07-15 15:31:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3223, 1, 161, '2021-07-15 15:39:53', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3224, 1, 161, '2021-07-15 15:40:13', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3225, 1, 156, '2021-07-15 15:41:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3226, 1, 156, '2021-07-15 15:41:32', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3227, 1, 156, '2021-07-15 17:37:26', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3228, 1, 51, '2021-07-15 17:40:31', 'Ingreso', 'A gestion docentes'),
(3229, 1, 40, '2021-07-15 17:40:46', 'Ingreso', 'A Gestion de Solicitud de PPS'),
(3230, 1, 19, '2021-07-15 17:40:48', 'INGRESO', 'A DOCUMENTACION DE PRACTICA.'),
(3231, 1, 146, '2021-07-15 20:34:16', 'Ingreso', 'A crear Reunion'),
(3232, 1, 146, '2021-07-15 20:35:52', 'Ingreso', 'A crear Reunion'),
(3233, 1, 146, '2021-07-15 20:36:18', 'Ingreso', 'A crear Reunion'),
(3234, 1, 146, '2021-07-15 20:36:43', 'Ingreso', 'A crear Reunion'),
(3235, 1, 146, '2021-07-15 20:37:15', 'Ingreso', 'A crear Reunion'),
(3236, 1, 156, '2021-07-15 20:56:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3237, 1, 159, '2021-07-15 21:00:09', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3238, 1, 103, '2021-07-15 21:28:03', 'Ingreso', 'A Lista de Reuniones'),
(3239, 1, 103, '2021-07-15 21:30:44', 'Ingreso', 'A Lista de Reuniones'),
(3240, 1, 103, '2021-07-15 21:31:20', 'Ingreso', 'A Lista de Reuniones'),
(3241, 1, 103, '2021-07-15 21:32:10', 'Ingreso', 'A Lista de Reuniones'),
(3242, 1, 103, '2021-07-15 21:32:59', 'Ingreso', 'A Lista de Reuniones'),
(3243, 1, 103, '2021-07-15 21:33:29', 'Ingreso', 'A Lista de Reuniones'),
(3244, 1, 103, '2021-07-15 21:35:42', 'Ingreso', 'A Lista de Reuniones'),
(3245, 1, 103, '2021-07-15 21:35:52', 'Ingreso', 'A Lista de Reuniones'),
(3246, 1, 103, '2021-07-15 21:36:14', 'Ingreso', 'A Lista de Reuniones'),
(3247, 1, 103, '2021-07-15 21:36:30', 'Ingreso', 'A Lista de Reuniones'),
(3248, 1, 103, '2021-07-15 21:36:51', 'Ingreso', 'A Lista de Reuniones'),
(3249, 1, 103, '2021-07-15 21:37:04', 'Ingreso', 'A Lista de Reuniones'),
(3250, 1, 103, '2021-07-15 21:37:22', 'Ingreso', 'A Lista de Reuniones'),
(3251, 1, 103, '2021-07-15 21:37:48', 'Ingreso', 'A Lista de Reuniones'),
(3252, 1, 103, '2021-07-15 21:40:20', 'Ingreso', 'A Lista de Reuniones'),
(3253, 1, 103, '2021-07-15 21:46:03', 'Ingreso', 'A Lista de Reuniones'),
(3254, 1, 103, '2021-07-15 21:48:11', 'Ingreso', 'A Lista de Reuniones'),
(3255, 1, 103, '2021-07-15 21:48:43', 'Ingreso', 'A Lista de Reuniones'),
(3256, 1, 103, '2021-07-15 21:49:26', 'Ingreso', 'A Lista de Reuniones'),
(3257, 1, 103, '2021-07-15 21:49:40', 'Ingreso', 'A Lista de Reuniones'),
(3258, 1, 103, '2021-07-15 21:49:59', 'Ingreso', 'A Lista de Reuniones'),
(3259, 1, 103, '2021-07-15 21:50:23', 'Ingreso', 'A Lista de Reuniones'),
(3260, 1, 103, '2021-07-15 21:51:17', 'Ingreso', 'A Lista de Reuniones'),
(3261, 1, 103, '2021-07-15 21:51:34', 'Ingreso', 'A Lista de Reuniones'),
(3262, 1, 103, '2021-07-15 21:52:14', 'Ingreso', 'A Lista de Reuniones'),
(3263, 1, 103, '2021-07-15 21:52:34', 'Ingreso', 'A Lista de Reuniones'),
(3264, 1, 103, '2021-07-15 21:55:14', 'Ingreso', 'A Lista de Reuniones'),
(3265, 1, 103, '2021-07-15 21:57:54', 'Ingreso', 'A Lista de Reuniones'),
(3266, 1, 103, '2021-07-15 21:58:18', 'Ingreso', 'A Lista de Reuniones'),
(3267, 1, 103, '2021-07-15 21:58:57', 'Ingreso', 'A Lista de Reuniones'),
(3268, 1, 103, '2021-07-16 10:37:53', 'Ingreso', 'A Lista de Reuniones'),
(3269, 1, 156, '2021-07-16 10:40:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3270, 1, 156, '2021-07-16 10:44:59', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3271, 1, 156, '2021-07-16 10:45:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3272, 1, 156, '2021-07-16 10:46:00', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3273, 1, 156, '2021-07-16 10:46:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3274, 1, 156, '2021-07-16 10:46:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3275, 1, 156, '2021-07-16 10:46:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3276, 1, 156, '2021-07-16 10:46:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3277, 1, 156, '2021-07-16 10:46:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3278, 1, 156, '2021-07-16 10:46:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3279, 1, 156, '2021-07-16 10:46:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3280, 1, 156, '2021-07-16 10:46:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3281, 1, 156, '2021-07-16 10:46:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3282, 1, 156, '2021-07-16 10:48:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3283, 1, 156, '2021-07-16 10:48:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3284, 1, 156, '2021-07-16 10:48:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3285, 1, 156, '2021-07-16 10:48:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3286, 1, 156, '2021-07-16 10:49:18', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3287, 1, 156, '2021-07-16 10:50:23', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3288, 1, 156, '2021-07-16 10:51:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3289, 1, 156, '2021-07-16 10:51:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3290, 1, 156, '2021-07-16 10:51:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3291, 1, 156, '2021-07-16 10:51:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3292, 1, 156, '2021-07-16 10:51:44', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3293, 1, 156, '2021-07-16 10:51:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3294, 1, 156, '2021-07-16 10:51:47', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3295, 1, 156, '2021-07-16 10:51:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3296, 1, 156, '2021-07-16 10:51:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3297, 1, 156, '2021-07-16 10:51:49', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3298, 1, 156, '2021-07-16 10:52:18', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3299, 1, 156, '2021-07-16 10:53:42', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3300, 1, 156, '2021-07-16 10:54:29', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3301, 1, 156, '2021-07-16 10:54:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3302, 1, 156, '2021-07-16 10:54:37', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3303, 1, 156, '2021-07-16 10:54:37', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3304, 1, 156, '2021-07-16 10:54:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3305, 1, 156, '2021-07-16 10:54:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3306, 1, 156, '2021-07-16 10:55:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3307, 1, 156, '2021-07-16 10:55:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3308, 1, 156, '2021-07-16 10:55:45', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3309, 1, 156, '2021-07-16 10:56:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3310, 1, 156, '2021-07-16 10:56:31', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3311, 1, 156, '2021-07-16 10:58:20', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3312, 1, 156, '2021-07-16 10:59:05', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3313, 1, 156, '2021-07-16 10:59:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3314, 1, 156, '2021-07-16 10:59:30', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3315, 1, 156, '2021-07-16 10:59:32', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3316, 1, 156, '2021-07-16 10:59:34', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3317, 1, 156, '2021-07-16 10:59:34', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3318, 1, 156, '2021-07-16 10:59:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3319, 1, 156, '2021-07-16 10:59:35', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3320, 1, 156, '2021-07-16 10:59:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3321, 1, 156, '2021-07-16 10:59:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3322, 1, 156, '2021-07-16 11:01:39', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3323, 1, 156, '2021-07-16 11:01:52', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3324, 1, 156, '2021-07-16 11:02:24', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3325, 1, 156, '2021-07-16 11:02:50', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3326, 1, 156, '2021-07-16 11:04:25', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3327, 1, 156, '2021-07-16 11:04:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3328, 1, 156, '2021-07-16 11:05:15', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3329, 1, 156, '2021-07-16 11:05:37', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3330, 1, 156, '2021-07-16 11:05:58', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3331, 1, 156, '2021-07-16 11:06:11', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3332, 1, 156, '2021-07-16 11:06:39', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3333, 1, 156, '2021-07-16 11:07:57', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3334, 1, 156, '2021-07-16 11:08:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3335, 1, 156, '2021-07-16 11:09:02', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3336, 1, 157, '2021-07-16 11:09:40', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3337, 1, 157, '2021-07-16 11:11:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3338, 1, 157, '2021-07-16 11:11:51', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3339, 1, 157, '2021-07-16 11:12:06', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3340, 1, 157, '2021-07-16 11:13:01', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3341, 1, 158, '2021-07-16 11:13:16', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3342, 1, 158, '2021-07-16 11:15:01', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3343, 1, 159, '2021-07-16 11:16:24', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3344, 1, 159, '2021-07-16 11:18:10', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3345, 1, 159, '2021-07-16 11:18:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3346, 1, 159, '2021-07-16 11:18:47', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3347, 1, 159, '2021-07-16 11:18:48', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3348, 1, 159, '2021-07-16 11:18:48', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3349, 1, 159, '2021-07-16 11:18:48', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3350, 1, 159, '2021-07-16 11:18:49', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3351, 1, 159, '2021-07-16 11:18:49', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3352, 1, 159, '2021-07-16 11:18:50', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3353, 1, 159, '2021-07-16 11:19:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3354, 1, 159, '2021-07-16 11:19:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3355, 1, 159, '2021-07-16 11:19:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3356, 1, 159, '2021-07-16 11:19:47', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3357, 1, 159, '2021-07-16 11:19:47', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3358, 1, 159, '2021-07-16 11:19:47', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3359, 1, 159, '2021-07-16 11:20:14', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3360, 1, 159, '2021-07-16 11:20:52', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3361, 1, 159, '2021-07-16 11:20:53', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3362, 1, 159, '2021-07-16 11:20:53', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3363, 1, 159, '2021-07-16 11:20:54', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3364, 1, 159, '2021-07-16 11:20:54', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3365, 1, 158, '2021-07-16 11:21:58', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3366, 1, 158, '2021-07-16 11:22:35', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3367, 1, 159, '2021-07-16 11:22:57', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3368, 1, 159, '2021-07-16 11:23:46', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3369, 1, 159, '2021-07-16 11:24:14', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3370, 1, 159, '2021-07-16 11:24:45', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(3371, 1, 160, '2021-07-16 11:25:15', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3372, 1, 160, '2021-07-16 11:27:06', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3373, 1, 161, '2021-07-16 11:27:36', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3374, 1, 161, '2021-07-16 11:29:20', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3375, 1, 103, '2021-07-16 11:31:02', 'Ingreso', 'A Lista de Reuniones'),
(3376, 1, 146, '2021-07-16 11:31:06', 'Ingreso', 'A crear Reunion'),
(3377, 1, 146, '2021-07-16 11:31:15', 'Ingreso', 'A crear Reunion'),
(3378, 1, 146, '2021-07-16 11:32:00', 'Ingreso', 'A crear Reunion'),
(3379, 1, 146, '2021-07-16 11:32:03', 'Ingreso', 'A crear Reunion'),
(3380, 1, 146, '2021-07-16 11:32:06', 'Ingreso', 'A crear Reunion'),
(3381, 1, 146, '2021-07-16 11:32:18', 'Ingreso', 'A crear Reunion'),
(3382, 1, 146, '2021-07-16 11:32:20', 'Ingreso', 'A crear Reunion'),
(3383, 1, 103, '2021-07-16 11:33:33', 'Ingreso', 'A Lista de Reuniones'),
(3384, 1, 103, '2021-07-16 11:34:00', 'Ingreso', 'A Lista de Reuniones'),
(3385, 1, 103, '2021-07-16 11:34:41', 'Ingreso', 'A Lista de Reuniones'),
(3386, 1, 103, '2021-07-16 11:35:44', 'Ingreso', 'A Lista de Reuniones'),
(3387, 1, 7, '2021-07-16 11:37:08', 'Ingreso', 'A Gestion de Parametros'),
(3388, 1, 103, '2021-07-16 11:53:50', 'Ingreso', 'A Lista de Reuniones'),
(3389, 1, 103, '2021-07-16 11:54:26', 'Ingreso', 'A Lista de Reuniones'),
(3390, 1, 103, '2021-07-16 12:33:06', 'Ingreso', 'A Lista de Reuniones'),
(3391, 1, 103, '2021-07-16 12:36:26', 'Ingreso', 'A Lista de Reuniones'),
(3392, 1, 103, '2021-07-16 12:36:29', 'Ingreso', 'A Lista de Reuniones'),
(3393, 1, 103, '2021-07-16 12:36:31', 'Ingreso', 'A Lista de Reuniones'),
(3394, 1, 103, '2021-07-16 12:36:33', 'Ingreso', 'A Lista de Reuniones'),
(3395, 1, 103, '2021-07-16 12:37:11', 'Ingreso', 'A Lista de Reuniones'),
(3396, 1, 103, '2021-07-16 12:38:04', 'Ingreso', 'A Lista de Reuniones'),
(3397, 1, 156, '2021-07-16 12:38:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3398, 1, 156, '2021-07-16 12:39:37', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3399, 1, 156, '2021-07-16 12:39:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3400, 1, 156, '2021-07-16 12:40:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3401, 1, 156, '2021-07-16 12:40:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3402, 1, 156, '2021-07-16 12:40:56', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3403, 1, 156, '2021-07-16 12:42:14', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3404, 1, 156, '2021-07-16 12:43:23', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3405, 1, 156, '2021-07-16 12:43:38', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3406, 1, 156, '2021-07-16 12:44:45', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3407, 1, 156, '2021-07-16 12:45:54', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3408, 1, 156, '2021-07-16 12:47:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3409, 1, 156, '2021-07-16 12:48:11', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3410, 1, 156, '2021-07-16 12:49:17', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3411, 1, 156, '2021-07-16 12:49:20', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3412, 1, 156, '2021-07-16 12:50:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3413, 1, 156, '2021-07-16 12:50:17', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3414, 1, 156, '2021-07-16 12:50:43', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3415, 1, 156, '2021-07-16 12:51:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3416, 1, 156, '2021-07-16 12:55:59', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3417, 1, 103, '2021-07-16 12:56:27', 'Ingreso', 'A Lista de Reuniones'),
(3418, 1, 103, '2021-07-16 13:01:39', 'Ingreso', 'A Lista de Reuniones'),
(3419, 1, 103, '2021-07-16 13:08:18', 'Ingreso', 'A Lista de Reuniones'),
(3420, 1, 103, '2021-07-16 13:17:40', 'Ingreso', 'A Lista de Reuniones'),
(3421, 1, 103, '2021-07-16 13:18:22', 'Ingreso', 'A Lista de Reuniones'),
(3422, 1, 103, '2021-07-16 13:37:51', 'Ingreso', 'A Lista de Reuniones'),
(3423, 1, 146, '2021-07-16 13:56:27', 'Ingreso', 'A crear Reunion'),
(3424, 1, 103, '2021-07-16 14:26:15', 'Ingreso', 'A Lista de Reuniones'),
(3425, 1, 103, '2021-07-16 15:12:39', 'Ingreso', 'A Lista de Reuniones'),
(3426, 1, 103, '2021-07-16 15:51:42', 'Ingreso', 'A Lista de Reuniones'),
(3427, 1, 103, '2021-07-16 16:14:40', 'Ingreso', 'A Lista de Reuniones'),
(3428, 1, 156, '2021-07-16 16:18:16', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3429, 1, 156, '2021-07-16 16:18:21', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3430, 1, 156, '2021-07-16 16:19:09', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3431, 1, 103, '2021-07-16 16:24:06', 'Ingreso', 'A Lista de Reuniones'),
(3432, 1, 103, '2021-07-16 17:30:46', 'Ingreso', 'A Lista de Reuniones'),
(3433, 1, 146, '2021-07-17 10:21:34', 'Ingreso', 'A crear Reunion'),
(3434, 1, 7, '2021-07-17 10:22:05', 'Ingreso', 'A Gestion de Parametros'),
(3435, 1, 146, '2021-07-17 10:22:09', 'Ingreso', 'A crear Reunion'),
(3436, 1, 7, '2021-07-17 10:25:04', 'Ingreso', 'A Gestion de Parametros'),
(3437, 1, 146, '2021-07-17 10:25:07', 'Ingreso', 'A crear Reunion'),
(3438, 1, 146, '2021-07-17 10:27:00', 'Ingreso', 'A crear Reunion'),
(3439, 1, 146, '2021-07-17 10:31:14', 'Ingreso', 'A crear Reunion'),
(3440, 1, 146, '2021-07-17 10:32:17', 'Ingreso', 'A crear Reunion'),
(3441, 1, 146, '2021-07-17 10:32:59', 'Ingreso', 'A crear Reunion'),
(3442, 1, 146, '2021-07-17 10:34:15', 'Ingreso', 'A crear Reunion'),
(3443, 1, 146, '2021-07-17 10:35:46', 'Ingreso', 'A crear Reunion'),
(3444, 1, 146, '2021-07-17 10:45:50', 'Ingreso', 'A crear Reunion'),
(3445, 1, 146, '2021-07-17 10:50:51', 'Ingreso', 'A crear Reunion'),
(3446, 1, 146, '2021-07-17 10:51:20', 'Ingreso', 'A crear Reunion'),
(3447, 1, 146, '2021-07-17 10:52:15', 'Ingreso', 'A crear Reunion'),
(3448, 1, 7, '2021-07-17 10:52:29', 'Ingreso', 'A Gestion de Parametros'),
(3449, 1, 146, '2021-07-17 10:52:32', 'Ingreso', 'A crear Reunion'),
(3450, 1, 146, '2021-07-17 10:53:57', 'Ingreso', 'A crear Reunion'),
(3451, 1, 146, '2021-07-17 10:56:47', 'Ingreso', 'A crear Reunion'),
(3452, 1, 146, '2021-07-17 10:57:14', 'Ingreso', 'A crear Reunion'),
(3453, 1, 146, '2021-07-17 10:57:16', 'Ingreso', 'A crear Reunion'),
(3454, 1, 146, '2021-07-17 10:58:09', 'Ingreso', 'A crear Reunion'),
(3455, 1, 146, '2021-07-17 10:58:38', 'Ingreso', 'A crear Reunion'),
(3456, 1, 146, '2021-07-17 11:02:48', 'Ingreso', 'A crear Reunion'),
(3457, 1, 146, '2021-07-17 11:03:43', 'Ingreso', 'A crear Reunion'),
(3458, 1, 146, '2021-07-17 11:05:00', 'Ingreso', 'A crear Reunion');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(3459, 1, 146, '2021-07-17 11:05:32', 'Ingreso', 'A crear Reunion'),
(3460, 1, 146, '2021-07-17 11:07:18', 'Ingreso', 'A crear Reunion'),
(3461, 1, 146, '2021-07-17 11:58:16', 'Ingreso', 'A crear Reunion'),
(3462, 1, 146, '2021-07-17 12:02:47', 'Ingreso', 'A crear Reunion'),
(3463, 1, 146, '2021-07-17 12:05:14', 'Ingreso', 'A crear Reunion'),
(3464, 1, 146, '2021-07-17 12:06:08', 'Ingreso', 'A crear Reunion'),
(3465, 1, 146, '2021-07-17 12:06:23', 'Ingreso', 'A crear Reunion'),
(3466, 1, 146, '2021-07-17 12:06:36', 'Ingreso', 'A crear Reunion'),
(3467, 1, 146, '2021-07-17 12:06:39', 'Ingreso', 'A crear Reunion'),
(3468, 1, 146, '2021-07-17 12:07:41', 'Ingreso', 'A crear Reunion'),
(3469, 1, 146, '2021-07-17 12:08:16', 'Ingreso', 'A crear Reunion'),
(3470, 1, 146, '2021-07-17 12:09:10', 'Ingreso', 'A crear Reunion'),
(3471, 1, 146, '2021-07-17 12:13:23', 'Ingreso', 'A crear Reunion'),
(3472, 1, 146, '2021-07-17 12:13:26', 'Ingreso', 'A crear Reunion'),
(3473, 1, 146, '2021-07-17 12:14:46', 'Ingreso', 'A crear Reunion'),
(3474, 1, 146, '2021-07-17 12:14:59', 'Ingreso', 'A crear Reunion'),
(3475, 1, 146, '2021-07-17 12:15:24', 'Ingreso', 'A crear Reunion'),
(3476, 1, 146, '2021-07-17 12:16:38', 'Ingreso', 'A crear Reunion'),
(3477, 1, 146, '2021-07-17 12:19:07', 'Ingreso', 'A crear Reunion'),
(3478, 1, 146, '2021-07-17 12:23:12', 'Ingreso', 'A crear Reunion'),
(3479, 1, 146, '2021-07-17 12:24:38', 'Ingreso', 'A crear Reunion'),
(3480, 1, 146, '2021-07-17 12:26:10', 'Ingreso', 'A crear Reunion'),
(3481, 1, 7, '2021-07-17 12:26:26', 'Ingreso', 'A Gestion de Parametros'),
(3482, 1, 146, '2021-07-17 12:26:29', 'Ingreso', 'A crear Reunion'),
(3483, 1, 146, '2021-07-17 12:29:07', 'Ingreso', 'A crear Reunion'),
(3484, 1, 7, '2021-07-17 12:29:10', 'Ingreso', 'A Gestion de Parametros'),
(3485, 1, 146, '2021-07-17 12:29:13', 'Ingreso', 'A crear Reunion'),
(3486, 1, 146, '2021-07-17 12:29:31', 'Ingreso', 'A crear Reunion'),
(3487, 1, 146, '2021-07-17 12:30:47', 'Ingreso', 'A crear Reunion'),
(3488, 1, 146, '2021-07-17 12:30:48', 'Ingreso', 'A crear Reunion'),
(3489, 1, 146, '2021-07-17 12:30:49', 'Ingreso', 'A crear Reunion'),
(3490, 1, 146, '2021-07-17 12:30:59', 'Ingreso', 'A crear Reunion'),
(3491, 1, 146, '2021-07-17 12:31:02', 'Ingreso', 'A crear Reunion'),
(3492, 1, 146, '2021-07-17 12:31:17', 'Ingreso', 'A crear Reunion'),
(3493, 1, 146, '2021-07-17 12:31:48', 'Ingreso', 'A crear Reunion'),
(3494, 1, 146, '2021-07-17 12:32:20', 'Ingreso', 'A crear Reunion'),
(3495, 1, 146, '2021-07-17 12:33:48', 'Ingreso', 'A crear Reunion'),
(3496, 1, 146, '2021-07-17 12:35:40', 'Ingreso', 'A crear Reunion'),
(3497, 1, 146, '2021-07-17 12:36:02', 'Ingreso', 'A crear Reunion'),
(3498, 1, 146, '2021-07-17 12:37:29', 'Ingreso', 'A crear Reunion'),
(3499, 1, 146, '2021-07-17 12:38:06', 'Ingreso', 'A crear Reunion'),
(3500, 1, 146, '2021-07-17 12:45:21', 'Ingreso', 'A crear Reunion'),
(3501, 1, 146, '2021-07-17 13:26:30', 'Ingreso', 'A crear Reunion'),
(3502, 1, 146, '2021-07-17 13:27:10', 'Ingreso', 'A crear Reunion'),
(3503, 1, 146, '2021-07-17 13:27:47', 'Ingreso', 'A crear Reunion'),
(3504, 1, 146, '2021-07-17 13:27:56', 'Ingreso', 'A crear Reunion'),
(3505, 1, 146, '2021-07-17 13:28:07', 'Ingreso', 'A crear Reunion'),
(3506, 1, 146, '2021-07-17 13:29:33', 'Ingreso', 'A crear Reunion'),
(3507, 1, 146, '2021-07-17 13:30:35', 'Ingreso', 'A crear Reunion'),
(3508, 1, 146, '2021-07-17 13:31:53', 'Ingreso', 'A crear Reunion'),
(3509, 1, 146, '2021-07-17 13:33:42', 'Ingreso', 'A crear Reunion'),
(3510, 1, 146, '2021-07-17 13:37:26', 'Ingreso', 'A crear Reunion'),
(3511, 1, 146, '2021-07-17 13:39:30', 'Ingreso', 'A crear Reunion'),
(3512, 1, 146, '2021-07-17 13:40:06', 'Ingreso', 'A crear Reunion'),
(3513, 1, 146, '2021-07-17 13:40:20', 'Ingreso', 'A crear Reunion'),
(3514, 1, 146, '2021-07-17 13:41:35', 'Ingreso', 'A crear Reunion'),
(3515, 1, 146, '2021-07-17 13:41:42', 'Ingreso', 'A crear Reunion'),
(3516, 1, 146, '2021-07-17 13:42:12', 'Ingreso', 'A crear Reunion'),
(3517, 1, 146, '2021-07-17 13:43:06', 'Ingreso', 'A crear Reunion'),
(3518, 1, 146, '2021-07-17 13:43:35', 'Ingreso', 'A crear Reunion'),
(3519, 1, 146, '2021-07-17 13:43:54', 'Ingreso', 'A crear Reunion'),
(3520, 1, 146, '2021-07-17 13:45:41', 'Ingreso', 'A crear Reunion'),
(3521, 1, 146, '2021-07-17 13:46:36', 'Ingreso', 'A crear Reunion'),
(3522, 1, 146, '2021-07-17 13:47:04', 'Ingreso', 'A crear Reunion'),
(3523, 1, 146, '2021-07-17 13:53:53', 'Ingreso', 'A crear Reunion'),
(3524, 1, 146, '2021-07-17 13:54:04', 'Ingreso', 'A crear Reunion'),
(3525, 1, 146, '2021-07-17 13:54:11', 'Ingreso', 'A crear Reunion'),
(3526, 1, 146, '2021-07-17 13:55:08', 'Ingreso', 'A crear Reunion'),
(3527, 1, 146, '2021-07-17 13:56:21', 'Ingreso', 'A crear Reunion'),
(3528, 1, 146, '2021-07-17 14:02:26', 'Ingreso', 'A crear Reunion'),
(3529, 1, 146, '2021-07-17 14:05:23', 'Ingreso', 'A crear Reunion'),
(3530, 1, 146, '2021-07-17 14:05:44', 'Ingreso', 'A crear Reunion'),
(3531, 1, 146, '2021-07-17 14:06:10', 'Ingreso', 'A crear Reunion'),
(3532, 1, 146, '2021-07-17 14:06:36', 'Ingreso', 'A crear Reunion'),
(3533, 1, 146, '2021-07-17 14:06:52', 'Ingreso', 'A crear Reunion'),
(3534, 1, 146, '2021-07-17 14:07:18', 'Ingreso', 'A crear Reunion'),
(3535, 1, 146, '2021-07-17 14:09:11', 'Ingreso', 'A crear Reunion'),
(3536, 1, 146, '2021-07-17 14:10:59', 'Ingreso', 'A crear Reunion'),
(3537, 1, 146, '2021-07-17 14:11:22', 'Ingreso', 'A crear Reunion'),
(3538, 1, 146, '2021-07-17 14:11:31', 'Ingreso', 'A crear Reunion'),
(3539, 1, 146, '2021-07-17 14:11:58', 'Ingreso', 'A crear Reunion'),
(3540, 1, 146, '2021-07-17 14:15:46', 'Ingreso', 'A crear Reunion'),
(3541, 1, 146, '2021-07-17 14:26:32', 'Ingreso', 'A crear Reunion'),
(3542, 1, 146, '2021-07-17 14:27:06', 'Ingreso', 'A crear Reunion'),
(3543, 1, 103, '2021-07-17 14:29:26', 'Ingreso', 'A Lista de Reuniones'),
(3544, 1, 7, '2021-07-17 14:29:31', 'Ingreso', 'A Gestion de Parametros'),
(3545, 1, 103, '2021-07-17 14:29:39', 'Ingreso', 'A Lista de Reuniones'),
(3546, 1, 103, '2021-07-17 14:42:19', 'Ingreso', 'A Lista de Reuniones'),
(3547, 1, 103, '2021-07-17 14:47:28', 'Ingreso', 'A Lista de Reuniones'),
(3548, 1, 103, '2021-07-17 14:48:07', 'Ingreso', 'A Lista de Reuniones'),
(3549, 1, 103, '2021-07-17 14:48:22', 'Ingreso', 'A Lista de Reuniones'),
(3550, 1, 103, '2021-07-17 14:48:43', 'Ingreso', 'A Lista de Reuniones'),
(3551, 1, 103, '2021-07-17 14:50:06', 'Ingreso', 'A Lista de Reuniones'),
(3552, 1, 103, '2021-07-17 14:50:23', 'Ingreso', 'A Lista de Reuniones'),
(3553, 1, 103, '2021-07-17 14:50:35', 'Ingreso', 'A Lista de Reuniones'),
(3554, 1, 103, '2021-07-17 14:50:43', 'Ingreso', 'A Lista de Reuniones'),
(3555, 1, 103, '2021-07-17 14:51:01', 'Ingreso', 'A Lista de Reuniones'),
(3556, 1, 103, '2021-07-17 14:51:07', 'Ingreso', 'A Lista de Reuniones'),
(3557, 1, 103, '2021-07-17 14:51:23', 'Ingreso', 'A Lista de Reuniones'),
(3558, 1, 103, '2021-07-17 14:51:46', 'Ingreso', 'A Lista de Reuniones'),
(3559, 1, 103, '2021-07-17 14:52:07', 'Ingreso', 'A Lista de Reuniones'),
(3560, 1, 103, '2021-07-17 14:52:26', 'Ingreso', 'A Lista de Reuniones'),
(3561, 1, 103, '2021-07-17 14:53:22', 'Ingreso', 'A Lista de Reuniones'),
(3562, 1, 146, '2021-07-17 14:55:22', 'Ingreso', 'A crear Reunion'),
(3563, 1, 103, '2021-07-17 14:55:26', 'Ingreso', 'A Lista de Reuniones'),
(3564, 1, 103, '2021-07-17 14:55:59', 'Ingreso', 'A Lista de Reuniones'),
(3565, 1, 146, '2021-07-17 14:56:08', 'Ingreso', 'A crear Reunion'),
(3566, 1, 103, '2021-07-17 14:56:37', 'Ingreso', 'A Lista de Reuniones'),
(3567, 1, 103, '2021-07-17 14:56:41', 'Ingreso', 'A Lista de Reuniones'),
(3568, 1, 103, '2021-07-17 14:56:45', 'Ingreso', 'A Lista de Reuniones'),
(3569, 1, 103, '2021-07-17 14:56:57', 'Ingreso', 'A Lista de Reuniones'),
(3570, 1, 103, '2021-07-17 14:57:50', 'Ingreso', 'A Lista de Reuniones'),
(3571, 1, 7, '2021-07-17 14:58:52', 'Ingreso', 'A Gestion de Parametros'),
(3572, 1, 146, '2021-07-17 14:58:56', 'Ingreso', 'A crear Reunion'),
(3573, 1, 146, '2021-07-17 17:28:59', 'Ingreso', 'A crear Reunion'),
(3574, 1, 146, '2021-07-17 17:31:18', 'Ingreso', 'A crear Reunion'),
(3575, 1, 146, '2021-07-17 17:32:18', 'Ingreso', 'A crear Reunion'),
(3576, 1, 146, '2021-07-17 17:32:30', 'Ingreso', 'A crear Reunion'),
(3577, 1, 146, '2021-07-17 17:32:59', 'Ingreso', 'A crear Reunion'),
(3578, 1, 146, '2021-07-17 17:33:33', 'Ingreso', 'A crear Reunion'),
(3579, 1, 146, '2021-07-17 17:33:46', 'Ingreso', 'A crear Reunion'),
(3580, 1, 146, '2021-07-17 17:34:22', 'Ingreso', 'A crear Reunion'),
(3581, 1, 146, '2021-07-17 17:38:03', 'Ingreso', 'A crear Reunion'),
(3582, 1, 146, '2021-07-17 17:38:20', 'Ingreso', 'A crear Reunion'),
(3583, 1, 146, '2021-07-17 17:40:33', 'Ingreso', 'A crear Reunion'),
(3584, 1, 146, '2021-07-17 17:40:56', 'Ingreso', 'A crear Reunion'),
(3585, 1, 146, '2021-07-17 17:41:47', 'Ingreso', 'A crear Reunion'),
(3586, 1, 146, '2021-07-17 17:42:35', 'Ingreso', 'A crear Reunion'),
(3587, 1, 146, '2021-07-17 17:43:01', 'Ingreso', 'A crear Reunion'),
(3588, 1, 146, '2021-07-17 17:44:24', 'Ingreso', 'A crear Reunion'),
(3589, 1, 146, '2021-07-17 17:52:35', 'Ingreso', 'A crear Reunion'),
(3590, 1, 146, '2021-07-17 17:57:57', 'Ingreso', 'A crear Reunion'),
(3591, 1, 146, '2021-07-17 17:59:31', 'Ingreso', 'A crear Reunion'),
(3592, 1, 146, '2021-07-17 18:14:57', 'Ingreso', 'A crear Reunion'),
(3593, 1, 146, '2021-07-17 18:16:19', 'Ingreso', 'A crear Reunion'),
(3594, 1, 146, '2021-07-17 18:17:00', 'Ingreso', 'A crear Reunion'),
(3595, 1, 146, '2021-07-17 18:17:45', 'Ingreso', 'A crear Reunion'),
(3596, 1, 146, '2021-07-17 18:18:38', 'Ingreso', 'A crear Reunion'),
(3597, 1, 146, '2021-07-17 18:20:29', 'Ingreso', 'A crear Reunion'),
(3598, 1, 146, '2021-07-17 18:21:51', 'Ingreso', 'A crear Reunion'),
(3599, 1, 146, '2021-07-17 18:27:45', 'Ingreso', 'A crear Reunion'),
(3600, 1, 146, '2021-07-17 18:27:54', 'Ingreso', 'A crear Reunion'),
(3601, 1, 146, '2021-07-17 18:28:26', 'Ingreso', 'A crear Reunion'),
(3602, 1, 146, '2021-07-17 18:29:20', 'Ingreso', 'A crear Reunion'),
(3603, 1, 146, '2021-07-17 18:30:10', 'Ingreso', 'A crear Reunion'),
(3604, 1, 146, '2021-07-17 18:33:10', 'Ingreso', 'A crear Reunion'),
(3605, 1, 146, '2021-07-17 18:34:04', 'Ingreso', 'A crear Reunion'),
(3606, 1, 146, '2021-07-17 18:38:48', 'Ingreso', 'A crear Reunion'),
(3607, 1, 146, '2021-07-17 18:47:54', 'Ingreso', 'A crear Reunion'),
(3608, 1, 146, '2021-07-17 18:51:41', 'Ingreso', 'A crear Reunion'),
(3609, 1, 146, '2021-07-17 18:52:24', 'Ingreso', 'A crear Reunion'),
(3610, 1, 146, '2021-07-17 18:59:35', 'Ingreso', 'A crear Reunion'),
(3611, 1, 146, '2021-07-17 19:01:52', 'Ingreso', 'A crear Reunion'),
(3612, 1, 146, '2021-07-17 19:04:54', 'Ingreso', 'A crear Reunion'),
(3613, 1, 146, '2021-07-17 19:23:59', 'Ingreso', 'A crear Reunion'),
(3614, 1, 146, '2021-07-17 19:25:54', 'Ingreso', 'A crear Reunion'),
(3615, 1, 146, '2021-07-17 19:29:00', 'Ingreso', 'A crear Reunion'),
(3616, 1, 146, '2021-07-17 19:31:24', 'Ingreso', 'A crear Reunion'),
(3617, 1, 146, '2021-07-17 19:35:39', 'Ingreso', 'A crear Reunion'),
(3618, 1, 146, '2021-07-17 19:45:59', 'Ingreso', 'A crear Reunion'),
(3619, 1, 146, '2021-07-17 19:47:11', 'Ingreso', 'A crear Reunion'),
(3620, 1, 146, '2021-07-17 19:49:49', 'Ingreso', 'A crear Reunion'),
(3621, 1, 146, '2021-07-17 19:51:36', 'Ingreso', 'A crear Reunion'),
(3622, 1, 146, '2021-07-17 19:52:04', 'Ingreso', 'A crear Reunion'),
(3623, 1, 146, '2021-07-17 19:52:58', 'Ingreso', 'A crear Reunion'),
(3624, 1, 146, '2021-07-17 19:53:00', 'Ingreso', 'A crear Reunion'),
(3625, 1, 146, '2021-07-17 19:53:01', 'Ingreso', 'A crear Reunion'),
(3626, 1, 146, '2021-07-17 19:53:01', 'Ingreso', 'A crear Reunion'),
(3627, 1, 146, '2021-07-17 19:53:38', 'Ingreso', 'A crear Reunion'),
(3628, 1, 103, '2021-07-18 11:34:14', 'Ingreso', 'A Lista de Reuniones'),
(3629, 1, 146, '2021-07-18 11:37:50', 'Ingreso', 'A crear Reunion'),
(3630, 1, 146, '2021-07-18 11:38:02', 'Ingreso', 'A crear Reunion'),
(3631, 1, 103, '2021-07-18 11:53:25', 'Ingreso', 'A Lista de Reuniones'),
(3632, 1, 151, '2021-07-18 11:55:04', 'Ingreso', 'A crear Acuerdo'),
(3633, 1, 151, '2021-07-18 11:55:41', 'Ingreso', 'A crear Acuerdo'),
(3634, 1, 151, '2021-07-18 11:55:47', 'Ingreso', 'A crear Acuerdo'),
(3635, 1, 151, '2021-07-18 11:55:50', 'Ingreso', 'A crear Acuerdo'),
(3636, 1, 151, '2021-07-18 11:55:54', 'Ingreso', 'A crear Acuerdo'),
(3637, 1, 151, '2021-07-18 11:56:20', 'Ingreso', 'A crear Acuerdo'),
(3638, 1, 146, '2021-07-18 12:10:35', 'Ingreso', 'A crear Reunion'),
(3639, 1, 146, '2021-07-18 12:27:49', 'Ingreso', 'A crear Reunion'),
(3640, 1, 146, '2021-07-18 12:30:15', 'Ingreso', 'A crear Reunion'),
(3641, 1, 146, '2021-07-18 12:31:45', 'Ingreso', 'A crear Reunion'),
(3642, 1, 146, '2021-07-18 12:32:48', 'Ingreso', 'A crear Reunion'),
(3643, 1, 146, '2021-07-18 12:35:02', 'Ingreso', 'A crear Reunion'),
(3644, 1, 103, '2021-07-18 12:35:11', 'Ingreso', 'A Lista de Reuniones'),
(3645, 1, 146, '2021-07-18 12:37:04', 'Ingreso', 'A crear Reunion'),
(3646, 1, 146, '2021-07-18 12:37:06', 'Ingreso', 'A crear Reunion'),
(3647, 1, 146, '2021-07-18 12:38:29', 'Ingreso', 'A crear Reunion'),
(3648, 1, 146, '2021-07-18 15:49:10', 'Ingreso', 'A crear Reunion'),
(3649, 1, 146, '2021-07-18 15:50:50', 'Ingreso', 'A crear Reunion'),
(3650, 1, 146, '2021-07-18 15:57:44', 'Ingreso', 'A crear Reunion'),
(3651, 1, 146, '2021-07-18 15:59:27', 'Ingreso', 'A crear Reunion'),
(3652, 1, 146, '2021-07-18 16:01:03', 'Ingreso', 'A crear Reunion'),
(3653, 1, 146, '2021-07-18 16:05:59', 'Ingreso', 'A crear Reunion'),
(3654, 1, 146, '2021-07-18 16:07:30', 'Ingreso', 'A crear Reunion'),
(3655, 1, 146, '2021-07-18 16:07:41', 'Ingreso', 'A crear Reunion'),
(3656, 1, 146, '2021-07-18 16:08:21', 'Ingreso', 'A crear Reunion'),
(3657, 1, 146, '2021-07-18 16:08:48', 'Ingreso', 'A crear Reunion'),
(3658, 1, 146, '2021-07-18 16:08:50', 'Ingreso', 'A crear Reunion'),
(3659, 1, 103, '2021-07-18 16:08:55', 'Ingreso', 'A Lista de Reuniones'),
(3660, 1, 103, '2021-07-18 16:09:18', 'Ingreso', 'A Lista de Reuniones'),
(3661, 1, 146, '2021-07-18 16:09:24', 'Ingreso', 'A crear Reunion'),
(3662, 1, 146, '2021-07-18 16:09:37', 'Ingreso', 'A crear Reunion'),
(3663, 1, 146, '2021-07-18 16:09:44', 'Ingreso', 'A crear Reunion'),
(3664, 1, 146, '2021-07-18 16:10:23', 'Ingreso', 'A crear Reunion'),
(3665, 1, 146, '2021-07-18 16:10:25', 'Ingreso', 'A crear Reunion'),
(3666, 1, 146, '2021-07-18 16:10:26', 'Ingreso', 'A crear Reunion'),
(3667, 1, 146, '2021-07-18 16:11:09', 'Ingreso', 'A crear Reunion'),
(3668, 1, 146, '2021-07-18 16:11:37', 'Ingreso', 'A crear Reunion'),
(3669, 1, 7, '2021-07-18 16:27:56', 'Ingreso', 'A Gestion de Parametros'),
(3670, 1, 146, '2021-07-18 16:28:01', 'Ingreso', 'A crear Reunion'),
(3671, 1, 7, '2021-07-18 16:28:14', 'Ingreso', 'A Gestion de Parametros'),
(3672, 1, 146, '2021-07-18 16:28:31', 'Ingreso', 'A crear Reunion'),
(3673, 1, 7, '2021-07-18 16:28:33', 'Ingreso', 'A Gestion de Parametros'),
(3674, 1, 146, '2021-07-18 16:28:36', 'Ingreso', 'A crear Reunion'),
(3675, 1, 7, '2021-07-18 16:28:39', 'Ingreso', 'A Gestion de Parametros'),
(3676, 1, 146, '2021-07-18 16:28:43', 'Ingreso', 'A crear Reunion'),
(3677, 1, 7, '2021-07-18 16:29:50', 'Ingreso', 'A Gestion de Parametros'),
(3678, 1, 146, '2021-07-18 16:29:56', 'Ingreso', 'A crear Reunion'),
(3679, 1, 7, '2021-07-18 16:30:32', 'Ingreso', 'A Gestion de Parametros'),
(3680, 1, 146, '2021-07-18 16:30:35', 'Ingreso', 'A crear Reunion'),
(3681, 1, 7, '2021-07-18 16:31:26', 'Ingreso', 'A Gestion de Parametros'),
(3682, 1, 146, '2021-07-18 16:31:29', 'Ingreso', 'A crear Reunion'),
(3683, 1, 7, '2021-07-18 16:31:47', 'Ingreso', 'A Gestion de Parametros'),
(3684, 1, 146, '2021-07-18 16:36:39', 'Ingreso', 'A crear Reunion'),
(3685, 1, 146, '2021-07-18 16:41:49', 'Ingreso', 'A crear Reunion'),
(3686, 1, 146, '2021-07-18 16:46:47', 'Ingreso', 'A crear Reunion'),
(3687, 1, 146, '2021-07-18 16:49:24', 'Ingreso', 'A crear Reunion'),
(3688, 1, 146, '2021-07-18 16:51:28', 'Ingreso', 'A crear Reunion'),
(3689, 1, 146, '2021-07-18 16:53:52', 'Ingreso', 'A crear Reunion'),
(3690, 1, 146, '2021-07-18 16:56:13', 'Ingreso', 'A crear Reunion'),
(3691, 1, 146, '2021-07-18 16:57:22', 'Ingreso', 'A crear Reunion'),
(3692, 1, 146, '2021-07-18 16:57:33', 'Ingreso', 'A crear Reunion'),
(3693, 1, 146, '2021-07-18 16:58:34', 'Ingreso', 'A crear Reunion'),
(3694, 1, 7, '2021-07-18 16:58:38', 'Ingreso', 'A Gestion de Parametros'),
(3695, 1, 146, '2021-07-18 16:58:39', 'Ingreso', 'A crear Reunion'),
(3696, 1, 146, '2021-07-18 16:59:37', 'Ingreso', 'A crear Reunion'),
(3697, 1, 146, '2021-07-18 17:00:00', 'Ingreso', 'A crear Reunion'),
(3698, 1, 7, '2021-07-18 17:00:08', 'Ingreso', 'A Gestion de Parametros'),
(3699, 1, 146, '2021-07-18 17:00:11', 'Ingreso', 'A crear Reunion'),
(3700, 1, 146, '2021-07-18 17:01:38', 'Ingreso', 'A crear Reunion'),
(3701, 1, 7, '2021-07-18 17:02:44', 'Ingreso', 'A Gestion de Parametros'),
(3702, 1, 146, '2021-07-18 17:02:45', 'Ingreso', 'A crear Reunion'),
(3703, 1, 7, '2021-07-18 17:02:48', 'Ingreso', 'A Gestion de Parametros'),
(3704, 1, 146, '2021-07-18 17:02:49', 'Ingreso', 'A crear Reunion'),
(3705, 1, 146, '2021-07-18 17:02:56', 'Ingreso', 'A crear Reunion'),
(3706, 1, 146, '2021-07-18 17:05:04', 'Ingreso', 'A crear Reunion'),
(3707, 1, 146, '2021-07-18 18:04:03', 'Ingreso', 'A crear Reunion'),
(3708, 1, 146, '2021-07-18 18:04:15', 'Ingreso', 'A crear Reunion'),
(3709, 1, 7, '2021-07-18 18:06:01', 'Ingreso', 'A Gestion de Parametros'),
(3710, 1, 146, '2021-07-18 18:06:03', 'Ingreso', 'A crear Reunion'),
(3711, 1, 146, '2021-07-18 18:07:23', 'Ingreso', 'A crear Reunion'),
(3712, 1, 146, '2021-07-18 18:07:35', 'Ingreso', 'A crear Reunion'),
(3713, 1, 146, '2021-07-18 18:07:57', 'Ingreso', 'A crear Reunion'),
(3714, 1, 7, '2021-07-18 18:08:05', 'Ingreso', 'A Gestion de Parametros'),
(3715, 1, 146, '2021-07-18 18:08:08', 'Ingreso', 'A crear Reunion'),
(3716, 1, 146, '2021-07-18 18:08:25', 'Ingreso', 'A crear Reunion'),
(3717, 1, 146, '2021-07-18 18:08:58', 'Ingreso', 'A crear Reunion'),
(3718, 1, 7, '2021-07-18 18:09:08', 'Ingreso', 'A Gestion de Parametros'),
(3719, 1, 146, '2021-07-18 18:09:11', 'Ingreso', 'A crear Reunion'),
(3720, 1, 7, '2021-07-18 18:10:33', 'Ingreso', 'A Gestion de Parametros'),
(3721, 1, 146, '2021-07-18 18:10:36', 'Ingreso', 'A crear Reunion'),
(3722, 1, 146, '2021-07-18 18:10:58', 'Ingreso', 'A crear Reunion'),
(3723, 1, 7, '2021-07-18 18:11:05', 'Ingreso', 'A Gestion de Parametros'),
(3724, 1, 146, '2021-07-18 18:11:07', 'Ingreso', 'A crear Reunion'),
(3725, 1, 103, '2021-07-18 18:24:16', 'Ingreso', 'A Lista de Reuniones'),
(3726, 1, 103, '2021-07-18 18:24:36', 'Ingreso', 'A Lista de Reuniones'),
(3727, 1, 103, '2021-07-18 18:25:17', 'Ingreso', 'A Lista de Reuniones'),
(3728, 1, 103, '2021-07-18 18:25:24', 'Ingreso', 'A Lista de Reuniones'),
(3729, 1, 103, '2021-07-18 18:25:28', 'Ingreso', 'A Lista de Reuniones'),
(3730, 1, 103, '2021-07-18 18:27:06', 'Ingreso', 'A Lista de Reuniones'),
(3731, 1, 103, '2021-07-18 18:29:56', 'Ingreso', 'A Lista de Reuniones'),
(3732, 1, 103, '2021-07-18 18:30:02', 'Ingreso', 'A Lista de Reuniones'),
(3733, 1, 103, '2021-07-18 18:36:09', 'Ingreso', 'A Lista de Reuniones'),
(3734, 1, 103, '2021-07-18 18:37:26', 'Ingreso', 'A Lista de Reuniones'),
(3735, 1, 146, '2021-07-18 18:37:32', 'Ingreso', 'A crear Reunion'),
(3736, 1, 103, '2021-07-18 18:39:38', 'Ingreso', 'A Lista de Reuniones'),
(3737, 1, 156, '2021-07-18 18:46:29', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3738, 1, 7, '2021-07-18 18:47:48', 'Ingreso', 'A Gestion de Parametros'),
(3739, 1, 146, '2021-07-18 18:52:07', 'Ingreso', 'A crear Reunion'),
(3740, 1, 103, '2021-07-18 18:54:02', 'Ingreso', 'A Lista de Reuniones'),
(3741, 1, 151, '2021-07-19 09:46:51', 'Ingreso', 'A crear Acuerdo'),
(3742, 1, 151, '2021-07-19 09:49:15', 'Ingreso', 'A crear Acuerdo'),
(3743, 1, 151, '2021-07-19 09:51:57', 'Ingreso', 'A crear Acuerdo'),
(3744, 1, 151, '2021-07-19 09:55:29', 'Ingreso', 'A crear Acuerdo'),
(3745, 1, 151, '2021-07-19 10:04:44', 'Ingreso', 'A crear Acuerdo'),
(3746, 1, 151, '2021-07-19 10:06:56', 'Ingreso', 'A crear Acuerdo'),
(3747, 1, 7, '2021-07-19 10:15:15', 'Ingreso', 'A Gestion de Parametros'),
(3748, 1, 146, '2021-07-19 10:15:20', 'Ingreso', 'A crear Reunion'),
(3749, 1, 7, '2021-07-19 10:16:19', 'Ingreso', 'A Gestion de Parametros'),
(3750, 1, 146, '2021-07-19 10:16:23', 'Ingreso', 'A crear Reunion'),
(3751, 1, 7, '2021-07-19 10:16:43', 'Ingreso', 'A Gestion de Parametros'),
(3752, 1, 146, '2021-07-19 10:16:44', 'Ingreso', 'A crear Reunion'),
(3753, 1, 7, '2021-07-19 10:16:46', 'Ingreso', 'A Gestion de Parametros'),
(3754, 1, 103, '2021-07-19 10:16:51', 'Ingreso', 'A Lista de Reuniones'),
(3755, 1, 103, '2021-07-19 10:16:59', 'Ingreso', 'A Lista de Reuniones'),
(3756, 1, 146, '2021-07-19 10:17:05', 'Ingreso', 'A crear Reunion'),
(3757, 1, 146, '2021-07-19 10:17:12', 'Ingreso', 'A crear Reunion'),
(3758, 1, 7, '2021-07-19 10:34:00', 'Ingreso', 'A Gestion de Parametros'),
(3759, 1, 146, '2021-07-19 10:34:03', 'Ingreso', 'A crear Reunion'),
(3760, 1, 146, '2021-07-19 10:34:11', 'Ingreso', 'A crear Reunion'),
(3761, 1, 146, '2021-07-19 10:34:35', 'Ingreso', 'A crear Reunion'),
(3762, 1, 146, '2021-07-19 10:35:17', 'Ingreso', 'A crear Reunion'),
(3763, 1, 146, '2021-07-19 10:35:38', 'Ingreso', 'A crear Reunion'),
(3764, 1, 7, '2021-07-19 10:42:20', 'Ingreso', 'A Gestion de Parametros'),
(3765, 1, 7, '2021-07-19 10:42:23', 'Ingreso', 'A Gestion de Parametros'),
(3766, 1, 146, '2021-07-19 10:42:28', 'Ingreso', 'A crear Reunion'),
(3767, 1, 146, '2021-07-19 10:42:57', 'Ingreso', 'A crear Reunion'),
(3768, 1, 7, '2021-07-19 10:43:13', 'Ingreso', 'A Gestion de Parametros'),
(3769, 1, 146, '2021-07-19 10:43:18', 'Ingreso', 'A crear Reunion'),
(3770, 1, 146, '2021-07-19 10:43:39', 'Ingreso', 'A crear Reunion'),
(3771, 1, 146, '2021-07-19 10:44:05', 'Ingreso', 'A crear Reunion'),
(3772, 1, 146, '2021-07-19 10:47:10', 'Ingreso', 'A crear Reunion'),
(3773, 1, 146, '2021-07-19 10:48:31', 'Ingreso', 'A crear Reunion'),
(3774, 1, 146, '2021-07-19 10:53:43', 'Ingreso', 'A crear Reunion'),
(3775, 1, 146, '2021-07-19 10:57:48', 'Ingreso', 'A crear Reunion'),
(3776, 1, 146, '2021-07-19 10:58:27', 'Ingreso', 'A crear Reunion'),
(3777, 1, 146, '2021-07-19 10:59:27', 'Ingreso', 'A crear Reunion'),
(3778, 1, 146, '2021-07-19 11:00:00', 'Ingreso', 'A crear Reunion'),
(3779, 1, 7, '2021-07-19 11:00:08', 'Ingreso', 'A Gestion de Parametros'),
(3780, 1, 146, '2021-07-19 11:00:14', 'Ingreso', 'A crear Reunion'),
(3781, 1, 146, '2021-07-19 11:04:40', 'Ingreso', 'A crear Reunion'),
(3782, 1, 7, '2021-07-19 11:04:46', 'Ingreso', 'A Gestion de Parametros'),
(3783, 1, 146, '2021-07-19 11:05:10', 'Ingreso', 'A crear Reunion'),
(3784, 1, 7, '2021-07-19 11:05:19', 'Ingreso', 'A Gestion de Parametros'),
(3785, 1, 146, '2021-07-19 11:05:21', 'Ingreso', 'A crear Reunion'),
(3786, 1, 146, '2021-07-19 11:07:57', 'Ingreso', 'A crear Reunion'),
(3787, 1, 7, '2021-07-19 11:08:47', 'Ingreso', 'A Gestion de Parametros'),
(3788, 1, 146, '2021-07-19 11:08:50', 'Ingreso', 'A crear Reunion'),
(3789, 1, 103, '2021-07-19 11:08:59', 'Ingreso', 'A Lista de Reuniones'),
(3790, 1, 146, '2021-07-19 11:09:08', 'Ingreso', 'A crear Reunion'),
(3791, 1, 7, '2021-07-19 11:27:37', 'Ingreso', 'A Gestion de Parametros'),
(3792, 1, 146, '2021-07-19 11:27:39', 'Ingreso', 'A crear Reunion'),
(3793, 1, 7, '2021-07-19 11:28:05', 'Ingreso', 'A Gestion de Parametros'),
(3794, 1, 7, '2021-07-19 11:28:38', 'Ingreso', 'A Gestion de Parametros'),
(3795, 1, 146, '2021-07-19 11:28:40', 'Ingreso', 'A crear Reunion'),
(3796, 1, 7, '2021-07-19 11:28:45', 'Ingreso', 'A Gestion de Parametros'),
(3797, 1, 7, '2021-07-19 11:29:09', 'Ingreso', 'A Gestion de Parametros'),
(3798, 1, 146, '2021-07-19 11:29:12', 'Ingreso', 'A crear Reunion'),
(3799, 1, 7, '2021-07-19 11:36:29', 'Ingreso', 'A Gestion de Parametros'),
(3800, 1, 146, '2021-07-19 11:36:31', 'Ingreso', 'A crear Reunion'),
(3801, 1, 103, '2021-07-19 11:38:05', 'Ingreso', 'A Lista de Reuniones'),
(3802, 1, 146, '2021-07-19 11:38:10', 'Ingreso', 'A crear Reunion'),
(3803, 1, 146, '2021-07-19 11:38:26', 'Ingreso', 'A crear Reunion'),
(3804, 1, 146, '2021-07-19 11:38:34', 'Ingreso', 'A crear Reunion'),
(3805, 1, 103, '2021-07-19 11:39:23', 'Ingreso', 'A Lista de Reuniones'),
(3806, 1, 151, '2021-07-19 11:39:38', 'Ingreso', 'A crear Acuerdo'),
(3807, 1, 103, '2021-07-19 11:39:57', 'Ingreso', 'A Lista de Reuniones'),
(3808, 1, 156, '2021-07-19 11:40:34', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3809, 1, 157, '2021-07-19 11:40:48', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3810, 1, 103, '2021-07-19 13:47:08', 'Ingreso', 'A Lista de Reuniones'),
(3811, 1, 103, '2021-07-19 13:47:15', 'Ingreso', 'A Lista de Reuniones'),
(3812, 1, 146, '2021-07-19 14:01:10', 'Ingreso', 'A crear Reunion'),
(3813, 1, 7, '2021-07-19 14:02:53', 'Ingreso', 'A Gestion de Parametros'),
(3814, 1, 146, '2021-07-19 14:02:56', 'Ingreso', 'A crear Reunion'),
(3815, 1, 103, '2021-07-19 14:09:04', 'Ingreso', 'A Lista de Reuniones'),
(3816, 1, 103, '2021-07-19 14:15:31', 'Ingreso', 'A Lista de Reuniones'),
(3817, 1, 103, '2021-07-19 14:16:31', 'Ingreso', 'A Lista de Reuniones'),
(3818, 1, 103, '2021-07-19 14:18:20', 'Ingreso', 'A Lista de Reuniones'),
(3819, 1, 103, '2021-07-19 14:18:20', 'Ingreso', 'A Lista de Reuniones'),
(3820, 1, 103, '2021-07-19 14:18:20', 'Ingreso', 'A Lista de Reuniones'),
(3821, 1, 103, '2021-07-19 14:18:20', 'Ingreso', 'A Lista de Reuniones'),
(3822, 1, 103, '2021-07-19 14:18:39', 'Ingreso', 'A Lista de Reuniones'),
(3823, 1, 103, '2021-07-19 14:18:40', 'Ingreso', 'A Lista de Reuniones'),
(3824, 1, 161, '2021-07-19 14:19:27', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3825, 1, 161, '2021-07-19 14:19:59', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3826, 1, 161, '2021-07-19 14:19:59', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3827, 1, 161, '2021-07-19 14:20:00', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3828, 1, 161, '2021-07-19 14:20:00', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(3829, 1, 7, '2021-07-19 14:36:52', 'Ingreso', 'A Gestion de Parametros'),
(3830, 1, 146, '2021-07-19 14:36:54', 'Ingreso', 'A crear Reunion'),
(3831, 1, 146, '2021-07-19 14:37:40', 'Ingreso', 'A crear Reunion'),
(3832, 1, 146, '2021-07-19 14:39:10', 'Ingreso', 'A crear Reunion'),
(3833, 1, 7, '2021-07-19 14:39:33', 'Ingreso', 'A Gestion de Parametros'),
(3834, 1, 7, '2021-07-19 14:44:48', 'Ingreso', 'A Gestion de Parametros'),
(3835, 1, 146, '2021-07-19 14:44:51', 'Ingreso', 'A crear Reunion'),
(3836, 1, 146, '2021-07-19 14:45:16', 'Ingreso', 'A crear Reunion'),
(3837, 1, 146, '2021-07-19 14:45:21', 'Ingreso', 'A crear Reunion'),
(3838, 1, 146, '2021-07-19 14:45:48', 'Ingreso', 'A crear Reunion'),
(3839, 1, 146, '2021-07-19 14:45:52', 'Ingreso', 'A crear Reunion'),
(3840, 1, 146, '2021-07-19 14:48:30', 'Ingreso', 'A crear Reunion'),
(3841, 1, 146, '2021-07-19 14:48:56', 'Ingreso', 'A crear Reunion'),
(3842, 1, 146, '2021-07-19 14:49:11', 'Ingreso', 'A crear Reunion'),
(3843, 1, 146, '2021-07-19 14:49:24', 'Ingreso', 'A crear Reunion'),
(3844, 1, 146, '2021-07-19 14:49:38', 'Ingreso', 'A crear Reunion'),
(3845, 1, 146, '2021-07-19 14:49:45', 'Ingreso', 'A crear Reunion'),
(3846, 1, 146, '2021-07-19 14:49:52', 'Ingreso', 'A crear Reunion'),
(3847, 1, 146, '2021-07-19 14:49:59', 'Ingreso', 'A crear Reunion'),
(3848, 1, 146, '2021-07-19 14:51:10', 'Ingreso', 'A crear Reunion'),
(3849, 1, 146, '2021-07-19 14:51:12', 'Ingreso', 'A crear Reunion'),
(3850, 1, 146, '2021-07-19 14:51:26', 'Ingreso', 'A crear Reunion'),
(3851, 1, 146, '2021-07-19 14:51:45', 'Ingreso', 'A crear Reunion'),
(3852, 1, 146, '2021-07-19 14:53:02', 'Ingreso', 'A crear Reunion'),
(3853, 1, 7, '2021-07-19 14:53:26', 'Ingreso', 'A Gestion de Parametros'),
(3854, 1, 146, '2021-07-19 14:53:29', 'Ingreso', 'A crear Reunion'),
(3855, 1, 146, '2021-07-19 15:02:51', 'Ingreso', 'A crear Reunion'),
(3856, 1, 146, '2021-07-19 15:17:14', 'Ingreso', 'A crear Reunion'),
(3857, 1, 146, '2021-07-19 15:20:10', 'Ingreso', 'A crear Reunion'),
(3858, 1, 146, '2021-07-19 15:22:59', 'Ingreso', 'A crear Reunion'),
(3859, 1, 146, '2021-07-19 15:26:13', 'Ingreso', 'A crear Reunion'),
(3860, 1, 7, '2021-07-19 15:34:07', 'Ingreso', 'A Gestion de Parametros'),
(3861, 1, 146, '2021-07-19 15:34:12', 'Ingreso', 'A crear Reunion'),
(3862, 1, 146, '2021-07-20 10:47:14', 'Ingreso', 'A crear Reunion'),
(3863, 1, 7, '2021-07-20 10:47:21', 'Ingreso', 'A Gestion de Parametros'),
(3864, 1, 146, '2021-07-20 10:47:23', 'Ingreso', 'A crear Reunion'),
(3865, 1, 146, '2021-07-20 10:47:44', 'Ingreso', 'A crear Reunion'),
(3866, 1, 146, '2021-07-20 10:47:53', 'Ingreso', 'A crear Reunion'),
(3867, 1, 146, '2021-07-20 10:52:01', 'Ingreso', 'A crear Reunion'),
(3868, 1, 146, '2021-07-20 10:53:07', 'Ingreso', 'A crear Reunion'),
(3869, 1, 146, '2021-07-20 10:53:08', 'Ingreso', 'A crear Reunion'),
(3870, 1, 7, '2021-07-20 10:53:59', 'Ingreso', 'A Gestion de Parametros'),
(3871, 1, 7, '2021-07-20 10:54:08', 'Ingreso', 'A Gestion de Parametros'),
(3872, 1, 146, '2021-07-20 10:54:10', 'Ingreso', 'A crear Reunion'),
(3873, 1, 146, '2021-07-20 10:54:15', 'Ingreso', 'A crear Reunion'),
(3874, 1, 146, '2021-07-20 10:54:42', 'Ingreso', 'A crear Reunion'),
(3875, 1, 146, '2021-07-20 10:54:50', 'Ingreso', 'A crear Reunion'),
(3876, 1, 7, '2021-07-20 11:02:32', 'Ingreso', 'A Gestion de Parametros'),
(3877, 1, 146, '2021-07-20 11:02:34', 'Ingreso', 'A crear Reunion'),
(3878, 1, 7, '2021-07-20 12:26:46', 'Ingreso', 'A Gestion de Parametros'),
(3879, 1, 146, '2021-07-20 12:26:49', 'Ingreso', 'A crear Reunion'),
(3880, 1, 146, '2021-07-20 12:27:28', 'Ingreso', 'A crear Reunion'),
(3881, 1, 146, '2021-07-20 12:27:29', 'Ingreso', 'A crear Reunion'),
(3882, 1, 146, '2021-07-20 12:28:17', 'Ingreso', 'A crear Reunion'),
(3883, 1, 146, '2021-07-20 12:28:19', 'Ingreso', 'A crear Reunion'),
(3884, 1, 146, '2021-07-20 12:28:32', 'Ingreso', 'A crear Reunion'),
(3885, 1, 7, '2021-07-20 12:30:29', 'Ingreso', 'A Gestion de Parametros'),
(3886, 1, 103, '2021-07-20 12:30:34', 'Ingreso', 'A Lista de Reuniones'),
(3887, 1, 103, '2021-07-20 12:38:49', 'Ingreso', 'A Lista de Reuniones'),
(3888, 1, 103, '2021-07-20 12:39:17', 'Ingreso', 'A Lista de Reuniones'),
(3889, 1, 103, '2021-07-20 12:39:19', 'Ingreso', 'A Lista de Reuniones'),
(3890, 1, 103, '2021-07-20 12:39:35', 'Ingreso', 'A Lista de Reuniones'),
(3891, 1, 103, '2021-07-20 12:41:07', 'Ingreso', 'A Lista de Reuniones'),
(3892, 1, 103, '2021-07-20 12:41:55', 'Ingreso', 'A Lista de Reuniones'),
(3893, 1, 103, '2021-07-20 12:41:57', 'Ingreso', 'A Lista de Reuniones'),
(3894, 1, 103, '2021-07-20 12:42:09', 'Ingreso', 'A Lista de Reuniones'),
(3895, 1, 103, '2021-07-20 12:42:57', 'Ingreso', 'A Lista de Reuniones'),
(3896, 1, 103, '2021-07-20 12:43:37', 'Ingreso', 'A Lista de Reuniones'),
(3897, 1, 103, '2021-07-20 12:43:47', 'Ingreso', 'A Lista de Reuniones'),
(3898, 1, 103, '2021-07-20 12:44:34', 'Ingreso', 'A Lista de Reuniones'),
(3899, 1, 103, '2021-07-20 12:45:02', 'Ingreso', 'A Lista de Reuniones'),
(3900, 1, 103, '2021-07-20 12:45:04', 'Ingreso', 'A Lista de Reuniones'),
(3901, 1, 103, '2021-07-20 12:45:20', 'Ingreso', 'A Lista de Reuniones'),
(3902, 1, 103, '2021-07-20 12:45:54', 'Ingreso', 'A Lista de Reuniones'),
(3903, 1, 103, '2021-07-20 12:46:21', 'Ingreso', 'A Lista de Reuniones'),
(3904, 1, 103, '2021-07-20 12:46:28', 'Ingreso', 'A Lista de Reuniones'),
(3905, 1, 103, '2021-07-20 12:47:59', 'Ingreso', 'A Lista de Reuniones'),
(3906, 1, 103, '2021-07-20 12:49:09', 'Ingreso', 'A Lista de Reuniones'),
(3907, 1, 103, '2021-07-20 12:49:46', 'Ingreso', 'A Lista de Reuniones'),
(3908, 1, 7, '2021-07-20 12:49:53', 'Ingreso', 'A Gestion de Parametros'),
(3909, 1, 146, '2021-07-20 12:49:58', 'Ingreso', 'A crear Reunion'),
(3910, 1, 146, '2021-07-20 12:50:07', 'Ingreso', 'A crear Reunion'),
(3911, 1, 7, '2021-07-20 12:50:08', 'Ingreso', 'A Gestion de Parametros'),
(3912, 1, 103, '2021-07-20 12:50:15', 'Ingreso', 'A Lista de Reuniones'),
(3913, 1, 103, '2021-07-20 12:51:01', 'Ingreso', 'A Lista de Reuniones'),
(3914, 1, 146, '2021-07-20 13:22:59', 'Ingreso', 'A crear Reunion'),
(3915, 1, 7, '2021-07-20 13:34:39', 'Ingreso', 'A Gestion de Parametros'),
(3916, 1, 146, '2021-07-20 13:34:41', 'Ingreso', 'A crear Reunion'),
(3917, 1, 7, '2021-07-20 13:34:46', 'Ingreso', 'A Gestion de Parametros'),
(3918, 1, 146, '2021-07-20 13:34:48', 'Ingreso', 'A crear Reunion'),
(3919, 1, 7, '2021-07-20 13:34:54', 'Ingreso', 'A Gestion de Parametros'),
(3920, 1, 146, '2021-07-20 13:34:57', 'Ingreso', 'A crear Reunion'),
(3921, 1, 7, '2021-07-20 13:35:09', 'Ingreso', 'A Gestion de Parametros'),
(3922, 1, 146, '2021-07-20 13:35:12', 'Ingreso', 'A crear Reunion'),
(3923, 1, 146, '2021-07-20 13:40:38', 'Ingreso', 'A crear Reunion'),
(3924, 1, 7, '2021-07-20 13:41:45', 'Ingreso', 'A Gestion de Parametros'),
(3925, 1, 146, '2021-07-20 13:41:51', 'Ingreso', 'A crear Reunion'),
(3926, 1, 146, '2021-07-20 13:42:48', 'Ingreso', 'A crear Reunion'),
(3927, 1, 146, '2021-07-20 13:43:45', 'Ingreso', 'A crear Reunion'),
(3928, 1, 146, '2021-07-20 13:43:58', 'Ingreso', 'A crear Reunion'),
(3929, 1, 146, '2021-07-20 13:44:23', 'Ingreso', 'A crear Reunion'),
(3930, 1, 146, '2021-07-20 13:49:30', 'Ingreso', 'A crear Reunion'),
(3931, 1, 146, '2021-07-20 13:50:14', 'Ingreso', 'A crear Reunion'),
(3932, 1, 146, '2021-07-20 13:53:51', 'Ingreso', 'A crear Reunion'),
(3933, 1, 146, '2021-07-20 13:55:39', 'Ingreso', 'A crear Reunion'),
(3934, 1, 7, '2021-07-20 13:55:52', 'Ingreso', 'A Gestion de Parametros'),
(3935, 1, 146, '2021-07-20 13:55:55', 'Ingreso', 'A crear Reunion'),
(3936, 1, 146, '2021-07-20 13:56:55', 'Ingreso', 'A crear Reunion'),
(3937, 1, 7, '2021-07-20 13:56:58', 'Ingreso', 'A Gestion de Parametros'),
(3938, 1, 146, '2021-07-20 13:57:01', 'Ingreso', 'A crear Reunion'),
(3939, 1, 146, '2021-07-20 13:57:12', 'Ingreso', 'A crear Reunion'),
(3940, 1, 146, '2021-07-20 13:58:07', 'Ingreso', 'A crear Reunion'),
(3941, 1, 7, '2021-07-20 13:58:15', 'Ingreso', 'A Gestion de Parametros'),
(3942, 1, 146, '2021-07-20 13:58:18', 'Ingreso', 'A crear Reunion'),
(3943, 1, 7, '2021-07-20 14:00:08', 'Ingreso', 'A Gestion de Parametros'),
(3944, 1, 146, '2021-07-20 14:00:11', 'Ingreso', 'A crear Reunion'),
(3945, 1, 7, '2021-07-20 14:00:12', 'Ingreso', 'A Gestion de Parametros'),
(3946, 1, 146, '2021-07-20 14:00:16', 'Ingreso', 'A crear Reunion'),
(3947, 1, 7, '2021-07-20 14:00:19', 'Ingreso', 'A Gestion de Parametros'),
(3948, 1, 146, '2021-07-20 14:00:21', 'Ingreso', 'A crear Reunion'),
(3949, 1, 7, '2021-07-20 14:00:27', 'Ingreso', 'A Gestion de Parametros'),
(3950, 1, 146, '2021-07-20 14:00:58', 'Ingreso', 'A crear Reunion'),
(3951, 1, 146, '2021-07-20 14:01:17', 'Ingreso', 'A crear Reunion'),
(3952, 1, 146, '2021-07-20 14:08:00', 'Ingreso', 'A crear Reunion'),
(3953, 1, 146, '2021-07-20 14:08:34', 'Ingreso', 'A crear Reunion'),
(3954, 1, 146, '2021-07-20 14:09:03', 'Ingreso', 'A crear Reunion'),
(3955, 1, 146, '2021-07-20 14:09:24', 'Ingreso', 'A crear Reunion'),
(3956, 1, 146, '2021-07-20 14:09:38', 'Ingreso', 'A crear Reunion'),
(3957, 1, 7, '2021-07-21 09:50:03', 'Ingreso', 'A Gestion de Parametros'),
(3958, 1, 7, '2021-07-21 09:51:13', 'Ingreso', 'A Gestion de Parametros'),
(3959, 1, 146, '2021-07-21 09:55:17', 'Ingreso', 'A crear Reunion'),
(3960, 1, 146, '2021-07-21 09:55:59', 'Ingreso', 'A crear Reunion'),
(3961, 1, 156, '2021-07-21 09:56:53', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3962, 1, 156, '2021-07-21 09:57:08', 'Ingreso', 'A Mantenimiento Estado Acta'),
(3963, 1, 7, '2021-07-21 09:58:04', 'Ingreso', 'A Gestion de Parametros'),
(3964, 1, 146, '2021-07-21 09:58:50', 'Ingreso', 'A crear Reunion'),
(3965, 1, 7, '2021-07-21 10:16:36', 'Ingreso', 'A Gestion de Parametros'),
(3966, 1, 103, '2021-07-21 10:17:06', 'Ingreso', 'A Lista de Reuniones'),
(3967, 1, 103, '2021-07-21 10:17:47', 'Ingreso', 'A Lista de Reuniones'),
(3968, 1, 103, '2021-07-21 10:19:39', 'Ingreso', 'A Lista de Reuniones'),
(3969, 1, 146, '2021-07-21 10:19:44', 'Ingreso', 'A crear Reunion'),
(3970, 1, 7, '2021-07-21 10:20:15', 'Ingreso', 'A Gestion de Parametros'),
(3971, 1, 146, '2021-07-21 10:20:18', 'Ingreso', 'A crear Reunion'),
(3972, 1, 103, '2021-07-21 10:20:50', 'Ingreso', 'A Lista de Reuniones'),
(3973, 1, 103, '2021-07-21 10:21:27', 'Ingreso', 'A Lista de Reuniones'),
(3974, 1, 146, '2021-07-21 11:31:13', 'Ingreso', 'A crear Reunion'),
(3975, 1, 146, '2021-07-21 11:31:14', 'Ingreso', 'A crear Reunion'),
(3976, 1, 146, '2021-07-21 11:34:48', 'Ingreso', 'A crear Reunion'),
(3977, 1, 146, '2021-07-21 11:39:42', 'Ingreso', 'A crear Reunion'),
(3978, 1, 146, '2021-07-21 11:40:07', 'Ingreso', 'A crear Reunion'),
(3979, 1, 146, '2021-07-21 11:40:13', 'Ingreso', 'A crear Reunion'),
(3980, 1, 146, '2021-07-21 11:40:41', 'Ingreso', 'A crear Reunion'),
(3981, 1, 146, '2021-07-21 11:41:20', 'Ingreso', 'A crear Reunion'),
(3982, 1, 146, '2021-07-21 11:41:30', 'Ingreso', 'A crear Reunion'),
(3983, 1, 146, '2021-07-21 11:41:41', 'Ingreso', 'A crear Reunion'),
(3984, 1, 146, '2021-07-21 11:41:47', 'Ingreso', 'A crear Reunion'),
(3985, 1, 146, '2021-07-21 11:42:11', 'Ingreso', 'A crear Reunion'),
(3986, 1, 146, '2021-07-21 11:46:20', 'Ingreso', 'A crear Reunion'),
(3987, 1, 146, '2021-07-21 11:48:54', 'Ingreso', 'A crear Reunion'),
(3988, 1, 146, '2021-07-21 11:50:58', 'Ingreso', 'A crear Reunion'),
(3989, 1, 146, '2021-07-21 11:51:17', 'Ingreso', 'A crear Reunion'),
(3990, 1, 146, '2021-07-21 11:53:44', 'Ingreso', 'A crear Reunion'),
(3991, 1, 146, '2021-07-21 11:53:55', 'Ingreso', 'A crear Reunion'),
(3992, 1, 146, '2021-07-21 11:54:30', 'Ingreso', 'A crear Reunion'),
(3993, 1, 146, '2021-07-21 11:54:59', 'Ingreso', 'A crear Reunion'),
(3994, 1, 7, '2021-07-21 11:55:53', 'Ingreso', 'A Gestion de Parametros'),
(3995, 1, 151, '2021-07-21 11:55:58', 'Ingreso', 'A crear Acuerdo'),
(3996, 1, 146, '2021-07-21 11:56:58', 'Ingreso', 'A crear Reunion'),
(3997, 1, 146, '2021-07-21 11:57:30', 'Ingreso', 'A crear Reunion'),
(3998, 1, 146, '2021-07-21 11:58:14', 'Ingreso', 'A crear Reunion'),
(3999, 1, 146, '2021-07-21 12:04:32', 'Ingreso', 'A crear Reunion'),
(4000, 1, 146, '2021-07-21 12:05:56', 'Ingreso', 'A crear Reunion'),
(4001, 1, 146, '2021-07-21 12:06:21', 'Ingreso', 'A crear Reunion'),
(4002, 1, 146, '2021-07-21 12:09:14', 'Ingreso', 'A crear Reunion'),
(4003, 1, 146, '2021-07-21 12:09:49', 'Ingreso', 'A crear Reunion'),
(4004, 1, 146, '2021-07-21 12:10:48', 'Ingreso', 'A crear Reunion'),
(4005, 1, 146, '2021-07-21 12:11:19', 'Ingreso', 'A crear Reunion'),
(4006, 1, 146, '2021-07-21 12:13:22', 'Ingreso', 'A crear Reunion'),
(4007, 1, 146, '2021-07-21 12:14:08', 'Ingreso', 'A crear Reunion'),
(4008, 1, 146, '2021-07-21 12:16:30', 'Ingreso', 'A crear Reunion'),
(4009, 1, 146, '2021-07-21 12:22:38', 'Ingreso', 'A crear Reunion'),
(4010, 1, 146, '2021-07-21 12:23:08', 'Ingreso', 'A crear Reunion'),
(4011, 1, 146, '2021-07-21 12:25:08', 'Ingreso', 'A crear Reunion'),
(4012, 1, 146, '2021-07-21 12:25:41', 'Ingreso', 'A crear Reunion'),
(4013, 1, 146, '2021-07-21 12:25:57', 'Ingreso', 'A crear Reunion'),
(4014, 1, 146, '2021-07-21 12:26:16', 'Ingreso', 'A crear Reunion'),
(4015, 1, 146, '2021-07-21 12:26:46', 'Ingreso', 'A crear Reunion'),
(4016, 1, 146, '2021-07-21 12:26:55', 'Ingreso', 'A crear Reunion'),
(4017, 1, 146, '2021-07-21 12:27:03', 'Ingreso', 'A crear Reunion'),
(4018, 1, 146, '2021-07-21 12:29:02', 'Ingreso', 'A crear Reunion'),
(4019, 1, 146, '2021-07-21 12:30:46', 'Ingreso', 'A crear Reunion'),
(4020, 1, 146, '2021-07-21 12:30:57', 'Ingreso', 'A crear Reunion'),
(4021, 1, 146, '2021-07-21 12:31:57', 'Ingreso', 'A crear Reunion'),
(4022, 1, 146, '2021-07-21 12:33:33', 'Ingreso', 'A crear Reunion'),
(4023, 1, 146, '2021-07-21 12:34:23', 'Ingreso', 'A crear Reunion'),
(4024, 1, 146, '2021-07-21 12:36:48', 'Ingreso', 'A crear Reunion'),
(4025, 1, 146, '2021-07-21 12:37:36', 'Ingreso', 'A crear Reunion'),
(4026, 1, 146, '2021-07-21 12:54:58', 'Ingreso', 'A crear Reunion'),
(4027, 1, 146, '2021-07-21 12:55:11', 'Ingreso', 'A crear Reunion'),
(4028, 1, 146, '2021-07-21 12:55:29', 'Ingreso', 'A crear Reunion'),
(4029, 1, 146, '2021-07-21 12:55:45', 'Ingreso', 'A crear Reunion'),
(4030, 1, 146, '2021-07-21 12:56:49', 'Ingreso', 'A crear Reunion'),
(4031, 1, 146, '2021-07-21 12:57:05', 'Ingreso', 'A crear Reunion'),
(4032, 1, 146, '2021-07-21 13:10:37', 'Ingreso', 'A crear Reunion'),
(4033, 1, 146, '2021-07-21 13:10:51', 'Ingreso', 'A crear Reunion'),
(4034, 1, 146, '2021-07-21 13:11:15', 'Ingreso', 'A crear Reunion'),
(4035, 1, 146, '2021-07-21 13:13:59', 'Ingreso', 'A crear Reunion'),
(4036, 1, 146, '2021-07-21 13:14:25', 'Ingreso', 'A crear Reunion'),
(4037, 1, 146, '2021-07-21 13:16:10', 'Ingreso', 'A crear Reunion'),
(4038, 1, 146, '2021-07-21 13:16:44', 'Ingreso', 'A crear Reunion'),
(4039, 1, 146, '2021-07-21 13:17:14', 'Ingreso', 'A crear Reunion'),
(4040, 1, 146, '2021-07-21 13:17:30', 'Ingreso', 'A crear Reunion'),
(4041, 1, 7, '2021-07-21 13:19:16', 'Ingreso', 'A Gestion de Parametros'),
(4042, 1, 146, '2021-07-21 13:19:18', 'Ingreso', 'A crear Reunion'),
(4043, 1, 7, '2021-07-21 13:20:02', 'Ingreso', 'A Gestion de Parametros'),
(4044, 1, 146, '2021-07-21 13:20:05', 'Ingreso', 'A crear Reunion'),
(4045, 1, 146, '2021-07-21 13:20:13', 'Ingreso', 'A crear Reunion'),
(4046, 1, 7, '2021-07-21 13:20:16', 'Ingreso', 'A Gestion de Parametros'),
(4047, 1, 146, '2021-07-21 13:20:20', 'Ingreso', 'A crear Reunion'),
(4048, 1, 146, '2021-07-21 13:20:23', 'Ingreso', 'A crear Reunion'),
(4049, 1, 7, '2021-07-21 13:20:27', 'Ingreso', 'A Gestion de Parametros'),
(4050, 1, 146, '2021-07-21 13:20:29', 'Ingreso', 'A crear Reunion'),
(4051, 1, 7, '2021-07-21 13:20:42', 'Ingreso', 'A Gestion de Parametros'),
(4052, 1, 146, '2021-07-21 13:20:44', 'Ingreso', 'A crear Reunion'),
(4053, 1, 146, '2021-07-21 13:20:55', 'Ingreso', 'A crear Reunion'),
(4054, 1, 7, '2021-07-21 13:21:04', 'Ingreso', 'A Gestion de Parametros'),
(4055, 1, 146, '2021-07-21 13:21:07', 'Ingreso', 'A crear Reunion'),
(4056, 1, 7, '2021-07-21 13:21:15', 'Ingreso', 'A Gestion de Parametros'),
(4057, 1, 146, '2021-07-21 13:21:17', 'Ingreso', 'A crear Reunion'),
(4058, 1, 7, '2021-07-21 13:21:24', 'Ingreso', 'A Gestion de Parametros'),
(4059, 1, 146, '2021-07-21 13:21:27', 'Ingreso', 'A crear Reunion'),
(4060, 1, 7, '2021-07-21 13:21:54', 'Ingreso', 'A Gestion de Parametros'),
(4061, 1, 146, '2021-07-21 13:21:57', 'Ingreso', 'A crear Reunion'),
(4062, 1, 7, '2021-07-21 13:22:01', 'Ingreso', 'A Gestion de Parametros'),
(4063, 1, 146, '2021-07-21 13:22:04', 'Ingreso', 'A crear Reunion'),
(4064, 1, 7, '2021-07-21 13:22:28', 'Ingreso', 'A Gestion de Parametros'),
(4065, 1, 146, '2021-07-21 13:22:31', 'Ingreso', 'A crear Reunion'),
(4066, 1, 7, '2021-07-21 13:23:38', 'Ingreso', 'A Gestion de Parametros'),
(4067, 1, 146, '2021-07-21 13:23:42', 'Ingreso', 'A crear Reunion'),
(4068, 1, 146, '2021-07-21 13:25:02', 'Ingreso', 'A crear Reunion'),
(4069, 1, 146, '2021-07-21 13:25:14', 'Ingreso', 'A crear Reunion'),
(4070, 1, 7, '2021-07-21 13:25:38', 'Ingreso', 'A Gestion de Parametros'),
(4071, 1, 146, '2021-07-21 13:25:48', 'Ingreso', 'A crear Reunion'),
(4072, 1, 146, '2021-07-21 13:26:27', 'Ingreso', 'A crear Reunion'),
(4073, 1, 7, '2021-07-21 13:26:29', 'Ingreso', 'A Gestion de Parametros'),
(4074, 1, 146, '2021-07-21 13:26:31', 'Ingreso', 'A crear Reunion'),
(4075, 1, 146, '2021-07-21 13:32:35', 'Ingreso', 'A crear Reunion'),
(4076, 1, 146, '2021-07-21 13:34:37', 'Ingreso', 'A crear Reunion'),
(4077, 1, 146, '2021-07-21 13:35:16', 'Ingreso', 'A crear Reunion'),
(4078, 1, 146, '2021-07-21 13:35:26', 'Ingreso', 'A crear Reunion'),
(4079, 1, 146, '2021-07-21 13:35:33', 'Ingreso', 'A crear Reunion'),
(4080, 1, 146, '2021-07-21 13:36:03', 'Ingreso', 'A crear Reunion'),
(4081, 1, 146, '2021-07-21 13:36:33', 'Ingreso', 'A crear Reunion'),
(4082, 1, 146, '2021-07-21 13:37:05', 'Ingreso', 'A crear Reunion'),
(4083, 1, 146, '2021-07-21 13:37:28', 'Ingreso', 'A crear Reunion'),
(4084, 1, 146, '2021-07-21 13:52:52', 'Ingreso', 'A crear Reunion'),
(4085, 1, 146, '2021-07-21 13:58:53', 'Ingreso', 'A crear Reunion'),
(4086, 1, 146, '2021-07-21 13:59:21', 'Ingreso', 'A crear Reunion'),
(4087, 1, 146, '2021-07-21 13:59:35', 'Ingreso', 'A crear Reunion'),
(4088, 1, 146, '2021-07-21 14:00:16', 'Ingreso', 'A crear Reunion'),
(4089, 1, 146, '2021-07-21 14:01:04', 'Ingreso', 'A crear Reunion'),
(4090, 1, 146, '2021-07-21 14:01:16', 'Ingreso', 'A crear Reunion'),
(4091, 1, 146, '2021-07-21 14:01:43', 'Ingreso', 'A crear Reunion'),
(4092, 1, 146, '2021-07-21 14:02:04', 'Ingreso', 'A crear Reunion'),
(4093, 1, 146, '2021-07-21 14:02:15', 'Ingreso', 'A crear Reunion'),
(4094, 1, 146, '2021-07-21 14:02:37', 'Ingreso', 'A crear Reunion'),
(4095, 1, 146, '2021-07-21 14:02:53', 'Ingreso', 'A crear Reunion'),
(4096, 1, 146, '2021-07-21 14:03:54', 'Ingreso', 'A crear Reunion'),
(4097, 1, 7, '2021-07-21 14:04:42', 'Ingreso', 'A Gestion de Parametros'),
(4098, 1, 146, '2021-07-21 14:04:44', 'Ingreso', 'A crear Reunion'),
(4099, 1, 146, '2021-07-21 14:04:59', 'Ingreso', 'A crear Reunion'),
(4100, 1, 7, '2021-07-21 14:05:00', 'Ingreso', 'A Gestion de Parametros'),
(4101, 1, 146, '2021-07-21 14:05:02', 'Ingreso', 'A crear Reunion'),
(4102, 1, 7, '2021-07-21 14:14:34', 'Ingreso', 'A Gestion de Parametros'),
(4103, 1, 146, '2021-07-21 15:00:16', 'Ingreso', 'A crear Reunion'),
(4104, 1, 146, '2021-07-21 15:05:46', 'Ingreso', 'A crear Reunion'),
(4105, 1, 7, '2021-07-21 15:05:46', 'Ingreso', 'A Gestion de Parametros'),
(4106, 1, 7, '2021-07-21 15:05:48', 'Ingreso', 'A Gestion de Parametros'),
(4107, 1, 146, '2021-07-21 15:05:55', 'Ingreso', 'A crear Reunion'),
(4108, 1, 146, '2021-07-21 15:08:48', 'Ingreso', 'A crear Reunion'),
(4109, 1, 7, '2021-07-21 15:19:34', 'Ingreso', 'A Gestion de Parametros'),
(4110, 1, 146, '2021-07-21 15:19:36', 'Ingreso', 'A crear Reunion'),
(4111, 1, 7, '2021-07-21 15:19:38', 'Ingreso', 'A Gestion de Parametros'),
(4112, 1, 146, '2021-07-21 15:19:40', 'Ingreso', 'A crear Reunion'),
(4113, 1, 146, '2021-07-21 15:22:47', 'Ingreso', 'A crear Reunion'),
(4114, 1, 146, '2021-07-21 15:22:50', 'Ingreso', 'A crear Reunion'),
(4115, 1, 146, '2021-07-21 15:25:24', 'Ingreso', 'A crear Reunion'),
(4116, 1, 7, '2021-07-21 15:25:24', 'Ingreso', 'A Gestion de Parametros'),
(4117, 1, 146, '2021-07-21 15:25:27', 'Ingreso', 'A crear Reunion'),
(4118, 1, 146, '2021-07-21 15:25:33', 'Ingreso', 'A crear Reunion'),
(4119, 1, 146, '2021-07-21 15:29:44', 'Ingreso', 'A crear Reunion'),
(4120, 1, 146, '2021-07-21 15:29:58', 'Ingreso', 'A crear Reunion'),
(4121, 1, 7, '2021-07-21 15:31:51', 'Ingreso', 'A Gestion de Parametros'),
(4122, 1, 146, '2021-07-21 15:31:53', 'Ingreso', 'A crear Reunion'),
(4123, 1, 146, '2021-07-21 15:32:04', 'Ingreso', 'A crear Reunion'),
(4124, 1, 146, '2021-07-21 15:32:43', 'Ingreso', 'A crear Reunion'),
(4125, 1, 146, '2021-07-21 15:33:05', 'Ingreso', 'A crear Reunion'),
(4126, 1, 146, '2021-07-21 15:35:25', 'Ingreso', 'A crear Reunion'),
(4127, 1, 146, '2021-07-21 15:35:46', 'Ingreso', 'A crear Reunion'),
(4128, 1, 146, '2021-07-21 15:37:24', 'Ingreso', 'A crear Reunion'),
(4129, 1, 146, '2021-07-21 15:37:48', 'Ingreso', 'A crear Reunion'),
(4130, 1, 146, '2021-07-21 15:38:04', 'Ingreso', 'A crear Reunion'),
(4131, 1, 146, '2021-07-21 15:38:33', 'Ingreso', 'A crear Reunion'),
(4132, 1, 146, '2021-07-21 15:38:43', 'Ingreso', 'A crear Reunion'),
(4133, 1, 146, '2021-07-21 15:38:52', 'Ingreso', 'A crear Reunion'),
(4134, 1, 146, '2021-07-21 15:39:22', 'Ingreso', 'A crear Reunion'),
(4135, 1, 146, '2021-07-21 15:39:35', 'Ingreso', 'A crear Reunion'),
(4136, 1, 146, '2021-07-21 15:39:56', 'Ingreso', 'A crear Reunion'),
(4137, 1, 146, '2021-07-21 15:40:41', 'Ingreso', 'A crear Reunion'),
(4138, 1, 146, '2021-07-21 15:41:11', 'Ingreso', 'A crear Reunion'),
(4139, 1, 146, '2021-07-21 15:41:45', 'Ingreso', 'A crear Reunion'),
(4140, 1, 146, '2021-07-21 15:42:07', 'Ingreso', 'A crear Reunion'),
(4141, 1, 146, '2021-07-21 15:42:23', 'Ingreso', 'A crear Reunion'),
(4142, 1, 146, '2021-07-21 15:42:54', 'Ingreso', 'A crear Reunion'),
(4143, 1, 146, '2021-07-21 15:43:58', 'Ingreso', 'A crear Reunion'),
(4144, 1, 7, '2021-07-21 15:43:58', 'Ingreso', 'A Gestion de Parametros'),
(4145, 1, 146, '2021-07-21 15:44:00', 'Ingreso', 'A crear Reunion'),
(4146, 1, 7, '2021-07-21 15:44:02', 'Ingreso', 'A Gestion de Parametros'),
(4147, 1, 146, '2021-07-21 15:44:05', 'Ingreso', 'A crear Reunion'),
(4148, 1, 146, '2021-07-21 15:58:34', 'Ingreso', 'A crear Reunion'),
(4149, 1, 146, '2021-07-21 16:01:00', 'Ingreso', 'A crear Reunion'),
(4150, 1, 7, '2021-07-21 16:01:43', 'Ingreso', 'A Gestion de Parametros'),
(4151, 1, 146, '2021-07-21 16:01:45', 'Ingreso', 'A crear Reunion'),
(4152, 1, 146, '2021-07-21 16:01:53', 'Ingreso', 'A crear Reunion'),
(4153, 1, 7, '2021-07-21 16:01:56', 'Ingreso', 'A Gestion de Parametros'),
(4154, 1, 146, '2021-07-21 16:02:00', 'Ingreso', 'A crear Reunion'),
(4155, 1, 7, '2021-07-21 16:02:08', 'Ingreso', 'A Gestion de Parametros'),
(4156, 1, 146, '2021-07-21 16:02:13', 'Ingreso', 'A crear Reunion'),
(4157, 1, 146, '2021-07-21 16:02:28', 'Ingreso', 'A crear Reunion'),
(4158, 1, 103, '2021-07-21 19:18:30', 'Ingreso', 'A Lista de Reuniones'),
(4159, 1, 103, '2021-07-21 19:19:03', 'Ingreso', 'A Lista de Reuniones'),
(4160, 1, 7, '2021-07-21 19:19:39', 'Ingreso', 'A Gestion de Parametros'),
(4161, 1, 146, '2021-07-21 19:19:42', 'Ingreso', 'A crear Reunion'),
(4162, 1, 146, '2021-07-21 19:20:24', 'Ingreso', 'A crear Reunion'),
(4163, 1, 146, '2021-07-21 19:20:51', 'Ingreso', 'A crear Reunion'),
(4164, 1, 146, '2021-07-21 19:21:07', 'Ingreso', 'A crear Reunion'),
(4165, 1, 7, '2021-07-21 19:21:39', 'Ingreso', 'A Gestion de Parametros'),
(4166, 1, 151, '2021-07-21 19:22:03', 'Ingreso', 'A crear Acuerdo'),
(4167, 1, 103, '2021-07-21 19:28:48', 'Ingreso', 'A Lista de Reuniones'),
(4168, 1, 146, '2021-07-21 19:28:52', 'Ingreso', 'A crear Reunion'),
(4169, 1, 7, '2021-07-21 19:29:15', 'Ingreso', 'A Gestion de Parametros'),
(4170, 1, 146, '2021-07-21 19:29:18', 'Ingreso', 'A crear Reunion'),
(4171, 1, 146, '2021-07-21 19:29:38', 'Ingreso', 'A crear Reunion'),
(4172, 1, 103, '2021-07-21 19:30:01', 'Ingreso', 'A Lista de Reuniones'),
(4173, 1, 103, '2021-07-21 19:30:36', 'Ingreso', 'A Lista de Reuniones'),
(4174, 1, 103, '2021-07-21 19:30:57', 'Ingreso', 'A Lista de Reuniones'),
(4175, 1, 146, '2021-07-21 19:31:31', 'Ingreso', 'A crear Reunion'),
(4176, 1, 103, '2021-07-21 19:31:48', 'Ingreso', 'A Lista de Reuniones'),
(4177, 1, 7, '2021-07-21 19:33:19', 'Ingreso', 'A Gestion de Parametros'),
(4178, 1, 146, '2021-07-22 10:49:31', 'Ingreso', 'A crear Reunion'),
(4179, 1, 146, '2021-07-22 10:51:52', 'Ingreso', 'A crear Reunion'),
(4180, 1, 146, '2021-07-22 10:52:42', 'Ingreso', 'A crear Reunion'),
(4181, 1, 146, '2021-07-22 10:53:36', 'Ingreso', 'A crear Reunion'),
(4182, 1, 146, '2021-07-22 10:55:22', 'Ingreso', 'A crear Reunion'),
(4183, 1, 146, '2021-07-22 10:56:20', 'Ingreso', 'A crear Reunion'),
(4184, 1, 146, '2021-07-22 10:57:37', 'Ingreso', 'A crear Reunion');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(4185, 1, 146, '2021-07-22 10:58:14', 'Ingreso', 'A crear Reunion'),
(4186, 1, 146, '2021-07-22 10:58:48', 'Ingreso', 'A crear Reunion'),
(4187, 1, 146, '2021-07-22 10:59:57', 'Ingreso', 'A crear Reunion'),
(4188, 1, 146, '2021-07-22 11:01:49', 'Ingreso', 'A crear Reunion'),
(4189, 1, 146, '2021-07-22 11:12:53', 'Ingreso', 'A crear Reunion'),
(4190, 1, 146, '2021-07-22 11:14:04', 'Ingreso', 'A crear Reunion'),
(4191, 1, 146, '2021-07-22 11:28:27', 'Ingreso', 'A crear Reunion'),
(4192, 1, 146, '2021-07-22 11:28:50', 'Ingreso', 'A crear Reunion'),
(4193, 1, 146, '2021-07-22 11:29:47', 'Ingreso', 'A crear Reunion'),
(4194, 1, 146, '2021-07-22 11:33:04', 'Ingreso', 'A crear Reunion'),
(4195, 1, 146, '2021-07-22 11:34:00', 'Ingreso', 'A crear Reunion'),
(4196, 1, 146, '2021-07-22 12:00:51', 'Ingreso', 'A crear Reunion'),
(4197, 1, 146, '2021-07-22 12:01:12', 'Ingreso', 'A crear Reunion'),
(4198, 1, 146, '2021-07-22 12:01:30', 'Ingreso', 'A crear Reunion'),
(4199, 1, 146, '2021-07-22 12:01:44', 'Ingreso', 'A crear Reunion'),
(4200, 1, 146, '2021-07-22 12:03:37', 'Ingreso', 'A crear Reunion'),
(4201, 1, 146, '2021-07-22 12:04:14', 'Ingreso', 'A crear Reunion'),
(4202, 1, 146, '2021-07-22 12:09:49', 'Ingreso', 'A crear Reunion'),
(4203, 1, 146, '2021-07-22 12:10:53', 'Ingreso', 'A crear Reunion'),
(4204, 1, 146, '2021-07-22 12:11:11', 'Ingreso', 'A crear Reunion'),
(4205, 1, 146, '2021-07-22 12:12:13', 'Ingreso', 'A crear Reunion'),
(4206, 1, 146, '2021-07-22 12:12:28', 'Ingreso', 'A crear Reunion'),
(4207, 1, 146, '2021-07-22 12:12:42', 'Ingreso', 'A crear Reunion'),
(4208, 1, 146, '2021-07-22 12:13:01', 'Ingreso', 'A crear Reunion'),
(4209, 1, 146, '2021-07-22 12:17:37', 'Ingreso', 'A crear Reunion'),
(4210, 1, 146, '2021-07-22 12:19:48', 'Ingreso', 'A crear Reunion'),
(4211, 1, 146, '2021-07-22 12:22:20', 'Ingreso', 'A crear Reunion'),
(4212, 1, 146, '2021-07-22 12:22:37', 'Ingreso', 'A crear Reunion'),
(4213, 1, 146, '2021-07-22 12:27:28', 'Ingreso', 'A crear Reunion'),
(4214, 1, 146, '2021-07-22 12:28:03', 'Ingreso', 'A crear Reunion'),
(4215, 1, 146, '2021-07-22 12:33:20', 'Ingreso', 'A crear Reunion'),
(4216, 1, 146, '2021-07-22 12:35:10', 'Ingreso', 'A crear Reunion'),
(4217, 1, 7, '2021-07-22 12:48:22', 'Ingreso', 'A Gestion de Parametros'),
(4218, 1, 146, '2021-07-22 12:51:08', 'Ingreso', 'A crear Reunion'),
(4219, 1, 146, '2021-07-22 12:52:35', 'Ingreso', 'A crear Reunion'),
(4220, 1, 146, '2021-07-22 12:53:19', 'Ingreso', 'A crear Reunion'),
(4221, 1, 146, '2021-07-22 12:55:57', 'Ingreso', 'A crear Reunion'),
(4222, 1, 146, '2021-07-22 14:00:36', 'Ingreso', 'A crear Reunion'),
(4223, 1, 146, '2021-07-22 14:01:29', 'Ingreso', 'A crear Reunion'),
(4224, 1, 146, '2021-07-22 14:02:56', 'Ingreso', 'A crear Reunion'),
(4225, 1, 146, '2021-07-22 14:05:05', 'Ingreso', 'A crear Reunion'),
(4226, 1, 146, '2021-07-22 14:05:56', 'Ingreso', 'A crear Reunion'),
(4227, 1, 146, '2021-07-22 14:06:46', 'Ingreso', 'A crear Reunion'),
(4228, 1, 146, '2021-07-22 14:08:28', 'Ingreso', 'A crear Reunion'),
(4229, 1, 146, '2021-07-22 14:09:13', 'Ingreso', 'A crear Reunion'),
(4230, 1, 146, '2021-07-22 14:09:27', 'Ingreso', 'A crear Reunion'),
(4231, 1, 146, '2021-07-22 14:11:45', 'Ingreso', 'A crear Reunion'),
(4232, 1, 146, '2021-07-22 14:12:26', 'Ingreso', 'A crear Reunion'),
(4233, 1, 146, '2021-07-22 14:13:28', 'Ingreso', 'A crear Reunion'),
(4234, 1, 146, '2021-07-22 14:14:16', 'Ingreso', 'A crear Reunion'),
(4235, 1, 146, '2021-07-22 14:14:19', 'Ingreso', 'A crear Reunion'),
(4236, 1, 146, '2021-07-22 14:15:00', 'Ingreso', 'A crear Reunion'),
(4237, 1, 146, '2021-07-22 14:17:25', 'Ingreso', 'A crear Reunion'),
(4238, 1, 146, '2021-07-22 14:17:37', 'Ingreso', 'A crear Reunion'),
(4239, 1, 146, '2021-07-22 14:19:27', 'Ingreso', 'A crear Reunion'),
(4240, 1, 146, '2021-07-22 14:20:24', 'Ingreso', 'A crear Reunion'),
(4241, 1, 146, '2021-07-22 14:20:40', 'Ingreso', 'A crear Reunion'),
(4242, 1, 146, '2021-07-22 14:22:07', 'Ingreso', 'A crear Reunion'),
(4243, 1, 146, '2021-07-22 14:22:48', 'Ingreso', 'A crear Reunion'),
(4244, 1, 146, '2021-07-22 14:24:10', 'Ingreso', 'A crear Reunion'),
(4245, 1, 146, '2021-07-22 14:26:59', 'Ingreso', 'A crear Reunion'),
(4246, 1, 146, '2021-07-22 15:31:15', 'Ingreso', 'A crear Reunion'),
(4247, 1, 146, '2021-07-22 15:34:17', 'Ingreso', 'A crear Reunion'),
(4248, 1, 146, '2021-07-22 15:35:33', 'Ingreso', 'A crear Reunion'),
(4249, 1, 146, '2021-07-22 15:35:54', 'Ingreso', 'A crear Reunion'),
(4250, 1, 146, '2021-07-22 15:38:00', 'Ingreso', 'A crear Reunion'),
(4251, 1, 146, '2021-07-22 15:44:19', 'Ingreso', 'A crear Reunion'),
(4252, 1, 146, '2021-07-22 15:44:31', 'Ingreso', 'A crear Reunion'),
(4253, 1, 103, '2021-07-22 15:46:11', 'Ingreso', 'A Lista de Reuniones'),
(4254, 1, 103, '2021-07-22 15:46:57', 'Ingreso', 'A Lista de Reuniones'),
(4255, 1, 103, '2021-07-22 15:47:24', 'Ingreso', 'A Lista de Reuniones'),
(4256, 1, 103, '2021-07-22 15:48:28', 'Ingreso', 'A Lista de Reuniones'),
(4257, 1, 103, '2021-07-22 15:49:00', 'Ingreso', 'A Lista de Reuniones'),
(4258, 1, 103, '2021-07-22 15:49:09', 'Ingreso', 'A Lista de Reuniones'),
(4259, 1, 103, '2021-07-22 15:49:54', 'Ingreso', 'A Lista de Reuniones'),
(4260, 1, 103, '2021-07-22 15:49:59', 'Ingreso', 'A Lista de Reuniones'),
(4261, 1, 103, '2021-07-22 15:50:27', 'Ingreso', 'A Lista de Reuniones'),
(4262, 1, 103, '2021-07-22 15:50:29', 'Ingreso', 'A Lista de Reuniones'),
(4263, 1, 103, '2021-07-22 15:50:31', 'Ingreso', 'A Lista de Reuniones'),
(4264, 1, 103, '2021-07-22 15:57:02', 'Ingreso', 'A Lista de Reuniones'),
(4265, 1, 103, '2021-07-22 15:57:26', 'Ingreso', 'A Lista de Reuniones'),
(4266, 1, 103, '2021-07-22 15:57:44', 'Ingreso', 'A Lista de Reuniones'),
(4267, 1, 103, '2021-07-22 15:57:56', 'Ingreso', 'A Lista de Reuniones'),
(4268, 1, 103, '2021-07-22 15:58:20', 'Ingreso', 'A Lista de Reuniones'),
(4269, 1, 103, '2021-07-22 15:58:56', 'Ingreso', 'A Lista de Reuniones'),
(4270, 1, 103, '2021-07-22 15:59:45', 'Ingreso', 'A Lista de Reuniones'),
(4271, 1, 103, '2021-07-22 16:00:13', 'Ingreso', 'A Lista de Reuniones'),
(4272, 1, 103, '2021-07-22 16:00:21', 'Ingreso', 'A Lista de Reuniones'),
(4273, 1, 2, '2021-07-22 16:00:36', 'Ingreso', 'A Gestion de Preguntas'),
(4274, 1, 2, '2021-07-22 16:01:02', 'Ingreso', 'A Gestion de Preguntas'),
(4275, 1, 103, '2021-07-22 16:01:08', 'Ingreso', 'A Lista de Reuniones'),
(4276, 1, 103, '2021-07-22 16:01:44', 'Ingreso', 'A Lista de Reuniones'),
(4277, 1, 103, '2021-07-22 16:08:48', 'Ingreso', 'A Lista de Reuniones'),
(4278, 1, 103, '2021-07-22 16:09:00', 'Ingreso', 'A Lista de Reuniones'),
(4279, 1, 103, '2021-07-22 16:10:06', 'Ingreso', 'A Lista de Reuniones'),
(4280, 1, 103, '2021-07-22 16:10:12', 'Ingreso', 'A Lista de Reuniones'),
(4281, 1, 103, '2021-07-22 16:10:40', 'Ingreso', 'A Lista de Reuniones'),
(4282, 1, 7, '2021-07-22 16:10:49', 'Ingreso', 'A Gestion de Parametros'),
(4283, 1, 156, '2021-07-22 16:11:10', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4284, 1, 156, '2021-07-22 16:12:33', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4285, 1, 7, '2021-07-22 16:14:18', 'Ingreso', 'A Gestion de Parametros'),
(4286, 1, 146, '2021-07-22 16:14:59', 'Ingreso', 'A crear Reunion'),
(4287, 1, 103, '2021-07-22 16:16:43', 'Ingreso', 'A Lista de Reuniones'),
(4288, 1, 7, '2021-07-22 16:17:24', 'Ingreso', 'A Gestion de Parametros'),
(4289, 1, 103, '2021-07-22 16:17:35', 'Ingreso', 'A Lista de Reuniones'),
(4290, 1, 103, '2021-07-22 16:17:49', 'Ingreso', 'A Lista de Reuniones'),
(4291, 1, 7, '2021-07-22 16:17:58', 'Ingreso', 'A Gestion de Parametros'),
(4292, 1, 7, '2021-07-22 16:18:35', 'Ingreso', 'A Gestion de Parametros'),
(4293, 1, 103, '2021-07-22 16:18:45', 'Ingreso', 'A Lista de Reuniones'),
(4294, 1, 151, '2021-07-22 16:18:56', 'Ingreso', 'A crear Acuerdo'),
(4295, 1, 103, '2021-07-22 16:19:28', 'Ingreso', 'A Lista de Reuniones'),
(4296, 1, 103, '2021-07-22 16:19:38', 'Ingreso', 'A Lista de Reuniones'),
(4297, 1, 103, '2021-07-22 16:19:46', 'Ingreso', 'A Lista de Reuniones'),
(4298, 1, 7, '2021-07-22 16:30:03', 'Ingreso', 'A Gestion de Parametros'),
(4299, 1, 7, '2021-07-22 16:30:38', 'Ingreso', 'A Gestion de Parametros'),
(4300, 1, 7, '2021-07-22 16:31:40', 'Ingreso', 'A Gestion de Parametros'),
(4301, 1, 7, '2021-07-22 16:47:44', 'Ingreso', 'A Gestion de Parametros'),
(4302, 1, 7, '2021-07-22 16:48:14', 'Ingreso', 'A Gestion de Parametros'),
(4303, 1, 7, '2021-07-22 16:48:28', 'Ingreso', 'A Gestion de Parametros'),
(4304, 1, 7, '2021-07-22 16:48:39', 'Ingreso', 'A Gestion de Parametros'),
(4305, 1, 7, '2021-07-22 16:48:58', 'Ingreso', 'A Gestion de Parametros'),
(4306, 1, 7, '2021-07-22 16:49:08', 'Ingreso', 'A Gestion de Parametros'),
(4307, 1, 7, '2021-07-22 16:52:26', 'Ingreso', 'A Gestion de Parametros'),
(4308, 1, 7, '2021-07-22 16:53:13', 'Ingreso', 'A Gestion de Parametros'),
(4309, 1, 7, '2021-07-22 16:54:01', 'Ingreso', 'A Gestion de Parametros'),
(4310, 1, 7, '2021-07-22 16:54:11', 'Ingreso', 'A Gestion de Parametros'),
(4311, 1, 7, '2021-07-22 16:54:27', 'Ingreso', 'A Gestion de Parametros'),
(4312, 1, 7, '2021-07-22 16:54:48', 'Ingreso', 'A Gestion de Parametros'),
(4313, 1, 7, '2021-07-22 16:55:16', 'Ingreso', 'A Gestion de Parametros'),
(4314, 1, 7, '2021-07-22 16:55:43', 'Ingreso', 'A Gestion de Parametros'),
(4315, 1, 146, '2021-07-22 16:56:06', 'Ingreso', 'A crear Reunion'),
(4316, 1, 7, '2021-07-22 16:56:24', 'Ingreso', 'A Gestion de Parametros'),
(4317, 1, 146, '2021-07-22 16:56:30', 'Ingreso', 'A crear Reunion'),
(4318, 1, 7, '2021-07-22 16:56:50', 'Ingreso', 'A Gestion de Parametros'),
(4319, 1, 7, '2021-07-22 16:58:03', 'Ingreso', 'A Gestion de Parametros'),
(4320, 1, 7, '2021-07-22 16:59:19', 'Ingreso', 'A Gestion de Parametros'),
(4321, 1, 7, '2021-07-22 17:00:07', 'Ingreso', 'A Gestion de Parametros'),
(4322, 1, 146, '2021-07-22 17:00:27', 'Ingreso', 'A crear Reunion'),
(4323, 1, 7, '2021-07-22 17:03:36', 'Ingreso', 'A Gestion de Parametros'),
(4324, 1, 146, '2021-07-22 17:03:43', 'Ingreso', 'A crear Reunion'),
(4325, 1, 7, '2021-07-22 17:03:56', 'Ingreso', 'A Gestion de Parametros'),
(4326, 1, 146, '2021-07-22 17:04:03', 'Ingreso', 'A crear Reunion'),
(4327, 1, 146, '2021-07-22 17:07:06', 'Ingreso', 'A crear Reunion'),
(4328, 1, 7, '2021-07-22 17:07:19', 'Ingreso', 'A Gestion de Parametros'),
(4329, 1, 146, '2021-07-22 17:07:22', 'Ingreso', 'A crear Reunion'),
(4330, 1, 146, '2021-07-22 17:18:07', 'Ingreso', 'A crear Reunion'),
(4331, 1, 146, '2021-07-22 17:22:17', 'Ingreso', 'A crear Reunion'),
(4332, 1, 7, '2021-07-22 17:22:26', 'Ingreso', 'A Gestion de Parametros'),
(4333, 1, 103, '2021-07-22 17:22:35', 'Ingreso', 'A Lista de Reuniones'),
(4334, 1, 146, '2021-07-22 17:22:42', 'Ingreso', 'A crear Reunion'),
(4335, 1, 103, '2021-07-22 17:22:50', 'Ingreso', 'A Lista de Reuniones'),
(4336, 1, 103, '2021-07-22 17:22:53', 'Ingreso', 'A Lista de Reuniones'),
(4337, 1, 146, '2021-07-22 17:23:16', 'Ingreso', 'A crear Reunion'),
(4338, 1, 103, '2021-07-22 17:24:06', 'Ingreso', 'A Lista de Reuniones'),
(4339, 1, 103, '2021-07-22 17:25:15', 'Ingreso', 'A Lista de Reuniones'),
(4340, 1, 103, '2021-07-22 17:26:20', 'Ingreso', 'A Lista de Reuniones'),
(4341, 1, 103, '2021-07-22 17:26:29', 'Ingreso', 'A Lista de Reuniones'),
(4342, 1, 103, '2021-07-22 17:26:45', 'Ingreso', 'A Lista de Reuniones'),
(4343, 1, 103, '2021-07-22 17:27:50', 'Ingreso', 'A Lista de Reuniones'),
(4344, 1, 103, '2021-07-22 17:28:13', 'Ingreso', 'A Lista de Reuniones'),
(4345, 1, 103, '2021-07-22 17:28:48', 'Ingreso', 'A Lista de Reuniones'),
(4346, 1, 7, '2021-07-22 17:31:06', 'Ingreso', 'A Gestion de Parametros'),
(4347, 1, 146, '2021-07-22 17:31:09', 'Ingreso', 'A crear Reunion'),
(4348, 1, 146, '2021-07-22 17:31:52', 'Ingreso', 'A crear Reunion'),
(4349, 1, 146, '2021-07-22 17:32:29', 'Ingreso', 'A crear Reunion'),
(4350, 1, 146, '2021-07-22 17:33:07', 'Ingreso', 'A crear Reunion'),
(4351, 1, 146, '2021-07-22 17:33:08', 'Ingreso', 'A crear Reunion'),
(4352, 1, 146, '2021-07-22 17:33:21', 'Ingreso', 'A crear Reunion'),
(4353, 1, 146, '2021-07-22 17:33:24', 'Ingreso', 'A crear Reunion'),
(4354, 1, 7, '2021-07-22 17:33:36', 'Ingreso', 'A Gestion de Parametros'),
(4355, 1, 7, '2021-07-22 17:33:37', 'Ingreso', 'A Gestion de Parametros'),
(4356, 1, 146, '2021-07-22 17:33:40', 'Ingreso', 'A crear Reunion'),
(4357, 1, 146, '2021-07-22 17:33:56', 'Ingreso', 'A crear Reunion'),
(4358, 1, 146, '2021-07-22 17:34:08', 'Ingreso', 'A crear Reunion'),
(4359, 1, 146, '2021-07-22 17:34:12', 'Ingreso', 'A crear Reunion'),
(4360, 1, 146, '2021-07-22 17:35:05', 'Ingreso', 'A crear Reunion'),
(4361, 1, 146, '2021-07-22 17:35:26', 'Ingreso', 'A crear Reunion'),
(4362, 1, 7, '2021-07-22 17:35:56', 'Ingreso', 'A Gestion de Parametros'),
(4363, 1, 103, '2021-07-22 17:36:03', 'Ingreso', 'A Lista de Reuniones'),
(4364, 1, 7, '2021-07-22 17:37:27', 'Ingreso', 'A Gestion de Parametros'),
(4365, 1, 146, '2021-07-22 17:37:30', 'Ingreso', 'A crear Reunion'),
(4366, 1, 146, '2021-07-22 17:38:37', 'Ingreso', 'A crear Reunion'),
(4367, 1, 7, '2021-07-22 17:38:44', 'Ingreso', 'A Gestion de Parametros'),
(4368, 1, 7, '2021-07-22 17:41:11', 'Ingreso', 'A Gestion de Parametros'),
(4369, 1, 7, '2021-07-22 17:43:28', 'Ingreso', 'A Gestion de Parametros'),
(4370, 1, 146, '2021-07-22 17:43:49', 'Ingreso', 'A crear Reunion'),
(4371, 1, 146, '2021-07-22 17:44:17', 'Ingreso', 'A crear Reunion'),
(4372, 1, 7, '2021-07-22 17:44:18', 'Ingreso', 'A Gestion de Parametros'),
(4373, 1, 7, '2021-07-22 17:44:31', 'Ingreso', 'A Gestion de Parametros'),
(4374, 1, 7, '2021-07-22 17:45:14', 'Ingreso', 'A Gestion de Parametros'),
(4375, 1, 7, '2021-07-22 17:46:10', 'Ingreso', 'A Gestion de Parametros'),
(4376, 1, 7, '2021-07-22 17:46:28', 'Ingreso', 'A Gestion de Parametros'),
(4377, 1, 7, '2021-07-22 17:46:48', 'Ingreso', 'A Gestion de Parametros'),
(4378, 1, 7, '2021-07-22 17:47:53', 'Ingreso', 'A Gestion de Parametros'),
(4379, 1, 7, '2021-07-22 17:48:03', 'Ingreso', 'A Gestion de Parametros'),
(4380, 1, 7, '2021-07-22 17:48:10', 'Ingreso', 'A Gestion de Parametros'),
(4381, 1, 7, '2021-07-22 17:48:18', 'Ingreso', 'A Gestion de Parametros'),
(4382, 1, 7, '2021-07-22 17:48:33', 'Ingreso', 'A Gestion de Parametros'),
(4383, 1, 7, '2021-07-22 17:48:45', 'Ingreso', 'A Gestion de Parametros'),
(4384, 1, 7, '2021-07-22 17:48:56', 'Ingreso', 'A Gestion de Parametros'),
(4385, 1, 7, '2021-07-22 17:49:19', 'Ingreso', 'A Gestion de Parametros'),
(4386, 1, 7, '2021-07-22 17:49:57', 'Ingreso', 'A Gestion de Parametros'),
(4387, 1, 7, '2021-07-22 17:50:56', 'Ingreso', 'A Gestion de Parametros'),
(4388, 1, 7, '2021-07-22 17:51:14', 'Ingreso', 'A Gestion de Parametros'),
(4389, 1, 7, '2021-07-22 17:51:23', 'Ingreso', 'A Gestion de Parametros'),
(4390, 1, 7, '2021-07-22 17:51:37', 'Ingreso', 'A Gestion de Parametros'),
(4391, 1, 7, '2021-07-22 17:52:49', 'Ingreso', 'A Gestion de Parametros'),
(4392, 1, 7, '2021-07-22 17:53:12', 'Ingreso', 'A Gestion de Parametros'),
(4393, 1, 7, '2021-07-22 17:53:18', 'Ingreso', 'A Gestion de Parametros'),
(4394, 1, 7, '2021-07-22 17:53:31', 'Ingreso', 'A Gestion de Parametros'),
(4395, 1, 7, '2021-07-22 17:53:52', 'Ingreso', 'A Gestion de Parametros'),
(4396, 1, 7, '2021-07-22 17:54:31', 'Ingreso', 'A Gestion de Parametros'),
(4397, 1, 7, '2021-07-22 17:54:39', 'Ingreso', 'A Gestion de Parametros'),
(4398, 1, 7, '2021-07-22 17:54:46', 'Ingreso', 'A Gestion de Parametros'),
(4399, 1, 7, '2021-07-22 17:55:17', 'Ingreso', 'A Gestion de Parametros'),
(4400, 1, 7, '2021-07-22 17:55:29', 'Ingreso', 'A Gestion de Parametros'),
(4401, 1, 7, '2021-07-22 17:56:06', 'Ingreso', 'A Gestion de Parametros'),
(4402, 1, 7, '2021-07-22 17:56:21', 'Ingreso', 'A Gestion de Parametros'),
(4403, 1, 7, '2021-07-22 17:56:34', 'Ingreso', 'A Gestion de Parametros'),
(4404, 1, 7, '2021-07-22 17:56:44', 'Ingreso', 'A Gestion de Parametros'),
(4405, 1, 7, '2021-07-22 17:56:50', 'Ingreso', 'A Gestion de Parametros'),
(4406, 1, 7, '2021-07-22 17:57:09', 'Ingreso', 'A Gestion de Parametros'),
(4407, 1, 7, '2021-07-22 17:57:29', 'Ingreso', 'A Gestion de Parametros'),
(4408, 1, 7, '2021-07-22 17:57:42', 'Ingreso', 'A Gestion de Parametros'),
(4409, 1, 7, '2021-07-22 17:58:03', 'Ingreso', 'A Gestion de Parametros'),
(4410, 1, 7, '2021-07-22 17:58:22', 'Ingreso', 'A Gestion de Parametros'),
(4411, 1, 7, '2021-07-22 17:58:30', 'Ingreso', 'A Gestion de Parametros'),
(4412, 1, 7, '2021-07-22 17:58:36', 'Ingreso', 'A Gestion de Parametros'),
(4413, 1, 7, '2021-07-22 17:58:46', 'Ingreso', 'A Gestion de Parametros'),
(4414, 1, 7, '2021-07-22 17:58:55', 'Ingreso', 'A Gestion de Parametros'),
(4415, 1, 7, '2021-07-22 17:59:13', 'Ingreso', 'A Gestion de Parametros'),
(4416, 1, 7, '2021-07-22 17:59:38', 'Ingreso', 'A Gestion de Parametros'),
(4417, 1, 7, '2021-07-22 17:59:59', 'Ingreso', 'A Gestion de Parametros'),
(4418, 1, 7, '2021-07-22 18:00:06', 'Ingreso', 'A Gestion de Parametros'),
(4419, 1, 7, '2021-07-22 18:00:10', 'Ingreso', 'A Gestion de Parametros'),
(4420, 1, 7, '2021-07-22 18:00:43', 'Ingreso', 'A Gestion de Parametros'),
(4421, 1, 7, '2021-07-22 18:00:57', 'Ingreso', 'A Gestion de Parametros'),
(4422, 1, 7, '2021-07-22 18:01:04', 'Ingreso', 'A Gestion de Parametros'),
(4423, 1, 7, '2021-07-22 18:01:13', 'Ingreso', 'A Gestion de Parametros'),
(4424, 1, 7, '2021-07-22 18:01:18', 'Ingreso', 'A Gestion de Parametros'),
(4425, 1, 7, '2021-07-22 18:01:26', 'Ingreso', 'A Gestion de Parametros'),
(4426, 1, 7, '2021-07-22 18:01:37', 'Ingreso', 'A Gestion de Parametros'),
(4427, 1, 7, '2021-07-22 18:01:44', 'Ingreso', 'A Gestion de Parametros'),
(4428, 1, 7, '2021-07-22 18:01:56', 'Ingreso', 'A Gestion de Parametros'),
(4429, 1, 7, '2021-07-22 18:02:05', 'Ingreso', 'A Gestion de Parametros'),
(4430, 1, 7, '2021-07-22 18:02:11', 'Ingreso', 'A Gestion de Parametros'),
(4431, 1, 7, '2021-07-22 18:02:16', 'Ingreso', 'A Gestion de Parametros'),
(4432, 1, 7, '2021-07-22 18:02:21', 'Ingreso', 'A Gestion de Parametros'),
(4433, 1, 7, '2021-07-22 18:02:31', 'Ingreso', 'A Gestion de Parametros'),
(4434, 1, 7, '2021-07-22 18:02:36', 'Ingreso', 'A Gestion de Parametros'),
(4435, 1, 7, '2021-07-22 18:02:53', 'Ingreso', 'A Gestion de Parametros'),
(4436, 1, 7, '2021-07-22 18:03:00', 'Ingreso', 'A Gestion de Parametros'),
(4437, 1, 7, '2021-07-22 18:03:13', 'Ingreso', 'A Gestion de Parametros'),
(4438, 1, 7, '2021-07-22 18:10:58', 'Ingreso', 'A Gestion de Parametros'),
(4439, 1, 7, '2021-07-22 18:16:11', 'Ingreso', 'A Gestion de Parametros'),
(4440, 1, 146, '2021-07-22 18:16:13', 'Ingreso', 'A crear Reunion'),
(4441, 1, 146, '2021-07-22 18:16:23', 'Ingreso', 'A crear Reunion'),
(4442, 1, 146, '2021-07-22 18:18:13', 'Ingreso', 'A crear Reunion'),
(4443, 1, 146, '2021-07-22 18:19:15', 'Ingreso', 'A crear Reunion'),
(4444, 1, 146, '2021-07-22 18:25:23', 'Ingreso', 'A crear Reunion'),
(4445, 1, 146, '2021-07-22 18:25:27', 'Ingreso', 'A crear Reunion'),
(4446, 1, 146, '2021-07-22 18:25:39', 'Ingreso', 'A crear Reunion'),
(4447, 1, 146, '2021-07-22 18:25:47', 'Ingreso', 'A crear Reunion'),
(4448, 1, 146, '2021-07-22 18:25:55', 'Ingreso', 'A crear Reunion'),
(4449, 1, 146, '2021-07-22 18:29:29', 'Ingreso', 'A crear Reunion'),
(4450, 1, 146, '2021-07-22 18:31:00', 'Ingreso', 'A crear Reunion'),
(4451, 1, 146, '2021-07-22 18:32:01', 'Ingreso', 'A crear Reunion'),
(4452, 1, 146, '2021-07-22 18:32:23', 'Ingreso', 'A crear Reunion'),
(4453, 1, 146, '2021-07-22 18:32:49', 'Ingreso', 'A crear Reunion'),
(4454, 1, 146, '2021-07-22 18:32:57', 'Ingreso', 'A crear Reunion'),
(4455, 1, 146, '2021-07-22 18:34:01', 'Ingreso', 'A crear Reunion'),
(4456, 1, 146, '2021-07-22 18:34:08', 'Ingreso', 'A crear Reunion'),
(4457, 1, 146, '2021-07-22 18:35:12', 'Ingreso', 'A crear Reunion'),
(4458, 1, 146, '2021-07-22 18:36:19', 'Ingreso', 'A crear Reunion'),
(4459, 1, 7, '2021-07-22 18:36:30', 'Ingreso', 'A Gestion de Parametros'),
(4460, 1, 146, '2021-07-22 18:37:05', 'Ingreso', 'A crear Reunion'),
(4461, 1, 146, '2021-07-22 18:38:54', 'Ingreso', 'A crear Reunion'),
(4462, 1, 146, '2021-07-22 18:39:10', 'Ingreso', 'A crear Reunion'),
(4463, 1, 7, '2021-07-22 18:39:13', 'Ingreso', 'A Gestion de Parametros'),
(4464, 1, 146, '2021-07-22 18:39:16', 'Ingreso', 'A crear Reunion'),
(4465, 1, 146, '2021-07-22 18:39:28', 'Ingreso', 'A crear Reunion'),
(4466, 1, 7, '2021-07-22 18:39:33', 'Ingreso', 'A Gestion de Parametros'),
(4467, 1, 146, '2021-07-22 18:39:43', 'Ingreso', 'A crear Reunion'),
(4468, 1, 146, '2021-07-22 18:39:56', 'Ingreso', 'A crear Reunion'),
(4469, 1, 7, '2021-07-22 18:39:57', 'Ingreso', 'A Gestion de Parametros'),
(4470, 1, 146, '2021-07-22 18:40:09', 'Ingreso', 'A crear Reunion'),
(4471, 1, 146, '2021-07-22 18:40:22', 'Ingreso', 'A crear Reunion'),
(4472, 1, 7, '2021-07-22 18:40:23', 'Ingreso', 'A Gestion de Parametros'),
(4473, 1, 146, '2021-07-22 18:40:34', 'Ingreso', 'A crear Reunion'),
(4474, 1, 146, '2021-07-22 18:40:54', 'Ingreso', 'A crear Reunion'),
(4475, 1, 7, '2021-07-22 18:40:54', 'Ingreso', 'A Gestion de Parametros'),
(4476, 1, 146, '2021-07-22 18:41:01', 'Ingreso', 'A crear Reunion'),
(4477, 1, 146, '2021-07-22 18:41:10', 'Ingreso', 'A crear Reunion'),
(4478, 1, 7, '2021-07-22 18:41:10', 'Ingreso', 'A Gestion de Parametros'),
(4479, 1, 146, '2021-07-22 18:41:15', 'Ingreso', 'A crear Reunion'),
(4480, 1, 146, '2021-07-22 18:41:30', 'Ingreso', 'A crear Reunion'),
(4481, 1, 7, '2021-07-22 18:41:30', 'Ingreso', 'A Gestion de Parametros'),
(4482, 1, 146, '2021-07-22 18:42:59', 'Ingreso', 'A crear Reunion'),
(4483, 1, 146, '2021-07-22 18:43:54', 'Ingreso', 'A crear Reunion'),
(4484, 1, 7, '2021-07-22 18:43:56', 'Ingreso', 'A Gestion de Parametros'),
(4485, 1, 146, '2021-07-22 18:43:59', 'Ingreso', 'A crear Reunion'),
(4486, 1, 146, '2021-07-22 18:44:08', 'Ingreso', 'A crear Reunion'),
(4487, 1, 7, '2021-07-22 18:46:39', 'Ingreso', 'A Gestion de Parametros'),
(4488, 1, 7, '2021-07-22 18:47:14', 'Ingreso', 'A Gestion de Parametros'),
(4489, 1, 7, '2021-07-22 18:47:47', 'Ingreso', 'A Gestion de Parametros'),
(4490, 1, 7, '2021-07-22 18:47:54', 'Ingreso', 'A Gestion de Parametros'),
(4491, 1, 7, '2021-07-22 18:48:07', 'Ingreso', 'A Gestion de Parametros'),
(4492, 1, 7, '2021-07-22 18:48:19', 'Ingreso', 'A Gestion de Parametros'),
(4493, 1, 7, '2021-07-22 18:48:37', 'Ingreso', 'A Gestion de Parametros'),
(4494, 1, 7, '2021-07-22 18:48:43', 'Ingreso', 'A Gestion de Parametros'),
(4495, 1, 7, '2021-07-22 18:48:48', 'Ingreso', 'A Gestion de Parametros'),
(4496, 1, 7, '2021-07-22 18:49:08', 'Ingreso', 'A Gestion de Parametros'),
(4497, 1, 7, '2021-07-22 18:49:17', 'Ingreso', 'A Gestion de Parametros'),
(4498, 1, 7, '2021-07-22 18:49:23', 'Ingreso', 'A Gestion de Parametros'),
(4499, 1, 7, '2021-07-22 18:49:28', 'Ingreso', 'A Gestion de Parametros'),
(4500, 1, 7, '2021-07-22 18:49:33', 'Ingreso', 'A Gestion de Parametros'),
(4501, 1, 7, '2021-07-22 18:49:39', 'Ingreso', 'A Gestion de Parametros'),
(4502, 1, 7, '2021-07-22 18:49:44', 'Ingreso', 'A Gestion de Parametros'),
(4503, 1, 7, '2021-07-22 18:49:50', 'Ingreso', 'A Gestion de Parametros'),
(4504, 1, 7, '2021-07-22 18:50:26', 'Ingreso', 'A Gestion de Parametros'),
(4505, 1, 7, '2021-07-22 18:50:34', 'Ingreso', 'A Gestion de Parametros'),
(4506, 1, 103, '2021-07-22 18:51:43', 'Ingreso', 'A Lista de Reuniones'),
(4507, 1, 7, '2021-07-22 18:51:58', 'Ingreso', 'A Gestion de Parametros'),
(4508, 1, 146, '2021-07-22 18:52:03', 'Ingreso', 'A crear Reunion'),
(4509, 1, 146, '2021-07-22 18:53:41', 'Ingreso', 'A crear Reunion'),
(4510, 1, 7, '2021-07-22 18:53:42', 'Ingreso', 'A Gestion de Parametros'),
(4511, 1, 7, '2021-07-22 18:53:48', 'Ingreso', 'A Gestion de Parametros'),
(4512, 1, 103, '2021-07-22 18:53:55', 'Ingreso', 'A Lista de Reuniones'),
(4513, 1, 151, '2021-07-22 18:58:12', 'Ingreso', 'A crear Acuerdo'),
(4514, 1, 151, '2021-07-22 18:58:36', 'Ingreso', 'A crear Acuerdo'),
(4515, 1, 151, '2021-07-22 19:00:10', 'Ingreso', 'A crear Acuerdo'),
(4516, 1, 151, '2021-07-22 19:00:45', 'Ingreso', 'A crear Acuerdo'),
(4517, 1, 151, '2021-07-22 19:01:20', 'Ingreso', 'A crear Acuerdo'),
(4518, 1, 151, '2021-07-22 19:08:09', 'Ingreso', 'A crear Acuerdo'),
(4519, 1, 7, '2021-07-22 19:09:43', 'Ingreso', 'A Gestion de Parametros'),
(4520, 1, 7, '2021-07-22 19:19:25', 'Ingreso', 'A Gestion de Parametros'),
(4521, 1, 7, '2021-07-22 19:20:21', 'Ingreso', 'A Gestion de Parametros'),
(4522, 1, 151, '2021-07-22 19:20:32', 'Ingreso', 'A crear Acuerdo'),
(4523, 1, 151, '2021-07-22 20:18:52', 'Ingreso', 'A crear Acuerdo'),
(4524, 1, 151, '2021-07-22 20:23:37', 'Ingreso', 'A crear Acuerdo'),
(4525, 1, 7, '2021-07-22 20:26:36', 'Ingreso', 'A Gestion de Parametros'),
(4526, 1, 149, '2021-07-22 20:30:18', 'Ingreso', 'A Actas Pendientes'),
(4527, 1, 149, '2021-07-22 20:30:59', 'Ingreso', 'A Actas Pendientes'),
(4528, 1, 149, '2021-07-22 20:33:34', 'Ingreso', 'A Actas Pendientes'),
(4529, 1, 149, '2021-07-22 20:34:51', 'Ingreso', 'A Actas Pendientes'),
(4530, 1, 149, '2021-07-22 20:34:53', 'Ingreso', 'A Actas Pendientes'),
(4531, 1, 149, '2021-07-22 20:36:47', 'Ingreso', 'A Actas Pendientes'),
(4532, 1, 149, '2021-07-22 20:36:51', 'Ingreso', 'A Actas Pendientes'),
(4533, 1, 149, '2021-07-22 20:36:51', 'Ingreso', 'A Actas Pendientes'),
(4534, 1, 149, '2021-07-22 20:36:51', 'Ingreso', 'A Actas Pendientes'),
(4535, 1, 149, '2021-07-22 20:37:23', 'Ingreso', 'A Actas Pendientes'),
(4536, 1, 149, '2021-07-22 20:37:25', 'Ingreso', 'A Actas Pendientes'),
(4537, 1, 149, '2021-07-22 20:45:13', 'Ingreso', 'A Actas Pendientes'),
(4538, 1, 146, '2021-07-22 20:45:25', 'Ingreso', 'A crear Reunion'),
(4539, 1, 146, '2021-07-22 20:45:54', 'Ingreso', 'A crear Reunion'),
(4540, 1, 146, '2021-07-22 20:46:51', 'Ingreso', 'A crear Reunion'),
(4541, 1, 146, '2021-07-22 20:46:58', 'Ingreso', 'A crear Reunion'),
(4542, 1, 146, '2021-07-22 20:47:55', 'Ingreso', 'A crear Reunion'),
(4543, 1, 146, '2021-07-22 20:48:04', 'Ingreso', 'A crear Reunion'),
(4544, 1, 146, '2021-07-22 20:48:24', 'Ingreso', 'A crear Reunion'),
(4545, 1, 146, '2021-07-22 20:50:43', 'Ingreso', 'A crear Reunion'),
(4546, 1, 146, '2021-07-23 09:25:25', 'Ingreso', 'A crear Reunion'),
(4547, 1, 146, '2021-07-23 09:25:33', 'Ingreso', 'A crear Reunion'),
(4548, 1, 146, '2021-07-23 09:25:40', 'Ingreso', 'A crear Reunion'),
(4549, 1, 146, '2021-07-23 09:26:29', 'Ingreso', 'A crear Reunion'),
(4550, 1, 103, '2021-07-23 09:26:37', 'Ingreso', 'A Lista de Reuniones'),
(4551, 1, 149, '2021-07-23 09:26:56', 'Ingreso', 'A Actas Pendientes'),
(4552, 1, 146, '2021-07-23 09:27:00', 'Ingreso', 'A crear Reunion'),
(4553, 1, 146, '2021-07-23 09:27:23', 'Ingreso', 'A crear Reunion'),
(4554, 1, 149, '2021-07-23 09:27:25', 'Ingreso', 'A Actas Pendientes'),
(4555, 1, 149, '2021-07-23 09:27:27', 'Ingreso', 'A Actas Pendientes'),
(4556, 1, 146, '2021-07-23 09:27:30', 'Ingreso', 'A crear Reunion'),
(4557, 1, 146, '2021-07-23 09:27:49', 'Ingreso', 'A crear Reunion'),
(4558, 1, 149, '2021-07-23 09:27:52', 'Ingreso', 'A Actas Pendientes'),
(4559, 1, 149, '2021-07-23 09:28:04', 'Ingreso', 'A Actas Pendientes'),
(4560, 1, 149, '2021-07-23 09:28:47', 'Ingreso', 'A Actas Pendientes'),
(4561, 1, 146, '2021-07-23 09:28:50', 'Ingreso', 'A crear Reunion'),
(4562, 1, 146, '2021-07-23 09:28:53', 'Ingreso', 'A crear Reunion'),
(4563, 1, 146, '2021-07-23 09:32:15', 'Ingreso', 'A crear Reunion'),
(4564, 1, 146, '2021-07-23 09:34:11', 'Ingreso', 'A crear Reunion'),
(4565, 1, 146, '2021-07-23 09:35:07', 'Ingreso', 'A crear Reunion'),
(4566, 1, 149, '2021-07-23 09:35:08', 'Ingreso', 'A Actas Pendientes'),
(4567, 1, 146, '2021-07-23 09:38:01', 'Ingreso', 'A crear Reunion'),
(4568, 1, 149, '2021-07-23 09:38:06', 'Ingreso', 'A Actas Pendientes'),
(4569, 1, 149, '2021-07-23 09:39:22', 'Ingreso', 'A Actas Pendientes'),
(4570, 1, 149, '2021-07-23 09:39:41', 'Ingreso', 'A Actas Pendientes'),
(4571, 1, 103, '2021-07-23 09:39:48', 'Ingreso', 'A Lista de Reuniones'),
(4572, 1, 149, '2021-07-23 09:40:05', 'Ingreso', 'A Actas Pendientes'),
(4573, 1, 149, '2021-07-23 09:40:13', 'Ingreso', 'A Actas Pendientes'),
(4574, 1, 146, '2021-07-23 09:40:36', 'Ingreso', 'A crear Reunion'),
(4575, 1, 146, '2021-07-23 09:43:58', 'Ingreso', 'A crear Reunion'),
(4576, 1, 146, '2021-07-23 09:44:04', 'Ingreso', 'A crear Reunion'),
(4577, 1, 146, '2021-07-23 09:45:05', 'Ingreso', 'A crear Reunion'),
(4578, 1, 146, '2021-07-23 09:47:29', 'Ingreso', 'A crear Reunion'),
(4579, 1, 103, '2021-07-23 09:47:40', 'Ingreso', 'A Lista de Reuniones'),
(4580, 1, 149, '2021-07-23 09:48:16', 'Ingreso', 'A Actas Pendientes'),
(4581, 1, 146, '2021-07-23 09:48:25', 'Ingreso', 'A crear Reunion'),
(4582, 1, 149, '2021-07-23 09:48:44', 'Ingreso', 'A Actas Pendientes'),
(4583, 1, 146, '2021-07-23 09:49:16', 'Ingreso', 'A crear Reunion'),
(4584, 1, 146, '2021-07-23 09:50:54', 'Ingreso', 'A crear Reunion'),
(4585, 1, 149, '2021-07-23 09:51:32', 'Ingreso', 'A Actas Pendientes'),
(4586, 1, 149, '2021-07-23 09:51:38', 'Ingreso', 'A Actas Pendientes'),
(4587, 1, 103, '2021-07-23 09:51:50', 'Ingreso', 'A Lista de Reuniones'),
(4588, 1, 146, '2021-07-23 09:51:55', 'Ingreso', 'A crear Reunion'),
(4589, 1, 146, '2021-07-23 09:52:01', 'Ingreso', 'A crear Reunion'),
(4590, 1, 146, '2021-07-23 09:52:14', 'Ingreso', 'A crear Reunion'),
(4591, 1, 146, '2021-07-23 09:52:20', 'Ingreso', 'A crear Reunion'),
(4592, 1, 103, '2021-07-23 09:52:38', 'Ingreso', 'A Lista de Reuniones'),
(4593, 1, 151, '2021-07-23 09:52:45', 'Ingreso', 'A crear Acuerdo'),
(4594, 1, 151, '2021-07-23 09:54:12', 'Ingreso', 'A crear Acuerdo'),
(4595, 1, 151, '2021-07-23 09:57:48', 'Ingreso', 'A crear Acuerdo'),
(4596, 1, 151, '2021-07-23 09:58:05', 'Ingreso', 'A crear Acuerdo'),
(4597, 1, 151, '2021-07-23 09:59:13', 'Ingreso', 'A crear Acuerdo'),
(4598, 1, 151, '2021-07-23 09:59:26', 'Ingreso', 'A crear Acuerdo'),
(4599, 1, 103, '2021-07-23 09:59:45', 'Ingreso', 'A Lista de Reuniones'),
(4600, 1, 103, '2021-07-23 10:10:09', 'Ingreso', 'A Lista de Reuniones'),
(4601, 1, 151, '2021-07-23 10:10:43', 'Ingreso', 'A crear Acuerdo'),
(4602, 1, 151, '2021-07-23 10:10:49', 'Ingreso', 'A crear Acuerdo'),
(4603, 1, 151, '2021-07-23 10:10:55', 'Ingreso', 'A crear Acuerdo'),
(4604, 1, 151, '2021-07-23 10:11:41', 'Ingreso', 'A crear Acuerdo'),
(4605, 1, 151, '2021-07-23 10:11:45', 'Ingreso', 'A crear Acuerdo'),
(4606, 1, 103, '2021-07-23 10:11:51', 'Ingreso', 'A Lista de Reuniones'),
(4607, 1, 103, '2021-07-23 10:12:03', 'Ingreso', 'A Lista de Reuniones'),
(4608, 1, 103, '2021-07-23 10:13:14', 'Ingreso', 'A Lista de Reuniones'),
(4609, 1, 149, '2021-07-23 10:14:31', 'Ingreso', 'A Actas Pendientes'),
(4610, 1, 146, '2021-07-23 10:14:33', 'Ingreso', 'A crear Reunion'),
(4611, 1, 146, '2021-07-23 10:14:38', 'Ingreso', 'A crear Reunion'),
(4612, 1, 146, '2021-07-23 10:16:21', 'Ingreso', 'A crear Reunion'),
(4613, 1, 146, '2021-07-23 10:16:25', 'Ingreso', 'A crear Reunion'),
(4614, 1, 146, '2021-07-23 10:17:54', 'Ingreso', 'A crear Reunion'),
(4615, 1, 146, '2021-07-23 10:17:57', 'Ingreso', 'A crear Reunion'),
(4616, 1, 146, '2021-07-23 10:18:06', 'Ingreso', 'A crear Reunion'),
(4617, 1, 149, '2021-07-23 10:18:06', 'Ingreso', 'A Actas Pendientes'),
(4618, 1, 146, '2021-07-23 10:18:12', 'Ingreso', 'A crear Reunion'),
(4619, 1, 146, '2021-07-23 10:18:21', 'Ingreso', 'A crear Reunion'),
(4620, 1, 149, '2021-07-23 10:18:22', 'Ingreso', 'A Actas Pendientes'),
(4621, 1, 146, '2021-07-23 10:18:24', 'Ingreso', 'A crear Reunion'),
(4622, 1, 146, '2021-07-23 10:18:34', 'Ingreso', 'A crear Reunion'),
(4623, 1, 146, '2021-07-23 10:19:12', 'Ingreso', 'A crear Reunion'),
(4624, 1, 146, '2021-07-23 10:19:17', 'Ingreso', 'A crear Reunion'),
(4625, 1, 146, '2021-07-23 10:25:01', 'Ingreso', 'A crear Reunion'),
(4626, 1, 146, '2021-07-23 10:25:04', 'Ingreso', 'A crear Reunion'),
(4627, 1, 103, '2021-07-23 10:25:27', 'Ingreso', 'A Lista de Reuniones'),
(4628, 1, 103, '2021-07-23 10:25:31', 'Ingreso', 'A Lista de Reuniones'),
(4629, 1, 146, '2021-07-23 10:34:01', 'Ingreso', 'A crear Reunion'),
(4630, 1, 146, '2021-07-23 11:08:27', 'Ingreso', 'A crear Reunion'),
(4631, 1, 146, '2021-07-23 11:08:56', 'Ingreso', 'A crear Reunion'),
(4632, 1, 146, '2021-07-23 11:09:25', 'Ingreso', 'A crear Reunion'),
(4633, 1, 146, '2021-07-23 11:12:52', 'Ingreso', 'A crear Reunion'),
(4634, 1, 146, '2021-07-23 11:13:52', 'Ingreso', 'A crear Reunion'),
(4635, 1, 146, '2021-07-23 11:14:51', 'Ingreso', 'A crear Reunion'),
(4636, 1, 146, '2021-07-23 11:29:47', 'Ingreso', 'A crear Reunion'),
(4637, 1, 149, '2021-07-23 11:30:38', 'Ingreso', 'A Actas Pendientes'),
(4638, 1, 146, '2021-07-23 11:30:41', 'Ingreso', 'A crear Reunion'),
(4639, 1, 146, '2021-07-23 11:30:53', 'Ingreso', 'A crear Reunion'),
(4640, 1, 151, '2021-07-23 11:31:19', 'Ingreso', 'A crear Acuerdo'),
(4641, 1, 151, '2021-07-23 11:40:14', 'Ingreso', 'A crear Acuerdo'),
(4642, 1, 151, '2021-07-23 11:43:41', 'Ingreso', 'A crear Acuerdo'),
(4643, 1, 151, '2021-07-23 11:44:29', 'Ingreso', 'A crear Acuerdo'),
(4644, 1, 151, '2021-07-23 11:45:52', 'Ingreso', 'A crear Acuerdo'),
(4645, 1, 151, '2021-07-23 11:45:57', 'Ingreso', 'A crear Acuerdo'),
(4646, 1, 151, '2021-07-23 11:46:40', 'Ingreso', 'A crear Acuerdo'),
(4647, 1, 151, '2021-07-23 11:46:52', 'Ingreso', 'A crear Acuerdo'),
(4648, 1, 151, '2021-07-23 11:49:19', 'Ingreso', 'A crear Acuerdo'),
(4649, 1, 151, '2021-07-23 11:49:53', 'Ingreso', 'A crear Acuerdo'),
(4650, 1, 151, '2021-07-23 11:51:33', 'Ingreso', 'A crear Acuerdo'),
(4651, 1, 151, '2021-07-23 11:55:35', 'Ingreso', 'A crear Acuerdo'),
(4652, 1, 151, '2021-07-23 11:57:19', 'Ingreso', 'A crear Acuerdo'),
(4653, 1, 151, '2021-07-23 11:58:04', 'Ingreso', 'A crear Acuerdo'),
(4654, 1, 151, '2021-07-23 11:58:56', 'Ingreso', 'A crear Acuerdo'),
(4655, 1, 151, '2021-07-23 11:59:36', 'Ingreso', 'A crear Acuerdo'),
(4656, 1, 151, '2021-07-23 12:01:03', 'Ingreso', 'A crear Acuerdo'),
(4657, 1, 103, '2021-07-23 12:03:41', 'Ingreso', 'A Lista de Reuniones'),
(4658, 1, 149, '2021-07-23 12:04:54', 'Ingreso', 'A Actas Pendientes'),
(4659, 1, 103, '2021-07-23 12:05:25', 'Ingreso', 'A Lista de Reuniones'),
(4660, 1, 103, '2021-07-23 12:06:49', 'Ingreso', 'A Lista de Reuniones'),
(4661, 1, 151, '2021-07-23 12:06:53', 'Ingreso', 'A crear Acuerdo'),
(4662, 1, 151, '2021-07-23 12:07:24', 'Ingreso', 'A crear Acuerdo'),
(4663, 1, 103, '2021-07-23 12:14:13', 'Ingreso', 'A Lista de Reuniones'),
(4664, 1, 103, '2021-07-23 12:14:17', 'Ingreso', 'A Lista de Reuniones'),
(4665, 1, 103, '2021-07-23 12:15:16', 'Ingreso', 'A Lista de Reuniones'),
(4666, 1, 151, '2021-07-23 12:15:24', 'Ingreso', 'A crear Acuerdo'),
(4667, 1, 151, '2021-07-23 12:27:29', 'Ingreso', 'A crear Acuerdo'),
(4668, 1, 151, '2021-07-23 12:28:32', 'Ingreso', 'A crear Acuerdo'),
(4669, 1, 151, '2021-07-23 12:29:23', 'Ingreso', 'A crear Acuerdo'),
(4670, 1, 151, '2021-07-23 12:33:48', 'Ingreso', 'A crear Acuerdo'),
(4671, 1, 149, '2021-07-23 12:36:58', 'Ingreso', 'A Actas Pendientes'),
(4672, 1, 146, '2021-07-23 12:37:00', 'Ingreso', 'A crear Reunion'),
(4673, 1, 146, '2021-07-23 12:37:13', 'Ingreso', 'A crear Reunion'),
(4674, 1, 149, '2021-07-23 12:37:13', 'Ingreso', 'A Actas Pendientes'),
(4675, 1, 146, '2021-07-23 12:37:28', 'Ingreso', 'A crear Reunion'),
(4676, 1, 146, '2021-07-23 12:39:32', 'Ingreso', 'A crear Reunion'),
(4677, 1, 149, '2021-07-23 12:39:32', 'Ingreso', 'A Actas Pendientes'),
(4678, 1, 149, '2021-07-23 12:39:35', 'Ingreso', 'A Actas Pendientes'),
(4679, 1, 146, '2021-07-23 12:40:42', 'Ingreso', 'A crear Reunion'),
(4680, 1, 146, '2021-07-23 12:41:53', 'Ingreso', 'A crear Reunion'),
(4681, 1, 146, '2021-07-23 12:43:51', 'Ingreso', 'A crear Reunion'),
(4682, 1, 146, '2021-07-23 12:44:01', 'Ingreso', 'A crear Reunion'),
(4683, 1, 146, '2021-07-23 12:45:48', 'Ingreso', 'A crear Reunion'),
(4684, 1, 146, '2021-07-23 12:45:54', 'Ingreso', 'A crear Reunion'),
(4685, 1, 151, '2021-07-23 12:48:10', 'Ingreso', 'A crear Acuerdo'),
(4686, 1, 151, '2021-07-23 12:48:22', 'Ingreso', 'A crear Acuerdo'),
(4687, 1, 151, '2021-07-23 12:48:32', 'Ingreso', 'A crear Acuerdo'),
(4688, 1, 151, '2021-07-23 12:49:18', 'Ingreso', 'A crear Acuerdo'),
(4689, 1, 151, '2021-07-23 12:50:28', 'Ingreso', 'A crear Acuerdo'),
(4690, 1, 151, '2021-07-23 12:51:17', 'Ingreso', 'A crear Acuerdo'),
(4691, 1, 151, '2021-07-23 12:52:01', 'Ingreso', 'A crear Acuerdo'),
(4692, 1, 151, '2021-07-23 12:52:35', 'Ingreso', 'A crear Acuerdo'),
(4693, 1, 151, '2021-07-23 12:54:03', 'Ingreso', 'A crear Acuerdo'),
(4694, 1, 103, '2021-07-23 13:17:54', 'Ingreso', 'A Lista de Reuniones'),
(4695, 1, 149, '2021-07-23 13:18:21', 'Ingreso', 'A Actas Pendientes'),
(4696, 1, 146, '2021-07-23 13:18:23', 'Ingreso', 'A crear Reunion'),
(4697, 1, 146, '2021-07-23 13:18:26', 'Ingreso', 'A crear Reunion'),
(4698, 1, 151, '2021-07-23 13:20:54', 'Ingreso', 'A crear Acuerdo'),
(4699, 1, 149, '2021-07-23 13:29:04', 'Ingreso', 'A Actas Pendientes'),
(4700, 1, 146, '2021-07-23 13:29:07', 'Ingreso', 'A crear Reunion'),
(4701, 1, 146, '2021-07-23 13:29:18', 'Ingreso', 'A crear Reunion'),
(4702, 1, 146, '2021-07-23 13:30:01', 'Ingreso', 'A crear Reunion'),
(4703, 1, 149, '2021-07-23 13:30:10', 'Ingreso', 'A Actas Pendientes'),
(4704, 1, 146, '2021-07-23 13:30:35', 'Ingreso', 'A crear Reunion'),
(4705, 1, 149, '2021-07-23 13:30:42', 'Ingreso', 'A Actas Pendientes'),
(4706, 1, 146, '2021-07-23 13:30:49', 'Ingreso', 'A crear Reunion'),
(4707, 1, 149, '2021-07-23 13:30:56', 'Ingreso', 'A Actas Pendientes'),
(4708, 1, 146, '2021-07-23 13:31:30', 'Ingreso', 'A crear Reunion'),
(4709, 1, 149, '2021-07-23 13:32:35', 'Ingreso', 'A Actas Pendientes'),
(4710, 1, 146, '2021-07-23 13:32:39', 'Ingreso', 'A crear Reunion'),
(4711, 1, 146, '2021-07-23 13:33:20', 'Ingreso', 'A crear Reunion'),
(4712, 1, 149, '2021-07-23 13:33:28', 'Ingreso', 'A Actas Pendientes'),
(4713, 1, 146, '2021-07-23 13:33:31', 'Ingreso', 'A crear Reunion'),
(4714, 1, 149, '2021-07-23 13:33:49', 'Ingreso', 'A Actas Pendientes'),
(4715, 1, 146, '2021-07-23 13:33:52', 'Ingreso', 'A crear Reunion'),
(4716, 1, 146, '2021-07-23 13:34:49', 'Ingreso', 'A crear Reunion'),
(4717, 1, 146, '2021-07-23 13:34:49', 'Ingreso', 'A crear Reunion'),
(4718, 1, 146, '2021-07-23 13:34:50', 'Ingreso', 'A crear Reunion'),
(4719, 1, 146, '2021-07-23 13:34:50', 'Ingreso', 'A crear Reunion'),
(4720, 1, 146, '2021-07-23 13:34:50', 'Ingreso', 'A crear Reunion'),
(4721, 1, 149, '2021-07-23 13:35:02', 'Ingreso', 'A Actas Pendientes'),
(4722, 1, 146, '2021-07-23 13:35:05', 'Ingreso', 'A crear Reunion'),
(4723, 1, 149, '2021-07-23 13:35:15', 'Ingreso', 'A Actas Pendientes'),
(4724, 1, 146, '2021-07-23 13:35:17', 'Ingreso', 'A crear Reunion'),
(4725, 1, 146, '2021-07-23 13:39:50', 'Ingreso', 'A crear Reunion'),
(4726, 1, 149, '2021-07-23 13:40:05', 'Ingreso', 'A Actas Pendientes'),
(4727, 1, 146, '2021-07-23 13:41:01', 'Ingreso', 'A crear Reunion'),
(4728, 1, 146, '2021-07-23 13:42:44', 'Ingreso', 'A crear Reunion'),
(4729, 1, 146, '2021-07-23 13:43:05', 'Ingreso', 'A crear Reunion'),
(4730, 1, 146, '2021-07-23 13:44:36', 'Ingreso', 'A crear Reunion'),
(4731, 1, 149, '2021-07-23 13:44:50', 'Ingreso', 'A Actas Pendientes'),
(4732, 1, 146, '2021-07-23 13:44:55', 'Ingreso', 'A crear Reunion'),
(4733, 1, 149, '2021-07-23 13:45:12', 'Ingreso', 'A Actas Pendientes'),
(4734, 1, 146, '2021-07-23 13:45:21', 'Ingreso', 'A crear Reunion'),
(4735, 1, 146, '2021-07-23 13:46:12', 'Ingreso', 'A crear Reunion'),
(4736, 1, 149, '2021-07-23 13:46:31', 'Ingreso', 'A Actas Pendientes'),
(4737, 1, 149, '2021-07-23 13:48:32', 'Ingreso', 'A Actas Pendientes'),
(4738, 1, 146, '2021-07-23 13:48:37', 'Ingreso', 'A crear Reunion'),
(4739, 1, 149, '2021-07-23 13:48:50', 'Ingreso', 'A Actas Pendientes'),
(4740, 1, 146, '2021-07-23 13:48:54', 'Ingreso', 'A crear Reunion'),
(4741, 1, 149, '2021-07-23 14:12:17', 'Ingreso', 'A Actas Pendientes'),
(4742, 1, 146, '2021-07-23 14:21:03', 'Ingreso', 'A crear Reunion'),
(4743, 1, 146, '2021-07-23 14:28:39', 'Ingreso', 'A crear Reunion'),
(4744, 1, 146, '2021-07-23 14:32:45', 'Ingreso', 'A crear Reunion'),
(4745, 1, 146, '2021-07-23 14:33:43', 'Ingreso', 'A crear Reunion'),
(4746, 1, 146, '2021-07-23 14:33:57', 'Ingreso', 'A crear Reunion'),
(4747, 1, 146, '2021-07-23 16:09:30', 'Ingreso', 'A crear Reunion'),
(4748, 1, 146, '2021-07-23 16:11:46', 'Ingreso', 'A crear Reunion'),
(4749, 1, 146, '2021-07-23 16:40:54', 'Ingreso', 'A crear Reunion'),
(4750, 1, 146, '2021-07-23 16:41:42', 'Ingreso', 'A crear Reunion'),
(4751, 1, 146, '2021-07-23 16:41:47', 'Ingreso', 'A crear Reunion'),
(4752, 1, 146, '2021-07-23 16:42:09', 'Ingreso', 'A crear Reunion'),
(4753, 1, 146, '2021-07-23 16:42:42', 'Ingreso', 'A crear Reunion'),
(4754, 1, 146, '2021-07-23 16:43:00', 'Ingreso', 'A crear Reunion'),
(4755, 1, 146, '2021-07-23 16:46:58', 'Ingreso', 'A crear Reunion'),
(4756, 1, 146, '2021-07-23 16:47:22', 'Ingreso', 'A crear Reunion'),
(4757, 1, 146, '2021-07-23 16:48:01', 'Ingreso', 'A crear Reunion'),
(4758, 1, 146, '2021-07-23 16:48:16', 'Ingreso', 'A crear Reunion'),
(4759, 1, 146, '2021-07-23 16:51:07', 'Ingreso', 'A crear Reunion'),
(4760, 1, 146, '2021-07-23 16:51:21', 'Ingreso', 'A crear Reunion'),
(4761, 1, 146, '2021-07-23 16:54:24', 'Ingreso', 'A crear Reunion'),
(4762, 1, 146, '2021-07-23 17:28:50', 'Ingreso', 'A crear Reunion'),
(4763, 1, 146, '2021-07-23 17:32:28', 'Ingreso', 'A crear Reunion'),
(4764, 1, 146, '2021-07-23 17:32:31', 'Ingreso', 'A crear Reunion'),
(4765, 1, 146, '2021-07-23 17:34:51', 'Ingreso', 'A crear Reunion'),
(4766, 1, 146, '2021-07-23 17:38:07', 'Ingreso', 'A crear Reunion'),
(4767, 1, 146, '2021-07-23 17:39:01', 'Ingreso', 'A crear Reunion'),
(4768, 1, 146, '2021-07-23 17:40:37', 'Ingreso', 'A crear Reunion'),
(4769, 1, 146, '2021-07-23 17:41:22', 'Ingreso', 'A crear Reunion'),
(4770, 1, 146, '2021-07-23 17:47:14', 'Ingreso', 'A crear Reunion'),
(4771, 1, 146, '2021-07-23 17:49:51', 'Ingreso', 'A crear Reunion'),
(4772, 1, 146, '2021-07-23 17:49:56', 'Ingreso', 'A crear Reunion'),
(4773, 1, 146, '2021-07-23 17:51:30', 'Ingreso', 'A crear Reunion'),
(4774, 1, 146, '2021-07-23 17:52:09', 'Ingreso', 'A crear Reunion'),
(4775, 1, 146, '2021-07-23 17:52:52', 'Ingreso', 'A crear Reunion'),
(4776, 1, 146, '2021-07-23 17:53:16', 'Ingreso', 'A crear Reunion'),
(4777, 1, 146, '2021-07-23 17:53:49', 'Ingreso', 'A crear Reunion'),
(4778, 1, 146, '2021-07-23 17:55:35', 'Ingreso', 'A crear Reunion'),
(4779, 1, 146, '2021-07-23 17:57:05', 'Ingreso', 'A crear Reunion'),
(4780, 1, 146, '2021-07-23 18:02:43', 'Ingreso', 'A crear Reunion'),
(4781, 1, 146, '2021-07-23 18:43:16', 'Ingreso', 'A crear Reunion'),
(4782, 1, 103, '2021-07-23 20:31:12', 'Ingreso', 'A Lista de Reuniones'),
(4783, 1, 103, '2021-07-23 20:37:48', 'Ingreso', 'A Lista de Reuniones'),
(4784, 1, 103, '2021-07-23 20:40:11', 'Ingreso', 'A Lista de Reuniones'),
(4785, 1, 103, '2021-07-23 20:41:28', 'Ingreso', 'A Lista de Reuniones'),
(4786, 1, 103, '2021-07-23 20:41:45', 'Ingreso', 'A Lista de Reuniones'),
(4787, 1, 103, '2021-07-23 20:41:53', 'Ingreso', 'A Lista de Reuniones'),
(4788, 1, 103, '2021-07-23 20:42:06', 'Ingreso', 'A Lista de Reuniones'),
(4789, 1, 103, '2021-07-23 20:42:46', 'Ingreso', 'A Lista de Reuniones'),
(4790, 1, 103, '2021-07-23 20:42:50', 'Ingreso', 'A Lista de Reuniones'),
(4791, 1, 103, '2021-07-23 20:43:01', 'Ingreso', 'A Lista de Reuniones'),
(4792, 1, 103, '2021-07-23 20:45:48', 'Ingreso', 'A Lista de Reuniones'),
(4793, 1, 103, '2021-07-24 10:22:56', 'Ingreso', 'A Lista de Reuniones'),
(4794, 1, 103, '2021-07-24 10:23:39', 'Ingreso', 'A Lista de Reuniones'),
(4795, 1, 103, '2021-07-24 10:24:42', 'Ingreso', 'A Lista de Reuniones'),
(4796, 1, 103, '2021-07-24 10:25:38', 'Ingreso', 'A Lista de Reuniones'),
(4797, 1, 103, '2021-07-24 10:25:47', 'Ingreso', 'A Lista de Reuniones'),
(4798, 1, 103, '2021-07-24 10:27:02', 'Ingreso', 'A Lista de Reuniones'),
(4799, 1, 103, '2021-07-24 10:28:29', 'Ingreso', 'A Lista de Reuniones'),
(4800, 1, 92, '2021-07-24 13:14:08', 'Ingresó', 'a mantenimiento de dias feriados'),
(4801, 1, 20, '2021-07-24 13:14:27', 'INGRESO', 'A REVISION DE DOCUMENTACION PRACTICA '),
(4802, 1, 16, '2021-07-24 13:14:30', 'INGRESO', 'A GESTION ASIGNATURA APROBADAS'),
(4803, 1, 16, '2021-07-24 13:14:32', 'INGRESO', 'A GESTION ASIGNATURA APROBADAS'),
(4804, 1, 36, '2021-07-24 13:14:42', 'INGRESO', 'A REVISION LISTA CARTA DE EGRESADO'),
(4805, 1, 23, '2021-07-24 13:14:54', 'INGRESO', 'A GESTION DE PROYECTOS'),
(4806, 1, 23, '2021-07-24 13:15:29', 'INGRESO', 'A GESTION DE EGRESADOS'),
(4807, 1, 23, '2021-07-24 13:15:54', 'INGRESO', 'A GESTION DE EGRESADOS'),
(4808, 1, 35, '2021-07-24 13:16:03', 'INGRESO', 'A REVISION LISTA CAMBIO DE CARRERA'),
(4809, 1, 35, '2021-07-24 13:16:07', 'INGRESO', 'A REVISION LISTA CAMBIO DE CARRERA'),
(4810, 1, 55, '2021-07-24 13:16:13', 'INGRESO', ' A GESTIONAR CARGA ACADEMICA'),
(4811, 1, 55, '2021-07-24 13:16:51', 'INGRESO', ' A GESTIONAR CARGA ACADEMICA'),
(4812, 1, 146, '2021-07-24 13:17:11', 'Ingreso', 'A crear Reunion'),
(4813, 1, 33, '2021-07-24 13:18:05', 'INGRESO', 'A SOLICITUD CANCELAR CLASES'),
(4814, 1, 55, '2021-07-24 13:19:49', 'INGRESO', ' A GESTIONAR CARGA ACADEMICA'),
(4815, 1, 32, '2021-07-24 13:21:57', 'INGRESO', 'A SOLICITUD DE EQUIVALENCIAS'),
(4816, 1, 2, '2021-07-24 13:22:09', 'Ingreso', 'A Gestion de Preguntas'),
(4817, 1, 92, '2021-07-24 13:22:19', 'Ingresó', 'a mantenimiento de dias feriados'),
(4818, 1, 14, '2021-07-24 13:22:21', 'INGRESO', 'A ASISTENCIA CHARLA.'),
(4819, 1, 15, '2021-07-24 13:22:25', 'INGRESO', 'A REGISTRAR ASIGNATURA APROBADAS'),
(4820, 1, 15, '2021-07-24 13:22:37', 'INGRESO', 'A REGISTRAR ASIGNATURA APROBADAS'),
(4821, 1, 15, '2021-07-24 13:22:43', 'INGRESO', 'A REGISTRAR ASIGNATURA APROBADAS'),
(4822, 1, 15, '2021-07-24 13:22:59', 'INSERTO', 'LA  ASIGNATURA ADMINISTRACION PUBLICA Y POLITICA INFORMATICA'),
(4823, 1, 15, '2021-07-24 13:22:59', 'INSERTO', 'LA  ASIGNATURA ADMON Y EVALUACION DE PROYECTOS EN INFORMATICA'),
(4824, 1, 149, '2021-07-24 14:13:15', 'Ingreso', 'A Actas Pendientes'),
(4825, 1, 146, '2021-07-24 14:13:19', 'Ingreso', 'A crear Reunion'),
(4826, 1, 149, '2021-07-24 14:13:54', 'Ingreso', 'A Actas Pendientes'),
(4827, 1, 146, '2021-07-24 14:13:57', 'Ingreso', 'A crear Reunion'),
(4828, 1, 146, '2021-07-24 14:18:03', 'Ingreso', 'A crear Reunion'),
(4829, 1, 149, '2021-07-24 14:18:15', 'Ingreso', 'A Actas Pendientes'),
(4830, 1, 146, '2021-07-24 14:18:28', 'Ingreso', 'A crear Reunion'),
(4831, 1, 146, '2021-07-24 14:22:56', 'Ingreso', 'A crear Reunion'),
(4832, 1, 149, '2021-07-24 14:23:15', 'Ingreso', 'A Actas Pendientes'),
(4833, 1, 146, '2021-07-24 14:23:37', 'Ingreso', 'A crear Reunion'),
(4834, 1, 146, '2021-07-24 14:28:58', 'Ingreso', 'A crear Reunion'),
(4835, 1, 146, '2021-07-24 14:29:08', 'Ingreso', 'A crear Reunion'),
(4836, 1, 146, '2021-07-24 14:29:32', 'Ingreso', 'A crear Reunion'),
(4837, 1, 146, '2021-07-24 14:30:13', 'Ingreso', 'A crear Reunion'),
(4838, 1, 149, '2021-07-24 14:30:46', 'Ingreso', 'A Actas Pendientes'),
(4839, 1, 146, '2021-07-24 14:31:00', 'Ingreso', 'A crear Reunion'),
(4840, 1, 146, '2021-07-24 14:48:47', 'Ingreso', 'A crear Reunion'),
(4841, 1, 146, '2021-07-24 14:49:37', 'Ingreso', 'A crear Reunion'),
(4842, 1, 146, '2021-07-24 14:54:06', 'Ingreso', 'A crear Reunion'),
(4843, 1, 146, '2021-07-24 15:03:29', 'Ingreso', 'A crear Reunion'),
(4844, 1, 149, '2021-07-24 15:03:45', 'Ingreso', 'A Actas Pendientes'),
(4845, 1, 146, '2021-07-24 15:03:48', 'Ingreso', 'A crear Reunion'),
(4846, 1, 146, '2021-07-24 15:07:11', 'Ingreso', 'A crear Reunion'),
(4847, 1, 146, '2021-07-24 15:14:37', 'Ingreso', 'A crear Reunion'),
(4848, 1, 146, '2021-07-24 15:15:03', 'Ingreso', 'A crear Reunion'),
(4849, 1, 149, '2021-07-24 15:15:45', 'Ingreso', 'A Actas Pendientes'),
(4850, 1, 146, '2021-07-24 15:24:13', 'Ingreso', 'A crear Reunion'),
(4851, 1, 146, '2021-07-24 15:24:25', 'Ingreso', 'A crear Reunion'),
(4852, 1, 149, '2021-07-24 15:25:57', 'Ingreso', 'A Actas Pendientes'),
(4853, 1, 146, '2021-07-24 15:26:01', 'Ingreso', 'A crear Reunion'),
(4854, 1, 149, '2021-07-24 15:28:43', 'Ingreso', 'A Actas Pendientes'),
(4855, 1, 146, '2021-07-24 15:28:48', 'Ingreso', 'A crear Reunion'),
(4856, 1, 103, '2021-07-24 16:22:17', 'Ingreso', 'A Lista de Reuniones'),
(4857, 1, 10, '2021-07-24 16:23:27', 'Ingreso', 'A Gestion de permisos usuarios'),
(4858, 1, 9, '2021-07-24 16:24:32', 'Ingreso', 'A Permisos a roles y pantallas'),
(4859, 1, 10, '2021-07-24 16:25:27', 'Ingreso', 'A Gestion de permisos usuarios'),
(4860, 1, 10, '2021-07-24 16:25:35', 'Ingreso', 'A Gestion de permisos usuarios'),
(4861, 1, 10, '2021-07-24 16:25:43', 'MODIFICO', 'EL INSERTAR AACTIVO,EL MODIFICAR AACTIVO ,EL ELIMINAR AACTIVO ,EL VISUALIZAR AACTIVO '),
(4862, 1, 10, '2021-07-24 16:25:43', 'Ingreso', 'A Gestion de permisos usuarios'),
(4863, 1, 155, '2021-07-24 16:25:49', 'Ingreso', 'A Asistencia por Persona'),
(4864, 1, 103, '2021-07-24 16:31:25', 'Ingreso', 'A Lista de Reuniones'),
(4865, 1, 103, '2021-07-24 16:32:25', 'Ingreso', 'A Lista de Reuniones'),
(4866, 1, 103, '2021-07-24 16:32:53', 'Ingreso', 'A Lista de Reuniones'),
(4867, 1, 103, '2021-07-24 16:33:25', 'Ingreso', 'A Lista de Reuniones'),
(4868, 1, 155, '2021-07-24 16:33:32', 'Ingreso', 'A Asistencia por Persona'),
(4869, 1, 103, '2021-07-24 16:33:49', 'Ingreso', 'A Lista de Reuniones'),
(4870, 1, 103, '2021-07-24 16:34:27', 'Ingreso', 'A Lista de Reuniones'),
(4871, 1, 103, '2021-07-24 16:35:01', 'Ingreso', 'A Lista de Reuniones'),
(4872, 1, 155, '2021-07-24 16:36:29', 'Ingreso', 'A Asistencia por Persona'),
(4873, 1, 149, '2021-07-24 16:44:12', 'Ingreso', 'A Actas Pendientes'),
(4874, 1, 146, '2021-07-24 16:44:53', 'Ingreso', 'A crear Reunion'),
(4875, 1, 146, '2021-07-24 16:45:20', 'Ingreso', 'A crear Reunion'),
(4876, 1, 149, '2021-07-24 16:45:24', 'Ingreso', 'A Actas Pendientes'),
(4877, 1, 146, '2021-07-24 16:45:28', 'Ingreso', 'A crear Reunion'),
(4878, 1, 149, '2021-07-24 16:45:56', 'Ingreso', 'A Actas Pendientes'),
(4879, 1, 146, '2021-07-24 16:45:59', 'Ingreso', 'A crear Reunion'),
(4880, 1, 149, '2021-07-24 16:46:10', 'Ingreso', 'A Actas Pendientes'),
(4881, 1, 103, '2021-07-24 16:50:56', 'Ingreso', 'A Lista de Reuniones'),
(4882, 1, 103, '2021-07-24 16:50:59', 'Ingreso', 'A Lista de Reuniones'),
(4883, 1, 103, '2021-07-24 16:54:38', 'Ingreso', 'A Lista de Reuniones'),
(4884, 1, 103, '2021-07-24 16:59:56', 'Ingreso', 'A Lista de Reuniones'),
(4885, 1, 103, '2021-07-24 17:00:06', 'Ingreso', 'A Lista de Reuniones'),
(4886, 1, 155, '2021-07-24 17:00:29', 'Ingreso', 'A Asistencia por Persona'),
(4887, 1, 103, '2021-07-24 17:00:33', 'Ingreso', 'A Lista de Reuniones'),
(4888, 1, 155, '2021-07-24 17:00:51', 'Ingreso', 'A Asistencia por Persona'),
(4889, 1, 155, '2021-07-24 17:04:10', 'Ingreso', 'A Asistencia por Persona'),
(4890, 1, 103, '2021-07-24 17:23:34', 'Ingreso', 'A Lista de Reuniones'),
(4891, 1, 146, '2021-07-24 17:23:40', 'Ingreso', 'A crear Reunion'),
(4892, 1, 146, '2021-07-24 17:23:58', 'Ingreso', 'A crear Reunion'),
(4893, 1, 146, '2021-07-24 17:24:50', 'Ingreso', 'A crear Reunion'),
(4894, 1, 146, '2021-07-24 17:26:47', 'Ingreso', 'A crear Reunion'),
(4895, 1, 146, '2021-07-24 17:26:52', 'Ingreso', 'A crear Reunion'),
(4896, 1, 146, '2021-07-24 17:27:02', 'Ingreso', 'A crear Reunion');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(4897, 1, 146, '2021-07-24 17:28:36', 'Ingreso', 'A crear Reunion'),
(4898, 1, 146, '2021-07-24 17:33:36', 'Ingreso', 'A crear Reunion'),
(4899, 1, 146, '2021-07-24 17:33:41', 'Ingreso', 'A crear Reunion'),
(4900, 1, 146, '2021-07-24 17:33:46', 'Ingreso', 'A crear Reunion'),
(4901, 1, 146, '2021-07-24 17:33:57', 'Ingreso', 'A crear Reunion'),
(4902, 1, 146, '2021-07-24 17:36:03', 'Ingreso', 'A crear Reunion'),
(4903, 1, 146, '2021-07-24 17:36:17', 'Ingreso', 'A crear Reunion'),
(4904, 1, 146, '2021-07-24 17:37:31', 'Ingreso', 'A crear Reunion'),
(4905, 1, 146, '2021-07-24 17:37:35', 'Ingreso', 'A crear Reunion'),
(4906, 1, 146, '2021-07-24 17:37:37', 'Ingreso', 'A crear Reunion'),
(4907, 1, 146, '2021-07-24 17:37:41', 'Ingreso', 'A crear Reunion'),
(4908, 1, 146, '2021-07-24 17:37:49', 'Ingreso', 'A crear Reunion'),
(4909, 1, 146, '2021-07-24 17:37:56', 'Ingreso', 'A crear Reunion'),
(4910, 1, 146, '2021-07-24 17:38:03', 'Ingreso', 'A crear Reunion'),
(4911, 1, 146, '2021-07-24 17:39:04', 'Ingreso', 'A crear Reunion'),
(4912, 1, 146, '2021-07-24 17:39:15', 'Ingreso', 'A crear Reunion'),
(4913, 1, 146, '2021-07-24 17:39:42', 'Ingreso', 'A crear Reunion'),
(4914, 1, 146, '2021-07-24 17:39:58', 'Ingreso', 'A crear Reunion'),
(4915, 1, 146, '2021-07-24 17:40:46', 'Ingreso', 'A crear Reunion'),
(4916, 1, 146, '2021-07-24 17:41:08', 'Ingreso', 'A crear Reunion'),
(4917, 1, 146, '2021-07-24 17:42:20', 'Ingreso', 'A crear Reunion'),
(4918, 1, 146, '2021-07-24 17:42:45', 'Ingreso', 'A crear Reunion'),
(4919, 1, 146, '2021-07-24 17:43:22', 'Ingreso', 'A crear Reunion'),
(4920, 1, 146, '2021-07-24 17:44:13', 'Ingreso', 'A crear Reunion'),
(4921, 1, 146, '2021-07-24 17:44:15', 'Ingreso', 'A crear Reunion'),
(4922, 1, 146, '2021-07-24 17:44:18', 'Ingreso', 'A crear Reunion'),
(4923, 1, 146, '2021-07-24 17:44:24', 'Ingreso', 'A crear Reunion'),
(4924, 1, 146, '2021-07-24 17:46:18', 'Ingreso', 'A crear Reunion'),
(4925, 1, 146, '2021-07-24 17:47:41', 'Ingreso', 'A crear Reunion'),
(4926, 1, 146, '2021-07-24 17:48:02', 'Ingreso', 'A crear Reunion'),
(4927, 1, 146, '2021-07-24 17:48:08', 'Ingreso', 'A crear Reunion'),
(4928, 1, 146, '2021-07-24 17:48:31', 'Ingreso', 'A crear Reunion'),
(4929, 1, 146, '2021-07-24 17:49:13', 'Ingreso', 'A crear Reunion'),
(4930, 1, 146, '2021-07-24 17:49:47', 'Ingreso', 'A crear Reunion'),
(4931, 1, 146, '2021-07-24 17:50:18', 'Ingreso', 'A crear Reunion'),
(4932, 1, 146, '2021-07-24 17:51:45', 'Ingreso', 'A crear Reunion'),
(4933, 1, 146, '2021-07-24 17:52:09', 'Ingreso', 'A crear Reunion'),
(4934, 1, 155, '2021-07-25 14:04:27', 'Ingreso', 'A Asistencia por Persona'),
(4935, 1, 155, '2021-07-25 14:40:53', 'Ingreso', 'A Asistencia por Persona'),
(4936, 1, 103, '2021-07-25 14:42:12', 'Ingreso', 'A Lista de Reuniones'),
(4937, 1, 146, '2021-07-25 14:44:40', 'Ingreso', 'A crear Reunion'),
(4938, 1, 103, '2021-07-25 14:45:00', 'Ingreso', 'A Lista de Reuniones'),
(4939, 1, 155, '2021-07-25 14:48:32', 'Ingreso', 'A Asistencia por Persona'),
(4940, 1, 103, '2021-07-25 14:49:37', 'Ingreso', 'A Lista de Reuniones'),
(4941, 1, 156, '2021-07-25 14:53:40', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4942, 1, 157, '2021-07-25 14:53:57', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4943, 1, 103, '2021-07-25 14:56:33', 'Ingreso', 'A Lista de Reuniones'),
(4944, 1, 103, '2021-07-25 14:57:12', 'Ingreso', 'A Lista de Reuniones'),
(4945, 1, 103, '2021-07-25 14:57:17', 'Ingreso', 'A Lista de Reuniones'),
(4946, 1, 103, '2021-07-25 14:58:01', 'Ingreso', 'A Lista de Reuniones'),
(4947, 1, 156, '2021-07-25 14:59:22', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4948, 1, 156, '2021-07-25 15:06:05', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4949, 1, 103, '2021-07-25 17:21:15', 'Ingreso', 'A Lista de Reuniones'),
(4950, 1, 149, '2021-07-25 17:21:22', 'Ingreso', 'A Actas Pendientes'),
(4951, 1, 103, '2021-07-25 17:21:30', 'Ingreso', 'A Lista de Reuniones'),
(4952, 1, 103, '2021-07-25 17:21:45', 'Ingreso', 'A Lista de Reuniones'),
(4953, 1, 103, '2021-07-25 17:21:52', 'Ingreso', 'A Lista de Reuniones'),
(4954, 1, 155, '2021-07-25 17:22:01', 'Ingreso', 'A Asistencia por Persona'),
(4955, 1, 151, '2021-07-25 17:22:54', 'Ingreso', 'A crear Acuerdo'),
(4956, 1, 151, '2021-07-25 17:25:37', 'Ingreso', 'A crear Acuerdo'),
(4957, 1, 151, '2021-07-25 18:19:30', 'Ingreso', 'A crear Acuerdo'),
(4958, 1, 103, '2021-07-25 18:32:51', 'Ingreso', 'A Lista de Reuniones'),
(4959, 1, 103, '2021-07-25 18:45:00', 'Ingreso', 'A Lista de Reuniones'),
(4960, 1, 103, '2021-07-25 21:09:30', 'Ingreso', 'A Lista de Reuniones'),
(4961, 1, 146, '2021-07-25 21:13:38', 'Ingreso', 'A crear Reunion'),
(4962, 1, 146, '2021-07-25 21:14:17', 'Ingreso', 'A crear Reunion'),
(4963, 1, 146, '2021-07-25 21:14:26', 'Ingreso', 'A crear Reunion'),
(4964, 1, 146, '2021-07-25 21:16:25', 'Ingreso', 'A crear Reunion'),
(4965, 1, 146, '2021-07-25 21:17:01', 'Ingreso', 'A crear Reunion'),
(4966, 1, 146, '2021-07-25 21:17:34', 'Ingreso', 'A crear Reunion'),
(4967, 1, 103, '2021-07-25 21:18:34', 'Ingreso', 'A Lista de Reuniones'),
(4968, 1, 155, '2021-07-25 21:18:37', 'Ingreso', 'A Asistencia por Persona'),
(4969, 1, 103, '2021-07-25 21:18:40', 'Ingreso', 'A Lista de Reuniones'),
(4970, 1, 103, '2021-07-25 21:21:04', 'Ingreso', 'A Lista de Reuniones'),
(4971, 1, 103, '2021-07-25 21:29:22', 'Ingreso', 'A Lista de Reuniones'),
(4972, 1, 103, '2021-07-25 21:49:05', 'Ingreso', 'A Lista de Reuniones'),
(4973, 1, 103, '2021-07-25 22:26:33', 'Ingreso', 'A Lista de Reuniones'),
(4974, 1, 103, '2021-07-25 22:28:06', 'Ingreso', 'A Lista de Reuniones'),
(4975, 1, 103, '2021-07-25 22:28:12', 'Ingreso', 'A Lista de Reuniones'),
(4976, 1, 155, '2021-07-25 22:28:28', 'Ingreso', 'A Asistencia por Persona'),
(4977, 1, 103, '2021-07-25 22:35:28', 'Ingreso', 'A Lista de Reuniones'),
(4978, 1, 103, '2021-07-25 22:37:17', 'Ingreso', 'A Lista de Reuniones'),
(4979, 1, 155, '2021-07-25 22:37:29', 'Ingreso', 'A Asistencia por Persona'),
(4980, 1, 103, '2021-07-25 22:37:46', 'Ingreso', 'A Lista de Reuniones'),
(4981, 1, 103, '2021-07-25 22:38:17', 'Ingreso', 'A Lista de Reuniones'),
(4982, 1, 155, '2021-07-25 22:38:22', 'Ingreso', 'A Asistencia por Persona'),
(4983, 1, 103, '2021-07-25 22:42:15', 'Ingreso', 'A Lista de Reuniones'),
(4984, 1, 155, '2021-07-26 10:22:19', 'Ingreso', 'A Asistencia por Persona'),
(4985, 1, 103, '2021-07-26 10:22:34', 'Ingreso', 'A Lista de Reuniones'),
(4986, 1, 156, '2021-07-26 10:22:55', 'Ingreso', 'A Mantenimiento Estado Acta'),
(4987, 1, 103, '2021-07-26 10:23:26', 'Ingreso', 'A Lista de Reuniones'),
(4988, 1, 146, '2021-07-26 10:27:59', 'Ingreso', 'A crear Reunion'),
(4989, 1, 103, '2021-07-26 10:29:02', 'Ingreso', 'A Lista de Reuniones'),
(4990, 1, 155, '2021-07-26 10:29:11', 'Ingreso', 'A Asistencia por Persona'),
(4991, 1, 146, '2021-07-26 10:40:00', 'Ingreso', 'A crear Reunion'),
(4992, 1, 155, '2021-07-26 10:42:35', 'Ingreso', 'A Asistencia por Persona'),
(4993, 1, 155, '2021-07-26 10:52:39', 'Ingreso', 'A Asistencia por Persona'),
(4994, 1, 103, '2021-07-26 10:58:04', 'Ingreso', 'A Lista de Reuniones'),
(4995, 1, 155, '2021-07-26 10:59:10', 'Ingreso', 'A Asistencia por Persona'),
(4996, 1, 155, '2021-07-26 11:01:46', 'Ingreso', 'A Asistencia por Persona'),
(4997, 1, 155, '2021-07-26 11:02:29', 'Ingreso', 'A Asistencia por Persona'),
(4998, 1, 155, '2021-07-26 11:02:51', 'Ingreso', 'A Asistencia por Persona'),
(4999, 1, 103, '2021-07-26 11:07:14', 'Ingreso', 'A Lista de Reuniones'),
(5000, 1, 155, '2021-07-26 11:08:14', 'Ingreso', 'A Asistencia por Persona'),
(5001, 1, 103, '2021-07-26 11:08:55', 'Ingreso', 'A Lista de Reuniones'),
(5002, 1, 155, '2021-07-26 11:10:24', 'Ingreso', 'A Asistencia por Persona'),
(5003, 1, 155, '2021-07-26 11:10:25', 'Ingreso', 'A Asistencia por Persona'),
(5004, 1, 155, '2021-07-26 11:10:28', 'Ingreso', 'A Asistencia por Persona'),
(5005, 1, 155, '2021-07-26 11:11:10', 'Ingreso', 'A Asistencia por Persona'),
(5006, 1, 103, '2021-07-26 11:23:34', 'Ingreso', 'A Lista de Reuniones'),
(5007, 1, 103, '2021-07-26 11:26:00', 'Ingreso', 'A Lista de Reuniones'),
(5008, 1, 103, '2021-07-26 11:35:11', 'Ingreso', 'A Lista de Reuniones'),
(5009, 1, 103, '2021-07-26 11:40:34', 'Ingreso', 'A Lista de Reuniones'),
(5010, 1, 103, '2021-07-26 11:41:35', 'Ingreso', 'A Lista de Reuniones'),
(5011, 1, 149, '2021-07-26 11:41:55', 'Ingreso', 'A Actas Pendientes'),
(5012, 1, 149, '2021-07-26 11:41:58', 'Ingreso', 'A Actas Pendientes'),
(5013, 1, 103, '2021-07-26 11:43:23', 'Ingreso', 'A Lista de Reuniones'),
(5014, 1, 103, '2021-07-26 11:45:26', 'Ingreso', 'A Lista de Reuniones'),
(5015, 1, 103, '2021-07-26 11:46:14', 'Ingreso', 'A Lista de Reuniones'),
(5016, 1, 103, '2021-07-26 11:46:17', 'Ingreso', 'A Lista de Reuniones'),
(5017, 1, 103, '2021-07-26 11:46:24', 'Ingreso', 'A Lista de Reuniones'),
(5018, 1, 149, '2021-07-26 11:46:34', 'Ingreso', 'A Actas Pendientes'),
(5019, 1, 103, '2021-07-26 11:47:01', 'Ingreso', 'A Lista de Reuniones'),
(5020, 1, 103, '2021-07-26 11:47:07', 'Ingreso', 'A Lista de Reuniones'),
(5021, 1, 155, '2021-07-26 11:47:12', 'Ingreso', 'A Asistencia por Persona'),
(5022, 1, 103, '2021-07-26 11:47:31', 'Ingreso', 'A Lista de Reuniones'),
(5023, 1, 149, '2021-07-26 11:51:55', 'Ingreso', 'A Actas Pendientes'),
(5024, 1, 149, '2021-07-26 11:52:36', 'Ingreso', 'A Actas Pendientes'),
(5025, 1, 103, '2021-07-26 11:53:06', 'Ingreso', 'A Lista de Reuniones'),
(5026, 1, 103, '2021-07-26 11:54:52', 'Ingreso', 'A Lista de Reuniones'),
(5027, 1, 103, '2021-07-26 11:54:52', 'Ingreso', 'A Lista de Reuniones'),
(5028, 1, 155, '2021-07-26 11:56:19', 'Ingreso', 'A Asistencia por Persona'),
(5029, 1, 155, '2021-07-26 11:58:31', 'Ingreso', 'A Asistencia por Persona'),
(5030, 1, 155, '2021-07-26 11:58:31', 'Ingreso', 'A Asistencia por Persona'),
(5031, 1, 155, '2021-07-26 11:58:32', 'Ingreso', 'A Asistencia por Persona'),
(5032, 1, 155, '2021-07-26 11:58:32', 'Ingreso', 'A Asistencia por Persona'),
(5033, 1, 155, '2021-07-26 11:58:43', 'Ingreso', 'A Asistencia por Persona'),
(5034, 1, 155, '2021-07-26 11:58:51', 'Ingreso', 'A Asistencia por Persona'),
(5035, 1, 155, '2021-07-26 11:59:02', 'Ingreso', 'A Asistencia por Persona'),
(5036, 1, 155, '2021-07-26 11:59:11', 'Ingreso', 'A Asistencia por Persona'),
(5037, 1, 155, '2021-07-26 11:59:22', 'Ingreso', 'A Asistencia por Persona'),
(5038, 1, 103, '2021-07-26 11:59:36', 'Ingreso', 'A Lista de Reuniones'),
(5039, 1, 103, '2021-07-26 12:02:45', 'Ingreso', 'A Lista de Reuniones'),
(5040, 1, 103, '2021-07-26 12:03:21', 'Ingreso', 'A Lista de Reuniones'),
(5041, 1, 103, '2021-07-26 12:03:21', 'Ingreso', 'A Lista de Reuniones'),
(5042, 1, 103, '2021-07-26 12:03:21', 'Ingreso', 'A Lista de Reuniones'),
(5043, 1, 103, '2021-07-26 12:03:21', 'Ingreso', 'A Lista de Reuniones'),
(5044, 1, 103, '2021-07-26 12:03:22', 'Ingreso', 'A Lista de Reuniones'),
(5045, 1, 103, '2021-07-26 12:04:00', 'Ingreso', 'A Lista de Reuniones'),
(5046, 1, 103, '2021-07-26 12:04:19', 'Ingreso', 'A Lista de Reuniones'),
(5047, 1, 103, '2021-07-26 12:04:31', 'Ingreso', 'A Lista de Reuniones'),
(5048, 1, 103, '2021-07-26 12:05:24', 'Ingreso', 'A Lista de Reuniones'),
(5049, 1, 103, '2021-07-26 12:05:56', 'Ingreso', 'A Lista de Reuniones'),
(5050, 1, 155, '2021-07-26 12:07:24', 'Ingreso', 'A Asistencia por Persona'),
(5051, 1, 155, '2021-07-26 12:07:49', 'Ingreso', 'A Asistencia por Persona'),
(5052, 1, 155, '2021-07-26 12:08:10', 'Ingreso', 'A Asistencia por Persona'),
(5053, 1, 155, '2021-07-26 12:09:12', 'Ingreso', 'A Asistencia por Persona'),
(5054, 1, 155, '2021-07-26 12:09:31', 'Ingreso', 'A Asistencia por Persona'),
(5055, 1, 155, '2021-07-26 12:10:37', 'Ingreso', 'A Asistencia por Persona'),
(5056, 1, 155, '2021-07-26 12:12:12', 'Ingreso', 'A Asistencia por Persona'),
(5057, 1, 155, '2021-07-26 12:12:20', 'Ingreso', 'A Asistencia por Persona'),
(5058, 1, 155, '2021-07-26 12:12:47', 'Ingreso', 'A Asistencia por Persona'),
(5059, 1, 155, '2021-07-26 12:13:11', 'Ingreso', 'A Asistencia por Persona'),
(5060, 1, 155, '2021-07-26 12:13:34', 'Ingreso', 'A Asistencia por Persona'),
(5061, 1, 155, '2021-07-26 12:13:47', 'Ingreso', 'A Asistencia por Persona'),
(5062, 1, 155, '2021-07-26 12:14:01', 'Ingreso', 'A Asistencia por Persona'),
(5063, 1, 155, '2021-07-26 12:15:36', 'Ingreso', 'A Asistencia por Persona'),
(5064, 1, 155, '2021-07-26 12:15:59', 'Ingreso', 'A Asistencia por Persona'),
(5065, 1, 155, '2021-07-26 12:16:39', 'Ingreso', 'A Asistencia por Persona'),
(5066, 1, 155, '2021-07-26 12:17:16', 'Ingreso', 'A Asistencia por Persona'),
(5067, 1, 155, '2021-07-26 12:17:58', 'Ingreso', 'A Asistencia por Persona'),
(5068, 1, 155, '2021-07-26 12:19:45', 'Ingreso', 'A Asistencia por Persona'),
(5069, 1, 155, '2021-07-26 12:20:54', 'Ingreso', 'A Asistencia por Persona'),
(5070, 1, 155, '2021-07-26 12:21:09', 'Ingreso', 'A Asistencia por Persona'),
(5071, 1, 155, '2021-07-26 12:21:40', 'Ingreso', 'A Asistencia por Persona'),
(5072, 1, 155, '2021-07-26 12:21:51', 'Ingreso', 'A Asistencia por Persona'),
(5073, 1, 155, '2021-07-26 12:22:30', 'Ingreso', 'A Asistencia por Persona'),
(5074, 1, 155, '2021-07-26 12:24:04', 'Ingreso', 'A Asistencia por Persona'),
(5075, 1, 103, '2021-07-26 12:24:07', 'Ingreso', 'A Lista de Reuniones'),
(5076, 1, 103, '2021-07-26 12:24:57', 'Ingreso', 'A Lista de Reuniones'),
(5077, 1, 155, '2021-07-26 12:25:56', 'Ingreso', 'A Asistencia por Persona'),
(5078, 1, 155, '2021-07-26 12:28:52', 'Ingreso', 'A Asistencia por Persona'),
(5079, 1, 155, '2021-07-26 12:32:04', 'Ingreso', 'A Asistencia por Persona'),
(5080, 1, 103, '2021-07-26 12:32:09', 'Ingreso', 'A Lista de Reuniones'),
(5081, 1, 103, '2021-07-26 12:32:42', 'Ingreso', 'A Lista de Reuniones'),
(5082, 1, 155, '2021-07-26 12:32:54', 'Ingreso', 'A Asistencia por Persona'),
(5083, 1, 155, '2021-07-26 12:33:04', 'Ingreso', 'A Asistencia por Persona'),
(5084, 1, 103, '2021-07-26 12:33:06', 'Ingreso', 'A Lista de Reuniones'),
(5085, 1, 155, '2021-07-26 12:33:44', 'Ingreso', 'A Asistencia por Persona'),
(5086, 1, 103, '2021-07-26 12:35:11', 'Ingreso', 'A Lista de Reuniones'),
(5087, 1, 103, '2021-07-26 12:38:01', 'Ingreso', 'A Lista de Reuniones'),
(5088, 1, 103, '2021-07-26 13:06:09', 'Ingreso', 'A Lista de Reuniones'),
(5089, 1, 103, '2021-07-26 13:06:21', 'Ingreso', 'A Lista de Reuniones'),
(5090, 1, 103, '2021-07-26 13:06:33', 'Ingreso', 'A Lista de Reuniones'),
(5091, 1, 103, '2021-07-26 13:08:19', 'Ingreso', 'A Lista de Reuniones'),
(5092, 1, 155, '2021-07-26 13:55:24', 'Ingreso', 'A Asistencia por Persona'),
(5093, 1, 155, '2021-07-26 14:02:29', 'Ingreso', 'A Asistencia por Persona'),
(5094, 1, 103, '2021-07-26 14:04:03', 'Ingreso', 'A Lista de Reuniones'),
(5095, 1, 103, '2021-07-26 14:05:08', 'Ingreso', 'A Lista de Reuniones'),
(5096, 1, 146, '2021-07-26 14:05:16', 'Ingreso', 'A crear Reunion'),
(5097, 1, 146, '2021-07-26 14:05:47', 'Ingreso', 'A crear Reunion'),
(5098, 1, 151, '2021-07-26 14:07:17', 'Ingreso', 'A crear Acuerdo'),
(5099, 1, 151, '2021-07-26 14:08:37', 'Ingreso', 'A crear Acuerdo'),
(5100, 1, 103, '2021-07-26 14:13:50', 'Ingreso', 'A Lista de Reuniones'),
(5101, 1, 154, '2021-07-26 19:00:09', 'Ingreso', 'Asistencia por actas'),
(5102, 1, 155, '2021-07-26 19:00:13', 'Ingreso', 'A Asistencia por Persona'),
(5103, 1, 149, '2021-07-26 19:01:20', 'Ingreso', 'A Actas Pendientes'),
(5104, 1, 150, '2021-07-26 19:01:23', 'Ingreso', 'A Lista Actas'),
(5105, 1, 151, '2021-07-26 19:03:01', 'Ingreso', 'A crear Acuerdo'),
(5106, 1, 150, '2021-07-26 19:03:34', 'Ingreso', 'A Lista Actas'),
(5107, 1, 155, '2021-07-26 19:05:05', 'Ingreso', 'A Asistencia por Persona'),
(5108, 1, 146, '2021-07-26 19:07:09', 'Ingreso', 'A crear Reunion'),
(5109, 1, 148, '2021-07-26 19:09:06', 'Ingreso', 'A Lista de Reuniones'),
(5110, 1, 148, '2021-07-26 19:09:48', 'Ingreso', 'A Lista de Reuniones'),
(5111, 1, 149, '2021-07-26 19:10:41', 'Ingreso', 'A Actas Pendientes'),
(5112, 1, 149, '2021-07-26 19:11:54', 'Ingreso', 'A Actas Pendientes'),
(5113, 1, 150, '2021-07-26 19:12:25', 'Ingreso', 'A Lista Actas'),
(5114, 1, 150, '2021-07-26 19:12:57', 'Ingreso', 'A Lista Actas'),
(5115, 1, 151, '2021-07-26 19:13:49', 'Ingreso', 'A crear Acuerdo'),
(5116, 1, 153, '2021-07-26 19:15:11', 'Ingreso', 'A Lista de Acuerdos'),
(5117, 1, 153, '2021-07-26 19:15:33', 'Ingreso', 'A Lista de Acuerdos'),
(5118, 1, 154, '2021-07-26 19:16:14', 'Ingreso', 'Asistencia por actas'),
(5119, 1, 155, '2021-07-26 19:16:18', 'Ingreso', 'A Asistencia por Persona'),
(5120, 1, 155, '2021-07-26 19:18:14', 'Ingreso', 'A Asistencia por Persona'),
(5121, 1, 147, '2021-07-27 18:03:20', 'Ingreso', 'A Reuniones Pendientes'),
(5122, 1, 146, '2021-07-27 18:03:35', 'Ingreso', 'A crear Reunion'),
(5123, 1, 147, '2021-07-27 18:03:42', 'Ingreso', 'A Reuniones Pendientes'),
(5124, 1, 149, '2021-07-27 18:04:08', 'Ingreso', 'A Actas Pendientes'),
(5125, 1, 153, '2021-07-27 18:04:22', 'Ingreso', 'A Lista de Acuerdos'),
(5126, 1, 152, '2021-07-27 18:04:38', 'Ingreso', 'A Acuerdos Pendientes'),
(5127, 1, 150, '2021-07-27 18:11:58', 'Ingreso', 'A Lista Actas'),
(5128, 1, 146, '2021-07-27 18:12:23', 'Ingreso', 'A crear Reunion'),
(5129, 1, 146, '2021-07-27 18:12:40', 'Ingreso', 'A crear Reunion'),
(5130, 1, 149, '2021-07-27 18:13:06', 'Ingreso', 'A Actas Pendientes'),
(5131, 1, 146, '2021-07-27 18:13:08', 'Ingreso', 'A crear Reunion'),
(5132, 1, 154, '2021-07-27 18:13:55', 'Ingreso', 'Asistencia por actas'),
(5133, 1, 152, '2021-07-27 18:16:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5134, 1, 153, '2021-07-27 18:16:42', 'Ingreso', 'A Lista de Acuerdos'),
(5135, 1, 148, '2021-07-27 18:17:07', 'Ingreso', 'A Lista de Reuniones'),
(5136, 1, 156, '2021-07-27 18:18:11', 'Ingreso', 'A Mantenimiento Estado Acta'),
(5137, 1, 157, '2021-07-27 18:18:40', 'Ingreso', 'A Mantenimiento Estado Acta'),
(5138, 1, 158, '2021-07-27 18:18:50', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(5139, 1, 159, '2021-07-27 18:19:04', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(5140, 1, 146, '2021-07-27 18:20:18', 'Ingreso', 'A crear Reunion'),
(5141, 1, 147, '2021-07-27 18:24:38', 'Ingreso', 'A Reuniones Pendientes'),
(5142, 1, 146, '2021-07-27 18:26:49', 'Ingreso', 'A crear Reunion'),
(5143, 1, 146, '2021-07-27 18:26:58', 'Ingreso', 'A crear Reunion'),
(5144, 1, 146, '2021-07-27 18:29:00', 'Ingreso', 'A crear Reunion'),
(5145, 1, 146, '2021-07-27 18:30:28', 'Ingreso', 'A crear Reunion'),
(5146, 1, 147, '2021-07-27 18:30:41', 'Ingreso', 'A Reuniones Pendientes'),
(5147, 1, 149, '2021-07-27 18:31:00', 'Ingreso', 'A Actas Pendientes'),
(5148, 1, 147, '2021-07-27 18:37:42', 'Ingreso', 'A Reuniones Pendientes'),
(5149, 1, 146, '2021-07-27 18:37:45', 'Ingreso', 'A crear Reunion'),
(5150, 1, 147, '2021-07-27 18:40:01', 'Ingreso', 'A Reuniones Pendientes'),
(5151, 1, 146, '2021-07-27 18:40:05', 'Ingreso', 'A crear Reunion'),
(5152, 1, 146, '2021-07-27 18:40:23', 'Ingreso', 'A crear Reunion'),
(5153, 1, 146, '2021-07-27 18:44:20', 'Ingreso', 'A crear Reunion'),
(5154, 1, 147, '2021-07-28 14:08:11', 'Ingreso', 'A Reuniones Pendientes'),
(5155, 1, 146, '2021-07-28 14:08:15', 'Ingreso', 'A crear Reunion'),
(5156, 1, 147, '2021-07-28 14:08:21', 'Ingreso', 'A Reuniones Pendientes'),
(5157, 1, 147, '2021-07-28 14:15:40', 'Ingreso', 'A Reuniones Pendientes'),
(5158, 1, 147, '2021-07-28 14:16:48', 'Ingreso', 'A Reuniones Pendientes'),
(5159, 1, 147, '2021-07-28 14:20:24', 'Ingreso', 'A Reuniones Pendientes'),
(5160, 1, 147, '2021-07-28 14:28:21', 'Ingreso', 'A Reuniones Pendientes'),
(5161, 1, 147, '2021-07-29 12:00:59', 'Ingreso', 'A Reuniones Pendientes'),
(5162, 1, 147, '2021-07-29 12:03:03', 'Ingreso', 'A Reuniones Pendientes'),
(5163, 1, 147, '2021-07-29 12:03:47', 'Ingreso', 'A Reuniones Pendientes'),
(5164, 1, 147, '2021-07-29 12:05:06', 'Ingreso', 'A Reuniones Pendientes'),
(5165, 1, 147, '2021-07-29 12:05:48', 'Ingreso', 'A Reuniones Pendientes'),
(5166, 1, 147, '2021-07-29 12:10:04', 'Ingreso', 'A Reuniones Pendientes'),
(5167, 1, 147, '2021-07-29 12:10:38', 'Ingreso', 'A Reuniones Pendientes'),
(5168, 1, 147, '2021-07-29 12:11:06', 'Ingreso', 'A Reuniones Pendientes'),
(5169, 1, 147, '2021-07-29 12:13:22', 'Ingreso', 'A Reuniones Pendientes'),
(5170, 1, 147, '2021-07-29 12:14:08', 'Ingreso', 'A Reuniones Pendientes'),
(5171, 1, 147, '2021-07-29 12:14:24', 'Ingreso', 'A Reuniones Pendientes'),
(5172, 1, 147, '2021-07-29 12:14:40', 'Ingreso', 'A Reuniones Pendientes'),
(5173, 1, 147, '2021-07-29 12:14:47', 'Ingreso', 'A Reuniones Pendientes'),
(5174, 1, 147, '2021-07-29 12:15:04', 'Ingreso', 'A Reuniones Pendientes'),
(5175, 1, 147, '2021-07-29 12:15:11', 'Ingreso', 'A Reuniones Pendientes'),
(5176, 1, 147, '2021-07-29 12:15:18', 'Ingreso', 'A Reuniones Pendientes'),
(5177, 1, 147, '2021-07-29 12:15:26', 'Ingreso', 'A Reuniones Pendientes'),
(5178, 1, 147, '2021-07-29 12:15:31', 'Ingreso', 'A Reuniones Pendientes'),
(5179, 1, 147, '2021-07-29 12:15:39', 'Ingreso', 'A Reuniones Pendientes'),
(5180, 1, 147, '2021-07-29 12:16:02', 'Ingreso', 'A Reuniones Pendientes'),
(5181, 1, 147, '2021-07-29 12:16:16', 'Ingreso', 'A Reuniones Pendientes'),
(5182, 1, 147, '2021-07-29 12:16:25', 'Ingreso', 'A Reuniones Pendientes'),
(5183, 1, 147, '2021-07-29 12:16:53', 'Ingreso', 'A Reuniones Pendientes'),
(5184, 1, 147, '2021-07-29 12:17:03', 'Ingreso', 'A Reuniones Pendientes'),
(5185, 1, 147, '2021-07-29 12:17:23', 'Ingreso', 'A Reuniones Pendientes'),
(5186, 1, 147, '2021-07-29 12:17:29', 'Ingreso', 'A Reuniones Pendientes'),
(5187, 1, 147, '2021-07-29 13:19:16', 'Ingreso', 'A Reuniones Pendientes'),
(5188, 1, 147, '2021-07-29 13:25:54', 'Ingreso', 'A Reuniones Pendientes'),
(5189, 1, 147, '2021-07-29 13:26:00', 'Ingreso', 'A Reuniones Pendientes'),
(5190, 1, 147, '2021-07-29 13:28:23', 'Ingreso', 'A Reuniones Pendientes'),
(5191, 1, 147, '2021-07-29 13:41:32', 'Ingreso', 'A Reuniones Pendientes'),
(5192, 1, 147, '2021-07-29 13:45:29', 'Ingreso', 'A Reuniones Pendientes'),
(5193, 1, 147, '2021-07-29 13:45:44', 'Ingreso', 'A Reuniones Pendientes'),
(5194, 1, 147, '2021-07-29 13:47:17', 'Ingreso', 'A Reuniones Pendientes'),
(5195, 1, 147, '2021-07-29 13:48:00', 'Ingreso', 'A Reuniones Pendientes'),
(5196, 1, 147, '2021-07-29 13:48:16', 'Ingreso', 'A Reuniones Pendientes'),
(5197, 1, 147, '2021-07-29 13:48:28', 'Ingreso', 'A Reuniones Pendientes'),
(5198, 1, 147, '2021-07-29 13:49:57', 'Ingreso', 'A Reuniones Pendientes'),
(5199, 1, 147, '2021-07-29 13:50:54', 'Ingreso', 'A Reuniones Pendientes'),
(5200, 1, 147, '2021-07-29 13:50:59', 'Ingreso', 'A Reuniones Pendientes'),
(5201, 1, 147, '2021-07-29 13:52:50', 'Ingreso', 'A Reuniones Pendientes'),
(5202, 1, 147, '2021-07-29 13:52:55', 'Ingreso', 'A Reuniones Pendientes'),
(5203, 1, 147, '2021-07-29 13:53:05', 'Ingreso', 'A Reuniones Pendientes'),
(5204, 1, 147, '2021-07-29 13:55:27', 'Ingreso', 'A Reuniones Pendientes'),
(5205, 1, 147, '2021-07-29 13:55:55', 'Ingreso', 'A Reuniones Pendientes'),
(5206, 1, 147, '2021-07-29 13:57:36', 'Ingreso', 'A Reuniones Pendientes'),
(5207, 1, 147, '2021-07-29 13:58:44', 'Ingreso', 'A Reuniones Pendientes'),
(5208, 1, 147, '2021-07-29 13:59:44', 'Ingreso', 'A Reuniones Pendientes'),
(5209, 1, 147, '2021-07-29 14:00:59', 'Ingreso', 'A Reuniones Pendientes'),
(5210, 1, 147, '2021-07-29 14:01:55', 'Ingreso', 'A Reuniones Pendientes'),
(5211, 1, 147, '2021-07-29 14:14:36', 'Ingreso', 'A Reuniones Pendientes'),
(5212, 1, 147, '2021-07-29 14:14:53', 'Ingreso', 'A Reuniones Pendientes'),
(5213, 1, 147, '2021-07-29 14:16:57', 'Ingreso', 'A Reuniones Pendientes'),
(5214, 1, 147, '2021-07-29 14:17:20', 'Ingreso', 'A Reuniones Pendientes'),
(5215, 1, 147, '2021-07-29 14:17:34', 'Ingreso', 'A Reuniones Pendientes'),
(5216, 1, 147, '2021-07-29 14:17:48', 'Ingreso', 'A Reuniones Pendientes'),
(5217, 1, 147, '2021-07-29 14:17:58', 'Ingreso', 'A Reuniones Pendientes'),
(5218, 1, 147, '2021-07-29 14:18:12', 'Ingreso', 'A Reuniones Pendientes'),
(5219, 1, 147, '2021-07-29 14:18:29', 'Ingreso', 'A Reuniones Pendientes'),
(5220, 1, 147, '2021-07-29 14:18:44', 'Ingreso', 'A Reuniones Pendientes'),
(5221, 1, 147, '2021-07-29 14:18:59', 'Ingreso', 'A Reuniones Pendientes'),
(5222, 1, 147, '2021-07-29 14:19:10', 'Ingreso', 'A Reuniones Pendientes'),
(5223, 1, 147, '2021-07-29 14:19:20', 'Ingreso', 'A Reuniones Pendientes'),
(5224, 1, 147, '2021-07-29 14:19:30', 'Ingreso', 'A Reuniones Pendientes'),
(5225, 1, 147, '2021-07-29 14:19:45', 'Ingreso', 'A Reuniones Pendientes'),
(5226, 1, 147, '2021-07-29 14:23:04', 'Ingreso', 'A Reuniones Pendientes'),
(5227, 1, 147, '2021-07-29 14:26:00', 'Ingreso', 'A Reuniones Pendientes'),
(5228, 1, 147, '2021-07-29 14:58:04', 'Ingreso', 'A Reuniones Pendientes'),
(5229, 1, 147, '2021-07-29 14:58:13', 'Ingreso', 'A Reuniones Pendientes'),
(5230, 1, 147, '2021-07-29 14:58:36', 'Ingreso', 'A Reuniones Pendientes'),
(5231, 1, 147, '2021-07-29 14:58:50', 'Ingreso', 'A Reuniones Pendientes'),
(5232, 1, 147, '2021-07-29 15:06:23', 'Ingreso', 'A Reuniones Pendientes'),
(5233, 1, 147, '2021-07-29 15:11:05', 'Ingreso', 'A Reuniones Pendientes'),
(5234, 1, 147, '2021-07-29 15:15:10', 'Ingreso', 'A Reuniones Pendientes'),
(5235, 1, 147, '2021-07-29 15:23:28', 'Ingreso', 'A Reuniones Pendientes'),
(5236, 1, 147, '2021-07-29 15:24:14', 'Ingreso', 'A Reuniones Pendientes'),
(5237, 1, 147, '2021-07-29 15:30:24', 'Ingreso', 'A Reuniones Pendientes'),
(5238, 1, 147, '2021-07-29 15:30:49', 'Ingreso', 'A Reuniones Pendientes'),
(5239, 1, 147, '2021-07-29 15:30:58', 'Ingreso', 'A Reuniones Pendientes'),
(5240, 1, 147, '2021-07-29 15:31:39', 'Ingreso', 'A Reuniones Pendientes'),
(5241, 1, 147, '2021-07-29 15:33:39', 'Ingreso', 'A Reuniones Pendientes'),
(5242, 1, 147, '2021-07-29 15:36:45', 'Ingreso', 'A Reuniones Pendientes'),
(5243, 1, 147, '2021-07-29 15:37:21', 'Ingreso', 'A Reuniones Pendientes'),
(5244, 1, 147, '2021-07-29 15:37:29', 'Ingreso', 'A Reuniones Pendientes'),
(5245, 1, 147, '2021-07-29 15:37:39', 'Ingreso', 'A Reuniones Pendientes'),
(5246, 1, 147, '2021-07-29 15:38:15', 'Ingreso', 'A Reuniones Pendientes'),
(5247, 1, 147, '2021-07-29 15:38:32', 'Ingreso', 'A Reuniones Pendientes'),
(5248, 1, 147, '2021-07-29 15:38:35', 'Ingreso', 'A Reuniones Pendientes'),
(5249, 1, 147, '2021-07-29 15:38:47', 'Ingreso', 'A Reuniones Pendientes'),
(5250, 1, 147, '2021-07-29 15:39:10', 'Ingreso', 'A Reuniones Pendientes'),
(5251, 1, 147, '2021-07-29 15:39:22', 'Ingreso', 'A Reuniones Pendientes'),
(5252, 1, 147, '2021-07-29 15:39:29', 'Ingreso', 'A Reuniones Pendientes'),
(5253, 1, 147, '2021-07-29 15:39:32', 'Ingreso', 'A Reuniones Pendientes'),
(5254, 1, 147, '2021-07-29 15:40:06', 'Ingreso', 'A Reuniones Pendientes'),
(5255, 1, 147, '2021-07-29 15:40:09', 'Ingreso', 'A Reuniones Pendientes'),
(5256, 1, 147, '2021-07-29 15:40:40', 'Ingreso', 'A Reuniones Pendientes'),
(5257, 1, 147, '2021-07-29 15:41:01', 'Ingreso', 'A Reuniones Pendientes'),
(5258, 1, 147, '2021-07-29 15:41:26', 'Ingreso', 'A Reuniones Pendientes'),
(5259, 1, 147, '2021-07-29 15:41:48', 'Ingreso', 'A Reuniones Pendientes'),
(5260, 1, 147, '2021-07-29 15:41:51', 'Ingreso', 'A Reuniones Pendientes'),
(5261, 1, 147, '2021-07-29 15:42:04', 'Ingreso', 'A Reuniones Pendientes'),
(5262, 1, 147, '2021-07-29 15:42:39', 'Ingreso', 'A Reuniones Pendientes'),
(5263, 1, 147, '2021-07-29 15:43:17', 'Ingreso', 'A Reuniones Pendientes'),
(5264, 1, 147, '2021-07-29 15:44:03', 'Ingreso', 'A Reuniones Pendientes'),
(5265, 1, 148, '2021-07-29 15:44:10', 'Ingreso', 'A Lista de Reuniones'),
(5266, 1, 148, '2021-07-29 15:50:11', 'Ingreso', 'A Lista de Reuniones'),
(5267, 1, 147, '2021-07-29 15:51:14', 'Ingreso', 'A Reuniones Pendientes'),
(5268, 1, 146, '2021-07-29 15:51:18', 'Ingreso', 'A crear Reunion'),
(5269, 1, 147, '2021-07-29 15:52:26', 'Ingreso', 'A Reuniones Pendientes'),
(5270, 1, 148, '2021-07-29 16:13:29', 'Ingreso', 'A Lista de Reuniones'),
(5271, 1, 148, '2021-07-29 16:50:37', 'Ingreso', 'A Lista de Reuniones'),
(5272, 1, 148, '2021-07-29 16:51:29', 'Ingreso', 'A Lista de Reuniones'),
(5273, 1, 148, '2021-07-29 16:51:29', 'Ingreso', 'A Lista de Reuniones'),
(5274, 1, 148, '2021-07-29 16:51:30', 'Ingreso', 'A Lista de Reuniones'),
(5275, 1, 148, '2021-07-29 16:51:30', 'Ingreso', 'A Lista de Reuniones'),
(5276, 1, 7, '2021-07-29 16:52:22', 'Ingreso', 'A Gestion de Parametros'),
(5277, 1, 7, '2021-07-29 16:52:40', 'Ingreso', 'A Gestion de Parametros'),
(5278, 1, 7, '2021-07-29 16:52:49', 'MODIFICO', 'LA DESCRIPCION 1MB = 1 MILLóN DE BYTES, CON EL VALOR500000'),
(5279, 1, 7, '2021-07-29 16:52:50', 'Ingreso', 'A Gestion de Parametros'),
(5280, 1, 7, '2021-07-29 16:52:55', 'Ingreso', 'A Gestion de Parametros'),
(5281, 1, 7, '2021-07-29 16:53:02', 'MODIFICO', 'LA DESCRIPCION 1MB = 1 MILLóN DE BYTES, CON EL VALOR1000000'),
(5282, 1, 7, '2021-07-29 16:53:02', 'Ingreso', 'A Gestion de Parametros'),
(5283, 1, 7, '2021-07-29 16:53:09', 'Ingreso', 'A Gestion de Parametros'),
(5284, 1, 7, '2021-07-29 16:53:39', 'MODIFICO', 'LA DESCRIPCION ARCHIVO_PERMITIDOS PARA ACTAS, CON EL VALOR.docx,.doc,.mppx,.pttx,.ptt,.zip,.mp4,.mpp'),
(5285, 1, 7, '2021-07-29 16:53:39', 'Ingreso', 'A Gestion de Parametros'),
(5286, 1, 148, '2021-07-29 16:58:25', 'Ingreso', 'A Lista de Reuniones'),
(5287, 1, 147, '2021-07-29 16:58:32', 'Ingreso', 'A Reuniones Pendientes'),
(5288, 1, 147, '2021-07-29 16:58:47', 'Ingreso', 'A Reuniones Pendientes'),
(5289, 1, 147, '2021-07-29 16:59:48', 'Ingreso', 'A Reuniones Pendientes'),
(5290, 1, 147, '2021-07-29 17:00:59', 'Ingreso', 'A Reuniones Pendientes'),
(5291, 1, 147, '2021-07-29 17:03:26', 'Ingreso', 'A Reuniones Pendientes'),
(5292, 1, 147, '2021-07-29 17:03:48', 'Ingreso', 'A Reuniones Pendientes'),
(5293, 1, 147, '2021-07-29 17:04:56', 'Ingreso', 'A Reuniones Pendientes'),
(5294, 1, 150, '2021-07-29 17:07:19', 'Ingreso', 'A Lista Actas'),
(5295, 1, 146, '2021-07-29 17:07:25', 'Ingreso', 'A crear Reunion'),
(5296, 1, 146, '2021-07-29 17:08:18', 'Ingreso', 'A crear Reunion'),
(5297, 1, 146, '2021-07-29 17:08:57', 'Ingreso', 'A crear Reunion'),
(5298, 1, 146, '2021-07-29 17:09:35', 'Ingreso', 'A crear Reunion'),
(5299, 1, 146, '2021-07-29 17:09:44', 'Ingreso', 'A crear Reunion'),
(5300, 1, 146, '2021-07-29 17:10:31', 'Ingreso', 'A crear Reunion'),
(5301, 1, 146, '2021-07-29 17:10:55', 'Ingreso', 'A crear Reunion'),
(5302, 1, 146, '2021-07-29 17:11:18', 'Ingreso', 'A crear Reunion'),
(5303, 1, 146, '2021-07-29 17:11:28', 'Ingreso', 'A crear Reunion'),
(5304, 1, 146, '2021-07-29 17:12:10', 'Ingreso', 'A crear Reunion'),
(5305, 1, 146, '2021-07-29 17:13:37', 'Ingreso', 'A crear Reunion'),
(5306, 1, 146, '2021-07-29 17:13:43', 'Ingreso', 'A crear Reunion'),
(5307, 1, 146, '2021-07-29 17:14:16', 'Ingreso', 'A crear Reunion'),
(5308, 1, 146, '2021-07-29 17:14:29', 'Ingreso', 'A crear Reunion'),
(5309, 1, 7, '2021-07-29 17:15:03', 'Ingreso', 'A Gestion de Parametros'),
(5310, 1, 146, '2021-07-29 17:22:17', 'Ingreso', 'A crear Reunion'),
(5311, 1, 147, '2021-07-29 17:22:23', 'Ingreso', 'A Reuniones Pendientes'),
(5312, 1, 147, '2021-07-29 17:26:57', 'Ingreso', 'A Reuniones Pendientes'),
(5313, 1, 147, '2021-07-29 17:27:01', 'Ingreso', 'A Reuniones Pendientes'),
(5314, 1, 146, '2021-07-29 17:27:05', 'Ingreso', 'A crear Reunion'),
(5315, 1, 146, '2021-07-29 17:27:48', 'Ingreso', 'A crear Reunion'),
(5316, 1, 147, '2021-07-29 17:27:53', 'Ingreso', 'A Reuniones Pendientes'),
(5317, 1, 146, '2021-07-29 17:28:04', 'Ingreso', 'A crear Reunion'),
(5318, 1, 147, '2021-07-29 17:28:09', 'Ingreso', 'A Reuniones Pendientes'),
(5319, 1, 147, '2021-07-29 17:28:22', 'Ingreso', 'A Reuniones Pendientes'),
(5320, 1, 146, '2021-07-29 17:28:45', 'Ingreso', 'A crear Reunion'),
(5321, 1, 146, '2021-07-29 17:29:06', 'Ingreso', 'A crear Reunion'),
(5322, 1, 147, '2021-07-29 17:29:07', 'Ingreso', 'A Reuniones Pendientes'),
(5323, 1, 146, '2021-07-29 17:29:13', 'Ingreso', 'A crear Reunion'),
(5324, 1, 147, '2021-07-29 17:29:56', 'Ingreso', 'A Reuniones Pendientes'),
(5325, 1, 147, '2021-07-29 17:29:57', 'Ingreso', 'A Reuniones Pendientes'),
(5326, 1, 147, '2021-07-29 17:31:05', 'Ingreso', 'A Reuniones Pendientes'),
(5327, 1, 146, '2021-07-29 17:31:11', 'Ingreso', 'A crear Reunion'),
(5328, 1, 146, '2021-07-29 17:31:50', 'Ingreso', 'A crear Reunion'),
(5329, 1, 147, '2021-07-29 17:31:52', 'Ingreso', 'A Reuniones Pendientes'),
(5330, 1, 146, '2021-07-29 17:31:58', 'Ingreso', 'A crear Reunion'),
(5331, 1, 147, '2021-07-29 17:34:23', 'Ingreso', 'A Reuniones Pendientes'),
(5332, 1, 147, '2021-07-29 17:34:54', 'Ingreso', 'A Reuniones Pendientes'),
(5333, 1, 146, '2021-07-29 17:35:01', 'Ingreso', 'A crear Reunion'),
(5334, 1, 147, '2021-07-29 17:35:05', 'Ingreso', 'A Reuniones Pendientes'),
(5335, 1, 146, '2021-07-29 17:35:10', 'Ingreso', 'A crear Reunion'),
(5336, 1, 147, '2021-07-29 17:35:21', 'Ingreso', 'A Reuniones Pendientes'),
(5337, 1, 147, '2021-07-29 17:35:33', 'Ingreso', 'A Reuniones Pendientes'),
(5338, 1, 147, '2021-07-29 17:41:33', 'Ingreso', 'A Reuniones Pendientes'),
(5339, 1, 148, '2021-07-29 17:41:40', 'Ingreso', 'A Lista de Reuniones'),
(5340, 1, 149, '2021-07-29 17:41:46', 'Ingreso', 'A Actas Pendientes'),
(5341, 1, 152, '2021-07-29 17:41:51', 'Ingreso', 'A Acuerdos Pendientes'),
(5342, 1, 151, '2021-07-29 17:45:14', 'Ingreso', 'A crear Acuerdo'),
(5343, 1, 151, '2021-07-29 17:50:35', 'Ingreso', 'A crear Acuerdo'),
(5344, 1, 151, '2021-07-29 17:50:41', 'Ingreso', 'A crear Acuerdo'),
(5345, 1, 151, '2021-07-29 17:52:26', 'Ingreso', 'A crear Acuerdo'),
(5346, 1, 151, '2021-07-29 17:54:08', 'Ingreso', 'A crear Acuerdo'),
(5347, 1, 151, '2021-07-29 17:55:05', 'Ingreso', 'A crear Acuerdo'),
(5348, 1, 151, '2021-07-29 17:57:22', 'Ingreso', 'A crear Acuerdo'),
(5349, 1, 151, '2021-07-29 17:57:25', 'Ingreso', 'A crear Acuerdo'),
(5350, 1, 152, '2021-07-29 17:57:36', 'Ingreso', 'A Acuerdos Pendientes'),
(5351, 1, 151, '2021-07-29 17:57:43', 'Ingreso', 'A crear Acuerdo'),
(5352, 1, 151, '2021-07-29 17:59:01', 'Ingreso', 'A crear Acuerdo'),
(5353, 1, 151, '2021-07-29 17:59:05', 'Ingreso', 'A crear Acuerdo'),
(5354, 1, 151, '2021-07-29 17:59:15', 'Ingreso', 'A crear Acuerdo'),
(5355, 1, 151, '2021-07-29 18:00:19', 'Ingreso', 'A crear Acuerdo'),
(5356, 1, 151, '2021-07-29 18:00:23', 'Ingreso', 'A crear Acuerdo'),
(5357, 1, 152, '2021-07-29 18:00:29', 'Ingreso', 'A Acuerdos Pendientes'),
(5358, 1, 151, '2021-07-29 18:00:33', 'Ingreso', 'A crear Acuerdo'),
(5359, 1, 152, '2021-07-29 18:00:37', 'Ingreso', 'A Acuerdos Pendientes'),
(5360, 1, 152, '2021-07-29 18:15:50', 'Ingreso', 'A Acuerdos Pendientes'),
(5361, 1, 152, '2021-07-29 18:31:01', 'Ingreso', 'A Acuerdos Pendientes'),
(5362, 1, 152, '2021-07-29 18:47:56', 'Ingreso', 'A Acuerdos Pendientes'),
(5363, 1, 152, '2021-07-29 18:50:05', 'Ingreso', 'A Acuerdos Pendientes'),
(5364, 1, 152, '2021-07-29 18:50:29', 'Ingreso', 'A Acuerdos Pendientes'),
(5365, 1, 152, '2021-07-29 18:50:29', 'Ingreso', 'A Acuerdos Pendientes'),
(5366, 1, 152, '2021-07-29 18:50:29', 'Ingreso', 'A Acuerdos Pendientes'),
(5367, 1, 152, '2021-07-29 18:50:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5368, 1, 152, '2021-07-29 18:50:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5369, 1, 152, '2021-07-29 18:50:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5370, 1, 152, '2021-07-29 18:50:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5371, 1, 152, '2021-07-29 18:50:31', 'Ingreso', 'A Acuerdos Pendientes'),
(5372, 1, 152, '2021-07-29 18:50:31', 'Ingreso', 'A Acuerdos Pendientes'),
(5373, 1, 152, '2021-07-29 18:50:31', 'Ingreso', 'A Acuerdos Pendientes'),
(5374, 1, 152, '2021-07-29 18:50:31', 'Ingreso', 'A Acuerdos Pendientes'),
(5375, 1, 152, '2021-07-29 18:50:31', 'Ingreso', 'A Acuerdos Pendientes'),
(5376, 1, 152, '2021-07-29 18:50:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5377, 1, 152, '2021-07-29 18:50:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5378, 1, 152, '2021-07-29 18:50:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5379, 1, 152, '2021-07-29 18:50:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5380, 1, 147, '2021-07-30 10:54:47', 'Ingreso', 'A Reuniones Pendientes'),
(5381, 1, 147, '2021-07-30 10:55:57', 'Ingreso', 'A Reuniones Pendientes'),
(5382, 1, 152, '2021-07-30 11:06:03', 'Ingreso', 'A Acuerdos Pendientes'),
(5383, 1, 152, '2021-07-30 11:07:21', 'Ingreso', 'A Acuerdos Pendientes'),
(5384, 1, 152, '2021-07-30 11:08:06', 'Ingreso', 'A Acuerdos Pendientes'),
(5385, 1, 147, '2021-07-30 11:15:15', 'Ingreso', 'A Reuniones Pendientes'),
(5386, 1, 150, '2021-07-30 11:15:22', 'Ingreso', 'A Lista Actas'),
(5387, 1, 159, '2021-07-30 11:28:13', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(5388, 1, 156, '2021-07-30 11:33:41', 'Ingreso', 'A Mantenimiento Estado Acta'),
(5389, 1, 157, '2021-07-30 11:34:30', 'Ingreso', 'A Mantenimiento Estado Acta'),
(5390, 1, 157, '2021-07-30 11:35:36', 'Ingreso', 'A Mantenimiento Estado Acta'),
(5391, 1, 158, '2021-07-30 11:35:51', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(5392, 1, 158, '2021-07-30 11:36:54', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(5393, 1, 159, '2021-07-30 11:37:09', 'Ingreso', 'A Mantenimiento Estado Acuerdo'),
(5394, 1, 160, '2021-07-30 11:37:27', 'Ingreso', 'A Mantenimiento Estado Reunion'),
(5395, 1, 152, '2021-07-30 11:49:39', 'Ingreso', 'A Acuerdos Pendientes'),
(5396, 1, 151, '2021-07-30 11:49:42', 'Ingreso', 'A crear Acuerdo'),
(5397, 1, 151, '2021-07-30 11:51:09', 'Ingreso', 'A crear Acuerdo'),
(5398, 1, 152, '2021-07-30 11:51:23', 'Ingreso', 'A Acuerdos Pendientes'),
(5399, 1, 152, '2021-07-30 11:53:00', 'Ingreso', 'A Acuerdos Pendientes'),
(5400, 1, 152, '2021-07-30 11:53:46', 'Ingreso', 'A Acuerdos Pendientes'),
(5401, 1, 151, '2021-07-30 11:53:50', 'Ingreso', 'A crear Acuerdo'),
(5402, 1, 151, '2021-07-30 11:55:13', 'Ingreso', 'A crear Acuerdo'),
(5403, 1, 152, '2021-07-30 11:55:28', 'Ingreso', 'A Acuerdos Pendientes'),
(5404, 1, 151, '2021-07-30 11:55:32', 'Ingreso', 'A crear Acuerdo'),
(5405, 1, 152, '2021-07-30 11:55:53', 'Ingreso', 'A Acuerdos Pendientes'),
(5406, 1, 151, '2021-07-30 11:58:15', 'Ingreso', 'A crear Acuerdo'),
(5407, 1, 151, '2021-07-30 11:59:30', 'Ingreso', 'A crear Acuerdo'),
(5408, 1, 151, '2021-07-30 11:59:39', 'Ingreso', 'A crear Acuerdo'),
(5409, 1, 152, '2021-07-30 12:05:26', 'Ingreso', 'A Acuerdos Pendientes'),
(5410, 1, 152, '2021-07-30 12:05:27', 'Ingreso', 'A Acuerdos Pendientes'),
(5411, 1, 152, '2021-07-30 12:05:56', 'Ingreso', 'A Acuerdos Pendientes'),
(5412, 1, 152, '2021-07-30 12:06:20', 'Ingreso', 'A Acuerdos Pendientes'),
(5413, 1, 151, '2021-07-30 12:16:59', 'Ingreso', 'A crear Acuerdo'),
(5414, 1, 149, '2021-07-30 12:18:20', 'Ingreso', 'A Actas Pendientes'),
(5415, 1, 146, '2021-07-30 12:18:23', 'Ingreso', 'A crear Reunion'),
(5416, 1, 146, '2021-07-30 12:18:59', 'Ingreso', 'A crear Reunion'),
(5417, 1, 149, '2021-07-30 12:19:14', 'Ingreso', 'A Actas Pendientes'),
(5418, 1, 146, '2021-07-30 12:19:17', 'Ingreso', 'A crear Reunion'),
(5419, 1, 149, '2021-07-30 12:19:21', 'Ingreso', 'A Actas Pendientes'),
(5420, 1, 146, '2021-07-30 12:19:24', 'Ingreso', 'A crear Reunion'),
(5421, 1, 149, '2021-07-30 12:19:25', 'Ingreso', 'A Actas Pendientes'),
(5422, 1, 146, '2021-07-30 12:19:28', 'Ingreso', 'A crear Reunion'),
(5423, 1, 149, '2021-07-30 12:20:01', 'Ingreso', 'A Actas Pendientes'),
(5424, 1, 146, '2021-07-30 12:20:07', 'Ingreso', 'A crear Reunion'),
(5425, 1, 149, '2021-07-30 12:20:18', 'Ingreso', 'A Actas Pendientes'),
(5426, 1, 146, '2021-07-30 12:20:23', 'Ingreso', 'A crear Reunion'),
(5427, 1, 149, '2021-07-30 12:20:25', 'Ingreso', 'A Actas Pendientes'),
(5428, 1, 146, '2021-07-30 12:20:30', 'Ingreso', 'A crear Reunion'),
(5429, 1, 149, '2021-07-30 12:21:03', 'Ingreso', 'A Actas Pendientes'),
(5430, 1, 146, '2021-07-30 12:21:07', 'Ingreso', 'A crear Reunion'),
(5431, 1, 149, '2021-07-30 12:21:22', 'Ingreso', 'A Actas Pendientes'),
(5432, 1, 149, '2021-07-30 12:23:52', 'Ingreso', 'A Actas Pendientes'),
(5433, 1, 154, '2021-07-30 12:24:08', 'Ingreso', 'Asistencia por actas'),
(5434, 1, 154, '2021-07-30 12:24:11', 'Ingreso', 'Asistencia por actas'),
(5435, 1, 150, '2021-07-30 12:24:34', 'Ingreso', 'A Lista Actas'),
(5436, 1, 146, '2021-07-30 12:24:45', 'Ingreso', 'A crear Reunion'),
(5437, 1, 149, '2021-07-30 12:25:02', 'Ingreso', 'A Actas Pendientes'),
(5438, 1, 146, '2021-07-30 12:25:12', 'Ingreso', 'A crear Reunion'),
(5439, 1, 149, '2021-07-30 12:25:16', 'Ingreso', 'A Actas Pendientes'),
(5440, 1, 149, '2021-07-30 12:25:22', 'Ingreso', 'A Actas Pendientes'),
(5441, 1, 149, '2021-07-30 12:33:19', 'Ingreso', 'A Actas Pendientes'),
(5442, 1, 149, '2021-07-30 12:34:20', 'Ingreso', 'A Actas Pendientes'),
(5443, 1, 149, '2021-07-30 12:34:52', 'Ingreso', 'A Actas Pendientes'),
(5444, 1, 149, '2021-07-30 12:35:10', 'Ingreso', 'A Actas Pendientes'),
(5445, 1, 149, '2021-07-30 12:35:23', 'Ingreso', 'A Actas Pendientes'),
(5446, 1, 149, '2021-07-30 12:38:11', 'Ingreso', 'A Actas Pendientes'),
(5447, 1, 149, '2021-07-30 12:38:23', 'Ingreso', 'A Actas Pendientes'),
(5448, 1, 149, '2021-07-30 12:38:36', 'Ingreso', 'A Actas Pendientes'),
(5449, 1, 149, '2021-07-30 12:38:37', 'Ingreso', 'A Actas Pendientes'),
(5450, 1, 146, '2021-07-30 12:38:39', 'Ingreso', 'A crear Reunion'),
(5451, 1, 149, '2021-07-30 12:38:42', 'Ingreso', 'A Actas Pendientes'),
(5452, 1, 149, '2021-07-30 12:51:47', 'Ingreso', 'A Actas Pendientes'),
(5453, 1, 149, '2021-07-30 12:52:02', 'Ingreso', 'A Actas Pendientes'),
(5454, 1, 149, '2021-07-30 12:52:08', 'Ingreso', 'A Actas Pendientes'),
(5455, 1, 150, '2021-07-30 12:52:11', 'Ingreso', 'A Lista Actas'),
(5456, 1, 150, '2021-07-30 12:53:25', 'Ingreso', 'A Lista Actas'),
(5457, 1, 149, '2021-07-30 12:53:28', 'Ingreso', 'A Actas Pendientes'),
(5458, 1, 149, '2021-07-30 12:53:34', 'Ingreso', 'A Actas Pendientes'),
(5459, 1, 149, '2021-07-30 12:53:39', 'Ingreso', 'A Actas Pendientes'),
(5460, 1, 146, '2021-07-30 12:54:23', 'Ingreso', 'A crear Reunion'),
(5461, 1, 146, '2021-07-30 12:54:56', 'Ingreso', 'A crear Reunion'),
(5462, 1, 149, '2021-07-30 12:55:07', 'Ingreso', 'A Actas Pendientes'),
(5463, 1, 155, '2021-07-30 12:55:17', 'Ingreso', 'A Asistencia por Persona'),
(5464, 1, 154, '2021-07-30 12:55:23', 'Ingreso', 'Asistencia por actas'),
(5465, 1, 150, '2021-07-30 12:56:53', 'Ingreso', 'A Lista Actas'),
(5466, 1, 150, '2021-07-30 12:57:32', 'Ingreso', 'A Lista Actas'),
(5467, 1, 149, '2021-07-30 12:58:00', 'Ingreso', 'A Actas Pendientes'),
(5468, 1, 149, '2021-07-30 12:58:53', 'Ingreso', 'A Actas Pendientes'),
(5469, 1, 149, '2021-07-30 13:02:03', 'Ingreso', 'A Actas Pendientes'),
(5470, 1, 149, '2021-07-30 13:02:10', 'Ingreso', 'A Actas Pendientes'),
(5471, 1, 149, '2021-07-30 13:04:37', 'Ingreso', 'A Actas Pendientes'),
(5472, 1, 149, '2021-07-30 13:04:43', 'Ingreso', 'A Actas Pendientes'),
(5473, 1, 150, '2021-07-30 13:04:53', 'Ingreso', 'A Lista Actas'),
(5474, 1, 146, '2021-07-30 13:04:58', 'Ingreso', 'A crear Reunion'),
(5475, 1, 149, '2021-07-30 16:52:13', 'Ingreso', 'A Actas Pendientes'),
(5476, 1, 146, '2021-07-30 16:52:16', 'Ingreso', 'A crear Reunion'),
(5477, 1, 151, '2021-07-30 16:52:31', 'Ingreso', 'A crear Acuerdo'),
(5478, 1, 149, '2021-07-30 16:52:54', 'Ingreso', 'A Actas Pendientes'),
(5479, 1, 149, '2021-07-30 16:54:15', 'Ingreso', 'A Actas Pendientes'),
(5480, 1, 150, '2021-07-30 16:54:18', 'Ingreso', 'A Lista Actas'),
(5481, 1, 146, '2021-07-30 16:56:44', 'Ingreso', 'A crear Reunion'),
(5482, 1, 152, '2021-07-30 16:58:27', 'Ingreso', 'A Acuerdos Pendientes'),
(5483, 1, 151, '2021-07-30 16:58:37', 'Ingreso', 'A crear Acuerdo'),
(5484, 1, 152, '2021-07-30 16:58:41', 'Ingreso', 'A Acuerdos Pendientes'),
(5485, 1, 151, '2021-07-30 16:58:44', 'Ingreso', 'A crear Acuerdo'),
(5486, 1, 152, '2021-07-30 16:59:21', 'Ingreso', 'A Acuerdos Pendientes'),
(5487, 1, 151, '2021-07-30 16:59:24', 'Ingreso', 'A crear Acuerdo'),
(5488, 1, 152, '2021-07-30 16:59:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5489, 1, 151, '2021-07-30 16:59:33', 'Ingreso', 'A crear Acuerdo'),
(5490, 1, 146, '2021-07-30 17:01:57', 'Ingreso', 'A crear Reunion'),
(5491, 1, 150, '2021-07-30 17:11:36', 'Ingreso', 'A Lista Actas'),
(5492, 1, 150, '2021-07-30 17:12:24', 'Ingreso', 'A Lista Actas'),
(5493, 1, 154, '2021-07-30 17:12:37', 'Ingreso', 'Asistencia por actas'),
(5494, 1, 150, '2021-07-30 17:13:17', 'Ingreso', 'A Lista Actas'),
(5495, 1, 150, '2021-07-30 17:13:20', 'Ingreso', 'A Lista Actas'),
(5496, 1, 154, '2021-07-30 17:13:21', 'Ingreso', 'Asistencia por actas'),
(5497, 1, 150, '2021-07-30 17:13:25', 'Ingreso', 'A Lista Actas'),
(5498, 1, 154, '2021-07-30 17:15:27', 'Ingreso', 'Asistencia por actas'),
(5499, 1, 150, '2021-07-30 17:24:27', 'Ingreso', 'A Lista Actas'),
(5500, 1, 154, '2021-07-30 17:34:17', 'Ingreso', 'Asistencia por actas'),
(5501, 1, 154, '2021-07-30 17:38:06', 'Ingreso', 'Asistencia por actas'),
(5502, 1, 149, '2021-07-30 17:40:29', 'Ingreso', 'A Actas Pendientes'),
(5503, 1, 146, '2021-07-30 17:40:33', 'Ingreso', 'A crear Reunion'),
(5504, 1, 149, '2021-07-30 17:40:50', 'Ingreso', 'A Actas Pendientes'),
(5505, 1, 154, '2021-07-30 17:41:01', 'Ingreso', 'Asistencia por actas'),
(5506, 1, 154, '2021-07-30 17:46:18', 'Ingreso', 'Asistencia por actas'),
(5507, 1, 154, '2021-07-30 17:46:26', 'Ingreso', 'Asistencia por actas'),
(5508, 1, 149, '2021-07-30 17:49:28', 'Ingreso', 'A Actas Pendientes'),
(5509, 1, 146, '2021-07-30 17:49:30', 'Ingreso', 'A crear Reunion'),
(5510, 1, 149, '2021-07-30 17:49:31', 'Ingreso', 'A Actas Pendientes'),
(5511, 1, 150, '2021-07-30 17:49:37', 'Ingreso', 'A Lista Actas'),
(5512, 1, 150, '2021-07-30 17:49:46', 'Ingreso', 'A Lista Actas'),
(5513, 1, 150, '2021-07-30 17:50:37', 'Ingreso', 'A Lista Actas'),
(5514, 1, 154, '2021-07-30 17:50:58', 'Ingreso', 'Asistencia por actas'),
(5515, 1, 154, '2021-07-30 17:51:18', 'Ingreso', 'Asistencia por actas'),
(5516, 1, 150, '2021-07-30 17:55:34', 'Ingreso', 'A Lista Actas'),
(5517, 1, 154, '2021-07-30 17:56:20', 'Ingreso', 'Asistencia por actas'),
(5518, 1, 154, '2021-07-30 17:57:05', 'Ingreso', 'Asistencia por actas'),
(5519, 1, 150, '2021-07-30 17:57:07', 'Ingreso', 'A Lista Actas'),
(5520, 1, 154, '2021-07-30 17:57:20', 'Ingreso', 'Asistencia por actas'),
(5521, 1, 150, '2021-07-30 17:57:25', 'Ingreso', 'A Lista Actas'),
(5522, 1, 155, '2021-07-30 17:58:36', 'Ingreso', 'A Asistencia por Persona'),
(5523, 1, 150, '2021-07-30 18:00:15', 'Ingreso', 'A Lista Actas'),
(5524, 1, 150, '2021-07-30 18:01:07', 'Ingreso', 'A Lista Actas'),
(5525, 1, 154, '2021-07-30 18:02:20', 'Ingreso', 'Asistencia por actas'),
(5526, 1, 155, '2021-07-30 18:16:04', 'Ingreso', 'A Asistencia por Persona'),
(5527, 1, 154, '2021-07-30 18:16:57', 'Ingreso', 'Asistencia por actas'),
(5528, 1, 150, '2021-07-30 18:17:01', 'Ingreso', 'A Lista Actas'),
(5529, 1, 155, '2021-07-30 18:17:08', 'Ingreso', 'A Asistencia por Persona'),
(5530, 1, 149, '2021-07-30 18:34:17', 'Ingreso', 'A Actas Pendientes'),
(5531, 1, 146, '2021-07-30 18:50:50', 'Ingreso', 'A crear Reunion'),
(5532, 1, 149, '2021-07-30 18:50:56', 'Ingreso', 'A Actas Pendientes'),
(5533, 1, 146, '2021-07-30 18:51:03', 'Ingreso', 'A crear Reunion'),
(5534, 1, 149, '2021-07-30 18:51:21', 'Ingreso', 'A Actas Pendientes'),
(5535, 1, 146, '2021-07-30 18:51:24', 'Ingreso', 'A crear Reunion'),
(5536, 1, 149, '2021-07-30 18:51:27', 'Ingreso', 'A Actas Pendientes'),
(5537, 1, 149, '2021-07-30 18:51:35', 'Ingreso', 'A Actas Pendientes'),
(5538, 1, 150, '2021-07-30 18:51:41', 'Ingreso', 'A Lista Actas'),
(5539, 1, 149, '2021-07-31 09:48:55', 'Ingreso', 'A Actas Pendientes'),
(5540, 1, 146, '2021-07-31 09:48:57', 'Ingreso', 'A crear Reunion'),
(5541, 1, 151, '2021-07-31 09:49:14', 'Ingreso', 'A crear Acuerdo'),
(5542, 1, 151, '2021-07-31 09:49:39', 'Ingreso', 'A crear Acuerdo'),
(5543, 1, 152, '2021-07-31 09:49:42', 'Ingreso', 'A Acuerdos Pendientes'),
(5544, 1, 151, '2021-07-31 09:49:46', 'Ingreso', 'A crear Acuerdo'),
(5545, 1, 151, '2021-07-31 09:49:54', 'Ingreso', 'A crear Acuerdo'),
(5546, 1, 151, '2021-07-31 09:50:03', 'Ingreso', 'A crear Acuerdo'),
(5547, 1, 151, '2021-07-31 09:54:23', 'Ingreso', 'A crear Acuerdo'),
(5548, 1, 151, '2021-07-31 09:56:14', 'Ingreso', 'A crear Acuerdo'),
(5549, 1, 149, '2021-07-31 09:57:11', 'Ingreso', 'A Actas Pendientes'),
(5550, 1, 147, '2021-07-31 09:57:28', 'Ingreso', 'A Reuniones Pendientes'),
(5551, 1, 146, '2021-07-31 09:57:31', 'Ingreso', 'A crear Reunion'),
(5552, 1, 147, '2021-07-31 09:57:40', 'Ingreso', 'A Reuniones Pendientes'),
(5553, 1, 146, '2021-07-31 09:57:44', 'Ingreso', 'A crear Reunion'),
(5554, 1, 146, '2021-07-31 11:00:30', 'Ingreso', 'A crear Reunion'),
(5555, 1, 155, '2021-07-31 11:28:21', 'Ingreso', 'A Asistencia por Persona'),
(5556, 1, 150, '2021-07-31 11:28:56', 'Ingreso', 'A Lista Actas'),
(5557, 1, 154, '2021-07-31 11:29:56', 'Ingreso', 'Asistencia por actas'),
(5558, 1, 155, '2021-07-31 11:30:43', 'Ingreso', 'A Asistencia por Persona'),
(5559, 1, 155, '2021-07-31 11:30:59', 'Ingreso', 'A Asistencia por Persona'),
(5560, 1, 154, '2021-07-31 11:37:04', 'Ingreso', 'Asistencia por actas'),
(5561, 1, 147, '2021-07-31 11:37:17', 'Ingreso', 'A Reuniones Pendientes'),
(5562, 1, 146, '2021-07-31 11:37:25', 'Ingreso', 'A crear Reunion'),
(5563, 1, 147, '2021-07-31 11:37:41', 'Ingreso', 'A Reuniones Pendientes'),
(5564, 1, 149, '2021-07-31 11:37:47', 'Ingreso', 'A Actas Pendientes'),
(5565, 1, 150, '2021-07-31 11:37:53', 'Ingreso', 'A Lista Actas'),
(5566, 1, 147, '2021-07-31 11:38:06', 'Ingreso', 'A Reuniones Pendientes'),
(5567, 1, 146, '2021-07-31 11:38:12', 'Ingreso', 'A crear Reunion'),
(5568, 1, 150, '2021-07-31 11:41:37', 'Ingreso', 'A Lista Actas'),
(5569, 1, 155, '2021-07-31 11:42:06', 'Ingreso', 'A Asistencia por Persona'),
(5570, 1, 150, '2021-07-31 11:42:39', 'Ingreso', 'A Lista Actas'),
(5571, 1, 149, '2021-07-31 11:42:44', 'Ingreso', 'A Actas Pendientes'),
(5572, 1, 146, '2021-07-31 11:42:48', 'Ingreso', 'A crear Reunion'),
(5573, 1, 149, '2021-07-31 11:42:58', 'Ingreso', 'A Actas Pendientes'),
(5574, 1, 155, '2021-07-31 11:43:03', 'Ingreso', 'A Asistencia por Persona'),
(5575, 1, 149, '2021-07-31 11:43:29', 'Ingreso', 'A Actas Pendientes'),
(5576, 1, 146, '2021-07-31 11:43:31', 'Ingreso', 'A crear Reunion'),
(5577, 1, 149, '2021-07-31 11:43:37', 'Ingreso', 'A Actas Pendientes'),
(5578, 1, 155, '2021-07-31 11:43:42', 'Ingreso', 'A Asistencia por Persona'),
(5579, 1, 154, '2021-07-31 11:47:06', 'Ingreso', 'Asistencia por actas'),
(5580, 1, 150, '2021-07-31 11:47:24', 'Ingreso', 'A Lista Actas'),
(5581, 1, 155, '2021-07-31 11:48:51', 'Ingreso', 'A Asistencia por Persona'),
(5582, 1, 155, '2021-07-31 11:49:19', 'Ingreso', 'A Asistencia por Persona'),
(5583, 1, 155, '2021-07-31 11:49:28', 'Ingreso', 'A Asistencia por Persona'),
(5584, 1, 149, '2021-07-31 11:50:21', 'Ingreso', 'A Actas Pendientes'),
(5585, 1, 146, '2021-07-31 11:50:25', 'Ingreso', 'A crear Reunion'),
(5586, 1, 155, '2021-07-31 11:52:51', 'Ingreso', 'A Asistencia por Persona'),
(5587, 1, 155, '2021-07-31 11:54:01', 'Ingreso', 'A Asistencia por Persona'),
(5588, 1, 155, '2021-07-31 11:56:22', 'Ingreso', 'A Asistencia por Persona'),
(5589, 1, 149, '2021-07-31 11:56:37', 'Ingreso', 'A Actas Pendientes'),
(5590, 1, 146, '2021-07-31 11:56:40', 'Ingreso', 'A crear Reunion'),
(5591, 1, 149, '2021-07-31 11:56:52', 'Ingreso', 'A Actas Pendientes'),
(5592, 1, 155, '2021-07-31 11:56:58', 'Ingreso', 'A Asistencia por Persona');
INSERT INTO `tbl_bitacora` (`Id_bitacora`, `Id_usuario`, `Id_objeto`, `Fecha`, `Accion`, `Descripcion`) VALUES
(5593, 1, 154, '2021-07-31 11:57:17', 'Ingreso', 'Asistencia por actas'),
(5594, 1, 155, '2021-07-31 11:58:52', 'Ingreso', 'A Asistencia por Persona'),
(5595, 1, 155, '2021-07-31 12:08:26', 'Ingreso', 'A Asistencia por Persona'),
(5596, 1, 155, '2021-07-31 12:08:33', 'Ingreso', 'A Asistencia por Persona'),
(5597, 1, 155, '2021-07-31 12:09:26', 'Ingreso', 'A Asistencia por Persona'),
(5598, 1, 155, '2021-07-31 12:09:29', 'Ingreso', 'A Asistencia por Persona'),
(5599, 1, 155, '2021-07-31 12:10:14', 'Ingreso', 'A Asistencia por Persona'),
(5600, 1, 154, '2021-07-31 12:10:51', 'Ingreso', 'Asistencia por actas'),
(5601, 1, 154, '2021-07-31 12:11:03', 'Ingreso', 'Asistencia por actas'),
(5602, 1, 149, '2021-07-31 12:11:08', 'Ingreso', 'A Actas Pendientes'),
(5603, 1, 146, '2021-07-31 12:11:11', 'Ingreso', 'A crear Reunion'),
(5604, 1, 149, '2021-07-31 12:11:48', 'Ingreso', 'A Actas Pendientes'),
(5605, 1, 155, '2021-07-31 12:11:54', 'Ingreso', 'A Asistencia por Persona'),
(5606, 1, 154, '2021-07-31 12:12:35', 'Ingreso', 'Asistencia por actas'),
(5607, 1, 150, '2021-07-31 12:12:44', 'Ingreso', 'A Lista Actas'),
(5608, 1, 149, '2021-07-31 12:13:23', 'Ingreso', 'A Actas Pendientes'),
(5609, 1, 146, '2021-07-31 12:13:26', 'Ingreso', 'A crear Reunion'),
(5610, 1, 149, '2021-07-31 12:13:28', 'Ingreso', 'A Actas Pendientes'),
(5611, 1, 146, '2021-07-31 12:13:31', 'Ingreso', 'A crear Reunion'),
(5612, 1, 149, '2021-07-31 12:13:32', 'Ingreso', 'A Actas Pendientes'),
(5613, 1, 146, '2021-07-31 12:13:35', 'Ingreso', 'A crear Reunion'),
(5614, 1, 149, '2021-07-31 12:13:44', 'Ingreso', 'A Actas Pendientes'),
(5615, 1, 150, '2021-07-31 12:13:49', 'Ingreso', 'A Lista Actas'),
(5616, 1, 155, '2021-07-31 12:14:10', 'Ingreso', 'A Asistencia por Persona'),
(5617, 1, 155, '2021-07-31 12:20:51', 'Ingreso', 'A Asistencia por Persona'),
(5618, 1, 155, '2021-07-31 12:21:47', 'Ingreso', 'A Asistencia por Persona'),
(5619, 1, 155, '2021-07-31 12:22:49', 'Ingreso', 'A Asistencia por Persona'),
(5620, 1, 155, '2021-07-31 12:22:59', 'Ingreso', 'A Asistencia por Persona'),
(5621, 1, 155, '2021-07-31 12:22:59', 'Ingreso', 'A Asistencia por Persona'),
(5622, 1, 155, '2021-07-31 12:23:00', 'Ingreso', 'A Asistencia por Persona'),
(5623, 1, 155, '2021-07-31 12:23:00', 'Ingreso', 'A Asistencia por Persona'),
(5624, 1, 155, '2021-07-31 12:23:00', 'Ingreso', 'A Asistencia por Persona'),
(5625, 1, 155, '2021-07-31 12:23:44', 'Ingreso', 'A Asistencia por Persona'),
(5626, 1, 155, '2021-07-31 12:23:44', 'Ingreso', 'A Asistencia por Persona'),
(5627, 1, 155, '2021-07-31 12:23:44', 'Ingreso', 'A Asistencia por Persona'),
(5628, 1, 155, '2021-07-31 12:23:44', 'Ingreso', 'A Asistencia por Persona'),
(5629, 1, 154, '2021-07-31 12:23:48', 'Ingreso', 'Asistencia por actas'),
(5630, 1, 155, '2021-07-31 12:24:11', 'Ingreso', 'A Asistencia por Persona'),
(5631, 1, 155, '2021-07-31 12:25:39', 'Ingreso', 'A Asistencia por Persona'),
(5632, 1, 155, '2021-07-31 12:31:24', 'Ingreso', 'A Asistencia por Persona'),
(5633, 1, 155, '2021-07-31 12:36:43', 'Ingreso', 'A Asistencia por Persona'),
(5634, 1, 155, '2021-07-31 12:37:02', 'Ingreso', 'A Asistencia por Persona'),
(5635, 1, 155, '2021-07-31 12:43:28', 'Ingreso', 'A Asistencia por Persona'),
(5636, 1, 155, '2021-07-31 12:44:12', 'Ingreso', 'A Asistencia por Persona'),
(5637, 1, 154, '2021-07-31 12:44:24', 'Ingreso', 'Asistencia por actas'),
(5638, 1, 154, '2021-07-31 12:44:59', 'Ingreso', 'Asistencia por actas'),
(5639, 1, 155, '2021-07-31 12:45:37', 'Ingreso', 'A Asistencia por Persona'),
(5640, 1, 155, '2021-07-31 12:45:41', 'Ingreso', 'A Asistencia por Persona'),
(5641, 1, 154, '2021-07-31 12:45:50', 'Ingreso', 'Asistencia por actas'),
(5642, 1, 155, '2021-07-31 13:03:16', 'Ingreso', 'A Asistencia por Persona'),
(5643, 1, 149, '2021-07-31 13:04:06', 'Ingreso', 'A Actas Pendientes'),
(5644, 1, 146, '2021-07-31 13:04:09', 'Ingreso', 'A crear Reunion'),
(5645, 1, 146, '2021-07-31 13:04:59', 'Ingreso', 'A crear Reunion'),
(5646, 1, 149, '2021-07-31 13:05:02', 'Ingreso', 'A Actas Pendientes'),
(5647, 1, 155, '2021-07-31 13:05:07', 'Ingreso', 'A Asistencia por Persona'),
(5648, 1, 155, '2021-07-31 13:06:51', 'Ingreso', 'A Asistencia por Persona'),
(5649, 1, 155, '2021-07-31 13:08:40', 'Ingreso', 'A Asistencia por Persona'),
(5650, 1, 147, '2021-07-31 13:08:50', 'Ingreso', 'A Reuniones Pendientes'),
(5651, 1, 146, '2021-07-31 13:09:04', 'Ingreso', 'A crear Reunion'),
(5652, 1, 152, '2021-07-31 15:08:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5653, 1, 151, '2021-07-31 15:08:32', 'Ingreso', 'A crear Acuerdo'),
(5654, 1, 151, '2021-07-31 15:08:52', 'Ingreso', 'A crear Acuerdo'),
(5655, 1, 151, '2021-07-31 15:09:12', 'Ingreso', 'A crear Acuerdo'),
(5656, 1, 151, '2021-07-31 15:09:43', 'Ingreso', 'A crear Acuerdo'),
(5657, 1, 152, '2021-07-31 15:11:30', 'Ingreso', 'A Acuerdos Pendientes'),
(5658, 1, 151, '2021-07-31 15:11:42', 'Ingreso', 'A crear Acuerdo'),
(5659, 1, 152, '2021-07-31 15:14:39', 'Ingreso', 'A Acuerdos Pendientes'),
(5660, 1, 151, '2021-07-31 15:14:41', 'Ingreso', 'A crear Acuerdo'),
(5661, 1, 152, '2021-07-31 15:15:19', 'Ingreso', 'A Acuerdos Pendientes'),
(5662, 1, 151, '2021-07-31 15:16:26', 'Ingreso', 'A crear Acuerdo'),
(5663, 1, 151, '2021-07-31 15:18:44', 'Ingreso', 'A crear Acuerdo'),
(5664, 1, 152, '2021-07-31 15:18:48', 'Ingreso', 'A Acuerdos Pendientes'),
(5665, 1, 151, '2021-07-31 15:18:51', 'Ingreso', 'A crear Acuerdo'),
(5666, 1, 152, '2021-07-31 15:19:53', 'Ingreso', 'A Acuerdos Pendientes'),
(5667, 1, 151, '2021-07-31 15:19:56', 'Ingreso', 'A crear Acuerdo'),
(5668, 1, 152, '2021-07-31 15:20:17', 'Ingreso', 'A Acuerdos Pendientes'),
(5669, 1, 151, '2021-07-31 15:20:22', 'Ingreso', 'A crear Acuerdo'),
(5670, 1, 151, '2021-07-31 15:22:19', 'Ingreso', 'A crear Acuerdo'),
(5671, 1, 151, '2021-07-31 15:22:23', 'Ingreso', 'A crear Acuerdo'),
(5672, 1, 151, '2021-07-31 15:22:30', 'Ingreso', 'A crear Acuerdo'),
(5673, 1, 151, '2021-07-31 15:22:42', 'Ingreso', 'A crear Acuerdo'),
(5674, 1, 151, '2021-07-31 15:24:20', 'Ingreso', 'A crear Acuerdo'),
(5675, 1, 152, '2021-07-31 15:26:07', 'Ingreso', 'A Acuerdos Pendientes'),
(5676, 1, 150, '2021-07-31 15:26:13', 'Ingreso', 'A Lista Actas'),
(5677, 1, 152, '2021-07-31 15:27:38', 'Ingreso', 'A Acuerdos Pendientes'),
(5678, 1, 151, '2021-07-31 15:27:41', 'Ingreso', 'A crear Acuerdo'),
(5679, 1, 152, '2021-07-31 15:27:52', 'Ingreso', 'A Acuerdos Pendientes'),
(5680, 1, 151, '2021-07-31 15:27:54', 'Ingreso', 'A crear Acuerdo'),
(5681, 1, 152, '2021-07-31 15:28:13', 'Ingreso', 'A Acuerdos Pendientes'),
(5682, 1, 151, '2021-07-31 15:28:17', 'Ingreso', 'A crear Acuerdo'),
(5683, 1, 151, '2021-07-31 15:29:43', 'Ingreso', 'A crear Acuerdo'),
(5684, 1, 152, '2021-07-31 15:30:27', 'Ingreso', 'A Acuerdos Pendientes'),
(5685, 1, 151, '2021-07-31 15:30:30', 'Ingreso', 'A crear Acuerdo'),
(5686, 1, 152, '2021-07-31 15:30:50', 'Ingreso', 'A Acuerdos Pendientes'),
(5687, 1, 151, '2021-07-31 15:31:34', 'Ingreso', 'A crear Acuerdo'),
(5688, 1, 151, '2021-07-31 15:32:11', 'Ingreso', 'A crear Acuerdo'),
(5689, 1, 151, '2021-07-31 15:32:38', 'Ingreso', 'A crear Acuerdo'),
(5690, 1, 151, '2021-07-31 15:32:51', 'Ingreso', 'A crear Acuerdo'),
(5691, 1, 151, '2021-07-31 15:32:53', 'Ingreso', 'A crear Acuerdo'),
(5692, 1, 151, '2021-07-31 15:33:10', 'Ingreso', 'A crear Acuerdo'),
(5693, 1, 151, '2021-07-31 15:34:21', 'Ingreso', 'A crear Acuerdo'),
(5694, 1, 151, '2021-07-31 15:34:36', 'Ingreso', 'A crear Acuerdo'),
(5695, 1, 151, '2021-07-31 15:37:57', 'Ingreso', 'A crear Acuerdo'),
(5696, 1, 152, '2021-07-31 15:38:15', 'Ingreso', 'A Acuerdos Pendientes'),
(5697, 1, 151, '2021-07-31 15:38:19', 'Ingreso', 'A crear Acuerdo'),
(5698, 1, 152, '2021-07-31 15:38:25', 'Ingreso', 'A Acuerdos Pendientes'),
(5699, 1, 151, '2021-07-31 15:38:36', 'Ingreso', 'A crear Acuerdo'),
(5700, 1, 152, '2021-07-31 15:38:44', 'Ingreso', 'A Acuerdos Pendientes'),
(5701, 1, 151, '2021-07-31 15:39:54', 'Ingreso', 'A crear Acuerdo'),
(5702, 1, 152, '2021-07-31 15:40:04', 'Ingreso', 'A Acuerdos Pendientes'),
(5703, 1, 151, '2021-07-31 15:41:12', 'Ingreso', 'A crear Acuerdo'),
(5704, 1, 152, '2021-07-31 15:41:19', 'Ingreso', 'A Acuerdos Pendientes'),
(5705, 1, 151, '2021-07-31 15:42:41', 'Ingreso', 'A crear Acuerdo'),
(5706, 1, 151, '2021-07-31 15:44:30', 'Ingreso', 'A crear Acuerdo'),
(5707, 1, 152, '2021-07-31 15:44:35', 'Ingreso', 'A Acuerdos Pendientes'),
(5708, 1, 151, '2021-07-31 15:44:38', 'Ingreso', 'A crear Acuerdo'),
(5709, 1, 151, '2021-07-31 15:49:32', 'Ingreso', 'A crear Acuerdo'),
(5710, 1, 151, '2021-07-31 15:49:35', 'Ingreso', 'A crear Acuerdo'),
(5711, 1, 151, '2021-07-31 15:51:29', 'Ingreso', 'A crear Acuerdo'),
(5712, 1, 151, '2021-07-31 15:51:32', 'Ingreso', 'A crear Acuerdo'),
(5713, 1, 152, '2021-07-31 15:52:40', 'Ingreso', 'A Acuerdos Pendientes'),
(5714, 1, 151, '2021-07-31 15:52:42', 'Ingreso', 'A crear Acuerdo'),
(5715, 1, 151, '2021-07-31 15:53:11', 'Ingreso', 'A crear Acuerdo'),
(5716, 1, 152, '2021-07-31 16:11:33', 'Ingreso', 'A Acuerdos Pendientes'),
(5717, 1, 151, '2021-07-31 16:11:36', 'Ingreso', 'A crear Acuerdo'),
(5718, 1, 152, '2021-07-31 16:11:39', 'Ingreso', 'A Acuerdos Pendientes'),
(5719, 1, 151, '2021-07-31 16:11:42', 'Ingreso', 'A crear Acuerdo'),
(5720, 1, 151, '2021-07-31 16:22:33', 'Ingreso', 'A crear Acuerdo'),
(5721, 1, 151, '2021-07-31 16:23:53', 'Ingreso', 'A crear Acuerdo'),
(5722, 1, 151, '2021-07-31 16:24:38', 'Ingreso', 'A crear Acuerdo'),
(5723, 1, 151, '2021-07-31 16:24:57', 'Ingreso', 'A crear Acuerdo'),
(5724, 1, 149, '2021-07-31 16:25:08', 'Ingreso', 'A Actas Pendientes'),
(5725, 1, 152, '2021-07-31 16:27:15', 'Ingreso', 'A Acuerdos Pendientes'),
(5726, 1, 151, '2021-07-31 16:27:17', 'Ingreso', 'A crear Acuerdo'),
(5727, 1, 151, '2021-07-31 16:27:25', 'Ingreso', 'A crear Acuerdo'),
(5728, 1, 151, '2021-07-31 16:27:32', 'Ingreso', 'A crear Acuerdo'),
(5729, 1, 151, '2021-07-31 16:27:46', 'Ingreso', 'A crear Acuerdo'),
(5730, 1, 151, '2021-07-31 16:27:49', 'Ingreso', 'A crear Acuerdo'),
(5731, 1, 151, '2021-07-31 16:27:54', 'Ingreso', 'A crear Acuerdo'),
(5732, 1, 152, '2021-07-31 16:27:57', 'Ingreso', 'A Acuerdos Pendientes'),
(5733, 1, 151, '2021-07-31 16:27:59', 'Ingreso', 'A crear Acuerdo'),
(5734, 1, 152, '2021-07-31 16:28:40', 'Ingreso', 'A Acuerdos Pendientes'),
(5735, 1, 151, '2021-07-31 16:28:42', 'Ingreso', 'A crear Acuerdo'),
(5736, 1, 151, '2021-07-31 16:29:31', 'Ingreso', 'A crear Acuerdo'),
(5737, 1, 152, '2021-07-31 16:29:37', 'Ingreso', 'A Acuerdos Pendientes'),
(5738, 1, 151, '2021-07-31 16:29:40', 'Ingreso', 'A crear Acuerdo'),
(5739, 1, 151, '2021-07-31 16:30:34', 'Ingreso', 'A crear Acuerdo'),
(5740, 1, 149, '2021-07-31 16:33:11', 'Ingreso', 'A Actas Pendientes'),
(5741, 1, 146, '2021-07-31 16:33:13', 'Ingreso', 'A crear Reunion'),
(5742, 1, 146, '2021-07-31 16:34:00', 'Ingreso', 'A crear Reunion'),
(5743, 1, 146, '2021-07-31 16:34:23', 'Ingreso', 'A crear Reunion'),
(5744, 1, 146, '2021-07-31 16:36:09', 'Ingreso', 'A crear Reunion'),
(5745, 1, 146, '2021-07-31 16:37:10', 'Ingreso', 'A crear Reunion'),
(5746, 1, 149, '2021-07-31 16:41:13', 'Ingreso', 'A Actas Pendientes'),
(5747, 1, 146, '2021-07-31 16:41:16', 'Ingreso', 'A crear Reunion'),
(5748, 1, 149, '2021-07-31 16:45:09', 'Ingreso', 'A Actas Pendientes'),
(5749, 1, 146, '2021-07-31 16:45:13', 'Ingreso', 'A crear Reunion'),
(5750, 1, 149, '2021-07-31 16:45:50', 'Ingreso', 'A Actas Pendientes'),
(5751, 1, 150, '2021-07-31 16:46:37', 'Ingreso', 'A Lista Actas'),
(5752, 1, 146, '2021-07-31 16:46:50', 'Ingreso', 'A crear Reunion'),
(5753, 1, 146, '2021-07-31 16:47:13', 'Ingreso', 'A crear Reunion'),
(5754, 1, 146, '2021-07-31 16:47:26', 'Ingreso', 'A crear Reunion'),
(5755, 1, 146, '2021-07-31 16:47:35', 'Ingreso', 'A crear Reunion'),
(5756, 1, 151, '2021-07-31 16:48:14', 'Ingreso', 'A crear Acuerdo'),
(5757, 1, 151, '2021-07-31 16:48:48', 'Ingreso', 'A crear Acuerdo'),
(5758, 1, 152, '2021-07-31 16:49:03', 'Ingreso', 'A Acuerdos Pendientes'),
(5759, 1, 151, '2021-07-31 16:53:21', 'Ingreso', 'A crear Acuerdo'),
(5760, 1, 152, '2021-07-31 16:53:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5761, 1, 151, '2021-07-31 16:53:52', 'Ingreso', 'A crear Acuerdo'),
(5762, 1, 151, '2021-07-31 16:54:25', 'Ingreso', 'A crear Acuerdo'),
(5763, 1, 151, '2021-07-31 16:54:51', 'Ingreso', 'A crear Acuerdo'),
(5764, 1, 151, '2021-07-31 16:55:04', 'Ingreso', 'A crear Acuerdo'),
(5765, 1, 151, '2021-07-31 16:58:15', 'Ingreso', 'A crear Acuerdo'),
(5766, 1, 151, '2021-07-31 16:58:27', 'Ingreso', 'A crear Acuerdo'),
(5767, 1, 152, '2021-07-31 16:58:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5768, 1, 151, '2021-07-31 16:58:42', 'Ingreso', 'A crear Acuerdo'),
(5769, 1, 152, '2021-07-31 16:58:48', 'Ingreso', 'A Acuerdos Pendientes'),
(5770, 1, 151, '2021-07-31 16:59:06', 'Ingreso', 'A crear Acuerdo'),
(5771, 1, 152, '2021-07-31 16:59:12', 'Ingreso', 'A Acuerdos Pendientes'),
(5772, 1, 152, '2021-07-31 16:59:20', 'Ingreso', 'A Acuerdos Pendientes'),
(5773, 1, 151, '2021-07-31 16:59:22', 'Ingreso', 'A crear Acuerdo'),
(5774, 1, 151, '2021-07-31 16:59:49', 'Ingreso', 'A crear Acuerdo'),
(5775, 1, 151, '2021-07-31 17:00:15', 'Ingreso', 'A crear Acuerdo'),
(5776, 1, 151, '2021-07-31 17:00:44', 'Ingreso', 'A crear Acuerdo'),
(5777, 1, 151, '2021-07-31 17:00:54', 'Ingreso', 'A crear Acuerdo'),
(5778, 1, 151, '2021-07-31 17:01:43', 'Ingreso', 'A crear Acuerdo'),
(5779, 1, 151, '2021-07-31 17:02:11', 'Ingreso', 'A crear Acuerdo'),
(5780, 1, 152, '2021-07-31 17:02:16', 'Ingreso', 'A Acuerdos Pendientes'),
(5781, 1, 151, '2021-07-31 17:02:21', 'Ingreso', 'A crear Acuerdo'),
(5782, 1, 152, '2021-07-31 17:02:33', 'Ingreso', 'A Acuerdos Pendientes'),
(5783, 1, 151, '2021-07-31 17:03:37', 'Ingreso', 'A crear Acuerdo'),
(5784, 1, 151, '2021-07-31 17:04:25', 'Ingreso', 'A crear Acuerdo'),
(5785, 1, 151, '2021-07-31 17:05:14', 'Ingreso', 'A crear Acuerdo'),
(5786, 1, 151, '2021-07-31 17:05:30', 'Ingreso', 'A crear Acuerdo'),
(5787, 1, 152, '2021-07-31 17:05:32', 'Ingreso', 'A Acuerdos Pendientes'),
(5788, 1, 151, '2021-07-31 17:05:35', 'Ingreso', 'A crear Acuerdo'),
(5789, 1, 151, '2021-07-31 17:06:04', 'Ingreso', 'A crear Acuerdo'),
(5790, 1, 151, '2021-07-31 17:09:23', 'Ingreso', 'A crear Acuerdo'),
(5791, 1, 151, '2021-07-31 17:09:29', 'Ingreso', 'A crear Acuerdo'),
(5792, 1, 152, '2021-07-31 17:09:31', 'Ingreso', 'A Acuerdos Pendientes'),
(5793, 1, 151, '2021-07-31 17:10:02', 'Ingreso', 'A crear Acuerdo'),
(5794, 1, 152, '2021-07-31 17:10:14', 'Ingreso', 'A Acuerdos Pendientes'),
(5795, 1, 151, '2021-07-31 17:10:17', 'Ingreso', 'A crear Acuerdo'),
(5796, 1, 151, '2021-07-31 17:10:51', 'Ingreso', 'A crear Acuerdo'),
(5797, 1, 152, '2021-07-31 17:10:52', 'Ingreso', 'A Acuerdos Pendientes'),
(5798, 1, 152, '2021-07-31 17:11:03', 'Ingreso', 'A Acuerdos Pendientes'),
(5799, 1, 151, '2021-07-31 17:11:05', 'Ingreso', 'A crear Acuerdo'),
(5800, 1, 152, '2021-07-31 17:11:10', 'Ingreso', 'A Acuerdos Pendientes'),
(5801, 1, 151, '2021-07-31 17:11:12', 'Ingreso', 'A crear Acuerdo'),
(5802, 1, 152, '2021-07-31 17:11:15', 'Ingreso', 'A Acuerdos Pendientes'),
(5803, 1, 151, '2021-07-31 17:12:31', 'Ingreso', 'A crear Acuerdo'),
(5804, 1, 151, '2021-07-31 17:13:03', 'Ingreso', 'A crear Acuerdo'),
(5805, 1, 152, '2021-07-31 17:13:14', 'Ingreso', 'A Acuerdos Pendientes'),
(5806, 1, 151, '2021-07-31 17:13:18', 'Ingreso', 'A crear Acuerdo'),
(5807, 1, 152, '2021-07-31 17:14:10', 'Ingreso', 'A Acuerdos Pendientes'),
(5808, 1, 151, '2021-07-31 17:14:15', 'Ingreso', 'A crear Acuerdo'),
(5809, 1, 151, '2021-07-31 17:14:29', 'Ingreso', 'A crear Acuerdo'),
(5810, 1, 151, '2021-07-31 17:16:07', 'Ingreso', 'A crear Acuerdo'),
(5811, 1, 152, '2021-07-31 17:16:08', 'Ingreso', 'A Acuerdos Pendientes'),
(5812, 1, 151, '2021-07-31 17:16:12', 'Ingreso', 'A crear Acuerdo'),
(5813, 1, 152, '2021-07-31 17:17:20', 'Ingreso', 'A Acuerdos Pendientes'),
(5814, 1, 151, '2021-07-31 17:17:25', 'Ingreso', 'A crear Acuerdo'),
(5815, 1, 152, '2021-07-31 17:19:37', 'Ingreso', 'A Acuerdos Pendientes'),
(5816, 1, 151, '2021-07-31 17:19:43', 'Ingreso', 'A crear Acuerdo'),
(5817, 1, 152, '2021-07-31 17:20:25', 'Ingreso', 'A Acuerdos Pendientes'),
(5818, 1, 151, '2021-07-31 17:20:29', 'Ingreso', 'A crear Acuerdo'),
(5819, 1, 152, '2021-07-31 17:20:52', 'Ingreso', 'A Acuerdos Pendientes'),
(5820, 1, 151, '2021-07-31 17:20:54', 'Ingreso', 'A crear Acuerdo'),
(5821, 1, 152, '2021-07-31 17:20:58', 'Ingreso', 'A Acuerdos Pendientes'),
(5822, 1, 151, '2021-07-31 17:21:02', 'Ingreso', 'A crear Acuerdo'),
(5823, 1, 152, '2021-07-31 17:21:05', 'Ingreso', 'A Acuerdos Pendientes'),
(5824, 1, 151, '2021-07-31 17:21:14', 'Ingreso', 'A crear Acuerdo'),
(5825, 1, 152, '2021-07-31 17:35:02', 'Ingreso', 'A Acuerdos Pendientes'),
(5826, 1, 151, '2021-07-31 17:35:07', 'Ingreso', 'A crear Acuerdo'),
(5827, 1, 151, '2021-07-31 17:35:56', 'Ingreso', 'A crear Acuerdo'),
(5828, 1, 152, '2021-07-31 17:36:27', 'Ingreso', 'A Acuerdos Pendientes'),
(5829, 1, 151, '2021-07-31 17:36:32', 'Ingreso', 'A crear Acuerdo'),
(5830, 1, 152, '2021-07-31 17:36:36', 'Ingreso', 'A Acuerdos Pendientes'),
(5831, 1, 151, '2021-07-31 17:36:38', 'Ingreso', 'A crear Acuerdo'),
(5832, 1, 152, '2021-07-31 17:36:53', 'Ingreso', 'A Acuerdos Pendientes'),
(5833, 1, 151, '2021-07-31 17:45:09', 'Ingreso', 'A crear Acuerdo'),
(5834, 1, 152, '2021-07-31 17:45:37', 'Ingreso', 'A Acuerdos Pendientes'),
(5835, 1, 151, '2021-07-31 17:45:41', 'Ingreso', 'A crear Acuerdo'),
(5836, 1, 152, '2021-07-31 17:46:04', 'Ingreso', 'A Acuerdos Pendientes'),
(5837, 1, 151, '2021-07-31 17:46:16', 'Ingreso', 'A crear Acuerdo'),
(5838, 1, 152, '2021-07-31 17:46:24', 'Ingreso', 'A Acuerdos Pendientes'),
(5839, 1, 151, '2021-07-31 17:46:27', 'Ingreso', 'A crear Acuerdo'),
(5840, 1, 151, '2021-07-31 17:48:23', 'Ingreso', 'A crear Acuerdo'),
(5841, 1, 152, '2021-07-31 17:48:25', 'Ingreso', 'A Acuerdos Pendientes'),
(5842, 1, 151, '2021-07-31 17:48:33', 'Ingreso', 'A crear Acuerdo'),
(5843, 1, 151, '2021-07-31 17:48:48', 'Ingreso', 'A crear Acuerdo'),
(5844, 1, 152, '2021-07-31 17:49:47', 'Ingreso', 'A Acuerdos Pendientes'),
(5845, 1, 151, '2021-07-31 17:49:55', 'Ingreso', 'A crear Acuerdo'),
(5846, 1, 152, '2021-07-31 17:50:07', 'Ingreso', 'A Acuerdos Pendientes'),
(5847, 1, 151, '2021-07-31 17:50:10', 'Ingreso', 'A crear Acuerdo'),
(5848, 1, 152, '2021-07-31 17:50:12', 'Ingreso', 'A Acuerdos Pendientes'),
(5849, 1, 151, '2021-07-31 17:50:21', 'Ingreso', 'A crear Acuerdo'),
(5850, 1, 151, '2021-07-31 17:50:25', 'Ingreso', 'A crear Acuerdo'),
(5851, 1, 152, '2021-07-31 17:50:38', 'Ingreso', 'A Acuerdos Pendientes'),
(5852, 1, 151, '2021-07-31 17:50:42', 'Ingreso', 'A crear Acuerdo'),
(5853, 1, 152, '2021-07-31 17:50:55', 'Ingreso', 'A Acuerdos Pendientes'),
(5854, 1, 151, '2021-07-31 17:51:00', 'Ingreso', 'A crear Acuerdo'),
(5855, 1, 149, '2021-07-31 17:52:26', 'Ingreso', 'A Actas Pendientes'),
(5856, 1, 146, '2021-07-31 17:52:34', 'Ingreso', 'A crear Reunion'),
(5857, 1, 152, '2021-07-31 17:54:20', 'Ingreso', 'A Acuerdos Pendientes'),
(5858, 1, 151, '2021-07-31 17:54:24', 'Ingreso', 'A crear Acuerdo'),
(5859, 1, 151, '2021-07-31 17:54:33', 'Ingreso', 'A crear Acuerdo'),
(5860, 1, 151, '2021-07-31 17:56:04', 'Ingreso', 'A crear Acuerdo'),
(5861, 1, 151, '2021-07-31 17:56:48', 'Ingreso', 'A crear Acuerdo'),
(5862, 1, 152, '2021-07-31 18:02:24', 'Ingreso', 'A Acuerdos Pendientes'),
(5863, 1, 151, '2021-07-31 18:02:32', 'Ingreso', 'A crear Acuerdo'),
(5864, 1, 152, '2021-07-31 18:07:02', 'Ingreso', 'A Acuerdos Pendientes'),
(5865, 1, 151, '2021-07-31 18:07:06', 'Ingreso', 'A crear Acuerdo'),
(5866, 1, 152, '2021-07-31 18:32:06', 'Ingreso', 'A Acuerdos Pendientes'),
(5867, 1, 151, '2021-07-31 19:16:19', 'Ingreso', 'A crear Acuerdo'),
(5868, 1, 152, '2021-07-31 19:18:33', 'Ingreso', 'A Acuerdos Pendientes'),
(5869, 1, 152, '2021-07-31 20:12:50', 'Ingreso', 'A Acuerdos Pendientes'),
(5870, 1, 152, '2021-07-31 20:13:42', 'Ingreso', 'A Acuerdos Pendientes'),
(5871, 1, 152, '2021-07-31 20:16:15', 'Ingreso', 'A Acuerdos Pendientes'),
(5872, 1, 152, '2021-07-31 20:18:14', 'Ingreso', 'A Acuerdos Pendientes'),
(5873, 1, 152, '2021-07-31 20:22:13', 'Ingreso', 'A Acuerdos Pendientes'),
(5874, 1, 152, '2021-07-31 20:23:56', 'Ingreso', 'A Acuerdos Pendientes'),
(5875, 1, 152, '2021-07-31 20:25:57', 'Ingreso', 'A Acuerdos Pendientes'),
(5876, 1, 146, '2021-08-01 14:11:52', 'Ingreso', 'A crear Reunion'),
(5877, 1, 147, '2021-08-01 14:16:25', 'Ingreso', 'A Reuniones Pendientes'),
(5878, 1, 146, '2021-08-01 14:16:41', 'Ingreso', 'A crear Reunion'),
(5879, 1, 147, '2021-08-01 14:18:46', 'Ingreso', 'A Reuniones Pendientes'),
(5880, 1, 148, '2021-08-01 14:20:12', 'Ingreso', 'A Lista de Reuniones'),
(5881, 1, 148, '2021-08-01 14:23:18', 'Ingreso', 'A Lista de Reuniones'),
(5882, 1, 148, '2021-08-01 14:24:19', 'Ingreso', 'A Lista de Reuniones'),
(5883, 1, 148, '2021-08-01 14:24:34', 'Ingreso', 'A Lista de Reuniones'),
(5884, 1, 148, '2021-08-01 14:24:35', 'Ingreso', 'A Lista de Reuniones'),
(5885, 1, 148, '2021-08-01 14:24:35', 'Ingreso', 'A Lista de Reuniones'),
(5886, 1, 148, '2021-08-01 14:24:35', 'Ingreso', 'A Lista de Reuniones'),
(5887, 1, 148, '2021-08-01 14:24:36', 'Ingreso', 'A Lista de Reuniones'),
(5888, 1, 148, '2021-08-01 14:24:38', 'Ingreso', 'A Lista de Reuniones'),
(5889, 1, 148, '2021-08-01 14:24:39', 'Ingreso', 'A Lista de Reuniones'),
(5890, 1, 147, '2021-08-01 14:25:32', 'Ingreso', 'A Reuniones Pendientes'),
(5891, 1, 147, '2021-08-01 14:31:01', 'Ingreso', 'A Reuniones Pendientes'),
(5892, 1, 147, '2021-08-01 14:32:01', 'Ingreso', 'A Reuniones Pendientes'),
(5893, 1, 147, '2021-08-01 14:35:10', 'Ingreso', 'A Reuniones Pendientes'),
(5894, 1, 147, '2021-08-01 14:35:55', 'Ingreso', 'A Reuniones Pendientes'),
(5895, 1, 147, '2021-08-01 14:37:26', 'Ingreso', 'A Reuniones Pendientes'),
(5896, 1, 148, '2021-08-01 14:39:35', 'Ingreso', 'A Lista de Reuniones'),
(5897, 1, 147, '2021-08-01 14:39:52', 'Ingreso', 'A Reuniones Pendientes'),
(5898, 1, 147, '2021-08-01 14:41:05', 'Ingreso', 'A Reuniones Pendientes'),
(5899, 1, 146, '2021-08-01 14:42:25', 'Ingreso', 'A crear Reunion'),
(5900, 1, 147, '2021-08-01 14:42:27', 'Ingreso', 'A Reuniones Pendientes'),
(5901, 1, 148, '2021-08-01 14:42:32', 'Ingreso', 'A Lista de Reuniones'),
(5902, 1, 148, '2021-08-01 14:44:31', 'Ingreso', 'A Lista de Reuniones'),
(5903, 1, 148, '2021-08-01 14:44:32', 'Ingreso', 'A Lista de Reuniones'),
(5904, 1, 149, '2021-08-01 14:48:55', 'Ingreso', 'A Actas Pendientes'),
(5905, 1, 146, '2021-08-01 14:49:01', 'Ingreso', 'A crear Reunion'),
(5906, 1, 149, '2021-08-01 14:49:04', 'Ingreso', 'A Actas Pendientes'),
(5907, 1, 146, '2021-08-01 14:49:08', 'Ingreso', 'A crear Reunion'),
(5908, 1, 149, '2021-08-01 14:49:10', 'Ingreso', 'A Actas Pendientes'),
(5909, 1, 146, '2021-08-01 14:49:15', 'Ingreso', 'A crear Reunion'),
(5910, 1, 149, '2021-08-01 14:49:22', 'Ingreso', 'A Actas Pendientes'),
(5911, 1, 146, '2021-08-01 14:49:26', 'Ingreso', 'A crear Reunion'),
(5912, 1, 149, '2021-08-01 14:50:44', 'Ingreso', 'A Actas Pendientes'),
(5913, 1, 146, '2021-08-01 14:50:48', 'Ingreso', 'A crear Reunion'),
(5914, 1, 146, '2021-08-01 14:57:31', 'Ingreso', 'A crear Reunion'),
(5915, 1, 146, '2021-08-01 14:58:26', 'Ingreso', 'A crear Reunion'),
(5916, 1, 146, '2021-08-01 14:58:39', 'Ingreso', 'A crear Reunion'),
(5917, 1, 146, '2021-08-01 15:05:59', 'Ingreso', 'A crear Reunion'),
(5918, 1, 146, '2021-08-01 15:06:14', 'Ingreso', 'A crear Reunion'),
(5919, 1, 146, '2021-08-01 15:06:34', 'Ingreso', 'A crear Reunion'),
(5920, 1, 146, '2021-08-01 15:06:57', 'Ingreso', 'A crear Reunion'),
(5921, 1, 146, '2021-08-01 15:07:16', 'Ingreso', 'A crear Reunion'),
(5922, 1, 146, '2021-08-01 15:08:50', 'Ingreso', 'A crear Reunion'),
(5923, 1, 146, '2021-08-01 15:09:05', 'Ingreso', 'A crear Reunion'),
(5924, 1, 146, '2021-08-01 15:09:54', 'Ingreso', 'A crear Reunion'),
(5925, 1, 146, '2021-08-01 15:10:52', 'Ingreso', 'A crear Reunion'),
(5926, 1, 146, '2021-08-01 15:11:28', 'Ingreso', 'A crear Reunion'),
(5927, 1, 146, '2021-08-01 15:11:38', 'Ingreso', 'A crear Reunion'),
(5928, 1, 146, '2021-08-01 15:12:15', 'Ingreso', 'A crear Reunion'),
(5929, 1, 146, '2021-08-01 15:12:26', 'Ingreso', 'A crear Reunion'),
(5930, 1, 146, '2021-08-01 15:12:36', 'Ingreso', 'A crear Reunion'),
(5931, 1, 146, '2021-08-01 15:13:07', 'Ingreso', 'A crear Reunion'),
(5932, 1, 146, '2021-08-01 15:13:55', 'Ingreso', 'A crear Reunion'),
(5933, 1, 146, '2021-08-01 15:14:04', 'Ingreso', 'A crear Reunion'),
(5934, 1, 146, '2021-08-01 15:14:41', 'Ingreso', 'A crear Reunion'),
(5935, 1, 146, '2021-08-01 15:14:52', 'Ingreso', 'A crear Reunion'),
(5936, 1, 146, '2021-08-01 15:15:35', 'Ingreso', 'A crear Reunion'),
(5937, 1, 146, '2021-08-01 15:16:20', 'Ingreso', 'A crear Reunion'),
(5938, 1, 146, '2021-08-01 15:19:31', 'Ingreso', 'A crear Reunion'),
(5939, 1, 146, '2021-08-01 15:20:04', 'Ingreso', 'A crear Reunion'),
(5940, 1, 146, '2021-08-01 15:20:26', 'Ingreso', 'A crear Reunion'),
(5941, 1, 146, '2021-08-01 15:20:50', 'Ingreso', 'A crear Reunion'),
(5942, 1, 146, '2021-08-01 15:21:27', 'Ingreso', 'A crear Reunion'),
(5943, 1, 146, '2021-08-01 15:25:08', 'Ingreso', 'A crear Reunion'),
(5944, 1, 146, '2021-08-01 15:25:46', 'Ingreso', 'A crear Reunion'),
(5945, 1, 146, '2021-08-01 15:26:01', 'Ingreso', 'A crear Reunion'),
(5946, 1, 146, '2021-08-01 15:26:23', 'Ingreso', 'A crear Reunion'),
(5947, 1, 146, '2021-08-01 15:26:45', 'Ingreso', 'A crear Reunion'),
(5948, 1, 146, '2021-08-01 15:27:15', 'Ingreso', 'A crear Reunion'),
(5949, 1, 146, '2021-08-01 15:27:36', 'Ingreso', 'A crear Reunion'),
(5950, 1, 149, '2021-08-01 15:28:47', 'Ingreso', 'A Actas Pendientes'),
(5951, 1, 146, '2021-08-01 15:28:54', 'Ingreso', 'A crear Reunion'),
(5952, 1, 149, '2021-08-01 15:29:16', 'Ingreso', 'A Actas Pendientes'),
(5953, 1, 146, '2021-08-01 15:29:19', 'Ingreso', 'A crear Reunion'),
(5954, 1, 149, '2021-08-01 15:29:22', 'Ingreso', 'A Actas Pendientes'),
(5955, 1, 146, '2021-08-01 15:29:23', 'Ingreso', 'A crear Reunion'),
(5956, 1, 149, '2021-08-01 15:29:25', 'Ingreso', 'A Actas Pendientes'),
(5957, 1, 150, '2021-08-01 15:29:28', 'Ingreso', 'A Lista Actas'),
(5958, 1, 146, '2021-08-01 15:29:34', 'Ingreso', 'A crear Reunion'),
(5959, 1, 149, '2021-08-01 15:30:33', 'Ingreso', 'A Actas Pendientes'),
(5960, 1, 146, '2021-08-01 15:30:37', 'Ingreso', 'A crear Reunion'),
(5961, 1, 149, '2021-08-01 15:31:35', 'Ingreso', 'A Actas Pendientes'),
(5962, 1, 150, '2021-08-01 15:31:48', 'Ingreso', 'A Lista Actas'),
(5963, 1, 149, '2021-08-01 15:32:55', 'Ingreso', 'A Actas Pendientes'),
(5964, 1, 150, '2021-08-01 15:33:08', 'Ingreso', 'A Lista Actas'),
(5965, 1, 146, '2021-08-01 15:33:18', 'Ingreso', 'A crear Reunion'),
(5966, 1, 146, '2021-08-01 15:36:28', 'Ingreso', 'A crear Reunion'),
(5967, 1, 146, '2021-08-01 15:36:31', 'Ingreso', 'A crear Reunion'),
(5968, 1, 146, '2021-08-01 15:37:51', 'Ingreso', 'A crear Reunion'),
(5969, 1, 146, '2021-08-01 15:38:51', 'Ingreso', 'A crear Reunion'),
(5970, 1, 146, '2021-08-01 15:39:01', 'Ingreso', 'A crear Reunion'),
(5971, 1, 146, '2021-08-01 15:39:14', 'Ingreso', 'A crear Reunion'),
(5972, 1, 146, '2021-08-01 15:39:56', 'Ingreso', 'A crear Reunion'),
(5973, 1, 152, '2021-08-01 15:40:23', 'Ingreso', 'A Acuerdos Pendientes'),
(5974, 1, 153, '2021-08-01 15:40:37', 'Ingreso', 'A Lista de Acuerdos'),
(5975, 1, 154, '2021-08-01 15:41:01', 'Ingreso', 'Asistencia por actas'),
(5976, 1, 155, '2021-08-01 15:41:13', 'Ingreso', 'A Asistencia por Persona'),
(5977, 1, 156, '2021-08-01 15:42:17', 'Ingreso', 'A Mantenimiento Estado Acta'),
(5978, 1, 156, '2021-08-01 15:42:23', 'Ingreso', 'A Mantenimiento Estado Acta');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cambio_carrera`
--

CREATE TABLE `tbl_cambio_carrera` (
  `Id_cambio` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `razon_cambio` varchar(255) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `aprobado` varchar(255) NOT NULL,
  `Id_centro_regional` bigint(20) DEFAULT NULL,
  `fecha_creacion` varchar(30) DEFAULT NULL,
  `documento` longtext,
  `Id_facultad` bigint(20) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cambio_carrera`
--

INSERT INTO `tbl_cambio_carrera` (`Id_cambio`, `id_persona`, `razon_cambio`, `observacion`, `aprobado`, `Id_centro_regional`, `fecha_creacion`, `documento`, `Id_facultad`, `tipo`, `correo`) VALUES
(57, 6, 'sa', '', 'desaprobado', 1, '2020-10-12 16:23:40', '[\"../archivos/cambio/interno/20141011506/Abrir acceso por red a Xampp.pdf\",\"../archivos/cambio/interno/20141011506/bd_Automatizacion.pdf\",\"../archivos/cambio/interno/20141011506/doc(1).pdf\",\"../archivos/cambio/interno/20141011506/doc(2).pdf\",\"../archivos/', 1, 'INTERNO', 'sa@unah.hn'),
(58, 6, '', '', 'desaprobado', 1, '2020-10-12 16:45:09', '[\"../archivos/cambio/simultanea/20141011506/Abrir acceso por red a Xampp.pdf\",\"../archivos/cambio/simultanea/20141011506/doc(1).pdf\",\"../archivos/cambio/simultanea/20141011506/doc(3).pdf\",\"../archivos/cambio/simultanea/20141011506/doc.pdf\"]', 1, 'SIMULTANEA', 'nicole@unah.hn'),
(60, 4, 'sa', '', 'desaprobado', 1, '2020-10-13 16:10:42', '[\"../archivos/cambio/interno/20131015093/doc(1).pdf\",\"../archivos/cambio/interno/20131015093/doc(2).pdf\",\"../archivos/cambio/interno/20131015093/doc(3).pdf\",\"../archivos/cambio/interno/20131015093/doc.pdf\",\"../archivos/cambio/interno/20131015093/Abrir acc', 1, 'INTERNO', 'hcalix92@unah.hn'),
(63, 153, '', '', 'desaprobado', 1, '2021-05-20 21:53:27', '[\"../archivos/cambio/simultanea/20131015093/doc.pdf\",\"../archivos/cambio/simultanea/20131015093/doc(1).pdf\",\"../archivos/cambio/simultanea/20131015093/doc(2).pdf\",\"../archivos/cambio/simultanea/20131015093/doc(3).pdf\"]', 1, 'SIMULTANEA', 'sa@unah.hn'),
(72, 153, 'sa', '', 'desaprobado', 1, '2021-05-20 23:53:23', '', 1, 'INTERNO', 'sa@unah.hn'),
(73, 153, 'sa', '', 'desaprobado', 1, '2021-05-21 00:07:54', '', 1, 'INTERNO', 'sa@unah.hn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cancelar_clases`
--

CREATE TABLE `tbl_cancelar_clases` (
  `Id_cancelar_clases` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `Fecha_creacion` varchar(255) NOT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `cambio` varchar(255) DEFAULT NULL,
  `observacion` varchar(2000) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cancelar_clases`
--

INSERT INTO `tbl_cancelar_clases` (`Id_cancelar_clases`, `id_persona`, `motivo`, `Fecha_creacion`, `documento`, `cambio`, `observacion`, `correo`) VALUES
(27, 6, 'sa', '2020-10-12 16:26:16', '[\"../archivos/cancelar_clases/20141011506/Abrir acceso por red a Xampp.pdf\",\"../archivos/cancelar_clases/20141011506/bd_Automatizacion.pdf\",\"../archivos/cancelar_clases/20141011506/doc(1).pdf\",\"../archivos/cancelar_clases/20141011506/doc.pdf\"]', 'desaprobado', NULL, 'nicolle@unah.hn'),
(28, 4, 'sa', '2020-10-12 17:43:25', '[\"../archivos/cancelar_clases/20131015093/doc(1).pdf\",\"../archivos/cancelar_clases/20131015093/doc(2).pdf\",\"../archivos/cancelar_clases/20131015093/doc.pdf\",\"../archivos/cancelar_clases/20131015093/bd_Automatizacion.pdf\"]', 'desaprobado', NULL, 'hcalix92@gmail.com'),
(29, 153, 'sa', '2021-05-20 22:46:16', '[\"../archivos/cancelar_clases/20131015093/doc.pdf\",\"../archivos/cancelar_clases/20131015093/doc(1).pdf\",\"../archivos/cancelar_clases/20131015093/doc(2).pdf\",\"../archivos/cancelar_clases/20131015093/doc(3).pdf\"]', 'desaprobado', NULL, 'sa@unah.hn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carga_academica`
--

CREATE TABLE `tbl_carga_academica` (
  `id_carga_academica` bigint(20) NOT NULL,
  `control` varchar(100) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  `num_alumnos` int(11) DEFAULT NULL,
  `id_persona` bigint(20) DEFAULT NULL,
  `id_aula` bigint(20) DEFAULT NULL,
  `id_asignatura` bigint(20) DEFAULT NULL,
  `id_periodo` bigint(20) DEFAULT NULL,
  `dias` varchar(50) DEFAULT NULL,
  `id_modalidad` bigint(20) DEFAULT NULL,
  `hora_inicial` varchar(50) DEFAULT NULL,
  `hora_final` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_carga_academica`
--

INSERT INTO `tbl_carga_academica` (`id_carga_academica`, `control`, `seccion`, `num_alumnos`, `id_persona`, `id_aula`, `id_asignatura`, `id_periodo`, `dias`, `id_modalidad`, `hora_inicial`, `hora_final`) VALUES
(97, '55602', '0800', 50, 116, 22, 53, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(98, '55602', '1100', 50, 116, 22, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(99, '55644', '1300', 45, 80, 21, 19, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(100, '55605', '1500', 40, 80, 23, 9, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(101, '55648', '1800', 50, 80, 19, 19, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(102, '55604', '0700', 35, 80, 19, 9, 3, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(103, '55605', '1000', 35, 81, 25, 9, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(104, '55694', '1400', 45, 82, 21, 37, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(105, '55686', '1500', 35, 82, 25, 32, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(106, '55688', '1700', 35, 82, 25, 32, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(107, '557216', '1700', 50, 25, 20, 52, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(108, '556996', '1700', 40, 83, 23, 38, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(109, '556801', '0700', 50, 84, 20, 53, 3, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(110, '556256', '1300', 50, 85, 20, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(112, '563300', '1700', 50, 86, 19, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(113, '585476', '1900', 46, 86, 26, 42, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(114, '557249', '2000', 50, 86, 19, 51, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(115, '556274', '1400', 55, 15, 24, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(117, '556350', '1600', 35, 15, 25, 16, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(118, '556845', '1900', 35, 15, 25, 31, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(119, '557182', '1600', 50, 87, 22, 50, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(120, '557118', '1700', 50, 87, 22, 45, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(121, '556030', '1300', 35, 88, 25, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(122, '556038', '1100', 40, 88, 23, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(123, '556038', '1400', 50, 88, 20, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(124, '556475', '1500', 50, 89, 19, 19, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(125, '557026', '1600', 50, 89, 20, 40, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(126, '556653', '1800', 35, 90, 25, 20, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(127, '556713', '1900', 45, 90, 21, 20, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(128, '557009', '1600', 40, 92, 23, 38, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(129, '557067', '1700', 55, 93, 24, 42, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(130, '556043', '1900', 50, 93, 22, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(131, '556972', '1300', 40, 19, 23, 38, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(132, '556049', '0800', 55, 95, 24, 9, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(133, '556294', '0900', 35, 95, 25, 16, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(134, '556608', '1000', 40, 95, 23, 22, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(135, '556766', '1700', 45, 96, 21, 27, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(136, '556398', '1900', 55, 96, 24, 16, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(137, '556598', '0700', 45, 97, 21, 22, 3, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(138, '586464', '0900', 45, 97, 21, 10, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(139, '556740', '1000', 50, 97, 19, 27, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(140, '556557', '1500', 45, 98, 17, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(141, '556566', '1600', 45, 98, 21, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(142, '556041', '1800', 55, 98, 24, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(143, '556335', '1400', 50, 99, 19, 16, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(144, '556033', '0800', 40, 18, 23, 11, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(145, '556232', '1000', 50, 18, 17, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(146, '556035', '1300', 55, 18, 24, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(147, '556061', '0900', 50, 101, 22, 10, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(148, '556536', '1000', 45, 101, 21, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(149, '556632', '1200', 45, 101, 21, 20, 3, 'Lu,Ma,Mi,Ju', 1, '1200', '1300'),
(150, '556917', '1800', 50, 102, 17, 33, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(151, '556822', '2000', 45, 102, 21, 29, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(152, '557139', '1900', 50, 103, 20, 46, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(153, '563282', '1800', 50, 105, 29, 22, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(154, '563298', '1900', 40, 24, 23, 37, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(155, '563290', '2000', 50, 24, 22, 46, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(156, '586497', '1400', 45, 107, 28, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(157, '563303', '1500', 55, 107, 24, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(158, '585535', '1800', 40, 109, 23, 52, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(159, '586510', '2000', 45, 109, 28, 11, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(160, '586510', '1600', 55, 110, 24, 53, 3, 'Vi', 1, '1600', '1700'),
(161, '586510', '1900', 50, 111, 29, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(162, '586510', '2001', 50, 111, 18, 29, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(164, '586510', '1900', 52, 112, 27, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(165, '586510', '1800', 46, 112, 26, 9, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(166, '586510', '1600', 45, 63, 28, 31, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(167, '586510', '1800', 52, 63, 27, 41, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(168, '586510', '2000', 52, 63, 27, 41, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(169, '586510', '1800', 50, 115, 21, 36, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(170, '586510', '2000', 40, 115, 23, 9, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(171, '586442', '1300', 50, 117, 19, 48, 3, 'Lu,Ma,Mi', 1, '1300', '1400'),
(172, '557149', '1400', 35, 117, 25, 48, 3, 'Lu,Ma,Mi', 1, '1400', '1500'),
(173, '55602', '0800', 50, 116, 22, 53, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(174, '55602', '1100', 50, 116, 22, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(175, '55644', '1300', 45, 80, 21, 19, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(176, '55605', '1500', 40, 80, 23, 9, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(177, '55648', '1800', 50, 80, 19, 19, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(178, '55604', '0700', 35, 80, 19, 9, 3, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(179, '55605', '1000', 35, 81, 25, 9, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(180, '55694', '1400', 45, 82, 21, 37, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(181, '55686', '1500', 35, 82, 25, 32, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(182, '55688', '1700', 35, 82, 25, 32, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(183, '557216', '1700', 50, 25, 20, 52, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(184, '556996', '1700', 40, 83, 23, 38, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(185, '556801', '0700', 50, 84, 20, 53, 3, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(186, '556256', '1300', 50, 85, 20, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(187, '563300', '1700', 50, 86, 19, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(188, '585476', '1900', 46, 86, 26, 42, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(189, '557249', '2000', 50, 86, 19, 51, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(190, '556274', '1400', 55, 15, 24, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(191, '556350', '1600', 35, 15, 25, 16, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(192, '556845', '1900', 35, 15, 25, 31, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(193, '557182', '1600', 50, 87, 22, 50, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(194, '557118', '1700', 50, 87, 22, 45, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(195, '556030', '1300', 35, 88, 25, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(196, '556038', '1100', 40, 88, 23, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(197, '556038', '1400', 50, 88, 20, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(198, '556475', '1500', 50, 89, 19, 19, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(199, '557026', '1600', 50, 89, 20, 40, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(200, '556653', '1800', 35, 90, 25, 20, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(201, '556713', '1900', 45, 90, 21, 20, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(202, '557009', '1600', 40, 92, 23, 38, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(203, '557067', '1700', 55, 93, 24, 42, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(204, '556043', '1900', 50, 93, 22, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(205, '556972', '1300', 40, 19, 23, 38, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(206, '556049', '0800', 55, 95, 24, 9, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(207, '556294', '0900', 35, 95, 25, 16, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(208, '556608', '1000', 40, 95, 23, 22, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(209, '556766', '1700', 45, 96, 21, 27, 3, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(210, '556398', '1900', 55, 96, 24, 16, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(211, '556598', '0700', 45, 97, 21, 22, 3, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(212, '586464', '0900', 45, 97, 21, 10, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(213, '556740', '1000', 50, 97, 19, 27, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(214, '556557', '1500', 45, 98, 17, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(215, '556566', '1600', 45, 98, 21, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(216, '556041', '1800', 55, 98, 24, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(217, '556335', '1400', 50, 99, 19, 16, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(218, '556033', '0800', 40, 18, 23, 11, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(219, '556232', '1000', 50, 18, 17, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(220, '556035', '1300', 55, 18, 24, 11, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(221, '556061', '0900', 50, 101, 22, 10, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(222, '556536', '1000', 45, 101, 21, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(223, '556632', '1200', 45, 101, 21, 20, 3, 'Lu,Ma,Mi,Ju', 1, '1200', '1300'),
(224, '556917', '1800', 50, 102, 17, 33, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(225, '556822', '2000', 45, 102, 21, 29, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(226, '557139', '1900', 50, 103, 20, 46, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(227, '563282', '1800', 50, 105, 29, 22, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(228, '563298', '1900', 40, 24, 23, 37, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(229, '563290', '2000', 50, 24, 22, 46, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(230, '586497', '1400', 45, 107, 28, 53, 3, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(231, '563303', '1500', 55, 107, 24, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(232, '585535', '1800', 40, 109, 23, 52, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(233, '586510', '2000', 45, 109, 28, 11, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(234, '586510', '1600', 55, 110, 24, 53, 3, 'Vi', 1, '1600', '1700'),
(235, '586510', '1900', 50, 111, 29, 21, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(236, '586510', '2001', 50, 111, 18, 29, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(237, '586510', '1900', 52, 112, 27, 10, 3, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(238, '586510', '1800', 46, 112, 26, 9, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(239, '586510', '1600', 45, 63, 28, 31, 3, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(240, '586510', '1800', 52, 63, 27, 41, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(241, '586510', '2000', 52, 63, 27, 41, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(242, '586510', '1800', 50, 115, 21, 36, 3, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(243, '586510', '2000', 40, 115, 23, 9, 3, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(244, '586442', '1300', 50, 117, 19, 48, 3, 'Lu,Ma,Mi', 1, '1300', '1400'),
(246, '11111', '0800', 11, 104, NULL, 52, 3, 'Lu,Ma,Mi,Ju', 3, '0800', '0900'),
(247, '22222', '0900', 50, 80, 18, 49, 3, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(248, '', '0800', 45, 80, 21, 24, 3, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(249, '', '0800', 45, 18, 21, 24, 3, 'Lu,Ma,Mi,Ju', 1, '1300', '1500'),
(250, '55601', '0800', 56, 116, NULL, 53, 4, 'Lu,Ma,Mi,Ju', 3, '0800', '0900'),
(251, '55602', '1100', 50, 116, 22, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(252, '55644', '1300', 45, 80, 21, 19, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(253, '55605', '1500', 40, 80, 23, 9, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(254, '55648', '1800', 50, 80, 19, 19, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(255, '55604', '0700', 35, 80, 19, 9, 4, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(256, '55605', '1000', 35, 81, 25, 9, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(257, '55694', '1400', 45, 82, 21, 37, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(258, '55686', '1500', 35, 82, 25, 32, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(259, '55688', '1700', 35, 82, 25, 32, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(260, '557216', '1700', 50, 25, 20, 52, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(262, '556801', '0700', 50, 84, 20, 53, 4, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(263, '556256', '1300', 50, 85, 20, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(264, '563300', '1700', 50, 86, 19, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(265, '585476', '1900', 46, 86, 26, 42, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(266, '557249', '2000', 50, 86, 19, 51, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(267, '556274', '1400', 55, 15, 24, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(268, '556350', '1600', 35, 15, 25, 16, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(269, '556845', '1900', 35, 15, 25, 31, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(270, '557182', '1600', 50, 87, 22, 50, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(271, '557118', '1700', 50, 87, 22, 45, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(272, '556030', '1300', 35, 88, 25, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(273, '556038', '1100', 40, 88, 23, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(274, '556038', '1400', 50, 88, 20, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(275, '556475', '1500', 50, 89, 19, 19, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(276, '557026', '1600', 50, 89, 20, 40, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(277, '556653', '1800', 35, 90, 25, 20, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(278, '556713', '1900', 45, 90, 21, 20, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(279, '557009', '1600', 40, 92, 23, 38, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(280, '557067', '1700', 55, 93, 24, 42, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(281, '556043', '1900', 50, 93, 22, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(282, '556972', '1300', 40, 19, 23, 38, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(283, '556049', '0800', 55, 95, 24, 9, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(284, '556294', '0900', 35, 95, 25, 16, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(285, '556608', '1000', 40, 95, 23, 22, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(286, '556766', '1700', 45, 96, 21, 27, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(287, '556398', '1900', 55, 96, 24, 16, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(288, '556598', '0700', 45, 97, 21, 22, 4, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(289, '586464', '0900', 45, 97, 21, 10, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(290, '556740', '1000', 50, 97, 19, 27, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(291, '556557', '1500', 45, 98, 17, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(292, '556566', '1600', 45, 98, 21, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(293, '556041', '1800', 55, 98, 24, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(294, '556335', '1400', 50, 99, 19, 16, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(295, '556033', '0800', 40, 18, 23, 11, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(296, '556232', '1000', 50, 18, 17, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(297, '556035', '1300', 55, 18, 24, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(298, '556061', '0900', 50, 101, 22, 10, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(299, '556536', '1000', 45, 101, 21, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(300, '556632', '1200', 45, 101, 21, 20, 4, 'Lu,Ma,Mi,Ju', 1, '1200', '1300'),
(301, '556917', '1800', 50, 102, 17, 33, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(302, '556822', '2000', 45, 102, 21, 29, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(303, '557139', '1900', 50, 103, 20, 46, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(304, '563282', '1800', 50, 105, 29, 22, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(305, '563298', '1900', 40, 24, 23, 37, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(306, '563290', '2000', 50, 24, 22, 46, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(307, '586497', '1400', 45, 107, 28, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(308, '563303', '1500', 55, 107, 24, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(309, '585535', '1800', 40, 109, 23, 52, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(310, '586510', '2000', 45, 109, 28, 11, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(311, '586510', '1600', 55, 110, 24, 53, 4, 'Vi', 1, '1600', '1700'),
(312, '586510', '1900', 50, 111, 29, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(313, '586510', '2001', 50, 111, 18, 29, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(314, '586510', '1900', 52, 112, 27, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(315, '586510', '1800', 46, 112, 26, 9, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(316, '586510', '1600', 45, 63, 28, 31, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(317, '586510', '1800', 52, 63, 27, 41, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(318, '586510', '2000', 52, 63, 27, 41, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(319, '586510', '1800', 50, 115, 21, 36, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(320, '586510', '2000', 40, 115, 23, 9, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(321, '586442', '1300', 50, 117, 19, 48, 4, 'Lu,Ma,Mi', 1, '1300', '1400'),
(322, '557149', '1400', 35, 117, 25, 48, 4, 'Lu,Ma,Mi', 1, '1400', '1500'),
(323, '55602', '0800', 50, 116, 22, 53, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(324, '55602', '1100', 50, 116, 22, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(325, '55644', '1300', 45, 80, 21, 19, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(326, '55605', '1500', 40, 80, 23, 9, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(327, '55648', '1800', 50, 80, 19, 19, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(328, '55604', '0700', 35, 80, 19, 9, 4, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(329, '55605', '1000', 35, 81, 25, 9, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(330, '55694', '1400', 45, 82, 21, 37, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(331, '55686', '1500', 35, 82, 25, 32, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(332, '55688', '1700', 35, 82, 25, 32, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(333, '557216', '1700', 50, 25, 20, 52, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(334, '556996', '1700', 40, 83, 23, 38, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(335, '556801', '0700', 50, 84, 20, 53, 4, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(336, '556256', '1300', 50, 85, 20, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(337, '563300', '1700', 50, 86, 19, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(338, '585476', '1900', 46, 86, 26, 42, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(339, '557249', '2000', 50, 86, 19, 51, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(340, '556274', '1400', 55, 15, 24, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(341, '556350', '1600', 35, 15, 25, 16, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(342, '556845', '1900', 35, 15, 25, 31, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(343, '557182', '1600', 50, 87, 22, 50, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(344, '557118', '1700', 50, 87, 22, 45, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(345, '556030', '1300', 35, 88, 25, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(346, '556038', '1100', 40, 88, 23, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1100', '1200'),
(347, '556038', '1400', 50, 88, 20, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(348, '556475', '1500', 50, 89, 19, 19, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(349, '557026', '1600', 50, 89, 20, 40, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(350, '556653', '1800', 35, 90, 25, 20, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(351, '556713', '1900', 45, 90, 21, 20, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(352, '557009', '1600', 40, 92, 23, 38, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(353, '557067', '1700', 55, 93, 24, 42, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(354, '556043', '1900', 50, 93, 22, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(355, '556972', '1300', 40, 19, 23, 38, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(356, '556049', '0800', 55, 95, 24, 9, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(357, '556294', '0900', 35, 95, 25, 16, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(358, '556608', '1000', 40, 95, 23, 22, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(359, '556766', '1700', 45, 96, 21, 27, 4, 'Lu,Ma,Mi,Ju', 1, '1700', '1800'),
(360, '556398', '1900', 55, 96, 24, 16, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(361, '556598', '0700', 45, 97, 21, 22, 4, 'Lu,Ma,Mi,Ju', 1, '0700', '0800'),
(362, '586464', '0900', 45, 97, 21, 10, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(363, '556740', '1000', 50, 97, 19, 27, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(364, '556557', '1500', 45, 98, 17, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(365, '556566', '1600', 45, 98, 21, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(366, '556041', '1800', 55, 98, 24, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(367, '556335', '1400', 50, 99, 19, 16, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(368, '556033', '0800', 40, 18, 23, 11, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(369, '556232', '1000', 50, 18, 17, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(370, '556035', '1300', 55, 18, 24, 11, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1400'),
(371, '556061', '0900', 50, 101, 22, 10, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(372, '556536', '1000', 45, 101, 21, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1000', '1100'),
(373, '556632', '1200', 45, 101, 21, 20, 4, 'Lu,Ma,Mi,Ju', 1, '1200', '1300'),
(374, '556917', '1800', 50, 102, 17, 33, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(375, '556822', '2000', 45, 102, 21, 29, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(376, '557139', '1900', 50, 103, 20, 46, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(377, '563282', '1800', 50, 105, 29, 22, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(378, '563298', '1900', 40, 24, 23, 37, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(379, '563290', '2000', 50, 24, 22, 46, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(380, '586497', '1400', 45, 107, 28, 53, 4, 'Lu,Ma,Mi,Ju', 1, '1400', '1500'),
(381, '563303', '1500', 55, 107, 24, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1500', '1600'),
(382, '585535', '1800', 40, 109, 23, 52, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(383, '586510', '2000', 45, 109, 28, 11, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(384, '586510', '1600', 55, 110, 24, 53, 4, 'Vi', 1, '1600', '1700'),
(385, '586510', '1900', 50, 111, 29, 21, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(386, '586510', '2001', 50, 111, 18, 29, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(387, '586510', '1900', 52, 112, 27, 10, 4, 'Lu,Ma,Mi,Ju', 1, '1900', '2000'),
(388, '586510', '1800', 46, 112, 26, 9, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(389, '586510', '1600', 45, 63, 28, 31, 4, 'Lu,Ma,Mi,Ju', 1, '1600', '1700'),
(390, '586510', '1800', 52, 63, 27, 41, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(391, '586510', '2000', 52, 63, 27, 41, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(392, '586510', '1800', 50, 115, 21, 36, 4, 'Lu,Ma,Mi,Ju', 1, '1800', '1900'),
(393, '586510', '2000', 40, 115, 23, 9, 4, 'Lu,Ma,Mi,Ju', 1, '2000', '2100'),
(394, '586442', '1300', 50, 117, 19, 48, 4, 'Lu,Ma,Mi', 1, '1300', '1400'),
(395, '11111', '0800', 11, 104, NULL, 52, 4, 'Lu,Ma,Mi,Ju', 3, '0800', '0900'),
(396, '22222', '0900', 50, 80, 18, 49, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(397, '', '0800', 45, 80, 21, 24, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(398, '', '0800', 45, 18, 21, 24, 4, 'Lu,Ma,Mi,Ju', 1, '1300', '1500'),
(505, '1', '0900', 60, 83, 19, 37, 4, 'Lu,Ma,Mi,Ju', 1, '0900', '1000'),
(506, '2', '1400', 70, 81, 30, 53, 4, 'Lu,Ma,Ju,Vi', 2, '1400', '1500'),
(507, '23', '1400', 80, 81, 8, 24, 4, 'Lu,Ma,Mi,Ju,Vi', 2, '1400', '1500'),
(510, '2', '1500', 30, 81, 11, 48, 4, 'Lu,Ma,Mi', 2, '1500', '1600'),
(511, '2', '19', 30, 82, 11, 36, 4, 'Lu,Ma,Mi,Ju', 2, '1600', '1700'),
(512, '34', '1700', 20, 82, 11, 16, 4, 'Lu,Ma,Mi,Ju', 2, '1700', '1800'),
(513, '111111', '0801', 33, 105, 26, 52, 4, 'Lu,Ma,Mi,Ju', 1, '0800', '0900'),
(516, '2', '1400', 23, 83, NULL, 21, 4, 'Lu', 3, '1400', '1500'),
(517, '2', '1400', 23, 106, 11, 52, 4, 'Lu,Ma,Mi,Ju', 2, '1400', '1500'),
(529, '13', '1200', 23, 83, 22, 50, 4, 'Lu,Ma,Mi,Ju', 2, '1200', '1300');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carga_dias`
--

CREATE TABLE `tbl_carga_dias` (
  `id_carga_academica` bigint(20) NOT NULL,
  `dias` varchar(50) DEFAULT NULL,
  `id_dia` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carrera`
--

CREATE TABLE `tbl_carrera` (
  `id_carrera` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Id_facultad` int(11) NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_carrera`
--

INSERT INTO `tbl_carrera` (`id_carrera`, `Descripcion`, `Id_facultad`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'INFORMATICA ADMINISTRATIVA', 1, NULL, NULL, '2021-04-06 02:44:59', 'ADMIN'),
(2, 'ADMINISTRACION DE EMPRESAS', 1, '2021-03-19 01:52:15', 'ADMIN', '2021-04-12 08:44:36', 'ADMIN'),
(8, 'LENGUAS EXTRANJERAS', 3, '2021-04-06 01:54:40', 'ADMIN', '2021-04-06 04:00:03', 'ADMIN'),
(10, 'ADMINISTRACION ADUANERA', 1, '2021-04-12 08:42:36', 'ADMIN', NULL, NULL),
(11, 'DATOS MAESTROS', 2, '2021-04-13 04:49:12', 'ADMIN', '2021-04-17 07:27:20', 'ADMIN'),
(12, 'ESPAÑOL', 5, '2021-06-07 12:27:59', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carta_egresado`
--

CREATE TABLE `tbl_carta_egresado` (
  `Id_carta` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL,
  `aprobado` varchar(255) DEFAULT NULL,
  `documento` varchar(250) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_carta_egresado`
--

INSERT INTO `tbl_carta_egresado` (`Id_carta`, `id_persona`, `observacion`, `Fecha_creacion`, `aprobado`, `documento`, `correo`) VALUES
(24, 6, '', '2020-10-12 17:52:35', 'aprobado', '[\"../archivos/carta_egresado/20141011506/doc(1).pdf\",\"../archivos/carta_egresado/20141011506/doc(2).pdf\",\"../archivos/carta_egresado/20141011506/doc(3).pdf\",\"../archivos/carta_egresado/20141011506/doc.pdf\"]', 'sa@unah.hn'),
(25, 4, '', '2020-10-27 02:34:29', 'desaprobado', '[\"../archivos/carta_egresado/20131015093/doc.pdf\",\"../archivos/carta_egresado/20131015093/doc(1).pdf\",\"../archivos/carta_egresado/20131015093/doc(2).pdf\",\"../archivos/carta_egresado/20131015093/doc(3).pdf\"]', 'helmer.calix@unah.hn'),
(27, 6, '', '2021-05-19 18:26:42', 'desaprobado', '[\"../archivos/carta_egresado/20141011506/doc.pdf\",\"../archivos/carta_egresado/20141011506/doc(1).pdf\",\"../archivos/carta_egresado/20141011506/doc(2).pdf\",\"../archivos/carta_egresado/20141011506/doc(3).pdf\"]', 'sa@unah.hn'),
(28, 153, '', '2021-05-20 22:10:02', 'desaprobado', '[\"../archivos/carta_egresado/20131015093/doc.pdf\",\"../archivos/carta_egresado/20131015093/doc(1).pdf\",\"../archivos/carta_egresado/20131015093/doc(2).pdf\",\"../archivos/carta_egresado/20131015093/doc(3).pdf\"]', 'sa@unah.hn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categorias`
--

CREATE TABLE `tbl_categorias` (
  `id_categoria` bigint(20) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id_categoria`, `categoria`, `descripcion`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'AUXILIAR', '', NULL, NULL, NULL, NULL),
(2, 'TITULAR 1', '', NULL, NULL, NULL, NULL),
(4, 'TITULAR 2', '', NULL, NULL, NULL, NULL),
(5, 'TITULAR 3', '', NULL, NULL, NULL, NULL),
(6, 'TITULAR 4', '', NULL, NULL, NULL, NULL),
(7, 'TITULAR 5', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categoria_personas`
--

CREATE TABLE `tbl_categoria_personas` (
  `id_categoria_persona` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `id_categoria` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_categoria_personas`
--

INSERT INTO `tbl_categoria_personas` (`id_categoria_persona`, `id_persona`, `id_categoria`) VALUES
(18, 39, 1),
(46, 80, 2),
(47, 81, 1),
(48, 82, 2),
(49, 83, 2),
(50, 84, 2),
(51, 85, 2),
(52, 86, 2),
(53, 87, 2),
(54, 88, 2),
(55, 89, 2),
(56, 90, 2),
(57, 91, 2),
(58, 92, 2),
(59, 93, 2),
(60, 94, 2),
(61, 95, 2),
(62, 96, 2),
(63, 97, 2),
(64, 98, 2),
(65, 99, 2),
(66, 100, 2),
(67, 101, 2),
(68, 102, 2),
(69, 103, 2),
(70, 104, 2),
(71, 105, 2),
(72, 106, 2),
(73, 107, 2),
(74, 108, 2),
(75, 109, 2),
(76, 110, 2),
(77, 111, 2),
(78, 112, 2),
(79, 113, 2),
(80, 114, 2),
(81, 115, 2),
(82, 116, 2),
(83, 117, 2),
(84, 118, 2),
(114, 149, 7),
(115, 159, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_centros_regionales`
--

CREATE TABLE `tbl_centros_regionales` (
  `Id_centro_regional` bigint(20) NOT NULL,
  `centro_regional` varchar(255) NOT NULL,
  `acronimo` varchar(255) NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Id_facultad` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_centros_regionales`
--

INSERT INTO `tbl_centros_regionales` (`Id_centro_regional`, `centro_regional`, `acronimo`, `Fecha_creacion`, `Id_facultad`) VALUES
(1, 'Ciudad Universitaria', 'CU', '2020-05-31 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_charla_practica`
--

CREATE TABLE `tbl_charla_practica` (
  `Id_charla` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `no_constancia` bigint(20) NOT NULL,
  `promedio_global` varchar(255) NOT NULL,
  `fecha_recibida` varchar(255) DEFAULT NULL,
  `fecha_valida` varchar(255) DEFAULT NULL,
  `clases_aprobadas` varchar(255) NOT NULL,
  `porcentaje_clases` float NOT NULL,
  `jornada` varchar(255) NOT NULL,
  `estado_asistencia_charla` int(11) NOT NULL,
  `charla_impartida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_charla_practica`
--

INSERT INTO `tbl_charla_practica` (`Id_charla`, `id_persona`, `no_constancia`, `promedio_global`, `fecha_recibida`, `fecha_valida`, `clases_aprobadas`, `porcentaje_clases`, `jornada`, `estado_asistencia_charla`, `charla_impartida`) VALUES
(1, 6, 202104085, '90', NULL, NULL, '45', 86, 'MATUTINA', 0, 0),
(2, 6, 202104094, '99', NULL, NULL, '50', 96, 'VESPERTINA', 0, 0),
(3, 22, 202105095, '85', '2021-06-15', '2021-09-13', '49', 94, 'VESPERTINA', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comentarios_alumnos`
--

CREATE TABLE `tbl_comentarios_alumnos` (
  `id_comentario_alumno` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `comentario_evaluacion` varchar(255) NOT NULL,
  `area_refuerzo` varchar(255) DEFAULT NULL,
  `calificacion_global` varchar(255) DEFAULT NULL,
  `solicitar_practicante` varchar(255) DEFAULT NULL,
  `oportunidad_empleo` varchar(255) DEFAULT NULL,
  `nombre_representante` varchar(255) NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `numero_visita` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comentarios_alumnos`
--

INSERT INTO `tbl_comentarios_alumnos` (`id_comentario_alumno`, `id_persona`, `comentario_evaluacion`, `area_refuerzo`, `calificacion_global`, `solicitar_practicante`, `oportunidad_empleo`, `nombre_representante`, `lugar`, `fecha`, `numero_visita`) VALUES
(1, 26, '', NULL, NULL, NULL, NULL, 'aaaa', 'aaaa', '2021-03-24 20:19:02', 'Primera Supervisión');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comisiones`
--

CREATE TABLE `tbl_comisiones` (
  `id_comisiones` int(11) NOT NULL,
  `comision` varchar(100) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_comisiones`
--

INSERT INTO `tbl_comisiones` (`id_comisiones`, `comision`, `id_carrera`, `Creado_por`, `Fecha_creacion`, `Modificado_por`, `Fecha_modificacion`) VALUES
(1, 'VINCULACION', 2, NULL, NULL, 'ADMIN', '2021-04-08'),
(2, 'AUTOMATIZACION ', 1, NULL, NULL, 'ADMIN', '2021-05-03'),
(3, 'INVESTIGACION', 1, NULL, NULL, NULL, NULL),
(4, 'VOAE', 1, NULL, NULL, 'ADMIN', '2021-02-22'),
(12, 'COMITE DESARROLLO CURRICULAR', 1, NULL, NULL, NULL, NULL),
(13, 'COMITE TÉCNICO', 1, NULL, NULL, NULL, NULL),
(14, 'COMITE VUS-DEPTO ', 1, NULL, NULL, NULL, NULL),
(15, 'COMITE LOCAL DE ORIENTACION ESTUDIANTIL', 1, NULL, NULL, NULL, NULL),
(16, 'COMITE DE CONCURSO', 1, NULL, NULL, NULL, NULL),
(17, 'COMITÉ DE PROMOCION DE LA CARRERA', 1, NULL, NULL, NULL, NULL),
(18, 'UNIDAD INVESTIGACION CIENTIFICA DEL DEPTO  ', 1, NULL, NULL, NULL, NULL),
(19, ' CONSEJO ASESOR', 1, NULL, NULL, NULL, NULL),
(20, 'COMISION DE REDISEÑO CURRICULAR', 1, NULL, NULL, NULL, NULL),
(21, 'GESTOR ACADEMICO DE ASIGNATURAS SED EN LOS CRAED', 1, NULL, NULL, NULL, NULL),
(22, 'JEFE DE SECCIONES REGIONALES', 1, NULL, NULL, NULL, NULL),
(23, 'GESTOR TECNOLOGICO', 1, NULL, NULL, NULL, NULL),
(25, 'GESTIÓN UNIVERSITARIA', 1, NULL, NULL, 'ADMIN', '2021-05-28'),
(26, 'SECRETARIA ACADEMICA DEL DEPARTAMENTO', 1, NULL, NULL, NULL, NULL),
(27, 'REGISTROO', 1, 'ADMIN', '2021-03-12', 'ADMIN', '2021-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contactos`
--

CREATE TABLE `tbl_contactos` (
  `id_contacto` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL DEFAULT '0',
  `id_tipo_contacto` bigint(20) NOT NULL DEFAULT '0',
  `valor` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contactos`
--

INSERT INTO `tbl_contactos` (`id_contacto`, `id_persona`, `id_tipo_contacto`, `valor`) VALUES
(1, 4, 1, '9898-8888'),
(2, 6, 1, '9876-5666'),
(22, 15, 1, '88888888'),
(23, 15, 4, 'EDIS.REYES@UNAH.EDU.HN'),
(24, 15, 3, 'TEGUCIGALPA'),
(25, 16, 1, '88888888'),
(26, 16, 4, 'CAROLD.RITHENHOUSE@UNAH.EDU.HN'),
(27, 16, 3, 'TEGUCIGALPA'),
(28, 17, 1, '88888888'),
(29, 17, 4, 'NELSON.DIAZ@UNAH.EDU.HN'),
(30, 17, 3, 'TEGUCIGALPA'),
(31, 18, 1, '88888888'),
(32, 18, 4, 'R_CORRALES@UNAH.EDU.HN'),
(33, 18, 3, 'TEGUCIGALPA'),
(34, 19, 1, '88888888'),
(35, 19, 4, 'PATRICIA.ELLNER@UNAH.EDU.HN'),
(36, 19, 3, 'TEGUCIGALPA'),
(37, 20, 1, '89136654'),
(45, 22, 1, ' 8989-8988'),
(46, 22, 3, 'TEGUCIGALPA'),
(47, 23, 1, '88888888'),
(48, 23, 4, 'DULCE.DELCID@UNAH.EDU.HN'),
(49, 23, 3, 'TEGUCIGALPA'),
(50, 24, 1, '88888888'),
(51, 24, 4, 'GIANCARLOS.SCALICI@UNAH.EDU.HN'),
(52, 24, 3, 'TEGUCIGALPA'),
(53, 25, 1, '88888888'),
(54, 25, 4, 'CRISTIAN.RIVERA@UNAH.EDU.HN'),
(55, 25, 3, 'TEGUCIGALPA'),
(57, 26, 2, ' 1222-2222'),
(58, 26, 1, ' 9999-9999'),
(59, 26, 3, 'TEGUCIGALPA'),
(61, 27, 2, ' 2222-2222'),
(62, 27, 1, ' 9898-9998'),
(63, 27, 3, 'COL. CERRO GRANDE'),
(125, 61, 2, ' 2223-2322'),
(126, 61, 1, ' 9888-8888'),
(127, 61, 3, 'TEGUCIGALPA'),
(169, 66, 1, '88888888'),
(172, 67, 1, '88888888'),
(175, 68, 1, '88888u888'),
(178, 69, 1, '66666666'),
(181, 70, 1, '88888888'),
(184, 71, 1, '8888888'),
(187, 72, 1, '33333333'),
(192, 73, 1, ' 9999-9999'),
(195, 74, 1, ' 0801-1967'),
(257, 81, 1, '9098-9898'),
(258, 81, 4, 'carmen@unah.edu.hn'),
(260, 82, 4, 'claudia@unah.edu.hn'),
(264, 84, 4, 'dilma@unah.edu.hn'),
(266, 85, 4, 'dinora@unah.edu.hn'),
(267, 86, 1, '9898-9899'),
(268, 86, 4, 'dulis@unah.edu.hn'),
(269, 87, 4, 'hector@unah.edu.hn'),
(271, 88, 1, '9090-9999'),
(272, 88, 4, 'irma@unah.edu.hn'),
(273, 89, 1, '8989-8989'),
(274, 89, 4, 'isaac@unah.edu.hn'),
(275, 90, 1, '9090-9090'),
(276, 90, 4, 'jorge@unah.edu.hn'),
(277, 91, 1, '9090-0909'),
(278, 91, 4, 'karla@unah.edu.hn'),
(281, 93, 1, '9123-4566'),
(282, 93, 4, 'marco@unah.edu.hn'),
(283, 94, 4, 'maria@unah.edu.hn'),
(285, 95, 1, '9654-3212'),
(286, 95, 4, 'marvin@unah.edu.hn'),
(287, 96, 1, '9123-4567'),
(288, 96, 4, 'josue@unah.edu.hn'),
(289, 97, 4, 'noe@unah.edu.hn'),
(290, 97, 1, '9234-5678'),
(291, 98, 1, '9324-5678'),
(292, 98, 4, 'milvia@unah.edu.hn'),
(293, 99, 1, '8345-6789'),
(294, 99, 4, 'obed@unah.edu.hn'),
(295, 100, 1, '9324-5678'),
(296, 100, 4, 'sandra@unah.edu.hn'),
(297, 101, 1, '9099-8766'),
(298, 101, 4, 'yolani@unah.edu.hn'),
(299, 102, 1, '9232-4567'),
(300, 102, 4, 'eduardo@unah.edu.hn'),
(301, 103, 1, '9235-4657'),
(302, 103, 4, 'melisa@unah.edu.hn'),
(303, 104, 1, '9123-4546'),
(304, 104, 4, 'carlos@unah.edu.hn'),
(305, 105, 4, 'cesar@unah.edu.hn'),
(307, 106, 1, '9876-5431'),
(308, 106, 4, 'dilma@unah.edu.hn'),
(311, 108, 1, '9456-7687'),
(312, 108, 4, 'hector@unah.edu.hn'),
(313, 109, 4, 'jose@unah.edu.hn'),
(314, 109, 1, '9546-7890'),
(315, 110, 1, '9456-7890'),
(316, 110, 4, 'jose@unah.edu.hn'),
(317, 111, 1, '9567-6890'),
(318, 111, 4, 'jose@unah.edu.hn'),
(319, 112, 1, '9565-6787'),
(320, 112, 4, 'leonardo@unah.edu.hn'),
(321, 113, 1, '9657-8909'),
(322, 113, 4, 'lester@unah.edu.hn'),
(323, 114, 1, '9897-8789'),
(324, 114, 4, 'rebeca@unah.edu.hn'),
(325, 115, 1, '9435-4678'),
(326, 115, 4, 'christiansauceda170996@gmail.com'),
(327, 116, 1, '9787-8787'),
(328, 116, 4, 'cssauceda@unah.hn'),
(329, 117, 1, '9899-8997'),
(330, 117, 4, 'jose@unah.edu.hn'),
(331, 118, 1, '3123-4567'),
(332, 118, 4, 'hector@unah.edu.hn'),
(355, 130, 2, ' 9608-0186'),
(356, 130, 1, ' 3333-3333'),
(374, 153, 1, '3456-7899'),
(425, 149, 1, '9888-8888'),
(427, 83, 1, '9898-9898'),
(433, 152, 1, '96333560'),
(435, 152, 3, 'loma linda sur'),
(440, 156, 1, '22340131'),
(441, 159, 4, 'christiansauceda96@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contador_constancia`
--

CREATE TABLE `tbl_contador_constancia` (
  `id_contador` int(11) NOT NULL,
  `contador` int(11) NOT NULL,
  `estado_realizada` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_contador_constancia`
--

INSERT INTO `tbl_contador_constancia` (`id_contador`, `contador`, `estado_realizada`, `descripcion`) VALUES
(1, 85, 0, 'MATUTINA'),
(2, 95, 0, 'VESPERTINA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `id_departamento` bigint(20) NOT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`id_departamento`, `departamento`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'ATLÁNTIDA', NULL, NULL, NULL, NULL),
(2, 'COLÓN', NULL, NULL, NULL, NULL),
(3, 'COMAYAGUA', NULL, NULL, NULL, NULL),
(4, 'COPÁN', NULL, NULL, NULL, NULL),
(5, 'CORTÉS', NULL, NULL, NULL, NULL),
(6, 'CHOLUTECA', NULL, NULL, NULL, NULL),
(7, 'El PARAÍSO', NULL, NULL, NULL, NULL),
(8, 'FRANCISCO MORAZÁN', NULL, NULL, NULL, NULL),
(9, 'GRACIAS A DIOS', NULL, NULL, NULL, NULL),
(10, 'INTIBUCÁ', NULL, NULL, NULL, NULL),
(11, 'ISLAS DE LA BAHÍA', NULL, NULL, NULL, NULL),
(12, 'LA PAZ', NULL, NULL, NULL, NULL),
(13, 'LEMPIRA', NULL, NULL, NULL, NULL),
(14, 'OCOTEPEQUE', NULL, NULL, NULL, NULL),
(15, 'OLANCHO', NULL, NULL, NULL, NULL),
(16, 'SANTA BÁRBARA', NULL, NULL, NULL, NULL),
(17, 'VALLE', NULL, NULL, NULL, NULL),
(18, 'YORO', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_desea_asig_doce`
--

CREATE TABLE `tbl_desea_asig_doce` (
  `id_desea_asig_doce` bigint(20) NOT NULL,
  `id_persona` bigint(20) DEFAULT NULL,
  `Id_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_desempeno_practica`
--

CREATE TABLE `tbl_desempeno_practica` (
  `id_desempeno_practica` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `asistencia_practicante` varchar(255) NOT NULL,
  `horario_practicante` varchar(255) NOT NULL,
  `adaptacion_practicante` varchar(255) NOT NULL,
  `cumplimiento_practicante` varchar(255) NOT NULL,
  `calidad_trabajo_practicante` varchar(255) NOT NULL,
  `percepcion_conocimiento` varchar(255) NOT NULL,
  `percepcion_habilidades` varchar(255) NOT NULL,
  `numero_visita` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dias`
--

CREATE TABLE `tbl_dias` (
  `id_dia` bigint(20) NOT NULL DEFAULT '0',
  `dia` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dias`
--

INSERT INTO `tbl_dias` (`id_dia`, `dia`, `descripcion`) VALUES
(1, 'LuMaMiJu', 'lunes a jueves'),
(2, 'LuMaMiJuVi', 'lunes a viernes'),
(3, 'LuMi', ''),
(4, 'Ma', ''),
(5, 'Miercoles', ''),
(6, 'Jueves', ''),
(7, 'Viernes', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dias_feriados`
--

CREATE TABLE `tbl_dias_feriados` (
  `id_dia_feriado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dias_feriados`
--

INSERT INTO `tbl_dias_feriados` (`id_dia_feriado`, `fecha`, `descripcion`, `estado`) VALUES
(1, '2021-03-25', 'dia de prueba', 1),
(2, '2021-04-02', 'Dia de prueba dos', 1),
(3, '2021-04-15', 'Feriado 3.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_docentes_proyecto`
--

CREATE TABLE `tbl_docentes_proyecto` (
  `id_docente_proyecto` bigint(20) NOT NULL,
  `Id_proyecto` bigint(20) NOT NULL,
  `nombre_coordinador` varchar(255) NOT NULL,
  `numero_empleado` bigint(20) NOT NULL,
  `direccion_coordinador` varchar(50) NOT NULL,
  `cargo_coordinador` varchar(50) NOT NULL,
  `correo_coordinador` varchar(40) NOT NULL,
  `telefono_coordinador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_edificios`
--

CREATE TABLE `tbl_edificios` (
  `id_edificio` bigint(20) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_edificios`
--

INSERT INTO `tbl_edificios` (`id_edificio`, `nombre`, `codigo`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'C2', ' C2 ', NULL, NULL, NULL, NULL),
(2, 'C1', 'C1', NULL, NULL, '2021-03-31 02:57:07', 'ADMIN'),
(6, 'C3', 'C3', NULL, NULL, '2021-05-03 06:57:47', 'ADMIN'),
(7, 'K2', 'K2', NULL, NULL, '2021-05-03 06:56:53', 'ADMIN'),
(8, 'B6', '4561', '2021-06-08 04:45:21', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_egresados`
--

CREATE TABLE `tbl_egresados` (
  `Id_egresado` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cuenta` bigint(20) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `celular_egresado` varchar(12) DEFAULT NULL,
  `telefono_egresado` varchar(12) DEFAULT NULL,
  `fecha_graduacion` varchar(30) NOT NULL,
  `posee_maestria` char(2) DEFAULT NULL,
  `maestria` varchar(255) DEFAULT NULL,
  `posee_certificado` char(2) DEFAULT NULL,
  `certificado` varchar(255) DEFAULT NULL,
  `labora` char(2) DEFAULT NULL,
  `nombre_empresa` varchar(255) DEFAULT NULL,
  `direccion_empresa` varchar(255) DEFAULT NULL,
  `telefono_empresa` varchar(12) DEFAULT NULL,
  `departamento_egresado` varchar(255) DEFAULT NULL,
  `correo_profesional` varchar(255) DEFAULT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_egresados`
--

INSERT INTO `tbl_egresados` (`Id_egresado`, `nombre`, `cuenta`, `correo_electronico`, `celular_egresado`, `telefono_egresado`, `fecha_graduacion`, `posee_maestria`, `maestria`, `posee_certificado`, `certificado`, `labora`, `nombre_empresa`, `direccion_empresa`, `telefono_empresa`, `departamento_egresado`, `correo_profesional`, `Fecha_creacion`) VALUES
(2, 'LUISA', 732332532455, 'PRUEBA@PRUEBA.COM', ' 8888-3222', ' 2222-3333', '0000-00-00', 'NO', 'S', 'NO', 'PRUEBA', 'SI', 'PRUEBA', 'N/A', ' 2222-2222', 'N/A', '', '2020-05-30 19:50:36'),
(3, 'LUISSA', 7786372, 'PRUEBA@PRUEBA.COM', ' 2277-7687', ' 2222-2222', '0000-00-00', 'NO', '', 'NO', '', 'NO', 'N/A', 'N/A', 'N/A', 'N/A', '', '2020-05-30 19:53:38'),
(4, 'PRUEBAS', 657647, 'PRUEBA@PRUEBA.COM', ' 8888-8888', ' 2222-2222', '2020', 'SI', 'PRUEBAS', 'NO', 'N/A', 'NO', 'N/A', 'N/A', '', 'N/A', '', '2020-05-30 19:57:33'),
(6, 'CHRISTEL NEUMANN', 20141011506, 'PRUEBA@PRUEBA.COM', ' 9999-9999', ' 2234-0131', '2020', 'SI', 'BI', 'SI', 'CNNA', 'NO', 'N/A', 'N/A', '', 'N/A', '', '2020-05-31 17:21:08'),
(7, 'HYHY', 5665645, 'PRUEBASSS@PPAA.COM', ' 5665-6565', ' 5656-5656', '2019', 'SI', 'K', 'SI', 'CNNA', 'SI', 'CXX', 'GFHFH', ' 7969-6767', 'DSD', 'BVCN@INH.COM', '2020-06-01 00:12:37'),
(8, 'MARIA CALLEJAS', 20141011539, 'MARIA@YAHOO.COM', ' 8951-6364', ' 2569-8114', '2020', 'SI', 'SEGURIDAD', 'SI', 'CNNA', 'SI', 'TIGO', 'LA SOSA', ' 2236-8956', 'SISTEMAS', 'TIGO@YAHOO.COM', '2020-06-25 14:37:08'),
(9, 'RAMBO', 20201002000, 'KJH@YAHOO.COM', ' 8898-6632', ' 2235-9874', '2020', 'SI', 'SEGURIDAD', 'SI', 'CNNA', 'SI', 'CASA', 'LA SOSA', ' 2236-9845', 'CUARTO', 'HH@YAHOO.COM', '2020-09-28 10:43:30'),
(10, 'DDDDDDDDDDDDDDDDDDD', 544555555555, 'TRHYR@JHJK.COM', ' 5444-4444', ' 2222-2222', '2020', 'SI', 'SEGURIDAD', 'SI', 'CISCO', 'NO', 'N/A', 'N/A', '', 'N/A', '', '2020-10-09 20:05:50'),
(11, 'LUIS PONCE', 20141011508, 'HJFJH@YAHOO.COM', ' 8888-8888', ' 2222-2222', '2020', 'SI', 'CIBERSEGURIDAD', 'SI', 'CNNA', 'SI', 'CONCISA', 'COLONIA LAS BRISAS BLOQUE G', ' 2222-2222', 'BASE DE DATOS', 'HJFJH@YAHOO.COM', '2021-03-05 01:54:10'),
(12, 'ROSA', 20111002345, 'R_CORRALES@UNAH.EDU.HN', ' 9768-0826', ' 9768-0826', '2021', 'SI', 'DDD', 'SI', 'DSDS', 'SI', 'ROSMERY ', 'DSDSD', ' 9768-0826', 'DSD', 'R_CORRALES@HOTMAIL.COM', '2021-04-06 01:05:56'),
(14, 'LULU LOLO', 200000000000, 'HJHGJH@YAHOO.COM', ' 8888-8888', ' 2333-3333', '2020', 'NO', 'N/A', 'SI', 'ISO ', 'NO', 'N/A', 'N/A', 'N/A', 'N/A', '', '2021-04-14 02:27:42'),
(15, 'ASD', 12312312312, 'QWE@7ASDASDA', ' 9872-4654', ' 2131-2312', '2021', 'NO', 'N/A', 'NO', 'N/A', 'NO', 'N/A', 'N/A', '', 'N/A', '', '2021-04-26 05:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_empresas_practica`
--

CREATE TABLE `tbl_empresas_practica` (
  `Id_empresa` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `direccion_empresa` varchar(255) NOT NULL,
  `tipo_empresa` varchar(255) DEFAULT NULL,
  `labora_dentro` varchar(255) DEFAULT NULL,
  `departamento_empresa` varchar(255) NOT NULL,
  `jefe_inmediato` varchar(255) NOT NULL,
  `titulo_jefe_inmediato` varchar(255) NOT NULL,
  `cargo_jefe_inmediato` varchar(255) NOT NULL,
  `correo_jefe_inmediato` varchar(255) NOT NULL,
  `telefono_jefe_inmediato` varchar(10) NOT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_empresa_aporte_proyecto`
--

CREATE TABLE `tbl_empresa_aporte_proyecto` (
  `Id_aporte` bigint(20) NOT NULL,
  `aporte` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_empresa_aporte_proyecto`
--

INSERT INTO `tbl_empresa_aporte_proyecto` (`Id_aporte`, `aporte`, `Fecha_creacion`) VALUES
(1, 'ACADEMICO', '2020-05-31 00:00:00'),
(2, 'FINANCIERO', '2020-05-31 00:00:00'),
(3, 'ADMINSTRATIVO', '2020-05-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equivalencias`
--

CREATE TABLE `tbl_equivalencias` (
  `Id_equivalencia` bigint(20) NOT NULL,
  `id_persona` bigint(20) DEFAULT NULL,
  `observacion` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL,
  `aprobado` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_equivalencias`
--

INSERT INTO `tbl_equivalencias` (`Id_equivalencia`, `id_persona`, `observacion`, `Fecha_creacion`, `aprobado`, `documento`, `tipo`, `correo`) VALUES
(17, 6, '', '2020-10-12 16:25:01', 'desaprobado', '[\"../archivos/equivalencias/contenido/20141011506/Abrir acceso por red a Xampp.pdf\",\"../archivos/equivalencias/contenido/20141011506/bd_Automatizacion.pdf\"]', 'CONTENIDO', 'nicolle@unah.hn'),
(18, 6, '', '2020-10-12 16:25:31', 'desaprobado', '[\"../archivos/equivalencias/codigo/20141011506/doc(1).pdf\",\"../archivos/equivalencias/codigo/20141011506/doc(2).pdf\"]', 'CODIGO', 'nicole@unah.hn'),
(19, 4, '', '2020-10-12 17:38:53', 'desaprobado', '[\"../archivos/equivalencias/contenido/20131015093/Abrir acceso por red a Xampp.pdf\",\"../archivos/equivalencias/contenido/20131015093/bd_Automatizacion.pdf\"]', 'CONTENIDO', 'hcalix92@gmail.com'),
(20, 153, '', '2021-05-20 22:21:10', 'desaprobado', '[\"../archivos/equivalencias/codigo/20131015093/doc.pdf\",\"../archivos/equivalencias/codigo/20131015093/doc(2).pdf\"]', 'CODIGO', 'sa@unah.hn'),
(21, 153, '', '2021-05-20 22:21:57', 'desaprobado', '[\"../archivos/equivalencias/contenido/20131015093/doc.pdf\",\"../archivos/equivalencias/contenido/20131015093/doc(1).pdf\"]', 'CONTENIDO', 'sa@unah.hn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_especialidad_grado`
--

CREATE TABLE `tbl_especialidad_grado` (
  `id_especialidad` int(11) NOT NULL,
  `id_grado_academico` int(11) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_especialidad_grado`
--

INSERT INTO `tbl_especialidad_grado` (`id_especialidad`, `id_grado_academico`, `especialidad`) VALUES
(1, 4, 'redes'),
(2, 4, 'inf'),
(3, 4, 'informatica'),
(4, 1, 'DOCTORADO -PROBANDO'),
(5, 1, 'DOCTORADO -PRUEBA'),
(6, 2, 'DOCTORADO - PRABANDA'),
(7, 2, 'DOCTORADO -PROBANDO'),
(8, 3, 'DOCTORADO -PROBANDO'),
(9, 3, 'tocar flauta'),
(10, 2, 'informatica'),
(11, 2, 'infx'),
(12, 3, 'informma'),
(13, 4, 'redes'),
(14, 2, 'inf'),
(15, 2, 'inf'),
(16, 2, 'redes'),
(17, 2, 'h'),
(19, 1, 's'),
(20, 4, 'DOCTORADO -PROBANDO'),
(21, 1, 'f'),
(22, 1, 'hh'),
(23, 1, 'tec'),
(24, 3, 'rtrt'),
(25, 2, 'er'),
(26, 4, 'DOCTORADO -PRUEBA'),
(27, 1, 'rtyui'),
(28, 4, 'DOCTORADO -PRUEBA'),
(29, 2, 'PREGRADO -PRBANDOX'),
(30, 2, 'xd'),
(31, 3, 'df'),
(32, 1, 'er'),
(33, 2, 'dgg'),
(34, 1, 'rtgrgrg'),
(35, 3, 'gh'),
(36, 1, 'rtrt'),
(37, 1, 'r'),
(38, 1, 'rt'),
(39, 1, 'gf'),
(40, 3, 'actuacion'),
(41, 4, 'directora de cine'),
(42, 1, 'TÉCNICO -PRU'),
(43, 1, 'actuacion'),
(44, 1, 'cine'),
(45, 1, 'TÉCNICO -CAMINAR'),
(46, 2, 'PREGRADO -CORRER'),
(47, 3, 'POSGRADO -VOLAR'),
(48, 4, 'futbol'),
(49, 4, 'pelota'),
(50, 1, 'hoteleria'),
(51, 3, 'futbol'),
(52, 3, 'POSGRADO -A'),
(53, 3, 'POSGRADO -INFORMATICA'),
(54, 3, 'informatica'),
(55, 3, 'informatica'),
(56, 3, 'informatica'),
(57, 3, 'informatica'),
(58, 3, 'informatica'),
(59, 3, 'informatica'),
(60, 3, 'informatica'),
(61, 3, 'informatica'),
(62, 3, 'informatica'),
(63, 3, 'informatica'),
(64, 3, 'informatica'),
(65, 3, 'informatica'),
(66, 3, 'informatica'),
(67, 3, 'informatica'),
(68, 3, 'informatica'),
(69, 3, 'informatica'),
(70, 3, 'informatica'),
(71, 3, 'informatica'),
(72, 3, 'informatica'),
(73, 3, 'informatica'),
(74, 3, 'informatica'),
(75, 3, 'informatica'),
(76, 3, 'informatica'),
(77, 3, 'informatica'),
(78, 3, 'informatica'),
(79, 3, 'informatica'),
(80, 3, 'informatica'),
(81, 3, 'informatica'),
(82, 3, 'informatica'),
(83, 3, 'informatica'),
(84, 3, 'informatica'),
(85, 3, 'informatica'),
(86, 3, 'informatica'),
(87, 3, 'informatica'),
(88, 3, 'informatica'),
(89, 3, 'informatica'),
(90, 3, 'informatica'),
(91, 1, 'TÉCNICO -CORRER'),
(92, 2, 'PREGRADO -COMER'),
(93, 1, 'TÉCNICO -PERREAR'),
(94, 2, 'PREGRADO -AAAAAA'),
(95, 2, 'PREGRADO -HHH'),
(96, 2, 'PREGRADO -KKK'),
(97, 2, 'CORRER'),
(98, 1, 'HH'),
(99, 2, 'KIK'),
(100, 1, 'TT'),
(101, 2, 'JJ'),
(102, 4, 'nada'),
(103, 2, 'HJFFF'),
(104, 4, 'neles'),
(105, 3, 'INFORMÁTICA'),
(106, 1, 'INFORMATICA'),
(107, 1, 'SDF'),
(108, 1, 'DDD'),
(109, 1, 'DDD'),
(110, 2, 'KL'),
(111, 3, 'DSSSS'),
(112, 3, 'SSS'),
(113, 3, 'AAAAA'),
(114, 3, 'EEEEEE'),
(115, 2, 'TTTTTTT'),
(116, 2, 'GGGGGG'),
(117, 2, 'LLLLLLL'),
(118, 4, 'BBBBBBBB'),
(119, 3, 'MMMMM'),
(120, 3, 'GGGGGG'),
(121, 3, 'DDDDDD'),
(122, 2, 'ADFFDFSFSDFDF'),
(123, 3, 'DDDDD'),
(124, 4, 'ADF'),
(125, 2, 'INFORMATICA'),
(126, 3, 'APLICADO'),
(127, 4, 'A LA EDUCACION'),
(128, 4, 'inf'),
(129, 3, 'ed'),
(130, 3, 'rgrt'),
(131, 2, 'cine actuacion'),
(132, 2, 'FF'),
(133, 2, 'INFORMATICA'),
(134, 3, 'DISEÑO GRAFICO'),
(135, 2, 'INFORMTICA'),
(136, 2, 'INFORMATICA'),
(137, 2, 'INFORMATICA'),
(138, 4, 'CIENCIA DE LA INFORMACIÓN'),
(139, 2, 'INFORMATICA'),
(140, 1, 'd'),
(141, 2, 'INFORMATICA'),
(142, 2, 'INFORMATICA'),
(143, 3, 'INFORMATICA'),
(144, 3, 'B'),
(145, 1, 'G'),
(146, 4, 'H'),
(147, 4, 'GGG'),
(148, 1, 'GGGGGGGGGJH'),
(149, 3, 'INFORMATICA'),
(150, 2, 'CFF'),
(151, 2, 'DD'),
(152, 2, 'hjdhjkas'),
(153, 2, 'fhghkj'),
(154, 3, 'fg'),
(155, 2, 'fghhjkkl'),
(156, 1, 'ghgh'),
(157, 3, 'gfs'),
(158, 2, 'gfds'),
(159, 2, 'dfdsfdfds'),
(160, 2, 'GDH'),
(161, 2, 'FAJDSSDS'),
(162, 1, 'DFJL'),
(163, 3, 'ADGHJ'),
(164, 2, 'INFOMATICA ADMINISTRATIVA'),
(165, 3, 'RECURSOS HUMANOS'),
(166, 2, 'sdss'),
(167, 4, 'ff'),
(168, 2, 'hh'),
(169, 2, 'er'),
(170, 1, 're'),
(171, 3, 'fghj'),
(172, 2, 'informatica'),
(173, 1, 'informatica'),
(174, 4, 'redes informaticas'),
(175, 3, 'DISEÑO WEB'),
(176, 5, 'INFORMATICA'),
(177, 1, 'PROFESIONAL EN INFORMATICA'),
(178, 4, 'INFORMATICA'),
(179, 2, 'PRUEBA'),
(180, 1, 'INFORMATICA'),
(181, 3, 'pruea'),
(182, 2, 'probando'),
(183, 4, 'informatica'),
(184, 2, 'prueba'),
(185, 3, 'INFORMATICA'),
(186, 2, 'INFORMATICA'),
(187, 3, 'futbolista');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estadocivil`
--

CREATE TABLE `tbl_estadocivil` (
  `id_estado_civil` int(11) NOT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_estadocivil`
--

INSERT INTO `tbl_estadocivil` (`id_estado_civil`, `estado_civil`, `descripcion`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'SOLTERO', 'SOLTERO', NULL, NULL, '2021-04-15 07:16:45', 'ADMIN'),
(4, 'UNION LIBRE', 'UNION LIBRE', '2020-12-05 02:14:33', 'ADMIN', '2021-04-15 07:17:30', 'ADMIN'),
(10, 'CASADO', 'CASADO', '2020-12-05 03:00:20', 'ADMIN', '2021-04-15 07:18:11', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado_acta`
--

CREATE TABLE `tbl_estado_acta` (
  `id_estado` int(2) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_estado_acta`
--

INSERT INTO `tbl_estado_acta` (`id_estado`, `estado`) VALUES
(2, 'BORRADOR'),
(1, 'CANCELADA'),
(3, 'FINALIZADA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado_acuerdo`
--

CREATE TABLE `tbl_estado_acuerdo` (
  `id_estado` int(11) NOT NULL,
  `estado_acuerdo` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_estado_acuerdo`
--

INSERT INTO `tbl_estado_acuerdo` (`id_estado`, `estado_acuerdo`) VALUES
(3, 'CANCELADO'),
(2, 'FINALIZADO'),
(1, 'PENDIENTE');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado_notificacion`
--

CREATE TABLE `tbl_estado_notificacion` (
  `id_estado_notificacion` int(11) NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_estado_notificacion`
--

INSERT INTO `tbl_estado_notificacion` (`id_estado_notificacion`, `estado`) VALUES
(2, 'ENVIADA'),
(1, 'SIN ENVIAR');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado_participante`
--

CREATE TABLE `tbl_estado_participante` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_estado_participante`
--

INSERT INTO `tbl_estado_participante` (`id_estado`, `estado`) VALUES
(1, 'ASISTIO'),
(3, 'EXCUSA'),
(2, 'INASISTENCIA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estado_reunion`
--

CREATE TABLE `tbl_estado_reunion` (
  `id_estado_reunion` int(1) NOT NULL,
  `estado_reunion` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_estado_reunion`
--

INSERT INTO `tbl_estado_reunion` (`id_estado_reunion`, `estado_reunion`) VALUES
(2, 'CANCELADO'),
(3, 'EN CURSO'),
(4, 'FINALIZADA'),
(1, 'SIN INICIAR');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estudiantes_proyecto`
--

CREATE TABLE `tbl_estudiantes_proyecto` (
  `Id_estudiante_proyecto` bigint(20) NOT NULL,
  `nombre_estudiante` varchar(255) DEFAULT NULL,
  `cargo_estudiante` varchar(255) DEFAULT NULL,
  `telefono_estudiante` int(11) DEFAULT NULL,
  `correo_estudiante` varchar(255) DEFAULT NULL,
  `numero_empleado` bigint(20) DEFAULT NULL,
  `direccion_estudiante` varchar(255) DEFAULT NULL,
  `Id_proyecto` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_estudiantes_proyecto`
--

INSERT INTO `tbl_estudiantes_proyecto` (`Id_estudiante_proyecto`, `nombre_estudiante`, `cargo_estudiante`, `telefono_estudiante`, `correo_estudiante`, `numero_empleado`, `direccion_estudiante`, `Id_proyecto`) VALUES
(57, 'SDSD', 'DASD', 12312, 'DSDS', 31232, 'DSDDSD', 46),
(58, 'DCSD', 'DCCSD', 3123232, 'SFDF', 3232, 'FSDFSDF', 47);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_evaluaciones_practica`
--

CREATE TABLE `tbl_evaluaciones_practica` (
  `id_evaluacion_practica` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `comunicacion` varchar(255) NOT NULL,
  `puntualidad` varchar(255) NOT NULL,
  `responsabilidad` varchar(255) NOT NULL,
  `creatividad` varchar(255) NOT NULL,
  `presentacion` varchar(255) NOT NULL,
  `atencion_cliente` varchar(255) NOT NULL,
  `colaborativo` varchar(255) NOT NULL,
  `trabajo_equipo` varchar(255) NOT NULL,
  `proactivo_iniciativa` varchar(255) NOT NULL,
  `relacion_interpersonal` varchar(255) NOT NULL,
  `analisis_sistema` varchar(255) NOT NULL,
  `diseno_aplicacion` varchar(255) NOT NULL,
  `programador_aplicacion` varchar(255) NOT NULL,
  `mantenimiento_aplicacion` varchar(255) NOT NULL,
  `aspecto_auditoria` varchar(255) NOT NULL,
  `aspecto_seguridad` varchar(255) NOT NULL,
  `numero_visita` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_evaluaciones_practica`
--

INSERT INTO `tbl_evaluaciones_practica` (`id_evaluacion_practica`, `id_persona`, `comunicacion`, `puntualidad`, `responsabilidad`, `creatividad`, `presentacion`, `atencion_cliente`, `colaborativo`, `trabajo_equipo`, `proactivo_iniciativa`, `relacion_interpersonal`, `analisis_sistema`, `diseno_aplicacion`, `programador_aplicacion`, `mantenimiento_aplicacion`, `aspecto_auditoria`, `aspecto_seguridad`, `numero_visita`) VALUES
(1, 26, 'Muy bueno', 'Muy bueno', 'Muy Bueno', 'Muy Bueno', 'Muy Bueno', 'Muy Bueno', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', 'Primera Supervisión');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expe_academica_docente`
--

CREATE TABLE `tbl_expe_academica_docente` (
  `id_expe_academi_docente` bigint(20) NOT NULL,
  `id_area` bigint(20) DEFAULT NULL,
  `id_persona` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facultades`
--

CREATE TABLE `tbl_facultades` (
  `Id_facultad` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_facultades`
--

INSERT INTO `tbl_facultades` (`Id_facultad`, `nombre`, `Fecha_creacion`) VALUES
(1, 'Ciencias Economicas', '2020-05-31 00:00:00'),
(2, 'Medicina', '2021-03-18 18:50:48'),
(3, 'Facultad de Humanidades y arte', '2021-04-05 19:18:47'),
(4, 'Informatica Administrativa', '2021-05-27 16:30:39'),
(5, 'Letras', '2021-06-07 12:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feriado`
--

CREATE TABLE `tbl_feriado` (
  ` id_feriado` bigint(20) NOT NULL,
  `nombre_dia` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_feriado`
--

INSERT INTO `tbl_feriado` (` id_feriado`, `nombre_dia`, `fecha`) VALUES
(1, 'Lunes', '2021-04-19 00:00:00'),
(2, 'Martes', '2021-05-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finalizacion_practica`
--

CREATE TABLE `tbl_finalizacion_practica` (
  `Id_finalizacion` bigint(20) NOT NULL,
  `Id_practica` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `observacion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `aprobado` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `archivo` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tbl_finalizacion_practica`
--

INSERT INTO `tbl_finalizacion_practica` (`Id_finalizacion`, `Id_practica`, `id_persona`, `observacion`, `aprobado`, `fecha_creacion`, `archivo`, `correo`) VALUES
(89, 1, 6, '', 'desaprobado', '2020-10-12 17:45:04', ' ../archivos/finalizacion/20141011506/Abrir acceso por red a Xampp.pdf', 'nicole@unah.hn'),
(90, 3, 4, '', 'desaprobado', '2020-10-12 17:34:12', ' ../archivos/finalizacion/20131015093/doc(1).pdf', 'hcalix92@gmail.com'),
(91, 3, 4, '', 'desaprobado', '2020-10-22 17:32:24', ' ../archivos/finalizacion/20131015093/Abrir acceso por red a Xampp.pdf', 'helmer.calix@unah.hn'),
(92, 16, 153, '', 'desaprobado', '2021-05-20 21:26:56', ' ../archivos/finalizacion/20131015093/doc.pdf', 'sa@unah.hn');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_funciones_practica`
--

CREATE TABLE `tbl_funciones_practica` (
  `id_funcion_practica` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `funciones_analisis` varchar(255) NOT NULL,
  `numero_visita` varchar(255) NOT NULL,
  `funciones_diseno` varchar(255) NOT NULL,
  `funciones_redes` varchar(255) NOT NULL,
  `funciones_capacitacion` varchar(255) NOT NULL,
  `funciones_seguridad` varchar(255) NOT NULL,
  `funciones_auditoria` varchar(255) NOT NULL,
  `funciones_base` varchar(255) NOT NULL,
  `funciones_soporte` varchar(255) NOT NULL,
  `funciones_programacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_funciones_practica`
--

INSERT INTO `tbl_funciones_practica` (`id_funcion_practica`, `id_persona`, `funciones_analisis`, `numero_visita`, `funciones_diseno`, `funciones_redes`, `funciones_capacitacion`, `funciones_seguridad`, `funciones_auditoria`, `funciones_base`, `funciones_soporte`, `funciones_programacion`) VALUES
(1, 26, 'Análisis de Sistemas', 'Primera Supervisión', '', 'Redes y Comunicación de Datos', '', '', '', 'Base de Datos', 'Soporte de Aplicaciones', 'Programación de Aplicaciones');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`id_genero`, `genero`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'MASCULINO', NULL, NULL, NULL, NULL),
(2, 'FEMENINO', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grados_academicos`
--

CREATE TABLE `tbl_grados_academicos` (
  `id_grado_academico` int(11) NOT NULL,
  `grado_academico` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_grados_academicos`
--

INSERT INTO `tbl_grados_academicos` (`id_grado_academico`, `grado_academico`, `descripcion`, `Fecha_Creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'TÉCNICO', 'PRUEBA', NULL, NULL, '2021-04-29 01:29:38', 'ADMIN'),
(2, 'PREGRADO', NULL, NULL, NULL, NULL, NULL),
(3, 'POSGRADO', 'POSGRADO', NULL, NULL, '2021-04-27 04:32:40', 'ADMIN'),
(4, 'DOCTORADO', 'DOCTORADO', NULL, NULL, '2021-04-27 04:31:52', 'ADMIN'),
(5, 'POSGRADOO', 'POSGRADOO', '2021-04-27 10:03:22', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grados_academicos_personas`
--

CREATE TABLE `tbl_grados_academicos_personas` (
  `id_grado_aca_personas` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `id_persona` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_grados_academicos_personas`
--

INSERT INTO `tbl_grados_academicos_personas` (`id_grado_aca_personas`, `id_especialidad`, `id_persona`) VALUES
(50, 54, 81),
(51, 55, 82),
(53, 57, 84),
(54, 58, 85),
(55, 59, 86),
(56, 60, 88),
(57, 61, 89),
(58, 62, 90),
(59, 63, 91),
(60, 64, 92),
(61, 65, 93),
(62, 66, 94),
(63, 67, 95),
(64, 68, 96),
(65, 69, 97),
(66, 70, 98),
(67, 71, 99),
(68, 72, 100),
(69, 73, 101),
(70, 74, 102),
(71, 75, 103),
(72, 76, 104),
(73, 77, 105),
(74, 78, 106),
(75, 79, 107),
(76, 80, 108),
(77, 81, 109),
(78, 82, 110),
(79, 83, 111),
(80, 84, 112),
(81, 85, 113),
(82, 86, 114),
(83, 87, 115),
(84, 88, 116),
(85, 89, 117),
(86, 90, 118),
(162, 179, 83);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hora`
--

CREATE TABLE `tbl_hora` (
  `hora` varchar(4) NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_hora`
--

INSERT INTO `tbl_hora` (`hora`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
('0600', NULL, NULL, '2021-05-08 06:25:56', 'ADMIN'),
('0700', NULL, NULL, NULL, NULL),
('0800', NULL, NULL, NULL, NULL),
('0900', NULL, NULL, NULL, NULL),
('1000', NULL, NULL, NULL, NULL),
('1100', NULL, NULL, NULL, NULL),
('1200', NULL, NULL, '2021-03-08 18:55:09', '(NULL)'),
('1300', NULL, NULL, NULL, NULL),
('1400', NULL, NULL, NULL, NULL),
('1500', NULL, NULL, NULL, NULL),
('1600', NULL, NULL, NULL, NULL),
('1700', NULL, NULL, NULL, NULL),
('1800', NULL, NULL, NULL, NULL),
('1900', NULL, NULL, NULL, NULL),
('2000', NULL, NULL, NULL, NULL),
('2100', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_horario_docentes`
--

CREATE TABLE `tbl_horario_docentes` (
  `id_horario_docente` bigint(20) NOT NULL,
  `id_jornada` bigint(20) DEFAULT NULL,
  `id_categoria_persona` bigint(20) DEFAULT NULL,
  `hr_inicial` varchar(50) DEFAULT NULL,
  `hr_final` varchar(50) DEFAULT NULL,
  `id_persona` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_horario_docentes`
--

INSERT INTO `tbl_horario_docentes` (`id_horario_docente`, `id_jornada`, `id_categoria_persona`, `hr_inicial`, `hr_final`, `id_persona`) VALUES
(16, 3, 18, '0600', '2000', 39),
(44, 5, 46, '1200', '1800', 80),
(45, 4, 47, '0900', '1300', 81),
(46, 5, 48, '1200', '1800', 82),
(47, 5, 49, '1200', '1800', 83),
(48, 5, 50, '1200', '1800', 84),
(49, 5, 51, '1200', '1800', 85),
(50, 5, 52, '1200', '1800', 86),
(51, 5, 53, '1200', '1800', 87),
(52, 5, 54, '1200', '1800', 88),
(53, 5, 55, '1200', '1800', 89),
(54, 5, 56, '1200', '1800', 90),
(55, 5, 57, '1200', '1800', 91),
(56, 5, 58, '1200', '1800', 92),
(57, 5, 59, '1200', '1800', 93),
(58, 5, 60, '1200', '1800', 94),
(59, 5, 61, '1200', '1800', 95),
(60, 5, 62, '1200', '1800', 96),
(61, 5, 63, '1200', '1800', 97),
(62, 5, 64, '1200', '1800', 98),
(63, 5, 65, '1200', '1800', 99),
(64, 5, 66, '1200', '1800', 100),
(65, 5, 67, '1200', '1800', 101),
(66, 5, 68, '1200', '1800', 102),
(67, 4, 69, '1200', '1500', 103),
(68, 3, 70, '0800', '1000', 104),
(69, 3, 71, '0800', '1000', 105),
(70, 3, 72, '1100', '1300', 106),
(71, 3, 73, '1000', '1200', 107),
(72, 3, 74, '1200', '1800', 108),
(73, 3, 75, '1100', '1300', 109),
(74, 3, 76, '1300', '1400', 110),
(75, 3, 77, '0700', '1000', 111),
(76, 3, 78, '1200', '1400', 112),
(77, 3, 79, '1500', '1700', 113),
(78, 3, 80, '1300', '1500', 114),
(79, 3, 81, '1200', '1400', 115),
(80, 5, 82, '1200', '1800', 116),
(81, 5, 83, '1200', '1800', 117),
(82, 5, 84, '1200', '1800', 118),
(112, 3, 114, '1800', '2000', 149),
(113, 5, 57, '7:00', '18:00', 159),
(114, 4, 18, '7:00', '18:00', 24);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_horario_himno`
--

CREATE TABLE `tbl_horario_himno` (
  `id_horario_himno` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `jornada` varchar(10) NOT NULL,
  `cupos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_horario_himno`
--

INSERT INTO `tbl_horario_himno` (`id_horario_himno`, `fecha`, `hora`, `jornada`, `cupos`) VALUES
(12, '2020-11-17', '02:15:00', 'VESPERTINA', 19),
(13, '2020-12-01', '09:00:00', 'MATUTINA', 19);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jornadas`
--

CREATE TABLE `tbl_jornadas` (
  `id_jornada` bigint(20) NOT NULL,
  `jornada` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_jornadas`
--

INSERT INTO `tbl_jornadas` (`id_jornada`, `jornada`, `descripcion`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(3, 'POR HORA', 'POR HORA', NULL, NULL, NULL, NULL),
(4, 'MEDIO TIEMPO', 'MEDIO TIEMPO', NULL, NULL, NULL, NULL),
(5, 'TIEMPO COMPLETO', 'TIEMPO COMPLETO', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modalidad`
--

CREATE TABLE `tbl_modalidad` (
  `id_modalidad` bigint(20) NOT NULL,
  `modalidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_modalidad`
--

INSERT INTO `tbl_modalidad` (`id_modalidad`, `modalidad`) VALUES
(1, 'Presencial'),
(2, 'Semi-Presencial'),
(3, 'Virtual');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modalidades_proyecto`
--

CREATE TABLE `tbl_modalidades_proyecto` (
  `Id_modalidad` bigint(20) NOT NULL,
  `modalidad` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_modalidades_proyecto`
--

INSERT INTO `tbl_modalidades_proyecto` (`Id_modalidad`, `modalidad`, `Fecha_creacion`) VALUES
(1, 'UNIDISCIPLINARIA', '2020-05-31 00:00:00'),
(2, 'INTRADISCIPLINARIA', '2020-05-31 00:00:00'),
(3, 'INTERDISCIPLINARIA', '2020-05-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_municipios_hn`
--

CREATE TABLE `tbl_municipios_hn` (
  `id_municipio` bigint(20) NOT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `id_departamento` bigint(20) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_municipios_hn`
--

INSERT INTO `tbl_municipios_hn` (`id_municipio`, `municipio`, `codigo`, `id_departamento`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'La ceiba', '0101', 1, NULL, NULL, NULL, NULL),
(2, 'El Porvenir', '0102', 1, NULL, NULL, NULL, NULL),
(3, 'Esparta', '0103', 1, NULL, NULL, '2021-03-18 07:28:39', 'rre'),
(5, 'La Masica', '0105', 1, NULL, NULL, NULL, NULL),
(6, 'San Francisco', '0106', 1, NULL, NULL, NULL, NULL),
(7, 'Tela', '0107', 1, NULL, NULL, NULL, NULL),
(8, 'Arizona', '0108', 1, NULL, NULL, NULL, NULL),
(9, 'Trujillo ', '0201', 2, NULL, NULL, NULL, NULL),
(10, 'Balfate', '0202', 2, NULL, NULL, NULL, NULL),
(11, 'Iriona', '0203', 2, NULL, NULL, NULL, NULL),
(12, 'Limón', '0204', 2, NULL, NULL, NULL, NULL),
(13, 'Sabá', '0205', 2, NULL, NULL, NULL, NULL),
(14, 'Santa Fe', '0206', 2, NULL, NULL, NULL, NULL),
(15, 'Santa Rosa de Aguán', '0207', 2, NULL, NULL, NULL, NULL),
(16, 'Sonaguera', '0208', 2, NULL, NULL, NULL, NULL),
(17, 'Tocoa', '0209', 2, NULL, NULL, NULL, NULL),
(18, 'Bonito Oriental', '0210', 2, NULL, NULL, NULL, NULL),
(23, 'Humuya ', '0305', 3, NULL, NULL, NULL, NULL),
(24, 'La Libertad', '0306', 3, NULL, NULL, NULL, NULL),
(25, 'Lamaní', '0307', 3, NULL, NULL, NULL, NULL),
(26, 'La Trinidad', '0308', 3, NULL, NULL, NULL, NULL),
(27, 'Lejamaní', '0309', 3, NULL, NULL, NULL, NULL),
(28, 'Meámbar', '0310', 3, NULL, NULL, NULL, NULL),
(29, 'Minas de Oro', '0311', 3, NULL, NULL, NULL, NULL),
(30, 'Ojos de Agua', '0312', 3, NULL, NULL, NULL, NULL),
(31, 'Ojos de Agua 0312', '0313', 3, NULL, NULL, NULL, NULL),
(32, 'San José de Comayagua', '0314', 3, NULL, NULL, NULL, NULL),
(33, 'San José del Potrero', '0315', 3, NULL, NULL, NULL, NULL),
(34, 'San Luis', '0316', 3, NULL, NULL, NULL, NULL),
(35, 'San Sebastián', '0317', 3, NULL, NULL, NULL, NULL),
(36, 'Siguatepeque', '0318', 3, NULL, NULL, NULL, NULL),
(37, 'Villa de San Antonio', '0319', 3, NULL, NULL, NULL, NULL),
(38, 'Las Lajas', '0320', 3, NULL, NULL, NULL, NULL),
(39, 'Taulabé', '0321', 3, NULL, NULL, NULL, NULL),
(40, 'Santa Rosa de Copán', '0401', 4, NULL, NULL, NULL, NULL),
(41, 'Cabañas', '0402', 4, NULL, NULL, NULL, NULL),
(42, 'Concepción', '0403', 4, NULL, NULL, NULL, NULL),
(43, 'Copán Ruinas', '0404', 4, NULL, NULL, NULL, NULL),
(44, 'corquin', '0405', 4, NULL, NULL, '2021-03-18 07:32:01', 'gr'),
(45, 'Cucuyagua', '0406', 4, NULL, NULL, NULL, NULL),
(46, 'Dolores', '0407', 4, NULL, NULL, NULL, NULL),
(47, 'Dulce Nombre', '0408', 4, NULL, NULL, NULL, NULL),
(48, 'El Paraíso', '0409', 4, NULL, NULL, NULL, NULL),
(49, 'Florida', '0410', 4, NULL, NULL, NULL, NULL),
(50, 'La Jigua', '0411', 4, NULL, NULL, NULL, NULL),
(51, 'La Unión', '0412', 4, NULL, NULL, NULL, NULL),
(52, 'Nueva Arcadia', '0413', 4, NULL, NULL, NULL, NULL),
(53, 'San Agustín', '0414', 4, NULL, NULL, NULL, NULL),
(54, 'San Antonio ', '0415', 4, NULL, NULL, NULL, NULL),
(55, 'San Jerónimo', '0416', 4, NULL, NULL, NULL, NULL),
(56, 'San José', '0417', 4, NULL, NULL, NULL, NULL),
(57, 'San Juan de Opoa', '0418', 4, NULL, NULL, NULL, NULL),
(58, 'San Nicolás', '0419', 4, NULL, NULL, NULL, NULL),
(59, 'San Pedro', '0420', 4, NULL, NULL, NULL, NULL),
(60, 'Santa Rita ', '0421', 4, NULL, NULL, NULL, NULL),
(61, 'Trinidad de Copán', '0422', 4, NULL, NULL, NULL, NULL),
(62, 'Veracruz', '0423', 4, NULL, NULL, NULL, NULL),
(63, 'San Pedro Sula', '0501', 5, NULL, NULL, NULL, NULL),
(64, 'Choloma', '0502', 5, NULL, NULL, NULL, NULL),
(65, 'Omoa', '0503', 5, NULL, NULL, NULL, NULL),
(66, 'Pimienta', '0504', 5, NULL, NULL, NULL, NULL),
(67, 'Potrerillos', '0505', 5, NULL, NULL, NULL, NULL),
(68, 'Puerto Cortés', '0506', 5, NULL, NULL, NULL, NULL),
(69, 'San Antonio de Cortés', '0507', 5, NULL, NULL, NULL, NULL),
(70, 'San Francisco de Yojoa', '0508', 5, NULL, NULL, NULL, NULL),
(71, 'San Manuel', '0509', 5, NULL, NULL, NULL, NULL),
(72, 'Santa Cruz de Yojoa', '0510', 5, NULL, NULL, NULL, NULL),
(73, 'Villanueva', '0511', 5, NULL, NULL, NULL, NULL),
(74, 'La Lima', '0512', 5, NULL, NULL, NULL, NULL),
(75, 'Choluteca', '0601', 6, NULL, NULL, NULL, NULL),
(76, 'Apacilagua', '0602', 6, NULL, NULL, NULL, NULL),
(77, 'Concepción de María', '0603', 6, NULL, NULL, NULL, NULL),
(78, 'Duyure', '0604', 6, NULL, NULL, NULL, NULL),
(79, 'El Corpus', '0605', 6, NULL, NULL, NULL, NULL),
(80, 'El Triunfo', '0606', 6, NULL, NULL, NULL, NULL),
(81, 'Marcovia', '0607', 6, NULL, NULL, NULL, NULL),
(82, 'Morolica', '0608', 6, NULL, NULL, NULL, NULL),
(83, 'Namasigüe', '0609', 6, NULL, NULL, NULL, NULL),
(84, 'Orocuina', '0610', 6, NULL, NULL, NULL, NULL),
(85, 'Pespire', '0611', 6, NULL, NULL, NULL, NULL),
(86, 'San Antonio de Flores', '0612', 6, NULL, NULL, NULL, NULL),
(87, 'San Isidro', '0613', 6, NULL, NULL, NULL, NULL),
(88, 'San José', '0614', 6, NULL, NULL, NULL, NULL),
(89, 'San Marcos de Colón', '0615', 6, NULL, NULL, NULL, NULL),
(90, 'Santa Ana de Yusguare', '0616', 6, NULL, NULL, NULL, NULL),
(91, 'Yuscarán', '0701', 7, NULL, NULL, NULL, NULL),
(92, 'Alauca', '0702', 7, NULL, NULL, NULL, NULL),
(93, 'Danlí', '0703', 7, NULL, NULL, NULL, NULL),
(94, 'El Paraíso', '0704', 7, NULL, NULL, NULL, NULL),
(95, 'Güinope', '0705', 7, NULL, NULL, NULL, NULL),
(96, 'Jacaleapa', '0706', 7, NULL, NULL, NULL, NULL),
(97, 'Liure', '0707', 7, NULL, NULL, NULL, NULL),
(98, 'Morocelí', '0708', 7, NULL, NULL, NULL, NULL),
(99, 'Oropolí', '0709', 7, NULL, NULL, NULL, NULL),
(100, 'Potrerillos', '0710', 7, NULL, NULL, NULL, NULL),
(101, 'San Antonio de Flores', '0711', 7, NULL, NULL, NULL, NULL),
(102, 'San Lucas', '0712', 7, NULL, NULL, NULL, NULL),
(103, 'San Matías', '0713', 7, NULL, NULL, NULL, NULL),
(104, 'Soledad', '0714', 7, NULL, NULL, NULL, NULL),
(105, 'Teupasenti ', '0715', 7, NULL, NULL, NULL, NULL),
(106, 'Texiguat', '0716', 7, NULL, NULL, NULL, NULL),
(107, 'Vado Ancho', '0717', 7, NULL, NULL, NULL, NULL),
(108, 'Yauyupe ', '0718', 7, NULL, NULL, NULL, NULL),
(109, 'Trojes', '0719', 7, NULL, NULL, NULL, NULL),
(110, 'Distrito Central', '0801', 8, NULL, NULL, NULL, NULL),
(111, 'Alubarén', '0802', 8, NULL, NULL, NULL, NULL),
(112, 'Cedros', '0803', 8, NULL, NULL, NULL, NULL),
(113, 'Curarén', '0804', 8, NULL, NULL, NULL, NULL),
(114, 'El Porvenir', '0805', 8, NULL, NULL, NULL, NULL),
(115, 'Guaimaca', '0806', 8, NULL, NULL, NULL, NULL),
(116, 'La Libertad', '0807', 8, NULL, NULL, NULL, NULL),
(117, 'La Venta ', '0808', 8, NULL, NULL, NULL, NULL),
(118, 'Lepaterique ', '0809', 8, NULL, NULL, NULL, NULL),
(119, 'Maraita', '0810', 8, NULL, NULL, NULL, NULL),
(120, 'Marale', '0811', 8, NULL, NULL, NULL, NULL),
(121, 'Nueva Armenia', '0812', 8, NULL, NULL, NULL, NULL),
(122, 'Ojojona ', '0813', 8, NULL, NULL, NULL, NULL),
(123, 'Orica', '0814', 8, NULL, NULL, NULL, NULL),
(124, 'Reitoca', '0815', 8, NULL, NULL, NULL, NULL),
(125, 'Sabanagrande', '0816', 8, NULL, NULL, NULL, NULL),
(126, 'San Antonio de Oriente', '0817', 8, NULL, NULL, NULL, NULL),
(127, 'San Buenaventura', '0818', 8, NULL, NULL, NULL, NULL),
(128, 'San Ignacio ', '0819', 8, NULL, NULL, NULL, NULL),
(129, 'San Juan de Flores o Cantarranas', '0820', 8, NULL, NULL, NULL, NULL),
(130, 'San Miguelito', '0821', 8, NULL, NULL, NULL, NULL),
(131, 'Santa Ana', '0822', 8, NULL, NULL, NULL, NULL),
(132, 'Santa Lucía', '0823', 8, NULL, NULL, NULL, NULL),
(133, 'Talanga', '0824', 8, NULL, NULL, NULL, NULL),
(134, 'Tatumbla ', '0825', 8, NULL, NULL, NULL, NULL),
(135, 'Valle de Ángeles', '0826', 8, NULL, NULL, NULL, NULL),
(136, 'Villa de San Francisco', '0827', 8, NULL, NULL, NULL, NULL),
(137, 'Vallecillo', '0828', 8, NULL, NULL, NULL, NULL),
(138, 'Puerto Lempira', '0901', 9, NULL, NULL, NULL, NULL),
(139, 'Brus Laguna', '0902', 9, NULL, NULL, NULL, NULL),
(140, 'Ahuas', '0903', 9, NULL, NULL, NULL, NULL),
(141, 'Juan Francisco Bulnes', '0904', 9, NULL, NULL, NULL, NULL),
(142, 'Ramón Villeda Morales', '0905', 9, NULL, NULL, NULL, NULL),
(143, 'Wampusirpe ', '0906', 9, NULL, NULL, NULL, NULL),
(144, 'La Esperanza', '1001', 10, NULL, NULL, NULL, NULL),
(145, 'Camasca', '1002', 10, NULL, NULL, NULL, NULL),
(146, 'Colomoncagua', '1003', 10, NULL, NULL, NULL, NULL),
(147, 'Concepción', '1004', 10, NULL, NULL, NULL, NULL),
(148, 'Dolores', '1005', 10, NULL, NULL, NULL, NULL),
(149, 'Intibucá', '1006', 10, NULL, NULL, NULL, NULL),
(150, 'Jesús de Otoro', '1007', 10, NULL, NULL, NULL, NULL),
(151, 'Magdalena', '1008', 10, NULL, NULL, NULL, NULL),
(152, 'Masaguara', '1009', 10, NULL, NULL, NULL, NULL),
(153, 'San Antonio', '1010', 10, NULL, NULL, NULL, NULL),
(154, 'San Isidro', '1011', 10, NULL, NULL, NULL, NULL),
(155, 'San Juan', '1012', 10, NULL, NULL, NULL, NULL),
(156, 'San Marcos de la Sierra', '1013', 10, NULL, NULL, NULL, NULL),
(157, 'San Miguel Guancapla', '1014', 10, NULL, NULL, NULL, NULL),
(158, 'Santa Lucía', '1015', 10, NULL, NULL, NULL, NULL),
(159, 'Yamaranguila', '1016', 10, NULL, NULL, NULL, NULL),
(160, 'San Francisco de Opalaca', '1017', 10, NULL, NULL, NULL, NULL),
(161, 'Roatán', '1101', 11, NULL, NULL, NULL, NULL),
(162, 'Guanaja', '1102', 11, NULL, NULL, NULL, NULL),
(163, 'José Santos Guardiola', '1103', 11, NULL, NULL, NULL, NULL),
(164, 'Utila', '1104', 11, NULL, NULL, NULL, NULL),
(165, 'La Paz', '1201', 12, NULL, NULL, NULL, NULL),
(166, 'AGUANQUETERIQUE', '1202', 12, NULL, NULL, '2021-03-18 07:57:18', 'ADMIN'),
(167, 'Cabañas', '1203', 12, NULL, NULL, NULL, NULL),
(168, 'Cane', '1204', 12, NULL, NULL, NULL, NULL),
(169, 'Chinacla', '1205', 12, NULL, NULL, NULL, NULL),
(170, 'Guajiquiro', '1206', 12, NULL, NULL, NULL, NULL),
(171, 'Lauterique', '1207', 12, NULL, NULL, NULL, NULL),
(172, 'Marcala', '1208', 12, NULL, NULL, NULL, NULL),
(173, 'Mercedes de Oriente', '1209', 12, NULL, NULL, NULL, NULL),
(174, 'Opatoro', '1210', 12, NULL, NULL, NULL, NULL),
(175, 'San Antonio del Norte', '1211', 12, NULL, NULL, NULL, NULL),
(176, 'San José', '1212', 12, NULL, NULL, NULL, NULL),
(177, 'San Juan', '1213', 12, NULL, NULL, NULL, NULL),
(178, 'San Pedro de Tutule', '1214', 12, NULL, NULL, NULL, NULL),
(179, 'Santa Ana', '1215', 12, NULL, NULL, NULL, NULL),
(180, 'Santa Elena', '1216', 12, NULL, NULL, NULL, NULL),
(181, 'Santa María ', '1217', 12, NULL, NULL, NULL, NULL),
(182, 'Santiago de Puringla', '1218', 12, NULL, NULL, NULL, NULL),
(183, 'Yarula', '1219', 12, NULL, NULL, NULL, NULL),
(184, 'Gracias ', '1301', 13, NULL, NULL, NULL, NULL),
(185, 'Belén', '1302', 13, NULL, NULL, NULL, NULL),
(186, 'Candelaria', '1303', 13, NULL, NULL, NULL, NULL),
(187, 'Cololaca', '1304', 13, NULL, NULL, NULL, NULL),
(188, 'Erandique', '1305', 13, NULL, NULL, NULL, NULL),
(189, 'Gualcince ', '1306', 13, NULL, NULL, NULL, NULL),
(190, 'Guarita', '1307', 13, NULL, NULL, NULL, NULL),
(191, 'La Campa ', '1308', 13, NULL, NULL, NULL, NULL),
(192, 'La Iguala', '1309', 13, NULL, NULL, NULL, NULL),
(193, 'Las Flores', '1310', 13, NULL, NULL, NULL, NULL),
(194, 'La Unión ', '1311', 13, NULL, NULL, NULL, NULL),
(195, 'La Virtud', '1312', 13, NULL, NULL, NULL, NULL),
(196, 'Lepaera', '1313', 13, NULL, NULL, NULL, NULL),
(197, 'Mapulaca', '1314', 13, NULL, NULL, NULL, NULL),
(198, 'Piraera', '1315', 13, NULL, NULL, NULL, NULL),
(199, 'San Andrés', '1316', 13, NULL, NULL, NULL, NULL),
(200, 'San Francisco', '1317', 13, NULL, NULL, NULL, NULL),
(201, 'San Juan Guarita', '1318', 13, NULL, NULL, NULL, NULL),
(202, 'San Manuel Colohete', '1319', 13, NULL, NULL, NULL, NULL),
(203, 'San Rafael', '1320', 13, NULL, NULL, NULL, NULL),
(204, 'San Sebastián ', '1321', 13, NULL, NULL, NULL, NULL),
(205, 'Santa Cruz', '1322', 13, NULL, NULL, NULL, NULL),
(206, 'Talgua', '1323', 13, NULL, NULL, NULL, NULL),
(207, 'Tambla', '1324', 13, NULL, NULL, NULL, NULL),
(208, 'Tomalá', '1325', 13, NULL, NULL, NULL, NULL),
(209, 'Valladolid ', '1326', 13, NULL, NULL, NULL, NULL),
(210, 'Virginia ', '1327', 13, NULL, NULL, NULL, NULL),
(211, 'San Marcos de Caiquín', '1328', 13, NULL, NULL, NULL, NULL),
(212, 'Nueva Ocotepeque', '1401', 14, NULL, NULL, NULL, NULL),
(213, 'Belén Gualcho', '1402', 14, NULL, NULL, NULL, NULL),
(214, 'Concepción', '1403', 14, NULL, NULL, NULL, NULL),
(215, 'Dolores Merendón', '1404', 14, NULL, NULL, NULL, NULL),
(216, 'Fraternidad', '1405', 14, NULL, NULL, NULL, NULL),
(217, 'La Encarnación', '1406', 14, NULL, NULL, NULL, NULL),
(218, 'La Labor', '1407', 14, NULL, NULL, NULL, NULL),
(219, 'Lucerna', '1408', 14, NULL, NULL, NULL, NULL),
(220, 'Mercedes ', '1409', 14, NULL, NULL, NULL, NULL),
(221, 'San Fernando', '1410', 14, NULL, NULL, NULL, NULL),
(222, 'San Francisco del Valle', '1411', 14, NULL, NULL, NULL, NULL),
(223, 'San Jorge', '1412', 14, NULL, NULL, NULL, NULL),
(224, 'San Marcos', '1413', 14, NULL, NULL, NULL, NULL),
(225, 'Santa Fe', '1414', 14, NULL, NULL, NULL, NULL),
(226, 'Sensenti', '1415', 14, NULL, NULL, NULL, NULL),
(227, 'Sinuapa', '1416', 14, NULL, NULL, NULL, NULL),
(228, 'Juticalpa ', '1501', 15, NULL, NULL, NULL, NULL),
(229, 'Campamento', '1502', 15, NULL, NULL, NULL, NULL),
(230, 'Catacamas', '1503', 15, NULL, NULL, NULL, NULL),
(231, 'Concordia', '1504', 15, NULL, NULL, NULL, NULL),
(232, 'Dulce Nombre de Culmí', '1505', 15, NULL, NULL, NULL, NULL),
(233, 'El Rosario', '1506', 15, NULL, NULL, NULL, NULL),
(234, 'Esquipulas del Norte', '1507', 15, NULL, NULL, NULL, NULL),
(235, 'Gualaco', '1508', 15, NULL, NULL, NULL, NULL),
(236, 'Guarizama', '1509', 15, NULL, NULL, NULL, NULL),
(237, 'Guata', '1510', 15, NULL, NULL, NULL, NULL),
(238, 'Guayape', '1511', 15, NULL, NULL, NULL, NULL),
(239, 'Jano', '1512', 15, NULL, NULL, NULL, NULL),
(240, 'La Unión ', '1513', 15, NULL, NULL, NULL, NULL),
(241, 'Mangulile ', '1514', 15, NULL, NULL, NULL, NULL),
(242, 'Manto', '1515', 15, NULL, NULL, NULL, NULL),
(243, 'Salamá ', '1516', 15, NULL, NULL, NULL, NULL),
(244, 'San Esteban', '1517', 15, NULL, NULL, NULL, NULL),
(245, 'San Francisco de Becerra', '1518', 15, NULL, NULL, NULL, NULL),
(246, 'San Francisco de la Paz', '1519', 15, NULL, NULL, NULL, NULL),
(247, 'Santa María del Real', '1520', 15, NULL, NULL, NULL, NULL),
(248, 'Silca', '1521', 15, NULL, NULL, NULL, NULL),
(249, 'Yocón', '1522', 15, NULL, NULL, NULL, NULL),
(250, 'Patuca', '1523', 15, NULL, NULL, NULL, NULL),
(251, 'Santa Bárbara ', '1601', 16, NULL, NULL, NULL, NULL),
(252, 'Arada', '1602', 16, NULL, NULL, NULL, NULL),
(253, 'Atima', '1603', 16, NULL, NULL, NULL, NULL),
(254, 'Azacualpa', '1604', 16, NULL, NULL, NULL, NULL),
(255, 'Ceguaca', '1605', 16, NULL, NULL, NULL, NULL),
(256, 'San José de las Colinas', '1606', 16, NULL, NULL, NULL, NULL),
(257, 'Concepción del Norte', '1607', 16, NULL, NULL, NULL, NULL),
(258, 'Concepción del Sur', '1608', 16, NULL, NULL, NULL, NULL),
(259, 'Chinda', '1609', 16, NULL, NULL, NULL, NULL),
(260, 'El Níspero', '1610', 16, NULL, NULL, NULL, NULL),
(261, 'Gualala ', '1611', 16, NULL, NULL, NULL, NULL),
(262, 'Ilama', '1612', 16, NULL, NULL, NULL, NULL),
(263, 'Macuelizo ', '1613', 16, NULL, NULL, NULL, NULL),
(264, 'Naranjito', '1614', 16, NULL, NULL, NULL, NULL),
(265, 'Nuevo Celilac', '1615', 16, NULL, NULL, NULL, NULL),
(266, 'Petoa', '1616', 16, NULL, NULL, NULL, NULL),
(267, 'Protección', '1617', 16, NULL, NULL, NULL, NULL),
(268, 'Quimistán', '1618', 16, NULL, NULL, NULL, NULL),
(269, 'San Francisco de Ojuera', '1619', 16, NULL, NULL, NULL, NULL),
(270, 'San Luis', '1620', 16, NULL, NULL, NULL, NULL),
(271, 'San Marcos', '1621', 16, NULL, NULL, NULL, NULL),
(272, 'San Nicolás', '1622', 16, NULL, NULL, NULL, NULL),
(273, 'San Pedro Zacapa', '1623', 16, NULL, NULL, NULL, NULL),
(274, 'Santa Rita ', '1624', 16, NULL, NULL, NULL, NULL),
(275, 'San Vicente Centenario', '1625', 16, NULL, NULL, NULL, NULL),
(276, 'Trinidad', '1626', 16, NULL, NULL, NULL, NULL),
(277, 'Las Vegas', '1627', 16, NULL, NULL, NULL, NULL),
(278, 'Nueva Frontera', '1628', 16, NULL, NULL, NULL, NULL),
(279, 'Alianza', '1702', 17, NULL, NULL, NULL, NULL),
(280, 'Amapala', '1703', 17, NULL, NULL, NULL, NULL),
(281, 'Aramecina', '1704', 17, NULL, NULL, NULL, NULL),
(282, 'Caridad ', '1705', 17, NULL, NULL, NULL, NULL),
(283, 'Goascorán', '1706', 17, NULL, NULL, NULL, NULL),
(284, 'Langue', '1707', 17, NULL, NULL, NULL, NULL),
(285, 'Nacaome', '1701', 17, NULL, NULL, NULL, NULL),
(286, 'San Francisco de Coray', '1708', 17, NULL, NULL, NULL, NULL),
(287, 'San Lorenzo', '1709', 17, NULL, NULL, NULL, NULL),
(288, 'Yoro', '1801', 18, NULL, NULL, NULL, NULL),
(289, 'Arenal', '1802', 18, NULL, NULL, NULL, NULL),
(290, 'El Negrito ', '1803', 18, NULL, NULL, NULL, NULL),
(291, 'EL PROGRESO', '1804', 18, NULL, NULL, '2021-03-18 07:16:19', 'ADMIN'),
(292, 'Jocón ', '1805', 18, NULL, NULL, NULL, NULL),
(293, 'Morazán', '1806', 18, NULL, NULL, NULL, NULL),
(294, 'Olanchito', '1807', 18, NULL, NULL, NULL, NULL),
(295, 'Santa Rita ', '1808', 18, NULL, NULL, NULL, NULL),
(296, 'Sulaco', '1809', 18, NULL, NULL, NULL, NULL),
(297, 'Victoria ', '1810', 18, NULL, NULL, NULL, NULL),
(298, 'Yorito', '1811', 18, NULL, NULL, NULL, NULL),
(307, 'EXA', '0012', 5, '2021-04-06 03:24:20', 'ADMIN', NULL, NULL),
(309, 'ZEDE ', '1811', 7, '2021-04-13 04:57:35', 'ADMIN', '2021-04-16 19:52:47', 'ADMIN'),
(310, 'Jutiapa', '4', 1, '2021-05-31 14:56:05', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nacionalidad`
--

CREATE TABLE `tbl_nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL,
  `PAIS_NAC` varchar(50) NOT NULL DEFAULT '0',
  `nacionalidad` varchar(50) DEFAULT NULL,
  `ISO_NAC` varchar(50) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_nacionalidad`
--

INSERT INTO `tbl_nacionalidad` (`id_nacionalidad`, `PAIS_NAC`, `nacionalidad`, `ISO_NAC`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'Afganistán', 'AFGANA', 'AFG', NULL, NULL, NULL, NULL),
(2, 'Albania', 'ALBANESA', 'ALB', NULL, NULL, NULL, NULL),
(3, 'Alemania', 'ALEMANA', 'DEU', NULL, NULL, NULL, NULL),
(4, 'Andorra', 'ANDORRANA', 'AND', NULL, NULL, NULL, NULL),
(5, 'Angola', 'ANGOLEÑA', 'AGO', NULL, NULL, NULL, NULL),
(6, 'AntiguayBarbuda', 'ANTIGUANA', 'ATG', NULL, NULL, NULL, NULL),
(7, 'ArabiaSaudita', 'SAUDÍ', 'SAU', NULL, NULL, NULL, NULL),
(8, 'Argelia', 'ARGELINA', 'DZA', NULL, NULL, NULL, NULL),
(9, 'Argentina', 'ARGENTINA', 'ARG', NULL, NULL, NULL, NULL),
(10, 'Armenia', 'ARMENIA', 'ARM', NULL, NULL, NULL, NULL),
(11, 'Aruba', 'ARUBEÑA', 'ABW', NULL, NULL, NULL, NULL),
(12, 'Australia', 'AUSTRALIANA', 'AUS', NULL, NULL, NULL, NULL),
(13, 'Austria', 'AUSTRIACA', 'AUT', NULL, NULL, NULL, NULL),
(14, 'Azerbaiyán', 'AZERBAIYANA', 'AZE', NULL, NULL, NULL, NULL),
(15, 'Bahamas', 'BAHAMEÑA', 'BHS', NULL, NULL, NULL, NULL),
(16, 'Bangladés', 'BANGLADESÍ', 'BGD', NULL, NULL, NULL, NULL),
(17, 'Barbados', 'BARBADENSE', 'BRB', NULL, NULL, NULL, NULL),
(18, 'Baréin', 'BAREINÍ', 'BHR', NULL, NULL, NULL, NULL),
(19, 'Bélgica', 'BELGA', 'BEL', NULL, NULL, NULL, NULL),
(20, 'Belice', 'BELICEÑA', 'BLZ', NULL, NULL, NULL, NULL),
(21, 'Benín', 'BENINÉSA', 'BEN', NULL, NULL, NULL, NULL),
(22, 'Bielorrusia', 'BIELORRUSA', 'BLR', NULL, NULL, NULL, NULL),
(23, 'Birmania', 'BIRMANA', 'MMR', NULL, NULL, NULL, NULL),
(24, 'Bolivia', 'BOLIVIANA', 'BOL', NULL, NULL, NULL, NULL),
(25, 'BosniayHerzegovina', 'BOSNIA', 'BIH', NULL, NULL, NULL, NULL),
(26, 'Botsuana', 'BOTSUANA', 'BWA', NULL, NULL, NULL, NULL),
(27, 'Brasil', 'BRASILEÑA', 'BRA', NULL, NULL, NULL, NULL),
(28, 'Brunéi', 'BRUNEANA', 'BRN', NULL, NULL, NULL, NULL),
(29, 'Bulgaria', 'BÚLGARA', 'BGR', NULL, NULL, NULL, NULL),
(30, 'BurkinaFaso', 'BURKINÉS', 'BFA', NULL, NULL, NULL, NULL),
(31, 'Burundi', 'BURUNDÉSA', 'BDI', NULL, NULL, NULL, NULL),
(32, 'Bután', 'BUTANÉSA', 'BTN', NULL, NULL, NULL, NULL),
(33, 'CaboVerde', 'CABOVERDIANA', 'CPV', NULL, NULL, NULL, NULL),
(34, 'Camboya', 'CAMBOYANA', 'KHM', NULL, NULL, NULL, NULL),
(35, 'Camerún', 'CAMERUNESA', 'CMR', NULL, NULL, NULL, NULL),
(36, 'Canadá', 'CANADIENSE', 'CAN', NULL, NULL, NULL, NULL),
(37, 'Catar', 'CATARÍ', 'QAT', NULL, NULL, NULL, NULL),
(38, 'Chad', 'CHADIANA', 'TCD', NULL, NULL, NULL, NULL),
(39, 'Chile', 'CHILENA', 'CHL', NULL, NULL, NULL, NULL),
(40, 'China', 'CHINA', 'CHN', NULL, NULL, NULL, NULL),
(41, 'Chipre', 'CHIPRIOTA', 'CYP', NULL, NULL, NULL, NULL),
(42, 'CiudaddelVaticano', 'VATICANA', 'VAT', NULL, NULL, NULL, NULL),
(43, 'Colombia', 'COLOMBIANA', 'COL', NULL, NULL, NULL, NULL),
(44, 'Comoras', 'COMORENSE', 'COM', NULL, NULL, NULL, NULL),
(45, 'CoreadelNorte', 'NORCOREANA', 'PRK', NULL, NULL, NULL, NULL),
(46, 'CoreadelSur', 'SURCOREANA', 'KOR', NULL, NULL, NULL, NULL),
(47, 'CostadeMarfil', 'MARFILEÑA', 'CIV', NULL, NULL, NULL, NULL),
(48, 'CostaRica', 'COSTARRICENSE', 'CRI', NULL, NULL, NULL, NULL),
(49, 'Croacia', 'CROATA', 'HRV', NULL, NULL, NULL, NULL),
(50, 'Cuba', 'CUBANA', 'CUB', NULL, NULL, NULL, NULL),
(51, 'Dinamarca', 'DANÉSA', 'DNK', NULL, NULL, NULL, NULL),
(52, 'Dominica', 'DOMINIQUÉS', 'DMA', NULL, NULL, NULL, NULL),
(53, 'Ecuador', 'ECUATORIANA', 'ECU', NULL, NULL, NULL, NULL),
(54, 'Egipto', 'EGIPCIA', 'EGY', NULL, NULL, NULL, NULL),
(55, 'ElSalvador', 'SALVADOREÑA', 'SLV', NULL, NULL, NULL, NULL),
(56, 'EmiratosÁrabesUnidos', 'EMIRATÍ', 'ARE', NULL, NULL, NULL, NULL),
(57, 'Eritrea', 'ERITREA', 'ERI', NULL, NULL, NULL, NULL),
(58, 'Eslovaquia', 'ESLOVACA', 'SVK', NULL, NULL, NULL, NULL),
(59, 'Eslovenia', 'ESLOVENA', 'SVN', NULL, NULL, NULL, NULL),
(60, 'España', 'ESPAÑOLA', 'ESP', NULL, NULL, NULL, NULL),
(61, 'EstadosUnidos', 'ESTADOUNIDENSE', 'USA', NULL, NULL, NULL, NULL),
(62, 'Estonia', 'ESTONIA', 'EST', NULL, NULL, NULL, NULL),
(63, 'Etiopía', 'ETÍOPE', 'ETH', NULL, NULL, NULL, NULL),
(64, 'Filipinas', 'FILIPINA', 'PHL', NULL, NULL, NULL, NULL),
(65, 'Finlandia', 'FINLANDÉSA', 'FIN', NULL, NULL, NULL, NULL),
(66, 'Fiyi', 'FIYIANA', 'FJI', NULL, NULL, NULL, NULL),
(67, 'Francia', 'FRANCÉSA', 'FRA', NULL, NULL, NULL, NULL),
(68, 'Gabón', 'GABONÉSA', 'GAB', NULL, NULL, NULL, NULL),
(69, 'Gambia', 'GAMBIANA', 'GMB', NULL, NULL, NULL, NULL),
(70, 'Georgia', 'GEORGIANA', 'GEO', NULL, NULL, NULL, NULL),
(71, 'Gibraltar', 'GIBRALTAREÑA', 'GIB', NULL, NULL, NULL, NULL),
(72, 'Ghana', 'GHANÉSA', 'GHA', NULL, NULL, NULL, NULL),
(73, 'Granada', 'GRANADINA', 'GRD', NULL, NULL, NULL, NULL),
(74, 'Grecia', 'GRIEGA', 'GRC', NULL, NULL, NULL, NULL),
(75, 'Groenlandia', 'GROENLANDÉSA', 'GRL', NULL, NULL, NULL, NULL),
(76, 'Guatemala', 'GUATEMALTECA', 'GTM', NULL, NULL, NULL, NULL),
(77, 'Guineaecuatorial', 'ECUATOGUINEANA', 'GNQ', NULL, NULL, NULL, NULL),
(78, 'Guinea', 'GUINEANA', 'GIN', NULL, NULL, NULL, NULL),
(79, 'Guinea-Bisáu', 'GUINEANA', 'GNB', NULL, NULL, NULL, NULL),
(80, 'Guyana', 'GUYANESA', 'GUY', NULL, NULL, NULL, NULL),
(81, 'Haití', 'HAITIANA', 'HTI', NULL, NULL, NULL, NULL),
(82, 'Honduras', 'HONDUREÑA', 'HND', NULL, NULL, NULL, NULL),
(83, 'Hungría', 'HÚNGARA', 'HUN', NULL, NULL, NULL, NULL),
(84, 'India', 'HINDÚ', 'IND', NULL, NULL, NULL, NULL),
(85, 'Indonesia', 'INDONESIA', 'IDN', NULL, NULL, NULL, NULL),
(86, 'Irak', 'IRAQUÍ', 'IRQ', NULL, NULL, NULL, NULL),
(87, 'Irán', 'IRANÍ', 'IRN', NULL, NULL, NULL, NULL),
(88, 'Irlanda', 'IRLANDÉSA', 'IRL', NULL, NULL, NULL, NULL),
(89, 'Islandia', 'ISLANDÉSA', 'ISL', NULL, NULL, NULL, NULL),
(90, 'IslasCook', 'COOKIANA', 'COK', NULL, NULL, NULL, NULL),
(91, 'IslasMarshall', 'MARSHALÉSA', 'MHL', NULL, NULL, NULL, NULL),
(92, 'IslasSalomón', 'SALOMONENSE', 'SLB', NULL, NULL, NULL, NULL),
(93, 'Israel', 'ISRAELÍ', 'ISR', NULL, NULL, NULL, NULL),
(94, 'Italia', 'ITALIANA', 'ITA', NULL, NULL, NULL, NULL),
(95, 'Jamaica', 'JAMAIQUINA', 'JAM', NULL, NULL, NULL, NULL),
(96, 'Japón', 'JAPONÉSA', 'JPN', NULL, NULL, NULL, NULL),
(97, 'Jordania', 'JORDANA', 'JOR', NULL, NULL, NULL, NULL),
(98, 'Kazajistán', 'KAZAJA', 'KAZ', NULL, NULL, NULL, NULL),
(99, 'Kenia', 'KENIATA', 'KEN', NULL, NULL, NULL, NULL),
(100, 'Kirguistán', 'KIRGUISA', 'KGZ', NULL, NULL, NULL, NULL),
(101, 'Kiribati', 'KIRIBATIANA', 'KIR', NULL, NULL, NULL, NULL),
(102, 'Kuwait', 'KUWAITÍ', 'KWT', NULL, NULL, NULL, NULL),
(103, 'Laos', 'LAOSIANA', 'LAO', NULL, NULL, NULL, NULL),
(104, 'Lesoto', 'LESOTENSE', 'LSO', NULL, NULL, NULL, NULL),
(105, 'Letonia', 'LETÓNA', 'LVA', NULL, NULL, NULL, NULL),
(106, 'Líbano', 'LIBANÉSA', 'LBN', NULL, NULL, NULL, NULL),
(107, 'Liberia', 'LIBERIANA', 'LBR', NULL, NULL, NULL, NULL),
(108, 'Libia', 'LIBIA', 'LBY', NULL, NULL, NULL, NULL),
(109, 'Liechtenstein', 'LIECHTENSTEINIANA', 'LIE', NULL, NULL, NULL, NULL),
(110, 'Lituania', 'LITUANA', 'LTU', NULL, NULL, NULL, NULL),
(111, 'Luxemburgo', 'LUXEMBURGUÉSA', 'LUX', NULL, NULL, NULL, NULL),
(112, 'Madagascar', 'MALGACHE', 'MDG', NULL, NULL, NULL, NULL),
(113, 'Malasia', 'MALASIA', 'MYS', NULL, NULL, NULL, NULL),
(114, 'Malaui', 'MALAUÍ', 'MWI', NULL, NULL, NULL, NULL),
(115, 'Maldivas', 'MALDIVA', 'MDV', NULL, NULL, NULL, NULL),
(116, 'Malí', 'MALIENSE', 'MLI', NULL, NULL, NULL, NULL),
(117, 'Malta', 'MALTÉSA', 'MLT', NULL, NULL, NULL, NULL),
(118, 'Marruecos', 'MARROQUÍ', 'MAR', NULL, NULL, NULL, NULL),
(119, 'Martinica', 'MARTINIQUÉS', 'MTQ', NULL, NULL, NULL, NULL),
(120, 'Mauricio', 'MAURICIANA', 'MUS', NULL, NULL, NULL, NULL),
(121, 'Mauritania', 'MAURITANA', 'MRT', NULL, NULL, NULL, NULL),
(122, 'México', 'MEXICANA', 'MEX', NULL, NULL, NULL, NULL),
(123, 'Micronesia', 'MICRONESIA', 'FSM', NULL, NULL, NULL, NULL),
(124, 'Moldavia', 'MOLDAVA', 'MDA', NULL, NULL, NULL, NULL),
(125, 'Mónaco', 'MONEGASCA', 'MCO', NULL, NULL, NULL, NULL),
(126, 'Mongolia', 'MONGOLA', 'MNG', NULL, NULL, NULL, NULL),
(127, 'Montenegro', 'MONTENEGRINA', 'MNE', NULL, NULL, NULL, NULL),
(128, 'Mozambique', 'MOZAMBIQUEÑA', 'MOZ', NULL, NULL, NULL, NULL),
(129, 'Namibia', 'NAMIBIA', 'NAM', NULL, NULL, NULL, NULL),
(130, 'Nauru', 'NAURUANA', 'NRU', NULL, NULL, NULL, NULL),
(131, 'Nepal', 'NEPALÍ', 'NPL', NULL, NULL, NULL, NULL),
(132, 'Nicaragua', 'NICARAGÜENSE', 'NIC', NULL, NULL, NULL, NULL),
(133, 'Níger', 'NIGERINA', 'NER', NULL, NULL, NULL, NULL),
(134, 'Nigeria', 'NIGERIANA', 'NGA', NULL, NULL, NULL, NULL),
(135, 'Noruega', 'NORUEGA', 'NOR', NULL, NULL, NULL, NULL),
(136, 'NuevaZelanda', 'NEOZELANDÉSA', 'NZL', NULL, NULL, NULL, NULL),
(137, 'Omán', 'OMANÍ', 'OMN', NULL, NULL, NULL, NULL),
(138, 'PaísesBajos', 'NEERLANDÉSA', 'NLD', NULL, NULL, NULL, NULL),
(139, 'Pakistán', 'PAKISTANÍ', 'PAK', NULL, NULL, NULL, NULL),
(140, 'Palaos', 'PALAUANA', 'PLW', NULL, NULL, NULL, NULL),
(141, 'Palestina', 'PALESTINA', 'PSE', NULL, NULL, NULL, NULL),
(142, 'Panamá', 'PANAMEÑA', 'PAN', NULL, NULL, NULL, NULL),
(143, 'PapúaNuevaGuinea', 'PAPÚ', 'PNG', NULL, NULL, NULL, NULL),
(144, 'Paraguay', 'PARAGUAYA', 'PRY', NULL, NULL, NULL, NULL),
(145, 'Perú', 'PERUANA', 'PER', NULL, NULL, NULL, NULL),
(146, 'Polonia', 'POLACA', 'POL', NULL, NULL, NULL, NULL),
(147, 'Portugal', 'PORTUGUÉSA', 'PRT', NULL, NULL, NULL, NULL),
(148, 'PuertoRico', 'PUERTORRIQUEÑA', 'PRI', NULL, NULL, NULL, NULL),
(149, 'ReinoUnido', 'BRITÁNICA', 'GBR', NULL, NULL, NULL, NULL),
(150, 'RepúblicaCentroafricana', 'CENTROAFRICANA', 'CAF', NULL, NULL, NULL, NULL),
(151, 'RepúblicaCheca', 'CHECA', 'CZE', NULL, NULL, NULL, NULL),
(152, 'RepúblicadeMacedonia', 'MACEDONIA', 'MKD', NULL, NULL, NULL, NULL),
(153, 'RepúblicadelCongo', 'CONGOLEÑA', 'COG', NULL, NULL, NULL, NULL),
(154, 'RepúblicaDemocráticadelCongo', 'CONGOLEÑA', 'COD', NULL, NULL, NULL, NULL),
(155, 'RepúblicaDominicana', 'DOMINICANA', 'DOM', NULL, NULL, NULL, NULL),
(156, 'RepúblicaSudafricana', 'SUDAFRICANA', 'ZAF', NULL, NULL, NULL, NULL),
(157, 'Ruanda', 'RUANDÉSA', 'RWA', NULL, NULL, NULL, NULL),
(158, 'Rumanía', 'RUMANA', 'ROU', NULL, NULL, NULL, NULL),
(159, 'Rusia', 'RUSA', 'RUS', NULL, NULL, NULL, NULL),
(160, 'Samoa', 'SAMOANA', 'WSM', NULL, NULL, NULL, NULL),
(161, 'SanCristóbalyNieves', 'CRISTOBALEÑA', 'KNA', NULL, NULL, NULL, NULL),
(162, 'SanMarino', 'SANMARINENSE', 'SMR', NULL, NULL, NULL, NULL),
(163, 'SanVicenteylasGranadinas', 'SANVICENTINA', 'VCT', NULL, NULL, NULL, NULL),
(164, 'SantaLucía', 'SANTALUCENSE', 'LCA', NULL, NULL, NULL, NULL),
(165, 'SantoToméyPríncipe', 'SANTOTOMENSE', 'STP', NULL, NULL, NULL, NULL),
(166, 'Senegal', 'SENEGALÉSA', 'SEN', NULL, NULL, NULL, NULL),
(167, 'Serbia', 'SERBIA', 'SRB', NULL, NULL, NULL, NULL),
(168, 'Seychelles', 'SEYCHELLENSE', 'SYC', NULL, NULL, NULL, NULL),
(169, 'SierraLeona', 'SIERRALEONÉSA', 'SLE', NULL, NULL, NULL, NULL),
(170, 'Singapur', 'SINGAPURENSE', 'SGP', NULL, NULL, NULL, NULL),
(171, 'Siria', 'SIRIA', 'SYR', NULL, NULL, NULL, NULL),
(172, 'Somalia', 'SOMALÍ', 'SOM', NULL, NULL, NULL, NULL),
(173, 'SriLanka', 'CEILANÉSA', 'LKA', NULL, NULL, NULL, NULL),
(174, 'Suazilandia', 'SUAZI', 'SWZ', NULL, NULL, NULL, NULL),
(175, 'SudándelSur', 'SURSUDANÉSA', 'SSD', NULL, NULL, NULL, NULL),
(176, 'Sudán', 'SUDANÉSA', 'SDN', NULL, NULL, NULL, NULL),
(177, 'Suecia', 'SUECA', 'SWE', NULL, NULL, NULL, NULL),
(178, 'Suiza', 'SUIZA', 'CHE', NULL, NULL, NULL, NULL),
(179, 'Surinam', 'SURINAMESA', 'SUR', NULL, NULL, NULL, NULL),
(180, 'Tailandia', 'TAILANDÉSA', 'THA', NULL, NULL, NULL, NULL),
(181, 'Tanzania', 'TANZANA', 'TZA', NULL, NULL, NULL, NULL),
(182, 'Tayikistán', 'TAYIKA', 'TJK', NULL, NULL, NULL, NULL),
(183, 'TimorOriental', 'TIMORENSE', 'TLS', NULL, NULL, NULL, NULL),
(184, 'Togo', 'TOGOLÉSA', 'TGO', NULL, NULL, NULL, NULL),
(185, 'Tonga', 'TONGANA', 'TON', NULL, NULL, NULL, NULL),
(186, 'TrinidadyTobago', 'TRINITENSE', 'TTO', NULL, NULL, NULL, NULL),
(187, 'Túnez', 'TUNECINA', 'TUN', NULL, NULL, NULL, NULL),
(188, 'Turkmenistán', 'TURCOMANA', 'TKM', NULL, NULL, NULL, NULL),
(189, 'Turquía', 'TURCA', 'TUR', NULL, NULL, NULL, NULL),
(190, 'Tuvalu', 'TUVALUANA', 'TUV', NULL, NULL, NULL, NULL),
(191, 'Ucrania', 'UCRANIANA', 'UKR', NULL, NULL, NULL, NULL),
(192, 'Uganda', 'UGANDÉSA', 'UGA', NULL, NULL, NULL, NULL),
(193, 'Uruguay', 'URUGUAYA', 'URY', NULL, NULL, NULL, NULL),
(194, 'Uzbekistán', 'UZBEKA', 'UZB', NULL, NULL, NULL, NULL),
(195, 'Vanuatu', 'VANUATUENSE', 'VUT', NULL, NULL, NULL, NULL),
(196, 'Venezuela', 'VENEZOLANA', 'VEN', NULL, NULL, NULL, NULL),
(197, 'Vietnam', 'VIETNAMITA', 'VNM', NULL, NULL, NULL, NULL),
(198, 'Yemen', 'YEMENÍ', 'YEM', NULL, NULL, NULL, NULL),
(199, 'Yibuti', 'YIBUTIANA', 'DJI', NULL, NULL, NULL, NULL),
(200, 'Zambia', 'ZAMBIANA', 'ZMB', NULL, NULL, NULL, NULL),
(201, 'Zimbabue', 'ZIMBABUENSE', 'ZWE', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_objetos`
--

CREATE TABLE `tbl_objetos` (
  `Id_objeto` bigint(20) NOT NULL,
  `objeto` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_objetos`
--

INSERT INTO `tbl_objetos` (`Id_objeto`, `objeto`, `descripcion`) VALUES
(1, 'Creación de preguntas ', 'Creacion de preguntas de seguridad'),
(2, 'Gestión de preguntas ', 'Gestionar las preguntas de seguridad'),
(3, 'Registro de usuario', 'Registrar los usuarios del sistema'),
(4, 'Gestión de usuario', 'Gestionar los usuarios'),
(5, 'Creación  de roles', 'Crear de roles'),
(6, 'Gestión de roles', 'Gestionar los roles'),
(7, 'Gestión de parámetros ', 'Gestionar los parámetros '),
(8, 'Bitácora ', 'Bitacora del sistema'),
(9, 'Creación de permisos a usuarios', 'Dar permisos a los roles de los usuarios'),
(10, 'Gestión de permisos a usuarios', 'Gestionar permisos a usuarios'),
(11, 'Gestión de respuestas de preguntas de seguridad', 'Gestionar las respuestas de preguntas de seguridad'),
(12, 'Cambiar contraseña\r\n', 'Cambiar contraseña dentro del sistema'),
(13, 'Inscripción para charla PPS', 'Inscripción de los estudiantes para charla de pps'),
(14, 'Gestión de asistencia a charla PPS', 'Gestión de asistencia a charla de PPS'),
(15, 'Registro de clases aprobadas', 'Registro de clases aprobadas para constancia'),
(16, 'Gestión de clases aprobadas', 'Gestión de clases aprobadas'),
(17, 'Registro de datos de empresa', 'Registro de datos de empresa por PPS'),
(18, 'Historial de constancias y/o cartas', 'Historial de constancias y/o cartas'),
(19, 'Entrega de documentación ', 'Documentación de PPS'),
(20, 'Recepción/supervisión de documentos', 'Recepción/supervisión de documentos de PPS'),
(21, 'Aprobación/rechazo de PPS', 'Aprobación/rechazo de PPS'),
(22, 'Registro de egresados', 'Registro de egresados de IA'),
(23, 'Gestión de egresados', 'Gestion de egresados de IA'),
(24, 'Registro de proyectos', 'Registro de proyectos vinculación universidad sociedad'),
(25, 'Gestión de proyectos', 'Gestion de proyectos vinculación universidad sociedad'),
(26, 'Supervisar documentación de PPS', 'Comite de vinculación supervisa documentacion de PPS'),
(27, 'Historial de prácticas aprobadas', 'Historial de prácticas aprobadas'),
(28, 'Historial de prácticas rechazadas', 'Historial de prácticas rechazadas'),
(29, 'Solicitud de finalización de práctica', 'Solicitud de finalización de práctica alumno'),
(30, 'Cambio de carrera', 'Solicitud cambio de carrera alumno'),
(31, 'Carta de egresado', 'Solicitud carta de egresado'),
(32, 'Equivalencias', 'Solicitud de equivalencias'),
(33, 'Cancelación de clases', 'Solicitud de cancelacion de clases'),
(34, 'Revisión de finalización de PPS ', 'Coordinador revision finalizacion practica'),
(35, 'Revisión de cambio carrera', 'Coordinador revision cambio carrera'),
(36, 'Revisión de carta egresado', 'Coordinador revision carta egresado'),
(37, 'Revisión de equivalencias', 'Coordinador revision equivalencias'),
(38, 'Revisión de cancelacion de clases', 'Coordinador revision cancelacion de clases'),
(39, 'Solicitud de PPS', 'Solicitud de pp1 y pps2'),
(40, 'Menú de solicitud de PPS ', 'Menú de solicitud de pps'),
(41, 'Creación de asignaturas ', 'Crear asignaturas'),
(42, 'Gestión de asignaturas', 'Gestionar asignaturas'),
(43, 'Solicitud de examen del himno', 'Solicitud para la realizacion del examnen del himno'),
(44, 'Revisión de alumnos himno', 'Revisión de coordinación de los alumnos disponibles para realizar el examen del himno'),
(45, 'Menú de carga académica ', 'Creacion de carga académica '),
(46, 'Creación de carga académica ', 'Generar carga académica '),
(47, 'Gestión de carga académica ', 'Editar carga académica '),
(48, 'Historial de carga académica ', 'Control y revision de la carga académica '),
(49, 'Menú de docentes', 'Creacion de registro docentes'),
(50, 'Registro de  docentes', 'Crear nuevos docentes'),
(51, 'Gestión de docentes', 'Gestionar docentes'),
(52, 'Comisiones y actividades docentes', 'Agregar comisiones y actividades'),
(53, 'Reporte carga academica docentes', 'Mostrar reporte carga academica docentes'),
(54, 'Perfil docentes', 'Mostrar perfil docentes'),
(55, 'Mantenimiento periodo', 'Mantenimiento gestion periodo'),
(56, 'Mantenimiento jornadas docente', 'Mantenimiento gestion jornadas'),
(57, 'Mantenimiento comisiones docente', 'Mantenimiento gestion comisiones'),
(58, 'Mantenimiento edificio', 'Mantenimiento gestion edificios'),
(59, 'Mantenimiento categorías ', 'Mantenimiento gestion categorias'),
(60, 'Mantenimiento aulas', 'Mantenimiento gestion aulas'),
(61, 'Mantenimiento grados académicos ', 'Mantenimiento gestion grados academicos'),
(62, 'Mantenimiento estado civil', 'Mantenimiento gestion estados civil'),
(63, 'Mantenimiento crear periodo', 'Mantenimiento crear nuevo periodo'),
(64, 'Mantenimiento crear comisiones', 'Mantenimiento crear comisiones'),
(65, 'Mantenimiento crear grados', 'Mantenimiento crear grados academicos'),
(66, 'Mantenimiento crear categorías ', 'Mantenimiento crear categorias docentes'),
(67, 'Mantenimiento crear jornadas', 'Mantenimiento crear jornadas'),
(68, 'Mantenimiento crear estado civil', 'Mantenimiento crear estado civil'),
(69, 'Menú supervisión vista', 'Menú para gestionar las supervisiones'),
(70, 'Menú mantenimientos', 'Menú para todos los mantenimientos existentes'),
(71, 'Menú ayuda', 'Menú los manuales de usuario'),
(72, 'Menú vinculación ', 'Menú de vinculacion'),
(73, 'Mantenimiento crear genero', 'Mantenimiento crear genero'),
(74, 'Mantenimiento actividades', 'Mantenimiento gestion actividades'),
(75, 'Mantenimiento crear actividades', 'Mantenimiento crear actividades'),
(76, 'Mantenimiento crear departamento', 'Mantenimiento crear departamento'),
(77, 'Mantenimiento departamento', 'Mantenimiento gestion departamento'),
(78, 'Mantenimiento crear municipio', 'Mantenimiento crear municipio'),
(79, 'Mantenimiento municipio', 'Mantenimiento gestion municipio'),
(80, 'Mantenimiento atributos', 'Mantenimiento gestion atributos'),
(81, 'Mantenimiento crear atributos', 'Mantenimiento crear atributos'),
(82, 'Mantenimiento crear aula', 'Mantenimiento crear aulas'),
(83, 'Mantenimiento crear edificios', 'Mantenimiento crear edificios'),
(84, 'Mantenimiento genero', 'Mantenimiento gestion genero'),
(85, 'Mantenimiento horario', 'Mantenimiento gestion horario'),
(86, 'Mantenimiento crear horario', 'Mantenimiento crear horario'),
(87, 'Menú práctica profesional', 'Menú para solicitar pps'),
(88, 'Mantenimiento crear carrera', 'Crear carrera'),
(89, 'Mantenimiento carrera', 'Gestionar carrera'),
(90, 'Mantenimiento nacionalidad', 'Mantenimiento gestion nacionalidad'),
(91, 'Mantenimiento crear nacionalidad', 'Mantenimiento crear nacionalidad'),
(92, 'Mantenimiento feriados', 'Mantenimiento de días feriados'),
(93, 'Mantenimiento áreas asignaturas', 'Mantenimiento áreas asignaturas'),
(94, 'Menu mantenimientos Carga', 'Menu mantenimientos Carga'),
(95, 'Menu mantenimiento plan de estudios', 'Menu mantenimientos plan'),
(96, 'Crear plan de estudio', 'Crear plan de estudio'),
(97, 'Historial plan de estudio', 'Historial plan de estudio'),
(98, 'Gestion plan de estudio', 'Gestion plan de estudio'),
(99, 'Mantenimiento crear periodo plan', 'Mantenimiento crear periodo plan'),
(100, 'Mantenimiento periodo plan', 'Mantenimiento periodo plan'),
(101, 'Mantenimiento crear tipo plan', 'Mantenimiento crear tipo plan'),
(102, 'Mantenimiento tipo plan', 'Mantenimiento tipo plan'),
(103, 'Menu plan de estudio', 'Menu plan de estudio'),
(104, 'menu uno', 'menu uno'),
(105, 'menu dos', 'menu dos'),
(106, 'crear', 'crear'),
(107, 'gestion', 'gestion'),
(109, 'crear_registro', 'crear_registro'),
(110, 'gestion_usuario', 'gestion_usuario'),
(111, 'menu implementacion', 'menu imple'),
(112, 'prueba1', 'prueba1'),
(113, 'prueba2', 'prueba2'),
(114, 'menu estudiantes', 'menu estudiantes'),
(115, 'crear estudiantes', 'crear estudiantes'),
(116, 'gestion estudiantes', 'gestion estudiantes'),
(117, 'historial estudiantes', 'historial estudiantes'),
(145, 'Control Actas', 'Btn Control Actas'),
(146, 'Agendar Reunion ', 'Nueva reunion'),
(147, 'Reunion Pendiente ', 'Reuniones pendientes'),
(148, 'Lista Reunion ', 'Lista de reuniones'),
(149, 'Acta Pendiente ', 'Actas pendientes'),
(150, 'Lista Actas Menu', 'Listado actas'),
(151, 'Nuevo Acuerdo', 'Nuevo acuerdo'),
(152, 'Acuerdos Pendientes', 'Acuerdos Pendientes'),
(153, 'Lista Acuerdos', 'Listado de acuerdos'),
(154, 'Lista Actas', 'asistencia por actas'),
(155, 'Lista Persona', 'Asistencia personal'),
(156, 'Mantenimiento Tipo Reunion ', 'Mantenimiento Tipo Reunion Vista'),
(157, 'Mantenimiento Estado Acta ', 'Mantenimiento Estado Acta Vista'),
(158, 'Mantenimiento Estado Reunión', 'Mantenimiento estado reunion'),
(159, 'Mantenimiento Estado Acuerdo', 'Mantenimiento estado acuerdo'),
(160, 'Mantenimiento Estado Notificación', 'Mantenimiento estado notificación'),
(161, 'Mantenimiento Estado Participante', 'Mantenimiento Estado Participante');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parametros`
--

CREATE TABLE `tbl_parametros` (
  `Id_parametro` bigint(20) NOT NULL,
  `Id_usuario` bigint(20) NOT NULL,
  `Parametro` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Valor` varchar(255) NOT NULL,
  `Modificado_por` varchar(255) NOT NULL,
  `Fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_parametros`
--

INSERT INTO `tbl_parametros` (`Id_parametro`, `Id_usuario`, `Parametro`, `Descripcion`, `Valor`, `Modificado_por`, `Fecha_modificacion`) VALUES
(1, 1, 'INTENTOS', 'INTENTOS SESIONES', '3', ' ADMIN', '2021-02-11 17:41:37'),
(2, 1, 'Tamano_min_clave', 'TAMANO MINIMO DE LA CLAVE', '8', 'ADMIN', '2020-05-11 00:00:00'),
(4, 1, 'Cantidad_preguntas', 'PREGUNTAS INGRESADAS', '3', 'ADMIN', '2020-05-11 00:00:00'),
(5, 1, 'Tamano_max_clave', 'TAMANO MAXIMO DE CLAVE', '10', 'ADMIN', '2020-05-11 00:00:00'),
(6, 1, 'Tamano_clave_correo', 'TAMANO POR EL CORREO', '8', 'ADMIN', '2020-05-11 00:00:00'),
(7, 1, 'CAMBIO_CLAVE', 'TIEMPO PARA CAMBIAR CLAVE', '30', 'ADMIN', '2020-05-11 00:00:00'),
(8, 1, 'correo_institucional', 'CORREO DE LA EMPRESA', 'ainformatica2020@gmail.com', ' ADMIN', '2020-05-23 23:53:27'),
(9, 1, 'clave_correo', 'CLAVE DEL CORREO', 'Mumu123*', ' ADMIN', '2020-05-23 23:54:16'),
(10, 1, 'Puerto', 'PUERTO DEL GMAIL', '465', 'admin', '2020-05-12 00:00:00'),
(11, 1, 'HOST_SMTP', 'HOST DEL SERVIDOR', 'smtp.gmail.com', 'admin', '2020-05-11 00:00:00'),
(12, 1, 'Admin_correo', 'PERSONA QUE ADMINISTRA EL CORRE', 'Comite de Automatizacion ', ' ADMIN', '2021-05-29 04:48:34'),
(13, 1, 'AUTO_REGISTRO', 'AUTO REGISTRO USUARIO', '1', ' ADMIN', '2021-04-14 01:51:29'),
(16, 1, 'DOCENTE_VINCULACION_MATUTINA_1', 'DOCENTE ENCARGADO DE CHARLA', 'MSC. SANDRA QUAN ', 'ADMIN', '2020-06-04 17:49:38'),
(17, 1, 'DOCENTE_VINCULACION_MATUTINA_2', 'DOCENTE ENCARGADO DE CHARLA', 'MSC. ANGELICA MUÑOZ', ' ADMIN', '2020-08-11 06:08:06'),
(18, 1, 'DOCENTE_VINCULACION_VESPERTINA_1', 'DOCENTE ENCARGADO DE CHARLA', 'MSC. CAROLD RITHENHOUSE', 'ADMIN', '2020-06-04 00:00:00'),
(20, 1, 'DOCENTE_VINCULACION_VESPERTINA_2', 'DOCENTE ENCARGADO DE CHARLA', 'LIC. JULIAN ', 'ADMIN', '2020-06-04 00:00:00'),
(21, 1, 'DIAS_CHARLA', 'VALIDACION EN DIAS , PARA FECHA VALIDAS PARA CHARLA ', '90', 'ADMIN', '2020-06-04 00:00:00'),
(22, 1, 'CANTIDAD_DOCUMENTOS', 'MÁXIMA CANTIDAD DE DOCUMENTOS DEL PRACTICANTE.', '9', 'ADMIN', '2020-06-04 00:00:00'),
(23, 1, 'mayoria_edad', 'validacion para mayoria edad', '18', 'ADMIN', '2021-03-16 18:35:16'),
(24, 1, 'num_periodo_maximo', 'el maximo de periodos en un año', '3', 'ADMIN', '2021-04-08 10:14:07'),
(25, 1, 'acta_archivo_permitidos', 'ARCHIVO_PERMITIDOS PARA ACTAS', '.docx,.doc,.mppx,.pttx,.ptt,.zip,.mp4,.mpp', ' ADMIN', '2021-07-29 16:53:39'),
(26, 1, 'acta_max_size', '1MB = 1 MILLóN DE BYTES', '1000000', ' ADMIN', '2021-07-29 16:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_participantes`
--

CREATE TABLE `tbl_participantes` (
  `id_participante` int(11) NOT NULL,
  `id_reunion` int(3) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `id_estado_participante` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_participantes`
--

INSERT INTO `tbl_participantes` (`id_participante`, `id_reunion`, `id_persona`, `id_estado_participante`, `descripcion`) VALUES
(1, 1, 15, 1, NULL),
(2, 1, 16, 1, NULL),
(3, 1, 17, 1, NULL),
(4, 1, 18, 1, NULL),
(5, 1, 19, 1, NULL),
(6, 1, 23, 1, NULL),
(7, 1, 24, 1, NULL),
(8, 1, 39, 3, NULL),
(9, 1, 63, 1, NULL),
(26, 3, 39, NULL, NULL),
(27, 3, 104, NULL, NULL),
(28, 3, 108, NULL, NULL),
(29, 3, 109, NULL, NULL),
(30, 3, 112, NULL, NULL),
(31, 3, 81, NULL, NULL),
(32, 4, 39, NULL, NULL),
(33, 4, 104, NULL, NULL),
(34, 4, 105, NULL, NULL),
(35, 4, 106, NULL, NULL),
(36, 4, 107, NULL, NULL),
(37, 4, 108, NULL, NULL),
(38, 4, 109, NULL, NULL),
(39, 4, 110, NULL, NULL),
(40, 4, 111, NULL, NULL),
(41, 4, 112, NULL, NULL),
(42, 4, 113, NULL, NULL),
(43, 4, 114, NULL, NULL),
(44, 4, 115, NULL, NULL),
(45, 4, 149, NULL, NULL),
(46, 4, 81, NULL, NULL),
(47, 4, 103, NULL, NULL),
(48, 4, 80, NULL, NULL),
(49, 4, 82, NULL, NULL),
(50, 4, 83, NULL, NULL),
(51, 4, 84, NULL, NULL),
(52, 4, 85, NULL, NULL),
(53, 4, 86, NULL, NULL),
(54, 4, 87, NULL, NULL),
(55, 4, 88, NULL, NULL),
(56, 4, 89, NULL, NULL),
(57, 4, 90, NULL, NULL),
(58, 4, 91, NULL, NULL),
(59, 4, 92, NULL, NULL),
(60, 4, 93, NULL, NULL),
(61, 4, 94, NULL, NULL),
(62, 4, 95, NULL, NULL),
(63, 4, 96, NULL, NULL),
(64, 4, 97, NULL, NULL),
(65, 4, 98, NULL, NULL),
(66, 4, 99, NULL, NULL),
(67, 4, 100, NULL, NULL),
(68, 4, 101, NULL, NULL),
(69, 4, 102, NULL, NULL),
(70, 4, 116, NULL, NULL),
(71, 4, 117, NULL, NULL),
(72, 4, 118, NULL, NULL),
(89, 17, 104, 1, NULL),
(90, 17, 80, 1, NULL),
(91, 17, 81, 1, NULL),
(92, 17, 105, 1, NULL),
(93, 17, 82, 1, NULL),
(94, 17, 83, 1, NULL),
(95, 17, 106, 1, NULL),
(96, 17, 84, 3, NULL),
(97, 17, 85, 1, NULL),
(98, 17, 86, 1, NULL),
(99, 17, 102, 1, NULL),
(100, 17, 107, 1, NULL),
(101, 17, 87, 1, NULL),
(102, 17, 108, 1, NULL),
(103, 17, 118, 1, NULL),
(104, 17, 88, 1, NULL),
(105, 17, 89, 1, NULL),
(106, 17, 90, 1, NULL),
(107, 17, 109, 1, NULL),
(108, 17, 110, 1, NULL),
(109, 17, 117, 1, NULL),
(110, 17, 111, 1, NULL),
(111, 17, 91, 2, NULL),
(112, 17, 103, 1, NULL),
(113, 17, 112, 1, NULL),
(114, 17, 113, 1, NULL),
(115, 17, 92, 1, NULL),
(116, 17, 93, 1, NULL),
(117, 17, 94, 1, NULL),
(118, 17, 95, 1, NULL),
(119, 17, 96, 1, NULL),
(120, 17, 97, 1, NULL),
(121, 17, 98, 1, NULL),
(122, 17, 99, 1, NULL),
(123, 17, 149, 3, NULL),
(124, 17, 114, 1, NULL),
(125, 17, 39, 1, NULL),
(126, 17, 100, 1, NULL),
(127, 17, 115, 1, NULL),
(128, 17, 101, 1, NULL),
(129, 18, 116, 1, NULL),
(130, 18, 159, 2, NULL),
(135, 1, 88, 1, NULL),
(141, 24, 116, 1, NULL),
(145, 26, 116, NULL, NULL),
(146, 26, 159, NULL, NULL),
(156, 9, 116, 1, NULL),
(158, 9, 104, 1, NULL),
(159, 9, 80, 1, NULL),
(160, 9, 81, 1, NULL),
(161, 9, 159, 1, NULL),
(163, 24, 159, 3, NULL),
(164, 2, 116, NULL, NULL),
(165, 2, 159, NULL, NULL),
(166, 27, 116, NULL, NULL),
(167, 27, 159, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_periodo`
--

CREATE TABLE `tbl_periodo` (
  `id_periodo` bigint(20) NOT NULL,
  `num_periodo` int(11) NOT NULL DEFAULT '0',
  `num_anno` year(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` date DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL,
  `id_tipo_periodo` int(11) DEFAULT NULL,
  `fecha_adic_canc` date DEFAULT NULL,
  `fecha_desbloqueo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_periodo`
--

INSERT INTO `tbl_periodo` (`id_periodo`, `num_periodo`, `num_anno`, `fecha_inicio`, `fecha_final`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`, `id_tipo_periodo`, `fecha_adic_canc`, `fecha_desbloqueo`) VALUES
(1, 3, 2020, '2020-09-09', '2020-12-24', '2021-03-11', 'ADMIN', '0000-00-00', '0000-00-00', 1, '2021-09-14', '2021-01-11'),
(3, 1, 2021, '2021-03-20', '2021-04-20', '2021-03-12', 'ADMIN', '0000-00-00', '0000-00-00', 1, '2021-03-30', '2021-02-12'),
(4, 2, 2021, '2021-05-03', '2021-06-30', '2021-05-01', 'ADMIN', '2021-05-01', 'ADMIN', 1, '2021-05-19', '2021-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_periodo_plan`
--

CREATE TABLE `tbl_periodo_plan` (
  `id_periodo_plan` bigint(20) NOT NULL,
  `periodo` varchar(50) NOT NULL DEFAULT '',
  `Fecha_creacion` date DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `Fecha_modificacion` date DEFAULT NULL,
  `Modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_periodo_plan`
--

INSERT INTO `tbl_periodo_plan` (`id_periodo_plan`, `periodo`, `Fecha_creacion`, `Creado_por`, `Fecha_modificacion`, `Modificado_por`) VALUES
(1, 'PERIODO 1', NULL, NULL, '2021-06-06', 'ADMIN'),
(2, 'PERIODO 2', '2021-05-29', 'ADMIN', NULL, NULL),
(3, 'PERIODO 3', '2021-06-06', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permisos_usuarios`
--

CREATE TABLE `tbl_permisos_usuarios` (
  `Id_permisos_usuario` bigint(20) NOT NULL,
  `Id_rol` bigint(20) NOT NULL,
  `Id_objeto` bigint(20) NOT NULL,
  `insertar` varchar(255) NOT NULL,
  `modificar` varchar(255) NOT NULL,
  `eliminar` varchar(255) NOT NULL,
  `visualizar` varchar(255) NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(255) DEFAULT NULL,
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_permisos_usuarios`
--

INSERT INTO `tbl_permisos_usuarios` (`Id_permisos_usuario`, `Id_rol`, `Id_objeto`, `insertar`, `modificar`, `eliminar`, `visualizar`, `Fecha_creacion`, `Creado_por`, `Modificado_por`, `Fecha_modificacion`) VALUES
(1, 46, 1, '1', '1', '1', '1', NULL, NULL, 'ADMIN', '2021-05-12 05:59:16'),
(2, 46, 2, '1', '1', '1', '1', NULL, NULL, 'admin', '2020-05-22 20:45:26'),
(4, 46, 8, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(5, 46, 3, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(6, 46, 4, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(7, 46, 5, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(8, 46, 6, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(9, 46, 7, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(10, 46, 9, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(11, 46, 10, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(12, 46, 11, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(14, 46, 12, '1', '1', '1', '1', '2020-05-22 22:32:56', ' admin ', NULL, NULL),
(40, 46, 13, '1', '1', '1', '1', '2020-05-28 22:57:35', ' ADMIN ', NULL, NULL),
(41, 46, 14, '1', '1', '1', '1', '2020-05-28 22:57:37', ' ADMIN ', NULL, NULL),
(42, 46, 15, '1', '1', '1', '1', '2020-05-28 22:57:39', ' ADMIN ', NULL, NULL),
(43, 46, 16, '1', '1', '1', '1', '2020-05-28 22:57:41', ' ADMIN ', NULL, NULL),
(44, 46, 17, '1', '1', '1', '1', '2020-05-28 22:57:44', ' ADMIN ', NULL, NULL),
(45, 46, 18, '1', '1', '1', '1', '2020-05-28 22:57:46', ' ADMIN ', NULL, NULL),
(46, 46, 19, '1', '1', '1', '1', '2020-05-28 22:57:48', ' ADMIN ', NULL, NULL),
(47, 46, 20, '1', '1', '1', '1', '2020-05-28 22:57:50', ' ADMIN ', NULL, NULL),
(48, 46, 21, '1', '1', '1', '1', '2020-05-28 22:57:52', ' ADMIN ', NULL, NULL),
(49, 46, 22, '1', '1', '1', '1', '2020-05-28 22:57:54', ' ADMIN ', NULL, NULL),
(50, 46, 23, '1', '1', '1', '1', '2020-05-28 22:57:57', ' ADMIN ', NULL, NULL),
(51, 46, 24, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(52, 46, 25, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(53, 46, 26, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(54, 49, 13, '1', '0', '0', '1', '2020-06-24 23:41:47', ' ADMIN ', NULL, NULL),
(55, 49, 17, '1', '1', '0', '1', '2020-06-24 23:41:51', ' ADMIN ', 'ADMIN', '2021-03-05 23:59:28'),
(56, 49, 19, '1', '0', '0', '1', '2020-06-24 23:41:54', ' ADMIN ', NULL, NULL),
(57, 46, 27, '1', '1', '1', '1', '2020-06-24 23:44:09', ' ADMIN ', NULL, NULL),
(58, 46, 28, '1', '1', '1', '1', '2020-06-24 23:44:12', ' ADMIN ', NULL, NULL),
(59, 46, 29, '1', '1', '1', '1', '2020-07-30 19:32:01', ' ADMIN ', 'ADMIN', '2021-04-14 01:38:03'),
(60, 46, 30, '1', '1', '0', '1', '2020-07-30 19:32:04', ' ADMIN ', NULL, NULL),
(61, 46, 31, '1', '1', '0', '1', '2020-07-30 19:32:07', ' ADMIN ', NULL, NULL),
(62, 46, 32, '1', '1', '0', '1', '2020-07-30 19:32:11', ' ADMIN ', NULL, NULL),
(63, 46, 33, '1', '1', '0', '1', '2020-07-30 19:32:14', ' ADMIN ', NULL, NULL),
(64, 46, 34, '1', '1', '0', '1', '2020-07-30 19:32:17', ' ADMIN ', NULL, NULL),
(65, 46, 35, '1', '1', '0', '1', '2020-07-30 19:32:20', ' ADMIN ', NULL, NULL),
(66, 46, 36, '1', '1', '0', '1', '2020-07-30 19:32:23', ' ADMIN ', NULL, NULL),
(67, 46, 37, '1', '1', '1', '1', '2020-07-30 19:32:26', ' ADMIN ', 'ADMIN', '2021-04-14 01:43:21'),
(68, 46, 38, '1', '1', '1', '1', '2020-07-30 19:32:29', ' ADMIN ', 'ADMIN', '2021-04-14 01:42:40'),
(69, 49, 29, '1', '1', '1', '1', '2020-08-03 10:04:32', ' ADMIN ', NULL, NULL),
(70, 49, 30, '1', '1', '1', '1', '2020-08-03 10:04:32', ' ADMIN ', NULL, NULL),
(71, 49, 31, '1', '1', '1', '1', '2020-08-03 10:04:32', ' ADMIN ', NULL, NULL),
(72, 49, 32, '1', '1', '1', '1', '2020-08-03 10:04:32', ' ADMIN ', NULL, NULL),
(73, 49, 33, '1', '1', '1', '1', '2020-08-03 10:04:32', ' ADMIN ', NULL, NULL),
(74, 51, 13, '0', '0', '0', '1', '2020-08-05 16:46:08', ' ADMIN ', NULL, NULL),
(75, 53, 29, '1', '0', '0', '1', '2020-08-11 06:07:25', ' ADMIN ', 'RCORRALES', '2021-04-04 18:52:13'),
(76, 53, 30, '0', '0', '0', '1', '2020-08-11 06:07:25', ' ADMIN ', NULL, NULL),
(77, 54, 1, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(78, 54, 2, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(79, 54, 3, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(80, 54, 4, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(81, 54, 5, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(82, 54, 6, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(83, 54, 7, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(84, 54, 8, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(85, 54, 9, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(86, 54, 10, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(87, 54, 11, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(88, 54, 12, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(89, 54, 13, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(90, 54, 14, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(91, 54, 15, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(92, 54, 16, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(93, 54, 17, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(94, 54, 18, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(95, 54, 19, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(96, 54, 20, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(97, 54, 21, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(98, 54, 22, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(99, 54, 23, '1', '1', '0', '1', '2020-08-18 22:55:03', ' ADMIN ', NULL, NULL),
(100, 54, 24, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(101, 54, 25, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(102, 54, 26, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(103, 54, 27, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(104, 54, 28, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(105, 54, 29, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(106, 54, 30, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(107, 54, 31, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(108, 54, 32, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(109, 54, 33, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(110, 54, 34, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(111, 54, 35, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(112, 54, 36, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(113, 54, 37, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(114, 54, 38, '1', '1', '0', '1', '2020-08-18 22:55:04', ' ADMIN ', NULL, NULL),
(115, 55, 11, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(116, 55, 12, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(117, 55, 13, '0', '0', '0', '0', '2020-08-18 22:56:43', ' ADMIN ', 'ADMIN', '2021-03-19 15:53:34'),
(118, 55, 14, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', 'ADMIN', '2021-03-19 15:49:30'),
(119, 55, 15, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(120, 55, 16, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(121, 55, 17, '0', '0', '0', '0', '2020-08-18 22:56:43', ' ADMIN ', 'ADMIN', '2021-03-19 15:54:29'),
(122, 55, 18, '0', '0', '0', '0', '2020-08-18 22:56:43', ' ADMIN ', 'ADMIN', '2021-03-19 15:57:35'),
(123, 55, 19, '0', '0', '0', '0', '2020-08-18 22:56:43', ' ADMIN ', 'ADMIN', '2021-03-19 15:56:58'),
(124, 55, 20, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', 'ADMIN', '2021-03-19 15:56:23'),
(125, 55, 21, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(126, 55, 22, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(127, 55, 23, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(128, 55, 24, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(129, 55, 25, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(130, 55, 26, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(131, 55, 27, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(132, 55, 28, '1', '1', '0', '1', '2020-08-18 22:56:43', ' ADMIN ', NULL, NULL),
(133, 56, 11, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(134, 56, 12, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(135, 56, 29, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(136, 56, 30, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(137, 56, 31, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(138, 56, 32, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(139, 56, 33, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(140, 56, 34, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(141, 56, 35, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(142, 56, 36, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(143, 56, 37, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(144, 56, 38, '1', '1', '0', '1', '2020-08-18 22:57:37', ' ADMIN ', NULL, NULL),
(145, 57, 1, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(146, 57, 2, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(147, 57, 3, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(148, 57, 4, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(149, 57, 5, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(150, 57, 6, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(151, 57, 7, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(152, 57, 8, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(153, 57, 9, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(154, 57, 10, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(155, 57, 11, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(156, 57, 12, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(157, 57, 13, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(158, 57, 14, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(159, 57, 15, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(160, 57, 16, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(161, 57, 17, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(162, 57, 18, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(163, 57, 19, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(164, 57, 20, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(165, 57, 21, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(166, 57, 22, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(167, 57, 23, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(168, 57, 24, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(169, 57, 25, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(170, 57, 26, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(171, 57, 27, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(172, 57, 28, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(173, 57, 29, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(174, 57, 30, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(175, 57, 31, '1', '1', '0', '1', '2020-08-18 22:58:42', ' ADMIN ', NULL, NULL),
(176, 57, 32, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(177, 57, 33, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(178, 57, 34, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(179, 57, 35, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(180, 57, 36, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(181, 57, 37, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(182, 57, 38, '1', '1', '0', '1', '2020-08-18 22:58:43', ' ADMIN ', NULL, NULL),
(183, 46, 39, '1', '1', '1', '1', '2020-08-29 02:49:22', ' ADMIN ', NULL, NULL),
(184, 46, 40, '1', '1', '1', '1', '2020-08-29 02:49:22', ' ADMIN ', NULL, NULL),
(185, 46, 41, '1', '1', '1', '1', '2020-08-31 20:18:46', ' ADMIN ', NULL, NULL),
(186, 46, 42, '1', '1', '1', '1', '2020-08-31 20:18:46', ' ADMIN ', NULL, NULL),
(187, 46, 43, '1', '1', '1', '1', '2020-10-19 19:15:21', ' ADMIN ', NULL, NULL),
(188, 46, 44, '1', '1', '1', '1', '2020-10-19 19:15:25', ' ADMIN ', NULL, NULL),
(189, 49, 43, '1', '0', '0', '1', '2020-10-22 19:57:13', ' ADMIN ', NULL, NULL),
(190, 49, 39, '1', '0', '0', '1', '2020-10-27 21:53:44', ' ADMIN ', NULL, NULL),
(191, 49, 40, '1', '0', '0', '1', '2020-10-27 21:53:47', ' ADMIN ', NULL, NULL),
(192, 49, 41, '1', '0', '0', '1', '2020-10-27 21:53:50', ' ADMIN ', NULL, NULL),
(193, 49, 42, '1', '0', '0', '1', '2020-10-27 21:53:53', ' ADMIN ', NULL, NULL),
(194, 49, 15, '1', '0', '0', '1', '2020-10-27 22:04:07', ' ADMIN ', NULL, NULL),
(195, 49, 16, '1', '0', '0', '1', '2020-10-27 22:04:10', ' ADMIN ', NULL, NULL),
(196, 46, 45, '1', '1', '1', '1', '2020-11-02 16:34:35', ' ADMIN ', NULL, NULL),
(197, 46, 46, '1', '1', '1', '1', '2020-11-02 16:34:38', ' ADMIN ', NULL, NULL),
(198, 46, 47, '1', '1', '1', '1', '2020-11-02 16:34:42', ' ADMIN ', NULL, NULL),
(199, 46, 48, '1', '1', '1', '1', '2020-11-02 16:34:45', ' ADMIN ', NULL, NULL),
(200, 46, 49, '1', '1', '1', '1', '2020-11-02 19:42:23', ' ADMIN ', NULL, NULL),
(201, 46, 50, '1', '1', '1', '1', '2020-11-02 19:42:25', ' ADMIN ', 'ADMIN', '2020-11-03 19:47:05'),
(202, 46, 51, '1', '1', '1', '1', '2020-11-02 19:42:26', ' ADMIN ', NULL, NULL),
(203, 46, 52, '1', '1', '1', '1', '2020-11-02 19:42:28', ' ADMIN ', NULL, NULL),
(204, 46, 53, '1', '1', '1', '1', '2020-11-02 19:42:29', ' ADMIN ', NULL, NULL),
(205, 46, 54, '1', '1', '1', '1', '2020-11-02 19:42:31', ' ADMIN ', NULL, NULL),
(206, 46, 55, '1', '1', '1', '1', '2020-11-28 20:11:55', ' ADMIN ', NULL, NULL),
(207, 46, 56, '1', '1', '1', '1', '2020-12-02 00:51:57', ' ADMIN ', NULL, NULL),
(208, 46, 57, '1', '1', '1', '1', '2020-12-02 20:47:09', ' ADMIN ', NULL, NULL),
(209, 46, 58, '1', '1', '1', '1', '2020-12-02 22:27:11', ' ADMIN ', NULL, NULL),
(210, 46, 59, '1', '1', '1', '1', '2020-12-02 22:54:55', ' ADMIN ', NULL, NULL),
(211, 46, 60, '1', '1', '1', '1', '2020-12-02 23:25:41', ' ADMIN ', NULL, NULL),
(212, 46, 61, '1', '1', '1', '1', '2020-12-03 00:24:52', ' ADMIN ', NULL, NULL),
(213, 46, 62, '1', '1', '1', '1', '2020-12-04 22:00:52', ' ADMIN ', NULL, NULL),
(214, 46, 63, '1', '1', '1', '1', '2020-12-05 23:45:34', ' ADMIN ', NULL, NULL),
(215, 46, 64, '1', '1', '1', '1', '2020-12-05 23:45:35', ' ADMIN ', NULL, NULL),
(216, 46, 65, '1', '1', '1', '1', '2020-12-05 23:45:37', ' ADMIN ', NULL, NULL),
(217, 46, 66, '1', '1', '1', '1', '2020-12-05 23:45:38', ' ADMIN ', NULL, NULL),
(218, 46, 67, '1', '1', '1', '1', '2020-12-05 23:45:39', ' ADMIN ', NULL, NULL),
(219, 46, 68, '1', '1', '1', '1', '2020-12-05 23:45:41', ' ADMIN ', NULL, NULL),
(220, 63, 41, '1', '1', '0', '0', '2021-02-11 17:37:47', ' ADMIN ', 'ADMIN', '2021-02-11 17:38:54'),
(221, 49, 18, '1', '0', '0', '1', '2021-03-05 23:07:01', ' ADMIN ', NULL, NULL),
(222, 46, 69, '1', '1', '1', '1', '2021-03-10 22:49:46', ' ADMIN ', NULL, NULL),
(223, 46, 70, '1', '1', '1', '1', '2021-03-11 04:59:42', ' ADMIN ', NULL, NULL),
(224, 46, 72, '1', '1', '1', '1', '2021-03-17 05:58:17', ' ADMIN ', NULL, NULL),
(225, 46, 76, '1', '1', '1', '1', '2021-03-17 18:14:10', ' ADMIN ', NULL, NULL),
(226, 46, 77, '1', '1', '1', '1', '2021-03-17 18:14:12', ' ADMIN ', NULL, NULL),
(227, 46, 78, '1', '1', '1', '1', '2021-03-17 22:51:32', ' ADMIN ', NULL, NULL),
(228, 46, 79, '1', '1', '1', '1', '2021-03-17 22:51:33', ' ADMIN ', NULL, NULL),
(229, 46, 87, '1', '1', '1', '1', '2021-03-18 22:47:32', ' ADMIN ', NULL, NULL),
(230, 46, 88, '1', '1', '1', '1', '2021-03-19 01:45:33', ' ADMIN ', NULL, NULL),
(231, 46, 89, '1', '1', '1', '1', '2021-03-19 01:45:35', ' ADMIN ', NULL, NULL),
(232, 46, 73, '1', '1', '1', '1', '2021-03-19 03:29:43', ' ADMIN ', NULL, NULL),
(233, 46, 74, '1', '1', '1', '1', '2021-03-19 03:29:45', ' ADMIN ', NULL, NULL),
(234, 46, 75, '1', '1', '1', '1', '2021-03-19 03:29:47', ' ADMIN ', NULL, NULL),
(235, 46, 80, '1', '1', '1', '1', '2021-03-19 03:29:49', ' ADMIN ', NULL, NULL),
(236, 46, 81, '1', '1', '1', '1', '2021-03-19 03:29:50', ' ADMIN ', NULL, NULL),
(237, 46, 82, '1', '1', '1', '1', '2021-03-19 03:29:51', ' ADMIN ', NULL, NULL),
(238, 46, 83, '1', '1', '1', '1', '2021-03-19 03:29:53', ' ADMIN ', NULL, NULL),
(239, 46, 84, '1', '1', '1', '1', '2021-03-19 03:29:54', ' ADMIN ', NULL, NULL),
(240, 46, 85, '1', '1', '1', '1', '2021-03-19 03:29:57', ' ADMIN ', NULL, NULL),
(241, 46, 86, '1', '1', '1', '1', '2021-03-19 03:29:58', ' ADMIN ', NULL, NULL),
(242, 46, 90, '1', '1', '1', '1', '2021-03-19 03:30:02', ' ADMIN ', NULL, NULL),
(243, 46, 91, '1', '1', '1', '1', '2021-03-19 03:30:04', ' ADMIN ', NULL, NULL),
(244, 64, 49, '1', '1', '1', '1', '2021-03-23 00:10:57', ' ADMIN ', NULL, NULL),
(245, 64, 50, '0', '0', '0', '0', '2021-03-23 00:10:58', ' ADMIN ', 'ADMIN', '2021-04-08 22:07:18'),
(246, 64, 51, '0', '0', '0', '0', '2021-03-23 00:11:00', ' ADMIN ', 'ADMIN', '2021-04-08 22:03:23'),
(247, 64, 54, '1', '1', '1', '1', '2021-03-23 00:11:01', ' ADMIN ', NULL, NULL),
(248, 65, 24, '1', '0', '0', '1', '2021-04-04 18:53:18', ' RCORRALES ', NULL, NULL),
(249, 65, 51, '0', '1', '0', '0', '2021-04-04 18:57:41', ' RCORRALES ', NULL, NULL),
(250, 46, 92, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(251, 54, 92, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(252, 55, 92, '1', '1', '1', '1', NULL, NULL, NULL, NULL),
(253, 64, 53, '1', '1', '1', '1', '2021-04-08 22:05:20', ' ADMIN ', NULL, NULL),
(254, 46, 93, '1', '1', '1', '1', '2021-04-11 05:32:53', ' ADMIN ', NULL, NULL),
(255, 46, 94, '1', '1', '1', '1', '2021-04-21 08:06:55', ' ADMIN ', NULL, NULL),
(256, 68, 1, '1', '0', '1', '1', '2021-04-23 01:58:16', ' ADMIN ', 'ADMIN', '2021-04-23 02:03:55'),
(257, 68, 3, '1', '1', '0', '1', '2021-04-23 01:58:17', ' ADMIN ', NULL, NULL),
(258, 56, 45, '1', '1', '1', '1', '2021-04-30 19:18:28', ' ADMIN ', NULL, NULL),
(259, 56, 47, '1', '1', '1', '1', '2021-04-30 19:18:29', ' ADMIN ', NULL, NULL),
(260, 56, 48, '1', '1', '1', '1', '2021-04-30 19:18:30', ' ADMIN ', NULL, NULL),
(261, 56, 49, '1', '1', '1', '1', '2021-04-30 19:18:32', ' ADMIN ', NULL, NULL),
(262, 56, 51, '1', '1', '1', '1', '2021-04-30 19:18:34', ' ADMIN ', NULL, NULL),
(263, 56, 55, '1', '1', '1', '1', '2021-04-30 19:18:35', ' ADMIN ', NULL, NULL),
(264, 56, 56, '1', '1', '1', '1', '2021-04-30 19:18:37', ' ADMIN ', NULL, NULL),
(265, 56, 57, '1', '1', '1', '1', '2021-04-30 19:18:38', ' ADMIN ', NULL, NULL),
(266, 56, 58, '1', '1', '1', '1', '2021-04-30 19:18:40', ' ADMIN ', NULL, NULL),
(267, 56, 59, '1', '1', '1', '1', '2021-04-30 19:18:42', ' ADMIN ', NULL, NULL),
(268, 56, 60, '1', '1', '1', '1', '2021-04-30 19:18:43', ' ADMIN ', NULL, NULL),
(269, 56, 61, '1', '1', '1', '1', '2021-04-30 19:18:45', ' ADMIN ', NULL, NULL),
(270, 56, 62, '1', '1', '1', '1', '2021-04-30 19:18:47', ' ADMIN ', NULL, NULL),
(271, 56, 63, '1', '1', '1', '1', '2021-04-30 19:18:49', ' ADMIN ', NULL, NULL),
(272, 56, 64, '1', '1', '1', '1', '2021-04-30 19:18:51', ' ADMIN ', NULL, NULL),
(273, 56, 65, '1', '1', '1', '1', '2021-04-30 19:18:52', ' ADMIN ', NULL, NULL),
(274, 56, 66, '1', '1', '1', '1', '2021-04-30 19:18:53', ' ADMIN ', NULL, NULL),
(275, 56, 67, '1', '1', '1', '1', '2021-04-30 19:18:55', ' ADMIN ', NULL, NULL),
(276, 56, 68, '1', '1', '1', '1', '2021-04-30 19:18:57', ' ADMIN ', NULL, NULL),
(277, 56, 69, '1', '1', '1', '1', '2021-04-30 19:18:59', ' ADMIN ', NULL, NULL),
(278, 56, 70, '1', '1', '1', '1', '2021-04-30 19:19:00', ' ADMIN ', NULL, NULL),
(279, 56, 71, '1', '1', '1', '1', '2021-04-30 19:19:02', ' ADMIN ', NULL, NULL),
(280, 56, 73, '1', '1', '1', '1', '2021-04-30 19:19:04', ' ADMIN ', NULL, NULL),
(281, 56, 74, '1', '1', '1', '1', '2021-04-30 19:19:06', ' ADMIN ', NULL, NULL),
(282, 56, 75, '1', '1', '1', '1', '2021-04-30 19:19:07', ' ADMIN ', NULL, NULL),
(283, 56, 76, '1', '1', '1', '1', '2021-04-30 19:19:09', ' ADMIN ', NULL, NULL),
(284, 56, 77, '1', '1', '1', '1', '2021-04-30 19:19:10', ' ADMIN ', NULL, NULL),
(285, 56, 78, '1', '1', '1', '1', '2021-04-30 19:19:13', ' ADMIN ', NULL, NULL),
(286, 56, 79, '1', '1', '1', '1', '2021-04-30 19:19:15', ' ADMIN ', NULL, NULL),
(287, 56, 80, '1', '1', '1', '1', '2021-04-30 19:19:16', ' ADMIN ', NULL, NULL),
(288, 56, 81, '1', '1', '1', '1', '2021-04-30 19:19:18', ' ADMIN ', NULL, NULL),
(289, 56, 82, '1', '1', '1', '1', '2021-04-30 19:19:21', ' ADMIN ', NULL, NULL),
(290, 56, 83, '1', '1', '1', '1', '2021-04-30 19:19:23', ' ADMIN ', NULL, NULL),
(291, 56, 84, '1', '1', '1', '1', '2021-04-30 19:19:25', ' ADMIN ', NULL, NULL),
(292, 56, 85, '1', '1', '1', '1', '2021-04-30 19:19:26', ' ADMIN ', NULL, NULL),
(293, 56, 86, '1', '1', '1', '1', '2021-04-30 19:19:29', ' ADMIN ', NULL, NULL),
(294, 56, 88, '1', '1', '1', '1', '2021-04-30 19:19:30', ' ADMIN ', NULL, NULL),
(295, 56, 89, '1', '1', '1', '1', '2021-04-30 19:19:32', ' ADMIN ', NULL, NULL),
(296, 56, 90, '1', '1', '1', '1', '2021-04-30 19:19:33', ' ADMIN ', NULL, NULL),
(297, 56, 91, '1', '1', '1', '1', '2021-04-30 19:19:35', ' ADMIN ', NULL, NULL),
(298, 56, 92, '1', '1', '1', '1', '2021-04-30 19:19:37', ' ADMIN ', NULL, NULL),
(299, 56, 93, '1', '1', '1', '1', '2021-04-30 19:19:39', ' ADMIN ', NULL, NULL),
(300, 56, 94, '1', '1', '1', '1', '2021-04-30 19:19:40', ' ADMIN ', NULL, NULL),
(301, 46, 95, '1', '1', '1', '1', '2021-05-28 23:32:08', ' ADMIN ', NULL, NULL),
(302, 46, 99, '1', '1', '1', '1', '2021-05-28 23:32:35', ' ADMIN ', NULL, NULL),
(303, 46, 100, '1', '1', '1', '1', '2021-05-28 23:32:49', ' ADMIN ', NULL, NULL),
(304, 46, 101, '1', '1', '1', '1', '2021-05-28 23:33:03', ' ADMIN ', NULL, NULL),
(305, 46, 102, '1', '1', '1', '1', '2021-05-28 23:33:10', ' ADMIN ', NULL, NULL),
(306, 46, 96, '1', '1', '1', '1', '2021-05-28 23:48:39', ' ADMIN ', NULL, NULL),
(307, 46, 97, '1', '1', '1', '1', '2021-05-28 23:48:40', ' ADMIN ', NULL, NULL),
(308, 46, 98, '1', '1', '1', '1', '2021-05-28 23:48:44', ' ADMIN ', NULL, NULL),
(309, 46, 103, '1', '1', '1', '1', '2021-05-28 23:48:50', ' ADMIN ', NULL, NULL),
(310, 46, 104, '1', '1', '1', '1', '2021-06-04 20:47:53', ' ADMIN ', NULL, NULL),
(311, 46, 105, '1', '1', '1', '1', '2021-06-04 20:47:56', ' ADMIN ', NULL, NULL),
(312, 46, 106, '1', '1', '1', '1', '2021-06-04 21:16:41', ' ADMIN ', NULL, NULL),
(313, 46, 107, '1', '1', '1', '1', '2021-06-04 21:16:46', ' ADMIN ', NULL, NULL),
(314, 46, 109, '1', '1', '1', '1', '2021-06-04 21:54:35', ' ADMIN ', NULL, NULL),
(315, 46, 110, '1', '1', '1', '1', '2021-06-04 21:54:44', ' ADMIN ', NULL, NULL),
(316, 46, 111, '1', '1', '1', '1', '2021-06-04 22:32:27', ' ADMIN ', NULL, NULL),
(317, 46, 112, '1', '1', '1', '1', '2021-06-04 22:32:28', ' ADMIN ', NULL, NULL),
(318, 46, 113, '1', '1', '1', '1', '2021-06-04 22:32:29', ' ADMIN ', NULL, NULL),
(319, 46, 114, '1', '1', '1', '1', '2021-06-04 23:33:33', ' ADMIN ', NULL, NULL),
(320, 46, 115, '1', '1', '1', '1', '2021-06-04 23:33:41', ' ADMIN ', NULL, NULL),
(321, 46, 116, '1', '1', '1', '1', '2021-06-04 23:33:45', ' ADMIN ', NULL, NULL),
(331, 46, 154, '1', '1', '1', '1', '2021-06-16 05:43:28', ' ADMIN ', NULL, NULL),
(332, 46, 153, '1', '1', '1', '1', '2021-06-16 05:45:44', ' ADMIN ', NULL, NULL),
(333, 46, 145, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(334, 46, 146, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(335, 46, 147, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', 'ADMIN', '2021-06-23 09:45:33'),
(336, 46, 148, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(337, 46, 149, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(338, 46, 150, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(339, 46, 156, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', 'ADMIN', '2021-06-29 19:20:21'),
(340, 46, 157, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(341, 46, 158, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', NULL, NULL),
(342, 46, 159, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', 'ADMIN', '2021-06-22 10:17:35'),
(343, 46, 160, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', 'ADMIN', '2021-06-25 13:48:25'),
(344, 46, 161, '1', '1', '1', '1', '2021-06-19 18:33:16', ' ADMIN ', 'ADMIN', '2021-07-05 19:08:39'),
(345, 46, 151, '1', '1', '1', '1', '2021-06-22 21:07:28', ' ADMIN ', NULL, NULL),
(346, 46, 152, '1', '1', '1', '1', '2021-06-22 21:07:28', ' ADMIN ', NULL, NULL),
(347, 46, 155, '1', '1', '1', '1', '2021-06-22 21:07:28', ' ADMIN ', 'ADMIN', '2021-07-24 16:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personas`
--

CREATE TABLE `tbl_personas` (
  `id_persona` bigint(20) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) NOT NULL,
  `identidad` varchar(255) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `estado_civil` varchar(25) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_tipo_persona` int(11) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `id_tipo_docente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_personas`
--

INSERT INTO `tbl_personas` (`id_persona`, `nombres`, `apellidos`, `sexo`, `identidad`, `nacionalidad`, `estado_civil`, `fecha_nacimiento`, `id_tipo_persona`, `Estado`, `id_tipo_docente`) VALUES
(3, 'Daniel ', '20161002890', 'numero de cuenta', 'Alumno', NULL, NULL, NULL, 2, 'INACTIVO', 1),
(4, 'Helmer Ernesto ', 'Calix', 'numero de cuenta', 'Alumno', NULL, NULL, NULL, 2, 'INACTIVO', NULL),
(6, 'CHRISTEL NICOLE ', 'NEUMANN CALLEJAS', 'NUMERO_CUENTA', '0801-1996-15579', NULL, NULL, '2020-10-20', 2, 'INACTIVO', NULL),
(10, 'FANY', 'BARAHONA', 'FEMENINO', '0801-1997-23034', 'HODURENA', 'CASADO', '2020-01-02', 1, 'INACTIVO', NULL),
(15, 'EDIS JULIAN', 'REYES GARCIA', 'MASCULINO', '0808000000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(16, 'CAROLD ARGENTINA', 'RITHENHOUSE SABILLON', 'FEMENINO', '0808000000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(17, 'NELSON FRANCISCO', 'DIAZ VALLEJO', 'MASCULINO', '080800000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(18, 'ROSMERY CORRALES', 'APLICANO', 'FEMENINO', '0808000000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(19, 'MARTHA PATRICIA', 'ELLNER VILLALONGA', 'FEMENINO', '080800000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(20, 'FREDY ANDERSSON', 'MOTIÑO FLORES', 'MASCULINO', '0801199508298', 'HONDUREÑA', 'SOLTERO', '1995-05-04', 2, 'INACTIVO', NULL),
(21, 'DANIEL ENRIQUE', 'RAMIREZ', 'MASCULINO', '080800000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'INACTIVO', NULL),
(22, 'Linda Ceciclia', 'Villatoro Hernandez', 'Femenino', ' 0801-1111-1111_', NULL, NULL, '1997-06-12', 2, 'INACTIVO', NULL),
(23, 'DULCE MONSERRAT', 'DEL CID FIALLOS', 'FEMENINO', '0801000000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(24, 'GIANCARLO MARTINI', 'SCALICI AGUILAR', 'MASCULINO', '0808000000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(25, 'CRISTIAN JOSUE', 'RIVERA RAMIREZ', 'MASCULINO', '080800000000', 'HONDUREÑA', 'SOLTERO', '2021-03-01', 1, 'ACTIVO', NULL),
(26, 'Samanta', 'Ramirez', 'Femenino', ' 1111-1111-11111', NULL, NULL, '2021-03-05', 2, 'INACTIVO', NULL),
(27, 'Edward Alberto', 'Alvarenga Rodriguez', 'Masculino', ' 0801-2222-02022', NULL, NULL, '1992-07-17', 2, 'INACTIVO', NULL),
(39, 'ROSMERY ', 'CORRALES', 'FEMENINO', '0801-1273-33232', 'HONDUREÑA', 'CASADO', '2001-03-22', 1, 'INACTIVO', NULL),
(61, 'Enrique ', 'Rivera', 'Masculino', ' 2222-2222-22222', NULL, NULL, '2021-03-07', 2, 'INACTIVO', NULL),
(63, 'LESTER JOSUE ', 'FIALLOS PERALTA', 'MASCULINO', ' 0801-1990-01243', 'HONDUREÑA', 'SOLTERO', '1990-12-05', 1, 'ACTIVO', NULL),
(66, 'Fredy andersson', 'MOTINO FLORES', 'MASCULINO', '0801199508298', 'FRANCÉSA', 'SOLTERO', '2021-03-01', 2, 'INACTIVO', NULL),
(67, 'fredy', 'andersson cruz', 'FEMENINO', '0000000000000', 'AFGANA', 'SOLTERO', '2021-03-01', 1, 'INACTIVO', NULL),
(68, 'fredy', 'a', 'MASCULINO', '00000000000', 'AFGANA', 'SOLTERO', '2021-03-01', 1, 'INACTIVO', NULL),
(69, 'ander', 'fredy', '', '999999999999', 'AFGANA', 'UNION LIBRE', '2021-03-02', 1, 'INACTIVO', NULL),
(70, 'andersson', 'flores', '', '8888888888', 'AFGANA', 'SOLTERO', '2021-03-03', 1, 'INACTIVO', NULL),
(71, 'fredy', 'pao', 'MASCULINO', '9999999999', 'AFGANA', 'SOLTERO', '2021-03-02', 1, 'INACTIVO', NULL),
(72, 'fred', 'an', '', '5555555555555', 'AFGANA', 'SOLTERO', '2021-03-01', 1, 'INACTIVO', NULL),
(73, 'katherine andrea', 'alonzo', 'FEMENINO', ' 0801-1967-02806', 'AUSTRALIANA', 'SOLTERO', '1967-06-09', 1, 'INACTIVO', NULL),
(74, 'Lisa', 'Lucas', 'FEMENINO', ' 0801-1985-29999', 'ALEMANA', 'SOLTERO', '1985-06-01', 2, 'INACTIVO', NULL),
(77, 'HANSY NICOL', 'PONCE PONCE', 'Femenino', NULL, NULL, NULL, NULL, 2, 'INACTIVO', NULL),
(80, 'CARLOS GUSTAVO', 'ROMERO GALEANO', 'MASCULINO', '0805-1990-00123', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(81, 'CARMEN SUYAPA', 'GONZALEZ SANTOS', 'FEMENINO', '0801-1990-00135', 'HONDUREÑA', 'CASADO', '1990-04-05', 1, 'ACTIVO', NULL),
(82, 'CLAUDIA REGINA', 'NUÑEZ GALINDO', 'FEMENINO', '0901-1990-12300', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(83, 'DAVID MARTIN', 'ROVELO HERNANDEZ', 'MASCULINO', '0901-1990-12344', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(84, 'DILMA DORIS', 'ORTEGA TROCHE', 'FEMENINO', '0801-1990-00456', 'HONDUREÑA', 'CASADO', '1990-03-31', 1, 'ACTIVO', NULL),
(85, 'DINORA PATRICIA', 'VELASQUEZ VELASQUEZ', 'FEMENINO', '0801-1990-12345', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(86, 'DULIS PATRICIA', 'CORDOVA GALO', 'FEMENINO', '0901-1990-67890', 'HONDUREÑA', 'CASADO', '1990-03-29', 1, 'ACTIVO', NULL),
(87, 'HECTOR ALBERTO', 'BERRIOS RODRIGUEZ', 'MASCULINO', '0901-1990-67853', 'HONDUREÑA', 'CASADO', '1990-04-21', 1, 'ACTIVO', NULL),
(88, 'IRMA YADIRA', 'GAMEZ SUAZO', 'FEMENINO', '0801-1990-66543', 'HONDUREÑA', 'CASADO', '1990-03-07', 1, 'ACTIVO', NULL),
(89, 'ISAAC ARMANDO', 'DUBON SAM', 'MASCULINO', '0901-1990-12689', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(90, 'JORGE ALBERTO', 'REYES GARCIA', 'MASCULINO', '0901-1990-00565', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(91, 'KARLA MARIA', 'CHEVEZ FLORES', 'FEMENINO', '0801-1990-08654', 'HONDUREÑA', 'CASADO', '1990-04-13', 1, 'ACTIVO', NULL),
(92, 'LUIS EDUARDO', 'ERAZO TRIMARCHI', 'FEMENINO', '0801-1990-09876', 'HONDUREÑA', 'CASADO', '1990-04-05', 1, 'ACTIVO', NULL),
(93, 'MARCO ANTONIO', 'AVILA ORTEGA', 'MASCULINO', '0808-1990-21313', 'HONDUREÑA', 'CASADO', '1990-03-31', 1, 'ACTIVO', NULL),
(94, 'MARIA LORENA', 'ALVARADO LEVERON', 'FEMENINO', '0801-1990-98765', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(95, 'MARVIN JOSUE', 'AGUILAR ROMERO', 'MASCULINO', '0801-1990-87654', 'HONDUREÑA', 'CASADO', '1990-04-04', 1, 'ACTIVO', NULL),
(96, 'MARVIN LEONEL', 'MENDOZA DIAZ', 'MASCULINO', '0901-1990-11112', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(97, 'MARVIN NOE', 'JAIME MERINO', 'MASCULINO', '0801-1990-11111', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(98, 'MILVIA ESPERANZA', 'GUERRA', 'FEMENINO', '0901-1990-56789', 'HONDUREÑA', 'CASADO', '1990-01-06', 1, 'ACTIVO', NULL),
(99, 'OBED HUMBERTO', 'MARTINEZ REYES', 'FEMENINO', '0801-1990-04546', 'HONDUREÑA', 'CASADO', '1990-04-15', 1, 'ACTIVO', NULL),
(100, 'SANDRA JANETH', 'QUAN GOMEZ', 'FEMENINO', '0901-1990-45678', 'HONDUREÑA', 'CASADO', '1990-03-29', 1, 'ACTIVO', NULL),
(101, 'YOLANY MARITZA', 'FLORES NAZAR', 'FEMENINO', '0801-1990-65778', 'HONDUREÑA', 'CASADO', '1990-04-14', 1, 'ACTIVO', NULL),
(102, 'EDUARDO ENRIQUE', 'SANTOS CASTILLO', 'MASCULINO', '0801-1990-67890', 'HONDUREÑA', 'CASADO', '1990-04-13', 1, 'ACTIVO', NULL),
(103, 'KARLA MELISA', 'GARCIA PINEDA', 'FEMENINO', '0801-1990-16578', 'HONDUREÑA', 'CASADO', '1988-03-30', 1, 'ACTIVO', NULL),
(104, 'CARLOS EDUARDO', 'ORDOÑEZ RODRIGUEZ', 'MASCULINO', '0801-1990-43546', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(105, 'CESAR ALEJANDRO', 'MALDONADO CRUZ', 'MASCULINO', '0801-1990-90898', 'HONDUREÑA', 'CASADO', '1990-03-31', 1, 'ACTIVO', NULL),
(106, 'DILMA AURORA', 'MONCADA AVILA', 'FEMENINO', '0801-1990-88383', 'HONDUREÑA', 'CASADO', '1990-04-05', 1, 'ACTIVO', NULL),
(107, 'HEBER DE JESUS', 'AGUILERA RIVERA', 'MASCULINO', '0801-1990-55777', 'HONDUREÑA', 'CASADO', '1990-03-28', 1, 'ACTIVO', NULL),
(108, 'HECTOR ENRIQUE', 'HERNANDEZ PEDRANO', 'MASCULINO', '0801-1990-55141', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(109, 'JOSE ADALBERTO', 'SIERRA RODAS', 'MASCULINO', '0801-1990-53131', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(110, 'JOSE FRANCISCO', 'PAGOAGA ACOSTA', 'MASCULINO', '0801-1990-66372', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(111, 'JOSE MARIO', 'REYES AGUILAR', 'MASCULINO', '0801-1990-44151', 'HONDUREÑA', 'CASADO', '1990-04-06', 1, 'ACTIVO', NULL),
(112, 'LEONARDO ALFREDO', 'ZAMBRANA AGUILAR', 'MASCULINO', '0801-1990-17727', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(113, 'LESTER JOSUE', 'FIALLOS PERALTA', 'MASCULINO', '0801-1990-11188', 'HONDUREÑA', 'CASADO', '1990-03-31', 1, 'ACTIVO', NULL),
(114, 'REBECA ISABEL', 'ESPINAL DIAZ', 'FEMENINO', '0801-1990-65611', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(115, 'TANIA YESENIA', 'VALLADARES BAISA', 'FEMENINO', '0801-1990-11113', 'HONDUREÑA', 'CASADO', '1990-03-30', 1, 'ACTIVO', NULL),
(116, 'ANGELICA AMELISA', 'MUÑOZ SALINAS', 'FEMENINO', '0801-1990-66551', 'HONDUREÑA', 'CASADO', '1991-03-30', 1, 'ACTIVO', NULL),
(117, 'JOSE LUIS', 'RODRIGUEZ GARCIA', 'MASCULINO', '0801-1990-11101', 'HONDUREÑA', 'CASADO', '1990-04-20', 1, 'ACTIVO', NULL),
(118, 'HECTOR', 'GALINDO PINEDA', 'MASCULINO', '0801-1990-11103', 'HONDUREÑA', 'CASADO', '1990-04-21', 1, 'ACTIVO', NULL),
(130, 'Elia', 'Rivera', 'Femenino', ' 2222-2222-22222', NULL, NULL, '2021-04-02', 2, 'INACTIVO', NULL),
(149, 'PRUEBA', 'PRUEBAA', 'FEMENINO', '0801-1887-88280', 'HONDUREÑA', 'SOLTERO', '2000-04-30', 1, 'ACTIVO', NULL),
(151, 'Gabriel', 'Obando', 'Masculino', NULL, NULL, NULL, NULL, 2, NULL, NULL),
(152, 'Gabriel', 'Obando', 'MASCULINO', '0801199902356', 'HONDUREÑA', 'SOLTERO', '1997-02-05', 2, NULL, NULL),
(153, 'Helmer', 'Calix', 'Masculino', NULL, NULL, NULL, NULL, 2, NULL, NULL),
(154, 'Daniel Enrique ', 'Ramirez Rivera', 'Masculino', NULL, NULL, NULL, NULL, 2, NULL, NULL),
(155, 'CRISTIANO', 'RONALDO', 'MASCULINO', '44445', 'PORTUGUÉSA', 'UNION LIBRE', '1992-05-12', 1, 'ACTIVO', 1),
(156, 'lucia fernanda', 'ponce avila', 'FEMENINO', '0801199615579', 'HONDUREÑA', 'UNION LIBRE', '1996-01-02', 1, NULL, NULL),
(157, 'ever', 'palada', 'Masculino', NULL, NULL, NULL, NULL, 2, NULL, NULL),
(158, 'Isai', 'romero', 'masculino', '0801-2000-14525', 'HONDURAÑA', 'soltero', '1997-12-18', 2, 'ACTIVO', NULL),
(159, 'CHRISTIAN SAMUEL', 'SAUCEDA FLORES', 'MASCULINO', '0801190025698', 'HONDUREÑA', 'SOLTERO', '2021-07-01', 3, 'ACTIVO', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personas_extendidas`
--

CREATE TABLE `tbl_personas_extendidas` (
  `id_persona_ext` int(11) NOT NULL,
  `id_atributo` int(11) NOT NULL,
  `id_persona` bigint(20) NOT NULL DEFAULT '0',
  `valor` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_personas_extendidas`
--

INSERT INTO `tbl_personas_extendidas` (`id_persona_ext`, `id_atributo`, `id_persona`, `valor`) VALUES
(1, 11, 6, '20141011506'),
(16, 12, 22, '20211002890'),
(17, 12, 26, '20141010101'),
(18, 12, 27, '20151002890'),
(46, 1, 39, '14'),
(47, 3, 39, '2021-03-22'),
(126, 12, 61, '20101002890'),
(135, 12, 66, '20131015579'),
(136, 12, 74, '8611202'),
(144, 12, 77, '20202020100'),
(152, 1, 80, '123000'),
(153, 3, 80, '2021-04-08'),
(154, 1, 81, '10000'),
(155, 3, 81, '2021-04-08'),
(156, 11, 81, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(157, 8, 81, '../curriculum_docentes/DFo_3_1_esp.pdf'),
(158, 1, 82, '123000'),
(159, 3, 82, '2021-04-08'),
(160, 11, 82, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(161, 8, 82, '../curriculum_docentes/DFo_3_1_esp.pdf'),
(162, 1, 83, '123000'),
(163, 3, 83, '2021-04-08'),
(164, 11, 83, '../Imagenes_Perfil_Docente/imagen01021905.jpeg'),
(165, 8, 83, '../curriculum_docentes/curriculum de prueba.pdf'),
(166, 1, 84, '123000'),
(167, 3, 84, '2021-04-08'),
(168, 11, 84, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(169, 8, 84, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(170, 1, 85, '123000'),
(171, 3, 85, '2021-04-08'),
(172, 11, 85, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(173, 8, 85, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(174, 1, 86, '123000'),
(175, 3, 86, '2021-04-08'),
(176, 11, 86, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(177, 8, 86, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(178, 1, 87, '123000'),
(179, 3, 87, '2021-04-07'),
(180, 11, 87, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(181, 8, 87, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(182, 1, 88, '123000'),
(183, 3, 88, '2021-04-08'),
(184, 11, 88, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(185, 8, 88, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(186, 1, 89, '123566'),
(187, 3, 89, '2021-04-08'),
(188, 11, 89, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(189, 8, 89, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(190, 1, 90, '123456'),
(191, 3, 90, '2021-04-08'),
(192, 11, 90, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(193, 8, 90, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(194, 1, 91, '123456'),
(195, 3, 91, '2021-04-08'),
(196, 11, 91, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(197, 8, 91, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(198, 1, 92, '345654'),
(199, 3, 92, '2021-04-08'),
(200, 11, 92, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(201, 8, 92, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(202, 1, 93, '123455'),
(203, 3, 93, '2021-04-08'),
(204, 11, 93, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(205, 8, 93, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(206, 1, 94, '123476'),
(207, 3, 94, '2021-04-08'),
(208, 11, 94, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(209, 8, 94, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(210, 1, 95, '123876'),
(211, 3, 95, '2021-04-08'),
(212, 11, 95, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(213, 8, 95, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(214, 1, 96, '567890'),
(215, 3, 96, '2021-04-08'),
(216, 11, 96, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(217, 8, 96, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(218, 1, 97, '565789'),
(219, 3, 97, '2021-04-08'),
(220, 11, 97, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(221, 8, 97, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(222, 1, 98, '324345'),
(223, 3, 98, '2021-04-08'),
(224, 11, 98, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(225, 8, 98, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(226, 1, 99, '345678'),
(227, 3, 99, '2021-04-08'),
(228, 11, 99, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(229, 8, 99, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(230, 1, 100, '213456'),
(231, 3, 100, '2021-04-08'),
(232, 11, 100, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(233, 8, 100, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(234, 1, 101, '657879'),
(235, 3, 101, '2021-04-08'),
(236, 11, 101, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(237, 8, 101, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(238, 1, 102, '76890'),
(239, 3, 102, '2021-04-08'),
(240, 11, 102, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(241, 8, 102, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(242, 1, 103, '233445'),
(243, 3, 103, '2021-04-08'),
(244, 11, 103, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(245, 8, 103, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(246, 1, 104, '546567'),
(247, 3, 104, '2021-04-08'),
(248, 11, 104, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(249, 8, 104, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(250, 1, 105, '989023'),
(251, 3, 105, '2021-04-08'),
(252, 11, 105, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(253, 8, 105, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(254, 1, 106, '221111'),
(255, 3, 106, '2021-04-08'),
(256, 11, 106, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(257, 8, 106, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(258, 1, 107, '237654'),
(259, 3, 107, '2021-04-08'),
(260, 11, 107, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(261, 8, 107, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(262, 1, 108, '676890'),
(263, 3, 108, '2021-04-08'),
(264, 11, 108, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(265, 8, 108, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(266, 1, 109, '345465'),
(267, 3, 109, '2021-04-08'),
(268, 11, 109, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(269, 8, 109, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(270, 1, 110, '111111'),
(271, 3, 110, '2021-04-08'),
(272, 11, 110, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(273, 8, 110, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(274, 1, 111, '567611'),
(275, 3, 111, '2021-04-08'),
(276, 11, 111, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(277, 8, 111, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(278, 1, 112, '555555'),
(279, 3, 112, '2021-04-08'),
(280, 11, 112, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(281, 8, 112, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(282, 1, 113, '777777'),
(283, 3, 113, '2021-04-08'),
(284, 11, 113, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(285, 8, 113, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(286, 1, 114, '888888'),
(287, 3, 114, '2021-04-08'),
(288, 11, 114, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(289, 8, 114, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(290, 1, 115, '888888'),
(291, 3, 115, '2021-04-08'),
(292, 11, 115, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(293, 8, 115, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(295, 1, 116, '124325'),
(296, 3, 116, '2021-04-08'),
(297, 11, 116, '../Imagenes_Perfil_Docente/perfil_docente2.jpg'),
(298, 8, 116, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(299, 1, 117, '111111'),
(300, 3, 117, '2021-04-08'),
(301, 11, 117, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(302, 8, 117, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(303, 1, 118, '555555'),
(304, 3, 118, '2021-04-08'),
(305, 11, 118, '../Imagenes_Perfil_Docente/perfil_docente.jpg'),
(306, 8, 118, '../curriculum_docentes/DFo_3_2_esp.pdf'),
(349, 12, 130, '20211000612'),
(428, 14, 104, 'SI'),
(430, 14, 15, 'NO'),
(431, 14, 16, 'NO'),
(432, 14, 17, 'NO'),
(433, 14, 18, 'NO'),
(434, 14, 19, 'NO'),
(435, 14, 23, 'NO'),
(436, 14, 24, 'NO'),
(437, 14, 63, 'NO'),
(438, 14, 80, 'NO'),
(439, 14, 81, 'NO'),
(440, 14, 82, 'NO'),
(441, 14, 83, 'NO'),
(442, 14, 84, 'NO'),
(443, 14, 85, 'NO'),
(444, 14, 86, 'NO'),
(445, 14, 87, 'NO'),
(446, 14, 88, 'NO'),
(447, 14, 89, 'NO'),
(448, 14, 90, 'NO'),
(449, 14, 91, 'NO'),
(450, 14, 92, 'NO'),
(451, 14, 93, 'NO'),
(452, 14, 94, 'NO'),
(453, 14, 95, 'NO'),
(454, 14, 96, 'NO'),
(455, 14, 97, 'NO'),
(456, 14, 98, 'NO'),
(457, 14, 99, 'NO'),
(458, 14, 100, 'NO'),
(459, 14, 101, 'NO'),
(460, 14, 102, 'NO'),
(461, 14, 103, 'NO'),
(462, 14, 104, 'NO'),
(463, 14, 105, 'NO'),
(464, 14, 106, 'NO'),
(465, 14, 107, 'NO'),
(466, 14, 108, 'NO'),
(467, 14, 109, 'NO'),
(468, 14, 110, 'NO'),
(469, 14, 111, 'NO'),
(470, 14, 111, 'NO'),
(471, 14, 114, 'NO'),
(472, 14, 115, 'NO'),
(473, 14, 116, 'NO'),
(474, 14, 117, 'NO'),
(475, 14, 118, 'NO'),
(481, 1, 149, '56'),
(482, 14, 149, 'SI'),
(483, 3, 149, '2021-04-30'),
(484, 11, 149, '../Imagenes_Perfil_Docente/carmen villalobos.jpg'),
(489, 12, 151, '20141002205'),
(490, 12, 152, '20141002205'),
(491, 12, 153, '20131015093'),
(492, 12, 154, '20161002890'),
(498, 12, 157, '20151023854');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plan_estudio`
--

CREATE TABLE `tbl_plan_estudio` (
  `id_plan_estudio` bigint(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `num_clases` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `codigo_plan` varchar(50) DEFAULT NULL,
  `plan_vigente` varchar(50) DEFAULT NULL,
  `id_tipo_plan` bigint(20) DEFAULT NULL,
  `Creado_por` varchar(50) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `modificado_por` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_plan_estudio`
--

INSERT INTO `tbl_plan_estudio` (`id_plan_estudio`, `nombre`, `num_clases`, `fecha_creacion`, `codigo_plan`, `plan_vigente`, `id_tipo_plan`, `Creado_por`, `fecha_modificacion`, `modificado_por`) VALUES
(1, 'plan 1', 60, '2021-05-27', 'PLAN1', 'SI', 1, NULL, '2021-06-07', 'ADMIN'),
(2, 'plan 2', 4, '2021-05-29', 'PLAN2', 'NO', 1, NULL, '2021-06-07', 'ADMIN'),
(3, 'plan 3', 52, '2021-05-31', 'PLAN3', 'NO', 1, NULL, NULL, NULL),
(5, 'plan 4', 12, '2021-05-31', 'IA-160', 'NO', 1, NULL, NULL, NULL),
(6, 'plan 5', 32, '2021-05-31', 'IA-1456', 'NO', 1, NULL, NULL, NULL),
(7, 'plan 6', 12, '2021-05-31', 'aaaaaa', 'NO', 1, NULL, NULL, NULL),
(8, 'plan 7', 1, '2021-05-31', 'q', 'NO', 1, NULL, '2021-06-07', 'ADMIN'),
(9, 'plan 8', 2, '2021-05-31', 'qq', 'NO', 1, 'ADMIN', '2021-06-06', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_practica_estudiantes`
--

CREATE TABLE `tbl_practica_estudiantes` (
  `Id_practica` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `Id_empresa` bigint(20) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_finaliza` date DEFAULT NULL,
  `horas` varchar(255) DEFAULT NULL,
  `docente_supervisor` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_practica_rechazo`
--

CREATE TABLE `tbl_practica_rechazo` (
  `id_practica_rechazo` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `motivo` text NOT NULL,
  `fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pref_area_docen`
--

CREATE TABLE `tbl_pref_area_docen` (
  `id_pref_area_doce` bigint(20) NOT NULL,
  `id_persona` bigint(20) DEFAULT NULL,
  `id_area` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pref_asig_docen`
--

CREATE TABLE `tbl_pref_asig_docen` (
  `id_pref_asig_docen` bigint(20) NOT NULL,
  `id_persona` bigint(20) DEFAULT NULL,
  `Id_asignatura` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preguntas`
--

CREATE TABLE `tbl_preguntas` (
  `Id_pregunta` bigint(20) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `Fecha_creacion` datetime NOT NULL,
  `Creado_por` varchar(255) NOT NULL,
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_preguntas`
--

INSERT INTO `tbl_preguntas` (`Id_pregunta`, `pregunta`, `estado`, `Fecha_creacion`, `Creado_por`, `Modificado_por`, `Fecha_modificacion`) VALUES
(13, 'COMIDA FAVORITA', 1, '2020-05-13 17:08:09', 'admin', NULL, NULL),
(43, 'PRIMER AUTOMOVIL', 1, '2020-05-17 21:18:55', 'admin', NULL, NULL),
(52, 'NOMBRE DE TU MASCOTA', 1, '2020-05-24 00:00:00', 'admin', 'ADMIN', '2020-05-24 18:04:18'),
(53, 'EQUIPO FAVORITO', 1, '2020-06-03 21:59:53', 'ADMIN', NULL, NULL),
(54, 'BEBIDA FAVORITA', 0, '2020-06-03 22:01:58', 'ADMIN', NULL, NULL),
(55, 'ACTIVIDAD FAVORITA', 1, '2020-06-03 22:02:59', 'ADMIN', 'ADMIN', '2021-06-09 01:16:27'),
(56, 'CUAL ES TU COLOR FAVORITO', 1, '2020-08-05 16:11:47', 'ADMIN', NULL, NULL),
(57, 'FRUTA FAVORITA', 1, '2020-08-20 22:11:08', 'RCORRALES', NULL, NULL),
(58, 'QUE EDAD TIENES', 1, '2021-03-24 16:04:11', 'ADMIN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preguntas_seguridad`
--

CREATE TABLE `tbl_preguntas_seguridad` (
  `Id_pregunta_seguridad` bigint(20) NOT NULL,
  `Respuesta` varchar(255) NOT NULL,
  `Fecha_creacion` varchar(255) NOT NULL,
  `Id_pregunta` bigint(20) NOT NULL,
  `Id_usuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_preguntas_seguridad`
--

INSERT INTO `tbl_preguntas_seguridad` (`Id_pregunta_seguridad`, `Respuesta`, `Fecha_creacion`, `Id_pregunta`, `Id_usuario`) VALUES
(3, 'SI', '', 13, 1),
(7, 'SI', '', 43, 1),
(54, 'SI', '', 52, 1),
(55, 'SUBARU ', '', 43, 12),
(56, 'CARNE AZADA', '', 13, 9),
(57, 'DOGUI', '', 52, 9),
(58, 'FCB', '', 53, 3),
(59, 'HONDA', '', 43, 3),
(60, 'VERDE', '', 56, 3),
(61, 'BONO', '', 52, 12),
(62, 'MOTAGUA', '', 53, 12),
(63, 'REAL MADRID', '', 53, 4),
(64, 'PESCADO', '', 13, 4),
(65, 'AGUA', '', 54, 4),
(66, 'CRATO', '', 52, 11),
(67, 'OLIMPIA', '', 53, 11),
(68, 'CHINA', '', 13, 11),
(69, 'COCO', '', 52, 19),
(70, 'HOLA', '', 53, 19),
(71, 'COCO', '', 13, 19),
(72, 'PIZZA', '', 13, 24),
(73, 'FORD', '', 43, 24),
(74, 'COCO', '', 52, 24),
(75, 'PIZZA', '', 13, 27),
(76, 'COCO', '', 52, 27),
(77, 'OLIMPIA', '', 53, 27),
(78, 'PIZZA', '', 13, 28),
(79, 'FUTBOL', '', 55, 28),
(80, 'NEGRO', '', 56, 28),
(81, 'MUSTANG', '', 43, 29),
(82, 'UVAS', '', 57, 29),
(83, 'ROJO', '', 56, 29),
(84, 'ARROZ', '', 13, 31),
(85, 'RAMBO', '', 52, 31),
(86, 'MORADO', '', 56, 31),
(87, 'PIZZA', '', 13, 40),
(88, 'COCO', '', 52, 40),
(89, 'UVAS', '', 57, 40),
(90, 'MAZDA', '', 43, 41),
(91, 'OLIMPIA', '', 53, 41),
(92, 'ROJO', '', 56, 41),
(93, 'PIZZA', '', 13, 42),
(94, 'COCO', '', 52, 42),
(95, 'ROJO', '', 56, 42),
(96, 'PIZZA', '', 13, 43),
(97, 'OLIMPIA', '', 53, 43),
(98, 'ROJO', '', 56, 43),
(99, 'PIZZA', '', 13, 2),
(100, 'ROJO', '', 53, 2),
(101, 'ROJO', '', 56, 2),
(102, 'PIZZA', '', 13, 52),
(103, 'COCO', '', 52, 52),
(104, 'ROJO', '', 56, 52),
(105, 'DDD', '', 13, 53),
(106, 'DDD', '', 43, 53),
(107, 'XD', '', 53, 53),
(108, 'PIZZA', '', 13, 54),
(109, 'PEPSI', '', 54, 54),
(110, 'CORRER', '', 55, 54),
(111, 'PIZZA', '', 13, 58),
(112, 'COCO', '', 52, 58),
(113, 'CORRER', '', 55, 58),
(114, 'SUBARU ', '', 43, 49),
(115, 'BONO', '', 52, 49),
(116, 'MANGO', '', 57, 49),
(117, 'LANGOSTA', '', 13, 60),
(118, 'SANDIA', '', 57, 60),
(119, '32', '', 58, 60),
(126, 'YO', '', 13, 61),
(127, 'YO', '', 43, 61),
(128, 'YO', '', 52, 61),
(129, 'KIA', '', 43, 51),
(130, 'CHISPITA', '', 52, 51),
(131, 'ROJO', '', 56, 51),
(132, 'COCO', '', 13, 63),
(133, 'COCO', '', 43, 63),
(134, 'COCO', '', 52, 63),
(135, 'HAMBURGUESA', '', 13, 70),
(136, 'LANA', '', 52, 70),
(137, 'FUTBOL', '', 55, 70),
(138, 'SASA', '', 13, 71),
(139, 'SASA', '', 52, 71),
(140, 'SASA', '', 53, 71),
(141, 'BARZA', '', 53, 50),
(142, 'AZUL', '', 56, 50),
(143, '59', '', 58, 50),
(144, 'YO', '', 13, 73),
(145, 'YO', '', 43, 73),
(146, 'YO', '', 52, 73),
(147, 'A', '', 13, 46),
(148, 'A', '', 43, 46),
(149, 'A', '', 53, 46);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proyectos`
--

CREATE TABLE `tbl_proyectos` (
  `Id_proyecto` bigint(20) NOT NULL,
  `Id_tipo_v` bigint(20) NOT NULL,
  `Id_modalidad` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo_proyecto` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `beneficiarios_directos` bigint(20) NOT NULL,
  `beneficiarios_indirectos` bigint(20) NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `nombre_contacto_institucional` varchar(255) NOT NULL,
  `cargo_contacto_institucional` varchar(255) NOT NULL,
  `telefono_contacto_institucional` varchar(50) NOT NULL DEFAULT '',
  `correo_contacto_institucional` varchar(255) NOT NULL,
  `cant_beneficiarios` bigint(20) NOT NULL,
  `fecha_inicio_ejecucion` datetime NOT NULL,
  `fecha_final_ejecucion` datetime NOT NULL,
  `fecha_inicio_evaluacion` datetime NOT NULL,
  `fecha_final_evaluacion` datetime NOT NULL,
  `costo` int(11) NOT NULL,
  `Fecha_creación` datetime NOT NULL,
  `Id_tipo_formalizacion` bigint(20) NOT NULL,
  `Id_aporte` bigint(20) NOT NULL,
  `region` varchar(255) NOT NULL,
  `departamento_pais` bigint(20) NOT NULL DEFAULT '0',
  `municipio` bigint(20) NOT NULL DEFAULT '0',
  `aldea_caserio` bigint(20) NOT NULL DEFAULT '0',
  `barrio_colonia` varchar(255) NOT NULL,
  `entidad_beneficiaria` varchar(255) NOT NULL,
  `objetivos_desarrollo` varchar(255) NOT NULL,
  `objetivos_inmediatos` varchar(255) NOT NULL,
  `resultados` varchar(255) NOT NULL,
  `actividades` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL,
  `tipo_proyecto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_proyectos`
--

INSERT INTO `tbl_proyectos` (`Id_proyecto`, `Id_tipo_v`, `Id_modalidad`, `nombre`, `codigo_proyecto`, `estado`, `beneficiarios_directos`, `beneficiarios_indirectos`, `nombre_empresa`, `nombre_contacto_institucional`, `cargo_contacto_institucional`, `telefono_contacto_institucional`, `correo_contacto_institucional`, `cant_beneficiarios`, `fecha_inicio_ejecucion`, `fecha_final_ejecucion`, `fecha_inicio_evaluacion`, `fecha_final_evaluacion`, `costo`, `Fecha_creación`, `Id_tipo_formalizacion`, `Id_aporte`, `region`, `departamento_pais`, `municipio`, `aldea_caserio`, `barrio_colonia`, `entidad_beneficiaria`, `objetivos_desarrollo`, `objetivos_inmediatos`, `resultados`, `actividades`, `departamento`, `tipo_proyecto`) VALUES
(46, 2, 1, 'PROBANDO PRUEBA', 323, 1, 3232, 2132, 'WEEW', 'DSD', 'EQWEQWE', ' 3231-2321', 'SDSAD@GMAIL.COM', 5364, '2021-06-10 00:00:00', '2021-06-24 00:00:00', '2021-06-10 00:00:00', '2021-06-24 00:00:00', 31234, '2021-06-01 21:31:05', 4, 2, 'DSDAD', 1, 3, 39, 'ASDAS', 'DASD', ' DASD', ' FDGFD', ' FDGF', ' GDFGFDGDF', 'ASDAS', 'ASDAS'),
(47, 4, 2, 'NOMBRE DE PROYECTO', 123, 1, 123, 1234, 'NOMBRE VINCULACION', 'CONTACTO VINCULA', 'CARGO VINCULA', ' 3424-2342', 'CORREO_VINCULA@GMAIL.COM', 1357, '2021-06-10 00:00:00', '2021-06-30 00:00:00', '2021-06-10 00:00:00', '2021-06-30 00:00:00', 1234564, '2021-06-02 19:08:52', 3, 2, 'DSDS', 2, 12, 264, 'DSDSD', 'DSDS', ' ASD', ' ASD', ' FDSF', ' FDFDS', 'INFORMATICA', 'TIPO DE PROYECTO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requisito_asignatura`
--

CREATE TABLE `tbl_requisito_asignatura` (
  `id_requisito_asig` bigint(20) NOT NULL,
  `Id_asignatura` bigint(20) DEFAULT NULL,
  `asignatura_requisito` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_requisito_asignatura`
--

INSERT INTO `tbl_requisito_asignatura` (`id_requisito_asig`, `Id_asignatura`, `asignatura_requisito`) VALUES
(1, 9, 'IA-250, IA-251'),
(2, 42, 'IA-255'),
(4, 24, NULL),
(5, 33, 'IA-240');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reunion`
--

CREATE TABLE `tbl_reunion` (
  `id_reunion` int(11) NOT NULL,
  `id_tipo` int(2) NOT NULL,
  `id_estado` int(3) NOT NULL,
  `fecha` date NOT NULL,
  `nombre_reunion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lugar` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_final` time NOT NULL,
  `asunto` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `agenda_propuesta` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `enlace` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_spanish2_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_reunion`
--

INSERT INTO `tbl_reunion` (`id_reunion`, `id_tipo`, `id_estado`, `fecha`, `nombre_reunion`, `lugar`, `hora_inicio`, `hora_final`, `asunto`, `agenda_propuesta`, `enlace`, `mensaje`) VALUES
(1, 2, 4, '2021-07-28', 'Horas VOAE', 'Zoom', '14:20:00', '16:25:00', 'a', 'a', 'www.facebook.com', NULL),
(2, 2, 1, '2021-08-07', 'Coordinadores', 'ZOOM', '18:50:00', '20:50:00', 'AF', 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT. SUSPENDISSE VULPUTATE LACUS EST. VIVAMUS COMMODO LACINIA BIBENDUM. PHASELLUS\r\nMATTIS VARIUS MAURIS IN EGESTAS. MAECENAS ALIQUET NUNC LECTUS, NEC PRETIUM NEQUE TINCIDUNT AT. SED ET PURUS ET URNA SODALES RUTRUM QUIS\r\nVEL MASSA. AENEAN SED VELIT AC MAGNA FERMENTUM FERMENTUM. SUSPENDISSE CONVALLIS RISUS MAGNA, NEC TINCIDUNT LEO VESTIBULUM EU. ETIAM\r\n', 'www.facebook.com', NULL),
(3, 1, 1, '2021-08-02', 'Requisitos Practica', 'Zoom', '19:05:00', '20:10:00', 'aa', 'a', '', NULL),
(4, 2, 1, '2021-07-19', 'Nuevo plan Estudios', 'Zoom', '15:21:00', '17:25:00', 'asd', 'asd', 'www.facebook.com', NULL),
(9, 2, 1, '2021-08-03', 'Cambio de Carrera', 'Microsoft Teams', '15:00:00', '16:30:00', 'nuevos requisitos para Cambio de Carrera informática', '1. Punto a  tratar # 1\r\n2. Punto a  tratar # 2\r\n3. Punto a  tratar # 3\r\n4. Punto a  tratar # 4\r\n', 'http://www.teams.com/#HFfgKHgJH001', NULL),
(17, 1, 4, '2021-07-29', 'EXAMEN 1ERA UNIDA', 'SALA DE MAESTRIA #5', '17:00:00', '18:00:00', 'EXAMEN GRUPO #6', '1. JJ\r\n2. YG', '', NULL),
(18, 1, 4, '2021-07-14', 'cristianprueba', 'cristianprueba', '12:30:00', '12:45:00', 'cristianprueba', 'cristianprueba', '', NULL),
(24, 2, 1, '2021-08-07', 'reunion de pruebaa', 'reunion de prueba', '17:00:00', '18:00:00', 'REUNION DE PRUEBAAAAA', 'REUNION DE PRUEBAA', 'Tema: Sala de reuniones personales de Christian  Unirse a la reunión Zoom https://us04web.zoom.us/j/8096317269?pwd=Yit4M2tvaGQ2eFJnaCtaV1BxaTBHdz09  ID de reunión: 809 631 7269 Código de acceso: 1vLDtj', ''),
(26, 2, 1, '2021-07-13', 'Cancelación de Clasess', 'Zoom', '18:45:00', '19:45:00', 'sdghftrtrttrt', 'dfgdfgdfgdfhhhhhhhhhhhhh', 'http://localhost/', NULL),
(27, 1, 1, '2021-08-22', 'REUNIÓN 1', 'ZOOM', '16:30:00', '17:30:00', 'ASDASDASDASDQEQWWWWWWWW', '1.- FFGHFGHFGHFDGDFGDFFFFFFFFFFDFGDFGDFG\r\n2.- DDFFFFFFFFFFFFFFFFFFFFGFFFFFFFFFFFFFFFFFFD', '', NULL);

--
-- Triggers `tbl_reunion`
--
DELIMITER $$
CREATE TRIGGER `Insertar_Acta` AFTER UPDATE ON `tbl_reunion` FOR EACH ROW INSERT INTO
`tbl_acta` 
(`id_estado`,`id_tipo`,`id_reunion`,`fecha`,`hora_inicial`,`hora_final`,`fecha_edicion`,`redactor`) 
SELECT
2,id_tipo,id_reunion,CURRENT_DATE,CURRENT_TIME,CURRENT_TIME,CURRENT_TIME,1
FROM tbl_reunion
WHERE tbl_reunion.id_estado = 4 AND  (id_reunion = New.id_reunion )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reunion_notificacion`
--

CREATE TABLE `tbl_reunion_notificacion` (
  `id_reunion_notificacion` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_reunion` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `hora_notificacion` time NOT NULL,
  `fecha_envio` date DEFAULT NULL,
  `hora_envio` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `Id_rol` bigint(20) NOT NULL,
  `Rol` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `Fecha_creacion` datetime DEFAULT NULL,
  `Creado_por` varchar(255) DEFAULT NULL,
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`Id_rol`, `Rol`, `descripcion`, `estado`, `Fecha_creacion`, `Creado_por`, `Modificado_por`, `Fecha_modificacion`) VALUES
(46, 'ADMIN', 'PRUEBA', 1, '2020-05-20 00:00:00', 'da', 'admin', '2020-05-22 20:45:47'),
(49, 'ESTUDIANTE', 'ES ESTUDIANTE', 1, '2020-06-11 00:19:42', 'ADMIN', NULL, NULL),
(51, 'PRUEBAE', 'DE PRUEBA', 1, '2020-08-05 16:38:41', 'ADMIN', NULL, NULL),
(53, 'OPERADOR', 'OPERADOR DE SOLICITUDES', 1, '2020-08-11 06:06:20', 'ADMIN', NULL, NULL),
(54, 'JEFE VINCULACION', 'JEFE DEL DEPTO DE VINCULACION', 1, '2020-08-18 16:43:56', 'ADMIN', NULL, NULL),
(55, 'VINCULACION', 'PERSONAL DE VINCULACION', 1, '2020-08-18 16:44:58', 'ADMIN', NULL, NULL),
(56, 'COORDINADORES', 'COORDINADORES DE CARRERA', 1, '2020-08-18 16:45:42', 'ADMIN', 'ADMIN', '2020-08-18 23:45:50'),
(57, 'COMITE AUTOMATIZACION', 'DOCENTES PERTENECIENTES COMITE', 1, '2020-08-18 16:46:57', 'ADMIN', NULL, NULL),
(59, 'PRACTICA PROFESIONAL', 'PRACTICA PROFESIONAL', 0, '2020-08-28 06:24:33', 'RCORRALES', NULL, NULL),
(61, 'PRUEBAEE', 'DF', 1, '2020-12-05 02:59:21', 'ADMIN', 'ADMIN', '2021-04-14 01:44:12'),
(62, 'PRUEBAX', 'PRUEBAX', 0, '2020-12-05 21:19:40', 'ADMIN', NULL, NULL),
(63, 'PRUEBAPRUEBA', 'PRUEBAS', 1, '2021-02-11 17:36:06', 'ADMIN', NULL, NULL),
(64, 'DOCENTE', 'prubando', 1, '2021-03-22 17:07:46', 'ADMIN', NULL, NULL),
(65, 'OPERATIVO', 'PAA EL PERSONAL OPERATIVO I', 1, '2021-04-04 18:22:31', 'RCORRALES', NULL, NULL),
(66, 'PRUEBAFINAL', 'FINAL FINAL', 1, '2021-04-14 00:27:34', 'ADMIN', NULL, NULL),
(67, 'PRUEBANINI', 'LLKJ', 1, '2021-04-14 01:40:32', 'ADMIN', 'ADMIN', '2021-04-14 01:41:18'),
(68, 'EJEMPLO', 'PRUEBA', 1, '2021-04-23 01:36:51', 'ADMIN', 'ADMIN', '2021-04-23 01:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subida_documentacion`
--

CREATE TABLE `tbl_subida_documentacion` (
  `Id_subida` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_vinculacion` datetime DEFAULT NULL,
  `fecha_coordinacion` datetime DEFAULT NULL,
  `estado_vinculacion` int(11) DEFAULT NULL,
  `estado_coordinacion` int(11) DEFAULT NULL,
  `observacion_vinculacion` varchar(255) DEFAULT NULL,
  `motivo_coordinacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipos_persona`
--

CREATE TABLE `tbl_tipos_persona` (
  `id_tipo_persona` int(11) NOT NULL DEFAULT '0',
  `tipo_persona` varchar(50) NOT NULL DEFAULT '',
  `descripcion` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tipos_persona`
--

INSERT INTO `tbl_tipos_persona` (`id_tipo_persona`, `tipo_persona`, `descripcion`) VALUES
(1, 'DOCENTE', 'ingresado para prueba'),
(2, 'ESTUDIANTE', 'ingresado para prueba'),
(3, 'COORDINADOR', 'ingresado para prueba');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipos_vinculacion`
--

CREATE TABLE `tbl_tipos_vinculacion` (
  `Id_tipo_v` bigint(20) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipos_vinculacion`
--

INSERT INTO `tbl_tipos_vinculacion` (`Id_tipo_v`, `tipo`, `Fecha_creacion`) VALUES
(1, 'EDUCACION Y CAPACITACION', '2020-05-31 00:00:00'),
(2, 'ASESORIA TECNICA', '2020-05-31 00:00:00'),
(3, 'ASISTENCIA DIRECTA', '2020-05-31 00:00:00'),
(4, 'INVESTIGACION APLICADA', '2020-05-31 00:00:00'),
(5, 'TRANSFERENCIA DE TECNOLOGIA', '2020-05-31 00:00:00'),
(6, 'USO DE CAPACIDADES INSTALADAS', '2020-05-31 00:00:00'),
(7, 'DIFUSION', '2020-05-31 00:00:00'),
(8, 'OTROS', '2020-05-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_asignatura`
--

CREATE TABLE `tbl_tipo_asignatura` (
  `id_tipo_asignatura` bigint(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipo_asignatura`
--

INSERT INTO `tbl_tipo_asignatura` (`id_tipo_asignatura`, `descripcion`) VALUES
(1, 'normal'),
(2, 'servicio');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_aula`
--

CREATE TABLE `tbl_tipo_aula` (
  `id_tipo_aula` bigint(20) NOT NULL DEFAULT '0',
  `tipo_aula` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tipo_aula`
--

INSERT INTO `tbl_tipo_aula` (`id_tipo_aula`, `tipo_aula`) VALUES
(0, 'laboratorio'),
(1, 'auditorio'),
(2, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_contactos`
--

CREATE TABLE `tbl_tipo_contactos` (
  `id_tipo_contacto` bigint(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tipo_contactos`
--

INSERT INTO `tbl_tipo_contactos` (`id_tipo_contacto`, `descripcion`) VALUES
(1, 'TELEFONO CELULAR'),
(2, 'TELEFONO FIJO'),
(3, 'DIRECCION'),
(4, 'CORREO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_docente`
--

CREATE TABLE `tbl_tipo_docente` (
  `id_tipo_docente` int(11) NOT NULL,
  `tipo_docente` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tipo_docente`
--

INSERT INTO `tbl_tipo_docente` (`id_tipo_docente`, `tipo_docente`, `descripcion`) VALUES
(1, 'SUED', ''),
(2, 'CU', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_formalizacion_proyecto`
--

CREATE TABLE `tbl_tipo_formalizacion_proyecto` (
  `Id_tipo_formalizacion` bigint(20) NOT NULL,
  `tipo_formalizacion` varchar(255) NOT NULL,
  `Fecha_creacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tipo_formalizacion_proyecto`
--

INSERT INTO `tbl_tipo_formalizacion_proyecto` (`Id_tipo_formalizacion`, `tipo_formalizacion`, `Fecha_creacion`) VALUES
(1, 'CONVENIO', '2020-05-31 00:00:00'),
(2, 'CARTA', '2020-05-31 00:00:00'),
(3, 'ACUERDO', '2020-05-31 00:00:00'),
(4, 'CARTA DE INTENCION', '2020-05-31 00:00:00'),
(5, 'CONTRATO', '2020-05-31 00:00:00'),
(6, 'OTROS', '2020-05-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_periodo`
--

CREATE TABLE `tbl_tipo_periodo` (
  `id_tipo_periodo` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `horas_validas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tipo_periodo`
--

INSERT INTO `tbl_tipo_periodo` (`id_tipo_periodo`, `descripcion`, `horas_validas`) VALUES
(1, 'normal', 1),
(2, 'corto', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_plan`
--

CREATE TABLE `tbl_tipo_plan` (
  `id_tipo_plan` bigint(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tipo_plan`
--

INSERT INTO `tbl_tipo_plan` (`id_tipo_plan`, `nombre`) VALUES
(1, 'PRUEBA 1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_recurso`
--

CREATE TABLE `tbl_tipo_recurso` (
  `id_recurso` int(11) NOT NULL,
  `tipo_recurso` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_tipo_recurso`
--

INSERT INTO `tbl_tipo_recurso` (`id_recurso`, `tipo_recurso`) VALUES
(1, 'teams');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_reunion_acta`
--

CREATE TABLE `tbl_tipo_reunion_acta` (
  `id_tipo` int(1) NOT NULL,
  `tipo` varchar(15) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `tbl_tipo_reunion_acta`
--

INSERT INTO `tbl_tipo_reunion_acta` (`id_tipo`, `tipo`) VALUES
(1, 'PRESENCIAL'),
(2, 'VIRTUAL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `Id_usuario` bigint(20) NOT NULL,
  `id_persona` bigint(20) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Id_rol` bigint(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Intentos` int(11) DEFAULT NULL,
  `Ultima_conexion` datetime DEFAULT NULL,
  `Fec_vence_contrasena` datetime DEFAULT NULL,
  `Fecha_creacion` varchar(255) DEFAULT NULL,
  `Creado_por` varchar(255) DEFAULT NULL,
  `Modificado_por` varchar(255) DEFAULT NULL,
  `Fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`Id_usuario`, `id_persona`, `Usuario`, `Id_rol`, `estado`, `Contrasena`, `Intentos`, `Ultima_conexion`, `Fec_vence_contrasena`, `Fecha_creacion`, `Creado_por`, `Modificado_por`, `Fecha_modificacion`) VALUES
(1, 6, 'ADMIN', 46, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, '2020-09-21 00:00:00', '2023-11-29 10:13:57', '2020-09-21 00:00:00', NULL, 'ADMIN', '2021-04-14 01:52:38'),
(2, 20, 'ANDERMFL', 46, 1, 'SHcwQVp4OEFBeFZuM3B5SUpiSzQ0UT09', 0, NULL, '2022-03-18 21:22:59', NULL, NULL, NULL, NULL),
(43, 22, 'LVILLATORO', 49, 1, 'MjZROTgrU3RPV3pLMVNVNTEwSXU4QT09', 0, NULL, '2021-05-31 18:11:08', '2021-03-18 23:17:10', NULL, NULL, NULL),
(46, 15, 'EREYES', 55, 1, 'SHcwQVp4OEFBeFZuM3B5SUpiSzQ0UT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', NULL, NULL),
(47, 16, 'CSABILLON', 55, 2, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', NULL, NULL),
(48, 17, 'NDIAZ', 64, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', NULL, NULL),
(49, 18, 'RCORRALES', 46, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', NULL, NULL),
(50, 19, 'MVILLALONGA', 46, 1, 'UE0zU2h6NzlCZEVQR0gwdUc3Z2cwQT09', 2, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', 'MVILLALONGA', '2021-06-03 01:01:38'),
(51, 23, 'DFIALLOS', 56, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', NULL, NULL),
(52, 21, 'DRAMIREZ', 55, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-18', 'ADMIN', NULL, NULL),
(53, 23, 'SRAMIREZ', 64, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2021-03-19 16:27:55', '2021-03-19 16:27:55', NULL, NULL, NULL),
(54, 27, 'EALVARENGA', 49, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2021-03-19 17:07:29', '2021-03-19 17:07:29', NULL, NULL, NULL),
(55, 10, 'FANY', 64, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 61, 'ERIVERA', 49, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2021-03-23 22:18:39', '2021-03-23 22:18:39', NULL, NULL, NULL),
(59, 24, 'GSCALICI', 64, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-25 00:00:00', 'ADMIN', NULL, NULL),
(60, 63, 'LFIALLOS', 46, 2, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-12-30 00:00:00', '2021-03-25 00:00:00', 'ADMIN', NULL, NULL),
(61, 77, 'HPONCE', 49, 2, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2021-04-06 19:09:57', '2021-04-06 19:09:57', NULL, NULL, NULL),
(63, 130, 'ERIVERA', 49, 1, 'SHcwQVp4OEFBeFZuM3B5SUpiSzQ0UT09', 0, NULL, '2021-06-03 00:00:47', '2021-04-19 20:53:49', NULL, NULL, NULL),
(64, 23, 'DCID', 56, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, '2021-04-30 11:10:27', '2023-11-29 10:13:57', NULL, 'ADMIN', NULL, NULL),
(65, 23, 'MCID', 64, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-04-30 11:22:12', NULL, NULL, NULL, NULL),
(66, 83, 'DROVELO', 64, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2022-04-30 11:46:12', NULL, NULL, NULL, NULL),
(70, 151, 'GOBANDO', 49, 1, 'amhEMEVzRmRHUWF5OTk5dERDRzlMQT09', 0, NULL, '2021-05-18 17:10:27', '2021-05-18 17:10:27', NULL, NULL, NULL),
(71, 153, 'HCALIX', 49, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2021-05-19 17:58:30', '2021-05-19 17:58:30', NULL, NULL, NULL),
(73, 156, 'LUCIFER', 46, 0, 'SHcwQVp4OEFBeFZuM3B5SUpiSzQ0UT09', 0, NULL, NULL, NULL, NULL, 'LUCIFER', '2021-06-03 00:11:36'),
(74, 157, 'EPALADA', 49, 2, 'Q04wZTIwUlBsT3hXdEFsZzhDRUhBdz09', NULL, NULL, '2021-06-08 06:25:19', '2021-06-08 06:25:19', NULL, NULL, NULL),
(75, 158, 'IROMERO', 46, 1, 'RE9mSEpzSGJpQnAvTXpDUEdtZTFvUT09', 0, NULL, '2021-12-11 19:24:51', '2021-06-08 19:22:10', 'ADMIN', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_acta`
--
ALTER TABLE `tbl_acta`
  ADD PRIMARY KEY (`id_acta`),
  ADD UNIQUE KEY `num_acta` (`num_acta`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `id_reunion` (`id_reunion`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `redactor` (`redactor`);

--
-- Indexes for table `tbl_acta_recursos`
--
ALTER TABLE `tbl_acta_recursos`
  ADD PRIMARY KEY (`id_recursos`),
  ADD KEY `Id_Acta` (`id_acta`),
  ADD KEY `redactor` (`redactor`);

--
-- Indexes for table `tbl_actividades`
--
ALTER TABLE `tbl_actividades`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `FK_tbl_actividades_tbl_comisones` (`id_comisiones`) USING BTREE;

--
-- Indexes for table `tbl_actividades_persona`
--
ALTER TABLE `tbl_actividades_persona`
  ADD PRIMARY KEY (`id_act_persona`),
  ADD KEY `FK_tbl_actividades_persona_tbl_actividades` (`id_actividad`),
  ADD KEY `FK_tbl_actividades_persona_tbl_personas` (`id_persona`);

--
-- Indexes for table `tbl_acuerdos`
--
ALTER TABLE `tbl_acuerdos`
  ADD PRIMARY KEY (`id_acuerdo`),
  ADD KEY `id_reunion` (`id_acta`),
  ADD KEY `id_participante` (`id_participante`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indexes for table `tbl_aldeas_caserios_hn`
--
ALTER TABLE `tbl_aldeas_caserios_hn`
  ADD PRIMARY KEY (`id_aldea_caserio`),
  ADD KEY `FK_tbl_aldeas_caserios_hn_tbl_municipios_hn` (`id_municipio`);

--
-- Indexes for table `tbl_alumnos_himno`
--
ALTER TABLE `tbl_alumnos_himno`
  ADD PRIMARY KEY (`Id_himno`),
  ADD KEY `FK_personas_alumnos_himno` (`id_persona`) USING BTREE,
  ADD KEY `horario_himno` (`id_horario_himno`);

--
-- Indexes for table `tbl_areas`
--
ALTER TABLE `tbl_areas`
  ADD PRIMARY KEY (`id_area`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indexes for table `tbl_asignaturas`
--
ALTER TABLE `tbl_asignaturas`
  ADD PRIMARY KEY (`Id_asignatura`),
  ADD KEY `id_tipo_asignatura` (`id_tipo_asignatura`) USING BTREE,
  ADD KEY `id_area` (`id_area`),
  ADD KEY `id_plan_estudio` (`id_plan_estudio`),
  ADD KEY `id_periodo_plan` (`id_periodo_plan`);

--
-- Indexes for table `tbl_asignaturas_aprobadas`
--
ALTER TABLE `tbl_asignaturas_aprobadas`
  ADD PRIMARY KEY (`Id_asignatura_aprobada`),
  ADD KEY `Columna 2` (`Id_asignatura`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `tbl_atributos`
--
ALTER TABLE `tbl_atributos`
  ADD PRIMARY KEY (`id_atributos`) USING BTREE,
  ADD KEY `FK1id_tipo_persona` (`id_tipo_persona`);

--
-- Indexes for table `tbl_aula`
--
ALTER TABLE `tbl_aula`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `FK_tbl_aula_tbl_tipo_aula` (`id_tipo_aula`),
  ADD KEY `FK_tbl_aula_tbl_edificio` (`id_edificio`);

--
-- Indexes for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`Id_bitacora`),
  ADD KEY `rel_bi_obj` (`Id_objeto`),
  ADD KEY `Id_objeto` (`Id_objeto`),
  ADD KEY `cod_usuario` (`Id_objeto`) USING BTREE,
  ADD KEY `FK_usuario_bitacora` (`Id_usuario`);

--
-- Indexes for table `tbl_cambio_carrera`
--
ALTER TABLE `tbl_cambio_carrera`
  ADD PRIMARY KEY (`Id_cambio`),
  ADD KEY `fk_cambio_centro` (`Id_centro_regional`),
  ADD KEY `FK_facultades` (`Id_facultad`),
  ADD KEY `FK_personas_cambio_carrera` (`id_persona`) USING BTREE;

--
-- Indexes for table `tbl_cancelar_clases`
--
ALTER TABLE `tbl_cancelar_clases`
  ADD PRIMARY KEY (`Id_cancelar_clases`),
  ADD KEY `FK_personas_usuario` (`id_persona`) USING BTREE;

--
-- Indexes for table `tbl_carga_academica`
--
ALTER TABLE `tbl_carga_academica`
  ADD PRIMARY KEY (`id_carga_academica`),
  ADD KEY `FK_tbl_carga_academica_tbl_asignaturas` (`id_asignatura`),
  ADD KEY `FK_tbl_carga_academica_tbl_personas` (`id_persona`),
  ADD KEY `FK_tbl_carga_academica_tbl_periodo` (`id_periodo`),
  ADD KEY `FK_tbl_carga_tbl_aula` (`id_aula`),
  ADD KEY `FK_tbl_modalidad` (`id_modalidad`),
  ADD KEY `FK_tbl_hora_inicial` (`hora_inicial`),
  ADD KEY `FK_tbl_hora_final` (`hora_final`);

--
-- Indexes for table `tbl_carga_dias`
--
ALTER TABLE `tbl_carga_dias`
  ADD PRIMARY KEY (`id_carga_academica`),
  ADD KEY `id_dia` (`id_dia`);

--
-- Indexes for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD PRIMARY KEY (`id_carrera`),
  ADD KEY `Id_facultad` (`Id_facultad`);

--
-- Indexes for table `tbl_carta_egresado`
--
ALTER TABLE `tbl_carta_egresado`
  ADD PRIMARY KEY (`Id_carta`),
  ADD KEY `FK_personas_carta_egresado` (`id_persona`) USING BTREE;

--
-- Indexes for table `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `tbl_categoria_personas`
--
ALTER TABLE `tbl_categoria_personas`
  ADD PRIMARY KEY (`id_categoria_persona`),
  ADD KEY `tbl_categoria_personas_tbl_categorias_id_categoria_fk` (`id_categoria`),
  ADD KEY `tbl_categoria_personas_tbl_personas_id_persona_fk` (`id_persona`);

--
-- Indexes for table `tbl_centros_regionales`
--
ALTER TABLE `tbl_centros_regionales`
  ADD PRIMARY KEY (`Id_centro_regional`),
  ADD KEY `FK_facultad` (`Id_facultad`);

--
-- Indexes for table `tbl_charla_practica`
--
ALTER TABLE `tbl_charla_practica`
  ADD PRIMARY KEY (`Id_charla`),
  ADD KEY `FK_personas_charla_practica` (`id_persona`);

--
-- Indexes for table `tbl_comentarios_alumnos`
--
ALTER TABLE `tbl_comentarios_alumnos`
  ADD PRIMARY KEY (`id_comentario_alumno`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `tbl_comisiones`
--
ALTER TABLE `tbl_comisiones`
  ADD PRIMARY KEY (`id_comisiones`),
  ADD KEY `Id_carrera` (`id_carrera`) USING BTREE;

--
-- Indexes for table `tbl_contactos`
--
ALTER TABLE `tbl_contactos`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `FK_personas_contactos` (`id_persona`),
  ADD KEY `FK_tipos_contactos_contacto` (`id_tipo_contacto`);

--
-- Indexes for table `tbl_contador_constancia`
--
ALTER TABLE `tbl_contador_constancia`
  ADD PRIMARY KEY (`id_contador`);

--
-- Indexes for table `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `tbl_desea_asig_doce`
--
ALTER TABLE `tbl_desea_asig_doce`
  ADD PRIMARY KEY (`id_desea_asig_doce`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `Id_asignatura` (`Id_asignatura`);

--
-- Indexes for table `tbl_desempeno_practica`
--
ALTER TABLE `tbl_desempeno_practica`
  ADD PRIMARY KEY (`id_desempeno_practica`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `tbl_dias`
--
ALTER TABLE `tbl_dias`
  ADD PRIMARY KEY (`id_dia`);

--
-- Indexes for table `tbl_dias_feriados`
--
ALTER TABLE `tbl_dias_feriados`
  ADD PRIMARY KEY (`id_dia_feriado`);

--
-- Indexes for table `tbl_docentes_proyecto`
--
ALTER TABLE `tbl_docentes_proyecto`
  ADD PRIMARY KEY (`id_docente_proyecto`),
  ADD KEY `Id_proyecto` (`Id_proyecto`);

--
-- Indexes for table `tbl_edificios`
--
ALTER TABLE `tbl_edificios`
  ADD PRIMARY KEY (`id_edificio`);

--
-- Indexes for table `tbl_egresados`
--
ALTER TABLE `tbl_egresados`
  ADD PRIMARY KEY (`Id_egresado`);

--
-- Indexes for table `tbl_empresas_practica`
--
ALTER TABLE `tbl_empresas_practica`
  ADD PRIMARY KEY (`Id_empresa`),
  ADD KEY `FK_personas_empresas_practica` (`id_persona`);

--
-- Indexes for table `tbl_empresa_aporte_proyecto`
--
ALTER TABLE `tbl_empresa_aporte_proyecto`
  ADD PRIMARY KEY (`Id_aporte`);

--
-- Indexes for table `tbl_equivalencias`
--
ALTER TABLE `tbl_equivalencias`
  ADD PRIMARY KEY (`Id_equivalencia`),
  ADD KEY `FK_personas_equivalencias` (`id_persona`);

--
-- Indexes for table `tbl_especialidad_grado`
--
ALTER TABLE `tbl_especialidad_grado`
  ADD PRIMARY KEY (`id_especialidad`),
  ADD KEY `FK_tbl_especialidad_grado_tbl_grados_academicos` (`id_grado_academico`);

--
-- Indexes for table `tbl_estadocivil`
--
ALTER TABLE `tbl_estadocivil`
  ADD PRIMARY KEY (`id_estado_civil`);

--
-- Indexes for table `tbl_estado_acta`
--
ALTER TABLE `tbl_estado_acta`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `estado` (`estado`);

--
-- Indexes for table `tbl_estado_acuerdo`
--
ALTER TABLE `tbl_estado_acuerdo`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `estado_acuerdo` (`estado_acuerdo`);

--
-- Indexes for table `tbl_estado_notificacion`
--
ALTER TABLE `tbl_estado_notificacion`
  ADD PRIMARY KEY (`id_estado_notificacion`),
  ADD UNIQUE KEY `estado` (`estado`);

--
-- Indexes for table `tbl_estado_participante`
--
ALTER TABLE `tbl_estado_participante`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `estado` (`estado`);

--
-- Indexes for table `tbl_estado_reunion`
--
ALTER TABLE `tbl_estado_reunion`
  ADD PRIMARY KEY (`id_estado_reunion`),
  ADD UNIQUE KEY `estado_reunion` (`estado_reunion`);

--
-- Indexes for table `tbl_estudiantes_proyecto`
--
ALTER TABLE `tbl_estudiantes_proyecto`
  ADD PRIMARY KEY (`Id_estudiante_proyecto`),
  ADD KEY `Id_proyecto` (`Id_proyecto`);

--
-- Indexes for table `tbl_evaluaciones_practica`
--
ALTER TABLE `tbl_evaluaciones_practica`
  ADD PRIMARY KEY (`id_evaluacion_practica`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `tbl_expe_academica_docente`
--
ALTER TABLE `tbl_expe_academica_docente`
  ADD PRIMARY KEY (`id_expe_academi_docente`),
  ADD KEY `FK_tbl_expe_academica_docente_tbl_personas` (`id_persona`),
  ADD KEY `FK_tbl_expe_academica_docente_tbl_areas` (`id_area`);

--
-- Indexes for table `tbl_facultades`
--
ALTER TABLE `tbl_facultades`
  ADD PRIMARY KEY (`Id_facultad`);

--
-- Indexes for table `tbl_feriado`
--
ALTER TABLE `tbl_feriado`
  ADD PRIMARY KEY (` id_feriado`);

--
-- Indexes for table `tbl_finalizacion_practica`
--
ALTER TABLE `tbl_finalizacion_practica`
  ADD PRIMARY KEY (`Id_finalizacion`),
  ADD KEY `FK_practica` (`Id_practica`),
  ADD KEY `FK_personas_finalizacion_practica` (`id_persona`);

--
-- Indexes for table `tbl_funciones_practica`
--
ALTER TABLE `tbl_funciones_practica`
  ADD PRIMARY KEY (`id_funcion_practica`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indexes for table `tbl_grados_academicos`
--
ALTER TABLE `tbl_grados_academicos`
  ADD PRIMARY KEY (`id_grado_academico`);

--
-- Indexes for table `tbl_grados_academicos_personas`
--
ALTER TABLE `tbl_grados_academicos_personas`
  ADD PRIMARY KEY (`id_grado_aca_personas`),
  ADD KEY `FK1id_especialidad` (`id_especialidad`),
  ADD KEY `FK2id_categoria` (`id_persona`) USING BTREE;

--
-- Indexes for table `tbl_hora`
--
ALTER TABLE `tbl_hora`
  ADD PRIMARY KEY (`hora`);

--
-- Indexes for table `tbl_horario_docentes`
--
ALTER TABLE `tbl_horario_docentes`
  ADD PRIMARY KEY (`id_horario_docente`),
  ADD KEY `tbl_horario_docentes_tbl_jornadas_id_jornada_fk` (`id_jornada`),
  ADD KEY `tbl_horario_docentes_tbl_categoria_pers_id_categoria_persona_fk` (`id_categoria_persona`),
  ADD KEY `FK_tbl_horario_docentes_tbl_personas` (`id_persona`);

--
-- Indexes for table `tbl_horario_himno`
--
ALTER TABLE `tbl_horario_himno`
  ADD PRIMARY KEY (`id_horario_himno`);

--
-- Indexes for table `tbl_jornadas`
--
ALTER TABLE `tbl_jornadas`
  ADD PRIMARY KEY (`id_jornada`);

--
-- Indexes for table `tbl_modalidad`
--
ALTER TABLE `tbl_modalidad`
  ADD PRIMARY KEY (`id_modalidad`);

--
-- Indexes for table `tbl_modalidades_proyecto`
--
ALTER TABLE `tbl_modalidades_proyecto`
  ADD PRIMARY KEY (`Id_modalidad`);

--
-- Indexes for table `tbl_municipios_hn`
--
ALTER TABLE `tbl_municipios_hn`
  ADD PRIMARY KEY (`id_municipio`) USING BTREE,
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indexes for table `tbl_nacionalidad`
--
ALTER TABLE `tbl_nacionalidad`
  ADD PRIMARY KEY (`id_nacionalidad`) USING BTREE;

--
-- Indexes for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  ADD PRIMARY KEY (`Id_objeto`);

--
-- Indexes for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  ADD PRIMARY KEY (`Id_parametro`),
  ADD KEY `FK_usuarios_parametros` (`Id_usuario`);

--
-- Indexes for table `tbl_participantes`
--
ALTER TABLE `tbl_participantes`
  ADD PRIMARY KEY (`id_participante`),
  ADD KEY `id_reunion` (`id_reunion`),
  ADD KEY `id_Docente` (`id_persona`),
  ADD KEY `id_estado_participante` (`id_estado_participante`);

--
-- Indexes for table `tbl_periodo`
--
ALTER TABLE `tbl_periodo`
  ADD PRIMARY KEY (`id_periodo`),
  ADD UNIQUE KEY `num_periodo` (`num_periodo`,`num_anno`) USING BTREE,
  ADD KEY `FK1_tbl_tipo_periodo` (`id_tipo_periodo`);

--
-- Indexes for table `tbl_periodo_plan`
--
ALTER TABLE `tbl_periodo_plan`
  ADD PRIMARY KEY (`id_periodo_plan`);

--
-- Indexes for table `tbl_permisos_usuarios`
--
ALTER TABLE `tbl_permisos_usuarios`
  ADD PRIMARY KEY (`Id_permisos_usuario`),
  ADD KEY `cod_rol` (`Id_rol`),
  ADD KEY `cod_objeto` (`Id_objeto`);

--
-- Indexes for table `tbl_personas`
--
ALTER TABLE `tbl_personas`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `FK_tbl_personas_tbl_tipo_docente` (`id_tipo_docente`),
  ADD KEY `tbl_personas_tbl_tipos_persona_id_tipo_persona_fk` (`id_tipo_persona`) USING BTREE;

--
-- Indexes for table `tbl_personas_extendidas`
--
ALTER TABLE `tbl_personas_extendidas`
  ADD PRIMARY KEY (`id_persona_ext`),
  ADD KEY `FK_tbl_personas_extendidas_tbl_atributos` (`id_atributo`),
  ADD KEY `FK_tbl_personas_extendidas_tbl_personas` (`id_persona`);

--
-- Indexes for table `tbl_plan_estudio`
--
ALTER TABLE `tbl_plan_estudio`
  ADD PRIMARY KEY (`id_plan_estudio`),
  ADD KEY `id_tipo_plan` (`id_tipo_plan`);

--
-- Indexes for table `tbl_practica_estudiantes`
--
ALTER TABLE `tbl_practica_estudiantes`
  ADD PRIMARY KEY (`Id_practica`),
  ADD KEY `cod_empresa` (`Id_empresa`),
  ADD KEY `FK_personas_practica_estudiante` (`id_persona`);

--
-- Indexes for table `tbl_practica_rechazo`
--
ALTER TABLE `tbl_practica_rechazo`
  ADD PRIMARY KEY (`id_practica_rechazo`),
  ADD KEY `FK_personas_practica_rechazada` (`id_persona`);

--
-- Indexes for table `tbl_pref_area_docen`
--
ALTER TABLE `tbl_pref_area_docen`
  ADD PRIMARY KEY (`id_pref_area_doce`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_area` (`id_area`);

--
-- Indexes for table `tbl_pref_asig_docen`
--
ALTER TABLE `tbl_pref_asig_docen`
  ADD PRIMARY KEY (`id_pref_asig_docen`),
  ADD KEY `FK_tbl_pref_asig_docen_tbl_personas` (`id_persona`),
  ADD KEY `FK_tbl_pref_asig_docen_tbl_asignaturas` (`Id_asignatura`) USING BTREE;

--
-- Indexes for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  ADD PRIMARY KEY (`Id_pregunta`);

--
-- Indexes for table `tbl_preguntas_seguridad`
--
ALTER TABLE `tbl_preguntas_seguridad`
  ADD PRIMARY KEY (`Id_pregunta_seguridad`),
  ADD KEY `cod_pregunta` (`Id_pregunta`),
  ADD KEY `FK_personas_preguntas_seguridad` (`Id_usuario`);

--
-- Indexes for table `tbl_proyectos`
--
ALTER TABLE `tbl_proyectos`
  ADD PRIMARY KEY (`Id_proyecto`),
  ADD KEY `cod_tipo_v` (`Id_tipo_v`),
  ADD KEY `cod_modalidad` (`Id_modalidad`),
  ADD KEY `Id_tipo_formalizacion` (`Id_tipo_formalizacion`),
  ADD KEY `Id_aporte` (`Id_aporte`),
  ADD KEY `FK_tbl_proyectos_tbl_departamentos` (`departamento_pais`),
  ADD KEY `FK_tbl_proyectos_tbl_municipios_hn` (`municipio`),
  ADD KEY `FK_tbl_proyectos_tbl_aldeas_caserios_hn` (`aldea_caserio`);

--
-- Indexes for table `tbl_requisito_asignatura`
--
ALTER TABLE `tbl_requisito_asignatura`
  ADD PRIMARY KEY (`id_requisito_asig`),
  ADD KEY `id_asignatura` (`Id_asignatura`);

--
-- Indexes for table `tbl_reunion`
--
ALTER TABLE `tbl_reunion`
  ADD PRIMARY KEY (`id_reunion`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indexes for table `tbl_reunion_notificacion`
--
ALTER TABLE `tbl_reunion_notificacion`
  ADD PRIMARY KEY (`id_reunion_notificacion`),
  ADD KEY `id_reunion` (`id_reunion`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indexes for table `tbl_subida_documentacion`
--
ALTER TABLE `tbl_subida_documentacion`
  ADD PRIMARY KEY (`Id_subida`),
  ADD KEY `FK_personas_subida_documento` (`id_persona`);

--
-- Indexes for table `tbl_tipos_persona`
--
ALTER TABLE `tbl_tipos_persona`
  ADD PRIMARY KEY (`id_tipo_persona`);

--
-- Indexes for table `tbl_tipos_vinculacion`
--
ALTER TABLE `tbl_tipos_vinculacion`
  ADD PRIMARY KEY (`Id_tipo_v`);

--
-- Indexes for table `tbl_tipo_asignatura`
--
ALTER TABLE `tbl_tipo_asignatura`
  ADD PRIMARY KEY (`id_tipo_asignatura`);

--
-- Indexes for table `tbl_tipo_aula`
--
ALTER TABLE `tbl_tipo_aula`
  ADD PRIMARY KEY (`id_tipo_aula`);

--
-- Indexes for table `tbl_tipo_contactos`
--
ALTER TABLE `tbl_tipo_contactos`
  ADD PRIMARY KEY (`id_tipo_contacto`);

--
-- Indexes for table `tbl_tipo_docente`
--
ALTER TABLE `tbl_tipo_docente`
  ADD PRIMARY KEY (`id_tipo_docente`);

--
-- Indexes for table `tbl_tipo_formalizacion_proyecto`
--
ALTER TABLE `tbl_tipo_formalizacion_proyecto`
  ADD PRIMARY KEY (`Id_tipo_formalizacion`);

--
-- Indexes for table `tbl_tipo_periodo`
--
ALTER TABLE `tbl_tipo_periodo`
  ADD PRIMARY KEY (`id_tipo_periodo`);

--
-- Indexes for table `tbl_tipo_plan`
--
ALTER TABLE `tbl_tipo_plan`
  ADD PRIMARY KEY (`id_tipo_plan`);

--
-- Indexes for table `tbl_tipo_recurso`
--
ALTER TABLE `tbl_tipo_recurso`
  ADD PRIMARY KEY (`id_recurso`);

--
-- Indexes for table `tbl_tipo_reunion_acta`
--
ALTER TABLE `tbl_tipo_reunion_acta`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indexes for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `FK_personas_usuarios` (`id_persona`),
  ADD KEY `FK_rol_usuarios` (`Id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_acta`
--
ALTER TABLE `tbl_acta`
  MODIFY `id_acta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_acta_recursos`
--
ALTER TABLE `tbl_acta_recursos`
  MODIFY `id_recursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_actividades`
--
ALTER TABLE `tbl_actividades`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_actividades_persona`
--
ALTER TABLE `tbl_actividades_persona`
  MODIFY `id_act_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `tbl_acuerdos`
--
ALTER TABLE `tbl_acuerdos`
  MODIFY `id_acuerdo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_aldeas_caserios_hn`
--
ALTER TABLE `tbl_aldeas_caserios_hn`
  MODIFY `id_aldea_caserio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1920;

--
-- AUTO_INCREMENT for table `tbl_alumnos_himno`
--
ALTER TABLE `tbl_alumnos_himno`
  MODIFY `Id_himno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_areas`
--
ALTER TABLE `tbl_areas`
  MODIFY `id_area` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_asignaturas`
--
ALTER TABLE `tbl_asignaturas`
  MODIFY `Id_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tbl_asignaturas_aprobadas`
--
ALTER TABLE `tbl_asignaturas_aprobadas`
  MODIFY `Id_asignatura_aprobada` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_atributos`
--
ALTER TABLE `tbl_atributos`
  MODIFY `id_atributos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_aula`
--
ALTER TABLE `tbl_aula`
  MODIFY `id_aula` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `Id_bitacora` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5979;

--
-- AUTO_INCREMENT for table `tbl_cambio_carrera`
--
ALTER TABLE `tbl_cambio_carrera`
  MODIFY `Id_cambio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tbl_cancelar_clases`
--
ALTER TABLE `tbl_cancelar_clases`
  MODIFY `Id_cancelar_clases` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_carga_academica`
--
ALTER TABLE `tbl_carga_academica`
  MODIFY `id_carga_academica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;

--
-- AUTO_INCREMENT for table `tbl_carga_dias`
--
ALTER TABLE `tbl_carga_dias`
  MODIFY `id_carga_academica` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_carta_egresado`
--
ALTER TABLE `tbl_carta_egresado`
  MODIFY `Id_carta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  MODIFY `id_categoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_categoria_personas`
--
ALTER TABLE `tbl_categoria_personas`
  MODIFY `id_categoria_persona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `tbl_centros_regionales`
--
ALTER TABLE `tbl_centros_regionales`
  MODIFY `Id_centro_regional` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_charla_practica`
--
ALTER TABLE `tbl_charla_practica`
  MODIFY `Id_charla` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_comentarios_alumnos`
--
ALTER TABLE `tbl_comentarios_alumnos`
  MODIFY `id_comentario_alumno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_comisiones`
--
ALTER TABLE `tbl_comisiones`
  MODIFY `id_comisiones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_contactos`
--
ALTER TABLE `tbl_contactos`
  MODIFY `id_contacto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `tbl_contador_constancia`
--
ALTER TABLE `tbl_contador_constancia`
  MODIFY `id_contador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `id_departamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_desea_asig_doce`
--
ALTER TABLE `tbl_desea_asig_doce`
  MODIFY `id_desea_asig_doce` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_desempeno_practica`
--
ALTER TABLE `tbl_desempeno_practica`
  MODIFY `id_desempeno_practica` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_dias_feriados`
--
ALTER TABLE `tbl_dias_feriados`
  MODIFY `id_dia_feriado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_docentes_proyecto`
--
ALTER TABLE `tbl_docentes_proyecto`
  MODIFY `id_docente_proyecto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_edificios`
--
ALTER TABLE `tbl_edificios`
  MODIFY `id_edificio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_egresados`
--
ALTER TABLE `tbl_egresados`
  MODIFY `Id_egresado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_empresas_practica`
--
ALTER TABLE `tbl_empresas_practica`
  MODIFY `Id_empresa` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_empresa_aporte_proyecto`
--
ALTER TABLE `tbl_empresa_aporte_proyecto`
  MODIFY `Id_aporte` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_equivalencias`
--
ALTER TABLE `tbl_equivalencias`
  MODIFY `Id_equivalencia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_especialidad_grado`
--
ALTER TABLE `tbl_especialidad_grado`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `tbl_estadocivil`
--
ALTER TABLE `tbl_estadocivil`
  MODIFY `id_estado_civil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_estado_acta`
--
ALTER TABLE `tbl_estado_acta`
  MODIFY `id_estado` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_estado_acuerdo`
--
ALTER TABLE `tbl_estado_acuerdo`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_estado_notificacion`
--
ALTER TABLE `tbl_estado_notificacion`
  MODIFY `id_estado_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_estado_participante`
--
ALTER TABLE `tbl_estado_participante`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_estado_reunion`
--
ALTER TABLE `tbl_estado_reunion`
  MODIFY `id_estado_reunion` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_estudiantes_proyecto`
--
ALTER TABLE `tbl_estudiantes_proyecto`
  MODIFY `Id_estudiante_proyecto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_evaluaciones_practica`
--
ALTER TABLE `tbl_evaluaciones_practica`
  MODIFY `id_evaluacion_practica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expe_academica_docente`
--
ALTER TABLE `tbl_expe_academica_docente`
  MODIFY `id_expe_academi_docente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_facultades`
--
ALTER TABLE `tbl_facultades`
  MODIFY `Id_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_feriado`
--
ALTER TABLE `tbl_feriado`
  MODIFY ` id_feriado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_finalizacion_practica`
--
ALTER TABLE `tbl_finalizacion_practica`
  MODIFY `Id_finalizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tbl_funciones_practica`
--
ALTER TABLE `tbl_funciones_practica`
  MODIFY `id_funcion_practica` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_grados_academicos`
--
ALTER TABLE `tbl_grados_academicos`
  MODIFY `id_grado_academico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_grados_academicos_personas`
--
ALTER TABLE `tbl_grados_academicos_personas`
  MODIFY `id_grado_aca_personas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `tbl_horario_docentes`
--
ALTER TABLE `tbl_horario_docentes`
  MODIFY `id_horario_docente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `tbl_horario_himno`
--
ALTER TABLE `tbl_horario_himno`
  MODIFY `id_horario_himno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_jornadas`
--
ALTER TABLE `tbl_jornadas`
  MODIFY `id_jornada` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_modalidad`
--
ALTER TABLE `tbl_modalidad`
  MODIFY `id_modalidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_modalidades_proyecto`
--
ALTER TABLE `tbl_modalidades_proyecto`
  MODIFY `Id_modalidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_municipios_hn`
--
ALTER TABLE `tbl_municipios_hn`
  MODIFY `id_municipio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `tbl_nacionalidad`
--
ALTER TABLE `tbl_nacionalidad`
  MODIFY `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `tbl_objetos`
--
ALTER TABLE `tbl_objetos`
  MODIFY `Id_objeto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  MODIFY `Id_parametro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_participantes`
--
ALTER TABLE `tbl_participantes`
  MODIFY `id_participante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `tbl_periodo`
--
ALTER TABLE `tbl_periodo`
  MODIFY `id_periodo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_periodo_plan`
--
ALTER TABLE `tbl_periodo_plan`
  MODIFY `id_periodo_plan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_permisos_usuarios`
--
ALTER TABLE `tbl_permisos_usuarios`
  MODIFY `Id_permisos_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `tbl_personas`
--
ALTER TABLE `tbl_personas`
  MODIFY `id_persona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `tbl_personas_extendidas`
--
ALTER TABLE `tbl_personas_extendidas`
  MODIFY `id_persona_ext` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT for table `tbl_plan_estudio`
--
ALTER TABLE `tbl_plan_estudio`
  MODIFY `id_plan_estudio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_practica_estudiantes`
--
ALTER TABLE `tbl_practica_estudiantes`
  MODIFY `Id_practica` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_practica_rechazo`
--
ALTER TABLE `tbl_practica_rechazo`
  MODIFY `id_practica_rechazo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pref_area_docen`
--
ALTER TABLE `tbl_pref_area_docen`
  MODIFY `id_pref_area_doce` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pref_asig_docen`
--
ALTER TABLE `tbl_pref_asig_docen`
  MODIFY `id_pref_asig_docen` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_preguntas`
--
ALTER TABLE `tbl_preguntas`
  MODIFY `Id_pregunta` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_preguntas_seguridad`
--
ALTER TABLE `tbl_preguntas_seguridad`
  MODIFY `Id_pregunta_seguridad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `tbl_proyectos`
--
ALTER TABLE `tbl_proyectos`
  MODIFY `Id_proyecto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_requisito_asignatura`
--
ALTER TABLE `tbl_requisito_asignatura`
  MODIFY `id_requisito_asig` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_reunion`
--
ALTER TABLE `tbl_reunion`
  MODIFY `id_reunion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_reunion_notificacion`
--
ALTER TABLE `tbl_reunion_notificacion`
  MODIFY `id_reunion_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `Id_rol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_subida_documentacion`
--
ALTER TABLE `tbl_subida_documentacion`
  MODIFY `Id_subida` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tipos_vinculacion`
--
ALTER TABLE `tbl_tipos_vinculacion`
  MODIFY `Id_tipo_v` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_tipo_asignatura`
--
ALTER TABLE `tbl_tipo_asignatura`
  MODIFY `id_tipo_asignatura` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_tipo_contactos`
--
ALTER TABLE `tbl_tipo_contactos`
  MODIFY `id_tipo_contacto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_tipo_docente`
--
ALTER TABLE `tbl_tipo_docente`
  MODIFY `id_tipo_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_tipo_formalizacion_proyecto`
--
ALTER TABLE `tbl_tipo_formalizacion_proyecto`
  MODIFY `Id_tipo_formalizacion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_tipo_periodo`
--
ALTER TABLE `tbl_tipo_periodo`
  MODIFY `id_tipo_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_tipo_plan`
--
ALTER TABLE `tbl_tipo_plan`
  MODIFY `id_tipo_plan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_tipo_recurso`
--
ALTER TABLE `tbl_tipo_recurso`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_tipo_reunion_acta`
--
ALTER TABLE `tbl_tipo_reunion_acta`
  MODIFY `id_tipo` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `Id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_acta`
--
ALTER TABLE `tbl_acta`
  ADD CONSTRAINT `tbl_acta_ibfk_10` FOREIGN KEY (`redactor`) REFERENCES `tbl_usuarios` (`Id_usuario`),
  ADD CONSTRAINT `tbl_acta_ibfk_7` FOREIGN KEY (`id_reunion`) REFERENCES `tbl_reunion` (`id_reunion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_acta_ibfk_8` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado_acta` (`id_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_acta_ibfk_9` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo_reunion_acta` (`id_tipo`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_acta_recursos`
--
ALTER TABLE `tbl_acta_recursos`
  ADD CONSTRAINT `tbl_acta_recursos_ibfk_3` FOREIGN KEY (`id_acta`) REFERENCES `tbl_acta` (`id_acta`),
  ADD CONSTRAINT `tbl_acta_recursos_ibfk_5` FOREIGN KEY (`redactor`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_actividades`
--
ALTER TABLE `tbl_actividades`
  ADD CONSTRAINT `FK_tbl_actividades_tbl_comisones` FOREIGN KEY (`id_comisiones`) REFERENCES `tbl_comisiones` (`id_comisiones`);

--
-- Constraints for table `tbl_actividades_persona`
--
ALTER TABLE `tbl_actividades_persona`
  ADD CONSTRAINT `FK_tbl_actividades_persona_tbl_actividades` FOREIGN KEY (`id_actividad`) REFERENCES `tbl_actividades` (`id_actividad`),
  ADD CONSTRAINT `FK_tbl_actividades_persona_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_acuerdos`
--
ALTER TABLE `tbl_acuerdos`
  ADD CONSTRAINT `tbl_acuerdos_ibfk_1` FOREIGN KEY (`id_acta`) REFERENCES `tbl_acta` (`id_acta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_acuerdos_ibfk_5` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado_acuerdo` (`id_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_acuerdos_ibfk_6` FOREIGN KEY (`id_participante`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_aldeas_caserios_hn`
--
ALTER TABLE `tbl_aldeas_caserios_hn`
  ADD CONSTRAINT `FK_tbl_aldeas_caserios_hn_tbl_municipios_hn` FOREIGN KEY (`id_municipio`) REFERENCES `tbl_municipios_hn` (`id_municipio`);

--
-- Constraints for table `tbl_alumnos_himno`
--
ALTER TABLE `tbl_alumnos_himno`
  ADD CONSTRAINT `FK_personas_alumnos_himno` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`),
  ADD CONSTRAINT `horario_himno` FOREIGN KEY (`id_horario_himno`) REFERENCES `tbl_horario_himno` (`id_horario_himno`);

--
-- Constraints for table `tbl_areas`
--
ALTER TABLE `tbl_areas`
  ADD CONSTRAINT `FK_tbl_areas_tbl_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `tbl_carrera` (`id_carrera`);

--
-- Constraints for table `tbl_asignaturas`
--
ALTER TABLE `tbl_asignaturas`
  ADD CONSTRAINT `FK_tbl_asignaturas_tbl_areas` FOREIGN KEY (`id_area`) REFERENCES `tbl_areas` (`id_area`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_asignaturas_tbl_periodo_plan` FOREIGN KEY (`id_periodo_plan`) REFERENCES `tbl_periodo_plan` (`id_periodo_plan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_asignaturas_tbl_plan_estudio` FOREIGN KEY (`id_plan_estudio`) REFERENCES `tbl_plan_estudio` (`id_plan_estudio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_asignaturas_tbl_tipo_asignatura` FOREIGN KEY (`id_tipo_asignatura`) REFERENCES `tbl_tipo_asignatura` (`id_tipo_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_asignaturas_aprobadas`
--
ALTER TABLE `tbl_asignaturas_aprobadas`
  ADD CONSTRAINT `FK__tbl_asignaturas` FOREIGN KEY (`Id_asignatura`) REFERENCES `tbl_asignaturas` (`Id_asignatura`),
  ADD CONSTRAINT `FK__tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_atributos`
--
ALTER TABLE `tbl_atributos`
  ADD CONSTRAINT `FK1id_tipo_persona` FOREIGN KEY (`id_tipo_persona`) REFERENCES `tbl_tipos_persona` (`id_tipo_persona`);

--
-- Constraints for table `tbl_aula`
--
ALTER TABLE `tbl_aula`
  ADD CONSTRAINT `FK_tbl_aula_tbl_edificio` FOREIGN KEY (`id_edificio`) REFERENCES `tbl_edificios` (`id_edificio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_aula_tbl_tipo_aula` FOREIGN KEY (`id_tipo_aula`) REFERENCES `tbl_tipo_aula` (`id_tipo_aula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bitacora_ibfk_2` FOREIGN KEY (`Id_objeto`) REFERENCES `tbl_objetos` (`Id_objeto`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_carga_academica`
--
ALTER TABLE `tbl_carga_academica`
  ADD CONSTRAINT `FK_tbl_carga_academica_tbl_asignaturas` FOREIGN KEY (`id_asignatura`) REFERENCES `tbl_asignaturas` (`Id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_carga_academica_tbl_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `tbl_periodo` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_carga_academica_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_carga_tbl_aula` FOREIGN KEY (`id_aula`) REFERENCES `tbl_aula` (`id_aula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_hora_final` FOREIGN KEY (`hora_final`) REFERENCES `tbl_hora` (`hora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_hora_inicial` FOREIGN KEY (`hora_inicial`) REFERENCES `tbl_hora` (`hora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `tbl_modalidad` (`id_modalidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_carga_dias`
--
ALTER TABLE `tbl_carga_dias`
  ADD CONSTRAINT `id_carga_academica` FOREIGN KEY (`id_carga_academica`) REFERENCES `tbl_carga_academica` (`id_carga_academica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_dia` FOREIGN KEY (`id_dia`) REFERENCES `tbl_dias` (`id_dia`);

--
-- Constraints for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD CONSTRAINT `FK__tbl_facultades` FOREIGN KEY (`Id_facultad`) REFERENCES `tbl_facultades` (`Id_facultad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_categoria_personas`
--
ALTER TABLE `tbl_categoria_personas`
  ADD CONSTRAINT `tbl_categoria_personas_tbl_categorias_id_categoria_fk` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_categoria_personas_tbl_personas_id_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_charla_practica`
--
ALTER TABLE `tbl_charla_practica`
  ADD CONSTRAINT `FK_tbl_charla_practica_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_comentarios_alumnos`
--
ALTER TABLE `tbl_comentarios_alumnos`
  ADD CONSTRAINT `personas_comentarios` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_comisiones`
--
ALTER TABLE `tbl_comisiones`
  ADD CONSTRAINT `FK_tbl_comisiones_tbl_carrera` FOREIGN KEY (`id_carrera`) REFERENCES `tbl_carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_contactos`
--
ALTER TABLE `tbl_contactos`
  ADD CONSTRAINT `FK_personas_contactos` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`),
  ADD CONSTRAINT `FK_tipo_contactos` FOREIGN KEY (`id_tipo_contacto`) REFERENCES `tbl_tipo_contactos` (`id_tipo_contacto`);

--
-- Constraints for table `tbl_desea_asig_doce`
--
ALTER TABLE `tbl_desea_asig_doce`
  ADD CONSTRAINT `FK_tbl_desea_asig_doce_tbl_asignaturas` FOREIGN KEY (`Id_asignatura`) REFERENCES `tbl_asignaturas` (`Id_asignatura`),
  ADD CONSTRAINT `FK_tbl_desea_asig_doce_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_desempeno_practica`
--
ALTER TABLE `tbl_desempeno_practica`
  ADD CONSTRAINT `personas_desempeno` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_especialidad_grado`
--
ALTER TABLE `tbl_especialidad_grado`
  ADD CONSTRAINT `FK_tbl_especialidad_grado_tbl_grados_academicos` FOREIGN KEY (`id_grado_academico`) REFERENCES `tbl_grados_academicos` (`id_grado_academico`);

--
-- Constraints for table `tbl_estudiantes_proyecto`
--
ALTER TABLE `tbl_estudiantes_proyecto`
  ADD CONSTRAINT `FK_tbl_estudiantes_proyecto_tbl_proyectos` FOREIGN KEY (`Id_proyecto`) REFERENCES `tbl_proyectos` (`Id_proyecto`);

--
-- Constraints for table `tbl_evaluaciones_practica`
--
ALTER TABLE `tbl_evaluaciones_practica`
  ADD CONSTRAINT `personas_evaluaciones` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_expe_academica_docente`
--
ALTER TABLE `tbl_expe_academica_docente`
  ADD CONSTRAINT `FK_tbl_expe_academica_docente_tbl_areas` FOREIGN KEY (`id_area`) REFERENCES `tbl_areas` (`id_area`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_expe_academica_docente_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_funciones_practica`
--
ALTER TABLE `tbl_funciones_practica`
  ADD CONSTRAINT `personas_funciones` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_grados_academicos_personas`
--
ALTER TABLE `tbl_grados_academicos_personas`
  ADD CONSTRAINT `FK1id_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `tbl_especialidad_grado` (`id_especialidad`),
  ADD CONSTRAINT `FK_tbl_grados_academicos_personas_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_horario_docentes`
--
ALTER TABLE `tbl_horario_docentes`
  ADD CONSTRAINT `FK_tbl_horario_docentes_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_horario_docentes_tbl_categoria_pers_id_categoria_persona_fk` FOREIGN KEY (`id_categoria_persona`) REFERENCES `tbl_categoria_personas` (`id_categoria_persona`),
  ADD CONSTRAINT `tbl_horario_docentes_tbl_jornadas_id_jornada_fk` FOREIGN KEY (`id_jornada`) REFERENCES `tbl_jornadas` (`id_jornada`);

--
-- Constraints for table `tbl_municipios_hn`
--
ALTER TABLE `tbl_municipios_hn`
  ADD CONSTRAINT `FK_tbl_municipios_hn_tbl_departamentos` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamentos` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_parametros`
--
ALTER TABLE `tbl_parametros`
  ADD CONSTRAINT `tbl_parametros_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `tbl_usuarios` (`Id_usuario`);

--
-- Constraints for table `tbl_participantes`
--
ALTER TABLE `tbl_participantes`
  ADD CONSTRAINT `tbl_participantes_ibfk_4` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_participantes_ibfk_5` FOREIGN KEY (`id_estado_participante`) REFERENCES `tbl_estado_participante` (`id_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_participantes_ibfk_6` FOREIGN KEY (`id_reunion`) REFERENCES `tbl_reunion` (`id_reunion`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_periodo`
--
ALTER TABLE `tbl_periodo`
  ADD CONSTRAINT `FK1_tbl_tipo_periodo` FOREIGN KEY (`id_tipo_periodo`) REFERENCES `tbl_tipo_periodo` (`id_tipo_periodo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_permisos_usuarios`
--
ALTER TABLE `tbl_permisos_usuarios`
  ADD CONSTRAINT `tbl_permisos_usuarios_ibfk_1` FOREIGN KEY (`Id_objeto`) REFERENCES `tbl_objetos` (`Id_objeto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_permisos_usuarios_ibfk_2` FOREIGN KEY (`Id_rol`) REFERENCES `tbl_roles` (`Id_rol`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_personas`
--
ALTER TABLE `tbl_personas`
  ADD CONSTRAINT `FK_tbl_personas_tbl_tipo_docente` FOREIGN KEY (`id_tipo_docente`) REFERENCES `tbl_tipo_docente` (`id_tipo_docente`),
  ADD CONSTRAINT `FK_tbl_personas_tbl_tipos_persona` FOREIGN KEY (`id_tipo_persona`) REFERENCES `tbl_tipos_persona` (`id_tipo_persona`),
  ADD CONSTRAINT `tbl_personas_tbl_tipos_persona_id_tipo_persona_fk` FOREIGN KEY (`id_tipo_persona`) REFERENCES `tbl_tipos_persona` (`id_tipo_persona`);

--
-- Constraints for table `tbl_personas_extendidas`
--
ALTER TABLE `tbl_personas_extendidas`
  ADD CONSTRAINT `FK_tbl_personas_extendidas_tbl_atributos` FOREIGN KEY (`id_atributo`) REFERENCES `tbl_atributos` (`id_atributos`),
  ADD CONSTRAINT `FK_tbl_personas_extendidas_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_plan_estudio`
--
ALTER TABLE `tbl_plan_estudio`
  ADD CONSTRAINT `FK_tbl_plan_estudio_tbl_tipo_plan` FOREIGN KEY (`id_tipo_plan`) REFERENCES `tbl_tipo_plan` (`id_tipo_plan`);

--
-- Constraints for table `tbl_pref_area_docen`
--
ALTER TABLE `tbl_pref_area_docen`
  ADD CONSTRAINT `FK_tbl_pref_area_docen_tbl_areas` FOREIGN KEY (`id_area`) REFERENCES `tbl_areas` (`id_area`),
  ADD CONSTRAINT `FK_tbl_pref_area_docen_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

--
-- Constraints for table `tbl_pref_asig_docen`
--
ALTER TABLE `tbl_pref_asig_docen`
  ADD CONSTRAINT `FK_tbl_pref_asig_docen_tbl_asignaturas` FOREIGN KEY (`Id_asignatura`) REFERENCES `tbl_asignaturas` (`Id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tbl_pref_asig_docen_tbl_personas` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_proyectos`
--
ALTER TABLE `tbl_proyectos`
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_aldeas_caserios_hn` FOREIGN KEY (`aldea_caserio`) REFERENCES `tbl_aldeas_caserios_hn` (`id_aldea_caserio`),
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_departamentos` FOREIGN KEY (`departamento_pais`) REFERENCES `tbl_departamentos` (`id_departamento`),
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_empresa_aporte_proyecto` FOREIGN KEY (`Id_aporte`) REFERENCES `tbl_empresa_aporte_proyecto` (`Id_aporte`),
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_modalidades_proyecto` FOREIGN KEY (`Id_modalidad`) REFERENCES `tbl_modalidades_proyecto` (`Id_modalidad`),
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_municipios_hn` FOREIGN KEY (`municipio`) REFERENCES `tbl_municipios_hn` (`id_municipio`),
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_tipo_formalizacion_proyecto` FOREIGN KEY (`Id_tipo_formalizacion`) REFERENCES `tbl_tipo_formalizacion_proyecto` (`Id_tipo_formalizacion`),
  ADD CONSTRAINT `FK_tbl_proyectos_tbl_tipos_vinculacion` FOREIGN KEY (`Id_tipo_v`) REFERENCES `tbl_tipos_vinculacion` (`Id_tipo_v`);

--
-- Constraints for table `tbl_requisito_asignatura`
--
ALTER TABLE `tbl_requisito_asignatura`
  ADD CONSTRAINT `FK_tbl_requisito_asignatura_tbl_asignaturas` FOREIGN KEY (`Id_asignatura`) REFERENCES `tbl_asignaturas` (`Id_asignatura`);

--
-- Constraints for table `tbl_reunion`
--
ALTER TABLE `tbl_reunion`
  ADD CONSTRAINT `tbl_reunion_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado_reunion` (`id_estado_reunion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reunion_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo_reunion_acta` (`id_tipo`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_reunion_notificacion`
--
ALTER TABLE `tbl_reunion_notificacion`
  ADD CONSTRAINT `tbl_reunion_notificacion_ibfk_1` FOREIGN KEY (`id_reunion`) REFERENCES `tbl_reunion` (`id_reunion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reunion_notificacion_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado_notificacion` (`id_estado_notificacion`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `FK_tbl_usuarios_tbl_roles` FOREIGN KEY (`Id_rol`) REFERENCES `tbl_roles` (`Id_rol`),
  ADD CONSTRAINT `FKpersonas_usuario` FOREIGN KEY (`id_persona`) REFERENCES `tbl_personas` (`id_persona`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `ACTUALIZAR_ESTADO_FINALIZADO` ON SCHEDULE EVERY 2 SECOND STARTS '2021-06-06 18:02:49' ON COMPLETION PRESERVE ENABLE DO UPDATE tbl_reunion
SET
    id_estado = 4
WHERE
(id_estado <> 4) AND
((SELECT CURRENT_DATE() > fecha) OR (SELECT CURRENT_DATE() = fecha) ) 
AND  (SELECT CURRENT_TIME() > hora_final)$$

CREATE DEFINER=`root`@`localhost` EVENT `ACTUALIZAR_ESTADO_EN_CURSO` ON SCHEDULE EVERY 1 SECOND STARTS '2021-06-06 17:56:08' ON COMPLETION PRESERVE ENABLE DO UPDATE tbl_reunion
SET
    id_estado = 3
WHERE
(id_estado <> 3) AND 
((SELECT CURRENT_TIME > hora_inicio) AND   
(SELECT CURRENT_TIME() < hora_final)) AND (SELECT CURRENT_DATE = fecha)$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
