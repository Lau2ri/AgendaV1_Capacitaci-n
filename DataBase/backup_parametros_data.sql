--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-12-21 15:43:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 14 (class 2615 OID 45932)
-- Name: parametros; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA parametros;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 508 (class 1259 OID 524010)
-- Name: area_tipo; Type: TABLE; Schema: parametros; Owner: -
--

CREATE TABLE parametros.area_tipo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(100),
    codigo_abreviacion character varying(20),
    activo boolean NOT NULL,
    numero_orden numeric(5,2),
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL
);


--
-- TOC entry 6859 (class 0 OID 0)
-- Dependencies: 508
-- Name: TABLE area_tipo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON TABLE parametros.area_tipo IS 'Tabla que parametriza diferentes areas generales a las que pertenecen un conjunto de tipos de parámetros. Ejemplo: tipo_unidad, area_conocimiento, clasificacion_ciiu';


--
-- TOC entry 6860 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.id IS 'Identificador unico de la tabla area_tipo';


--
-- TOC entry 6861 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.nombre; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.nombre IS 'Campo obligatorio de la tabla que indica el nombre del area';


--
-- TOC entry 6862 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.descripcion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.descripcion IS 'Campo en el que se puede registrar una descripcion de la informacion del area';


--
-- TOC entry 6863 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.codigo_abreviacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';


--
-- TOC entry 6864 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.activo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';


--
-- TOC entry 6865 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.numero_orden; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';


--
-- TOC entry 6866 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.fecha_creacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';


--
-- TOC entry 6867 (class 0 OID 0)
-- Dependencies: 508
-- Name: COLUMN area_tipo.fecha_modificacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.area_tipo.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';


--
-- TOC entry 507 (class 1259 OID 524008)
-- Name: area_tipo_id_seq; Type: SEQUENCE; Schema: parametros; Owner: -
--

CREATE SEQUENCE parametros.area_tipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6868 (class 0 OID 0)
-- Dependencies: 507
-- Name: area_tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: parametros; Owner: -
--

ALTER SEQUENCE parametros.area_tipo_id_seq OWNED BY parametros.area_tipo.id;


--
-- TOC entry 512 (class 1259 OID 524026)
-- Name: parametro; Type: TABLE; Schema: parametros; Owner: -
--

CREATE TABLE parametros.parametro (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(150),
    codigo_abreviacion character varying(20),
    activo boolean NOT NULL,
    numero_orden numeric(5,2),
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL,
    tipo_parametro_id integer NOT NULL,
    parametro_padre_id integer
);


--
-- TOC entry 6869 (class 0 OID 0)
-- Dependencies: 512
-- Name: TABLE parametro; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON TABLE parametros.parametro IS 'Tabla que registra los diferentes parámetros. Ejemplo: salario_minimo, punto_salarial.';


--
-- TOC entry 6870 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.id IS 'Identificador unico de la tabla parametro';


--
-- TOC entry 6871 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.nombre; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.nombre IS 'Campo obligatorio de la tabla que indica el nombre del parametro.';


--
-- TOC entry 6872 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.descripcion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.descripcion IS 'Campo en el que se puede registrar una descripcion de la informacion del parametro.';


--
-- TOC entry 6873 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.codigo_abreviacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';


--
-- TOC entry 6874 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.activo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';


--
-- TOC entry 6875 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.numero_orden; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';


--
-- TOC entry 6876 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.fecha_creacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';


--
-- TOC entry 6877 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.fecha_modificacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';


--
-- TOC entry 6878 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.tipo_parametro_id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.tipo_parametro_id IS 'Referencia foranea a la tabla tipo_parametro que almacena un identificador que engloba un conjunto de parámetros';


--
-- TOC entry 6879 (class 0 OID 0)
-- Dependencies: 512
-- Name: COLUMN parametro.parametro_padre_id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro.parametro_padre_id IS 'Referencia foranea al id del párametro padre que se almacena en la misma tabla';


--
-- TOC entry 511 (class 1259 OID 524024)
-- Name: parametro_id_seq; Type: SEQUENCE; Schema: parametros; Owner: -
--

CREATE SEQUENCE parametros.parametro_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6880 (class 0 OID 0)
-- Dependencies: 511
-- Name: parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: parametros; Owner: -
--

ALTER SEQUENCE parametros.parametro_id_seq OWNED BY parametros.parametro.id;


--
-- TOC entry 538 (class 1259 OID 524353)
-- Name: parametro_periodo; Type: TABLE; Schema: parametros; Owner: -
--

CREATE TABLE parametros.parametro_periodo (
    id integer NOT NULL,
    parametro_id integer NOT NULL,
    periodo_id integer NOT NULL,
    valor json,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL,
    activo boolean NOT NULL
);


--
-- TOC entry 6881 (class 0 OID 0)
-- Dependencies: 538
-- Name: TABLE parametro_periodo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON TABLE parametros.parametro_periodo IS 'Tabla que refleja la relación entre los parámetros y su periodo';


--
-- TOC entry 6882 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.id IS 'Identificador unico de la tabla periodo_parametro.';


--
-- TOC entry 6883 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.parametro_id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.parametro_id IS 'Referencia foranea a la tabla parametro que almacena cada párametro';


--
-- TOC entry 6884 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.periodo_id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.periodo_id IS 'Referencia foranea a la tabla periodo que almacena la vigencia de cada párametro';


--
-- TOC entry 6885 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.valor; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.valor IS 'Objeto que representa el conjunto de valores que pueden estar asociados a un parámetro. Ej: Porcentaje impuesto, salario mínimo, etc.';


--
-- TOC entry 6886 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.fecha_creacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';


--
-- TOC entry 6887 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.fecha_modificacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';


--
-- TOC entry 6888 (class 0 OID 0)
-- Dependencies: 538
-- Name: COLUMN parametro_periodo.activo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.parametro_periodo.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';


--
-- TOC entry 537 (class 1259 OID 524351)
-- Name: parametro_periodo_id_seq; Type: SEQUENCE; Schema: parametros; Owner: -
--

CREATE SEQUENCE parametros.parametro_periodo_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6889 (class 0 OID 0)
-- Dependencies: 537
-- Name: parametro_periodo_id_seq; Type: SEQUENCE OWNED BY; Schema: parametros; Owner: -
--

ALTER SEQUENCE parametros.parametro_periodo_id_seq OWNED BY parametros.parametro_periodo.id;


--
-- TOC entry 514 (class 1259 OID 524034)
-- Name: periodo; Type: TABLE; Schema: parametros; Owner: -
--

CREATE TABLE parametros.periodo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(100),
    year numeric(4,0),
    ciclo character varying(4),
    codigo_abreviacion character varying(20),
    activo boolean NOT NULL,
    aplicacion_id integer NOT NULL,
    inicio_vigencia timestamp without time zone NOT NULL,
    fin_vigencia timestamp without time zone NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL
);


--
-- TOC entry 6890 (class 0 OID 0)
-- Dependencies: 514
-- Name: TABLE periodo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON TABLE parametros.periodo IS 'Tabla que parametriza los diferentes tipos de periodo asociados a un negocio/aplicacion y al parametro determinado.';


--
-- TOC entry 6891 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.id IS 'Identificador unico de la tabla periodo.';


--
-- TOC entry 6892 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.nombre; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.nombre IS 'Campo obligatorio de la tabla que indica el nombre del periodo.';


--
-- TOC entry 6893 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.descripcion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.descripcion IS 'Campo en el que se puede registrar una descripcion de la informacion del periodo.';


--
-- TOC entry 6894 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.year; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.year IS 'Campo que indica el año para el cual es vigente el periodo.';


--
-- TOC entry 6895 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.ciclo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.ciclo IS 'Campo que permite llevar un control de los diferentes periodos que puede tener un año para determiando negocio EJ: Periodos academicos 2020-1, 2020-2, 2020-3.';


--
-- TOC entry 6896 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.codigo_abreviacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';


--
-- TOC entry 6897 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.activo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';


--
-- TOC entry 6898 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.aplicacion_id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.aplicacion_id IS 'Identificador unico de la tabla aplicacion del esquema configuracion, define el contexto y el negocio en el que se usa el periodo de vigencia.';


--
-- TOC entry 6899 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.inicio_vigencia; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.inicio_vigencia IS 'Fecha en la que es valido un parametro.';


--
-- TOC entry 6900 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.fin_vigencia; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.fin_vigencia IS 'Fecha en la que termina de ser valido un parametro.';


--
-- TOC entry 6901 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.fecha_creacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';


--
-- TOC entry 6902 (class 0 OID 0)
-- Dependencies: 514
-- Name: COLUMN periodo.fecha_modificacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.periodo.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';


--
-- TOC entry 513 (class 1259 OID 524032)
-- Name: periodo_id_seq; Type: SEQUENCE; Schema: parametros; Owner: -
--

CREATE SEQUENCE parametros.periodo_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6903 (class 0 OID 0)
-- Dependencies: 513
-- Name: periodo_id_seq; Type: SEQUENCE OWNED BY; Schema: parametros; Owner: -
--

ALTER SEQUENCE parametros.periodo_id_seq OWNED BY parametros.periodo.id;


--
-- TOC entry 510 (class 1259 OID 524018)
-- Name: tipo_parametro; Type: TABLE; Schema: parametros; Owner: -
--

CREATE TABLE parametros.tipo_parametro (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(100),
    codigo_abreviacion character varying(20),
    activo boolean NOT NULL,
    numero_orden numeric(5,2),
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_modificacion timestamp without time zone NOT NULL,
    area_tipo_id integer NOT NULL
);


--
-- TOC entry 6904 (class 0 OID 0)
-- Dependencies: 510
-- Name: TABLE tipo_parametro; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON TABLE parametros.tipo_parametro IS 'Tabla que parametriza diferentes tipos generales que englobaN un conjunto de parámetros.';


--
-- TOC entry 6905 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.id IS 'Identificador unico de la tabla tipo_parametro';


--
-- TOC entry 6906 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.nombre; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.nombre IS 'Campo obligatorio de la tabla que indica el nombre del tipo';


--
-- TOC entry 6907 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.descripcion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.descripcion IS 'Campo en el que se puede registrar una descripcion de la informacion del tipo';


--
-- TOC entry 6908 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.codigo_abreviacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.codigo_abreviacion IS 'Código de abreviación, sigla, acrónimo u otra representación corta del registro si se requiere.';


--
-- TOC entry 6909 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.activo; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.activo IS 'Valor booleano para indicar si el registro esta activo o inactivo.';


--
-- TOC entry 6910 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.numero_orden; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.numero_orden IS 'En dado caso que se necesite establecer un orden a los registros que no se encuentre definido por aplicación ni por BD. Allí se almacena permitiendo realizar subitems mediante la precisión.';


--
-- TOC entry 6911 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.fecha_creacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.fecha_creacion IS 'Fecha y hora de la creación del registro en la BD.';


--
-- TOC entry 6912 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.fecha_modificacion; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.fecha_modificacion IS 'Fecha y hora de la ultima modificación del registro en la BD.';


--
-- TOC entry 6913 (class 0 OID 0)
-- Dependencies: 510
-- Name: COLUMN tipo_parametro.area_tipo_id; Type: COMMENT; Schema: parametros; Owner: -
--

COMMENT ON COLUMN parametros.tipo_parametro.area_tipo_id IS 'Referencia foránea a la tabla area_tipo que almacena las areas que engloban los tipos de parámetros';


--
-- TOC entry 509 (class 1259 OID 524016)
-- Name: tipo_parametro_id_seq; Type: SEQUENCE; Schema: parametros; Owner: -
--

CREATE SEQUENCE parametros.tipo_parametro_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 6914 (class 0 OID 0)
-- Dependencies: 509
-- Name: tipo_parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: parametros; Owner: -
--

ALTER SEQUENCE parametros.tipo_parametro_id_seq OWNED BY parametros.tipo_parametro.id;


--
-- TOC entry 6551 (class 2604 OID 49438)
-- Name: area_tipo id; Type: DEFAULT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.area_tipo ALTER COLUMN id SET DEFAULT nextval('parametros.area_tipo_id_seq'::regclass);


--
-- TOC entry 6553 (class 2604 OID 49439)
-- Name: parametro id; Type: DEFAULT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro ALTER COLUMN id SET DEFAULT nextval('parametros.parametro_id_seq'::regclass);


--
-- TOC entry 6555 (class 2604 OID 49440)
-- Name: parametro_periodo id; Type: DEFAULT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro_periodo ALTER COLUMN id SET DEFAULT nextval('parametros.parametro_periodo_id_seq'::regclass);


--
-- TOC entry 6554 (class 2604 OID 49441)
-- Name: periodo id; Type: DEFAULT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.periodo ALTER COLUMN id SET DEFAULT nextval('parametros.periodo_id_seq'::regclass);


--
-- TOC entry 6552 (class 2604 OID 49442)
-- Name: tipo_parametro id; Type: DEFAULT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.tipo_parametro ALTER COLUMN id SET DEFAULT nextval('parametros.tipo_parametro_id_seq'::regclass);


--
-- TOC entry 6845 (class 0 OID 524010)
-- Dependencies: 508
-- Data for Name: area_tipo; Type: TABLE DATA; Schema: parametros; Owner: -
--

INSERT INTO parametros.area_tipo VALUES (1, 'prueba', 'prueba', 'PR', true, 1.00, '2020-11-23 17:46:00', '2020-11-23 17:46:00');
INSERT INTO parametros.area_tipo VALUES (2, 'Coordinadores', '', 'COR', true, 0.00, '2020-11-27 15:00:00', '2020-11-27 15:00:00');
INSERT INTO parametros.area_tipo VALUES (3, 'Áreas de Conocimiento', 'Áreas de Conocimiento', 'AC', true, 2.00, '2021-01-07 16:50:00', '2021-01-07 16:50:00');
INSERT INTO parametros.area_tipo VALUES (4, 'Unidades de Medida', 'Unidades de Medida', 'UM', true, 0.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00');
INSERT INTO parametros.area_tipo VALUES (5, 'Contratación', 'Contratación', 'C', true, 0.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00');
INSERT INTO parametros.area_tipo VALUES (6, 'Gobierno', 'Gobierno', 'G', true, 0.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00');
INSERT INTO parametros.area_tipo VALUES (7, 'Trabajos grado', 'Trabajos grado', 'TG', true, 0.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00');
INSERT INTO parametros.area_tipo VALUES (8, 'Kronos', 'datos kronos', 'KR', true, 0.00, '2021-02-12 00:36:27.95097', '2021-02-12 00:36:27.951084');
INSERT INTO parametros.area_tipo VALUES (9, 'Tramite de pago', 'Datos para sistema de tramites de pago', 'KR', true, 0.00, '2021-02-12 22:07:23.677026', '2021-02-12 22:07:23.677138');
INSERT INTO parametros.area_tipo VALUES (10, 'Bienestar Institucional', 'Datos para  proyecto de bienestar institucional', 'BI', true, 0.00, '2021-03-15 12:05:33.557196', '2021-03-15 12:07:05.361177');
INSERT INTO parametros.area_tipo VALUES (11, 'Bienes inmuebles', 'Parámetros relacionados a los bienes inmuebles', 'BI', true, 0.00, '2021-03-16 14:52:42.261214', '2021-03-16 14:52:42.261324');
INSERT INTO parametros.area_tipo VALUES (13, 'Titan', 'Tablas parámetricas necesarias para la preliquidación hecha por el sistema TITAN', NULL, true, NULL, '2021-09-12 20:12:19.107104', '2021-09-12 20:12:19.107104');
INSERT INTO parametros.area_tipo VALUES (14, 'Alternancia', 'Registros necesarios para alternancia', 'ALT', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956');
INSERT INTO parametros.area_tipo VALUES (15, 'Practicas academicas', 'Prácticas académicas', 'PA', true, 0.00, '2021-11-19 00:22:47.293586', '2021-11-19 00:22:47.293586');
INSERT INTO parametros.area_tipo VALUES (17, 'Sistema de Gestión Académica', 'Parametros del Sistema de Gestión Académica', 'PSGA', true, 0.00, '2022-10-10 10:08:48.76694', '2022-10-10 10:08:48.767064');
INSERT INTO parametros.area_tipo VALUES (16, 'Sistema de Gestión Académica', 'Datos para  proyecto de Sistema de Gestión Académica', 'SGA', false, 16.00, '2022-03-30 08:55:51.566164', '2022-10-10 10:11:19.812505');
INSERT INTO parametros.area_tipo VALUES (18, 'Parametros ARKA', 'Parametros ARKA', 'ARK', false, 0.00, '2022-10-23 22:22:57.985428', '2022-10-23 22:22:57.985531');
INSERT INTO parametros.area_tipo VALUES (19, 'Cumplidos DVE', 'Datos para sistema de cumplidos DVE', 'CDVE', true, 0.00, '2022-11-23 14:19:13.006635', '2022-11-23 14:19:13.006635');
INSERT INTO parametros.area_tipo VALUES (20, 'Argo_Novedades', 'Datos para el sistema de Novedades contractuales', 'NOV', true, 0.00, '2023-05-02 00:00:00', '2023-05-02 00:00:00');
INSERT INTO parametros.area_tipo VALUES (21, 'Polux', 'Datos para sistema de Polux', 'PLX', true, 0.00, '2023-07-16 13:38:04.889108', '2023-07-16 13:38:04.889108');


--
-- TOC entry 6849 (class 0 OID 524026)
-- Dependencies: 512
-- Data for Name: parametro; Type: TABLE DATA; Schema: parametros; Owner: -
--

INSERT INTO parametros.parametro VALUES (20, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:03:14.264642', '2020-12-21 14:03:14.264718', 2, NULL);
INSERT INTO parametros.parametro VALUES (21, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:03:14.271235', '2020-12-21 14:03:14.271296', 2, NULL);
INSERT INTO parametros.parametro VALUES (24, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:06:51.862521', '2020-12-21 14:06:51.862597', 2, NULL);
INSERT INTO parametros.parametro VALUES (25, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:06:51.871977', '2020-12-21 14:06:51.872035', 2, NULL);
INSERT INTO parametros.parametro VALUES (28, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:06:51.926718', '2020-12-21 14:06:51.926776', 2, NULL);
INSERT INTO parametros.parametro VALUES (29, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:06:51.935528', '2020-12-21 14:06:51.935586', 2, NULL);
INSERT INTO parametros.parametro VALUES (30, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:06:51.943826', '2020-12-21 14:06:51.943882', 2, NULL);
INSERT INTO parametros.parametro VALUES (31, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:06:51.954899', '2020-12-21 14:06:51.954957', 2, NULL);
INSERT INTO parametros.parametro VALUES (33, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:06:51.98209', '2020-12-21 14:06:51.98215', 2, NULL);
INSERT INTO parametros.parametro VALUES (71, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.877012', '2020-12-21 14:22:01.877127', 2, NULL);
INSERT INTO parametros.parametro VALUES (34, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:06:51.990242', '2020-12-21 14:06:51.990314', 2, NULL);
INSERT INTO parametros.parametro VALUES (35, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:06:51.998645', '2020-12-21 14:06:51.998701', 2, NULL);
INSERT INTO parametros.parametro VALUES (8, 'Certificado de notas', '', '40', false, 0.00, '2020-12-15 14:52:59.503043', '2020-12-15 14:52:59.50315', 2, NULL);
INSERT INTO parametros.parametro VALUES (37, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:06:52.015627', '2021-11-03 11:21:58.025411', 2, NULL);
INSERT INTO parametros.parametro VALUES (5, 'Certificado de notas', '', '40', false, 0.00, '2020-12-11 12:50:41.750338', '2020-12-21 14:14:03.79599', 2, NULL);
INSERT INTO parametros.parametro VALUES (4, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-11 12:46:15.398819', '2021-11-03 11:11:51.990447', 2, NULL);
INSERT INTO parametros.parametro VALUES (44, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.62171', '2020-12-21 14:22:01.621771', 2, NULL);
INSERT INTO parametros.parametro VALUES (45, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.630286', '2020-12-21 14:22:01.630355', 2, NULL);
INSERT INTO parametros.parametro VALUES (46, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.639', '2020-12-21 14:22:01.639058', 2, NULL);
INSERT INTO parametros.parametro VALUES (48, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.659692', '2020-12-21 14:22:01.659749', 2, NULL);
INSERT INTO parametros.parametro VALUES (49, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.667954', '2020-12-21 14:22:01.668015', 2, NULL);
INSERT INTO parametros.parametro VALUES (9, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-15 14:52:59.75962', '2020-12-15 14:52:59.759703', 2, NULL);
INSERT INTO parametros.parametro VALUES (50, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.679028', '2020-12-21 14:22:01.679091', 2, NULL);
INSERT INTO parametros.parametro VALUES (55, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.724748', '2020-12-21 14:22:01.724808', 2, NULL);
INSERT INTO parametros.parametro VALUES (56, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.73517', '2020-12-21 14:22:01.735336', 2, NULL);
INSERT INTO parametros.parametro VALUES (57, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.744292', '2020-12-21 14:22:01.74445', 2, NULL);
INSERT INTO parametros.parametro VALUES (58, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.752867', '2020-12-21 14:22:01.753051', 2, NULL);
INSERT INTO parametros.parametro VALUES (60, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.772578', '2020-12-21 14:22:01.772771', 2, NULL);
INSERT INTO parametros.parametro VALUES (11, 'Certificado de notas', '', '40', false, 0.00, '2020-12-16 15:46:56.703088', '2020-12-16 15:46:56.703198', 2, NULL);
INSERT INTO parametros.parametro VALUES (12, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-16 15:46:56.986496', '2020-12-16 15:46:56.986582', 2, NULL);
INSERT INTO parametros.parametro VALUES (7, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-15 14:52:59.239595', '2020-12-16 15:49:28.114491', 2, NULL);
INSERT INTO parametros.parametro VALUES (15, 'Certificado de notas', '', '40', false, 0.00, '2020-12-17 20:38:13.413531', '2020-12-17 20:38:13.413896', 2, NULL);
INSERT INTO parametros.parametro VALUES (16, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-17 20:38:13.428908', '2020-12-17 20:38:13.428987', 2, NULL);
INSERT INTO parametros.parametro VALUES (18, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-17 20:38:13.446546', '2020-12-30 10:01:09.655351', 2, NULL);
INSERT INTO parametros.parametro VALUES (10, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-16 12:37:58.944521', '2020-12-30 10:00:47.865476', 2, NULL);
INSERT INTO parametros.parametro VALUES (340, 'Especificación de prueba 3', 'Descripción de prueba 3', 'TEST', true, 0.00, '2021-03-04 00:00:00', '2022-02-09 10:35:25.820778', 18, 325);
INSERT INTO parametros.parametro VALUES (61, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.781726', '2020-12-21 14:22:01.781935', 2, NULL);
INSERT INTO parametros.parametro VALUES (62, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.790621', '2020-12-21 14:22:01.790689', 2, NULL);
INSERT INTO parametros.parametro VALUES (63, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.800516', '2020-12-21 14:22:01.800575', 2, NULL);
INSERT INTO parametros.parametro VALUES (66, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.829242', '2020-12-21 14:22:01.829298', 2, NULL);
INSERT INTO parametros.parametro VALUES (67, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:22:01.83818', '2020-12-21 14:22:01.838253', 2, NULL);
INSERT INTO parametros.parametro VALUES (70, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:22:01.866291', '2020-12-21 14:22:01.866453', 2, NULL);
INSERT INTO parametros.parametro VALUES (74, 'Certificado de notas', '', '40', false, 0.00, '2020-12-21 14:27:52.951873', '2020-12-21 14:27:52.951936', 2, NULL);
INSERT INTO parametros.parametro VALUES (75, 'Constancia de estudio', '', '41', false, 0.00, '2020-12-21 14:27:52.960077', '2020-12-21 14:27:52.960134', 2, NULL);
INSERT INTO parametros.parametro VALUES (394, 'prueba', 'prueba', 'pb', true, NULL, '2021-09-10 14:10:58.537396', '2021-09-10 14:10:58.537396', 18, 325);
INSERT INTO parametros.parametro VALUES (65, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:22:01.81877', '2020-12-29 15:40:17.46695', 2, NULL);
INSERT INTO parametros.parametro VALUES (64, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.809511', '2020-12-29 16:33:57.622193', 2, NULL);
INSERT INTO parametros.parametro VALUES (76, 'Sistematizacion', '', '43', false, 0.00, '2020-12-30 07:35:18.269765', '2020-12-30 10:00:40.083286', 2, NULL);
INSERT INTO parametros.parametro VALUES (6, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-11 14:13:29.578772', '2020-12-30 10:00:44.045415', 2, NULL);
INSERT INTO parametros.parametro VALUES (69, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:22:01.855563', '2020-12-30 10:01:02.591719', 2, NULL);
INSERT INTO parametros.parametro VALUES (68, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.846759', '2020-12-30 10:01:05.02724', 2, NULL);
INSERT INTO parametros.parametro VALUES (13, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-16 15:46:57.2411', '2020-12-30 10:01:07.350557', 2, NULL);
INSERT INTO parametros.parametro VALUES (17, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-17 20:38:13.437799', '2020-12-30 10:01:11.836532', 2, NULL);
INSERT INTO parametros.parametro VALUES (14, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-16 15:46:57.495014', '2020-12-30 10:01:14.228836', 2, NULL);
INSERT INTO parametros.parametro VALUES (59, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.761637', '2020-12-30 10:01:17.674809', 2, NULL);
INSERT INTO parametros.parametro VALUES (77, 'Certificado de notas', '', '40', true, 0.00, '2020-12-30 10:08:01.152395', '2020-12-30 10:08:01.152563', 2, NULL);
INSERT INTO parametros.parametro VALUES (79, 'Copia acta de grado', '', '49', true, 0.00, '2020-12-30 10:08:57.714093', '2020-12-30 10:08:57.714184', 2, NULL);
INSERT INTO parametros.parametro VALUES (80, 'Derechos de grado', '', '50', true, 0.00, '2020-12-30 10:09:14.267442', '2020-12-30 10:09:14.267537', 2, NULL);
INSERT INTO parametros.parametro VALUES (81, 'Duplicado de diplomas', '', '51', true, 0.00, '2020-12-30 10:09:29.994531', '2020-12-30 10:09:29.994675', 2, NULL);
INSERT INTO parametros.parametro VALUES (22, 'Inscripción pregrado prueba', '', '13', false, 0.00, '2020-12-21 14:03:14.277912', '2021-06-28 09:05:40.298306', 2, NULL);
INSERT INTO parametros.parametro VALUES (429, 'EPS SURA', '', 'EPS-01', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (41, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:22:01.595148', '2021-09-17 06:38:33.215866', 2, NULL);
INSERT INTO parametros.parametro VALUES (27, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:06:51.910783', '2021-09-17 06:42:34.273955', 2, NULL);
INSERT INTO parametros.parametro VALUES (43, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:22:01.612419', '2021-09-17 06:42:41.548962', 2, NULL);
INSERT INTO parametros.parametro VALUES (36, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:06:52.007162', '2021-09-17 06:52:08.515853', 2, NULL);
INSERT INTO parametros.parametro VALUES (26, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:06:51.880447', '2021-09-17 06:52:22.262467', 2, NULL);
INSERT INTO parametros.parametro VALUES (23, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:03:14.283892', '2021-09-17 06:53:14.198764', 2, NULL);
INSERT INTO parametros.parametro VALUES (38, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:06:52.023881', '2021-09-21 06:37:54.64824', 2, NULL);
INSERT INTO parametros.parametro VALUES (54, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:22:01.716214', '2021-09-21 06:38:09.190478', 2, NULL);
INSERT INTO parametros.parametro VALUES (53, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.707506', '2021-09-21 06:38:14.538926', 2, NULL);
INSERT INTO parametros.parametro VALUES (52, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:22:01.697939', '2021-09-21 06:38:21.115983', 2, NULL);
INSERT INTO parametros.parametro VALUES (47, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.649416', '2021-09-21 06:38:33.71671', 2, NULL);
INSERT INTO parametros.parametro VALUES (32, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:06:51.972632', '2021-09-21 06:38:43.655845', 2, NULL);
INSERT INTO parametros.parametro VALUES (42, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:22:01.603947', '2021-09-21 06:38:50.488258', 2, NULL);
INSERT INTO parametros.parametro VALUES (73, 'Inscripción pregrado', '', '13', false, 0.00, '2020-12-21 14:27:52.943552', '2021-11-03 11:22:00.986061', 2, NULL);
INSERT INTO parametros.parametro VALUES (78, 'Constancia de estudio', '', '41', true, 0.00, '2020-12-30 10:08:36.495105', '2022-01-07 10:40:26.335034', 2, NULL);
INSERT INTO parametros.parametro VALUES (339, 'Especificación de prueba 2', 'Descripción 2', 'JP', true, 0.00, '2021-03-04 00:28:03.972314', '2022-02-09 10:35:39.284876', 18, 325);
INSERT INTO parametros.parametro VALUES (1, 'Salario minimo mensual legal vigente', 'Salario minimo mensual legal vigente', 'SMMLV', true, 0.00, '2020-12-11 11:48:00.321529', '2022-02-08 13:23:05.462799', 1, NULL);
INSERT INTO parametros.parametro VALUES (83, 'Duplicado de carnet', '', '44', true, 0.00, '2020-12-30 10:10:07.150445', '2020-12-30 10:10:07.150534', 2, NULL);
INSERT INTO parametros.parametro VALUES (84, 'Cursos vacacionales', '', '31', true, 0.00, '2020-12-30 10:10:23.464954', '2020-12-30 10:10:23.465054', 2, NULL);
INSERT INTO parametros.parametro VALUES (88, 'Inscripcion pregrado', '', '8672', true, 0.00, '2020-12-30 10:12:05.450864', '2020-12-30 10:12:05.450954', 2, NULL);
INSERT INTO parametros.parametro VALUES (89, 'Inscripción postgrado', '', '12', true, 0.00, '2020-12-30 10:12:33.043857', '2020-12-30 10:12:33.043954', 2, NULL);
INSERT INTO parametros.parametro VALUES (105, 'Ciencias Agrícolas', 'Ciencias Agrícolas', 'CA', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, NULL);
INSERT INTO parametros.parametro VALUES (106, 'Ciencias Sociales', 'Ciencias Sociales', 'CS', true, 2.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, NULL);
INSERT INTO parametros.parametro VALUES (107, 'Humanidades', 'Humanidades', 'H', true, 3.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, NULL);
INSERT INTO parametros.parametro VALUES (108, 'Ciencias Naturales', 'Ciencias Naturales', 'CN', true, 4.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, NULL);
INSERT INTO parametros.parametro VALUES (109, 'Ingenieria y Tecnología', 'Ingenieria y Tecnología', 'IT', true, 5.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, NULL);
INSERT INTO parametros.parametro VALUES (87, 'Fotocopias', '', '15', false, 0.00, '2020-12-30 10:11:36.655915', '2021-01-06 11:42:02.967772', 2, NULL);
INSERT INTO parametros.parametro VALUES (341, 'Requisito de prueba final2', 'Descripcion2', 'Req2', false, 0.00, '2021-03-04 00:00:00', '2021-03-08 13:29:29.326421', 18, 324);
INSERT INTO parametros.parametro VALUES (110, 'Ciencias Médicas y de la Salud', 'Ciencias Médicas y de la Salud', 'CM', true, 6.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, NULL);
INSERT INTO parametros.parametro VALUES (111, 'Agricultura, Silvicultura y Pesca', 'Agricultura, Silvicultura y Pesca', 'ASP', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 105);
INSERT INTO parametros.parametro VALUES (112, 'Ciencias Animales y Lechería', 'Ciencias Animales y Lechería', 'CAL', true, 2.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 105);
INSERT INTO parametros.parametro VALUES (113, 'Ciencias Veterinarias', 'Ciencias Veterinarias', 'CV', true, 3.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 105);
INSERT INTO parametros.parametro VALUES (114, 'Biotecnología Agrícola', 'Biotecnología Agrícola', 'BA', true, 4.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 105);
INSERT INTO parametros.parametro VALUES (115, 'Otras Ciencias Agrícolas', 'Otras Ciencias Agrícolas', 'OAC', true, 5.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 105);
INSERT INTO parametros.parametro VALUES (116, 'Psicología', 'Psicología', 'P', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (117, 'Economía y Negocios', 'Economía y Negocios', 'EN', true, 2.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (118, 'Ciencias de la Educación', 'Ciencias de la Educación', 'CE', true, 3.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (119, 'Sociología', 'Sociología', 'S', true, 4.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (120, 'Derecho', 'Derecho', 'D', true, 5.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (121, 'Ciencias Políticas', 'Ciencias Políticas', 'CP', true, 6.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (122, 'Geografía Social y Económica', 'Geografía Social y Económica', 'GSE', true, 7.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (123, 'Periodismo y Comunicaciones', 'Periodismo y Comunicaciones', 'PC', true, 8.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (124, 'Otras Ciencias Sociales', 'Otras Ciencias Sociales', 'OCS', true, 9.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 106);
INSERT INTO parametros.parametro VALUES (125, 'Historia y Arqueología', 'Historia y Arqueología', 'HA', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 107);
INSERT INTO parametros.parametro VALUES (126, 'Idiomas y Literatura', 'Idiomas y Literatura', 'IL', true, 2.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 107);
INSERT INTO parametros.parametro VALUES (127, 'Otras Historias', 'Otras Historias', 'OH', true, 3.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 107);
INSERT INTO parametros.parametro VALUES (128, 'Arte', 'Arte', 'A', true, 4.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 107);
INSERT INTO parametros.parametro VALUES (129, 'Otras Humanidades', 'Otras Humanidades', 'OHU', true, 5.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 107);
INSERT INTO parametros.parametro VALUES (130, 'Matemática', 'Matemática', 'M', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (131, 'Computación y Ciencias de la Información', 'Computación y Ciencias de la Información', 'CCI', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (132, 'Ciencias Físicas', 'Ciencias Físicas', 'CF', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (133, 'Ciencias Químicas', 'Ciencias Químicas', 'CQ', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (134, 'Ciencias de la Tierra y Medioambientales', 'Ciencias de la Tierra y Medioambientales', 'CTM', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (135, 'Ciencias Biológicas', 'Ciencias Biológicas', 'CB', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (136, 'Otras Ciencias Naturales', 'Otras Ciencias Naturales', 'OCN', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 108);
INSERT INTO parametros.parametro VALUES (137, 'Ingeniería Civil', 'Ingeniería Civil', 'IC', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (138, 'Ingenierías Eléctricas, Eléctronica e Informática', 'Ingenierías Eléctricas, Eléctronica e Informática', 'IEEI', true, 2.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (139, 'Ingeniería Mecánica', 'Ingeniería Mecánica', 'IM', true, 3.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (140, 'Ingeniería Química', 'Ingeniería Química', 'IQ', true, 4.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (141, 'Ingeniería de los Materiales', 'Ingeniería de los Materiales', 'IMA', true, 5.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (142, 'Ingeniería Médica', 'Ingeniería Médica', 'IME', true, 6.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (143, 'Ingeniería Ambiental', 'Ingeniería Ambiental', 'IA', true, 7.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (144, 'Biotecnología Ambiental', 'Biotecnología Ambiental', 'BAM', true, 8.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (145, 'Biotecnología Industrial', 'Biotecnología Industrial', 'BI', true, 9.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (146, 'Nanotecnología', 'Nanotecnología', 'N', true, 10.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (147, 'Otras Ingenierias y Tecnologías', 'Otras Ingenierias y Tecnologías', 'OIT', true, 11.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 109);
INSERT INTO parametros.parametro VALUES (148, 'Biotecnología en Salud', 'Biotecnología en Salud', 'BS', true, 1.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 110);
INSERT INTO parametros.parametro VALUES (149, 'Otras Ciencias Médicas', 'Otras Ciencias Médicas', 'OCM', true, 2.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 110);
INSERT INTO parametros.parametro VALUES (150, 'Medicina Básica', 'Medicina Básica', 'MB', true, 3.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 110);
INSERT INTO parametros.parametro VALUES (151, 'Medicina Clínica', 'Medicina Clínica', 'MC', true, 4.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 110);
INSERT INTO parametros.parametro VALUES (152, 'Ciencias de la Salud', 'Ciencias de la Salud', 'CS', true, 5.00, '2021-01-07 17:04:00', '2021-01-07 17:04:00', 3, 110);
INSERT INTO parametros.parametro VALUES (153, 'AGRONOMIA VETERINARIA Y AFINES', 'AGRONOMIA VETERINARIA Y AFINES', 'AVA', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (154, 'BELLAS ARTES', 'BELLAS ARTES', 'BA', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (155, 'CIENCIAS DE LA EDUCACION', 'CIENCIAS DE LA EDUCACION', 'CC', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (156, 'CIENCIAS DE LA SALUD', 'CIENCIAS DE LA SALUD', 'CS', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (92, 'Inscripcion pregrado', '', '8672', false, 0.00, '2021-01-06 11:48:48.124222', '2021-09-17 06:41:46.762415', 2, NULL);
INSERT INTO parametros.parametro VALUES (91, 'Inscripción postgrado', '', '12', false, 0.00, '2021-01-06 11:48:48.108035', '2021-09-21 06:38:01.120006', 2, NULL);
INSERT INTO parametros.parametro VALUES (101, 'Constancia de estudio', '', '41', false, 0.00, '2021-01-06 11:48:48.178609', '2021-11-03 11:21:48.38776', 2, NULL);
INSERT INTO parametros.parametro VALUES (102, 'Certificado de notas', '', '40', false, 0.00, '2021-01-06 11:48:48.184646', '2021-11-03 11:21:51.295961', 2, NULL);
INSERT INTO parametros.parametro VALUES (93, 'Multas biblioteca', '', '70', false, 0.00, '2021-01-06 11:48:48.130502', '2021-11-03 11:22:03.940378', 2, NULL);
INSERT INTO parametros.parametro VALUES (94, 'Sistematización', '', '43', false, 0.00, '2021-01-06 11:48:48.136679', '2021-11-03 11:22:07.106633', 2, NULL);
INSERT INTO parametros.parametro VALUES (95, 'Cursos vacacionales', '', '31', false, 0.00, '2021-01-06 11:48:48.14269', '2021-11-03 11:22:09.90941', 2, NULL);
INSERT INTO parametros.parametro VALUES (96, 'Duplicado de carnet', '', '44', false, 0.00, '2021-01-06 11:48:48.148723', '2021-11-03 11:22:12.513138', 2, NULL);
INSERT INTO parametros.parametro VALUES (97, 'Carnet', '', '42', false, 0.00, '2021-01-06 11:48:48.154702', '2021-11-03 11:22:15.625038', 2, NULL);
INSERT INTO parametros.parametro VALUES (98, 'Duplicado de diplomas', '', '51', false, 0.00, '2021-01-06 11:48:48.160601', '2021-11-03 11:22:26.592764', 2, NULL);
INSERT INTO parametros.parametro VALUES (99, 'Derechos de grado', '', '50', false, 0.00, '2021-01-06 11:48:48.166631', '2021-11-03 11:22:29.93798', 2, NULL);
INSERT INTO parametros.parametro VALUES (100, 'Copia acta de grado', '', '49', false, 0.00, '2021-01-06 11:48:48.172466', '2021-11-03 11:22:33.648771', 2, NULL);
INSERT INTO parametros.parametro VALUES (85, 'Sistematización', '', '43', false, 0.00, '2020-12-30 10:10:46.621865', '2022-01-07 11:46:22.485194', 2, NULL);
INSERT INTO parametros.parametro VALUES (82, 'Carné', '', '42', true, 0.00, '2020-12-30 10:09:44.125762', '2022-01-07 11:57:53.945575', 2, NULL);
INSERT INTO parametros.parametro VALUES (157, 'CIENCIAS SOCIALES Y HUMANAS', 'CIENCIAS SOCIALES Y HUMANAS', 'CSH', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (158, 'ECONOMIA, ADMINISTRACION, CONTADURIA Y AFINES', 'ECONOMIA, ADMINISTRACION, CONTADURIA Y AFINES', 'EACA', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (159, 'INGENIERIA, ARQUITECTURA, URBANISMO Y AFINES', 'INGENIERIA, ARQUITECTURA, URBANISMO Y AFINES', 'IAUA', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (160, 'MATEMATICAS Y CIENCIAS NATURALES', 'MATEMATICAS Y CIENCIAS NATURALES', 'MCA', true, 8.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (161, 'SIN CLASIFICAR', 'SIN CLASIFICAR', 'SC', true, 9.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4, NULL);
INSERT INTO parametros.parametro VALUES (163, 'CENTIMETRO', 'CENTIMETRO', 'C', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (167, 'METRO', 'METRO', 'm', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (211, 'Impuesto al Valor Agregado Excluido', 'Estatuto Tributario Articulo 424', 'Excluido', true, 1.00, '2021-01-19 11:32:00', '2021-01-19 11:32:00', 12, NULL);
INSERT INTO parametros.parametro VALUES (212, 'Impuesto al Valor Agregado', 'Estatuto Tributario Articulo 468', 'IVA', true, 2.00, '2021-01-19 11:32:00', '2021-01-19 11:32:00', 12, NULL);
INSERT INTO parametros.parametro VALUES (213, 'Profundización', 'Profundización', 'PRO', true, 1.00, '2021-01-19 11:32:00', '2021-01-19 11:32:00', 13, NULL);
INSERT INTO parametros.parametro VALUES (162, 'KILOMETRO', 'KILOMETRO', 'K', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (168, 'MILÍMETRO', 'MILÍMETRO', 'mi', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (169, 'DECÍMETRO', 'DECÍMETRO', 'de', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (170, 'DECÁMETRO', 'DECÁMETRO', 'dec', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (171, 'HECTÓMETRO', 'HECTÓMETRO', 'hm', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5, NULL);
INSERT INTO parametros.parametro VALUES (172, 'MILIGRAMO', 'MILIGRAMO', 'mg', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (164, 'KILOGRAMO', 'KILOGRAMO', 'Kg', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (165, 'GRAMO', 'GRAMO', 'g', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (173, 'CENTIGRAMO', 'CENTIGRAMO', 'cg', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (174, 'DECIGRAMO', 'DECIGRAMO', 'dg', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (175, 'DECAGRAMO', 'DECAGRAMO', 'deg', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (176, 'HECTOGRAMO', 'HECTOGRAMO', 'hg', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6, NULL);
INSERT INTO parametros.parametro VALUES (177, 'SEGUNDOS', 'SEGUNDOS', 's', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7, NULL);
INSERT INTO parametros.parametro VALUES (214, 'Investigación', 'Investigación', 'INV', true, 2.00, '2021-01-19 11:32:00', '2021-01-19 11:32:00', 13, NULL);
INSERT INTO parametros.parametro VALUES (166, 'DIAS', 'DIAS', 'd', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7, NULL);
INSERT INTO parametros.parametro VALUES (178, 'MINUTOS', 'MINUTOS', 'm', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7, NULL);
INSERT INTO parametros.parametro VALUES (179, 'HORAS', 'HORAS', 'h', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7, NULL);
INSERT INTO parametros.parametro VALUES (180, 'MESES', 'MESES', 'm', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7, NULL);
INSERT INTO parametros.parametro VALUES (181, 'AÑOS', 'AÑOS', 'a', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7, NULL);
INSERT INTO parametros.parametro VALUES (182, 'CENTILITRO', 'CENTILITRO', 'cl', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (183, 'LITRO', 'LITRO', 'l', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (184, 'MILILITRO', 'MILILITRO', 'ml', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (185, 'KILOLITRO', 'KILOLITRO', 'kl', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (186, 'HECTOLITRO', 'HECTOLITRO', 'hl', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (187, 'DECALITRO', 'DECALITRO', 'dl', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (188, 'DECILITRO', 'DECILITRO', 'del', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 8, NULL);
INSERT INTO parametros.parametro VALUES (190, 'HECTÓMETRO CÚBICO', 'HECTÓMETRO CÚBICO', 'hm3', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (189, 'KILÓMETRO CÚBICO', 'KILÓMETRO CÚBICO', 'km3', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (191, 'DECÁMETRO CÚBICO', 'DECÁMETRO CÚBICO', 'dm3', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (192, 'METRO CÚBICO', 'METRO CÚBICO', 'm3', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (193, 'DECÍMETRO CÚBICO', 'DECÍMETRO CÚBICO', 'dem3', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (194, 'CENTÍMETRO CÚBICO', 'CENTÍMETRO CÚBICO', 'cm3', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (195, 'MILÍMETRO CÚBICO', 'MILÍMETRO CÚBICO', 'mil3', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 9, NULL);
INSERT INTO parametros.parametro VALUES (196, 'KILÓMETRO CUADRADO', 'KILÓMETRO CUADRADO', 'km2', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (197, 'HECTÓMETRO CUADRADO', 'HECTÓMETRO CUADRADO', 'hm2', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (198, 'DECÁMETRO CUADRADO', 'DECÁMETRO CUADRADO', 'dm2', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (199, 'METRO CUADRADO', 'METRO CUADRADO', 'm2', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (200, 'DECÍMETRO CUADRADO', 'DECÍMETRO CUADRADO', 'dem2', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (201, 'CENTÍMETRO CUADRADO', 'CENTÍMETRO CUADRADO', 'cm2', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (202, 'MILÍMETRO CUADRADO', 'MILÍMETRO CUADRADO', 'mi2', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 10, NULL);
INSERT INTO parametros.parametro VALUES (203, 'Licitación Pública', 'Licitación Pública', 'LP', true, 1.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (204, 'Selección Abreviada', 'Selección Abreviada', 'SA', true, 2.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (205, 'Concurso de Méritos', 'Concurso de Méritos', 'CM', true, 3.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (206, 'Mínima Cuantía', 'Mínima Cuantía', 'MC', true, 4.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (207, 'Contratación Directa', 'Contratación Directa', 'CD', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (208, 'Contratación Directa por Urgencia Manifiesta (*)"', 'Contratación Directa por Urgencia Manifiesta (*)"', 'CDUM', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (209, 'Convocatoria Pública', 'Convocatoria Pública', 'CP', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (210, 'Otra', 'Otra', 'O', true, 8.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 11, NULL);
INSERT INTO parametros.parametro VALUES (342, 'Transacción contable válida', 'Estado de una transaccion válida, fuente: tabla transaccion del api movimientos_contables_crud', 'TCV', true, 0.00, '2021-03-05 16:18:35.642017', '2021-03-05 16:29:36.301955', 19, NULL);
INSERT INTO parametros.parametro VALUES (344, 'Débito', 'Movimiento contable de tipo débito, fuente: tabla movimiento api movimientos_contables_crud', 'MCD', true, 0.00, '2021-03-05 16:21:58.300155', '2021-03-05 16:40:55.073523', 20, NULL);
INSERT INTO parametros.parametro VALUES (231, 'AGRONOMIA VETERINARIA Y AFINES', 'AGRONOMIA VETERINARIA Y AFINES', 'AVA', true, 1.00, '2021-01-26 22:14:21.744514', '2021-01-26 22:14:21.744629', 4, 153);
INSERT INTO parametros.parametro VALUES (232, 'AGRONOMIA', '', 'NBC_11', true, 1.00, '2021-01-26 22:16:11.299434', '2021-01-26 22:16:11.29956', 4, 153);
INSERT INTO parametros.parametro VALUES (233, 'ZOOTECNIA', '', 'NBC_12', true, 1.00, '2021-01-26 23:01:17.928732', '2021-01-26 23:01:17.928838', 4, 153);
INSERT INTO parametros.parametro VALUES (234, 'MEDICINA VETERINARIA', '', 'NBC_13', true, 1.00, '2021-01-26 23:03:31.148539', '2021-01-26 23:03:31.148648', 4, 153);
INSERT INTO parametros.parametro VALUES (235, 'ARTES PLASTICAS, VISUALES Y AFINES', '', 'NBC_24', true, 0.00, '2021-01-26 23:05:57.928509', '2021-01-26 23:05:57.928772', 4, 154);
INSERT INTO parametros.parametro VALUES (236, 'ARTES REPRESENTATIVAS', '', 'NBC_25', true, 0.00, '2021-01-26 23:05:58.180345', '2021-01-26 23:05:58.180456', 4, 154);
INSERT INTO parametros.parametro VALUES (237, 'PUBLICIDAD Y AFINES', '', 'NBC_26', true, 0.00, '2021-01-26 23:05:58.555946', '2021-01-26 23:05:58.556049', 4, 154);
INSERT INTO parametros.parametro VALUES (238, 'DISEÑO', '', 'NBC_27', true, 0.00, '2021-01-26 23:05:58.969401', '2021-01-26 23:05:58.969517', 4, 154);
INSERT INTO parametros.parametro VALUES (239, 'MUSICA', '', 'NBC_28', true, 0.00, '2021-01-26 23:05:59.188246', '2021-01-26 23:05:59.188357', 4, 154);
INSERT INTO parametros.parametro VALUES (240, 'OTROS PROGRAMAS ASOCIADOS A BELLAS ARTES', '', 'NBC_270', true, 0.00, '2021-01-26 23:05:59.413842', '2021-01-26 23:05:59.413961', 4, 154);
INSERT INTO parametros.parametro VALUES (241, 'EDUCACION', '', 'NBC_330', true, 0.00, '2021-01-26 23:07:41.716679', '2021-01-26 23:07:41.71679', 4, 155);
INSERT INTO parametros.parametro VALUES (242, 'BACTERIOLOGIA', '', 'NBC_440', true, 0.00, '2021-01-26 23:08:11.884167', '2021-01-26 23:08:11.884292', 4, 156);
INSERT INTO parametros.parametro VALUES (243, 'ENFERMERIA', '', 'NBC_441', true, 0.00, '2021-01-26 23:08:12.099379', '2021-01-26 23:08:12.099476', 4, 156);
INSERT INTO parametros.parametro VALUES (244, 'TERAPIAS', '', 'NBC_442', true, 0.00, '2021-01-26 23:08:12.320647', '2021-01-26 23:08:12.320747', 4, 156);
INSERT INTO parametros.parametro VALUES (245, 'INSTRUMENTACION QUIRURGICA', '', 'NBC_444', true, 0.00, '2021-01-26 23:08:12.555465', '2021-01-26 23:08:12.555572', 4, 156);
INSERT INTO parametros.parametro VALUES (247, 'NUTRICION Y DIETETICA', '', 'NBC_446', true, 0.00, '2021-01-26 23:08:13.049912', '2021-01-26 23:08:13.050005', 4, 156);
INSERT INTO parametros.parametro VALUES (249, 'OPTOMETRIA, OTROS PROGRAMAS DE CIENCIAS DE LA SALUD', '', 'NBC_448', true, 0.00, '2021-01-26 23:08:13.501107', '2021-01-26 23:08:13.501226', 4, 156);
INSERT INTO parametros.parametro VALUES (252, 'GEOGRAFIA, HISTORIA', '', 'NBC_562', true, 0.00, '2021-01-26 23:09:17.473933', '2021-01-26 23:09:17.474044', 4, 157);
INSERT INTO parametros.parametro VALUES (254, 'FILOSOFIA, TEOLOGIA Y AFINES', '', 'NBC_568', true, 0.00, '2021-01-26 23:09:17.912942', '2021-01-26 23:09:17.913026', 4, 157);
INSERT INTO parametros.parametro VALUES (256, 'LENGUAS MODERNAS, LITERATURA, LINGUISTICA Y AFINES', '', 'NBC_564', true, 0.00, '2021-01-26 23:09:18.423189', '2021-01-26 23:09:18.423296', 4, 157);
INSERT INTO parametros.parametro VALUES (258, 'BIBLIOTECOLOGIA, OTROS DE CIENCIAS SOCIALES Y HUMANAS', '', 'NBC_555', true, 0.00, '2021-01-26 23:09:19.148528', '2021-01-26 23:09:19.14862', 4, 157);
INSERT INTO parametros.parametro VALUES (260, 'DEPORTES, EDUCACION FISICA Y RECREACION', '', 'NBC_558', true, 0.00, '2021-01-26 23:09:19.603549', '2021-01-26 23:09:19.603655', 4, 157);
INSERT INTO parametros.parametro VALUES (262, 'CIENCIA POLITICA, RELACIONES INTERNACIONALES', '', 'NBC_556', true, 0.00, '2021-01-26 23:09:20.06319', '2021-01-26 23:09:20.063279', 4, 157);
INSERT INTO parametros.parametro VALUES (264, 'CONTADURIA PUBLICA', '', 'NBC_612', true, 0.00, '2021-01-26 23:09:56.25066', '2021-01-26 23:09:56.250731', 4, 158);
INSERT INTO parametros.parametro VALUES (267, 'INGENIERIA AGRONOMICA, PECUARIA Y AFINES', '', 'NBC_824', true, 0.00, '2021-01-26 23:10:27.409264', '2021-01-26 23:10:27.409375', 4, 159);
INSERT INTO parametros.parametro VALUES (269, 'OTRAS INGENIERIAS', '', 'NBC_833', true, 0.00, '2021-01-26 23:10:27.859015', '2021-01-26 23:10:27.8591', 4, 159);
INSERT INTO parametros.parametro VALUES (271, 'INGENIERIA MECANICA Y AFINES', '', 'NBC_831', true, 0.00, '2021-01-26 23:10:28.297768', '2021-01-26 23:10:28.297855', 4, 159);
INSERT INTO parametros.parametro VALUES (273, 'INGENIERIA ELECTRONICA, TELECOMUNICACIONES Y AFINES', '', 'NBC_829', true, 0.00, '2021-01-26 23:10:28.779376', '2021-01-26 23:10:28.779488', 4, 159);
INSERT INTO parametros.parametro VALUES (275, 'INGENIERIA DE SISTEMAS, TELEMATICA Y AFINES', '', 'NBC_827', true, 0.00, '2021-01-26 23:10:35.06176', '2021-01-26 23:10:35.06186', 4, 159);
INSERT INTO parametros.parametro VALUES (277, 'INGENIERIA AGROINDUSTRIAL, ALIMENTOS Y AFINES', '', 'NBC_823', true, 0.00, '2021-01-26 23:10:35.58861', '2021-01-26 23:10:35.588705', 4, 159);
INSERT INTO parametros.parametro VALUES (279, 'INGENIERIA AMBIENTAL, SANITARIA Y AFINES', '', 'NBC_820', true, 0.00, '2021-01-26 23:10:36.033492', '2021-01-26 23:10:36.033578', 4, 159);
INSERT INTO parametros.parametro VALUES (281, 'INGENIERIA ADMNISTRATIVA Y AFINES', '', 'NBC_821', true, 0.00, '2021-01-26 23:10:36.524073', '2021-01-26 23:10:36.524166', 4, 159);
INSERT INTO parametros.parametro VALUES (283, 'FISICA', '', 'NBC_935', true, 0.00, '2021-01-26 23:11:05.61181', '2021-01-26 23:11:05.611899', 4, 160);
INSERT INTO parametros.parametro VALUES (285, 'MATEMATICAS, ESTADISTICA Y AFINES', '', 'NBC_937', true, 0.00, '2021-01-26 23:11:06.06527', '2021-01-26 23:11:06.06536', 4, 160);
INSERT INTO parametros.parametro VALUES (343, 'Transacción contable inválida', 'Estado de una transaccion inválida, fuente: tabla transacción del api movimientos_contables_crud', 'TCI', true, 0.00, '2021-03-05 16:19:45.045336', '2021-03-05 16:32:38.446887', 19, NULL);
INSERT INTO parametros.parametro VALUES (345, 'Crédito', 'Movimiento contable de tipo crédito, fuente: tabla movimiento api movimientos_contables_crud', 'MCC', true, 0.00, '2021-03-05 16:38:27.935595', '2021-03-05 16:38:27.935705', 20, NULL);
INSERT INTO parametros.parametro VALUES (395, 'Primera quincena', 'Pagada a principio de mes', 'TP_000', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (396, 'Segunda quincena', 'Pagada a final del mes', 'TP_001', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (397, 'Mes completo', 'Pagada a final del mes', 'TP_002', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (398, 'Prima semestral', 'Pagada en junio', 'TP_003', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (399, 'Prima de vacaciones', 'Pagada en diciembre', 'TP_004', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (400, 'Sueldo de vacaciones', 'Pagada en diciembre', 'TP_005', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (401, 'Prima de navidad', 'Pagada en diciembre', 'TP_006', true, NULL, '2021-09-12 21:01:47.364407', '2021-09-12 21:01:47.364407', 26, NULL);
INSERT INTO parametros.parametro VALUES (402, 'Cerrada', 'No se permiten más cambios en la preliquidación pues ya ha sido liquidada', 'EPL_001', true, NULL, '2021-09-12 21:13:20.739854', '2021-09-12 21:13:20.739854', 27, NULL);
INSERT INTO parametros.parametro VALUES (403, 'Abierta', 'La preliquidación puede volver a calcularse', 'EPL_002', true, NULL, '2021-09-12 21:13:20.739854', '2021-09-12 21:13:20.739854', 27, NULL);
INSERT INTO parametros.parametro VALUES (404, 'SolicitudNecesidad', 'Se ha solicitado una necesidad para esta preliquidación', 'EPL_003', true, NULL, '2021-09-12 21:13:20.739854', '2021-09-12 21:13:20.739854', 27, NULL);
INSERT INTO parametros.parametro VALUES (405, 'OrdenPagoPendientes', 'Se han generado ordenes de pago pero hay personas pendientes de pago', 'EPL_004', true, NULL, '2021-09-12 21:13:20.739854', '2021-09-12 21:13:20.739854', 27, NULL);
INSERT INTO parametros.parametro VALUES (406, 'FP', 'Funcionarios de planta', 'TN-PLAN', true, NULL, '2021-09-12 21:41:57.056225', '2021-09-12 21:41:57.056225', 28, NULL);
INSERT INTO parametros.parametro VALUES (407, 'DP', 'Docentes de planta', 'TN-PLAN', true, NULL, '2021-09-12 21:41:57.056225', '2021-09-12 21:41:57.056225', 28, NULL);
INSERT INTO parametros.parametro VALUES (408, 'PE', 'Pensionados', 'TN-PENS', true, NULL, '2021-09-12 21:41:57.056225', '2021-09-12 21:41:57.056225', 28, NULL);
INSERT INTO parametros.parametro VALUES (409, 'HCH', 'Vinculacion Docente Honorarios', 'TN-HC', true, NULL, '2021-09-12 21:41:57.056225', '2021-09-12 21:41:57.056225', 28, NULL);
INSERT INTO parametros.parametro VALUES (410, 'HCS', 'Vinculacion Docente Salarios', 'TN-HC', true, NULL, '2021-09-12 21:41:57.056225', '2021-09-12 21:41:57.056225', 28, NULL);
INSERT INTO parametros.parametro VALUES (411, 'CT', 'Contrato de Prestacion de Servicios Profesionales o Apoyo a la Gestion', 'TN-CONT', true, NULL, '2021-09-12 21:41:57.056225', '2021-09-12 21:41:57.056225', 28, NULL);
INSERT INTO parametros.parametro VALUES (412, 'Funcionarios administrativos-Planta', 'Funcionarios administrativos-Planta', NULL, true, NULL, '2021-09-12 21:58:39.027332', '2021-09-12 21:58:39.027332', 29, 406);
INSERT INTO parametros.parametro VALUES (413, 'Docentes de planta', 'Docentes de planta', NULL, true, NULL, '2021-09-12 21:58:39.027332', '2021-09-12 21:58:39.027332', 29, 407);
INSERT INTO parametros.parametro VALUES (414, 'Contratistas', 'Contratistas', NULL, true, NULL, '2021-09-12 21:58:39.027332', '2021-09-12 21:58:39.027332', 29, 411);
INSERT INTO parametros.parametro VALUES (415, 'Hora cátedra honorarios', 'Hora cátedra honorarios', NULL, true, NULL, '2021-09-12 21:58:39.027332', '2021-09-12 21:58:39.027332', 29, 409);
INSERT INTO parametros.parametro VALUES (416, 'Hora cátedra salarios', 'Hora cátedra salarios', NULL, true, NULL, '2021-09-12 21:58:39.027332', '2021-09-12 21:58:39.027332', 29, 410);
INSERT INTO parametros.parametro VALUES (430, 'SALUD TOTAL EPS', '', 'EPS-02', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (431, 'CAFESALUD EPS', '', 'EPS-03', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (432, 'SALUDCOOP EPS', '', 'EPS-04', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (433, 'FAMISANAR EPS CAFAM', '', 'EPS-05', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (434, 'CRUZ BLANCA EPS', '', 'EPS-06', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (435, 'COMPENSAR EPS', '', 'EPS-07', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (436, 'NUEVA EPS', '', 'EPS-08', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (437, 'CAPRECOM', '', 'EPS-09', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (438, 'CAPRESOCA', '', 'EPS-10', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (439, 'COLMEDICA', '', 'EPS-11', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (440, 'COMFENALCO ANTIOQUIA', '', 'EPS-12', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (441, 'COMFENALCO VALLE', '', 'EPS-13', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (442, 'CONVIDA ARS', '', 'EPS-14', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (443, 'COOMEVA EPS', '', 'EPS-15', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (444, 'HUMANA VIVIR', '', 'EPS-16', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (445, 'INSTITUTO DE LOS SEGUROS SOCIALES', '', 'EPS-17', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (446, 'SALUD COLMENA', '', 'EPS-18', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (447, 'SALUD COLPATRIA', '', 'EPS-19', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (448, 'SALUD COLOMBIA EPS SA', '', 'EPS-20', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (449, 'SALUD VIDA', '', 'EPS-21', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (450, 'SANITAS', '', 'EPS-22', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (451, 'SELVASALUD', '', 'EPS-23', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (452, 'SOLSALUD', '', 'EPS-24', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (246, 'MEDICINA', '', 'NBC_445', true, 0.00, '2021-01-26 23:08:12.785869', '2021-01-26 23:08:12.785997', 4, 156);
INSERT INTO parametros.parametro VALUES (248, 'ODONTOLOGIA', '', 'NBC_447', true, 0.00, '2021-01-26 23:08:13.285331', '2021-01-26 23:08:13.285434', 4, 156);
INSERT INTO parametros.parametro VALUES (250, 'SALUD PUBLICA', '', 'NBC_450', true, 0.00, '2021-01-26 23:08:13.724648', '2021-01-26 23:08:13.724736', 4, 156);
INSERT INTO parametros.parametro VALUES (251, 'ANTROPOLOGIA, ARTES LIBERALES', '', 'NBC_553', true, 0.00, '2021-01-26 23:09:17.243791', '2021-01-26 23:09:17.24388', 4, 157);
INSERT INTO parametros.parametro VALUES (253, 'SOCIOLOGIA, TRABAJO SOCIAL Y AFINES', '', 'NBC_569', true, 0.00, '2021-01-26 23:09:17.69271', '2021-01-26 23:09:17.692804', 4, 157);
INSERT INTO parametros.parametro VALUES (255, 'PSICOLOGIA', '', 'NBC_566', true, 0.00, '2021-01-26 23:09:18.149787', '2021-01-26 23:09:18.149897', 4, 157);
INSERT INTO parametros.parametro VALUES (257, 'FORMACION RELACIONADA CON EL CAMPO MILITAR O POLICIAL', '', 'NBC_561', true, 0.00, '2021-01-26 23:09:18.789378', '2021-01-26 23:09:18.789463', 4, 157);
INSERT INTO parametros.parametro VALUES (259, 'COMUNICACIÓN SOCIAL, PERIODISMO Y AFINES', '', 'NBC_557', true, 0.00, '2021-01-26 23:09:19.364618', '2021-01-26 23:09:19.364708', 4, 157);
INSERT INTO parametros.parametro VALUES (261, 'DERECHO Y AFINES', '', 'NBC_559', true, 0.00, '2021-01-26 23:09:19.833842', '2021-01-26 23:09:19.833928', 4, 157);
INSERT INTO parametros.parametro VALUES (263, 'ADMINISTRACION', '', 'NBC_69', true, 0.00, '2021-01-26 23:09:56.016841', '2021-01-26 23:09:56.016929', 4, 158);
INSERT INTO parametros.parametro VALUES (265, 'ECONOMIA', '', 'NBC_611', true, 0.00, '2021-01-26 23:09:56.480721', '2021-01-26 23:09:56.480793', 4, 158);
INSERT INTO parametros.parametro VALUES (266, 'ARQUITECTURA', '', 'NBC_818', true, 0.00, '2021-01-26 23:10:27.029449', '2021-01-26 23:10:27.029556', 4, 159);
INSERT INTO parametros.parametro VALUES (268, 'INGENIERIA DE MINAS, METALURGIA Y AFINES', '', 'NBC_826', true, 0.00, '2021-01-26 23:10:27.639013', '2021-01-26 23:10:27.639135', 4, 159);
INSERT INTO parametros.parametro VALUES (270, 'INGENIERIA QUIMICA Y AFINES', '', 'NBC_832', true, 0.00, '2021-01-26 23:10:28.075393', '2021-01-26 23:10:28.075608', 4, 159);
INSERT INTO parametros.parametro VALUES (272, 'INGENIERIA INDUSTRIAL Y AFINES', '', 'NBC_830', true, 0.00, '2021-01-26 23:10:28.509508', '2021-01-26 23:10:28.509616', 4, 159);
INSERT INTO parametros.parametro VALUES (274, 'INGENIERIA ELECTRICA Y AFINES', '', 'NBC_828', true, 0.00, '2021-01-26 23:10:34.54542', '2021-01-26 23:10:34.545519', 4, 159);
INSERT INTO parametros.parametro VALUES (276, 'INGENIERIA CIVIL Y AFINES', '', 'NBC_825', true, 0.00, '2021-01-26 23:10:35.363259', '2021-01-26 23:10:35.363326', 4, 159);
INSERT INTO parametros.parametro VALUES (278, 'INGENIERIA BIOMEDICA Y AFINES', '', 'NBC_819', true, 0.00, '2021-01-26 23:10:35.810941', '2021-01-26 23:10:35.811035', 4, 159);
INSERT INTO parametros.parametro VALUES (280, 'INGENIERIA AGRICOLA, FORESTAL Y AFINES', '', 'NBC_822', true, 0.00, '2021-01-26 23:10:36.283779', '2021-01-26 23:10:36.28388', 4, 159);
INSERT INTO parametros.parametro VALUES (282, 'BIOLOGIA, MICROBIOLOGIA Y AFINES', '', 'NBC_934', true, 0.00, '2021-01-26 23:11:05.378737', '2021-01-26 23:11:05.378823', 4, 160);
INSERT INTO parametros.parametro VALUES (284, 'GEOLOGIA, OTROS PROGRAMAS DE CIENCIAS NATURALES', '', 'NBC_936', true, 0.00, '2021-01-26 23:11:05.835149', '2021-01-26 23:11:05.835221', 4, 160);
INSERT INTO parametros.parametro VALUES (286, 'QUIMICA Y AFINES', '', 'NBC_939', true, 0.00, '2021-01-26 23:11:06.275265', '2021-01-26 23:11:06.275358', 4, 160);
INSERT INTO parametros.parametro VALUES (287, 'NO APLICA', '', 'NBC_0', true, 0.00, '2021-01-26 23:11:34.258898', '2021-01-26 23:11:34.258994', 4, 161);
INSERT INTO parametros.parametro VALUES (288, 'BACHILLER ACADÉMICO', '', 'NBC_49207', false, 0.00, '2021-01-26 23:11:35.369985', '2021-01-26 23:11:35.370077', 4, 161);
INSERT INTO parametros.parametro VALUES (290, 'CONTRATO DE PRESTACIÓN SERVICIOS', 'CONTRATO DE PRESTACIÓN DE SERVICIOS', 'CPS', true, 1.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 289);
INSERT INTO parametros.parametro VALUES (289, 'PRESTACIÓN DE SERVICIOS', 'PRESTACIÓN DE SERVICIOS', 'PS', true, 1.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, NULL);
INSERT INTO parametros.parametro VALUES (291, 'ORDEN DE PRESTACIÓN DE SERVICIOS', 'ORDEN DE PRESTACIÓN DE SERVICIOS', 'OPS', true, 2.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 289);
INSERT INTO parametros.parametro VALUES (292, 'DOCENTE DE PLANTA', 'DOCENTE DE PLANTA', 'DP', true, 2.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, NULL);
INSERT INTO parametros.parametro VALUES (293, 'DOCENTE DE CARRERA TIEMPO COMPLETO', 'DOCENTE DE CARRERA TIEMPO COMPLETO', 'DCTC', true, 1.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 291);
INSERT INTO parametros.parametro VALUES (294, 'DOCENTE DE CARRERA MEDIO TIEMPO', 'DOCENTE DE CARRERA MEDIO TIEMPO', 'DCMT', true, 2.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 291);
INSERT INTO parametros.parametro VALUES (295, 'DOCENTE DE VINCULACIÓN ESPECIAL', 'DOCENTE DE VINCULACIÓN ESPECIAL', 'DVE', true, 3.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, NULL);
INSERT INTO parametros.parametro VALUES (296, 'TIEMPO COMPLETO OCASIONAL', 'TIEMPO COMPLETO OCASIONAL', 'TCO', true, 1.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 295);
INSERT INTO parametros.parametro VALUES (298, 'MEDIO TIEMPO OCASIONAL', 'MEDIO TIEMPO OCASIONAL', 'MTO', true, 3.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 295);
INSERT INTO parametros.parametro VALUES (299, 'HORA CÁTEDRA POR HONORARIOS', 'HORA CÁTEDRA POR HONORARIOS', 'HCH', true, 4.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 295);
INSERT INTO parametros.parametro VALUES (300, 'ADMINISTRATIVO DE PLANTA', 'ADMINISTRATIVO DE PLANTA', 'AP', true, 4.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, NULL);
INSERT INTO parametros.parametro VALUES (301, 'ASISTENCIAL', 'ASISTENCIAL', 'A', true, 1.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (302, 'ASESOR', 'ASESOR', 'AS', true, 2.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (303, 'EJECUTIVO', 'EJECUTIVO', 'E', true, 3.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (304, 'DIRECTIVOS', 'DIRECTIVOS', 'D', true, 4.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (305, 'EMPLEADOS PUBLICOS', 'EMPLEADOS PUBLICOS', 'EP', true, 5.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (307, 'TECNICO', 'TECNICO', 'T', true, 7.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (306, 'PROFESIONAL UNIVERSITARIO', 'PROFESIONAL UNIVERSITARIO', 'PU', true, 6.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 300);
INSERT INTO parametros.parametro VALUES (308, 'PENSIONADO', 'PENSIONADO', 'P', true, 5.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, NULL);
INSERT INTO parametros.parametro VALUES (309, 'PENSIONADO DOCENTE', 'PENSIONADO DOCENTE', 'PD', true, 1.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 308);
INSERT INTO parametros.parametro VALUES (310, 'PENSIONADO ADMINISTRATIVO', 'PENSIONADO ADMINISTRATIVO', 'PA', true, 2.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, 308);
INSERT INTO parametros.parametro VALUES (311, 'OFICIAL', 'OFICIAL', 'O', true, 6.00, '2021-01-28 15:28:00', '2021-01-28 15:28:00', 14, NULL);
INSERT INTO parametros.parametro VALUES (356, 'Cierre periodo apoyo alimentario', 'Cierre periodo de servicio de apoyo alimentario', 'CAPAL', true, 1.00, '2021-04-05 18:23:20.059356', '2021-04-05 18:23:20.05945', 21, NULL);
INSERT INTO parametros.parametro VALUES (359, 'Constancia de estudio', '', '41', false, 0.00, '2021-06-27 22:51:48.777043', '2021-06-27 23:03:12.479041', 2, NULL);
INSERT INTO parametros.parametro VALUES (361, 'Prueba', '', '1', true, 0.00, '2021-07-09 21:57:21.390595', '2021-07-09 21:57:21.3907', 2, NULL);
INSERT INTO parametros.parametro VALUES (362, '536', '', '1', true, 0.00, '2021-07-10 18:05:32.829822', '2021-07-10 18:05:32.829919', 2, NULL);
INSERT INTO parametros.parametro VALUES (363, 'prueba diego', 'Esta es una prueba de Diego en la creación de un requisito', 'PRUEBA DIEGO', true, 0.00, '2021-07-16 11:01:21.03639', '2021-07-16 11:01:21.036486', 18, 324);
INSERT INTO parametros.parametro VALUES (364, 'PRUEBA DIEGO 1', 'PRUEBA DIEGO 1', 'PRUEBA DIEGO 1', true, 0.00, '2021-07-23 13:10:52.541786', '2021-07-23 13:10:52.541894', 18, 324);
INSERT INTO parametros.parametro VALUES (365, 'Esp Prueba', 'Esp Prueba', 'test 1', true, 0.00, '2021-07-23 13:11:28.868278', '2021-07-23 13:11:28.868361', 18, 325);
INSERT INTO parametros.parametro VALUES (375, 'TEST 3/08/2021', 'TEST 4', 'test 4', true, 0.00, '2021-08-03 11:18:24.816212', '2021-08-03 11:18:24.816291', 18, 324);
INSERT INTO parametros.parametro VALUES (366, 'prueba diego 2', 'PRUEBA', 'PD2', true, 0.00, '2021-07-26 00:00:00', '2021-07-26 10:58:18.239604', 18, 324);
INSERT INTO parametros.parametro VALUES (367, 'PRUEBA 3', 'PRUEBA 3', 'PD3', true, 0.00, '2021-07-26 10:59:07.273349', '2021-07-26 10:59:07.273427', 18, 325);
INSERT INTO parametros.parametro VALUES (368, 'PRUEBA', 'PRUEBA', 'PR', true, 0.00, '2021-07-30 00:00:00', '2021-07-30 14:11:57.50409', 18, 324);
INSERT INTO parametros.parametro VALUES (369, 'prueba diego 2', 'PRUEBA', 'PRUEBA DIEGO', true, 0.00, '2021-07-30 14:12:12.044149', '2021-07-30 14:12:12.04424', 18, 324);
INSERT INTO parametros.parametro VALUES (370, 'Prueba 30/07/2021', 'Prueba 1234', 'PR1', true, 0.00, '2021-07-30 14:13:01.026489', '2021-07-30 14:13:01.026591', 18, 324);
INSERT INTO parametros.parametro VALUES (371, 'test 2', 'Test 2', 'test 2', true, 0.00, '2021-07-30 14:13:51.562448', '2021-07-30 14:13:51.562547', 18, 325);
INSERT INTO parametros.parametro VALUES (374, 'prueba 3/08/2021', 'TEST 4', 'PR', true, 0.00, '2021-08-03 11:13:30.818374', '2021-08-03 11:13:30.818448', 18, 324);
INSERT INTO parametros.parametro VALUES (376, 'test 123', 'test 123', 'test 123', true, 0.00, '2021-08-11 12:55:35.730818', '2021-08-11 12:55:35.731541', 18, 325);
INSERT INTO parametros.parametro VALUES (377, 'CONTRATISTA EXTERNO', 'Contratista externo de la universidad', 'CEX', true, 0.00, '2021-08-18 11:47:18.607321', '2021-08-18 11:47:18.607321', 14, NULL);
INSERT INTO parametros.parametro VALUES (381, 'prueba diego 123', 'prueba diego 123', 'prueba diego 123', true, 0.00, '2021-08-23 17:17:00.081911', '2021-08-23 17:17:00.082042', 18, 324);
INSERT INTO parametros.parametro VALUES (382, 'prueba diego 123', 'prueba diego 123', 'prueba diego 123', true, 0.00, '2021-08-23 17:17:53.002414', '2021-08-23 17:17:53.002499', 18, 325);
INSERT INTO parametros.parametro VALUES (383, 'prueba test 123', 'prueba diego 123', 'prueba test 123', true, 0.00, '2021-08-23 00:00:00', '2021-08-23 17:27:05.561366', 18, 324);
INSERT INTO parametros.parametro VALUES (384, 'prueba test 123', 'prueba test 123', 'prueba test 123', true, 0.00, '2021-08-23 17:27:29.663999', '2021-08-23 17:27:29.66411', 18, 325);
INSERT INTO parametros.parametro VALUES (385, 'Papelería', 'Gastos de papeleria para el convenio de proyecto de investigación', 'PS1', true, 0.00, '2021-09-03 16:34:27.055697', '2021-09-03 16:34:27.055819', 18, 324);
INSERT INTO parametros.parametro VALUES (386, 'fotocopias', 'blblablala', 'PS1-1', true, 0.00, '2021-09-03 16:35:09.308105', '2021-09-03 16:35:09.308181', 18, 325);
INSERT INTO parametros.parametro VALUES (391, 'Certificado de ingresos a Almacén', 'Manera de determinar si el bien objeto de compra ya ingreso a la Sección de Almacén e Invntarios', 'CIA', true, 0.00, '2021-09-06 10:19:16.915078', '2021-09-06 10:19:16.91518', 18, 324);
INSERT INTO parametros.parametro VALUES (358, 'Constancia de estudio', '', '41', false, 0.00, '2021-06-27 22:51:12.349097', '2021-09-17 06:40:54.639301', 2, NULL);
INSERT INTO parametros.parametro VALUES (357, 'Pariatur Nemo autem', 'Dolor est doloribus ', 'Occaecat nostrud ex ', true, 0.00, '2021-04-08 15:10:57.834783', '2021-11-29 10:35:32.215046', 18, 324);
INSERT INTO parametros.parametro VALUES (348, 'Habilitar apoyo alimentario', 'Habilitar prestacion del servicio de apoyo alimentario a un periodo', 'SAPAL', true, 1.00, '2021-03-15 13:12:58.559391', '2021-03-15 13:12:58.559493', 21, NULL);
INSERT INTO parametros.parametro VALUES (372, 'prueba diego', 'PRUEBA', 'PR', true, 0.00, '2021-08-02 10:01:32.644995', '2021-08-02 10:01:32.645119', 18, 324);
INSERT INTO parametros.parametro VALUES (313, 'REL. DE AUTORIZACION', '', 'R-AUT', true, 1.00, '2021-02-12 00:57:01.808113', '2021-02-12 00:57:01.808232', 16, NULL);
INSERT INTO parametros.parametro VALUES (315, 'ORDEN SUMINISTRO', 'Documentos que aplican como un compromiso', 'PRES-ORSU', true, 1.00, '2021-02-12 00:59:01.730923', '2021-02-12 00:59:01.731026', 16, NULL);
INSERT INTO parametros.parametro VALUES (317, 'Elaborada', 'ORDEN DE PAGO ELABORADA', 'OP-ELB', true, 1.00, '2021-02-12 22:09:54.525326', '2021-02-12 22:09:54.525455', 17, NULL);
INSERT INTO parametros.parametro VALUES (534, 'Certificado de notas', '', '40', false, 0.00, '2021-11-03 11:22:54.541347', '2021-11-03 11:23:58.598234', 2, NULL);
INSERT INTO parametros.parametro VALUES (373, 'TEST', 'TEST', 'TEST', true, 0.00, '2021-08-02 10:02:47.688448', '2021-08-03 12:18:36.327242', 18, 325);
INSERT INTO parametros.parametro VALUES (378, 'prueba 19/''8/2021', 'prueba 19/''8/2021', 'prueba 19/''8/2021', true, 0.00, '2021-08-19 15:38:38.857845', '2021-08-19 15:38:38.857966', 18, 324);
INSERT INTO parametros.parametro VALUES (379, 'prueba 18/08/2021', 'prueba 18/08/2021', 'prueba 18/08/2021', true, 0.00, '2021-08-19 15:39:13.249486', '2021-08-19 15:39:13.249586', 18, 324);
INSERT INTO parametros.parametro VALUES (380, 'prueba 18/08/2021', 'prueba 18/08/2021', 'prueba 18/08/2021', true, 0.00, '2021-08-19 15:40:43.701886', '2021-08-19 15:40:43.702011', 18, 325);
INSERT INTO parametros.parametro VALUES (387, 'PRUEBA AVANCES 1 - 06/09/2021', 'PRUEBA AVANCES 1 - 06/09/2021', 'PA-1', true, 0.00, '2021-09-06 00:00:00', '2021-09-06 09:50:18.511592', 18, 324);
INSERT INTO parametros.parametro VALUES (388, 'PRUEBA AVANCES 11 - 06/09/2021', 'PRUEBA AVANCES 11 - 06/09/2021', 'PA-11', true, 0.00, '2021-09-06 00:00:00', '2021-09-06 09:50:32.292833', 18, 325);
INSERT INTO parametros.parametro VALUES (390, 'Facturas', 'Original de las facturas y/o cuentas de cobro o documento equivalente', 'OF', true, 0.00, '2021-09-06 00:00:00', '2021-09-06 10:14:46.121438', 18, 325);
INSERT INTO parametros.parametro VALUES (312, 'JEFE OFICINA', 'JEFE OFICINA', 'JO', true, 1.00, '2021-01-28 15:23:00', '2023-07-27 12:00:36.147643', 15, NULL);
INSERT INTO parametros.parametro VALUES (389, 'Avance Compras y Servicios', 'Prueba para definir si se puede crear bien un requisito de avance', 'ACS', false, 0.00, '2021-09-06 10:12:33.410934', '2021-09-06 10:17:45.269295', 18, 324);
INSERT INTO parametros.parametro VALUES (393, 'Facturas', 'factura', 'F1', true, 0.00, '2021-09-06 10:25:12.845123', '2021-09-06 10:25:12.845209', 18, 325);
INSERT INTO parametros.parametro VALUES (417, 'activo', 'El concepto puede utilizarse para liquidación', 'ECN_001', true, NULL, '2021-09-13 09:49:11.35727', '2021-09-13 09:49:11.35727', 30, NULL);
INSERT INTO parametros.parametro VALUES (418, 'inactivo', 'El concepto ya no es usado para liquidacion', 'ECN_002', true, NULL, '2021-09-13 09:49:11.35727', '2021-09-13 09:49:11.35727', 30, NULL);
INSERT INTO parametros.parametro VALUES (419, 'fijo', 'Concepto cuyo valor no cambia', 'TCN_001', true, NULL, '2021-09-13 10:02:33.930213', '2021-09-13 10:02:33.930213', 31, NULL);
INSERT INTO parametros.parametro VALUES (420, 'porcentual', 'Concepto que cambia según el porcentaje indicado', 'TCN_002', true, NULL, '2021-09-13 10:02:33.930213', '2021-09-13 10:02:33.930213', 31, NULL);
INSERT INTO parametros.parametro VALUES (421, 'seguridad_social', 'Concepto de seguridad social', 'TCN_003', true, NULL, '2021-09-13 10:02:33.930213', '2021-09-13 10:02:33.930213', 31, NULL);
INSERT INTO parametros.parametro VALUES (422, 'pago_seguridad_social', 'Concepto que corresponde a un pago de seguridad social', 'TCN_004', true, NULL, '2021-09-13 10:02:33.930213', '2021-09-13 10:02:33.930213', 31, NULL);
INSERT INTO parametros.parametro VALUES (423, 'devengo', 'Concepto que suma al pago del empleado', 'NCN_001', true, NULL, '2021-09-13 10:10:04.639699', '2021-09-13 10:10:04.639699', 32, NULL);
INSERT INTO parametros.parametro VALUES (424, 'descuento', 'Concepto que se resta al pago del empleado', 'NCN_002', true, NULL, '2021-09-13 10:10:04.639699', '2021-09-13 10:10:04.639699', 32, NULL);
INSERT INTO parametros.parametro VALUES (425, 'seguridad_social', 'Concepto de seguridad social', 'NCN_003', true, NULL, '2021-09-13 10:10:04.639699', '2021-09-13 10:10:04.639699', 32, NULL);
INSERT INTO parametros.parametro VALUES (453, 'SOS EPS', '', 'EPS-25', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (454, 'SUSALUD', '', 'EPS-26', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (455, 'MUTUAL SER', '', 'EPS-27', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (456, 'COOSALUD', '', 'EPS-28', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (457, 'EMSSANAR', '', 'EPS-29', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (458, 'ALIANSALUD', '', 'EPS-30', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (459, 'ASMET SALUD', '', 'EPS-31', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (460, 'SERVICIO OCCIDENTAL DE SALUD', '', 'EPS-32', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (461, 'AMBUQ', '', 'EPS-33', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (462, 'SAVIA SALUD', '', 'EPS-34', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (463, 'CAPITAL SALUD', '', 'EPS-35', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (464, 'COMPARTA', '', 'EPS-36', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (465, 'CALISALUD', '', 'EPS-37', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (466, 'FAMISANAR EPS COLSUBSIDIO', '', 'EPS-38', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (467, 'REGIMEN ESPECIAL', '', 'EPS-39', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (468, 'MEDIMAS EPS', '', 'EPS-40', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (469, 'SERVISALUD', '', 'EPS-41', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (470, 'MEDPLUS', '', 'EPS-42', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (471, 'UNISALUD', '', 'EPS-43', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (472, 'ECOOPSOS SAS', '', 'EPS-45', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (473, 'FUNDACION SALUD MIA EPS', '', 'EPS-47', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (474, 'PROGRAMA DE SALUD UNIVERSIDAD DE ANTIOQUIA EPS', '', 'EPS-48', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 34, NULL);
INSERT INTO parametros.parametro VALUES (491, 'Inscripción pregrado', '', '13', false, 0.00, '2021-11-03 11:12:44.864319', '2021-11-03 11:14:51.232898', 2, NULL);
INSERT INTO parametros.parametro VALUES (532, 'Duplicado de diplomas', '', '51', false, 0.00, '2021-11-03 11:15:42.940227', '2021-11-03 11:16:10.36846', 2, NULL);
INSERT INTO parametros.parametro VALUES (526, 'Inscripción pregrado', '', '13', false, 0.00, '2021-11-03 11:15:42.902208', '2021-11-03 11:16:57.984046', 2, NULL);
INSERT INTO parametros.parametro VALUES (479, 'Credito pogrado Ingenieria ', '', '90', false, 0.00, '2021-10-06 10:25:30.62065', '2021-11-03 11:20:01.913052', 2, NULL);
INSERT INTO parametros.parametro VALUES (533, 'Derechos de grado', '', '50', false, 0.00, '2021-11-03 11:15:42.946593', '2021-11-03 11:21:54.030747', 2, NULL);
INSERT INTO parametros.parametro VALUES (535, 'Constancia de estudio', '', '41', false, 0.00, '2021-11-03 11:22:54.562432', '2021-11-03 11:24:01.3075', 2, NULL);
INSERT INTO parametros.parametro VALUES (536, 'Copia acta de grado', '', '49', false, 0.00, '2021-11-03 11:22:54.568661', '2021-11-03 11:24:04.455393', 2, NULL);
INSERT INTO parametros.parametro VALUES (545, 'Inscripción postgrado', '', '12', false, 0.00, '2021-11-03 11:22:54.62735', '2021-11-03 11:31:20.425028', 2, NULL);
INSERT INTO parametros.parametro VALUES (537, 'Derechos de grado', '', '50', false, 0.00, '2021-11-03 11:22:54.574753', '2021-11-03 11:31:43.356046', 2, NULL);
INSERT INTO parametros.parametro VALUES (538, 'Duplicado de diplomas', '', '51', false, 0.00, '2021-11-03 11:22:54.584272', '2021-11-03 11:31:46.154466', 2, NULL);
INSERT INTO parametros.parametro VALUES (539, 'Carnet', '', '42', false, 0.00, '2021-11-03 11:22:54.590877', '2021-11-03 11:31:48.970168', 2, NULL);
INSERT INTO parametros.parametro VALUES (540, 'Duplicado de carnet', '', '44', false, 0.00, '2021-11-03 11:22:54.597038', '2021-11-03 11:31:52.94005', 2, NULL);
INSERT INTO parametros.parametro VALUES (541, 'Cursos vacacionales', '', '31', false, 0.00, '2021-11-03 11:22:54.603082', '2021-11-03 11:31:55.762742', 2, NULL);
INSERT INTO parametros.parametro VALUES (542, 'Sistematización', '', '43', false, 0.00, '2021-11-03 11:22:54.609101', '2021-11-03 11:31:58.691555', 2, NULL);
INSERT INTO parametros.parametro VALUES (543, 'Multas biblioteca', '', '70', false, 0.00, '2021-11-03 11:22:54.615433', '2021-11-03 11:32:01.592557', 2, NULL);
INSERT INTO parametros.parametro VALUES (544, 'Inscripcion pregrado', '', '8672', false, 0.00, '2021-11-03 11:22:54.621405', '2021-11-03 11:32:05.98533', 2, NULL);
INSERT INTO parametros.parametro VALUES (546, 'Certificado de notas', '', '40', true, 0.00, '2021-11-03 11:36:28.020562', '2021-11-03 11:36:28.020656', 2, NULL);
INSERT INTO parametros.parametro VALUES (547, 'Constancia de estudio', '', '41', true, 0.00, '2021-11-03 11:36:28.031792', '2021-11-03 11:36:28.031844', 2, NULL);
INSERT INTO parametros.parametro VALUES (549, 'Derechos de grado', '', '50', true, 0.00, '2021-11-03 11:36:28.044448', '2021-11-03 11:36:28.044505', 2, NULL);
INSERT INTO parametros.parametro VALUES (550, 'Duplicado de diplomas', '', '51', true, 0.00, '2021-11-03 11:36:28.050079', '2021-11-03 11:36:28.050137', 2, NULL);
INSERT INTO parametros.parametro VALUES (552, 'Duplicado de carnet', '', '44', true, 0.00, '2021-11-03 11:36:28.061909', '2021-11-03 11:36:28.061956', 2, NULL);
INSERT INTO parametros.parametro VALUES (553, 'Cursos vacacionales', '', '31', true, 0.00, '2021-11-03 11:36:28.067995', '2021-11-03 11:36:28.068058', 2, NULL);
INSERT INTO parametros.parametro VALUES (554, 'Sistematización', '', '43', true, 0.00, '2021-11-03 11:36:28.073615', '2021-11-03 11:36:28.073713', 2, NULL);
INSERT INTO parametros.parametro VALUES (555, 'Multas biblioteca', '', '70', true, 0.00, '2021-11-03 11:36:28.079009', '2021-11-03 11:36:28.079072', 2, NULL);
INSERT INTO parametros.parametro VALUES (556, 'Inscripcion pregrado', '', '8672', true, 0.00, '2021-11-03 11:36:28.084899', '2021-11-03 11:36:28.084956', 2, NULL);
INSERT INTO parametros.parametro VALUES (557, 'Inscripción postgrado', '', '12', true, 0.00, '2021-11-03 11:36:28.09078', '2021-11-03 11:36:28.090855', 2, NULL);
INSERT INTO parametros.parametro VALUES (558, 'Crédito Pregrado', '', '98', false, 0.00, '2021-11-03 11:38:03.78513', '2021-11-03 11:38:44.005845', 2, NULL);
INSERT INTO parametros.parametro VALUES (560, 'Constancia de estudio', '', '41', false, 0.00, '2021-11-03 11:40:27.787077', '2021-11-08 11:22:57.222724', 2, NULL);
INSERT INTO parametros.parametro VALUES (559, 'Certificado de notas', '', '40', false, 0.00, '2021-11-03 11:39:37.658322', '2021-11-08 11:23:00.578075', 2, NULL);
INSERT INTO parametros.parametro VALUES (561, 'Inscripción ', '', '41', true, 0.00, '2021-11-08 11:24:05.369743', '2021-11-08 11:24:05.369847', 2, NULL);
INSERT INTO parametros.parametro VALUES (548, 'Copia acta de grado', '', '49', true, 0.00, '2021-11-03 11:36:28.038672', '2022-03-03 22:23:09.973258', 2, NULL);
INSERT INTO parametros.parametro VALUES (314, 'ORDEN PAGO', 'Documentos que aplican como un compromiso', 'PRES-ORPA', true, 1.00, '2021-02-12 00:58:00.731', '2021-02-12 00:58:00.731116', 16, NULL);
INSERT INTO parametros.parametro VALUES (316, 'ORDEN COMPRA', 'Documentos que aplican como un compromiso', 'PRES-ORCOM', true, 1.00, '2021-02-12 00:59:26.345691', '2021-02-12 00:59:26.345779', 16, NULL);
INSERT INTO parametros.parametro VALUES (318, 'RECTOR', 'RECTOR', 'R', true, 1.00, '2021-02-16 17:20:36.548016', '2021-02-16 17:20:36.548133', 15, NULL);
INSERT INTO parametros.parametro VALUES (319, 'VICERECTOR ACADÉMICO', 'VICERECTOR ACADÉMICO', 'VA', true, 1.00, '2021-02-16 17:27:14.082122', '2021-02-16 17:27:14.082232', 15, NULL);
INSERT INTO parametros.parametro VALUES (334, 'Requisito de prueba Dalia', 'Descripción de prueba', 'DM', true, 0.00, '2021-04-04 00:00:00', '2021-03-08 12:35:03.528632', 18, 324);
INSERT INTO parametros.parametro VALUES (321, 'DECANO', 'DECANO', 'D', true, 1.00, '2021-02-16 17:33:25.882634', '2021-02-16 17:33:25.882745', 15, NULL);
INSERT INTO parametros.parametro VALUES (322, 'DIRECTOR DE INSTITUTO', 'DIRECTOR DE INSTITUTO', 'DI', true, 1.00, '2021-02-16 17:35:38.240354', '2021-02-16 17:35:38.240459', 15, NULL);
INSERT INTO parametros.parametro VALUES (323, 'VICERECTOR ADMINISTRATIVO Y FINANCIERO', 'VICERECTOR ADMINISTRATIVO Y FINANCIERO', 'VAF', true, 1.00, '2021-02-16 17:43:12.755216', '2021-02-16 17:43:12.755323', 15, NULL);
INSERT INTO parametros.parametro VALUES (324, 'Requisitos de Avance', 'Parametro padre para los requisitos de avance', 'REQ-AVC', true, 1.00, '2021-02-23 17:43:12.755216', '2021-02-23 17:44:12.755216', 18, NULL);
INSERT INTO parametros.parametro VALUES (325, 'Especificaciones de Avance', 'Parametro padre para las especificaciones del avance', 'ESP-AVC', true, 2.00, '2021-02-23 17:43:12.755216', '2021-02-23 17:44:12.755216', 18, NULL);
INSERT INTO parametros.parametro VALUES (336, 'Requisito de prueba 3', 'Descripción 3', 'DMMA', true, 0.00, '2021-03-03 00:00:00', '2021-03-08 12:35:07.124939', 18, 324);
INSERT INTO parametros.parametro VALUES (335, 'Requisito de prueba 2', 'Descripción de prueba 2', 'JP', true, 0.00, '2021-03-03 00:00:00', '2021-03-08 12:35:09.059591', 18, 324);
INSERT INTO parametros.parametro VALUES (347, 'Inscripciones apoyo alimentario', 'Habilitar inscripciones al servicio de apoyo alimentario a un periodo', 'IAPAL', true, 0.00, '2021-03-15 13:10:54.622019', '2021-03-15 13:10:54.622111', 21, NULL);
INSERT INTO parametros.parametro VALUES (337, 'Requisito de prueba 4', 'Descripción de prueba 4', 'JJ', true, 0.00, '2021-03-03 00:00:00', '2021-07-28 10:13:32.539173', 18, 324);
INSERT INTO parametros.parametro VALUES (392, 'FACTURA', 'Factura con el lleno de los requisitos', 'FA', true, 0.00, '2021-09-06 10:24:14.64906', '2021-09-06 10:24:14.64919', 18, 324);
INSERT INTO parametros.parametro VALUES (426, 'pendiente', 'Indica que el pago de este concepto está pendiente', 'ED_01', true, NULL, '2021-09-13 10:35:44.054232', '2021-09-13 10:35:44.054232', 33, NULL);
INSERT INTO parametros.parametro VALUES (427, 'disponible', 'Indica que el pago de este concepto se puede realizar', 'ED_02', true, NULL, '2021-09-13 10:35:44.054232', '2021-09-13 10:35:44.054232', 33, NULL);
INSERT INTO parametros.parametro VALUES (428, 'pagado', 'Concepto pagado', 'ED_03', true, NULL, '2021-09-13 10:35:44.054232', '2021-09-13 10:35:44.054232', 33, NULL);
INSERT INTO parametros.parametro VALUES (72, 'Inscripción posgrado', '', '12', false, 0.00, '2020-12-21 14:27:52.934658', '2021-09-17 06:37:53.466974', 2, NULL);
INSERT INTO parametros.parametro VALUES (360, 'prueba ', '', '1234', false, 0.00, '2021-06-27 23:05:07.747587', '2021-09-17 06:40:43.087771', 2, NULL);
INSERT INTO parametros.parametro VALUES (476, 'Pendiente', 'La preliquidación está pendiente a revisión, pero aún acepta cambios', 'EPL_005', true, NULL, '2021-09-23 00:00:00', '2021-09-23 00:00:00', 27, NULL);
INSERT INTO parametros.parametro VALUES (509, 'Sistematización', '', '43', false, 0.00, '2021-11-03 11:15:42.796726', '2021-11-03 11:20:06.923527', 2, NULL);
INSERT INTO parametros.parametro VALUES (480, 'Peso Colombiano', 'Divisa utilizada en Colombia', 'COP', true, 0.00, '2021-10-14 11:55:21.610744', '2021-10-14 11:55:21.610865', 35, NULL);
INSERT INTO parametros.parametro VALUES (481, 'Dolar americano', 'Divisa utilizada en Estados Unidos de America', 'USD', true, 0.00, '2021-10-14 11:56:31.540381', '2021-10-14 11:56:31.540454', 35, NULL);
INSERT INTO parametros.parametro VALUES (482, 'Euro', 'Divisa utilizada en la union europea', 'EUR', true, 0.00, '2021-10-14 11:58:35.065416', '2021-10-14 11:58:35.065523', 35, NULL);
INSERT INTO parametros.parametro VALUES (338, 'Especificación de prueba Dalia', 'Descripción de prueba', 'DM', true, 0.00, '2021-03-04 00:27:38.289191', '2021-10-21 12:30:58.420194', 18, 325);
INSERT INTO parametros.parametro VALUES (484, 'Servicios Asistenciales', 'Servicios Asistenciales', 'SA', true, 0.00, '2021-10-26 15:06:43.252835', '2021-10-26 15:06:43.252956', 36, NULL);
INSERT INTO parametros.parametro VALUES (485, 'Servicios Técnicos o Tecnológicos', 'Servicios Técnicos o Tecnológicos', 'STT', true, 0.00, '2021-10-26 15:07:48.640658', '2021-10-26 15:07:48.640734', 36, NULL);
INSERT INTO parametros.parametro VALUES (486, 'Servicios Profesionales', 'Servicios Profesionales', 'SP', true, 0.00, '2021-10-26 15:08:23.749871', '2021-10-26 15:08:23.749971', 36, NULL);
INSERT INTO parametros.parametro VALUES (487, 'Servicios Profesionales Especializados', 'Servicios Profesionales Especializados', 'SPE', true, 0.00, '2021-10-26 15:09:09.571489', '2021-10-26 15:09:09.571574', 36, NULL);
INSERT INTO parametros.parametro VALUES (488, 'Perfil Asesor I', 'Perfil Asesor I', 'PA-I', true, 0.00, '2021-10-26 15:09:51.660378', '2021-10-26 15:09:51.660461', 36, NULL);
INSERT INTO parametros.parametro VALUES (489, 'Perfil Asesor II', 'Perfil Asesor II', 'PA-II', true, 0.00, '2021-10-26 15:10:12.4406', '2021-10-26 15:10:12.440671', 36, NULL);
INSERT INTO parametros.parametro VALUES (490, 'Inscripción posgrado', '', '12', false, 0.00, '2021-11-03 11:12:28.945986', '2021-11-03 11:14:54.212786', 2, NULL);
INSERT INTO parametros.parametro VALUES (531, 'Carnet', '', '42', false, 0.00, '2021-11-03 11:15:42.933457', '2021-11-03 11:16:15.54975', 2, NULL);
INSERT INTO parametros.parametro VALUES (530, 'Duplicado de carnet', '', '44', false, 0.00, '2021-11-03 11:15:42.926302', '2021-11-03 11:16:19.489565', 2, NULL);
INSERT INTO parametros.parametro VALUES (529, 'Cursos vacacionales', '', '31', false, 0.00, '2021-11-03 11:15:42.919967', '2021-11-03 11:16:23.65322', 2, NULL);
INSERT INTO parametros.parametro VALUES (528, 'Sistematización', '', '43', false, 0.00, '2021-11-03 11:15:42.91419', '2021-11-03 11:16:26.852176', 2, NULL);
INSERT INTO parametros.parametro VALUES (527, 'Multas biblioteca', '', '70', false, 0.00, '2021-11-03 11:15:42.908376', '2021-11-03 11:16:30.626604', 2, NULL);
INSERT INTO parametros.parametro VALUES (525, 'Inscripción posgrado', '', '12', false, 0.00, '2021-11-03 11:15:42.896076', '2021-11-03 11:17:01.046969', 2, NULL);
INSERT INTO parametros.parametro VALUES (524, 'Credito Civil', '', '467', false, 0.00, '2021-11-03 11:15:42.889677', '2021-11-03 11:17:04.255771', 2, NULL);
INSERT INTO parametros.parametro VALUES (523, 'Credito pogrado Ingenieria ', '', '90', false, 0.00, '2021-11-03 11:15:42.88256', '2021-11-03 11:17:07.282676', 2, NULL);
INSERT INTO parametros.parametro VALUES (522, 'Credito Civil', '', '467', false, 0.00, '2021-11-03 11:15:42.876722', '2021-11-03 11:17:10.401608', 2, NULL);
INSERT INTO parametros.parametro VALUES (521, 'Credito pogrado Ingenieria ', '', '90', false, 0.00, '2021-11-03 11:15:42.870481', '2021-11-03 11:17:13.762685', 2, NULL);
INSERT INTO parametros.parametro VALUES (520, 'Certificado de notas', '', '40', false, 0.00, '2021-11-03 11:15:42.864319', '2021-11-03 11:17:16.434892', 2, NULL);
INSERT INTO parametros.parametro VALUES (519, 'Constancia de estudio', '', '41', false, 0.00, '2021-11-03 11:15:42.858288', '2021-11-03 11:17:19.769107', 2, NULL);
INSERT INTO parametros.parametro VALUES (518, 'Copia acta de grado', '', '49', false, 0.00, '2021-11-03 11:15:42.852089', '2021-11-03 11:17:22.944851', 2, NULL);
INSERT INTO parametros.parametro VALUES (517, 'Certificado de notas', '', '40', false, 0.00, '2021-11-03 11:15:42.846143', '2021-11-03 11:17:25.716819', 2, NULL);
INSERT INTO parametros.parametro VALUES (516, 'Constancia de estudio', '', '41', false, 0.00, '2021-11-03 11:15:42.8399', '2021-11-03 11:17:48.519932', 2, NULL);
INSERT INTO parametros.parametro VALUES (515, 'Copia acta de grado', '', '49', false, 0.00, '2021-11-03 11:15:42.833785', '2021-11-03 11:18:49.03768', 2, NULL);
INSERT INTO parametros.parametro VALUES (514, 'Derechos de grado', '', '50', false, 0.00, '2021-11-03 11:15:42.827434', '2021-11-03 11:18:52.088922', 2, NULL);
INSERT INTO parametros.parametro VALUES (500, 'Derechos de grado', '', '50', false, 0.00, '2021-11-03 11:15:08.61161', '2021-11-03 11:18:55.922047', 2, NULL);
INSERT INTO parametros.parametro VALUES (499, 'Duplicado de diplomas', '', '51', false, 0.00, '2021-11-03 11:15:08.605483', '2021-11-03 11:18:58.836963', 2, NULL);
INSERT INTO parametros.parametro VALUES (498, 'Carnet', '', '42', false, 0.00, '2021-11-03 11:15:08.599446', '2021-11-03 11:19:01.514775', 2, NULL);
INSERT INTO parametros.parametro VALUES (513, 'Duplicado de diplomas', '', '51', false, 0.00, '2021-11-03 11:15:42.820894', '2021-11-03 11:19:04.057226', 2, NULL);
INSERT INTO parametros.parametro VALUES (512, 'Carnet', '', '42', false, 0.00, '2021-11-03 11:15:42.81501', '2021-11-03 11:19:06.767113', 2, NULL);
INSERT INTO parametros.parametro VALUES (497, 'Duplicado de carnet', '', '44', false, 0.00, '2021-11-03 11:15:08.593201', '2021-11-03 11:19:10.793778', 2, NULL);
INSERT INTO parametros.parametro VALUES (496, 'Cursos vacacionales', '', '31', false, 0.00, '2021-11-03 11:15:08.586079', '2021-11-03 11:19:13.805863', 2, NULL);
INSERT INTO parametros.parametro VALUES (495, 'Sistematización', '', '43', false, 0.00, '2021-11-03 11:15:08.579671', '2021-11-03 11:19:24.168833', 2, NULL);
INSERT INTO parametros.parametro VALUES (494, 'Multas biblioteca', '', '70', false, 0.00, '2021-11-03 11:15:08.571649', '2021-11-03 11:19:27.011497', 2, NULL);
INSERT INTO parametros.parametro VALUES (493, 'Inscripción pregrado', '', '13', false, 0.00, '2021-11-03 11:15:08.565244', '2021-11-03 11:19:30.751789', 2, NULL);
INSERT INTO parametros.parametro VALUES (511, 'Duplicado de carnet', '', '44', false, 0.00, '2021-11-03 11:15:42.808936', '2021-11-03 11:19:33.715926', 2, NULL);
INSERT INTO parametros.parametro VALUES (492, 'Inscripción posgrado', '', '12', false, 0.00, '2021-11-03 11:15:08.558136', '2021-11-03 11:19:44.157522', 2, NULL);
INSERT INTO parametros.parametro VALUES (510, 'Cursos vacacionales', '', '31', false, 0.00, '2021-11-03 11:15:42.802877', '2021-11-03 11:19:55.332701', 2, NULL);
INSERT INTO parametros.parametro VALUES (483, 'Credito Civil', '', '467', false, 0.00, '2021-10-15 14:57:55.315854', '2021-11-03 11:19:58.015211', 2, NULL);
INSERT INTO parametros.parametro VALUES (508, 'Multas biblioteca', '', '70', false, 0.00, '2021-11-03 11:15:42.790614', '2021-11-03 11:20:09.861753', 2, NULL);
INSERT INTO parametros.parametro VALUES (507, 'Inscripción pregrado', '', '13', false, 0.00, '2021-11-03 11:15:42.784371', '2021-11-03 11:20:21.428646', 2, NULL);
INSERT INTO parametros.parametro VALUES (506, 'Inscripción posgrado', '', '12', false, 0.00, '2021-11-03 11:15:42.777851', '2021-11-03 11:20:24.361019', 2, NULL);
INSERT INTO parametros.parametro VALUES (505, 'Credito Civil', '', '467', false, 0.00, '2021-11-03 11:15:08.655819', '2021-11-03 11:20:27.034357', 2, NULL);
INSERT INTO parametros.parametro VALUES (504, 'Credito pogrado Ingenieria ', '', '90', false, 0.00, '2021-11-03 11:15:08.648806', '2021-11-03 11:20:30.369821', 2, NULL);
INSERT INTO parametros.parametro VALUES (503, 'Certificado de notas', '', '40', false, 0.00, '2021-11-03 11:15:08.642517', '2021-11-03 11:21:39.780007', 2, NULL);
INSERT INTO parametros.parametro VALUES (502, 'Constancia de estudio', '', '41', false, 0.00, '2021-11-03 11:15:08.636371', '2021-11-03 11:21:42.47713', 2, NULL);
INSERT INTO parametros.parametro VALUES (501, 'Copia acta de grado', '', '49', false, 0.00, '2021-11-03 11:15:08.630073', '2021-11-03 11:21:45.351037', 2, NULL);
INSERT INTO parametros.parametro VALUES (562, 'prueba', '', '56', true, 0.00, '2021-11-08 11:24:20.65146', '2021-11-08 11:24:20.651539', 2, NULL);
INSERT INTO parametros.parametro VALUES (572, 'Cuenta De Ahorros', 'Cuenta bancaria de ahorros', 'CA', true, 0.00, '2021-11-17 19:48:11.138087', '2021-11-17 19:48:11.138202', 37, NULL);
INSERT INTO parametros.parametro VALUES (573, 'Cuenta Corriente', 'Cuenta bancaria corriente', 'CC', true, 0.00, '2021-11-17 19:49:39.636195', '2021-11-17 19:49:39.636274', 37, NULL);
INSERT INTO parametros.parametro VALUES (574, 'Bus', 'Vehículo automotor para pasajeros de gran capacidad y recorrido fijo dentro de una urbe.', 'Bus', true, 1.00, '2021-11-19 00:45:42.076976', '2021-11-19 00:45:42.076976', 38, NULL);
INSERT INTO parametros.parametro VALUES (575, 'Buseta', 'Vehículo automóvil, más pequeño que un autobús, para el transporte de unos 20 pasajeros sentados.', 'Buseta', true, 2.00, '2021-11-19 00:46:41.893218', '2021-11-19 00:46:41.893218', 38, NULL);
INSERT INTO parametros.parametro VALUES (576, 'Colectivo', 'Automóvil para transportar pasajeros sentados y de pie a lo largo de un trayecto urbano prefijado.', 'Colectivo', true, 3.00, '2021-11-19 00:58:13.69348', '2021-11-19 00:58:13.69348', 38, NULL);
INSERT INTO parametros.parametro VALUES (577, 'Otro', 'Vehículos no registrados en el sistema.', 'Otro', true, 5.00, '2021-11-19 00:59:14.373488', '2021-11-19 00:59:14.373488', 38, NULL);
INSERT INTO parametros.parametro VALUES (297, 'HORA CÁTEDRA PRESTACIONES', 'HORA CÁTEDRA PRESTACIONES', 'HCP', true, 2.00, '2021-01-28 15:28:00', '2021-11-19 19:56:31.182047', 14, 295);
INSERT INTO parametros.parametro VALUES (578, 'Prueba', '', '123', true, 0.00, '2021-11-22 10:44:06.115854', '2021-11-22 10:44:06.11594', 2, NULL);
INSERT INTO parametros.parametro VALUES (579, 'Prueba manual', '', '8794', false, 0.00, '2021-11-22 10:56:19.112424', '2021-11-22 11:25:24.447542', 2, NULL);
INSERT INTO parametros.parametro VALUES (583, 'Resolución de Vinculación', 'Resolución que permite la vinculación docentes', 'RVIN', true, 1.00, '2021-11-22 15:03:27.588006', '2021-11-22 15:14:07.049585', 39, NULL);
INSERT INTO parametros.parametro VALUES (584, 'Resolución de Adición', 'Resolución que se crea para adicionar horas a los docentes elegidos de la resolución que reemplaza', 'RADD', true, 2.00, '2021-11-22 16:12:07.107273', '2021-11-22 16:12:07.107396', 39, NULL);
INSERT INTO parametros.parametro VALUES (585, 'Resolución de Reducción', 'Resolución que se crea para quita horas a los docentes elegidos de la resolución a la que reemplaza', 'RRED', true, 3.00, '2021-11-22 16:12:54.071134', '2021-11-22 16:12:54.071216', 39, NULL);
INSERT INTO parametros.parametro VALUES (2471, 'ADMINISTRACIÓN DE EMPRESAS AGROINDUSTRIALES', 'ADMINISTRACIÓN DE EMPRESAS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (586, 'Resolución de Cancelación', 'Resolución que anula una ya existente y corta el vinculo de los docentes elegidos con la Universidad', 'RCAN', true, 4.00, '2021-11-22 16:13:36.213038', '2021-11-22 16:13:36.213115', 39, NULL);
INSERT INTO parametros.parametro VALUES (594, 'Puntos Salariales', 'Valor establecido por el gobierno nacional par el cálculo de salarios de los docentes uiversitarios', 'PSAL', true, 18.00, '2021-12-14 10:01:09.11637', '2021-12-14 10:01:09.116489', 41, NULL);
INSERT INTO parametros.parametro VALUES (595, 'Punto Salarial vigencia 2019', 'Decreto 1019 del 6 de Junio de 2019', 'PSAL', true, 18.00, '2021-12-14 10:09:34.44518', '2021-12-14 10:09:34.445287', 41, 594);
INSERT INTO parametros.parametro VALUES (596, 'Punto Salarial vigencia 2020', 'Decreto 310 del 27 de Febrero de 2020', 'PSAL', true, 18.00, '2021-12-14 10:10:49.062888', '2021-12-14 10:10:49.062989', 41, 594);
INSERT INTO parametros.parametro VALUES (597, 'Punto Salarial vigencia 2021', 'Decreto 971 del 22 de agosto de 2021', 'PSAL', true, 18.00, '2021-12-14 10:11:39.806654', '2021-12-14 10:11:39.80676', 41, 594);
INSERT INTO parametros.parametro VALUES (598, 'Solicitada', 'La resolución se ha creado y se encuentra en proceso', 'RSOL', true, 19.00, '2022-01-03 10:46:17.661598', '2022-01-03 10:46:17.66169', 42, NULL);
INSERT INTO parametros.parametro VALUES (599, 'Por revisar', 'La resolución ha sido enviada para revisión', 'RREV', true, 19.00, '2022-01-03 10:46:58.991425', '2022-01-03 10:46:58.991587', 42, NULL);
INSERT INTO parametros.parametro VALUES (600, 'Anulada', 'La resolución ha sido anulada y no se va a utilizar', 'RANU', true, 19.00, '2022-01-03 10:47:43.565935', '2022-01-03 10:47:43.566032', 42, NULL);
INSERT INTO parametros.parametro VALUES (601, 'Aprobada', 'La resolución ha sido aprobada por la oficina de docencia', 'RAPR', true, 19.00, '2022-01-03 10:48:43.063222', '2022-01-03 10:48:43.0633', 42, NULL);
INSERT INTO parametros.parametro VALUES (602, 'Expedida', 'La resolución ha sido expedida por el jefe de dependencia correspondiente', 'REXP', true, 19.00, '2022-01-03 10:49:40.420062', '2022-01-03 10:49:40.420196', 42, NULL);
INSERT INTO parametros.parametro VALUES (620, 'prueba', '', '56', true, 0.00, '2022-01-07 11:01:21.902936', '2022-01-07 11:01:21.903278', 2, NULL);
INSERT INTO parametros.parametro VALUES (621, 'prueba2', '', '76', true, 0.00, '2022-01-07 11:01:21.911844', '2022-01-07 11:01:21.912029', 2, NULL);
INSERT INTO parametros.parametro VALUES (86, 'Multas biblioteca', '', '70', false, 0.00, '2020-12-30 10:11:20.860109', '2022-01-07 11:39:35.473737', 2, NULL);
INSERT INTO parametros.parametro VALUES (622, 'Egresos', 'Egresos', 'EGR', true, 0.00, '2022-01-10 14:39:58.290556', '2022-01-10 14:39:58.290725', 43, NULL);
INSERT INTO parametros.parametro VALUES (623, 'Ingresos', 'Ingresos', 'ING', true, 0.00, '2022-01-10 14:40:27.728175', '2022-01-10 14:40:27.728266', 43, NULL);
INSERT INTO parametros.parametro VALUES (624, 'Ajustes de Egresos', 'Ajustes de Egresos', 'ADE', true, 0.00, '2022-01-10 14:48:07.08438', '2022-01-10 14:48:07.084475', 44, 622);
INSERT INTO parametros.parametro VALUES (625, 'Causación Ordenes de Pago', 'Causación Ordenes de Pago', 'CODP', true, 0.00, '2022-01-10 14:50:36.986792', '2022-01-10 14:50:36.986887', 44, 622);
INSERT INTO parametros.parametro VALUES (626, 'Causación Nómina', 'Causación Nómina', 'CNOM', true, 0.00, '2022-01-10 14:52:11.05132', '2022-01-10 14:52:11.051394', 44, 622);
INSERT INTO parametros.parametro VALUES (627, 'Actas de Giro', 'Actas de Giro', 'ADG', true, 0.00, '2022-01-10 14:53:20.46735', '2022-01-10 14:53:20.467448', 44, 622);
INSERT INTO parametros.parametro VALUES (628, 'Actas de Devolución', 'Actas de Devolución', 'ADD', true, 0.00, '2022-01-10 14:54:00.442624', '2022-01-10 14:54:00.442724', 44, 622);
INSERT INTO parametros.parametro VALUES (629, 'Inversiones en Títulos', 'Inversiones en Títulos', 'IET', true, 0.00, '2022-01-10 14:56:20.989749', '2022-01-10 14:56:20.989841', 44, 622);
INSERT INTO parametros.parametro VALUES (630, 'Ordenes de Pago', 'Ordenes de Pago', 'ODP', true, 0.00, '2022-01-10 14:57:07.003823', '2022-01-10 14:57:07.003897', 44, 622);
INSERT INTO parametros.parametro VALUES (631, 'Nómina', 'Nómina', 'NOM', true, 0.00, '2022-01-10 14:57:30.721228', '2022-01-10 14:57:30.721326', 44, 622);
INSERT INTO parametros.parametro VALUES (632, 'Legalización de Avances', 'Legalización de Avances', 'LDA', true, 0.00, '2022-01-10 14:57:59.432945', '2022-01-10 14:57:59.433039', 44, 622);
INSERT INTO parametros.parametro VALUES (633, 'Seguridad Social', 'Seguridad Social', 'SEGS', true, 0.00, '2022-01-10 14:58:37.378506', '2022-01-10 14:58:37.378577', 44, 622);
INSERT INTO parametros.parametro VALUES (634, 'Ajustes de Ingresos', 'Ajustes de Ingresos', 'AI', true, 0.00, '2022-01-10 16:19:11.359444', '2022-01-10 16:19:11.359517', 44, 623);
INSERT INTO parametros.parametro VALUES (635, 'Sistema Financiero', 'Sistema Financiero', 'SF', true, 0.00, '2022-01-10 16:20:12.278357', '2022-01-10 16:20:12.278429', 44, 623);
INSERT INTO parametros.parametro VALUES (636, 'Inversiones Renta Fija', 'Inversiones Renta Fija', 'IRF', true, 0.00, '2022-01-10 16:20:50.460767', '2022-01-10 16:20:50.460856', 44, 623);
INSERT INTO parametros.parametro VALUES (637, 'Rendimientos Financieros', 'Rendimientos Financieros', 'RF', true, 0.00, '2022-01-10 16:21:23.104133', '2022-01-10 16:21:23.104262', 44, 623);
INSERT INTO parametros.parametro VALUES (638, 'Legalización Avances', 'Legalización Avances', 'LA', true, 0.00, '2022-01-10 16:21:58.03805', '2022-01-10 16:21:58.038121', 44, 623);
INSERT INTO parametros.parametro VALUES (615, 'Inscripción postgrado', '', '12', false, 0.00, '2022-01-07 11:01:21.856043', '2022-01-11 22:43:34.741179', 2, NULL);
INSERT INTO parametros.parametro VALUES (614, 'Inscripcion pregrado', '', '8672', false, 0.00, '2022-01-07 11:01:21.847394', '2022-01-11 22:43:41.726734', 2, NULL);
INSERT INTO parametros.parametro VALUES (564, 'Inscripción ', '', '41', false, 0.00, '2021-11-08 11:28:06.439003', '2022-01-11 22:44:03.973034', 2, NULL);
INSERT INTO parametros.parametro VALUES (580, 'Inscripción ', '', '41', false, 0.00, '2021-11-22 12:30:19.340425', '2022-01-11 22:44:06.970098', 2, NULL);
INSERT INTO parametros.parametro VALUES (605, 'Constancia de estudio', '', '41', false, 0.00, '2022-01-07 11:01:21.741556', '2022-01-11 22:44:10.321246', 2, NULL);
INSERT INTO parametros.parametro VALUES (616, 'Inscripción ', '', '41', false, 0.00, '2022-01-07 11:01:21.864827', '2022-01-11 22:44:13.121805', 2, NULL);
INSERT INTO parametros.parametro VALUES (619, 'Inscripción ', '', '41', false, 0.00, '2022-01-07 11:01:21.894226', '2022-01-11 22:44:16.312717', 2, NULL);
INSERT INTO parametros.parametro VALUES (606, 'Copia acta de grado', '', '49', false, 0.00, '2022-01-07 11:01:21.76886', '2022-01-11 22:44:25.098639', 2, NULL);
INSERT INTO parametros.parametro VALUES (607, 'Derechos de grado', '', '50', false, 0.00, '2022-01-07 11:01:21.779823', '2022-01-11 22:44:36.452871', 2, NULL);
INSERT INTO parametros.parametro VALUES (608, 'Duplicado de diplomas', '', '51', false, 0.00, '2022-01-07 11:01:21.792288', '2022-01-11 22:44:47.471247', 2, NULL);
INSERT INTO parametros.parametro VALUES (609, 'Carnet', '', '42', false, 0.00, '2022-01-07 11:01:21.80143', '2022-01-11 22:45:04.791203', 2, NULL);
INSERT INTO parametros.parametro VALUES (610, 'Duplicado de carnet', '', '44', false, 0.00, '2022-01-07 11:01:21.810474', '2022-01-11 22:45:19.170448', 2, NULL);
INSERT INTO parametros.parametro VALUES (611, 'Cursos vacacionales', '', '31', false, 0.00, '2022-01-07 11:01:21.820229', '2022-01-11 22:45:30.163517', 2, NULL);
INSERT INTO parametros.parametro VALUES (612, 'Sistematización', '', '43', false, 0.00, '2022-01-07 11:01:21.828972', '2022-01-11 22:45:39.13307', 2, NULL);
INSERT INTO parametros.parametro VALUES (565, 'prueba', '', '56', false, 0.00, '2021-11-08 11:28:06.459821', '2022-01-11 22:46:08.545974', 2, NULL);
INSERT INTO parametros.parametro VALUES (566, 'prueba2', '', '76', false, 0.00, '2021-11-08 11:28:06.467061', '2022-01-11 22:46:12.793766', 2, NULL);
INSERT INTO parametros.parametro VALUES (581, 'prueba', '', '56', false, 0.00, '2021-11-22 12:30:19.42144', '2022-01-11 22:46:16.593091', 2, NULL);
INSERT INTO parametros.parametro VALUES (582, 'prueba2', '', '76', false, 0.00, '2021-11-22 12:30:19.427698', '2022-01-11 22:46:20.984072', 2, NULL);
INSERT INTO parametros.parametro VALUES (617, 'prueba', '', '56', false, 0.00, '2022-01-07 11:01:21.876647', '2022-01-11 22:46:23.929891', 2, NULL);
INSERT INTO parametros.parametro VALUES (618, 'prueba2', '', '76', false, 0.00, '2022-01-07 11:01:21.885509', '2022-01-11 22:46:27.231131', 2, NULL);
INSERT INTO parametros.parametro VALUES (563, 'prueba2', '', '76', false, 0.00, '2021-11-08 11:26:17.488462', '2022-04-01 01:26:48.395612', 2, NULL);
INSERT INTO parametros.parametro VALUES (639, 'Rechazada', 'La resolución requiere correcciones', 'RECH', true, 19.00, '2022-01-11 12:13:38.364078', '2022-01-11 12:13:38.364188', 42, NULL);
INSERT INTO parametros.parametro VALUES (604, 'Certificado de notas', '', '40', false, 0.00, '2022-01-07 11:01:21.666576', '2022-01-11 22:42:20.977618', 2, NULL);
INSERT INTO parametros.parametro VALUES (613, 'Multas biblioteca', '', '70', false, 0.00, '2022-01-07 11:01:21.837358', '2022-01-11 22:45:46.615016', 2, NULL);
INSERT INTO parametros.parametro VALUES (551, 'Carnet', '', '42', true, 0.00, '2021-11-03 11:36:28.056036', '2022-01-12 01:57:53.913587', 2, NULL);
INSERT INTO parametros.parametro VALUES (641, 'Trimestre Uno', 'Primer trimestre del año', 'T1', true, 1.00, '2022-01-19 18:26:15.659975', '2022-01-19 18:26:15.660073', 7, NULL);
INSERT INTO parametros.parametro VALUES (642, 'Trimestre Dos', 'Segundo trimestre del año', 'T2', true, 100.00, '2022-01-19 18:26:57.079865', '2022-01-19 18:26:57.079931', 7, NULL);
INSERT INTO parametros.parametro VALUES (643, 'Trimestre Tres', 'Tercer trimestre del año', 'T3', true, 643.00, '2022-01-19 18:27:21.377889', '2022-01-19 18:27:21.377986', 7, NULL);
INSERT INTO parametros.parametro VALUES (644, 'Trimestre Cuatro', 'Cuarto trimestre del año', 'T4', true, 644.00, '2022-01-19 18:27:46.903423', '2022-01-19 18:27:46.903543', 7, NULL);
INSERT INTO parametros.parametro VALUES (645, 'UNIDAD', 'UNIDAD', 'U', true, 0.00, '2022-02-03 10:51:51.159464', '2022-02-03 10:51:51.159464', 8, NULL);
INSERT INTO parametros.parametro VALUES (647, 'Actas', 'Actas', 'AC', true, 0.00, '2022-02-15 10:34:35.124085', '2022-02-15 10:34:35.12416', 47, NULL);
INSERT INTO parametros.parametro VALUES (648, 'Cheque', 'Cheque', 'CH', true, 0.00, '2022-02-15 10:35:28.669285', '2022-02-15 10:35:28.669427', 47, NULL);
INSERT INTO parametros.parametro VALUES (649, 'Contrato', 'Contrato', 'CON', true, 0.00, '2022-02-15 10:36:00.206738', '2022-02-15 10:36:00.206819', 47, NULL);
INSERT INTO parametros.parametro VALUES (650, 'Cuenta de Cobro', 'Cuenta de Cobro', 'CCO', true, 0.00, '2022-02-15 10:37:02.632106', '2022-02-15 10:37:02.632215', 47, NULL);
INSERT INTO parametros.parametro VALUES (651, 'Expediente', 'Expediente', 'EXP', true, 0.00, '2022-02-15 10:42:18.656209', '2022-02-15 10:42:18.656314', 47, NULL);
INSERT INTO parametros.parametro VALUES (652, 'Nota Debito', 'Nota Debito', 'ND', true, 0.00, '2022-02-15 10:42:43.732291', '2022-02-15 10:42:43.732392', 47, NULL);
INSERT INTO parametros.parametro VALUES (653, 'Nota Credito', 'Nota Credito', 'NC', true, 0.00, '2022-02-15 10:42:59.835794', '2022-02-15 10:42:59.83588', 47, NULL);
INSERT INTO parametros.parametro VALUES (654, 'Orden de Devolución', 'Orden de Devolución', 'OD', true, 0.00, '2022-02-15 10:46:09.174812', '2022-02-15 10:46:09.174902', 47, NULL);
INSERT INTO parametros.parametro VALUES (655, 'Orden de Pago', 'Orden de Pago', 'OP', true, 0.00, '2022-02-15 10:49:46.200838', '2022-02-15 10:49:46.200969', 47, NULL);
INSERT INTO parametros.parametro VALUES (656, 'Recibo de Caja', 'Recibo de Caja', 'RC', true, 0.00, '2022-02-15 10:50:28.390388', '2022-02-15 10:50:28.390462', 47, NULL);
INSERT INTO parametros.parametro VALUES (657, 'Recibo de Consignación', 'Recibo de Consignación', 'RCO', true, 0.00, '2022-02-15 10:51:07.977475', '2022-02-15 10:51:07.977548', 47, NULL);
INSERT INTO parametros.parametro VALUES (658, 'Relación de Autorización', 'Relación de Autorización', 'REA', true, 0.00, '2022-02-15 10:51:45.858498', '2022-02-15 10:51:45.858575', 47, NULL);
INSERT INTO parametros.parametro VALUES (659, 'Soporte Bancario', 'Soporte Bancario', 'SB', true, 0.00, '2022-02-15 10:52:23.187633', '2022-02-15 10:52:23.187736', 47, NULL);
INSERT INTO parametros.parametro VALUES (660, 'Acuerdo', 'Acuerdo', 'ACU', true, 0.00, '2022-02-15 10:53:02.311929', '2022-02-15 10:53:02.312035', 47, NULL);
INSERT INTO parametros.parametro VALUES (661, 'Decreto', 'Decreto', 'DEC', true, 0.00, '2022-02-15 10:53:26.99289', '2022-02-15 10:53:26.99298', 47, NULL);
INSERT INTO parametros.parametro VALUES (663, 'Oficio', 'Oficio', 'OFI', true, 0.00, '2022-02-15 10:54:24.52972', '2022-02-15 10:54:24.529811', 47, NULL);
INSERT INTO parametros.parametro VALUES (664, 'Resolución', 'Resolución', 'RES', true, 0.00, '2022-02-15 10:55:00.542833', '2022-02-15 10:55:00.542937', 47, NULL);
INSERT INTO parametros.parametro VALUES (662, 'Memorando', 'Memorando', 'MEM', true, 0.00, '2022-02-15 10:53:53.823736', '2022-02-15 10:53:53.823826', 47, NULL);
INSERT INTO parametros.parametro VALUES (665, 'ADE HONORARIOS VE NICSP', 'ADE HONORARIOS VE NICSP', 'AHVN', true, 0.00, '2022-02-18 13:49:42.050741', '2022-02-18 13:49:42.050879', 48, 622);
INSERT INTO parametros.parametro VALUES (666, 'ADQUISICION DE BIENES Y SERVICIOS -  NICSP', 'ADQUISICION DE BIENES Y SERVICIOS -  NICSP', 'ABSN', true, 0.00, '2022-02-18 13:51:37.166596', '2022-02-18 13:51:37.166696', 48, 622);
INSERT INTO parametros.parametro VALUES (667, 'ALVACREDITOS SALARIOS VE NICSP', 'ALVACREDITOS SALARIOS VE NICSP', 'ASVN', true, 0.00, '2022-02-18 14:23:39.207475', '2022-02-18 14:23:39.207645', 48, 622);
INSERT INTO parametros.parametro VALUES (669, 'APORTES AL ICBF VE TECN  NICSP', 'APORTES AL ICBF VE TECN  NICSP', 'AICBF', true, 0.00, '2022-02-18 14:52:28.191162', '2022-02-18 14:52:28.191289', 48, 622);
INSERT INTO parametros.parametro VALUES (668, 'APORTE A CAJA DE COMPENSACION FAMILIAR VE TECN NICSP', 'APORTE A CAJA DE COMPENSACION FAMILIAR VE TECN NICSP', 'ACC', true, 0.00, '2022-02-18 14:48:42.78781', '2022-02-18 14:48:42.787908', 48, 622);
INSERT INTO parametros.parametro VALUES (670, 'ARRENDAMIENTO ILUD', 'ARRENDAMIENTO ILUD', 'ARILUD', true, 0.00, '2022-02-18 14:56:46.051668', '2022-02-18 14:56:46.051746', 48, 622);
INSERT INTO parametros.parametro VALUES (671, 'ARRENDAMIENTO OPERATIVO IDEX', 'ARRENDAMIENTO OPERATIVO IDEX', 'AOIDEX', true, 0.00, '2022-02-18 14:57:40.604668', '2022-02-18 14:57:40.604769', 48, 622);
INSERT INTO parametros.parametro VALUES (672, 'ASPU UD VE HONORARIOS NICSP', 'ASPU UD VE HONORARIOS NICSP', 'AUVHN', true, 0.00, '2022-02-18 14:59:17.738043', '2022-02-18 14:59:17.738134', 48, 622);
INSERT INTO parametros.parametro VALUES (673, 'ASPU-UD SALARIOS VE  NICSP', 'ASPU-UD SALARIOS VE  NICSP', 'AUSVN', true, 0.00, '2022-02-18 15:00:43.291692', '2022-02-18 15:00:43.291765', 48, 622);
INSERT INTO parametros.parametro VALUES (674, 'ASPU-VINES SALARIOS VE NICSP', 'ASPU-VINES SALARIOS VE NICSP', 'AVSVN', true, 0.00, '2022-02-18 15:02:01.720562', '2022-02-18 15:02:01.720736', 48, 622);
INSERT INTO parametros.parametro VALUES (675, 'AVANCES ADQ BIENES PEND.LEGALIZAR EA NICSP', 'AVANCES ADQ BIENES PEND.LEGALIZAR EA NICSP', 'AABPL', true, 0.00, '2022-02-18 15:07:15.255414', '2022-02-18 15:07:15.255497', 48, 622);
INSERT INTO parametros.parametro VALUES (676, 'AVANCES NICSP', 'AVANCES NICSP', 'AVN', true, 0.00, '2022-02-18 15:08:06.711462', '2022-02-18 15:08:06.711565', 48, 622);
INSERT INTO parametros.parametro VALUES (677, 'BENEFICIO INSTITUCIONAL CTTO', 'BENEFICIO INSTITUCIONAL CTTO', 'BICTTO', true, 0.00, '2022-02-18 15:09:03.693829', '2022-02-18 15:09:03.693911', 48, 622);
INSERT INTO parametros.parametro VALUES (678, 'BENEFICIO INSTITUCIONAL IDEX', 'BENEFICIO INSTITUCIONAL IDEX', 'BIIDEX', true, 0.00, '2022-02-18 15:09:51.305254', '2022-02-18 15:09:51.30533', 48, 622);
INSERT INTO parametros.parametro VALUES (679, 'BENEFICIO INSTITUCIONAL ILUD', 'BENEFICIO INSTITUCIONAL ILUD', 'BIILUD', true, 0.00, '2022-02-18 15:10:26.728691', '2022-02-18 15:10:26.728791', 48, 622);
INSERT INTO parametros.parametro VALUES (680, 'CA ARRENDAMIENTO ACADEMICO NICSP', 'CA ARRENDAMIENTO ACADEMICO NICSP', 'CAAN', true, 0.00, '2022-02-18 15:11:25.686668', '2022-02-18 15:11:25.686777', 48, 622);
INSERT INTO parametros.parametro VALUES (681, 'CA ARRENDAMIENTO ADMINISTRATIVO NICSP', 'CA ARRENDAMIENTO ADMINISTRATIVO NICSP', 'CAADN', true, 0.00, '2022-02-18 15:13:30.814093', '2022-02-18 15:13:30.814179', 48, 622);
INSERT INTO parametros.parametro VALUES (682, 'CERTIFICADOS Y CONSTANCIAS ILUD', 'CERTIFICADOS Y CONSTANCIAS ILUD', 'CCILUD', true, 0.00, '2022-02-18 15:14:13.146365', '2022-02-18 15:14:13.146466', 48, 622);
INSERT INTO parametros.parametro VALUES (683, 'CESANTIAS ADM- DOCE DIFERENTES FONDOS NICSP', 'CESANTIAS ADM- DOCE DIFERENTES FONDOS NICSP', 'CADDF', true, 0.00, '2022-02-18 15:15:23.945758', '2022-02-18 15:15:23.94585', 48, 622);
INSERT INTO parametros.parametro VALUES (684, 'CESANTIAS DEFINITIVAS ADM NICSP', 'CESANTIAS DEFINITIVAS ADM NICSP', 'CDAN', true, 0.00, '2022-02-18 15:17:22.890375', '2022-02-18 15:17:22.890481', 48, 622);
INSERT INTO parametros.parametro VALUES (685, 'CESANTIAS DEFINITIVAS DOCENTES NICSP', 'CESANTIAS DEFINITIVAS DOCENTES NICSP', 'CDDN', true, 0.00, '2022-02-18 15:18:40.218009', '2022-02-18 15:18:40.218103', 48, 622);
INSERT INTO parametros.parametro VALUES (686, 'CESANTIAS PARCIALES ADMINISTRATIVOS  NICSP', 'CESANTIAS PARCIALES ADMINISTRATIVOS  NICSP', 'CPAN', true, 0.00, '2022-02-18 15:25:57.159277', '2022-02-18 15:25:57.159377', 48, 622);
INSERT INTO parametros.parametro VALUES (687, 'CESANTIAS PREGRADO  DOCENTES NICSP', 'CESANTIAS PREGRADO  DOCENTES NICSP', 'CPDN', true, 0.00, '2022-02-18 15:26:53.463401', '2022-02-18 15:26:53.463495', 48, 622);
INSERT INTO parametros.parametro VALUES (688, 'CONTRATO MANTENIMIENTO ACADEMICO NICSP', 'CONTRATO MANTENIMIENTO ACADEMICO NICSP', 'CMAN', true, 0.00, '2022-02-18 15:27:53.274222', '2022-02-18 15:27:53.274322', 48, 622);
INSERT INTO parametros.parametro VALUES (689, 'CONTRATO MANTENIMIENTO ADM  NICSP', 'CONTRATO MANTENIMIENTO ADM  NICSP', 'CMADM', true, 0.00, '2022-02-18 15:28:45.153729', '2022-02-18 15:28:45.153811', 48, 622);
INSERT INTO parametros.parametro VALUES (690, 'COOTRADECUN SALARIOS VE NICSP', 'COOTRADECUN SALARIOS VE NICSP', 'CSVN', true, 0.00, '2022-02-18 15:29:40.83669', '2022-02-18 15:29:40.836792', 48, 622);
INSERT INTO parametros.parametro VALUES (691, 'COTIZACION A ENTIDADES ADM PENSION VE TECN NICSP', 'COTIZACION A ENTIDADES ADM PENSION VE TECN NICSP', 'CEAP', true, 0.00, '2022-02-18 15:31:00.939611', '2022-02-18 15:31:00.939686', 48, 622);
INSERT INTO parametros.parametro VALUES (692, 'COTIZACION A RIESGOS LABORALES VE TECN  NICSP', 'COTIZACION A RIESGOS LABORALES VE TECN  NICSP', 'CRL', true, 0.00, '2022-02-18 15:32:37.17638', '2022-02-18 15:32:37.176478', 48, 622);
INSERT INTO parametros.parametro VALUES (693, 'COTIZACION A SEGURIDAD SOCIAL EN SALUD VE TECN NICSP', 'COTIZACION A SEGURIDAD SOCIAL EN SALUD VE TECN NICSP', 'CSSS', true, 0.00, '2022-02-18 15:33:38.497234', '2022-02-18 15:33:38.497318', 48, 622);
INSERT INTO parametros.parametro VALUES (694, 'COTIZACION A SEGURIDAD SOCIAL SALUD VE POST NICSP', 'COTIZACION A SEGURIDAD SOCIAL SALUD VE POST NICSP', 'CSSSP', true, 0.00, '2022-02-18 15:34:34.895677', '2022-02-18 15:34:34.895749', 48, 622);
INSERT INTO parametros.parametro VALUES (695, 'CPS SERVICIO ASEO-LIMPIEZA NICSP', 'CPS SERVICIO ASEO-LIMPIEZA NICSP', 'CSAL', true, 0.00, '2022-02-18 15:35:44.733841', '2022-02-18 15:35:44.733919', 48, 622);
INSERT INTO parametros.parametro VALUES (696, 'CPS SERVICIO DE CORRESPONDENCIA NICSP', 'CPS SERVICIO DE CORRESPONDENCIA NICSP', 'CSCN', true, 0.00, '2022-02-18 15:36:42.591894', '2022-02-18 15:36:42.591984', 48, 622);
INSERT INTO parametros.parametro VALUES (697, 'CUOTAS PARTES PENSIONALES (XPAGAR) NICSP', 'CUOTAS PARTES PENSIONALES (XPAGAR) NICSP', 'CPP', true, 0.00, '2022-02-18 15:37:53.065526', '2022-02-18 15:37:53.065604', 48, 622);
INSERT INTO parametros.parametro VALUES (698, 'CUOTAS SOSTENIMIENTO Y AFILIACIONES NICSP', 'CUOTAS SOSTENIMIENTO Y AFILIACIONES NICSP', 'CSAN', true, 0.00, '2022-02-18 15:38:40.275433', '2022-02-18 15:38:40.275512', 48, 622);
INSERT INTO parametros.parametro VALUES (699, 'DESCUENTOS SEGURIDAD SOCIAL VINCULACION ESPECIAL NICSP', 'DESCUENTOS SEGURIDAD SOCIAL VINCULACION ESPECIAL NICSP', 'DSSVE', true, 0.00, '2022-02-18 15:39:49.266959', '2022-02-18 15:39:49.267049', 48, 622);
INSERT INTO parametros.parametro VALUES (700, 'EMI SALARIOS VE NICSP', 'EMI SALARIOS VE NICSP', 'ESVN', true, 0.00, '2022-02-18 15:40:36.587416', '2022-02-18 15:40:36.587492', 48, 622);
INSERT INTO parametros.parametro VALUES (701, 'FEUD SALARIOS VE NICSP', 'FEUD SALARIOS VE NICSP', 'FSVN', true, 0.00, '2022-02-18 15:41:21.610118', '2022-02-18 15:41:21.610207', 48, 622);
INSERT INTO parametros.parametro VALUES (702, 'GASTOS BANCARIOS CTTO', 'GASTOS BANCARIOS CTTO', 'GBCTTO', true, 0.00, '2022-02-18 15:42:05.762018', '2022-02-18 15:42:05.762141', 48, 622);
INSERT INTO parametros.parametro VALUES (703, 'GASTOS BANCARIOS IDEX', 'GASTOS BANCARIOS IDEX', 'GBIDEX', true, 0.00, '2022-02-18 15:42:37.531576', '2022-02-18 15:42:37.531668', 48, 622);
INSERT INTO parametros.parametro VALUES (704, 'GASTOS GENERALES CTTO', 'GASTOS GENERALES CTTO', 'GGCTTO', true, 0.00, '2022-02-18 15:43:27.349323', '2022-02-18 15:43:27.3494', 48, 622);
INSERT INTO parametros.parametro VALUES (705, 'GRAVAMEN A LOS MOVIMIENTOS FINANC ILUD', 'GRAVAMEN A LOS MOVIMIENTOS FINANC ILUD', 'GMFILUD', true, 0.00, '2022-02-18 15:44:39.346081', '2022-02-18 15:44:39.346177', 48, 622);
INSERT INTO parametros.parametro VALUES (712, 'HONORARIOS ACAD ILUD', 'HONORARIOS ACAD ILUD', 'HAILUD', true, 0.00, '2022-02-18 15:45:58.632254', '2022-02-18 15:45:58.632347', 48, 622);
INSERT INTO parametros.parametro VALUES (713, 'IMPUESTO VEHIULOS NICSP', 'IMPUESTO VEHIULOS NICSP', 'IMVE', true, 0.00, '2022-02-18 15:46:39.122431', '2022-02-18 15:46:39.122558', 48, 622);
INSERT INTO parametros.parametro VALUES (714, 'INSCRIPCION MARTRICULAS-SEMINARIOS -DIPLOMADOS Y OTROS NICSP', 'INSCRIPCION MARTRICULAS-SEMINARIOS -DIPLOMADOS Y OTROS NICSP', 'IMSDO', true, 0.00, '2022-02-18 15:47:37.694556', '2022-02-18 15:47:37.694657', 48, 622);
INSERT INTO parametros.parametro VALUES (715, 'INTERESES DE CESANTIAS ADM-DOC NICSP', 'INTERESES DE CESANTIAS ADM-DOC NICSP', 'ICAD', true, 0.00, '2022-02-18 15:48:22.178654', '2022-02-18 15:48:22.17878', 48, 622);
INSERT INTO parametros.parametro VALUES (716, 'MANTENIMIENTO Y REPARACIONES ILUD', 'MANTENIMIENTO Y REPARACIONES ILUD', 'MRILUD', true, 0.00, '2022-02-18 17:05:30.672885', '2022-02-18 17:05:30.673006', 48, 622);
INSERT INTO parametros.parametro VALUES (717, 'MATRICULAS ILUD', 'MATRICULAS ILUD', 'MILUD', true, 0.00, '2022-02-18 17:06:17.818039', '2022-02-18 17:06:17.818137', 48, 622);
INSERT INTO parametros.parametro VALUES (718, 'MULTAS Y SANCIONES NICSP', 'MULTAS Y SANCIONES NICSP', 'MSN', true, 0.00, '2022-02-18 17:06:51.101546', '2022-02-18 17:06:51.101665', 48, 622);
INSERT INTO parametros.parametro VALUES (719, 'NOMINA ESTIMULOS ACAD MONITORES-AUXILIARES INVESTIGACION NICSP', 'NOMINA ESTIMULOS ACAD MONITORES-AUXILIARES INVESTIGACION NICSP', 'NEAMI', true, 0.00, '2022-02-18 17:07:37.238837', '2022-02-18 17:07:37.238932', 48, 622);
INSERT INTO parametros.parametro VALUES (720, 'NOMINA HONORARIOS VE ILUD NICSP', 'NOMINA HONORARIOS VE ILUD NICSP', 'NHILUD', true, 0.00, '2022-02-18 17:08:15.979695', '2022-02-18 17:08:15.97977', 48, 622);
INSERT INTO parametros.parametro VALUES (721, 'NOMINA HONORARIOS VE POSTGRADOS NICSP', 'NOMINA HONORARIOS VE POSTGRADOS NICSP', 'NHPN', true, 0.00, '2022-02-18 17:08:56.644674', '2022-02-18 17:08:56.644799', 48, 622);
INSERT INTO parametros.parametro VALUES (722, 'NOMINA HONORARIOS VE PREGRADO NICSP', 'NOMINA HONORARIOS VE PREGRADO NICSP', 'NHPREN', true, 0.00, '2022-02-18 17:09:35.886341', '2022-02-18 17:09:35.886426', 48, 622);
INSERT INTO parametros.parametro VALUES (723, 'NOMINA HONORARIOS VE TECNOLOGICA NICSP', 'NOMINA HONORARIOS VE TECNOLOGICA NICSP', 'NHTN', true, 0.00, '2022-02-18 17:10:06.922841', '2022-02-18 17:10:06.922919', 48, 622);
INSERT INTO parametros.parametro VALUES (724, 'NOMINA MATICULAS DE  HONOR  NICSP', 'NOMINA MATICULAS DE  HONOR  NICSP', 'NMHN', true, 0.00, '2022-02-18 17:10:44.098491', '2022-02-18 17:10:44.098576', 48, 622);
INSERT INTO parametros.parametro VALUES (725, 'NOMINA OS HONORARIOS NICSP', 'NOMINA OS HONORARIOS NICSP', 'NHN', true, 0.00, '2022-02-18 17:11:37.495776', '2022-02-18 17:11:37.495871', 48, 622);
INSERT INTO parametros.parametro VALUES (726, 'NOMINA OS SERVICIOS NICSP', 'NOMINA OS SERVICIOS NICSP', 'NSN', true, 0.00, '2022-02-18 17:13:07.27646', '2022-02-18 17:13:07.276553', 48, 622);
INSERT INTO parametros.parametro VALUES (728, 'NOMINA SALARIOS VE  PREGRADO NICSP', 'NOMINA SALARIOS VE  PREGRADO NICSP', 'NSPRE', true, 0.00, '2022-02-18 17:16:51.78375', '2022-02-18 17:16:51.783871', 48, 622);
INSERT INTO parametros.parametro VALUES (2527, 'AGROECOLOGÍA', 'AGROECOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (729, 'NOMINA SALARIOS VE POSTGRADOS NICSP', 'NOMINA SALARIOS VE POSTGRADOS NICSP', 'NSPOS', true, 0.00, '2022-02-18 17:17:36.394781', '2022-02-18 17:17:36.394855', 48, 622);
INSERT INTO parametros.parametro VALUES (730, 'NOMINA SALARIOS VE TECNOLOGICA NICSP', 'NOMINA SALARIOS VE TECNOLOGICA NICSP', 'NSTEC', true, 0.00, '2022-02-18 17:18:01.392629', '2022-02-18 17:18:01.392729', 48, 622);
INSERT INTO parametros.parametro VALUES (731, 'OC ENTRADAS DE ALMACEN NICSP', 'OC ENTRADAS DE ALMACEN NICSP', 'OEAN', true, 0.00, '2022-02-18 17:18:28.650854', '2022-02-18 17:18:28.650956', 48, 622);
INSERT INTO parametros.parametro VALUES (732, 'OTROS GASTOS CTTO', 'OTROS GASTOS CTTO', 'OGCTTO', true, 0.00, '2022-02-18 17:19:20.280913', '2022-02-18 17:19:20.281046', 48, 622);
INSERT INTO parametros.parametro VALUES (733, 'OTROS GASTOS IDEX', 'OTROS GASTOS IDEX', 'OGIDEX', true, 0.00, '2022-02-18 17:19:38.778396', '2022-02-18 17:19:38.778472', 48, 622);
INSERT INTO parametros.parametro VALUES (734, 'PAGO SEGURIDAD SOCIAL', 'PAGO SEGURIDAD SOCIAL', 'PSS', true, 0.00, '2022-02-18 17:20:11.694239', '2022-02-18 17:20:11.694315', 48, 622);
INSERT INTO parametros.parametro VALUES (735, 'PENSION ADM NICSP', 'PENSION ADM NICSP', 'PEAN', true, 0.00, '2022-02-18 17:20:51.559472', '2022-02-18 17:20:51.559598', 48, 622);
INSERT INTO parametros.parametro VALUES (736, 'PRIMA DE NAVIDAD', 'PRIMA DE NAVIDAD', 'PN', true, 0.00, '2022-02-18 17:22:09.152691', '2022-02-18 17:22:09.152791', 48, 622);
INSERT INTO parametros.parametro VALUES (737, 'PRESTAMOS ORDINARIOS ADM NICSP', 'PRESTAMOS ORDINARIOS ADM NICSP', 'POAN', true, 0.00, '2022-02-18 17:22:39.959877', '2022-02-18 17:22:39.959985', 48, 622);
INSERT INTO parametros.parametro VALUES (738, 'PRIMA DE NAVIDAD PREGRADO VE NICSP', 'PRIMA DE NAVIDAD PREGRADO VE NICSP', 'PNPRE', true, 0.00, '2022-02-18 17:23:20.631886', '2022-02-18 17:23:20.63196', 48, 622);
INSERT INTO parametros.parametro VALUES (739, 'PRIMA DE NAVIDAD TECNOLOGICA VE NICSP', 'PRIMA DE NAVIDAD TECNOLOGICA VE NICSP', 'PNTEC', true, 0.00, '2022-02-18 17:23:48.0411', '2022-02-18 17:23:48.0412', 48, 622);
INSERT INTO parametros.parametro VALUES (740, 'PRIMA DE NAVIDAD VE ILUD NICSP', 'PRIMA DE NAVIDAD VE ILUD NICSP', 'PNILUD', true, 0.00, '2022-02-18 17:24:11.988041', '2022-02-18 17:24:11.988137', 48, 622);
INSERT INTO parametros.parametro VALUES (741, 'PRIMA DE VACACIONES PREGRADO VE NICSP', 'PRIMA DE VACACIONES PREGRADO VE NICSP', 'PVPRE', true, 0.00, '2022-02-18 17:24:44.656474', '2022-02-18 17:24:44.656654', 48, 622);
INSERT INTO parametros.parametro VALUES (742, 'PRIMA SEMESTRAL ADMINISTRATIVOS NICSP', 'PRIMA SEMESTRAL ADMINISTRATIVOS NICSP', 'PSADMIN', true, 0.00, '2022-02-18 17:29:21.56318', '2022-02-18 17:29:21.563294', 48, 622);
INSERT INTO parametros.parametro VALUES (743, 'PROGRAMA APOYO ALIMENTARIO NICSP', 'PROGRAMA APOYO ALIMENTARIO NICSP', 'PAAN', true, 0.00, '2022-02-18 17:30:01.807041', '2022-02-18 17:30:01.80714', 48, 622);
INSERT INTO parametros.parametro VALUES (744, 'PUBLICIDAD Y PROPAGANDA ILUD', 'PUBLICIDAD Y PROPAGANDA ILUD', 'PPILUD', true, 0.00, '2022-02-18 17:31:20.290177', '2022-02-18 17:31:20.290296', 48, 622);
INSERT INTO parametros.parametro VALUES (745, 'RETE FTE COMPRAS NO DECLARANTES  3.5% NICSP', 'RETE FTE COMPRAS NO DECLARANTES  3.5% NICSP', 'RFCND', true, 0.00, '2022-02-18 17:32:08.291823', '2022-02-18 17:32:08.2919', 48, 622);
INSERT INTO parametros.parametro VALUES (746, 'RETE FTE SAR INDETER.2.5%NICSP', 'RETE FTE SAR INDETER.2.5%NICSP', 'RFSI', true, 0.00, '2022-02-18 17:32:44.483336', '2022-02-18 17:32:44.483469', 48, 622);
INSERT INTO parametros.parametro VALUES (747, 'RETE IVA 15% NICSP', 'RETE IVA 15% NICSP', 'RIVA', true, 0.00, '2022-02-18 17:33:07.775659', '2022-02-18 17:33:07.775749', 48, 622);
INSERT INTO parametros.parametro VALUES (748, 'RIESGOS LABORALES ESTUDIANTES NICSP', 'RIESGOS LABORALES ESTUDIANTES NICSP', 'RLE', true, 0.00, '2022-02-18 17:33:53.242656', '2022-02-18 17:33:53.242752', 48, 622);
INSERT INTO parametros.parametro VALUES (749, 'SEGUROS DE BIENES PAGADOS X ANTICIPADO  NICSP', 'SEGUROS DE BIENES PAGADOS X ANTICIPADO  NICSP', 'SBPA', true, 0.00, '2022-02-18 17:34:19.422333', '2022-02-18 17:34:19.422406', 48, 622);
INSERT INTO parametros.parametro VALUES (750, 'SERVICIO DE ASEO CAFETERIA RESTAURAN ILU', 'SERVICIO DE ASEO CAFETERIA RESTAURAN ILU', 'SACR', true, 0.00, '2022-02-18 17:34:55.828216', '2022-02-18 17:34:55.828347', 48, 622);
INSERT INTO parametros.parametro VALUES (751, 'SERVICIOS  PUBLICOS IDEX', 'SERVICIOS  PUBLICOS IDEX', 'SPIDEX', true, 0.00, '2022-02-18 17:35:19.632865', '2022-02-18 17:35:19.632941', 48, 622);
INSERT INTO parametros.parametro VALUES (752, 'SERVICIOS ACADEMICOS CTTO', 'SERVICIOS ACADEMICOS CTTO', 'SACTTO', true, 0.00, '2022-02-18 17:35:58.377191', '2022-02-18 17:35:58.377295', 48, 622);
INSERT INTO parametros.parametro VALUES (753, 'SERVICIOS PERSONALES ADM CONV', 'SERVICIOS PERSONALES ADM CONV', 'SPACON', true, 0.00, '2022-02-18 17:36:33.72896', '2022-02-18 17:36:33.72904', 48, 622);
INSERT INTO parametros.parametro VALUES (754, 'SERVICIOS PERSONALES ADM CTTO', 'SERVICIOS PERSONALES ADM CTTO', 'SPACTTO', true, 0.00, '2022-02-18 17:37:09.687189', '2022-02-18 17:37:09.687295', 48, 622);
INSERT INTO parametros.parametro VALUES (755, 'SERVICIOS PUBLICOS ACUEDUCTO NICSP', 'SERVICIOS PUBLICOS ACUEDUCTO NICSP', 'SPA', true, 0.00, '2022-02-18 17:38:03.731744', '2022-02-18 17:38:03.73185', 48, 622);
INSERT INTO parametros.parametro VALUES (756, 'SERVICIOS PUBLICOS BOGOTA LIMPIA - LIME METROPO Y PROMOAMBIENTE  NICSP', 'SERVICIOS PUBLICOS BOGOTA LIMPIA - LIME METROPO Y PROMOAMBIENTE  NICSP', 'SPBL', true, 0.00, '2022-02-18 17:38:51.482142', '2022-02-18 17:38:51.482256', 48, 622);
INSERT INTO parametros.parametro VALUES (757, 'SERVICIOS PUBLICOS COLOMBIA TELECOMU. NICSP', 'SERVICIOS PUBLICOS COLOMBIA TELECOMU. NICSP', 'SPCT', true, 0.00, '2022-02-18 17:39:22.41909', '2022-02-18 17:39:22.41919', 48, 622);
INSERT INTO parametros.parametro VALUES (758, 'SERVICIOS PUBLICOS ENERGIA NICSP', 'SERVICIOS PUBLICOS ENERGIA NICSP', 'SPEN', true, 0.00, '2022-02-18 17:40:40.668838', '2022-02-18 17:40:40.668932', 48, 622);
INSERT INTO parametros.parametro VALUES (759, 'SERVICIOS PUBLICOS ETB NICSP', 'SERVICIOS PUBLICOS ETB NICSP', 'SPETB', true, 0.00, '2022-02-18 17:41:09.954855', '2022-02-18 17:41:09.954943', 48, 622);
INSERT INTO parametros.parametro VALUES (760, 'SERVICIOS PUBLICOS GAS NICSP', 'SERVICIOS PUBLICOS GAS NICSP', 'SPGAS', true, 0.00, '2022-02-18 17:41:39.092522', '2022-02-18 17:41:39.092664', 48, 622);
INSERT INTO parametros.parametro VALUES (761, 'SERVICIOS PUBLICOS OTROS SERVICIOS NICPS', 'SERVICIOS PUBLICOS OTROS SERVICIOS NICPS', 'SPOTRO', true, 0.00, '2022-02-18 17:42:07.130382', '2022-02-18 17:42:07.130481', 48, 622);
INSERT INTO parametros.parametro VALUES (762, 'SIPRUD SALARIOS VE NICSP', 'SIPRUD SALARIOS VE NICSP', 'SIPSAL', true, 0.00, '2022-02-18 17:42:45.81495', '2022-02-18 17:42:45.815073', 48, 622);
INSERT INTO parametros.parametro VALUES (763, 'TRANSPORTE TERRESTRE-ADM NICSP', 'TRANSPORTE TERRESTRE-ADM NICSP', 'TTADM', true, 0.00, '2022-02-18 17:43:14.028427', '2022-02-18 17:43:14.028504', 48, 622);
INSERT INTO parametros.parametro VALUES (764, ' SERVICIOS PUBLICOS ECOCAPITAL NICSP', ' SERVICIOS PUBLICOS ECOCAPITAL NICSP', 'SPECO', true, 0.00, '2022-02-18 17:44:15.776237', '2022-02-18 17:44:15.776312', 48, 622);
INSERT INTO parametros.parametro VALUES (765, 'Enfermero', 'Empleado del sector de la salud de Bienestar Institucional', '', true, 0.00, '2022-02-28 02:47:06.569306', '2022-02-28 02:47:06.569428', 15, NULL);
INSERT INTO parametros.parametro VALUES (766, 'Médico', 'Empleado del sector de la salud de Bienestar Institucional', '', true, 0.00, '2022-02-28 02:49:44.56008', '2022-02-28 02:49:44.560203', 15, NULL);
INSERT INTO parametros.parametro VALUES (767, 'Psicólogo', 'Empleado del sector de la salud de Bienestar Institucional', '', true, 0.00, '2022-02-28 02:49:57.957946', '2022-02-28 02:49:57.958067', 15, NULL);
INSERT INTO parametros.parametro VALUES (768, 'Odontólogo', 'Empleado del sector de la salud de Bienestar Institucional', '', true, 0.00, '2022-02-28 02:50:09.615083', '2022-02-28 02:50:09.615167', 15, NULL);
INSERT INTO parametros.parametro VALUES (769, 'Fisioterapeuta', 'Empleado del sector de la salud de Bienestar Institucional', '', true, 0.00, '2022-02-28 02:50:22.525889', '2022-02-28 02:50:22.525982', 15, NULL);
INSERT INTO parametros.parametro VALUES (770, 'Copia de la Orden o Contrato de Prestación de Servicio (para el primer pago)', 'Copia de la Orden o Contrato de Prestación de Servicio (para el primer pago)', 'OCPS', false, 0.00, '2022-03-01 18:19:03.903662', '2022-03-01 18:19:03.903785', 49, NULL);
INSERT INTO parametros.parametro VALUES (836, 'Cuenta de cobro', 'Cuenta de cobro', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (771, 'Copia de la Orden de Compra o Suministro (para el primer pago)', 'Copia de la Orden de Compra o Suministro (para el primer pago)', 'COCS', false, 0.00, '2022-03-01 18:19:58.376948', '2022-03-01 18:19:58.377041', 49, NULL);
INSERT INTO parametros.parametro VALUES (772, 'Copia de Certificados de Disponibilidad y Reserva Presupuesta', 'Copia de Certificados de Disponibilidad y Reserva Presupuesta', 'CDRP', false, 0.00, '2022-03-01 18:21:06.076865', '2022-03-01 18:21:06.076963', 49, NULL);
INSERT INTO parametros.parametro VALUES (774, 'Certificado de cumplido o recibo a satisfacción por parte del supervisor', 'Certificado de cumplido o recibo a satisfacción por parte del supervisor', 'CERT_CUMP', false, 0.00, '2022-03-01 18:22:28.324843', '2022-03-01 18:22:28.324978', 49, NULL);
INSERT INTO parametros.parametro VALUES (777, 'Copia del pago del aporte al Sistema General de Seguridad Social en Salud', 'Copia del pago del aporte al Sistema General de Seguridad Social en Salud', 'PSSS', false, 0.00, '2022-03-01 18:24:24.350516', '2022-03-01 18:24:24.350611', 49, NULL);
INSERT INTO parametros.parametro VALUES (778, 'Copia del pago del aporte al Sistema General de Seguridad Social en Pensión', 'Copia del pago del aporte al Sistema General de Seguridad Social en Pensión', 'PSP', false, 0.00, '2022-03-01 18:25:00.396368', '2022-03-01 18:25:00.396439', 49, NULL);
INSERT INTO parametros.parametro VALUES (781, 'Copia de las pólizas necesarias', 'Copia de las pólizas necesarias', 'PONE', false, 0.00, '2022-03-01 18:27:10.099052', '2022-03-01 18:27:10.099142', 49, NULL);
INSERT INTO parametros.parametro VALUES (782, 'Acta de liquidación o Acta de Terminación', 'Acta de liquidación o Acta de Terminación', 'ACTE', false, 0.00, '2022-03-01 18:27:44.044364', '2022-03-01 18:27:44.044458', 49, NULL);
INSERT INTO parametros.parametro VALUES (783, 'Pasabordo en tiquetes aéreos', 'Pasabordo en tiquetes aéreos', 'PTA', false, 0.00, '2022-03-01 18:28:31.061166', '2022-03-01 18:28:31.061289', 49, NULL);
INSERT INTO parametros.parametro VALUES (785, 'Pólizas acordadas en el contrato y en el presupuesto para los anticipos', 'Pólizas acordadas en el contrato y en el presupuesto para los anticipos', 'PACPA', false, 0.00, '2022-03-01 18:29:18.84352', '2022-03-01 18:29:18.843594', 49, NULL);
INSERT INTO parametros.parametro VALUES (786, 'Otros', 'Otros', 'OTRO', false, 0.00, '2022-03-01 18:32:24.184265', '2022-03-01 18:32:24.184385', 49, NULL);
INSERT INTO parametros.parametro VALUES (773, 'Acta de inicio (únicamente para el primer pago)', 'Acta de inicio (únicamente para el primer pago)', 'ADI', false, 0.00, '2022-03-01 18:21:39.078124', '2022-03-01 18:21:39.078232', 49, NULL);
INSERT INTO parametros.parametro VALUES (775, 'Factura original', 'Factura original', 'FO', false, 0.00, '2022-03-01 18:23:07.631419', '2022-03-01 18:23:07.63151', 49, NULL);
INSERT INTO parametros.parametro VALUES (776, 'Entrada a almacén de bienes devolutivos', 'Entrada a almacén de bienes devolutivos', 'EABD', false, 0.00, '2022-03-01 18:23:38.263609', '2022-03-01 18:23:38.263703', 49, NULL);
INSERT INTO parametros.parametro VALUES (779, 'Copia del Registro Único Tributario (RUT)', 'Copia del Registro Único Tributario (RUT)', 'RUT', false, 0.00, '2022-03-01 18:25:43.214019', '2022-03-01 18:25:43.214121', 49, NULL);
INSERT INTO parametros.parametro VALUES (780, 'Medio magnético y escrito de la nomina', 'Medio magnético y escrito de la nomina', 'MMEN', false, 0.00, '2022-03-01 18:26:15.549265', '2022-03-01 18:26:15.54936', 49, NULL);
INSERT INTO parametros.parametro VALUES (784, 'Resolución motivada autorizando avance y /o viáticos', 'Resolución motivada autorizando avance y /o viáticos', 'RMAAV', false, 0.00, '2022-03-01 18:28:58.804007', '2022-03-01 18:28:58.804101', 49, NULL);
INSERT INTO parametros.parametro VALUES (788, '20:00', 'Horario de final de atención médica', 'HORF', true, 0.00, '2022-03-13 21:03:24.143926', '2022-03-18 09:26:56.846266', 50, NULL);
INSERT INTO parametros.parametro VALUES (787, '06:00', 'Horario de inicio de atención médica', 'HORI', true, 0.00, '2022-03-13 20:59:13.579804', '2022-03-18 09:26:56.833285', 50, NULL);
INSERT INTO parametros.parametro VALUES (789, 'prueba', '', '123', false, 0.00, '2022-03-24 09:59:34.731119', '2022-03-24 10:00:47.64236', 2, NULL);
INSERT INTO parametros.parametro VALUES (791, 'OBLIGATORIO BÁSICO', 'clasificación para los espacios académicos.', 'OB', true, 791.00, '2022-03-30 09:08:15.202237', '2022-03-30 09:08:15.202358', 51, NULL);
INSERT INTO parametros.parametro VALUES (792, 'OBLIGATORIO COMPLEMENTARIO', 'clasificación para los espacios académicos.', 'OC', true, 792.00, '2022-03-30 09:08:41.922047', '2022-03-30 09:08:41.922147', 51, NULL);
INSERT INTO parametros.parametro VALUES (793, 'ELECTIVO INTRÍNSECO', 'clasificación para los espacios académicos.', 'EI', true, 793.00, '2022-03-30 09:09:14.953479', '2022-03-30 09:09:14.953595', 51, NULL);
INSERT INTO parametros.parametro VALUES (794, 'COMPONENTE PROPEDÉUTICO', 'clasificación para los espacios académicos.', 'CP', true, 794.00, '2022-03-30 09:09:59.480221', '2022-03-30 09:09:59.480322', 51, NULL);
INSERT INTO parametros.parametro VALUES (795, 'OBLIGATORIO', 'clasificación para los espacios académicos.', 'O', true, 795.00, '2022-03-30 09:11:25.566378', '2022-03-30 09:11:25.566496', 51, NULL);
INSERT INTO parametros.parametro VALUES (796, 'ELECTIVO EXTRÍNSECO', 'clasificación para los espacios académicos.', 'EE', true, 796.00, '2022-03-30 09:12:22.674779', '2022-03-30 09:12:22.674874', 51, NULL);
INSERT INTO parametros.parametro VALUES (797, 'ELECTIVO', 'clasificación para los espacios académicos.', 'E', true, 797.00, '2022-03-30 09:12:44.596488', '2022-03-30 09:12:44.596564', 51, NULL);
INSERT INTO parametros.parametro VALUES (798, 'PRIMER CORTE', 'Estado de resgistro de notas en SGA', 'PRICOR', true, 798.00, '2022-03-30 09:19:29.155089', '2022-03-30 09:19:29.155186', 52, NULL);
INSERT INTO parametros.parametro VALUES (799, 'SEGUNDO CORTE', 'Estado de resgistro de notas en SGA', 'SEGCOR', true, 799.00, '2022-03-30 09:20:18.356212', '2022-03-30 09:20:18.356315', 52, NULL);
INSERT INTO parametros.parametro VALUES (800, 'EXAMEN FINAL', 'Estado de resgistro de notas en SGA', 'EXAFIN', true, 800.00, '2022-03-30 09:20:47.834975', '2022-03-30 09:20:47.835049', 52, NULL);
INSERT INTO parametros.parametro VALUES (801, 'HABILITACIONES', 'Estado de resgistro de notas en SGA', 'HAB', true, 801.00, '2022-03-30 09:21:04.269247', '2022-03-30 09:21:04.269381', 52, NULL);
INSERT INTO parametros.parametro VALUES (802, 'DEFINITIVA', 'Estado de resgistro de notas en SGA', 'DEF', true, 802.00, '2022-03-30 09:21:19.569506', '2022-03-30 09:21:19.569598', 52, NULL);
INSERT INTO parametros.parametro VALUES (803, 'fdf', '', '10', true, 0.00, '2022-03-30 15:10:36.277123', '2022-03-30 15:10:36.277222', 2, NULL);
INSERT INTO parametros.parametro VALUES (790, 'pruebaoas', '', '123', false, 0.00, '2022-03-24 10:01:02.52163', '2022-04-01 01:21:23.527036', 2, NULL);
INSERT INTO parametros.parametro VALUES (805, 'Orden de consultoria', 'Orden de consultoria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (806, 'Orden de trabajo', 'Orden de trabajo', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (807, 'Orden interadministrativa', 'Orden interadministrativa', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (808, 'Avances', 'Avances', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (809, 'Contratos generales', 'Contratos generales', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (810, 'Contratos interinstitucionales', 'Contratos interinstitucionales', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (811, 'Contratos interadministrativos', 'Contratos interadministrativos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (812, 'Contrato de prestacion de servicios', 'Contrato de prestacion de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (813, 'Contrato de consultoria', 'Contrato de consultoria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (814, 'Contrato de obra', 'Contrato de obra', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (815, 'Contrato de emprestito', 'Contrato de emprestito', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (816, 'Contrato de compraventa', 'Contrato de compraventa', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (817, 'Contrato de arrendamiento', 'Contrato de arrendamiento', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (818, 'Contrato de licencia de uso', 'Contrato de licencia de uso', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (819, 'Contrato de suministro', 'Contrato de suministro', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (820, 'Contrato de deposito de valores', 'Contrato de deposito de valores', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (821, 'Convenio interadministrativo', 'Convenio interadministrativo', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (822, 'Convenio intersinstitucional', 'Convenio intersinstitucional', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (823, 'Transferencia funcionamiento', 'Transferencia funcionamiento', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (824, 'Transferencia inversion', 'Transferencia inversion', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (825, 'Licitacion publica', 'Licitacion publica', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (826, 'Invitacion publica', 'Invitacion publica', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (827, 'Caja menor', 'Caja menor', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (828, 'Facturas', 'Facturas', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (829, 'Oficio', 'Oficio', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (830, 'Orden de prestacion de servicios', 'Orden de prestacion de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (831, 'Resolucion', 'Resolucion', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (832, 'Comprobante', 'Comprobante', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (833, 'Orden de servicio', 'Orden de servicio', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (834, 'Oficio de Bienestar institucional', 'Oficio de Bienestar institucional', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (835, 'Oficio de Catedra unesco', 'Oficio de Catedra unesco', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (837, 'Decretos', 'Decretos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (838, 'Polizas', 'Polizas', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (839, 'Actas', 'Actas', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (840, 'Promesa de compraventa', 'Promesa de compraventa', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (841, 'Of. Cidc', 'Of. Cidc', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (842, 'Contrato de concesion', 'Contrato de concesion', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (843, 'Contrato de interventoria', 'Contrato de interventoria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (844, 'Orden de arrendamiento', 'Orden de arrendamiento', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (845, 'Convenio', 'Convenio', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (846, 'Orden de expedicion de polizas', 'Orden de expedicion de polizas', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (847, 'Contrato de contraprestacion de servicios', 'Contrato de contraprestacion de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (848, 'Orden de interventoria', 'Orden de interventoria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (849, 'Oficio División de Recursos Físicos', 'Oficio División de Recursos Físicos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (850, 'Oficio DIvisión de Recursos Humanos', 'Oficio DIvisión de Recursos Humanos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (851, 'Oficio Emisora', 'Oficio Emisora', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (852, 'Oficio Facultad de Ingenieria', 'Oficio Facultad de Ingenieria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (853, 'Contrato de seguros', 'Contrato de seguros', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (854, 'Orden de suministro de servicios', 'Orden de suministro de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (855, 'Contrato de suministro de servicios', 'Contrato de suministro de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (856, 'Contrato de suministro y obra', 'Contrato de suministro y obra', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (857, 'Formulario pago impuestos', 'Formulario pago impuestos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (858, 'Conciliaciones judiciales', 'Conciliaciones judiciales', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (859, 'Memorando', 'Memorando', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (860, 'Contrato de encargo fiduciario', 'Contrato de encargo fiduciario', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (861, 'Servicios publicos', 'Servicios publicos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (862, 'Nomina', 'Nomina', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (863, 'Inscripcion a eventos', 'Inscripcion a eventos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (864, 'Radicado', 'Radicado', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (865, 'Oficio Facultad de Ciencias y Educaciión', 'Oficio Facultad de Ciencias y Educaciión', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (866, 'Impuestos', 'Impuestos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (867, 'Descuento y aporte nomina', 'Descuento y aporte nomina', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (868, 'Descuento de nomina', 'Descuento de nomina', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (869, 'Aporte patronal', 'Aporte patronal', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (870, 'Iva orden de servicios', 'Iva orden de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (871, 'Impuesto de industria y comercio', 'Impuesto de industria y comercio', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (872, 'Iva contratos', 'Iva contratos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (873, 'Legalizacion de comision', 'Legalizacion de comision', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (874, 'Anticipo de viaticos', 'Anticipo de viaticos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (875, 'Oficio Facultad de Medio Ambiente', 'Oficio Facultad de Medio Ambiente', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (876, 'Oficio Facultad tecnologica', 'Oficio Facultad tecnologica', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (877, 'Oficio Facultad de Artes', 'Oficio Facultad de Artes', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (878, 'Oficio Ilud', 'Oficio Ilud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (879, 'Oficio idexud', 'Oficio idexud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (880, 'Oficio Ipazud', 'Oficio Ipazud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (881, 'Oficio IEIE', 'Oficio IEIE', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (882, 'Recibo', 'Recibo', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (883, 'Orden de matricula', 'Orden de matricula', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (884, 'Sentencias judiciales', 'Sentencias judiciales', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (885, 'Otros', 'Otros', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (886, 'Inscripcion a eventos', 'Inscripcion a eventos', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (887, 'Oficio Oficina de Publicaciones', 'Oficio Oficina de Publicaciones', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (888, 'Oficio Biblioteca', 'Oficio Biblioteca', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (889, 'Oficio Vicerectoria Aacademica', 'Oficio Vicerectoria Aacademica', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (890, 'Oficio Vicerrectoría Admiistrativa y FInanciera', 'Oficio Vicerrectoría Admiistrativa y FInanciera', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (891, 'Oficio Rectoria', 'Oficio Rectoria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (892, 'Oficio División de Recursos Financieros', 'Oficio División de Recursos Financieros', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (893, 'Resolución Rectoria', 'Resolución Rectoria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (894, 'Resolución Facultad de Ingenieria', 'Resolución Facultad de Ingenieria', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (895, 'Resolución Facultad Ciencias y Educación', 'Resolución Facultad Ciencias y Educación', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (896, 'Resolución Facultad de Medio Ambiente', 'Resolución Facultad de Medio Ambiente', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (897, 'Resolución Facultad Tecnologica', 'Resolución Facultad Tecnologica', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (898, 'Resolución Facultad de Artes', 'Resolución Facultad de Artes', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (899, 'Resolución Ilud', 'Resolución Ilud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (900, 'Resolución Vicerrectoría Administrativa y Financiera', 'Resolución Vicerrectoría Administrativa y Financiera', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (901, 'Resolución Vicerectoria Academica', 'Resolución Vicerectoria Academica', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (902, 'Resolucion CIDC', 'Resolucion CIDC', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (903, 'Res. Doctorado en educacion', 'Res. Doctorado en educacion', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (904, 'Res. Idexud', 'Res. Idexud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (905, 'Of. Seccion compras', 'Of. Seccion compras', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (906, 'Orden de prestacion de servicios remunerados', 'Orden de prestacion de servicios remunerados', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (907, 'Orden de prestacion de servicios academicos remunerados', 'Orden de prestacion de servicios academicos remunerados', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (908, 'Orden de prestacion de servicios cidc', 'Orden de prestacion de servicios cidc', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (909, 'Contrato de financiamiento', 'Contrato de financiamiento', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (910, 'Contrato de investigacion y desarrollo tecnologico', 'Contrato de investigacion y desarrollo tecnologico', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (911, 'Orden de prestacion de servicios simplificado', 'Orden de prestacion de servicios simplificado', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (912, 'Acuerdo', 'Acuerdo', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (913, 'Contrato de coedicion', 'Contrato de coedicion', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (914, 'Resolucion Consejo Superior Universitario', 'Resolucion Consejo Superior Universitario', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (915, 'Otrosí ops', 'Otrosí ops', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (916, 'Otrosí. Al contrato interadministrativo', 'Otrosí. Al contrato interadministrativo', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (917, 'Orden de servicio idexud', 'Orden de servicio idexud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (918, 'Resolucion medio ambiente', 'Resolucion medio ambiente', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (919, 'Orden de servicio idexud', 'Orden de servicio idexud', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (2528, 'AGRONOMÍA', 'AGRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (920, 'Ord. Prest. Serv. Academ. Remun. Evaluacion', 'Ord. Prest. Serv. Academ. Remun. Evaluacion', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (921, 'Contrato de obra civil', 'Contrato de obra civil', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (922, 'Contrato de mov academic estudiantil', 'Contrato de mov academic estudiantil', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (923, 'Pasantia', 'Pasantia', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (924, 'Beneficio institucional', 'Beneficio institucional', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (925, 'Otro si cps', 'Otro si cps', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (926, 'Encuestador', 'Encuestador', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (927, 'Encuestador uaesp', 'Encuestador uaesp', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (928, 'Resolución Secretaria General', 'Resolución Secretaria General', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (929, 'Contrato de comision', 'Contrato de comision', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (930, 'Contrato de prestacion de servicios', 'Contrato de prestacion de servicios', NULL, true, NULL, '2022-04-01 09:54:01.387222', '2022-04-01 09:54:01.387222', 16, NULL);
INSERT INTO parametros.parametro VALUES (931, 'Compras', 'Compras', 'COM', false, 0.00, '2022-04-05 00:51:11.097364', '2022-04-05 00:51:11.09746', 53, NULL);
INSERT INTO parametros.parametro VALUES (932, 'Servicios', 'Servicios', 'SER', false, 0.00, '2022-04-05 00:51:33.665935', '2022-04-05 00:51:33.666147', 53, NULL);
INSERT INTO parametros.parametro VALUES (933, 'Avances', 'Avances', 'AVAN', false, 0.00, '2022-04-05 00:51:58.284799', '2022-04-05 00:51:58.284871', 53, NULL);
INSERT INTO parametros.parametro VALUES (937, 'PREGRADO HCH 17', 'PREGRADO HCH 17', 'RTP', true, 0.00, '2022-04-07 14:44:22.231558', '2022-04-07 14:44:22.231634', 39, 583);
INSERT INTO parametros.parametro VALUES (938, 'PREGRADO HCP 66', 'PREGRADO HCP 66', 'RTP', true, 0.00, '2022-04-07 15:00:34.218696', '2022-04-07 15:00:34.218759', 39, 585);
INSERT INTO parametros.parametro VALUES (939, 'PREGRADO HCP 35', 'PREGRADO HCP 35', 'RTP', true, 0.00, '2022-04-07 15:12:55.593444', '2022-04-07 15:12:55.593504', 39, 584);
INSERT INTO parametros.parametro VALUES (940, 'PREGRADO HCP 66', 'PREGRADO HCP 66', 'RTP', true, 0.00, '2022-04-07 15:20:53.776279', '2022-04-07 15:20:53.776359', 39, 586);
INSERT INTO parametros.parametro VALUES (941, 'PREGRADO MTO 14', 'PREGRADO MTO 14', 'RTP', true, 0.00, '2022-04-07 15:31:53.35656', '2022-04-07 15:31:53.356696', 39, 583);
INSERT INTO parametros.parametro VALUES (942, 'PREGRADO HCP 35', 'PREGRADO HCP 35', 'RTP', true, 0.00, '2022-04-12 15:57:17.068087', '2022-04-12 15:57:17.068176', 39, 586);
INSERT INTO parametros.parametro VALUES (948, 'Compras generales (declarantes)', '2.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (949, 'Compras generales (no declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (950, 'Compras con tarjeta débito o crédito', '1.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (951, 'Compras de bienes o productos agrícolas o pecuarios sin procesamiento industrial', '1.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (952, 'Compras de bienes o productos agrícolas o pecuarios con procesamiento industrial (declarantes)', '2.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (954, 'Compras de café pergamino o cereza', '0.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (955, 'Compras de combustibles derivados del petróleo', '0.1', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (956, 'Enajenación de activos fijos de personas naturales (notarías y tránsito son agentes retenedores)', '1', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (957, 'Compras de vehículos', '1', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (960, 'Compras de bienes raíces cuya destinación y uso sea distinto a vivienda de habitación', '2.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (961, 'Servicios generales (declarantes)', '4', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (962, 'Servicios generales (no declarantes)', '6', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (963, 'Por emolumentos eclesiásticos (declarantes)', '4', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (964, 'Por emolumentos eclesiásticos (no declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (965, 'Servicios de transporte de carga', '1', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (966, 'Servicios de transporte nacional de pasajeros por vía terrestre (declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (967, 'Servicios de transporte nacional de pasajeros por vía terrestre (no declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (968, 'Servicios de transporte nacional de pasajeros por vía aérea o marítima', '1', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (969, 'Servicios prestados por empresas de servicios temporales (sobre AIU)', '1', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (970, 'Servicios prestados por empresas de vigilancia y aseo (sobre AIU)', '2', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (971, 'Servicios integrales de salud prestados por IPS', '2', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (972, 'Servicios de hoteles y restaurantes (declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (973, 'Servicios de hoteles y restaurantes (no declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (974, 'Arrendamiento de bienes muebles', '4', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (975, 'Arrendamiento de bienes inmuebles (declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (976, 'Arrendamiento de bienes inmuebles (no declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (977, 'Otros ingresos tributarios (declarantes)', '2.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (978, 'Otros ingresos tributarios (no declarantes)', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (979, 'Honorarios y comisiones (personas jurídicas)', '11', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (981, 'Honorarios y comisiones (no declarantes)', '10', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (982, 'Servicios de licenciamiento o derecho de uso de software', '3.5', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (983, 'Intereses o rendimientos financieros', '7', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (984, 'Rendimientos financieros provenientes de títulos de renta fija', '4', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (985, 'Loterías, rifas, apuestas y similares', '20', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (986, 'Retención en colocación independiente de juegos de suerte y azar', '3', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (987, 'Contratos de construcción y urbanización.', '2', NULL, true, NULL, '2022-04-13 17:27:05.164174', '2022-04-13 17:27:05.164174', 54, NULL);
INSERT INTO parametros.parametro VALUES (995, 'Punto Salarial vigencia 2022', 'Decreto 447 del 29 de marzo de 2022', 'PSAL', true, 18.00, '2022-04-21 21:28:04.737655', '2022-04-21 21:28:04.737747', 41, 594);
INSERT INTO parametros.parametro VALUES (996, 'Sin observaciones', 'Observacion para notas en calificaciones.', '0', true, 0.00, '2022-04-27 01:29:31.968193', '2022-04-27 01:29:31.968315', 55, NULL);
INSERT INTO parametros.parametro VALUES (997, 'Habilitó', 'Observacion para notas en calificaciones.', '1', true, 0.00, '2022-04-27 01:32:35.014053', '2022-04-27 01:32:35.014187', 55, NULL);
INSERT INTO parametros.parametro VALUES (998, 'Perdió por fallas', 'Observacion para notas en calificaciones.', '3', true, 0.00, '2022-04-27 01:33:12.969947', '2022-04-27 01:33:12.970019', 55, NULL);
INSERT INTO parametros.parametro VALUES (999, 'Incompleta', 'Observacion para notas en calificaciones.', '10', true, 0.00, '2022-04-27 01:33:41.42885', '2022-04-27 01:33:41.428979', 55, NULL);
INSERT INTO parametros.parametro VALUES (1000, 'Pendiente', 'Observacion para notas en calificaciones.', '11', true, 0.00, '2022-04-27 01:33:53.874571', '2022-04-27 01:33:53.874737', 55, NULL);
INSERT INTO parametros.parametro VALUES (1001, 'Aprobado', 'Observacion para notas en calificaciones.', '19', true, 0.00, '2022-04-27 01:34:31.415268', '2022-04-27 01:34:31.415368', 55, NULL);
INSERT INTO parametros.parametro VALUES (1002, 'No aprobado', 'Observacion para notas en calificaciones.', '20', true, 0.00, '2022-04-27 01:34:52.753682', '2022-04-27 01:34:52.753812', 55, NULL);
INSERT INTO parametros.parametro VALUES (1003, 'Certificado de notas', '', '40', true, 0.00, '2022-05-02 19:12:29.214171', '2022-05-02 19:12:29.215312', 2, NULL);
INSERT INTO parametros.parametro VALUES (1004, 'Constancia de estudio', '', '41', true, 0.00, '2022-05-02 19:12:29.318487', '2022-05-02 19:12:29.318572', 2, NULL);
INSERT INTO parametros.parametro VALUES (1005, 'Derechos de grado', '', '50', true, 0.00, '2022-05-02 19:12:29.328297', '2022-05-02 19:12:29.328373', 2, NULL);
INSERT INTO parametros.parametro VALUES (1006, 'Duplicado de diplomas', '', '51', true, 0.00, '2022-05-02 19:12:29.335181', '2022-05-02 19:12:29.335241', 2, NULL);
INSERT INTO parametros.parametro VALUES (1007, 'Duplicado de carnet', '', '44', true, 0.00, '2022-05-02 19:12:29.341679', '2022-05-02 19:12:29.341739', 2, NULL);
INSERT INTO parametros.parametro VALUES (1008, 'Cursos vacacionales', '', '31', true, 0.00, '2022-05-02 19:12:29.34852', '2022-05-02 19:12:29.348579', 2, NULL);
INSERT INTO parametros.parametro VALUES (1009, 'Sistematización', '', '43', true, 0.00, '2022-05-02 19:12:29.354693', '2022-05-02 19:12:29.354751', 2, NULL);
INSERT INTO parametros.parametro VALUES (1010, 'Multas biblioteca', '', '70', true, 0.00, '2022-05-02 19:12:29.360588', '2022-05-02 19:12:29.360635', 2, NULL);
INSERT INTO parametros.parametro VALUES (1011, 'Inscripcion pregrado', '', '8672', true, 0.00, '2022-05-02 19:12:29.366111', '2022-05-02 19:12:29.366169', 2, NULL);
INSERT INTO parametros.parametro VALUES (1012, 'Inscripción postgrado', '', '12', true, 0.00, '2022-05-02 19:12:29.371587', '2022-05-02 19:12:29.37166', 2, NULL);
INSERT INTO parametros.parametro VALUES (1013, 'Copia acta de grado', '', '49', true, 0.00, '2022-05-02 19:12:29.377175', '2022-05-02 19:12:29.377229', 2, NULL);
INSERT INTO parametros.parametro VALUES (1014, 'prueba', '', '56', true, 0.00, '2022-05-02 19:12:29.382511', '2022-05-02 19:12:29.382579', 2, NULL);
INSERT INTO parametros.parametro VALUES (1015, 'prueba2', '', '76', true, 0.00, '2022-05-02 19:12:29.387818', '2022-05-02 19:12:29.387881', 2, NULL);
INSERT INTO parametros.parametro VALUES (1016, 'Carnet', '', '42', true, 0.00, '2022-05-02 19:12:29.393155', '2022-05-02 19:12:29.393213', 2, NULL);
INSERT INTO parametros.parametro VALUES (1017, 'prueba99', '', '99', true, 0.00, '2022-05-02 19:13:52.867587', '2022-05-02 19:13:52.86768', 2, NULL);
INSERT INTO parametros.parametro VALUES (1018, 'prueba99', '', '99', true, 0.00, '2022-05-02 19:15:22.68671', '2022-05-02 19:15:22.686809', 2, NULL);
INSERT INTO parametros.parametro VALUES (1019, 'PREGRADO HCH 14', 'PREGRADO HCH 14', 'RTP', true, 0.00, '2022-05-04 16:15:07.022076', '2022-05-04 16:15:07.02218', 39, 583);
INSERT INTO parametros.parametro VALUES (1020, 'Asistente de programa', 'Cargo de Asistente de programa academico', '', true, 0.00, '2022-05-12 21:12:18.359796', '2022-05-12 21:12:18.359919', 15, NULL);
INSERT INTO parametros.parametro VALUES (1021, 'PREGRADO HCH 14', 'PREGRADO HCH 14', 'RTP', true, 0.00, '2022-05-13 11:38:34.211487', '2022-05-13 11:38:34.211568', 39, 584);
INSERT INTO parametros.parametro VALUES (1022, 'POSGRADO HCH 17', 'POSGRADO HCH 17', 'RTP', true, 0.00, '2022-05-13 11:44:06.157666', '2022-05-13 11:44:06.157749', 39, 584);
INSERT INTO parametros.parametro VALUES (1023, 'PREGRADO HCH 65', 'PREGRADO HCH 65', 'RTP', true, 0.00, '2022-05-19 11:14:52.821349', '2022-05-19 11:14:52.821571', 39, 583);
INSERT INTO parametros.parametro VALUES (1024, 'PREGRADO TCO 14', 'PREGRADO TCO 14', 'RTP', true, 0.00, '2022-05-31 23:36:25.721246', '2022-05-31 23:36:25.721391', 39, 583);
INSERT INTO parametros.parametro VALUES (1025, 'PREGRADO HCP 14', 'PREGRADO HCP 14', 'RTP', true, 0.00, '2022-06-01 07:04:41.044521', '2022-06-01 07:04:41.044603', 39, 583);
INSERT INTO parametros.parametro VALUES (1026, 'PREGRADO MTO 66', 'PREGRADO MTO 66', 'RTP', true, 0.00, '2022-06-02 10:22:37.074676', '2022-06-02 10:22:37.074786', 39, 583);
INSERT INTO parametros.parametro VALUES (1027, 'PREGRADO TCO 66', 'PREGRADO TCO 66', 'RTP', true, 0.00, '2022-06-02 10:28:28.912433', '2022-06-02 10:28:28.91251', 39, 583);
INSERT INTO parametros.parametro VALUES (1028, 'PREGRADO HCH 66', 'PREGRADO HCH 66', 'RTP', true, 0.00, '2022-06-02 10:30:09.137404', '2022-06-02 10:30:09.13749', 39, 583);
INSERT INTO parametros.parametro VALUES (1029, 'PREGRADO HCP 66', 'PREGRADO HCP 66', 'RTP', true, 0.00, '2022-06-02 10:31:54.030991', '2022-06-02 10:31:54.031066', 39, 583);
INSERT INTO parametros.parametro VALUES (1030, 'Devolución del 100%', 'Devolución del 100%', 'D100', false, 0.00, '2022-06-02 16:46:46.84184', '2022-06-02 16:46:46.841966', 57, NULL);
INSERT INTO parametros.parametro VALUES (1031, 'Devolución del 90%', 'Devolución del 90%', 'D90', false, 0.00, '2022-06-02 16:47:01.623575', '2022-06-02 16:47:01.623654', 57, NULL);
INSERT INTO parametros.parametro VALUES (1032, 'Devolución del 70%', 'Devolución del 70%', 'D70', false, 0.00, '2022-06-02 16:47:11.125803', '2022-06-02 16:47:11.125909', 57, NULL);
INSERT INTO parametros.parametro VALUES (1033, 'Devolución del 50%', 'Devolución del 50%', 'D50', false, 0.00, '2022-06-02 16:47:17.059743', '2022-06-02 16:47:17.059838', 57, NULL);
INSERT INTO parametros.parametro VALUES (1034, 'Transferencia Bancaria', 'Transferencia Bancaria', 'TB', false, 0.00, '2022-06-02 16:58:26.817135', '2022-06-02 16:58:26.81722', 58, NULL);
INSERT INTO parametros.parametro VALUES (1035, 'Cheque', 'Cheque', 'CHE', false, 0.00, '2022-06-02 16:59:33.631249', '2022-06-02 16:59:33.631345', 58, NULL);
INSERT INTO parametros.parametro VALUES (1036, 'Efectivo', 'Efectivo', 'EF', false, 0.00, '2022-06-02 16:59:54.861818', '2022-06-02 16:59:54.861908', 58, NULL);
INSERT INTO parametros.parametro VALUES (1037, 'PREGRADO HCP 14', 'PREGRADO HCP 14', 'RTP', true, 0.00, '2022-06-09 15:27:24.965894', '2022-06-09 15:27:24.965994', 39, 586);
INSERT INTO parametros.parametro VALUES (1038, 'PREGRADO TCO 14', 'PREGRADO TCO 14', 'RTP', true, 0.00, '2022-06-09 15:30:24.694174', '2022-06-09 15:30:24.694263', 39, 586);
INSERT INTO parametros.parametro VALUES (1039, 'PREGRADO HCP 65', 'PREGRADO HCP 65', 'RTP', true, 0.00, '2022-06-09 16:11:16.467541', '2022-06-09 16:11:16.467636', 39, 586);
INSERT INTO parametros.parametro VALUES (1040, 'POSGRADO HCP 17', 'POSGRADO HCP 17', 'RTP', true, 0.00, '2022-06-17 08:42:24.18564', '2022-06-17 08:42:24.185732', 39, 583);
INSERT INTO parametros.parametro VALUES (1041, 'PREGRADO HCP 14', 'PREGRADO HCP 14', 'RTP', true, 0.00, '2022-06-22 18:42:52.061896', '2022-06-22 18:42:52.062013', 39, 584);
INSERT INTO parametros.parametro VALUES (1042, 'PREGRADO MTO 17', 'PREGRADO MTO 17', 'RTP', true, 0.00, '2022-07-01 10:06:54.402761', '2022-07-01 10:06:54.402853', 39, 583);
INSERT INTO parametros.parametro VALUES (1043, 'PREGRADO MTO 17', 'PREGRADO MTO 17', 'RTP', true, 0.00, '2022-07-01 12:02:40.854111', '2022-07-01 12:02:40.854185', 39, 584);
INSERT INTO parametros.parametro VALUES (1044, 'Interes a cesantias', 'Interes a cesantias', 'IAC', false, 0.00, '2022-07-01 15:04:54.840384', '2022-07-01 15:04:54.840478', 59, NULL);
INSERT INTO parametros.parametro VALUES (1045, 'MFS', 'MFS', 'MFS', false, 0.00, '2022-07-01 15:05:32.491851', '2022-07-01 15:05:32.491949', 59, NULL);
INSERT INTO parametros.parametro VALUES (1046, 'Prima de navidad', 'Prima de navidad', 'PDN', false, 0.00, '2022-07-01 15:06:04.185965', '2022-07-01 15:06:04.188539', 59, NULL);
INSERT INTO parametros.parametro VALUES (1047, 'Segunda', 'Segunda', 'SEG', false, 0.00, '2022-07-01 15:07:10.034488', '2022-07-01 15:07:10.034582', 59, NULL);
INSERT INTO parametros.parametro VALUES (1048, 'Sueldo de vacaciones', 'Sueldo de vacaciones', 'SV', false, 0.00, '2022-07-01 15:07:32.986696', '2022-07-01 15:07:32.986774', 59, NULL);
INSERT INTO parametros.parametro VALUES (1049, 'Primera', 'Primera', 'PRI', false, 0.00, '2022-07-01 15:07:53.979833', '2022-07-01 15:07:53.979905', 59, NULL);
INSERT INTO parametros.parametro VALUES (1050, 'Prima de vacaciones', 'Prima de vacaciones', 'PV', false, 0.00, '2022-07-01 15:08:18.146378', '2022-07-01 15:08:18.146502', 59, NULL);
INSERT INTO parametros.parametro VALUES (1051, 'PREGRADO MTO 17', 'PREGRADO MTO 17', 'RTP', true, 0.00, '2022-07-01 15:08:31.773739', '2022-07-01 15:08:31.77383', 39, 585);
INSERT INTO parametros.parametro VALUES (1052, 'Adicional', 'Adicional', 'AD', false, 0.00, '2022-07-01 15:08:43.37533', '2022-07-01 15:08:43.375404', 59, NULL);
INSERT INTO parametros.parametro VALUES (1053, 'Prima semestral', 'Prima semestral', 'PRIS', false, 0.00, '2022-07-01 15:09:39.618238', '2022-07-01 15:09:39.618309', 59, NULL);
INSERT INTO parametros.parametro VALUES (1054, 'Cesantias', 'Cesantias', 'CES', false, 0.00, '2022-07-01 15:10:02.73054', '2022-07-01 15:10:02.730642', 59, NULL);
INSERT INTO parametros.parametro VALUES (1055, 'PREGRADO MTO 17', 'PREGRADO MTO 17', 'RTP', true, 0.00, '2022-07-01 15:44:09.912794', '2022-07-01 15:44:09.912855', 39, 586);
INSERT INTO parametros.parametro VALUES (1056, 'PREGRADO HCH 17', 'PREGRADO HCH 17', 'RTP', true, 0.00, '2022-07-14 11:28:10.764759', '2022-07-14 11:28:10.764853', 39, 584);
INSERT INTO parametros.parametro VALUES (320, 'Asistente Dependencia', 'Cargo de Asistente de dependencia', '', true, 320.00, '2022-08-02 14:37:20.659752', '2022-08-02 14:37:20.659885', 15, NULL);
INSERT INTO parametros.parametro VALUES (1057, 'PREGRADO HCP 35', 'PREGRADO HCP 35', 'RTP', true, 0.00, '2022-10-06 11:11:32.348388', '2022-10-06 11:11:32.348456', 39, 583);
INSERT INTO parametros.parametro VALUES (1058, 'POSGRADO HCH 17', 'POSGRADO HCH 17', 'RTP', true, 0.00, '2022-10-12 14:06:55.562583', '2022-10-12 14:06:55.562892', 39, 586);
INSERT INTO parametros.parametro VALUES (1059, 'POSGRADO HCP 17', 'POSGRADO HCP 17', 'RTP', true, 0.00, '2022-10-12 14:10:42.080917', '2022-10-12 14:10:42.081023', 39, 586);
INSERT INTO parametros.parametro VALUES (1060, 'POSGRADO HCH 14', 'POSGRADO HCH 14', 'RTP', true, 0.00, '2022-10-12 14:47:58.868031', '2022-10-12 14:47:58.868154', 39, 583);
INSERT INTO parametros.parametro VALUES (1061, 'Unidad de Valor Tributario', 'Unidad de Valor Tributario', 'UVT', true, 1.00, '2022-10-13 23:25:01.079029', '2022-10-13 23:25:01.079139', 12, NULL);
INSERT INTO parametros.parametro VALUES (2455, 'ACTIVIDAD FÍSICA Y DEPORTE', 'ACTIVIDAD FÍSICA Y DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2456, 'ACUICULTURA', 'ACUICULTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2457, 'ADMINISTRACIÓN', 'ADMINISTRACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2458, 'ADMINISTRACIÓN & SERVICIO', 'ADMINISTRACIÓN & SERVICIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2459, 'ADMINISTRACIÓN AERONÁUTICA', 'ADMINISTRACIÓN AERONÁUTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2460, 'ADMINISTRACIÓN AGROINDUSTRIAL', 'ADMINISTRACIÓN AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2461, 'ADMINISTRACIÓN AGROPECUARIA', 'ADMINISTRACIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2462, 'ADMINISTRACIÓN AMBIENTAL', 'ADMINISTRACIÓN AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2463, 'ADMINISTRACIÓN AMBIENTAL Y DE LOS RECURSOS NATURALES', 'ADMINISTRACIÓN AMBIENTAL Y DE LOS RECURSOS NATURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2464, 'ADMINISTRACIÓN AMBIENTAL Y SANITARIA', 'ADMINISTRACIÓN AMBIENTAL Y SANITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2465, 'ADMINISTRACIÓN COMERCIAL', 'ADMINISTRACIÓN COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2466, 'ADMINISTRACIÓN COMERCIAL Y DE MERCADEO', 'ADMINISTRACIÓN COMERCIAL Y DE MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2467, 'ADMINISTRACIÓN COMERCIAL Y FINANCIERA', 'ADMINISTRACIÓN COMERCIAL Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2468, 'ADMINISTRACIÓN DE AGRONEGOCIOS', 'ADMINISTRACIÓN DE AGRONEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2469, 'ADMINISTRACIÓN DE COMERCIO EXTERIOR', 'ADMINISTRACIÓN DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2470, 'ADMINISTRACIÓN DE EMPRESAS', 'ADMINISTRACIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2529, 'ANIMACIÓN', 'ANIMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2472, 'ADMINISTRACIÓN DE EMPRESAS AGROPECUARIAS', 'ADMINISTRACIÓN DE EMPRESAS AGROPECUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2473, 'ADMINISTRACIÓN DE EMPRESAS COMERCIALES', 'ADMINISTRACIÓN DE EMPRESAS COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2474, 'ADMINISTRACIÓN DE EMPRESAS EN TELECOMUNICACIÓNES', 'ADMINISTRACIÓN DE EMPRESAS EN TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2475, 'ADMINISTRACIÓN DE EMPRESAS GLOBALES', 'ADMINISTRACIÓN DE EMPRESAS GLOBALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2476, 'ADMINISTRACIÓN DE EMPRESAS TURÍSTICAS', 'ADMINISTRACIÓN DE EMPRESAS TURÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2477, 'ADMINISTRACIÓN DE EMPRESAS TURÍSTICAS Y HOTELERAS', 'ADMINISTRACIÓN DE EMPRESAS TURÍSTICAS Y HOTELERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2478, 'ADMINISTRACIÓN DE EMPRESAS Y FINANZAS', 'ADMINISTRACIÓN DE EMPRESAS Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2479, 'ADMINISTRACIÓN DE EMPRESAS Y TRANSFORMACIÓN DIGITAL', 'ADMINISTRACIÓN DE EMPRESAS Y TRANSFORMACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2480, 'ADMINISTRACIÓN DE LA CALIDAD', 'ADMINISTRACIÓN DE LA CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2481, 'ADMINISTRACIÓN DE LA SEGURIDAD SOCIAL', 'ADMINISTRACIÓN DE LA SEGURIDAD SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2482, 'ADMINISTRACIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', 'ADMINISTRACIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2483, 'ADMINISTRACIÓN DE MERCADEO', 'ADMINISTRACIÓN DE MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2484, 'ADMINISTRACIÓN DE NEGOCIOS', 'ADMINISTRACIÓN DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2485, 'ADMINISTRACIÓN DE NEGOCIOS INTERNACIÓNALES', 'ADMINISTRACIÓN DE NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2486, 'ADMINISTRACIÓN DE NEGOCIOS SOSTENIBLES', 'ADMINISTRACIÓN DE NEGOCIOS SOSTENIBLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2487, 'ADMINISTRACIÓN DE OBRAS DE ARQUITECTURA', 'ADMINISTRACIÓN DE OBRAS DE ARQUITECTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2488, 'ADMINISTRACIÓN DE PRODUCCIÓN Y LOGÍSTICA INTERNACIÓNAL', 'ADMINISTRACIÓN DE PRODUCCIÓN Y LOGÍSTICA INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2489, 'ADMINISTRACIÓN DE RIESGOS, SEGURIDAD Y SALUD EN EL TRABAJO', 'ADMINISTRACIÓN DE RIESGOS, SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2490, 'ADMINISTRACIÓN DE SERVICIOS DE SALUD', 'ADMINISTRACIÓN DE SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2491, 'ADMINISTRACIÓN DE SISTEMAS', 'ADMINISTRACIÓN DE SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2492, 'ADMINISTRACIÓN DE SISTEMAS INFORMÁTICOS', 'ADMINISTRACIÓN DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2493, 'ADMINISTRACIÓN DE TECNOLOGÍAS DE LA INFORMACIÓN', 'ADMINISTRACIÓN DE TECNOLOGÍAS DE LA INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2494, 'ADMINISTRACIÓN DEL COMERCIO INTERNACIÓNAL', 'ADMINISTRACIÓN DEL COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2495, 'ADMINISTRACIÓN DEL TURISMO SOSTENIBLE', 'ADMINISTRACIÓN DEL TURISMO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2496, 'ADMINISTRACIÓN DEPORTIVA', 'ADMINISTRACIÓN DEPORTIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2497, 'ADMINISTRACIÓN E INNOVACIÓN EN TURISMO Y HOTELES', 'ADMINISTRACIÓN E INNOVACIÓN EN TURISMO Y HOTELES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2498, 'ADMINISTRACIÓN EMPRESAS AGROINDUSTRIALES', 'ADMINISTRACIÓN EMPRESAS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2499, 'ADMINISTRACIÓN EN FINANZAS Y NEGOCIOS INTERNACIÓNALES', 'ADMINISTRACIÓN EN FINANZAS Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2500, 'ADMINISTRACIÓN EN SALUD', 'ADMINISTRACIÓN EN SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2501, 'ADMINISTRACIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO', 'ADMINISTRACIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2502, 'ADMINISTRACIÓN EN SERVICIOS DE SALUD', 'ADMINISTRACIÓN EN SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2503, 'ADMINISTRACIÓN FINANCIERA', 'ADMINISTRACIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2504, 'ADMINISTRACIÓN FINANCIERA Y BURSATIL', 'ADMINISTRACIÓN FINANCIERA Y BURSATIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2505, 'ADMINISTRACIÓN FINANCIERA Y DE SISTEMAS', 'ADMINISTRACIÓN FINANCIERA Y DE SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2506, 'ADMINISTRACIÓN HOTELERA Y DE SERVICIOS', 'ADMINISTRACIÓN HOTELERA Y DE SERVICIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2507, 'ADMINISTRACIÓN HOTELERA Y GASTRONÓMICA', 'ADMINISTRACIÓN HOTELERA Y GASTRONÓMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2508, 'ADMINISTRACIÓN HUMANA', 'ADMINISTRACIÓN HUMANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2509, 'ADMINISTRACIÓN INDUSTRIAL', 'ADMINISTRACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2510, 'ADMINISTRACIÓN INFORMÁTICA', 'ADMINISTRACIÓN INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2511, 'ADMINISTRACIÓN INTEGRAL DE RIESGOS DE SEGURIDAD Y SALUD EN EL TRABAJO', 'ADMINISTRACIÓN INTEGRAL DE RIESGOS DE SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2512, 'ADMINISTRACIÓN LOGÍSTICA', 'ADMINISTRACIÓN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2513, 'ADMINISTRACIÓN MARÍTIMA Y PORTUARIA', 'ADMINISTRACIÓN MARÍTIMA Y PORTUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2514, 'ADMINISTRACIÓN POLICIAL', 'ADMINISTRACIÓN POLICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2515, 'ADMINISTRACIÓN PÚBLICA', 'ADMINISTRACIÓN PÚBLICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2516, 'ADMINISTRACIÓN PÚBLICA TERRITORIAL', 'ADMINISTRACIÓN PÚBLICA TERRITORIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2517, 'ADMINISTRACIÓN TECNÓLOGICA', 'ADMINISTRACIÓN TECNÓLOGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2518, 'ADMINISTRACIÓN TURÍSTICA', 'ADMINISTRACIÓN TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2519, 'ADMINISTRACIÓN TURÍSTICA Y DEL PATRIMONIO', 'ADMINISTRACIÓN TURÍSTICA Y DEL PATRIMONIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2520, 'ADMINISTRACIÓN TURÍSTICA Y HOTELERA', 'ADMINISTRACIÓN TURÍSTICA Y HOTELERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2521, 'ADMINISTRACIÓN Y DIRECCIÓN DE EMPRESAS', 'ADMINISTRACIÓN Y DIRECCIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2522, 'ADMINISTRACIÓN Y GESTIÓN PROPIA', 'ADMINISTRACIÓN Y GESTIÓN PROPIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2523, 'ADMINISTRACIÓN Y NEGOCIOS INTERNACIÓNALES', 'ADMINISTRACIÓN Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2524, 'ADMINISTRACIÓN Y SERVICIO', 'ADMINISTRACIÓN Y SERVICIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2525, 'ADMINSITRACIÓN DE EMPRESAS', 'ADMINSITRACIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2526, 'ADMINSITRACIÓN TURÍSTICA Y HOTELERA', 'ADMINSITRACIÓN TURÍSTICA Y HOTELERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2530, 'ANTROPOLOGÍA', 'ANTROPOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2531, 'ARCHIVÍSTICA', 'ARCHIVÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2532, 'ARCHIVISTICA E INTELIGENCIA DE NEGOCIOS', 'ARCHIVISTICA E INTELIGENCIA DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2533, 'ARQUEOLOGÍA', 'ARQUEOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2534, 'ARQUITECTURA', 'ARQUITECTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2535, 'ARTE', 'ARTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2536, 'ARTE DANZARIO', 'ARTE DANZARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2537, 'ARTE DRAMÁTICO', 'ARTE DRAMÁTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2538, 'ARTES', 'ARTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2539, 'ARTES AUDIOVISUALES', 'ARTES AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2540, 'ARTES CULINARIAS Y GASTRONOMÍA', 'ARTES CULINARIAS Y GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2541, 'ARTES DE LA ESCÉNA', 'ARTES DE LA ESCÉNA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2542, 'ARTES DE LA GRABACIÓN Y PRODUCCIÓN MÚSICAL', 'ARTES DE LA GRABACIÓN Y PRODUCCIÓN MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2543, 'ARTES ESCÉNICAS', 'ARTES ESCÉNICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2544, 'ARTES LIBERALES EN CIENCIAS SOCIALES', 'ARTES LIBERALES EN CIENCIAS SOCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2545, 'ARTES MÚSICALES', 'ARTES MÚSICALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2546, 'ARTES PLÁSTICAS', 'ARTES PLÁSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2547, 'ARTES PLÁSTICAS Y VISUALES', 'ARTES PLÁSTICAS Y VISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2548, 'ARTES VISUALES', 'ARTES VISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2549, 'ASTRONOMÍA', 'ASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2550, 'BACTERIOLOGÍA', 'BACTERIOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2551, 'BACTERIOLOGÍA Y LABORATORIO CLINICO', 'BACTERIOLOGÍA Y LABORATORIO CLINICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2552, 'BANCA Y FINANZAS', 'BANCA Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2553, 'BIBLIOTECOLOGÍA', 'BIBLIOTECOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2554, 'BIBLIOTECOLOGÍA Y ESTUDIOS DE LA INFORMACIÓN', 'BIBLIOTECOLOGÍA Y ESTUDIOS DE LA INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2555, 'BIOINGENIERÍA', 'BIOINGENIERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2556, 'BIOLOGÍA', 'BIOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2557, 'BIOLOGÍA AMBIENTAL', 'BIOLOGÍA AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2558, 'BIOLOGÍA APLICADA', 'BIOLOGÍA APLICADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2559, 'BIOLOGÍA MARINA', 'BIOLOGÍA MARINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2560, 'BIOQUÍMICA', 'BIOQUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2561, 'BIOTECNOLOGÍA', 'BIOTECNOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2562, 'BUEN VIVIR COMUNITARIO', 'BUEN VIVIR COMUNITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2563, 'CIENCIA DE DATOS', 'CIENCIA DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2564, 'CIENCIA DE LA INFORMACIÓN Y BIBLIOTECOLOGÍA', 'CIENCIA DE LA INFORMACIÓN Y BIBLIOTECOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2565, 'CIENCIA DE LA INFORMACIÓN Y LA DOCUMENTACIÓN, BIBLIOTECOLOGÍA Y ARCHIVISTICA', 'CIENCIA DE LA INFORMACIÓN Y LA DOCUMENTACIÓN, BIBLIOTECOLOGÍA Y ARCHIVISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2566, 'CIENCIA DE LA INFORMACIÓN, BIBLIOTECOLOGÍA Y ARCHIVISTICA', 'CIENCIA DE LA INFORMACIÓN, BIBLIOTECOLOGÍA Y ARCHIVISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2567, 'CIENCIA POLÍTICA', 'CIENCIA POLÍTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2568, 'CIENCIA POLÍTICA Y GOBIERNO', 'CIENCIA POLÍTICA Y GOBIERNO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2569, 'CIENCIA POLÍTICA Y RELACIÓNES INTERNACIÓNALES', 'CIENCIA POLÍTICA Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2570, 'CIENCIA POLÍTICA, GOBIERNO Y RELACIÓNES INTERNACIÓNALES', 'CIENCIA POLÍTICA, GOBIERNO Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2571, 'CIENCIAS AERONÁUTICAS', 'CIENCIAS AERONÁUTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2572, 'CIENCIAS AMBIENTALES', 'CIENCIAS AMBIENTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2573, 'CIENCIAS BIBLICAS', 'CIENCIAS BIBLICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2574, 'CIENCIAS CULINARIAS', 'CIENCIAS CULINARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2575, 'CIENCIAS CULINARIAS DE LA GASTRONOMÍA', 'CIENCIAS CULINARIAS DE LA GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2576, 'CIENCIAS DE LA COMPUTACIÓN', 'CIENCIAS DE LA COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2577, 'CIENCIAS DE LA COMPUTACIÓN E INTELIGENCIA ARTIFICIAL', 'CIENCIAS DE LA COMPUTACIÓN E INTELIGENCIA ARTIFICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2578, 'CIENCIAS DEL DEPORTE', 'CIENCIAS DEL DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2579, 'CIENCIAS DEL DEPORTE Y DE LA ACTIVIDAD FÍSICA', 'CIENCIAS DEL DEPORTE Y DE LA ACTIVIDAD FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2580, 'CIENCIAS DEL DEPORTE Y LA ACTIVIDAD FÍSICA', 'CIENCIAS DEL DEPORTE Y LA ACTIVIDAD FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2581, 'CIENCIAS DEL DEPORTE Y LA RECREACIÓN', 'CIENCIAS DEL DEPORTE Y LA RECREACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2582, 'CIENCIAS DEL SISTEMA TIERRA', 'CIENCIAS DEL SISTEMA TIERRA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2583, 'CIENCIAS MILITARES', 'CIENCIAS MILITARES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2584, 'CIENCIAS MILITARES AERONÁUTICAS', 'CIENCIAS MILITARES AERONÁUTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2585, 'CIENCIAS NAUTICAS PARA OFICIALES MERCANTES', 'CIENCIAS NAUTICAS PARA OFICIALES MERCANTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2586, 'CIENCIAS NAÚTICAS PARA OFICIALES MERCANTES DE MAQUINAS', 'CIENCIAS NAÚTICAS PARA OFICIALES MERCANTES DE MAQUINAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2587, 'CIENCIAS NAVALES PARA OFICIALES DE INFANTERIA DE MARINA', 'CIENCIAS NAVALES PARA OFICIALES DE INFANTERIA DE MARINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2588, 'CIENCIAS NAVALES PARA OFICIALES NAVALES', 'CIENCIAS NAVALES PARA OFICIALES NAVALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2589, 'CIENCIAS POLÍTICAS', 'CIENCIAS POLÍTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2590, 'CIENCIAS POLÍTICAS Y GOBIERNO', 'CIENCIAS POLÍTICAS Y GOBIERNO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2591, 'CIENCIAS POLÍTICAS Y RELACIÓNES INTERNACIÓNALES', 'CIENCIAS POLÍTICAS Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2592, 'CINE', 'CINE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2593, 'CINE Y AUDIOVISUALES', 'CINE Y AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2594, 'CINE Y COMUNICACIÓN DIGITAL', 'CINE Y COMUNICACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2595, 'CINE Y TELEVISIÓN', 'CINE Y TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2596, 'COMERCIO EXTERIOR', 'COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2597, 'COMERCIO INTERNACIÓNAL', 'COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2598, 'COMERCIO INTERNACIÓNAL Y FINANZAS', 'COMERCIO INTERNACIÓNAL Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2599, 'COMERCIO Y FINANZAS INTERNACIÓNALES', 'COMERCIO Y FINANZAS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2600, 'COMERCIO Y NEGOCIOS GLOBALES', 'COMERCIO Y NEGOCIOS GLOBALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2601, 'COMERCIO Y NEGOCIOS INTERNACIÓNALES', 'COMERCIO Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2602, 'COMPUTACIÓN CIENTÍFICA', 'COMPUTACIÓN CIENTÍFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2603, 'COMUNICACIÓN', 'COMUNICACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2604, 'COMUNICACIÓN AUDIOVISUAL', 'COMUNICACIÓN AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2605, 'COMUNICACIÓN AUDIOVISUAL Y DIGITAL', 'COMUNICACIÓN AUDIOVISUAL Y DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2606, 'COMUNICACIÓN AUDIOVISUAL Y MULTIMEDIOS', 'COMUNICACIÓN AUDIOVISUAL Y MULTIMEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2607, 'COMUNICACIÓN CORPORATIVA', 'COMUNICACIÓN CORPORATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2608, 'COMUNICACIÓN CORPORATIVA Y RELACIÓNES PÚBLICAS', 'COMUNICACIÓN CORPORATIVA Y RELACIÓNES PÚBLICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2609, 'COMUNICACIÓN DIGITAL', 'COMUNICACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2610, 'COMUNICACIÓN EN NARRATIVAS TRANSMEDIA', 'COMUNICACIÓN EN NARRATIVAS TRANSMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2611, 'COMUNICACIÓN ORGANIZACIÓNAL', 'COMUNICACIÓN ORGANIZACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2612, 'COMUNICACIÓN PROPIA INTERCULTURAL', 'COMUNICACIÓN PROPIA INTERCULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2613, 'COMUNICACIÓN PUBLICITARIA', 'COMUNICACIÓN PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2614, 'COMUNICACIÓN SOCIAL', 'COMUNICACIÓN SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2615, 'COMUNICACIÓN SOCIAL Y MEDIOS', 'COMUNICACIÓN SOCIAL Y MEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2616, 'COMUNICACIÓN SOCIAL Y MEDIOS DIGITALES', 'COMUNICACIÓN SOCIAL Y MEDIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2617, 'COMUNICACIÓN SOCIAL Y PERIODISMO', 'COMUNICACIÓN SOCIAL Y PERIODISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2618, 'COMUNICACIÓN SOCIAL Y PERIODISMO DIGITAL', 'COMUNICACIÓN SOCIAL Y PERIODISMO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2619, 'COMUNICACIÓN VISUAL', 'COMUNICACIÓN VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2620, 'COMUNICACIÓN Y ENTRETENIMIENTO DIGITAL', 'COMUNICACIÓN Y ENTRETENIMIENTO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2621, 'COMUNICACIÓN Y LENGUAJES AUDIOVISUALES', 'COMUNICACIÓN Y LENGUAJES AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2622, 'COMUNICACIÓN Y PERIODISMO', 'COMUNICACIÓN Y PERIODISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2623, 'COMUNICACIÓN Y RELACIÓNES CORPORATIVAS', 'COMUNICACIÓN Y RELACIÓNES CORPORATIVAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2624, 'COMUNICACIÓNES', 'COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2625, 'COMUNICACIÓNES Y MARKETING', 'COMUNICACIÓNES Y MARKETING', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2626, 'CONSERVACIÓN Y RESTAURACIÓN DE PATRIMONIO CULTURAL MUEBLE', 'CONSERVACIÓN Y RESTAURACIÓN DE PATRIMONIO CULTURAL MUEBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2627, 'CONSTRUCCIÓN', 'CONSTRUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2628, 'CONSTRUCCIÓN EN ARQUITECTURA E INGENIERÍA', 'CONSTRUCCIÓN EN ARQUITECTURA E INGENIERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2629, 'CONSTRUCCIÓN Y GESTIÓN EN ARQUITECTURA', 'CONSTRUCCIÓN Y GESTIÓN EN ARQUITECTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2630, 'CONSTRUCCIÓNES CIVILES', 'CONSTRUCCIÓNES CIVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2631, 'CONTADURÍA DIGITAL TECH', 'CONTADURÍA DIGITAL TECH', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2632, 'CONTADURÍA INTERNACIÓNAL', 'CONTADURÍA INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2633, 'CONTADURÍA PÚBLICA', 'CONTADURÍA PÚBLICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2634, 'CONTADURÍA PÚBLICA Y FINANZAS', 'CONTADURÍA PÚBLICA Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2635, 'CONTADURÍA PÚBLICA Y FINANZAS INTERNACIÓNALES', 'CONTADURÍA PÚBLICA Y FINANZAS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2636, 'CREACIÓN', 'CREACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2637, 'CREACIÓN ESCÉNICA', 'CREACIÓN ESCÉNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2638, 'CREACIÓN LITERARIA', 'CREACIÓN LITERARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2639, 'CRIMINALISTICA', 'CRIMINALISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2640, 'CULTURA FÍSICA Y DEPORTE', 'CULTURA FÍSICA Y DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2641, 'CULTURA FÍSICA, DEPORTE Y RECREACIÓN', 'CULTURA FÍSICA, DEPORTE Y RECREACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2642, 'DANZA', 'DANZA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2643, 'DEPORTE', 'DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2644, 'DEPORTE Y CULTURA FÍSICA', 'DEPORTE Y CULTURA FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2645, 'DERECHO', 'DERECHO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2646, 'DERECHO PROPIO INTERCULTURAL', 'DERECHO PROPIO INTERCULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2647, 'DERECHO Y CIENCIAS POLÍTICAS', 'DERECHO Y CIENCIAS POLÍTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2648, 'DESARROLLO FAMILIAR', 'DESARROLLO FAMILIAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2649, 'DESARROLLO TERRITORIAL', 'DESARROLLO TERRITORIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2650, 'DIRECCIÓN DE BANDA', 'DIRECCIÓN DE BANDA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2651, 'DIRECCIÓN Y PRODUCCIÓN DE CINE Y TELEVISIÓN', 'DIRECCIÓN Y PRODUCCIÓN DE CINE Y TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2652, 'DIRECCIÓN Y PRODUCCIÓN DE MEDIOS AUDIOVISUALES', 'DIRECCIÓN Y PRODUCCIÓN DE MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2653, 'DISENO GRAFICO', 'DISENO GRAFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2654, 'DISEÑO', 'DISEÑO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2655, 'DISEÑO CROSSMEDIA', 'DISEÑO CROSSMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2656, 'DISEÑO DE COMUNICACIÓN', 'DISEÑO DE COMUNICACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2657, 'DISEÑO DE COMUNICACIÓN VISUAL', 'DISEÑO DE COMUNICACIÓN VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2658, 'DISEÑO DE ESPACIOS', 'DISEÑO DE ESPACIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2659, 'DISEÑO DE ESPACIOS ESCÉNICOS Y EXHIBICIÓN COMERCIAL', 'DISEÑO DE ESPACIOS ESCÉNICOS Y EXHIBICIÓN COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2660, 'DISEÑO DE ESPACIOS Y ESCÉNARIOS', 'DISEÑO DE ESPACIOS Y ESCÉNARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2661, 'DISEÑO DE INTERACCIÓN', 'DISEÑO DE INTERACCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2662, 'DISEÑO DE MEDIOS INTERACTIVOS', 'DISEÑO DE MEDIOS INTERACTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2663, 'DISEÑO DE MODAS', 'DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2664, 'DISEÑO DE PRODUCTO', 'DISEÑO DE PRODUCTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2665, 'DISEÑO DE VESTUARIO', 'DISEÑO DE VESTUARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2666, 'DISEÑO DIGITAL', 'DISEÑO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2667, 'DISEÑO DIGITAL Y MULTIMEDIA', 'DISEÑO DIGITAL Y MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2668, 'DISEÑO ESTRATÉGICO', 'DISEÑO ESTRATÉGICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2669, 'DISEÑO GRÁFICO', 'DISEÑO GRÁFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2670, 'DISEÑO HIPERMEDIA', 'DISEÑO HIPERMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2671, 'DISEÑO INDUSTRIAL', 'DISEÑO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2672, 'DISEÑO INTERACTIVO', 'DISEÑO INTERACTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2673, 'DISEÑO INTERIOR', 'DISEÑO INTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2674, 'DISEÑO URBANO Y GESTIÓN DEL HÁBITAT', 'DISEÑO URBANO Y GESTIÓN DEL HÁBITAT', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2675, 'DISEÑO VISUAL', 'DISEÑO VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2676, 'DISEÑO VISUAL DIGITAL', 'DISEÑO VISUAL DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2677, 'DISEÑO VISUAL ESTRATÉGICO', 'DISEÑO VISUAL ESTRATÉGICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2678, 'DISEÑO Y ADMINISTRACIÓN DE NEGOCIOS DE LA MODA', 'DISEÑO Y ADMINISTRACIÓN DE NEGOCIOS DE LA MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2679, 'DISEÑO Y GESTIÓN DE ESPACIOS', 'DISEÑO Y GESTIÓN DE ESPACIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2680, 'DISEÑO Y GESTIÓN DE LA MODA', 'DISEÑO Y GESTIÓN DE LA MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2681, 'DISEÑO Y GESTIÓN DE LA MODA Y EL TEXTIL', 'DISEÑO Y GESTIÓN DE LA MODA Y EL TEXTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2682, 'DISEÑO Y GESTIÓN DEL PRODUCTO', 'DISEÑO Y GESTIÓN DEL PRODUCTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2683, 'ECOLOGÍA', 'ECOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2684, 'ECOLOGÍA DE ZONAS COSTERAS', 'ECOLOGÍA DE ZONAS COSTERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2685, 'ECONOMÍA', 'ECONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2686, 'ECONOMÍA Y FINANZAS INTERNACIÓNALES', 'ECONOMÍA Y FINANZAS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2687, 'ECONOMÍA Y NEGOCIOS INTERNACIÓNALES', 'ECONOMÍA Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2688, 'EDUCACIÓN FÍSICA MILITAR', 'EDUCACIÓN FÍSICA MILITAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2689, 'ENFERMERÍA', 'ENFERMERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2690, 'ENTRENAMIENTO DEPORTIVO', 'ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2691, 'ESPAÑOL Y FILOLOGÍA CLASICA', 'ESPAÑOL Y FILOLOGÍA CLASICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2692, 'ESTADÍSTICA', 'ESTADÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2693, 'ESTADÍSTICA Y CIENCIAS ACTUARIALES', 'ESTADÍSTICA Y CIENCIAS ACTUARIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2694, 'ESTUDIOS EN FILOSOFÍA', 'ESTUDIOS EN FILOSOFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2695, 'ESTUDIOS GLOBALES', 'ESTUDIOS GLOBALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2696, 'ESTUDIOS LITERARIOS', 'ESTUDIOS LITERARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2697, 'ESTUDIOS LITERARIOS Y EDICIÓN', 'ESTUDIOS LITERARIOS Y EDICIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2698, 'ESTUDIOS MÚSICALES', 'ESTUDIOS MÚSICALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2699, 'ESTUDIOS POLITICOS Y RESOLUCIÓN DE CONFLICTOS', 'ESTUDIOS POLITICOS Y RESOLUCIÓN DE CONFLICTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2700, 'FARMACIA', 'FARMACIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2701, 'FILOLOGÍA E IDIOMAS', 'FILOLOGÍA E IDIOMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2702, 'FILOLOGÍA HISPANICA', 'FILOLOGÍA HISPANICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2703, 'FILOSOFÍA', 'FILOSOFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2704, 'FILOSOFÍA Y HUMANIDADES', 'FILOSOFÍA Y HUMANIDADES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2705, 'FILOSOFÍA Y LETRAS', 'FILOSOFÍA Y LETRAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2706, 'FINANZAS', 'FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2707, 'FINANZAS INTERNACIÓNALES', 'FINANZAS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2708, 'FINANZAS Y BANCA', 'FINANZAS Y BANCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2709, 'FINANZAS Y COMERCIO EXTERIOR', 'FINANZAS Y COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2710, 'FINANZAS Y COMERCIO INTERNACIÓNAL', 'FINANZAS Y COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2711, 'FINANZAS Y NEGOCIOS INTERNACIÓNALES', 'FINANZAS Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2712, 'FINANZAS Y RELACIÓNES INTERNACIÓNALES', 'FINANZAS Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2713, 'FINANZAS, FINTECH Y COMERCIO EXTERIOR', 'FINANZAS, FINTECH Y COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2714, 'FÍSICA', 'FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2715, 'FISIOTERAPIA', 'FISIOTERAPIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2716, 'FONOAUDIOLOGÍA', 'FONOAUDIOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2717, 'FORMACIÓN DE EMPRESARIOS', 'FORMACIÓN DE EMPRESARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2718, 'FORMACIÓN MÚSICAL', 'FORMACIÓN MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2719, 'FOTOGRAFÍA', 'FOTOGRAFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2720, 'FOTOGRAFÍA PARA MEDIOS', 'FOTOGRAFÍA PARA MEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2721, 'FOTOGRAFÍA Y COMUNICACIÓN VISUAL', 'FOTOGRAFÍA Y COMUNICACIÓN VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2722, 'GASTRONOMÍA', 'GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2723, 'GASTRONOMÍA Y ARTES CULINARIAS', 'GASTRONOMÍA Y ARTES CULINARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2724, 'GASTRONOMÍA Y COCINA PROFESIÓNAL', 'GASTRONOMÍA Y COCINA PROFESIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2725, 'GEOCIENCIAS', 'GEOCIENCIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2726, 'GEOGRAFÍA', 'GEOGRAFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2727, 'GEOGRAFIA DEL DESARROLLO REGIONAL Y AMBIENTAL', 'GEOGRAFIA DEL DESARROLLO REGIONAL Y AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2728, 'GEOLOGÍA', 'GEOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2729, 'GEOPOLÍTICA', 'GEOPOLÍTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2730, 'GEOTECNOLOGÍA', 'GEOTECNOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2731, 'GERENCIA EN SISTEMAS DE INFORMACIÓN EN SALUD', 'GERENCIA EN SISTEMAS DE INFORMACIÓN EN SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2732, 'GERONTOLOGÍA', 'GERONTOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2733, 'GESTIÓN CULTURAL', 'GESTIÓN CULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2734, 'GESTIÓN CULTURAL Y COMUNICATIVA', 'GESTIÓN CULTURAL Y COMUNICATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2735, 'GESTIÓN CULTURAL Y DE INDUSTRIAS CREATIVAS', 'GESTIÓN CULTURAL Y DE INDUSTRIAS CREATIVAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2736, 'GESTIÓN DE LA SEGURIDAD Y LA SALUD LABORAL', 'GESTIÓN DE LA SEGURIDAD Y LA SALUD LABORAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2737, 'GESTIÓN DE SISTEMAS DE INFORMACIÓN', 'GESTIÓN DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2738, 'GESTIÓN DEL EMPRENDIMIENTO Y LA INNOVACIÓN', 'GESTIÓN DEL EMPRENDIMIENTO Y LA INNOVACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2739, 'GESTIÓN DEPORTIVA', 'GESTIÓN DEPORTIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2740, 'GESTIÓN EN ECOLOGÍA Y TURISMO', 'GESTIÓN EN ECOLOGÍA Y TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2741, 'GESTIÓN TERRITORIAL Y ECONOMÍA SOCIAL Y SOLIDARIA', 'GESTIÓN TERRITORIAL Y ECONOMÍA SOCIAL Y SOLIDARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2742, 'GOBIERNO Y ASUNTOS PUBLICOS', 'GOBIERNO Y ASUNTOS PUBLICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2743, 'GOBIERNO Y RELACIÓNES INTERNACIÓNALES', 'GOBIERNO Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2744, 'HISTORIA', 'HISTORIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2745, 'HISTORIA DEL ARTE', 'HISTORIA DEL ARTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2746, 'HISTORIA Y ARCHIVISTICA', 'HISTORIA Y ARCHIVISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2747, 'HISTORIA Y GESTIÓN POLÍTICA', 'HISTORIA Y GESTIÓN POLÍTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2748, 'HISTORIA Y PATRIMONIO', 'HISTORIA Y PATRIMONIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2749, 'HOTELERÍA Y TURISMO', 'HOTELERÍA Y TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2750, 'INGENERIA CIVIL', 'INGENERIA CIVIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2751, 'INGENIERA CIVIL', 'INGENIERA CIVIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2752, 'INGENIERÍA ADMINISTRATIVA', 'INGENIERÍA ADMINISTRATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2753, 'INGENIERÍA AEROESPACIAL', 'INGENIERÍA AEROESPACIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2754, 'INGENIERÍA AERONÁUTICA', 'INGENIERÍA AERONÁUTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2755, 'INGENIERÍA AGRÍCOLA', 'INGENIERÍA AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2756, 'INGENIERÍA AGROAMBIENTAL', 'INGENIERÍA AGROAMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2757, 'INGENIERÍA AGROECOLÓGICA', 'INGENIERÍA AGROECOLÓGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2758, 'INGENIERÍA AGROFORESTAL', 'INGENIERÍA AGROFORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2759, 'INGENIERÍA AGROINDUSTRIAL', 'INGENIERÍA AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2760, 'INGENIERÍA AGRONÓMICA', 'INGENIERÍA AGRONÓMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2761, 'INGENIERÍA AGROPECUARIA', 'INGENIERÍA AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2762, 'INGENIERÍA AMBIENTAL', 'INGENIERÍA AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2763, 'INGENIERÍA AMBIENTAL Y DE SANEAMIENTO', 'INGENIERÍA AMBIENTAL Y DE SANEAMIENTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2764, 'INGENIERÍA AMBIENTAL Y SANITARIA', 'INGENIERÍA AMBIENTAL Y SANITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2765, 'INGENIERÍA BIOLÓGICA', 'INGENIERÍA BIOLÓGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2766, 'INGENIERÍA BIOMÉDICA', 'INGENIERÍA BIOMÉDICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2767, 'INGENIERÍA BIOQUÍMICA', 'INGENIERÍA BIOQUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2768, 'INGENIERÍA BIOTECNOLOGICA', 'INGENIERÍA BIOTECNOLOGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2769, 'INGENIERÍA CATASTRAL Y GEODESIA', 'INGENIERÍA CATASTRAL Y GEODESIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2770, 'INGENIERÍA CIVIL', 'INGENIERÍA CIVIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2771, 'INGENIERÍA CIVIL (POR CICLOS PROPEDEÚTICOS)', 'INGENIERÍA CIVIL (POR CICLOS PROPEDEÚTICOS)', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2772, 'INGENIERÍA COMERCIAL', 'INGENIERÍA COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2773, 'INGENIERÍA DE ALIMENTOS', 'INGENIERÍA DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2774, 'INGENIERÍA DE BIOPRODUCCIÓN', 'INGENIERÍA DE BIOPRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2775, 'INGENIERÍA DE CONTROL', 'INGENIERÍA DE CONTROL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2776, 'INGENIERÍA DE DATOS E INTELIGENCIA ARTIFICIAL', 'INGENIERÍA DE DATOS E INTELIGENCIA ARTIFICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2777, 'INGENIERÍA DE DATOS Y SOFTWARE', 'INGENIERÍA DE DATOS Y SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2778, 'INGENIERÍA DE DISEÑO DE PRODUCTO', 'INGENIERÍA DE DISEÑO DE PRODUCTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2779, 'INGENIERÍA DE GAS Y PETRÓLEO', 'INGENIERÍA DE GAS Y PETRÓLEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2780, 'INGENIERÍA DE LA CALIDAD', 'INGENIERÍA DE LA CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2781, 'INGENIERÍA DE LAS ARTES DIGITALES', 'INGENIERÍA DE LAS ARTES DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2782, 'INGENIERÍA DE MANTENIMIENTO', 'INGENIERÍA DE MANTENIMIENTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2783, 'INGENIERÍA DE MANUFACTURA', 'INGENIERÍA DE MANUFACTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2784, 'INGENIERÍA DE MATERIALES', 'INGENIERÍA DE MATERIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2785, 'INGENIERÍA DE MERCADOS', 'INGENIERÍA DE MERCADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2786, 'INGENIERÍA DE MINAS', 'INGENIERÍA DE MINAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2787, 'INGENIERÍA DE MINAS Y METALURGIA', 'INGENIERÍA DE MINAS Y METALURGIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2788, 'INGENIERÍA DE PETRÓLEO Y GAS', 'INGENIERÍA DE PETRÓLEO Y GAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2789, 'INGENIERÍA DE PETRÓLEOS', 'INGENIERÍA DE PETRÓLEOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2790, 'INGENIERÍA DE PLASTICOS', 'INGENIERÍA DE PLASTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2791, 'INGENIERÍA DE PROCESOS', 'INGENIERÍA DE PROCESOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2792, 'INGENIERÍA DE PROCESOS DE REFINACIÓN Y PETROQUÍMICOS', 'INGENIERÍA DE PROCESOS DE REFINACIÓN Y PETROQUÍMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2793, 'INGENIERÍA DE PROCESOS INDUSTRIALES', 'INGENIERÍA DE PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2794, 'INGENIERÍA DE PRODUCCIÓN', 'INGENIERÍA DE PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2795, 'INGENIERÍA DE PRODUCTIVIDAD Y CALIDAD', 'INGENIERÍA DE PRODUCTIVIDAD Y CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2796, 'INGENIERÍA DE SISTEMAS', 'INGENIERÍA DE SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2797, 'INGENIERÍA DE SISTEMAS CIBERNETICOS', 'INGENIERÍA DE SISTEMAS CIBERNETICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2798, 'INGENIERÍA DE SISTEMAS DE INFORMACIÓN', 'INGENIERÍA DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2799, 'INGENIERÍA DE SISTEMAS E INFORMATICA', 'INGENIERÍA DE SISTEMAS E INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2800, 'INGENIERÍA DE SISTEMAS ENERGÉTICOS', 'INGENIERÍA DE SISTEMAS ENERGÉTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2801, 'INGENIERÍA DE SISTEMAS Y COMPUTACIÓN', 'INGENIERÍA DE SISTEMAS Y COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2802, 'INGENIERÍA DE SISTEMAS Y TELECOMUNICACIÓNES', 'INGENIERÍA DE SISTEMAS Y TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2803, 'INGENIERÍA DE SOFTWARE', 'INGENIERÍA DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2804, 'INGENIERÍA DE SOFTWARE Y COMPUTACIÓN', 'INGENIERÍA DE SOFTWARE Y COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2805, 'INGENIERÍA DE SONIDO', 'INGENIERÍA DE SONIDO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2806, 'INGENIERÍA DE TELECOMUNICACIÓNES', 'INGENIERÍA DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2807, 'INGENIERÍA DE TELECOMUNICACIÓNES E INFORMÁTICA', 'INGENIERÍA DE TELECOMUNICACIÓNES E INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2808, 'INGENIERÍA DE TRANSPORTE Y VIAS', 'INGENIERÍA DE TRANSPORTE Y VIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2809, 'INGENIERÍA ELÉCTRICA', 'INGENIERÍA ELÉCTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2810, 'INGENIERÍA ELECTROMECÁNICA', 'INGENIERÍA ELECTROMECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2811, 'INGENIERÍA ELECTRÓNICA', 'INGENIERÍA ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2812, 'INGENIERÍA ELECTRÓNICA Y TELECOMUNICACIÓNES', 'INGENIERÍA ELECTRÓNICA Y TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2813, 'INGENIERÍA EMPRESARIAL', 'INGENIERÍA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2814, 'INGENIERÍA EN AGROECOLOGÍA', 'INGENIERÍA EN AGROECOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2815, 'INGENIERÍA EN ANALÍTICA DE DATOS', 'INGENIERÍA EN ANALÍTICA DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2816, 'INGENIERÍA EN AUTOMATICA INDUSTRIAL', 'INGENIERÍA EN AUTOMATICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2817, 'INGENIERÍA EN AUTOMATIZACIÓN', 'INGENIERÍA EN AUTOMATIZACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2818, 'INGENIERÍA EN AUTOMATIZACIÓN Y CONTROL', 'INGENIERÍA EN AUTOMATIZACIÓN Y CONTROL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2819, 'INGENIERÍA EN CIENCIA DE DATOS', 'INGENIERÍA EN CIENCIA DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2820, 'INGENIERÍA EN CONTROL Y AUTOMATIZACIÓN', 'INGENIERÍA EN CONTROL Y AUTOMATIZACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2821, 'INGENIERÍA EN CONTROL Y AUTOMATIZACIÓN INDUSTRIAL', 'INGENIERÍA EN CONTROL Y AUTOMATIZACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2822, 'INGENIERÍA EN DISEÑO DE ENTRETENIMIENTO DIGITAL', 'INGENIERÍA EN DISEÑO DE ENTRETENIMIENTO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2823, 'INGENIERÍA EN DISEÑO INDUSTRIAL', 'INGENIERÍA EN DISEÑO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2824, 'INGENIERÍA EN ENERGÍA', 'INGENIERÍA EN ENERGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2825, 'INGENIERÍA EN ENERGÍAS RENOVABLES', 'INGENIERÍA EN ENERGÍAS RENOVABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2826, 'INGENIERÍA EN INFORMÁTICA', 'INGENIERÍA EN INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2827, 'INGENIERÍA EN INTELIGENCIA DE NEGOCIOS', 'INGENIERÍA EN INTELIGENCIA DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2828, 'INGENIERÍA EN LOGÍSTICA', 'INGENIERÍA EN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2829, 'INGENIERÍA EN MULTIMEDIA', 'INGENIERÍA EN MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2830, 'INGENIERÍA EN NANOTECNOLOGÍA', 'INGENIERÍA EN NANOTECNOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2831, 'INGENIERÍA EN PROCESOS AGROINDUSTRIALES', 'INGENIERÍA EN PROCESOS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2832, 'INGENIERÍA EN PROCESOS SOSTENIBLES DE LAS MADERAS', 'INGENIERÍA EN PROCESOS SOSTENIBLES DE LAS MADERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2833, 'INGENIERÍA EN PRODUCCIÓN ACUICOLA', 'INGENIERÍA EN PRODUCCIÓN ACUICOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2834, 'INGENIERÍA EN REDES Y TELECOMUNICACIÓNES', 'INGENIERÍA EN REDES Y TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2835, 'INGENIERÍA EN SEGURIDAD DE LA INFORMACIÓN', 'INGENIERÍA EN SEGURIDAD DE LA INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2836, 'INGENIERÍA EN SEGURIDAD INDUSTRIAL E HIGIENE OCUPACIÓNAL', 'INGENIERÍA EN SEGURIDAD INDUSTRIAL E HIGIENE OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2837, 'INGENIERÍA EN SEGURIDAD Y SALUD EN EL TRABAJO', 'INGENIERÍA EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2838, 'INGENIERÍA EN SOFTWARE', 'INGENIERÍA EN SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2839, 'INGENIERÍA EN TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIÓNES', 'INGENIERÍA EN TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2840, 'INGENIERÍA EN TELECOMUNICACIÓNES', 'INGENIERÍA EN TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2841, 'INGENIERÍA EN TELEMÁTICA', 'INGENIERÍA EN TELEMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2842, 'INGENIERÍA EN TOPOGRAFIA', 'INGENIERÍA EN TOPOGRAFIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2843, 'INGENIERÍA ENERGÉTICA', 'INGENIERÍA ENERGÉTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2844, 'INGENIERÍA ESTADÍSTICA', 'INGENIERÍA ESTADÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2845, 'INGENIERÍA FINANCIERA', 'INGENIERÍA FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2846, 'INGENIERÍA FÍSICA', 'INGENIERÍA FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2847, 'INGENIERÍA FORESTAL', 'INGENIERÍA FORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2848, 'INGENIERÍA GEOGRÁFICA Y AMBIENTAL', 'INGENIERÍA GEOGRÁFICA Y AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2849, 'INGENIERÍA GEOLÓGICA', 'INGENIERÍA GEOLÓGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2850, 'INGENIERÍA INFORMATICA', 'INGENIERÍA INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2851, 'INGENIERÍA LOGÍSTICA', 'INGENIERÍA LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2852, 'INGENIERÍA MATEMATICA', 'INGENIERÍA MATEMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2853, 'INGENIERÍA MECÁNICA', 'INGENIERÍA MECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2854, 'INGENIERÍA MECATRÓNICA', 'INGENIERÍA MECATRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2855, 'INGENIERÍA METALURGICA', 'INGENIERÍA METALURGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2856, 'INGENIERÍA MULTIMEDIA', 'INGENIERÍA MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2857, 'INGENIERÍA NAVAL', 'INGENIERÍA NAVAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2858, 'INGENIERÍA OCEANOGRÁFICA', 'INGENIERÍA OCEANOGRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2859, 'INGENIERÍA PESQUERA', 'INGENIERÍA PESQUERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2860, 'INGENIERÍA PETROQUÍMICA', 'INGENIERÍA PETROQUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2861, 'INGENIERÍA QUÍMICA', 'INGENIERÍA QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2862, 'INGENIERÍA SANITARIA', 'INGENIERÍA SANITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2863, 'INGENIERÍA SANITARIA Y AMBIENTAL', 'INGENIERÍA SANITARIA Y AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2864, 'INGENIERÍA SOFTWARE', 'INGENIERÍA SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2865, 'INGENIERÍA TELEMÁTICA', 'INGENIERÍA TELEMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2866, 'INGENIERÍA TEXTIL', 'INGENIERÍA TEXTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2867, 'INGENIERÍA TOPOGRÁFICA Y GEOMÁTICA', 'INGENIERÍA TOPOGRÁFICA Y GEOMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2868, 'INGENIERÍA URBANA', 'INGENIERÍA URBANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2869, 'INGENIIERIA DE SOFTWARE', 'INGENIIERIA DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2870, 'INNOVACIÓN Y TECNOLOGÍA ECONÓMICA', 'INNOVACIÓN Y TECNOLOGÍA ECONÓMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2871, 'INSTRUMENTACIÓN QUIRÚRGICA', 'INSTRUMENTACIÓN QUIRÚRGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2872, 'INTELIGENCIA DE NEGOCIOS', 'INTELIGENCIA DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2873, 'INTERPRETACIÓN MÚSICAL', 'INTERPRETACIÓN MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2874, 'INTERPRETACIÓN PARA SORDOS Y GUÍA-INTERPRETACIÓN PARA SORDOCIEGOS', 'INTERPRETACIÓN PARA SORDOS Y GUÍA-INTERPRETACIÓN PARA SORDOCIEGOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2875, 'INTERPRETACIÓN Y TRADUCCIÓN LENGUA DE SEÑAS COLOMBIANA - ESPAÑOL', 'INTERPRETACIÓN Y TRADUCCIÓN LENGUA DE SEÑAS COLOMBIANA - ESPAÑOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2876, 'INTÉRPRETE PROFESIÓNAL DE LA LENGUA DE SEÑAS COLOMBIANA', 'INTÉRPRETE PROFESIÓNAL DE LA LENGUA DE SEÑAS COLOMBIANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2877, 'INVESTIGACIÓN CRIMINAL', 'INVESTIGACIÓN CRIMINAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2878, 'JURISPRUDENCIA', 'JURISPRUDENCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2879, 'LENGUAS MODERNAS', 'LENGUAS MODERNAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2880, 'LENGUAS MODERNAS Y CULTURA', 'LENGUAS MODERNAS Y CULTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2881, 'LENGUAS Y CULTURA', 'LENGUAS Y CULTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2882, 'LICENCIATURA DIGITAL EN HUMANIDADES CLÁSICAS Y LENGUA CASTELLANA', 'LICENCIATURA DIGITAL EN HUMANIDADES CLÁSICAS Y LENGUA CASTELLANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2883, 'LICENCIATURA EDUCACIÓN INFANTIL', 'LICENCIATURA EDUCACIÓN INFANTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2884, 'LICENCIATURA EN ARTES', 'LICENCIATURA EN ARTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2885, 'LICENCIATURA EN ARTES ESCÉNICAS', 'LICENCIATURA EN ARTES ESCÉNICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2886, 'LICENCIATURA EN ARTES PLÁSTICAS', 'LICENCIATURA EN ARTES PLÁSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2887, 'LICENCIATURA EN ARTES VISUALES', 'LICENCIATURA EN ARTES VISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2888, 'LICENCIATURA EN BILINGÜISMO CON ÉNFASIS EN ESPAÑOL E INGLES', 'LICENCIATURA EN BILINGÜISMO CON ÉNFASIS EN ESPAÑOL E INGLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2889, 'LICENCIATURA EN BILINGÜISMO CON ÉNFASIS EN INGLÉS', 'LICENCIATURA EN BILINGÜISMO CON ÉNFASIS EN INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2890, 'LICENCIATURA EN BILINGÜISMO CON ENFASIS EN LA ENSEÑANZA DEL INGLÉS', 'LICENCIATURA EN BILINGÜISMO CON ENFASIS EN LA ENSEÑANZA DEL INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2891, 'LICENCIATURA EN BILINGÜISMO: ESPAÑOL E INGLÉS', 'LICENCIATURA EN BILINGÜISMO: ESPAÑOL E INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2892, 'LICENCIATURA EN BIOLOGÍA', 'LICENCIATURA EN BIOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2893, 'LICENCIATURA EN BIOLOGÍA Y QUÍMICA', 'LICENCIATURA EN BIOLOGÍA Y QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2894, 'LICENCIATURA EN CIENCIAS DEL DEPORTE Y LA EDUCACIÓN FÍSICA', 'LICENCIATURA EN CIENCIAS DEL DEPORTE Y LA EDUCACIÓN FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2895, 'LICENCIATURA EN CIENCIAS NATURALES', 'LICENCIATURA EN CIENCIAS NATURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2896, 'LICENCIATURA EN CIENCIAS NATURALES Y EDUCACIÓN AMBIENTAL', 'LICENCIATURA EN CIENCIAS NATURALES Y EDUCACIÓN AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2897, 'LICENCIATURA EN CIENCIAS SOCIALES', 'LICENCIATURA EN CIENCIAS SOCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2898, 'LICENCIATURA EN CIENCIAS SOCIALES Y DESARROLLO LOCAL', 'LICENCIATURA EN CIENCIAS SOCIALES Y DESARROLLO LOCAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2899, 'LICENCIATURA EN DANZA', 'LICENCIATURA EN DANZA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2900, 'LICENCIATURA EN DEPORTE', 'LICENCIATURA EN DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2901, 'LICENCIATURA EN DISEÑO TECNOLOGICO', 'LICENCIATURA EN DISEÑO TECNOLOGICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2902, 'LICENCIATURA EN EDUCACIÓN ARTÍSTICA', 'LICENCIATURA EN EDUCACIÓN ARTÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2903, 'LICENCIATURA EN EDUCACIÓN ARTÍSTICA Y CULTURAL', 'LICENCIATURA EN EDUCACIÓN ARTÍSTICA Y CULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2904, 'LICENCIATURA EN EDUCACIÓN BASICA CON ENFASIS EN EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES', 'LICENCIATURA EN EDUCACIÓN BASICA CON ENFASIS EN EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2905, 'LICENCIATURA EN EDUCACIÒN BÀSICA CON ENFASIS EN HUMANIDADES Y LENGUA CASTELLANA', 'LICENCIATURA EN EDUCACIÒN BÀSICA CON ENFASIS EN HUMANIDADES Y LENGUA CASTELLANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2906, 'LICENCIATURA EN EDUCACIÓN BÁSICA PRIMARIA', 'LICENCIATURA EN EDUCACIÓN BÁSICA PRIMARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2907, 'LICENCIATURA EN EDUCACIÓN BILINGUE', 'LICENCIATURA EN EDUCACIÓN BILINGUE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2908, 'LICENCIATURA EN EDUCACIÓN CAMPESINA Y RURAL', 'LICENCIATURA EN EDUCACIÓN CAMPESINA Y RURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2909, 'LICENCIATURA EN EDUCACIÓN COMUNITARIA', 'LICENCIATURA EN EDUCACIÓN COMUNITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2910, 'LICENCIATURA EN EDUCACIÓN CON ENFASIS EN CIENCIAS SOCIALES', 'LICENCIATURA EN EDUCACIÓN CON ENFASIS EN CIENCIAS SOCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2911, 'LICENCIATURA EN EDUCACIÓN CON ÉNFASIS EN CIENCIAS SOCIALES Y AMBIENTALES', 'LICENCIATURA EN EDUCACIÓN CON ÉNFASIS EN CIENCIAS SOCIALES Y AMBIENTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2912, 'LICENCIATURA EN EDUCACIÓN ENFASIS EN INFORMATICA', 'LICENCIATURA EN EDUCACIÓN ENFASIS EN INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2913, 'LICENCIATURA EN EDUCACIÓN ENFASIS EN MATEMÁTICAS', 'LICENCIATURA EN EDUCACIÓN ENFASIS EN MATEMÁTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2914, 'LICENCIATURA EN EDUCACIÓN ESPECIAL', 'LICENCIATURA EN EDUCACIÓN ESPECIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2915, 'LICENCIATURA EN EDUCACIÓN FÍSICA', 'LICENCIATURA EN EDUCACIÓN FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2916, 'LICENCIATURA EN EDUCACIÓN FÍSICA Y DEPORTE', 'LICENCIATURA EN EDUCACIÓN FÍSICA Y DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2917, 'LICENCIATURA EN EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES', 'LICENCIATURA EN EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2918, 'LICENCIATURA EN EDUCACIÓN INFANTIL', 'LICENCIATURA EN EDUCACIÓN INFANTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2919, 'LICENCIATURA EN EDUCACIÓN PARA LA PRIMERA INFANCIA', 'LICENCIATURA EN EDUCACIÓN PARA LA PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2920, 'LICENCIATURA EN EDUCACIÓN POPULAR', 'LICENCIATURA EN EDUCACIÓN POPULAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2921, 'LICENCIATURA EN EDUCACIÓN PREESCOLAR', 'LICENCIATURA EN EDUCACIÓN PREESCOLAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2922, 'LICENCIATURA EN EDUCACIÓN RELIGIOSA', 'LICENCIATURA EN EDUCACIÓN RELIGIOSA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2923, 'LICENCIATURA EN ESPAÑOL E INGLÉS', 'LICENCIATURA EN ESPAÑOL E INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2924, 'LICENCIATURA EN ESPAÑOL Y FILOLOGÍA', 'LICENCIATURA EN ESPAÑOL Y FILOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2925, 'LICENCIATURA EN ESPAÑOL Y LENGUAS EXTRANJERAS', 'LICENCIATURA EN ESPAÑOL Y LENGUAS EXTRANJERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2926, 'LICENCIATURA EN ESPAÑOL Y LENGUAS EXTRANJERAS INGLÉS Y FRANCÉS', 'LICENCIATURA EN ESPAÑOL Y LENGUAS EXTRANJERAS INGLÉS Y FRANCÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2927, 'LICENCIATURA EN ESPAÑOL Y LITERATURA', 'LICENCIATURA EN ESPAÑOL Y LITERATURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2928, 'LICENCIATURA EN ETNOEDUCACIÓN', 'LICENCIATURA EN ETNOEDUCACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2929, 'LICENCIATURA EN ETNOEDUCACIÓN E INTERCULTURALIDAD', 'LICENCIATURA EN ETNOEDUCACIÓN E INTERCULTURALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2930, 'LICENCIATURA EN ETNOEDUCACIÓN Y DESARROLLO COMUNITARIO', 'LICENCIATURA EN ETNOEDUCACIÓN Y DESARROLLO COMUNITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2931, 'LICENCIATURA EN FILOSOFÍA', 'LICENCIATURA EN FILOSOFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2932, 'LICENCIATURA EN FILOSOFÍA Y LETRAS', 'LICENCIATURA EN FILOSOFÍA Y LETRAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2933, 'LICENCIATURA EN FÍSICA', 'LICENCIATURA EN FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2934, 'LICENCIATURA EN HISTORIA', 'LICENCIATURA EN HISTORIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2935, 'LICENCIATURA EN HUMANIDADES Y LENGUA CASTELLANA', 'LICENCIATURA EN HUMANIDADES Y LENGUA CASTELLANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2936, 'LICENCIATURA EN HUMANIDADES, LENGUA CASTELLANA E INGLÉS', 'LICENCIATURA EN HUMANIDADES, LENGUA CASTELLANA E INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2937, 'LICENCIATURA EN INFORMÁTICA', 'LICENCIATURA EN INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2938, 'LICENCIATURA EN INGLÉS', 'LICENCIATURA EN INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2939, 'LICENCIATURA EN LENGUA CASTELLANA', 'LICENCIATURA EN LENGUA CASTELLANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2940, 'LICENCIATURA EN LENGUA CASTELLANA E INGLES', 'LICENCIATURA EN LENGUA CASTELLANA E INGLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2941, 'LICENCIATURA EN LENGUA CASTELLANA Y LITERATURA', 'LICENCIATURA EN LENGUA CASTELLANA Y LITERATURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2942, 'LICENCIATURA EN LENGUA EXTRANJERA INGLES', 'LICENCIATURA EN LENGUA EXTRANJERA INGLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2943, 'LICENCIATURA EN LENGUAS EXTRANJERAS', 'LICENCIATURA EN LENGUAS EXTRANJERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2944, 'LICENCIATURA EN LENGUAS EXTRANJERAS CON ÉNFASIS EN INGLÉS', 'LICENCIATURA EN LENGUAS EXTRANJERAS CON ÉNFASIS EN INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2945, 'LICENCIATURA EN LENGUAS EXTRANJERAS CON ENFASIS EN INGLES Y EN FRANCÉS', 'LICENCIATURA EN LENGUAS EXTRANJERAS CON ENFASIS EN INGLES Y EN FRANCÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2946, 'LICENCIATURA EN LENGUAS EXTRANJERAS INGLES', 'LICENCIATURA EN LENGUAS EXTRANJERAS INGLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2947, 'LICENCIATURA EN LENGUAS EXTRANJERAS INGLES - FRANCES', 'LICENCIATURA EN LENGUAS EXTRANJERAS INGLES - FRANCES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2948, 'LICENCIATURA EN LENGUAS MODERNAS', 'LICENCIATURA EN LENGUAS MODERNAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2949, 'LICENCIATURA EN LENGUAS MODERNAS CON ÉNFASIS EN INGLÉS', 'LICENCIATURA EN LENGUAS MODERNAS CON ÉNFASIS EN INGLÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2950, 'LICENCIATURA EN LENGUAS MODERNAS CON ÉNFASIS EN INGLÉS Y FRANCÉS', 'LICENCIATURA EN LENGUAS MODERNAS CON ÉNFASIS EN INGLÉS Y FRANCÉS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2951, 'LICENCIATURA EN LINGUISTICA Y LITERATURA', 'LICENCIATURA EN LINGUISTICA Y LITERATURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2952, 'LICENCIATURA EN LINGÜÍSTICA Y SEMIÓTICA', 'LICENCIATURA EN LINGÜÍSTICA Y SEMIÓTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2953, 'LICENCIATURA EN LITERATURA', 'LICENCIATURA EN LITERATURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2954, 'LICENCIATURA EN LITERATURA Y LENGUA CASTELLANA', 'LICENCIATURA EN LITERATURA Y LENGUA CASTELLANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2955, 'LICENCIATURA EN MATEMÁTICAS', 'LICENCIATURA EN MATEMÁTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2956, 'LICENCIATURA EN MATEMÁTICAS E INFORMATICA', 'LICENCIATURA EN MATEMÁTICAS E INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2957, 'LICENCIATURA EN MATEMÁTICAS Y COMPUTACIÓN', 'LICENCIATURA EN MATEMÁTICAS Y COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2958, 'LICENCIATURA EN MATEMÁTICAS Y FÍSICA', 'LICENCIATURA EN MATEMÁTICAS Y FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2959, 'LICENCIATURA EN MÚSICA', 'LICENCIATURA EN MÚSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2960, 'LICENCIATURA EN PEDAGOGÍA DE ARTES Y SABERES ANCESTRALES', 'LICENCIATURA EN PEDAGOGÍA DE ARTES Y SABERES ANCESTRALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2961, 'LICENCIATURA EN PEDAGOGÍA DE LA MADRE TIERRA', 'LICENCIATURA EN PEDAGOGÍA DE LA MADRE TIERRA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2962, 'LICENCIATURA EN PEDAGOGIA DE LA PRIMERA INFANCIA', 'LICENCIATURA EN PEDAGOGIA DE LA PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2963, 'LICENCIATURA EN PEDAGOGÍA DIGITAL PARA LA PRIMERA INFANCIA', 'LICENCIATURA EN PEDAGOGÍA DIGITAL PARA LA PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2964, 'LICENCIATURA EN PEDAGOGÍA INFANTIL', 'LICENCIATURA EN PEDAGOGÍA INFANTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2965, 'LICENCIATURA EN PEDAGOGÍA PARA LA REVITALIZACIÓN DE LENGUAS ORIGINARIAS', 'LICENCIATURA EN PEDAGOGÍA PARA LA REVITALIZACIÓN DE LENGUAS ORIGINARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2966, 'LICENCIATURA EN PEDAGOGÍAS COMUNITARIAS', 'LICENCIATURA EN PEDAGOGÍAS COMUNITARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2967, 'LICENCIATURA EN PSICOPEDAGOGIA CON ENFASIS EN ASESORIA EDUCATIVA', 'LICENCIATURA EN PSICOPEDAGOGIA CON ENFASIS EN ASESORIA EDUCATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2968, 'LICENCIATURA EN QUÍMICA', 'LICENCIATURA EN QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2969, 'LICENCIATURA EN RECREACIÓN', 'LICENCIATURA EN RECREACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2970, 'LICENCIATURA EN TECNOLOGÍA', 'LICENCIATURA EN TECNOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2971, 'LICENCIATURA EN TECNOLOGÍA E INFORMÁTICA', 'LICENCIATURA EN TECNOLOGÍA E INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2972, 'LICENCIATURA EN TEOLOGÍA', 'LICENCIATURA EN TEOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2973, 'LICENCIATURA LENGUAS EXTRANJERAS CON ÉNFASIS EN INGLES', 'LICENCIATURA LENGUAS EXTRANJERAS CON ÉNFASIS EN INGLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2974, 'LINGUISTICA', 'LINGUISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2975, 'LINGUISTICA Y LITERATURA', 'LINGUISTICA Y LITERATURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2976, 'LITERATURA', 'LITERATURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2977, 'LOGÍSTICA Y MERCADEO ORGANIZACIÓNAL', 'LOGÍSTICA Y MERCADEO ORGANIZACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2978, 'MAESTRO EN MÚSICA', 'MAESTRO EN MÚSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2979, 'MARKETING', 'MARKETING', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2980, 'MARKETING & NEGOCIOS INTERNACIÓNALES', 'MARKETING & NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2981, 'MARKETING DE NEGOCIOS', 'MARKETING DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2982, 'MARKETING DIGITAL Y COMUNICACIÓN ESTRATÉGICA', 'MARKETING DIGITAL Y COMUNICACIÓN ESTRATÉGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2983, 'MARKETING INTEGRAL Y NEGOCIOS GLOBALES', 'MARKETING INTEGRAL Y NEGOCIOS GLOBALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2984, 'MARKETING Y NEGOCIOS DIGITALES', 'MARKETING Y NEGOCIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2985, 'MARKETING Y NEGOCIOS INTERNACIÓNALES', 'MARKETING Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2986, 'MARKETING Y PUBLICIDAD', 'MARKETING Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2987, 'MARKETING Y TRANSFORMACIÓN DIGITAL', 'MARKETING Y TRANSFORMACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2988, 'MATEMÁTICA APLICADA', 'MATEMÁTICA APLICADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2989, 'MATEMÁTICAS', 'MATEMÁTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2990, 'MATEMÁTICAS APLICADAS', 'MATEMÁTICAS APLICADAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2991, 'MATEMÁTICAS APLICADAS EN CIENCIA DE DATOS', 'MATEMÁTICAS APLICADAS EN CIENCIA DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2992, 'MATEMÁTICAS APLICADAS Y CIENCIAS DE LA COMPUTACIÓN', 'MATEMÁTICAS APLICADAS Y CIENCIAS DE LA COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2993, 'MATEMÁTICAS CON ENFASIS EN ESTADÍSTICA', 'MATEMÁTICAS CON ENFASIS EN ESTADÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2994, 'MATEMÁTICAS Y CIENCIAS DE LA COMPUTACIÓN', 'MATEMÁTICAS Y CIENCIAS DE LA COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2995, 'MEDICINA', 'MEDICINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2996, 'MEDICINA VETERINARIA', 'MEDICINA VETERINARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2997, 'MEDICINA VETERINARIA Y ZOOTECNIA', 'MEDICINA VETERINARIA Y ZOOTECNIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2998, 'MERCADEO', 'MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (2999, 'MERCADEO AGROINDUSTRIAL', 'MERCADEO AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3000, 'MERCADEO DIGITAL', 'MERCADEO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3001, 'MERCADEO GLOBAL', 'MERCADEO GLOBAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3002, 'MERCADEO INTERNACIÓNAL Y PUBLICIDAD', 'MERCADEO INTERNACIÓNAL Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3003, 'MERCADEO NACIÓNAL E INTERNACIÓNAL', 'MERCADEO NACIÓNAL E INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3004, 'MERCADEO Y ESTRATEGIA COMERCIAL', 'MERCADEO Y ESTRATEGIA COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3005, 'MERCADEO Y NEGOCIOS INTERNACIÓNALES', 'MERCADEO Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3006, 'MERCADEO Y PUBLICIDAD', 'MERCADEO Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3007, 'MERCADEO Y VENTAS', 'MERCADEO Y VENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3008, 'MERCADOLOGÍA', 'MERCADOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3009, 'MICROBIOLOGÍA', 'MICROBIOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3010, 'MICROBIOLOGÍA INDUSTRIAL', 'MICROBIOLOGÍA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3011, 'MICROBIOLOGÍA INDUSTRIAL Y AMBIENTAL', 'MICROBIOLOGÍA INDUSTRIAL Y AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3012, 'MICROBIOLOGÍA Y BIOANÁLISIS', 'MICROBIOLOGÍA Y BIOANÁLISIS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3013, 'MODELADO Y SIMULACIÓN COMPUTACIÓNAL', 'MODELADO Y SIMULACIÓN COMPUTACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3014, 'MÚSICA', 'MÚSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3015, 'MÚSICA- CANTO', 'MÚSICA- CANTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3016, 'MÚSICA INSTRUMENTAL', 'MÚSICA INSTRUMENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3017, 'NARRATIVAS DIGITALES', 'NARRATIVAS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3018, 'NARRATIVAS DIGITALES Y AUDIOVISUALES', 'NARRATIVAS DIGITALES Y AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3019, 'NEGOCIOS DIGITALES', 'NEGOCIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3020, 'NEGOCIOS ESTRATÉGICOS DE MODA', 'NEGOCIOS ESTRATÉGICOS DE MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3021, 'NEGOCIOS INTERNACIÓNALES', 'NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3022, 'NEGOCIOS INTERNACIÓNALES Y MERCADEO', 'NEGOCIOS INTERNACIÓNALES Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3023, 'NEGOCIOS Y FINANZAS INTERNACIÓNALES', 'NEGOCIOS Y FINANZAS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3024, 'NEGOCIOS Y RELACIÓNES INTERNACIÓNALES', 'NEGOCIOS Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3025, 'NUTRICIÓN Y DIETÉTICA', 'NUTRICIÓN Y DIETÉTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3026, 'OCEANOGRAFÍA', 'OCEANOGRAFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3027, 'OCEANOGRAFIA FÍSICA', 'OCEANOGRAFIA FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3028, 'ODONTOLOGÍA', 'ODONTOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3029, 'OPTOMETRÍA', 'OPTOMETRÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3030, 'PEDAGOGÍA', 'PEDAGOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3031, 'PEDAGOGÍA EN RURALIDAD Y PAZ', 'PEDAGOGÍA EN RURALIDAD Y PAZ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3032, 'PERIODISMO', 'PERIODISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3033, 'PERIODISMO Y OPINION PÚBLICA', 'PERIODISMO Y OPINION PÚBLICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3034, 'PLANEACIÓN Y DESARROLLO SOCIAL', 'PLANEACIÓN Y DESARROLLO SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3035, 'POLÍTICA Y RELACIÓNES INTERNACIÓNALES', 'POLÍTICA Y RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3036, 'PREGRADO EN EMPRENDIMIENTO', 'PREGRADO EN EMPRENDIMIENTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3037, 'PRIMERA INFANCIA', 'PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3038, 'PRODUCCIÓN AGROINDUSTRIAL', 'PRODUCCIÓN AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3039, 'PRODUCCIÓN Y COMUNICACIÓN TRANSMEDIA', 'PRODUCCIÓN Y COMUNICACIÓN TRANSMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3040, 'PROFESIÓNAL DE DISEÑO DE MODAS', 'PROFESIÓNAL DE DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3041, 'PROFESIÓNAL EN ACTIVIDAD FÍSICA Y DEPORTE', 'PROFESIÓNAL EN ACTIVIDAD FÍSICA Y DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3042, 'PROFESIÓNAL EN ADMINISTRACIÓN DE EMPRESAS', 'PROFESIÓNAL EN ADMINISTRACIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3043, 'PROFESIÓNAL EN ADMINISTRACIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO', 'PROFESIÓNAL EN ADMINISTRACIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3044, 'PROFESIÓNAL EN AGROINDUSTRIA', 'PROFESIÓNAL EN AGROINDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3045, 'PROFESIÓNAL EN AGRONEGOCIOS', 'PROFESIÓNAL EN AGRONEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3046, 'PROFESIÓNAL EN ARTES GASTRONÓMICAS', 'PROFESIÓNAL EN ARTES GASTRONÓMICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3047, 'PROFESIÓNAL EN CIENCIAS DEL DEPORTE', 'PROFESIÓNAL EN CIENCIAS DEL DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3048, 'PROFESIÓNAL EN CIENCIAS DEL DEPORTE Y LA EDUCACIÓN FÍSICA', 'PROFESIÓNAL EN CIENCIAS DEL DEPORTE Y LA EDUCACIÓN FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3049, 'PROFESIÓNAL EN COMUNICACIÓN SOCIAL', 'PROFESIÓNAL EN COMUNICACIÓN SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3050, 'PROFESIÓNAL EN CONTADURÍA PÚBLICA', 'PROFESIÓNAL EN CONTADURÍA PÚBLICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3051, 'PROFESIÓNAL EN CRIMINALISTICA', 'PROFESIÓNAL EN CRIMINALISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3052, 'PROFESIÓNAL EN CULTURA FÍSICA Y DEPORTE', 'PROFESIÓNAL EN CULTURA FÍSICA Y DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3053, 'PROFESIÓNAL EN DANZA TEATRO', 'PROFESIÓNAL EN DANZA TEATRO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3054, 'PROFESIÓNAL EN DANZA Y PERFORMANCE', 'PROFESIÓNAL EN DANZA Y PERFORMANCE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3055, 'PROFESIÓNAL EN DEPORTE', 'PROFESIÓNAL EN DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3056, 'PROFESIÓNAL EN DEPORTE Y ACTIVIDAD FÍSICA', 'PROFESIÓNAL EN DEPORTE Y ACTIVIDAD FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3057, 'PROFESIÓNAL EN DIRECCIÓN Y PRODUCCIÓN DE RADIO Y TELEVISIÓN', 'PROFESIÓNAL EN DIRECCIÓN Y PRODUCCIÓN DE RADIO Y TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3058, 'PROFESIÓNAL EN DISEÑO DE ALTA COSTURA', 'PROFESIÓNAL EN DISEÑO DE ALTA COSTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3059, 'PROFESIÓNAL EN DISEÑO DE ESPACIOS', 'PROFESIÓNAL EN DISEÑO DE ESPACIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3060, 'PROFESIÓNAL EN DISEÑO DE INTERIORES', 'PROFESIÓNAL EN DISEÑO DE INTERIORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3061, 'PROFESIÓNAL EN DISEÑO DE MODAS', 'PROFESIÓNAL EN DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3062, 'PROFESIÓNAL EN DISEÑO DE VESTUARIO', 'PROFESIÓNAL EN DISEÑO DE VESTUARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3063, 'PROFESIÓNAL EN DISEÑO GRÁFICO', 'PROFESIÓNAL EN DISEÑO GRÁFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3064, 'PROFESIÓNAL EN DISEÑO INDUSTRIAL', 'PROFESIÓNAL EN DISEÑO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3065, 'PROFESIÓNAL EN DISEÑO VISUAL', 'PROFESIÓNAL EN DISEÑO VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3066, 'PROFESIÓNAL EN DISEÑO VISUAL DIGITAL', 'PROFESIÓNAL EN DISEÑO VISUAL DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3067, 'PROFESIÓNAL EN ENTRENAMIENTO DEPORTIVO', 'PROFESIÓNAL EN ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3068, 'PROFESIÓNAL EN FILOSOFÍA', 'PROFESIÓNAL EN FILOSOFÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3069, 'PROFESIÓNAL EN GASTRONOMÍA', 'PROFESIÓNAL EN GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3070, 'PROFESIÓNAL EN GASTRONOMÍA Y ALTA COCINA', 'PROFESIÓNAL EN GASTRONOMÍA Y ALTA COCINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3071, 'PROFESIÓNAL EN GASTRONOMÍA Y CULINARIA', 'PROFESIÓNAL EN GASTRONOMÍA Y CULINARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3072, 'PROFESIÓNAL EN GESTIÓN DE LA SEGURIDAD Y LA SALUD LABORAL', 'PROFESIÓNAL EN GESTIÓN DE LA SEGURIDAD Y LA SALUD LABORAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3073, 'PROFESIÓNAL EN GESTIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', 'PROFESIÓNAL EN GESTIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3074, 'PROFESIÓNAL EN INGENIERÍA INDUSTRIAL', 'PROFESIÓNAL EN INGENIERÍA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3075, 'PROFESIÓNAL EN INVESTIGACIÓN CRIMINAL', 'PROFESIÓNAL EN INVESTIGACIÓN CRIMINAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3076, 'PROFESIÓNAL EN LENGUA INGLESA', 'PROFESIÓNAL EN LENGUA INGLESA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3077, 'PROFESIÓNAL EN LENGUAS', 'PROFESIÓNAL EN LENGUAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3078, 'PROFESIÓNAL EN LENGUAS MODERNAS', 'PROFESIÓNAL EN LENGUAS MODERNAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3079, 'PROFESIÓNAL EN MARKETING INTERNACIÓNAL', 'PROFESIÓNAL EN MARKETING INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3080, 'PROFESIÓNAL EN MEDIOS AUDIOVISUALES', 'PROFESIÓNAL EN MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3081, 'PROFESIÓNAL EN MERCADEO', 'PROFESIÓNAL EN MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3082, 'PROFESIÓNAL EN MERCADEO EMPRESARIAL', 'PROFESIÓNAL EN MERCADEO EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3083, 'PROFESIÓNAL EN MERCADEO Y PUBLICIDAD', 'PROFESIÓNAL EN MERCADEO Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3084, 'PROFESIÓNAL EN NEGOCIOS INTERNACIÓNALES', 'PROFESIÓNAL EN NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3085, 'PROFESIÓNAL EN NEGOCIOS Y COMERCIO DIGITAL', 'PROFESIÓNAL EN NEGOCIOS Y COMERCIO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3086, 'PROFESIÓNAL EN PSICOLOGÍA', 'PROFESIÓNAL EN PSICOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3087, 'PROFESIÓNAL EN PUBLICIDAD', 'PROFESIÓNAL EN PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3088, 'PROFESIÓNAL EN PUBLICIDAD Y MERCADEO', 'PROFESIÓNAL EN PUBLICIDAD Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3089, 'PROFESIÓNAL EN SEGURIDAD Y SALUD EN EL TRABAJO', 'PROFESIÓNAL EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3090, 'PROFESIÓNAL EN SISTEMAS DE INFORMACIÓN ORGANIZACIÓNAL', 'PROFESIÓNAL EN SISTEMAS DE INFORMACIÓN ORGANIZACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3091, 'PROFESIÓNAL EN TEOLOGÍA', 'PROFESIÓNAL EN TEOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3092, 'PROFESIÓNAL EN TURISMO Y GASTRONOMÍA', 'PROFESIÓNAL EN TURISMO Y GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3093, 'PROFESIÓNAL SEGURIDAD Y SALUD EN EL TRABAJO', 'PROFESIÓNAL SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3094, 'PROFESIÓNAL UNIVERSITARIO DISEÑO GRÁFICO DIGITAL', 'PROFESIÓNAL UNIVERSITARIO DISEÑO GRÁFICO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3095, 'PROFESIÓNAL UNIVERSITARIO EN DISEÑO TEXTIL PARA LA INDUSTRIA', 'PROFESIÓNAL UNIVERSITARIO EN DISEÑO TEXTIL PARA LA INDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3096, 'PROFESIÓNAL UNIVERSITARIO EN ENTRENAMIENTO DEPORTIVO', 'PROFESIÓNAL UNIVERSITARIO EN ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3097, 'PROFESIÓNAL UNIVERSITARIO EN FOTOGRAFÍA PARA MEDIOS', 'PROFESIÓNAL UNIVERSITARIO EN FOTOGRAFÍA PARA MEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3098, 'PROFESIÓNAL UNIVESITARIO EN DISEÑO AUDIOVISUAL', 'PROFESIÓNAL UNIVESITARIO EN DISEÑO AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3099, 'PROGRAMA PROFESIÓNAL UNIVERSITARIO EN LENGUAS EXTRANJERAS', 'PROGRAMA PROFESIÓNAL UNIVERSITARIO EN LENGUAS EXTRANJERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3100, 'PSICOLOGÍA', 'PSICOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3101, 'PUBLICIDAD', 'PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3102, 'PUBLICIDAD DIGITAL Y MERCADEO', 'PUBLICIDAD DIGITAL Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3103, 'PUBLICIDAD EN MEDIOS DIGITALES', 'PUBLICIDAD EN MEDIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3104, 'PUBLICIDAD INTERNACIÓNAL', 'PUBLICIDAD INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3105, 'PUBLICIDAD Y MARKETING DIGITAL', 'PUBLICIDAD Y MARKETING DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3106, 'PUBLICIDAD Y MERCADEO', 'PUBLICIDAD Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3107, 'PUBLICIDAD Y MERCADEO DIGITAL', 'PUBLICIDAD Y MERCADEO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3108, 'PUBLICIDAD Y RELACIÓNES PÚBLICAS', 'PUBLICIDAD Y RELACIÓNES PÚBLICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3109, 'QUÍMICA', 'QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3110, 'QUÍMICA AMBIENTAL', 'QUÍMICA AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3111, 'QUÍMICA FARMACÉUTICA', 'QUÍMICA FARMACÉUTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3112, 'QUÍMICA INDUSTRIAL', 'QUÍMICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3113, 'QUÍMICA Y FARMACIA', 'QUÍMICA Y FARMACIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3114, 'REALIZACIÓN EN ANIMACIÓN', 'REALIZACIÓN EN ANIMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3115, 'REALIZACIÓN Y PRODUCCIÓN MÚSICAL', 'REALIZACIÓN Y PRODUCCIÓN MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3116, 'RECREACIÓN', 'RECREACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3117, 'RELACIÓNES ECONÓMICAS INTERNACIÓNALES', 'RELACIÓNES ECONÓMICAS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3118, 'RELACIÓNES INTERNACIÓNALES', 'RELACIÓNES INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3119, 'RELACIÓNES INTERNACIÓNALES Y ESTUDIOS POLITICOS', 'RELACIÓNES INTERNACIÓNALES Y ESTUDIOS POLITICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3120, 'REVITALIZACIÓN DE LA MADRE TIERRA', 'REVITALIZACIÓN DE LA MADRE TIERRA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3121, 'SALUD OCUPACIÓNAL', 'SALUD OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3122, 'SEGURIDAD Y SALUD EN EL TRABAJO', 'SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3123, 'SOCIOLOGÍA', 'SOCIOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3124, 'TEATRO MÚSICAL', 'TEATRO MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3125, 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS EN SALUD', 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS EN SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3126, 'TÉCNICA PROFESIÓNAL EN ANÁLISIS DE MEDICIÓNES DE LA PRODUCCIÓN MINERO ENERGÉTICA', 'TÉCNICA PROFESIÓNAL EN ANÁLISIS DE MEDICIÓNES DE LA PRODUCCIÓN MINERO ENERGÉTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3127, 'TÉCNICA PROFESIÓNAL EN ATENCIÓN AL CLIENTE', 'TÉCNICA PROFESIÓNAL EN ATENCIÓN AL CLIENTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3128, 'TÉCNICA PROFESIÓNAL EN ATENCIÓN INTEGRAL A LA PRIMERA INFANCIA', 'TÉCNICA PROFESIÓNAL EN ATENCIÓN INTEGRAL A LA PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3129, 'TÉCNICA PROFESIÓNAL EN ATENCIÓN PREHOSPITALARIA', 'TÉCNICA PROFESIÓNAL EN ATENCIÓN PREHOSPITALARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3130, 'TÉCNICA PROFESIÓNAL EN AVALÚOS INMOBILIARIOS URBANOS Y RURALES', 'TÉCNICA PROFESIÓNAL EN AVALÚOS INMOBILIARIOS URBANOS Y RURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3131, 'TÉCNICA PROFESIÓNAL EN BIOTRANSFORMACIÓN DE RESIDUOS ORGÁNICOS', 'TÉCNICA PROFESIÓNAL EN BIOTRANSFORMACIÓN DE RESIDUOS ORGÁNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3132, 'TÉCNICA PROFESIÓNAL EN COMERCIALIZACIÓN DE CAFÉ', 'TÉCNICA PROFESIÓNAL EN COMERCIALIZACIÓN DE CAFÉ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3133, 'TÉCNICA PROFESIÓNAL EN COMPUTACIÓN', 'TÉCNICA PROFESIÓNAL EN COMPUTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3134, 'TÉCNICA PROFESIÓNAL EN CONFIGURACIÓN DE SERVICIOS PARA COMERCIO ELECTRÓNICO', 'TÉCNICA PROFESIÓNAL EN CONFIGURACIÓN DE SERVICIOS PARA COMERCIO ELECTRÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3135, 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN', 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3136, 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE EDIFICACIÓNES', 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE EDIFICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3137, 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE PROYECTOS ARQUITECTÓNICOS', 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE PROYECTOS ARQUITECTÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3138, 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD', 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3139, 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD Y FINANZAS', 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3140, 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD Y TRIBUTARIA', 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD Y TRIBUTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3141, 'TÉCNICA PROFESIÓNAL EN COSMETOLOGÍA Y ESTÉTICA', 'TÉCNICA PROFESIÓNAL EN COSMETOLOGÍA Y ESTÉTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3142, 'TÉCNICA PROFESIÓNAL EN CRIMINALÍSTICA (CICLO PROPEDÉUTICO)', 'TÉCNICA PROFESIÓNAL EN CRIMINALÍSTICA (CICLO PROPEDÉUTICO)', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3143, 'TÉCNICA PROFESIÓNAL EN DESARROLLO DE APLICACIÓNES PARA MÓVILES', 'TÉCNICA PROFESIÓNAL EN DESARROLLO DE APLICACIÓNES PARA MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3144, 'TÉCNICA PROFESIÓNAL EN DIBUJO ARQUITECTÓNICO Y DECORACIÓN', 'TÉCNICA PROFESIÓNAL EN DIBUJO ARQUITECTÓNICO Y DECORACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3145, 'TÉCNICA PROFESIÓNAL EN DISEÑO GRAFICO', 'TÉCNICA PROFESIÓNAL EN DISEÑO GRAFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3146, 'TÉCNICA PROFESIÓNAL EN DISTRIBUCIÓN LOGÍSTICA Y COMERCIAL', 'TÉCNICA PROFESIÓNAL EN DISTRIBUCIÓN LOGÍSTICA Y COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3147, 'TÉCNICA PROFESIÓNAL EN DOCUMENTACIÓN DE LA CALIDAD', 'TÉCNICA PROFESIÓNAL EN DOCUMENTACIÓN DE LA CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3148, 'TÉCNICA PROFESIÓNAL EN DOCUMENTACIÓN DE PROYECTOS URBANÍSTICOS', 'TÉCNICA PROFESIÓNAL EN DOCUMENTACIÓN DE PROYECTOS URBANÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3149, 'TÉCNICA PROFESIÓNAL EN EJECUCIÓN DE PROYECTOS CULTURALES', 'TÉCNICA PROFESIÓNAL EN EJECUCIÓN DE PROYECTOS CULTURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3150, 'TÉCNICA PROFESIÓNAL EN ELABORACIÓN DE VESTUARIO Y PATRONAJE', 'TÉCNICA PROFESIÓNAL EN ELABORACIÓN DE VESTUARIO Y PATRONAJE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3151, 'TÉCNICA PROFESIÓNAL EN ELECTRICIDAD INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN ELECTRICIDAD INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3152, 'TÉCNICA PROFESIÓNAL EN ELECTROMECÁNICA', 'TÉCNICA PROFESIÓNAL EN ELECTROMECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3153, 'TÉCNICA PROFESIÓNAL EN ESTÉTICA COSMETOLÓGICA', 'TÉCNICA PROFESIÓNAL EN ESTÉTICA COSMETOLÓGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3154, 'TÉCNICA PROFESIÓNAL EN EXPRESIÓN GRÁFICA ARQUITECTÓNICA', 'TÉCNICA PROFESIÓNAL EN EXPRESIÓN GRÁFICA ARQUITECTÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3155, 'TÉCNICA PROFESIÓNAL EN EXTRACCIÓN Y MAQUINARIA MINERO AURIFERA', 'TÉCNICA PROFESIÓNAL EN EXTRACCIÓN Y MAQUINARIA MINERO AURIFERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3156, 'TÉCNICA PROFESIÓNAL EN FACTURACIÓN Y CARTERA DE SERVICIOS DE SALUD', 'TÉCNICA PROFESIÓNAL EN FACTURACIÓN Y CARTERA DE SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3157, 'TÉCNICA PROFESIÓNAL EN FORMULACIÓN Y GESTIÓN DE PROYECTOS', 'TÉCNICA PROFESIÓNAL EN FORMULACIÓN Y GESTIÓN DE PROYECTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3158, 'TÉCNICA PROFESIÓNAL EN GESTIÓN DE ADUANAS Y COMERCIO EXTERIOR', 'TÉCNICA PROFESIÓNAL EN GESTIÓN DE ADUANAS Y COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3159, 'TÉCNICA PROFESIÓNAL EN GESTIÓN DE BARES Y RESTAURANTES', 'TÉCNICA PROFESIÓNAL EN GESTIÓN DE BARES Y RESTAURANTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3160, 'TÉCNICA PROFESIÓNAL EN GESTIÓN EMPRESARIAL', 'TÉCNICA PROFESIÓNAL EN GESTIÓN EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3161, 'TÉCNICA PROFESIÓNAL EN HOTELERÍA Y TURISMO', 'TÉCNICA PROFESIÓNAL EN HOTELERÍA Y TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3162, 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN DE REDES DE TELECOMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN DE REDES DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3163, 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y CONFIGURACIÓN DE REDES', 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y CONFIGURACIÓN DE REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3164, 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO DE REDES DE TELECOMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO DE REDES DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3165, 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO DE REDES Y COMPUTADORES', 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO DE REDES Y COMPUTADORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3166, 'TÉCNICA PROFESIÓNAL EN INSTALACIÓNES ELÉCTRICAS PARA SISTEMAS RENOVABLES', 'TÉCNICA PROFESIÓNAL EN INSTALACIÓNES ELÉCTRICAS PARA SISTEMAS RENOVABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3167, 'TÉCNICA PROFESIÓNAL EN LOGÍSTICA DE COMERCIO EXTERIOR', 'TÉCNICA PROFESIÓNAL EN LOGÍSTICA DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3168, 'TÉCNICA PROFESIÓNAL EN LOGÍSTICA DE PRODUCCIÓN', 'TÉCNICA PROFESIÓNAL EN LOGÍSTICA DE PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3169, 'TÉCNICA PROFESIÓNAL EN LOGÍSTICA INTERNACIÓNAL DE COMERCIO', 'TÉCNICA PROFESIÓNAL EN LOGÍSTICA INTERNACIÓNAL DE COMERCIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3170, 'TÉCNICA PROFESIÓNAL EN MANEJO AGROINDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN MANEJO AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3171, 'TÉCNICA PROFESIÓNAL EN MANEJO DE MICROCRÉDITOS', 'TÉCNICA PROFESIÓNAL EN MANEJO DE MICROCRÉDITOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3172, 'TÉCNICA PROFESIÓNAL EN MANEJO DE SUELOS Y AGUAS', 'TÉCNICA PROFESIÓNAL EN MANEJO DE SUELOS Y AGUAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3173, 'TÉCNICA PROFESIÓNAL EN MANEJO DE VEHÍCULOS DE CARGA PESADA', 'TÉCNICA PROFESIÓNAL EN MANEJO DE VEHÍCULOS DE CARGA PESADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3174, 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURAL', 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3175, 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDÉUTICOS', 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDÉUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3176, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE COMPUTADORES E INSTALACIÓN Y CONFIGURACIÓN DE REDES LAN', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE COMPUTADORES E INSTALACIÓN Y CONFIGURACIÓN DE REDES LAN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3177, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE COMPUTADORES Y REDES', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE COMPUTADORES Y REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3178, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE MAQUINARIA PESADA', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE MAQUINARIA PESADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3179, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE REDES', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3180, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS INFORMÁTICOS', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3181, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS MECATRÓNICOS', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3182, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS MECATRÓNICOS INDUSTRIALES', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS MECATRÓNICOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3183, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3184, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3185, 'TÉCNICA PROFESIÓNAL EN MANTENMIENTO ELECTROMECÁNICO', 'TÉCNICA PROFESIÓNAL EN MANTENMIENTO ELECTROMECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3186, 'TÉCNICA PROFESIÓNAL EN MASOTERAPIA', 'TÉCNICA PROFESIÓNAL EN MASOTERAPIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3187, 'TÉCNICA PROFESIÓNAL EN MECÁNICA AUTOMOTRIZ', 'TÉCNICA PROFESIÓNAL EN MECÁNICA AUTOMOTRIZ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3188, 'TÉCNICA PROFESIÓNAL EN MEDICIÓN DEL IMPACTO AMBIENTAL', 'TÉCNICA PROFESIÓNAL EN MEDICIÓN DEL IMPACTO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3189, 'TÉCNICA PROFESIÓNAL EN MERCADEO Y ESTRATEGIAS COMERCIALES', 'TÉCNICA PROFESIÓNAL EN MERCADEO Y ESTRATEGIAS COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3190, 'TÉCNICA PROFESIÓNAL EN MERCADOTECNIA', 'TÉCNICA PROFESIÓNAL EN MERCADOTECNIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3191, 'TÉCNICA PROFESIÓNAL EN MONITOREO AMBIENTAL', 'TÉCNICA PROFESIÓNAL EN MONITOREO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3192, 'TÉCNICA PROFESIÓNAL EN NOMINA Y PRESTACIÓNES SOCIALES', 'TÉCNICA PROFESIÓNAL EN NOMINA Y PRESTACIÓNES SOCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3193, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE ALMACENES Y TRANSPORTE', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE ALMACENES Y TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3194, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE COMERCIO ELECTRÓNICO', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE COMERCIO ELECTRÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3195, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE EQUIPOS INDUSTRIALES Y ACTIVIDADES MINERAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE EQUIPOS INDUSTRIALES Y ACTIVIDADES MINERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3196, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE MERCADEO Y VENTAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE MERCADEO Y VENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3197, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PLANTAS PETROQUÍMICAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PLANTAS PETROQUÍMICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3198, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS ADUANEROS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS ADUANEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3199, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS PETROQUÍMICOS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS PETROQUÍMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3200, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS COMUNITARIOS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS COMUNITARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3201, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS GASTRONÓMICOS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS GASTRONÓMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3202, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS TURÍSTICOS Y HOTELEROS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS TURÍSTICOS Y HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3203, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SISTEMAS DE MANEJO AMBIENTAL', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SISTEMAS DE MANEJO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3204, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN EN SEGURIDAD MINERA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN EN SEGURIDAD MINERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3205, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN GASTRONÓMICA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN GASTRONÓMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3206, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN GASTRONÓMICA Y DE BEBIDAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN GASTRONÓMICA Y DE BEBIDAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3207, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN LOGÍSTICA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3208, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN Y MANTENIMIENTO DE BASES DE DATOS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN Y MANTENIMIENTO DE BASES DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3209, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES ADMINISTRATIVAS DE LA SALUD', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES ADMINISTRATIVAS DE LA SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3210, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES ADMINISTRATIVAS Y FINANCIERAS DE LA SALUD', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES ADMINISTRATIVAS Y FINANCIERAS DE LA SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3211, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES COMERCIALES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3212, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES LOGÍSTICAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES LOGÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3213, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES MINERAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES MINERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3214, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES PORTUARIAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES PORTUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3215, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES TURÍSTICAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES TURÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3216, 'TÉCNICA PROFESIÓNAL EN ORGANIZACIÓN DE CERTÁMENES', 'TÉCNICA PROFESIÓNAL EN ORGANIZACIÓN DE CERTÁMENES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3217, 'TÉCNICA PROFESIÓNAL EN PISCICULTURA CONTINENTAL', 'TÉCNICA PROFESIÓNAL EN PISCICULTURA CONTINENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3218, 'TÉCNICA PROFESIÓNAL EN PROCESAMIENTO Y CALIDAD NUTRICIÓNAL DE ALIMENTOS', 'TÉCNICA PROFESIÓNAL EN PROCESAMIENTO Y CALIDAD NUTRICIÓNAL DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3219, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3220, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE SALUD', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3221, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS EMPRESARIALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS EMPRESARIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3222, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINSITRATIVOS PARA FINCAS CAFETERAS', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINSITRATIVOS PARA FINCAS CAFETERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3223, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADUANEROS', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADUANEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3224, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADUANEROS Y TRIBUTARIOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADUANEROS Y TRIBUTARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3225, 'TÉCNICA PROFESIÓNAL EN PROCESOS BANCARIOS Y FINANCIEROS', 'TÉCNICA PROFESIÓNAL EN PROCESOS BANCARIOS Y FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3226, 'TÉCNICA PROFESIÓNAL EN PROCESOS COMERCIALES Y FINANCIEROS', 'TÉCNICA PROFESIÓNAL EN PROCESOS COMERCIALES Y FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3227, 'TÉCNICA PROFESIÓNAL EN PROCESOS COMUNICATIVOS Y COMERCIALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS COMUNICATIVOS Y COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3228, 'TÉCNICA PROFESIÓNAL EN PROCESOS CONTABLES', 'TÉCNICA PROFESIÓNAL EN PROCESOS CONTABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3229, 'TÉCNICA PROFESIÓNAL EN PROCESOS CONTABLES Y TRIBUTARIOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS CONTABLES Y TRIBUTARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3230, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE ADMINISTRACIÓN DEPORTIVA', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE ADMINISTRACIÓN DEPORTIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3231, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE ALMACENAMIENTO', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE ALMACENAMIENTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3232, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE COMERCIO EXTERIOR', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3233, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE COMUNICACIÓN DIGITAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE COMUNICACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3234, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MANEJO AMBIENTAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MANEJO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3235, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MARKETING DIGITAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MARKETING DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3236, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE PRODUCCIÓN', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3237, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE PRODUCCIÓN AGRÍCOLA', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE PRODUCCIÓN AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3238, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE PRODUCCIÓN GRÁFICA', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE PRODUCCIÓN GRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3239, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE REDES Y COMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE REDES Y COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3240, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE SALUD OCUPACIÓNAL Y DESARROLLO SOSTENIBLE', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE SALUD OCUPACIÓNAL Y DESARROLLO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3241, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE SEGURIDAD Y SALUD EN EL TRABAJO', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3242, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE SISTEMAS INFORMÁTICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3243, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE TALENTO HUMANO', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE TALENTO HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3244, 'TÉCNICA PROFESIÓNAL EN PROCESOS DEL TURISMO SOSTENIBLE', 'TÉCNICA PROFESIÓNAL EN PROCESOS DEL TURISMO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3245, 'TÉCNICA PROFESIÓNAL EN PROCESOS EMPRESARIALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS EMPRESARIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3246, 'TÉCNICA PROFESIÓNAL EN PROCESOS GRÁFICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS GRÁFICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3247, 'TÉCNICA PROFESIÓNAL EN PROCESOS JUDICIALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS JUDICIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3248, 'TÉCNICA PROFESIÓNAL EN PROCESOS LOGÍSTICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS LOGÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3249, 'TÉCNICA PROFESIÓNAL EN PROCESOS METROLÓGICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS METROLÓGICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3250, 'TÉCNICA PROFESIÓNAL EN PROCESOS TURÍSTICOS Y HOTELEROS', 'TÉCNICA PROFESIÓNAL EN PROCESOS TURÍSTICOS Y HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3251, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN ACUÍCOLA CONTINENTAL', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN ACUÍCOLA CONTINENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3252, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN AGROECOLÓGICA DE CULTIVOS', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN AGROECOLÓGICA DE CULTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3253, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN AGROPECUARIA', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3254, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE CAFÉ', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE CAFÉ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3255, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE CONTENIDOS AUDIOVISUALES', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE CONTENIDOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3256, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE CONTENIDOS INFORMÁTIVOS', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE CONTENIDOS INFORMÁTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3257, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE EVENTOS Y ENTRETENIMIENTO', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE EVENTOS Y ENTRETENIMIENTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3258, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE MATERIAS PRIMAS AGROINDUSTRIALES', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE MATERIAS PRIMAS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3259, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE OBJETOS PARA LA INTERACCIÓN DIGITAL', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE OBJETOS PARA LA INTERACCIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3260, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE OBJETOS PARA LAS PRÁCTICAS VISUALES', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE OBJETOS PARA LAS PRÁCTICAS VISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3261, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE PALMA DE ACEITE', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE PALMA DE ACEITE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3262, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE PETROLEO Y GAS', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE PETROLEO Y GAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3263, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE PIEZAS MULTIMEDIA', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE PIEZAS MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3264, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN GANADERA DE CARNE Y LECHE', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN GANADERA DE CARNE Y LECHE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3265, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN GRÁFICA', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN GRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3266, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN GRÁFICA Y MULTIMEDIAL', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN GRÁFICA Y MULTIMEDIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3267, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN PARA LAS PRÁCTICAS MÚSICALES', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN PARA LAS PRÁCTICAS MÚSICALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3268, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN SONORA PARA CONTENIDOS DIGITALES', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN SONORA PARA CONTENIDOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3269, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN Y TRANSFORMACIÓN DEL ACERO', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN Y TRANSFORMACIÓN DEL ACERO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3270, 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE APLICACIÓNES DE SOFTWARE', 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE APLICACIÓNES DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3271, 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE DISPOSITIVOS MÓVILES', 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE DISPOSITIVOS MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3272, 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE SOFTWARE', 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3273, 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN WEB', 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3274, 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN WEB Y MULTIMEDIA', 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN WEB Y MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3275, 'TÉCNICA PROFESIÓNAL EN PROMOCIÓN SOCIAL', 'TÉCNICA PROFESIÓNAL EN PROMOCIÓN SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3276, 'TÉCNICA PROFESIÓNAL EN RECONOCIMIENTO ADUANERO', 'TÉCNICA PROFESIÓNAL EN RECONOCIMIENTO ADUANERO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3277, 'TÉCNICA PROFESIÓNAL EN REGISTRO DE PROCESOS PRODUCTIVOS', 'TÉCNICA PROFESIÓNAL EN REGISTRO DE PROCESOS PRODUCTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3278, 'TÉCNICA PROFESIÓNAL EN SEGURIDAD INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN SEGURIDAD INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3279, 'TÉCNICA PROFESIÓNAL EN SEGURIDAD INTEGRAL CANINA', 'TÉCNICA PROFESIÓNAL EN SEGURIDAD INTEGRAL CANINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3280, 'TÉCNICA PROFESIÓNAL EN SEGURIDAD VIAL', 'TÉCNICA PROFESIÓNAL EN SEGURIDAD VIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3281, 'TÉCNICA PROFESIÓNAL EN SERVICIO AUTOMOTRIZ', 'TÉCNICA PROFESIÓNAL EN SERVICIO AUTOMOTRIZ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3282, 'TÉCNICA PROFESIÓNAL EN SOLDADURA DE ESTRUCTURAS METÁLICAS', 'TÉCNICA PROFESIÓNAL EN SOLDADURA DE ESTRUCTURAS METÁLICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3283, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE DOCUMENTACIÓN DE CALIDAD', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE DOCUMENTACIÓN DE CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3284, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE INFRAESTRUCTURAS INFORMÁTICAS Y REDES DE DATOS', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE INFRAESTRUCTURAS INFORMÁTICAS Y REDES DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3285, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS E INFORMÁTICA', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS E INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3286, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS ELECTRÓNICOS', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS ELECTRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3287, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS EN INFORMÁTICA', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS EN INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3288, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS INFORMÁTICOS Y REDES', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS INFORMÁTICOS Y REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3289, 'TÉCNICA PROFESIÓNAL EN SOPORTE INFORMÁTICO', 'TÉCNICA PROFESIÓNAL EN SOPORTE INFORMÁTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3290, 'TÉCNICA PROFESIÓNAL EN SOPORTE PARA CENTROS DE SERVICIO', 'TÉCNICA PROFESIÓNAL EN SOPORTE PARA CENTROS DE SERVICIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3291, 'TÉCNICA PROFESIÓNAL EN SOPORTE Y OPERACIÓN DE SISTEMAS INFORMÁTICOS', 'TÉCNICA PROFESIÓNAL EN SOPORTE Y OPERACIÓN DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3292, 'TÈCNICA PROFESIÓNAL EN SOPORTE Y PROCESOS INFORMÁTICOS', 'TÈCNICA PROFESIÓNAL EN SOPORTE Y PROCESOS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3293, 'TÉCNICA PROFESIÓNAL EN TELECOMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3294, 'TÉCNICA PROFESIÓNAL EN TRANSPORTE TERRESTRE DE CARGA', 'TÉCNICA PROFESIÓNAL EN TRANSPORTE TERRESTRE DE CARGA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3295, 'TÉCNICA PROFESIÓNAL EN TURISMO SOSTENIBLE', 'TÉCNICA PROFESIÓNAL EN TURISMO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3296, 'TÉCNICA PROFESIÓNAL EN VIDEO, DISCJOCKEY Y SONIDO', 'TÉCNICA PROFESIÓNAL EN VIDEO, DISCJOCKEY Y SONIDO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3297, 'TÉCNICA PROFESIÓNAL JUDICIAL', 'TÉCNICA PROFESIÓNAL JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3298, 'TÉCNICO EN OPERACIÓN DE SERVICIOS TURÍSTICOS', 'TÉCNICO EN OPERACIÓN DE SERVICIOS TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3299, 'TÉCNICO PROFESIÓNAL EN ACUICULTURA', 'TÉCNICO PROFESIÓNAL EN ACUICULTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3300, 'TÉCNICO PROFESIÓNAL EN ANIMACIÓN Y MULTIMEDIA', 'TÉCNICO PROFESIÓNAL EN ANIMACIÓN Y MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3301, 'TÉCNICO PROFESIÓNAL EN APLICACIÓNES WEB', 'TÉCNICO PROFESIÓNAL EN APLICACIÓNES WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3302, 'TÉCNICO PROFESIÓNAL EN ASESORÍA COMERCIAL PARA SOLUCIÓNES DIGITALES', 'TÉCNICO PROFESIÓNAL EN ASESORÍA COMERCIAL PARA SOLUCIÓNES DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3303, 'TÉCNICO PROFESIÓNAL EN AVALÚOS INMOBILIARIOS URBANOS Y RURALES', 'TÉCNICO PROFESIÓNAL EN AVALÚOS INMOBILIARIOS URBANOS Y RURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3304, 'TÉCNICO PROFESIÓNAL EN BIOCOMERCIO', 'TÉCNICO PROFESIÓNAL EN BIOCOMERCIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3305, 'TÉCNICO PROFESIÓNAL EN COMERCIO EXTERIOR', 'TÉCNICO PROFESIÓNAL EN COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3306, 'TÉCNICO PROFESIÓNAL EN COMERCIO INTERNACIÓNAL', 'TÉCNICO PROFESIÓNAL EN COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3307, 'TÉCNICO PROFESIÓNAL EN CONDUCCIÓN DE VEHÍCULOS DE TRANSPORTE TERRESTRE', 'TÉCNICO PROFESIÓNAL EN CONDUCCIÓN DE VEHÍCULOS DE TRANSPORTE TERRESTRE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3308, 'TÉCNICO PROFESIÓNAL EN CONTABILIDAD', 'TÉCNICO PROFESIÓNAL EN CONTABILIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3309, 'TÉCNICO PROFESIÓNAL EN CONTABILIDAD Y FINANZAS', 'TÉCNICO PROFESIÓNAL EN CONTABILIDAD Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3310, 'TÉCNICO PROFESIÓNAL EN CULINARIA', 'TÉCNICO PROFESIÓNAL EN CULINARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3311, 'TÉCNICO PROFESIÓNAL EN CULTIVO DE CAFÉS ESPECIALES', 'TÉCNICO PROFESIÓNAL EN CULTIVO DE CAFÉS ESPECIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3312, 'TÉCNICO PROFESIÓNAL EN DECORACIÓN DE AMBIENTES', 'TÉCNICO PROFESIÓNAL EN DECORACIÓN DE AMBIENTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3313, 'TÉCNICO PROFESIÓNAL EN DESARROLLO DE APLICACIÓNES WEB MÓVILES', 'TÉCNICO PROFESIÓNAL EN DESARROLLO DE APLICACIÓNES WEB MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3314, 'TÉCNICO PROFESIÓNAL EN DESARROLLO DE PROCESOS Y SERVICIOS BIBLIOTECARIOS', 'TÉCNICO PROFESIÓNAL EN DESARROLLO DE PROCESOS Y SERVICIOS BIBLIOTECARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3315, 'TÉCNICO PROFESIÓNAL EN DESARROLLO DE SOFTWARE PARA DISPOSITIVOS MÓVILES', 'TÉCNICO PROFESIÓNAL EN DESARROLLO DE SOFTWARE PARA DISPOSITIVOS MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3316, 'TÉCNICO PROFESIÓNAL EN DESARROLLO PARA DISPOSITIVOS MOVILES', 'TÉCNICO PROFESIÓNAL EN DESARROLLO PARA DISPOSITIVOS MOVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3317, 'TÉCNICO PROFESIÓNAL EN DISEÑO WEB Y MULTIMEDIA', 'TÉCNICO PROFESIÓNAL EN DISEÑO WEB Y MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3318, 'TÉCNICO PROFESIÓNAL EN ENTRENAMIENTO DE FÚTBOL', 'TÉCNICO PROFESIÓNAL EN ENTRENAMIENTO DE FÚTBOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3319, 'TÉCNICO PROFESIÓNAL EN ENTRENAMIENTO DEPORTIVO', 'TÉCNICO PROFESIÓNAL EN ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3320, 'TÉCNICO PROFESIÓNAL EN EXPRESIÓN GRÁFICA Y DIGITAL', 'TÉCNICO PROFESIÓNAL EN EXPRESIÓN GRÁFICA Y DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3321, 'TÉCNICO PROFESIÓNAL EN GESTIÓN COMERCIAL DEL SECTOR AGROPECUARIO', 'TÉCNICO PROFESIÓNAL EN GESTIÓN COMERCIAL DEL SECTOR AGROPECUARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3322, 'TÉCNICO PROFESIÓNAL EN HOTELERÍA Y TURISMO', 'TÉCNICO PROFESIÓNAL EN HOTELERÍA Y TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3323, 'TÉCNICO PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO ELÉCTRICO', 'TÉCNICO PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO ELÉCTRICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3324, 'TÉCNICO PROFESIÓNAL EN INTELIGENCIA Y CONTRAINTELIGENCIA POLICIAL', 'TÉCNICO PROFESIÓNAL EN INTELIGENCIA Y CONTRAINTELIGENCIA POLICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3325, 'TÉCNICO PROFESIÓNAL EN LOGÍSTICA DE AGRONEGOCIOS', 'TÉCNICO PROFESIÓNAL EN LOGÍSTICA DE AGRONEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3326, 'TÉCNICO PROFESIÓNAL EN MANEJO DE SUELOS Y AGUAS', 'TÉCNICO PROFESIÓNAL EN MANEJO DE SUELOS Y AGUAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3327, 'TÉCNICO PROFESIÓNAL EN MANEJO ECOLÓGICO DE PLAGAS', 'TÉCNICO PROFESIÓNAL EN MANEJO ECOLÓGICO DE PLAGAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3328, 'TÉCNICO PROFESIÓNAL EN MANEJO SILVICULTURAL', 'TÉCNICO PROFESIÓNAL EN MANEJO SILVICULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3329, 'TÉCNICO PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDÉUTICOS', 'TÉCNICO PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDÉUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3330, 'TÉCNICO PROFESIÓNAL EN MANEJO Y CONSERVACIÓN DE PRODUCTOS AGROINDUSTRIALES', 'TÉCNICO PROFESIÓNAL EN MANEJO Y CONSERVACIÓN DE PRODUCTOS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3331, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO INDUSTRIAL', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3332, 'TÉCNICO PROFESIÓNAL EN MAQUILLAJE ARTISTICO', 'TÉCNICO PROFESIÓNAL EN MAQUILLAJE ARTISTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3333, 'TÉCNICO PROFESIÓNAL EN MECÁNICA AUTOMOTRIZ', 'TÉCNICO PROFESIÓNAL EN MECÁNICA AUTOMOTRIZ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3334, 'TÉCNICO PROFESIÓNAL EN MECÁNICA DE MOTOS', 'TÉCNICO PROFESIÓNAL EN MECÁNICA DE MOTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3335, 'TÉCNICO PROFESIÓNAL EN MECÁNICA DE VEHÍCULOS HÍBRIDOS Y ELÉCTRICOS', 'TÉCNICO PROFESIÓNAL EN MECÁNICA DE VEHÍCULOS HÍBRIDOS Y ELÉCTRICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3336, 'TÉCNICO PROFESIÓNAL EN MECATRÓNICA', 'TÉCNICO PROFESIÓNAL EN MECATRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3337, 'TÉCNICO PROFESIÓNAL EN MERCADEO Y PUBLICIDAD', 'TÉCNICO PROFESIÓNAL EN MERCADEO Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3338, 'TÉCNICO PROFESIÓNAL EN MUESTREO Y MONITOREO AMBIENTAL', 'TÉCNICO PROFESIÓNAL EN MUESTREO Y MONITOREO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3339, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE ALMACENES Y TRANSPORTE', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE ALMACENES Y TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3340, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE COMERCIO EXTERIOR', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3341, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE EQUIPOS DE AUSCULTACIÓN MINERO ENERGÉTICO', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE EQUIPOS DE AUSCULTACIÓN MINERO ENERGÉTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3342, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE EQUIPOS DE MUESTREO MINERO ENERGÉTIC0', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE EQUIPOS DE MUESTREO MINERO ENERGÉTIC0', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3343, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE MEDIOS VIRTUALES', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE MEDIOS VIRTUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3344, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE OBJETOS VIRTUALES', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE OBJETOS VIRTUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3345, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE PROCESOS ADUANEROS', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE PROCESOS ADUANEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3346, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SERVICIOS DE GUIANZA', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SERVICIOS DE GUIANZA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3347, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SERVICIOS GASTRONÓMICOS', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SERVICIOS GASTRONÓMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3348, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SONIDO Y GRABACIÓN', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SONIDO Y GRABACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3349, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DEL PUNTO DE VENTA', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DEL PUNTO DE VENTA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3350, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DEL TRANSPORTE MULTIMODAL', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DEL TRANSPORTE MULTIMODAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3351, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN HOTELERA', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN HOTELERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3352, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN INTEGRAL DE VENTAS TURÍSTICAS', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN INTEGRAL DE VENTAS TURÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3353, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN LOGÍSTICA', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3354, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN TURÍSTICA', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3355, 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES DE COMERCIO ELECTRÓNICO', 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES DE COMERCIO ELECTRÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3498, 'TECNOLOGÍA EN CONSTRUCCIÓNES CIVILES', 'TECNOLOGÍA EN CONSTRUCCIÓNES CIVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3356, 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES DE COMERCIO EXTERIOR', 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3357, 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES DE IMPORTACIÓN Y EXPORTACIÓN', 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES DE IMPORTACIÓN Y EXPORTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3358, 'TÉCNICO PROFESIÓNAL EN ORGANIZACIÓN Y AMBIENTACIÓN DE EVENTOS', 'TÉCNICO PROFESIÓNAL EN ORGANIZACIÓN Y AMBIENTACIÓN DE EVENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3359, 'TÉCNICO PROFESIÓNAL EN PERFORACIÓN DE POZOS PETROLÍFEROS', 'TÉCNICO PROFESIÓNAL EN PERFORACIÓN DE POZOS PETROLÍFEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3360, 'TÉCNICO PROFESIÓNAL EN PREVENCIÓN DE RIESGOS LABORALES', 'TÉCNICO PROFESIÓNAL EN PREVENCIÓN DE RIESGOS LABORALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3361, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3362, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS EN SALUD', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS EN SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3363, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADUANEROS', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADUANEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3364, 'TÉCNICO PROFESIÓNAL EN PROCESOS AGROINDUSTRIALES', 'TÉCNICO PROFESIÓNAL EN PROCESOS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3365, 'TÉCNICO PROFESIÓNAL EN PROCESOS AMBIENTALES', 'TÉCNICO PROFESIÓNAL EN PROCESOS AMBIENTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3366, 'TÉCNICO PROFESIÓNAL EN PROCESOS CONTABLES', 'TÉCNICO PROFESIÓNAL EN PROCESOS CONTABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3367, 'TÉCNICO PROFESIÓNAL EN PROCESOS CONTABLES Y TRIBUTARIOS', 'TÉCNICO PROFESIÓNAL EN PROCESOS CONTABLES Y TRIBUTARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3368, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE CLOUD COMPUTING', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE CLOUD COMPUTING', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3369, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE DISEÑO DE MODAS', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3370, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE EXTRACCIÓN DE BIOMASA ENERGÉTICA', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE EXTRACCIÓN DE BIOMASA ENERGÉTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3371, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE GESTIÓN PÚBLICA', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE GESTIÓN PÚBLICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3372, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE GESTIÓN PÚBLICA TERRITORIAL', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE GESTIÓN PÚBLICA TERRITORIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3373, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE PUBLICIDAD DIGITAL', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE PUBLICIDAD DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3374, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE SEGURIDAD Y SALUD EN EL TRABAJO', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3375, 'TÉCNICO PROFESIÓNAL EN PROCESOS DEL TALENTO HUMANO', 'TÉCNICO PROFESIÓNAL EN PROCESOS DEL TALENTO HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3376, 'TÉCNICO PROFESIÓNAL EN PROCESOS EMPRESARIALES', 'TÉCNICO PROFESIÓNAL EN PROCESOS EMPRESARIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3377, 'TÉCNICO PROFESIÓNAL EN PROCESOS GRÁFICOS', 'TÉCNICO PROFESIÓNAL EN PROCESOS GRÁFICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3378, 'TÉCNICO PROFESIÓNAL EN PROCESOS HOTELEROS Y DE SERVICIOS', 'TÉCNICO PROFESIÓNAL EN PROCESOS HOTELEROS Y DE SERVICIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3379, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGRÍCOLA', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3380, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGRÍCOLA SOSTENIBLE', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGRÍCOLA SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3381, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGROECOLÓGICA DE CULTIVOS', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGROECOLÓGICA DE CULTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3382, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGROPECUARIA', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3383, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN CAFETERA', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN CAFETERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3384, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN DE ALTA COSTURA', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN DE ALTA COSTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3385, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN DE GANADERÍA SOSTENIBLE', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN DE GANADERÍA SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3386, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN DE SONIDO EN VIVO Y AUDIOVISUAL', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN DE SONIDO EN VIVO Y AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3387, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN GRÁFICA', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN GRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3388, 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE APLICACIÓNES INFORMÁTICAS', 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE APLICACIÓNES INFORMÁTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3389, 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE SISTEMAS DE INFORMACIÓN', 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3390, 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE SOFTWARE', 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3391, 'TÉCNICO PROFESIÓNAL EN PROMOCIÓN DE PROYECTOS SOCIALES', 'TÉCNICO PROFESIÓNAL EN PROMOCIÓN DE PROYECTOS SOCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3392, 'TÉCNICO PROFESIÓNAL EN PROTECCIÓN Y SEGURIDAD A PERSONAS E INSTALACIÓNES', 'TÉCNICO PROFESIÓNAL EN PROTECCIÓN Y SEGURIDAD A PERSONAS E INSTALACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3393, 'TÉCNICO PROFESIÓNAL EN REDES ELÉCTRICAS DE DISTRIBUCIÓN DE ENERGÍA', 'TÉCNICO PROFESIÓNAL EN REDES ELÉCTRICAS DE DISTRIBUCIÓN DE ENERGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3394, 'TÉCNICO PROFESIÓNAL EN RELACIÓNAMIENTO DIGITAL CON CLIENTES ENFOQUE CRM', 'TÉCNICO PROFESIÓNAL EN RELACIÓNAMIENTO DIGITAL CON CLIENTES ENFOQUE CRM', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3395, 'TÉCNICO PROFESIÓNAL EN SANEAMIENTO AMBIENTAL', 'TÉCNICO PROFESIÓNAL EN SANEAMIENTO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3396, 'TÉCNICO PROFESIÓNAL EN SEGURIDAD Y SALUD EN EL TRABAJO', 'TÉCNICO PROFESIÓNAL EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3397, 'TÉCNICO PROFESIÓNAL EN SERVICIO DE POLICÍA', 'TÉCNICO PROFESIÓNAL EN SERVICIO DE POLICÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3398, 'TÉCNICO PROFESIÓNAL EN SERVICIOS A BORDO', 'TÉCNICO PROFESIÓNAL EN SERVICIOS A BORDO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3399, 'TÉCNICO PROFESIÓNAL EN SERVICIOS DE SEGURIDAD INFORMATICA', 'TÉCNICO PROFESIÓNAL EN SERVICIOS DE SEGURIDAD INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3400, 'TÉCNICO PROFESIÓNAL EN SERVICIOS TURÍSTICOS Y HOTELEROS', 'TÉCNICO PROFESIÓNAL EN SERVICIOS TURÍSTICOS Y HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3401, 'TÉCNICO PROFESIÓNAL EN TRÁNSITO, TRANSPORTE Y SEGURIDAD VIAL', 'TÉCNICO PROFESIÓNAL EN TRÁNSITO, TRANSPORTE Y SEGURIDAD VIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3402, 'TÉCNICO PROFESIÓNAL EN VENTAS Y NEGOCIOS', 'TÉCNICO PROFESIÓNAL EN VENTAS Y NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3403, 'TÉCNICO PROFESIÓNAL PROMOTORIA AMBIENTAL', 'TÉCNICO PROFESIÓNAL PROMOTORIA AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3404, 'TECNOLGÍA EN GESTIÓN INTEGRADA DE LA CALIDAD, MEDIO AMBIENTE, SEGURIDAD Y SALUD OCUPACIÓNAL', 'TECNOLGÍA EN GESTIÓN INTEGRADA DE LA CALIDAD, MEDIO AMBIENTE, SEGURIDAD Y SALUD OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3405, 'TECNOLOGÍA AGROAMBIENTAL', 'TECNOLOGÍA AGROAMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3406, 'TECNOLOGÍA AGROFORESTAL', 'TECNOLOGÍA AGROFORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3407, 'TECNOLOGÍA AGROINDUSTRIAL', 'TECNOLOGÍA AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3408, 'TECNOLOGÍA AGROPECUARIA', 'TECNOLOGÍA AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3409, 'TECNOLOGÍA BIOMÉDICA', 'TECNOLOGÍA BIOMÉDICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3410, 'TECNOLOGÍA COMERCIAL Y FINANCIERA', 'TECNOLOGÍA COMERCIAL Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3411, 'TECNOLOGÍA CONTABLE Y TRIBUTARIA', 'TECNOLOGÍA CONTABLE Y TRIBUTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3412, 'TECNOLOGÍA DE DISEÑO DE ELEMENTOS MECÁNICOS PARA SU FABRICACIÓN CON MÁQUINAS HERRAMIENTAS CNC', 'TECNOLOGÍA DE DISEÑO DE ELEMENTOS MECÁNICOS PARA SU FABRICACIÓN CON MÁQUINAS HERRAMIENTAS CNC', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3413, 'TECNOLOGÍA DE GESTIÓN ADMINISTRATIVA EN SERVICIOS DE SALUD', 'TECNOLOGÍA DE GESTIÓN ADMINISTRATIVA EN SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3414, 'TECNOLOGÍA DE GESTIÓN EN SISTEMAS INTEGRADOS', 'TECNOLOGÍA DE GESTIÓN EN SISTEMAS INTEGRADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3415, 'TECNOLOGÍA DE PROCESAMIENTO DE ALIMENTOS', 'TECNOLOGÍA DE PROCESAMIENTO DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3416, 'TECNOLOGÍA DE PROGRAMACIÓN DE SISTEMAS INFORMÁTICOS', 'TECNOLOGÍA DE PROGRAMACIÓN DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3417, 'TECNOLOGÍA DE TRANSFORMACIÓN DE PRODUCTOS AGROPECUARIOS', 'TECNOLOGÍA DE TRANSFORMACIÓN DE PRODUCTOS AGROPECUARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3418, 'TECNOLOGÍA ELECTRICA', 'TECNOLOGÍA ELECTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3419, 'TECNOLOGÍA ELÉCTRICA EN GENERACIÓN Y GESTIÓN EFICIENTE DE ENERGÍAS RENOVABLES', 'TECNOLOGÍA ELÉCTRICA EN GENERACIÓN Y GESTIÓN EFICIENTE DE ENERGÍAS RENOVABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3420, 'TECNOLOGÍA EMPRESARIAL', 'TECNOLOGÍA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3421, 'TECNOLOGÍA EN ACONDICIÓNAMIENTO FÍSICO Y ENTRENAMIENTO DEPORTIVO', 'TECNOLOGÍA EN ACONDICIÓNAMIENTO FÍSICO Y ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3422, 'TECNOLOGÍA EN ACTIVIDAD FÍSICA', 'TECNOLOGÍA EN ACTIVIDAD FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3423, 'TECNOLOGÍA EN ACTUACIÓN', 'TECNOLOGÍA EN ACTUACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3424, 'TECNOLOGÍA EN ACTUACIÓN Y ESCRITURA DE GUIONES PARA LAS PRACTICAS ESCÉNICAS TEATRALES', 'TECNOLOGÍA EN ACTUACIÓN Y ESCRITURA DE GUIONES PARA LAS PRACTICAS ESCÉNICAS TEATRALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3425, 'TECNOLOGÍA EN ACTUACIÓN Y PRESENTACIÓN PARA CINE Y TELEVISIÓN', 'TECNOLOGÍA EN ACTUACIÓN Y PRESENTACIÓN PARA CINE Y TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3426, 'TECNOLOGÍA EN ACUICULTURA', 'TECNOLOGÍA EN ACUICULTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3427, 'TECNOLOGÍA EN ACUICULTURA CONTINENTAL', 'TECNOLOGÍA EN ACUICULTURA CONTINENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3428, 'TECNOLOGÍA EN ADMINISTRACIÓN AGROPECUARIA', 'TECNOLOGÍA EN ADMINISTRACIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3429, 'TECNOLOGÍA EN ADMINISTRACIÓN BANCARIA', 'TECNOLOGÍA EN ADMINISTRACIÓN BANCARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3430, 'TECNOLOGÍA EN ADMINISTRACIÓN DE EMPRESAS', 'TECNOLOGÍA EN ADMINISTRACIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3431, 'TECNOLOGÍA EN ADMINISTRACIÓN DE LA PRODUCCIÓN ACUÍCOLA', 'TECNOLOGÍA EN ADMINISTRACIÓN DE LA PRODUCCIÓN ACUÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3432, 'TECNOLOGÍA EN ADMINISTRACIÓN DE REDES Y SEGURIDAD INFORMATICA', 'TECNOLOGÍA EN ADMINISTRACIÓN DE REDES Y SEGURIDAD INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3433, 'TECNOLOGÍA EN ADMINISTRACIÓN DE SERVICIOS DE SALUD', 'TECNOLOGÍA EN ADMINISTRACIÓN DE SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3434, 'TECNOLOGÍA EN ADMINISTRACIÓN DE SISTEMAS', 'TECNOLOGÍA EN ADMINISTRACIÓN DE SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3435, 'TECNOLOGÍA EN ADMINISTRACIÓN DE SISTEMAS DE INFORMACIÓN Y DOCUMENTACIÓN', 'TECNOLOGÍA EN ADMINISTRACIÓN DE SISTEMAS DE INFORMACIÓN Y DOCUMENTACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3436, 'TECNOLOGÍA EN ADMINISTRACIÓN DEL TALENTO HUMANO', 'TECNOLOGÍA EN ADMINISTRACIÓN DEL TALENTO HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3437, 'TECNOLOGÍA EN ADMINISTRACIÓN DEPORTIVA', 'TECNOLOGÍA EN ADMINISTRACIÓN DEPORTIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3438, 'TECNOLOGÍA EN ADMINISTRACIÓN FINANCIERA', 'TECNOLOGÍA EN ADMINISTRACIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3439, 'TECNOLOGÍA EN ADMINISTRACIÓN JUDICIAL', 'TECNOLOGÍA EN ADMINISTRACIÓN JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3440, 'TECNOLOGÍA EN ADMINISTRACIÓN PÚBLICA ESPECIAL PARA LOS TERRITORIOS ANCESTRALES INDÍGENAS', 'TECNOLOGÍA EN ADMINISTRACIÓN PÚBLICA ESPECIAL PARA LOS TERRITORIOS ANCESTRALES INDÍGENAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3441, 'TECNOLOGÍA EN ADMINISTRACIÓN TURÍSTICA Y DEL PATRIMONIO', 'TECNOLOGÍA EN ADMINISTRACIÓN TURÍSTICA Y DEL PATRIMONIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3442, 'TECNOLOGÍA EN ADMINISTRACIÓN Y EJECUCIÓN DE CONSTRUCCIÓNES', 'TECNOLOGÍA EN ADMINISTRACIÓN Y EJECUCIÓN DE CONSTRUCCIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3443, 'TECNOLOGÍA EN ADMINISTRACIÓN Y MERCADEO AGROPECUARIO', 'TECNOLOGÍA EN ADMINISTRACIÓN Y MERCADEO AGROPECUARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3444, 'TECNOLOGÍA EN AGRICULTURA DE PRECISIÓN', 'TECNOLOGÍA EN AGRICULTURA DE PRECISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3445, 'TECNOLOGÍA EN AGROBIOTECNOLOGÍA', 'TECNOLOGÍA EN AGROBIOTECNOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3446, 'TECNOLOGÍA EN AGROFORESTERIA', 'TECNOLOGÍA EN AGROFORESTERIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3447, 'TECNOLOGÍA EN AGROINDUSTRIA', 'TECNOLOGÍA EN AGROINDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3448, 'TECNOLOGÍA EN ALIMENTOS', 'TECNOLOGÍA EN ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3449, 'TECNOLOGÍA EN ANÁLISIS DE COSTOS Y PRESUPUESTOS', 'TECNOLOGÍA EN ANÁLISIS DE COSTOS Y PRESUPUESTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3450, 'TECNOLOGÍA EN ANÁLISIS DE MATERIALES PARA LA INDUSTRIA', 'TECNOLOGÍA EN ANÁLISIS DE MATERIALES PARA LA INDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3451, 'TECNOLOGÍA EN ANÁLISIS DE OPERACIÓNES ADUANERAS Y FINANCIERAS', 'TECNOLOGÍA EN ANÁLISIS DE OPERACIÓNES ADUANERAS Y FINANCIERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3452, 'TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SISTEMAS', 'TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3453, 'TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN', 'TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3454, 'TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SOFTWARE', 'TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3455, 'TECNOLOGÍA EN ANÁLISIS Y GESTIÓN DE DATOS', 'TECNOLOGÍA EN ANÁLISIS Y GESTIÓN DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3456, 'TECNOLOGÍA EN ANALÍTICA Y BIG DATA', 'TECNOLOGÍA EN ANALÍTICA Y BIG DATA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3457, 'TECNOLOGÍA EN ANIMACIÓN 3D', 'TECNOLOGÍA EN ANIMACIÓN 3D', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3458, 'TECNOLOGÍA EN ANIMACIÓN DIGITAL', 'TECNOLOGÍA EN ANIMACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3459, 'TECNOLOGÍA EN ANIMACIÓN PARA MEDIOS DIGITALES', 'TECNOLOGÍA EN ANIMACIÓN PARA MEDIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3460, 'TECNOLOGÍA EN ANIMACIÓN Y POSPRODUCCIÓN AUDIOVISUAL', 'TECNOLOGÍA EN ANIMACIÓN Y POSPRODUCCIÓN AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3461, 'TECNOLOGÍA EN ARTES MÚSICALES', 'TECNOLOGÍA EN ARTES MÚSICALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3462, 'TECNOLOGÍA EN ASEGURAMIENTO METROLOGICO INDUSTRIAL', 'TECNOLOGÍA EN ASEGURAMIENTO METROLOGICO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3463, 'TECNOLOGÍA EN ASISTENCIA GERENCIAL', 'TECNOLOGÍA EN ASISTENCIA GERENCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3464, 'TECNOLOGÍA EN ASUNTOS DE GOBIERNO Y EJECUCIÓN DE PROYECTOS', 'TECNOLOGÍA EN ASUNTOS DE GOBIERNO Y EJECUCIÓN DE PROYECTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3465, 'TECNOLOGÍA EN ATENCIÓN INTEGRAL A LA PRIMERA INFANCIA', 'TECNOLOGÍA EN ATENCIÓN INTEGRAL A LA PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3466, 'TECNOLOGÍA EN ATENCIÓN PREHOSPITALARIA', 'TECNOLOGÍA EN ATENCIÓN PREHOSPITALARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3467, 'TECNOLOGÍA EN AUDIO Y PRODUCCIÓN MÚSICAL', 'TECNOLOGÍA EN AUDIO Y PRODUCCIÓN MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3468, 'TECNOLOGÍA EN AUDITORÍA Y ASEGURAMIENTO DE LA INFORMACIÓN', 'TECNOLOGÍA EN AUDITORÍA Y ASEGURAMIENTO DE LA INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3469, 'TECNOLOGÍA EN AUDITORIA Y CONTROL DE INFORMATICA', 'TECNOLOGÍA EN AUDITORIA Y CONTROL DE INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3470, 'TECNOLOGÍA EN AUTOMATIZACIÓN DE SISTEMAS MECATRÓNICOS', 'TECNOLOGÍA EN AUTOMATIZACIÓN DE SISTEMAS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3471, 'TECNOLOGÍA EN AUTOMATIZACIÓN ELECTRÓNICA', 'TECNOLOGÍA EN AUTOMATIZACIÓN ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3472, 'TECNOLOGÍA EN AUTOMATIZACIÓN ELECTRÓNICA INDUSTRIAL', 'TECNOLOGÍA EN AUTOMATIZACIÓN ELECTRÓNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3473, 'TECNOLOGÍA EN AUTOMATIZACIÓN INDUSTRIAL', 'TECNOLOGÍA EN AUTOMATIZACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3474, 'TECNOLOGÍA EN AUTOMATIZACIÓN Y ROBOTICA INDUSTRIAL', 'TECNOLOGÍA EN AUTOMATIZACIÓN Y ROBOTICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3475, 'TECNOLOGÍA EN BIOCOMERCIO SOSTENIBLE', 'TECNOLOGÍA EN BIOCOMERCIO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3476, 'TECNOLOGÍA EN BIOTECNOLOGÍA ACUATICA', 'TECNOLOGÍA EN BIOTECNOLOGÍA ACUATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3477, 'TECNOLOGÍA EN BUCEO Y SALVAMENTO MARITIMO Y FLUVIAL', 'TECNOLOGÍA EN BUCEO Y SALVAMENTO MARITIMO Y FLUVIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3478, 'TECNOLOGÍA EN CALIDAD ALIMENTARIA', 'TECNOLOGÍA EN CALIDAD ALIMENTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3479, 'TECNOLOGÍA EN CARTOGRAFIA', 'TECNOLOGÍA EN CARTOGRAFIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3480, 'TECNOLOGÍA EN CITOHISTOLOGÍA', 'TECNOLOGÍA EN CITOHISTOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3481, 'TECNOLOGÍA EN COMERCIO EXTERIOR Y NEGOCIOS INTERNACIÓNALES', 'TECNOLOGÍA EN COMERCIO EXTERIOR Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3482, 'TECNOLOGÍA EN COMERCIO INTERNACIÓNAL', 'TECNOLOGÍA EN COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3483, 'TECNOLOGÍA EN COMERCIO Y NEGOCIOS INTERNACIÓNALES', 'TECNOLOGÍA EN COMERCIO Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3484, 'TECNOLOGÍA EN COMPUTACIÓN Y DESARROLLO DE SOFTWARE', 'TECNOLOGÍA EN COMPUTACIÓN Y DESARROLLO DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3485, 'TECNOLOGÍA EN COMUNICACIÓN COMERCIAL', 'TECNOLOGÍA EN COMUNICACIÓN COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3486, 'TECNOLOGÍA EN COMUNICACIÓN SOCIAL - PERIODISMO', 'TECNOLOGÍA EN COMUNICACIÓN SOCIAL - PERIODISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3487, 'TECNOLOGÍA EN COMUNICACIÓN SOCIAL MULTIMEDIAL', 'TECNOLOGÍA EN COMUNICACIÓN SOCIAL MULTIMEDIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3488, 'TECNOLOGÍA EN CONFECCIÓN INDUSTRIAL', 'TECNOLOGÍA EN CONFECCIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3489, 'TECNOLOGÍA EN CONSTRUCCIÓN DE ACABADOS ARQUITECTONICOS', 'TECNOLOGÍA EN CONSTRUCCIÓN DE ACABADOS ARQUITECTONICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3490, 'TECNOLOGÍA EN CONSTRUCCIÓN DE CIUDADANÍA', 'TECNOLOGÍA EN CONSTRUCCIÓN DE CIUDADANÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3491, 'TECNOLOGÍA EN CONSTRUCCIÓN DE EDIFICACIÓNES', 'TECNOLOGÍA EN CONSTRUCCIÓN DE EDIFICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3492, 'TECNOLOGÍA EN CONSTRUCCIÓN DE EDIFICACIÓNES E INFRAESTRUCTURA URBANA', 'TECNOLOGÍA EN CONSTRUCCIÓN DE EDIFICACIÓNES E INFRAESTRUCTURA URBANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3493, 'TECNOLOGÍA EN CONSTRUCCIÓN DE INFRAESTRUCTURA VIAL', 'TECNOLOGÍA EN CONSTRUCCIÓN DE INFRAESTRUCTURA VIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3494, 'TECNOLOGÍA EN CONSTRUCCIÓN DE OBRAS CIVILES', 'TECNOLOGÍA EN CONSTRUCCIÓN DE OBRAS CIVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3495, 'TECNOLOGÍA EN CONSTRUCCIÓN DE SOFTWARE', 'TECNOLOGÍA EN CONSTRUCCIÓN DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3496, 'TECNOLOGÍA EN CONSTRUCCIÓN EN EDIFICACIÓNES', 'TECNOLOGÍA EN CONSTRUCCIÓN EN EDIFICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3497, 'TECNOLOGÍA EN CONSTRUCCIÓN Y REPARACIÓN DE INSTRUMENTOS DE CUERDA FROTADA', 'TECNOLOGÍA EN CONSTRUCCIÓN Y REPARACIÓN DE INSTRUMENTOS DE CUERDA FROTADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3499, 'TECNOLOGÍA EN CONSTRUCCIÓNES SOLDADAS', 'TECNOLOGÍA EN CONSTRUCCIÓNES SOLDADAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3500, 'TECNOLOGÍA EN CONTABILIDAD', 'TECNOLOGÍA EN CONTABILIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3501, 'TECNOLOGÍA EN CONTABILIDAD FINANCIERA', 'TECNOLOGÍA EN CONTABILIDAD FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3502, 'TECNOLOGÍA EN CONTABILIDAD SISTEMATIZADA', 'TECNOLOGÍA EN CONTABILIDAD SISTEMATIZADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3503, 'TECNOLOGÍA EN CONTABILIDAD Y COSTOS', 'TECNOLOGÍA EN CONTABILIDAD Y COSTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3504, 'TECNOLOGÍA EN CONTABILIDAD Y FINANZAS', 'TECNOLOGÍA EN CONTABILIDAD Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3505, 'TECNOLOGÍA EN CONTABILIDAD Y TRIBUTARIA', 'TECNOLOGÍA EN CONTABILIDAD Y TRIBUTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3506, 'TECNOLOGÍA EN CONTROL AMBIENTAL', 'TECNOLOGÍA EN CONTROL AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3507, 'TECNOLOGÍA EN CONTROL DE BIOPROCESOS INDUSTRIALES', 'TECNOLOGÍA EN CONTROL DE BIOPROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3508, 'TECNOLOGÍA EN CONTROL DE CALIDAD', 'TECNOLOGÍA EN CONTROL DE CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3509, 'TECNOLOGÍA EN CONTROL DE CALIDAD DE ALIMENTOS', 'TECNOLOGÍA EN CONTROL DE CALIDAD DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3510, 'TECNOLOGÍA EN CONTROL DE CALIDAD EN LA INDUSTRIA DE ALIMENTOS', 'TECNOLOGÍA EN CONTROL DE CALIDAD EN LA INDUSTRIA DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3511, 'TECNOLOGÍA EN CONTROL DE LA CALIDAD', 'TECNOLOGÍA EN CONTROL DE LA CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3512, 'TECNOLOGÍA EN CONTROL DE PROCESOS INDUSTRIALES', 'TECNOLOGÍA EN CONTROL DE PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3513, 'TECNOLOGÍA EN CONTROL ELECTRÓNICO DE PROCESOS', 'TECNOLOGÍA EN CONTROL ELECTRÓNICO DE PROCESOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3514, 'TECNOLOGÍA EN CONTROL INTEGRADO DE LA CALIDAD, MEDIO AMBIENTE, SEGURIDAD Y SALUD OCUPACIÓNAL', 'TECNOLOGÍA EN CONTROL INTEGRADO DE LA CALIDAD, MEDIO AMBIENTE, SEGURIDAD Y SALUD OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3515, 'TECNOLOGÍA EN CONTROL Y AUTOMATIZACIÓN INDUSTRIAL', 'TECNOLOGÍA EN CONTROL Y AUTOMATIZACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3516, 'TECNOLOGÍA EN CONTROL Y GESTIÓN DE PROCESOS AGROINDUSTRIALES', 'TECNOLOGÍA EN CONTROL Y GESTIÓN DE PROCESOS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3517, 'TECNOLOGÍA EN COORDINACIÓN DE ESCUELAS DE MÚSICA', 'TECNOLOGÍA EN COORDINACIÓN DE ESCUELAS DE MÚSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3518, 'TECNOLOGÍA EN COORDINACIÓN DE PROCESOS LOGÍSTICOS', 'TECNOLOGÍA EN COORDINACIÓN DE PROCESOS LOGÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3519, 'TECNOLOGÍA EN COORDINACIÓN DE PROYECTOS CULTURALES', 'TECNOLOGÍA EN COORDINACIÓN DE PROYECTOS CULTURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3520, 'TECNOLOGÍA EN COORDINACIÓN DE SERVICIOS HOTELEROS', 'TECNOLOGÍA EN COORDINACIÓN DE SERVICIOS HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3521, 'TECNOLOGÍA EN COSTOS Y AUDITORIA', 'TECNOLOGÍA EN COSTOS Y AUDITORIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3522, 'TECNOLOGÍA EN CREACIÓN Y PRODUCCIÓN DE ESPACIOS COMERCIALES', 'TECNOLOGÍA EN CREACIÓN Y PRODUCCIÓN DE ESPACIOS COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3523, 'TECNOLOGÍA EN CREACIÓN Y PRODUCCIÓN DE MODA', 'TECNOLOGÍA EN CREACIÓN Y PRODUCCIÓN DE MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3524, 'TECNOLOGÍA EN CRIMINALÍSTICA', 'TECNOLOGÍA EN CRIMINALÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3525, 'TECNOLOGÍA EN CRIMINALÍSTICA E INVESTIGACIÓN JUDICIAL', 'TECNOLOGÍA EN CRIMINALÍSTICA E INVESTIGACIÓN JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3526, 'TECNOLOGÍA EN CRIMINALÍSTICA E INVESTIGACIÓN JUDICIAL (CICLO PROPEDÉUTICO)', 'TECNOLOGÍA EN CRIMINALÍSTICA E INVESTIGACIÓN JUDICIAL (CICLO PROPEDÉUTICO)', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3527, 'TECNOLOGÍA EN CRIMINOLOGÍA E INVESTIGACIÓN FORENSE', 'TECNOLOGÍA EN CRIMINOLOGÍA E INVESTIGACIÓN FORENSE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3528, 'TECNOLOGÍA EN DECORACIÓN DE ESPACIOS INTERIORES', 'TECNOLOGÍA EN DECORACIÓN DE ESPACIOS INTERIORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3529, 'TECNOLOGÍA EN DECORACIÓN DE INTERIORES', 'TECNOLOGÍA EN DECORACIÓN DE INTERIORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3530, 'TECNOLOGÍA EN DEFENSA AÉREA', 'TECNOLOGÍA EN DEFENSA AÉREA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3531, 'TECNOLOGÍA EN DELINEANTES DE ARQUITECTURA E INGENIERÍA', 'TECNOLOGÍA EN DELINEANTES DE ARQUITECTURA E INGENIERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3532, 'TECNOLOGÍA EN DEPORTE', 'TECNOLOGÍA EN DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3533, 'TECNOLOGÍA EN DESAROLLO AMBIENTAL', 'TECNOLOGÍA EN DESAROLLO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3534, 'TECNOLOGÍA EN DESARROLLO AMBIENTAL Y SOSTENIBLE', 'TECNOLOGÍA EN DESARROLLO AMBIENTAL Y SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3535, 'TECNOLOGÍA EN DESARROLLO COMUNITARIO', 'TECNOLOGÍA EN DESARROLLO COMUNITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3536, 'TECNOLOGÍA EN DESARROLLO CREATIVO DE PRODUCTOS PARA LA INDUSTRIA', 'TECNOLOGÍA EN DESARROLLO CREATIVO DE PRODUCTOS PARA LA INDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3537, 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES MÓVILES Y WEB', 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES MÓVILES Y WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3538, 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES PARA DISPOSITIVOS MÓVILES', 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES PARA DISPOSITIVOS MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3539, 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES WEB', 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3540, 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES WEB Y MÓVILES', 'TECNOLOGÍA EN DESARROLLO DE APLICACIÓNES WEB Y MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3541, 'TECNOLOGÍA EN DESARROLLO DE COLECCIÓNES DE CALZADO Y MARROQUINERÍA', 'TECNOLOGÍA EN DESARROLLO DE COLECCIÓNES DE CALZADO Y MARROQUINERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3542, 'TECNOLOGÍA EN DESARROLLO DE COLECCIÓNES PARA LA INDUSTRIA DE LA MODA', 'TECNOLOGÍA EN DESARROLLO DE COLECCIÓNES PARA LA INDUSTRIA DE LA MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3543, 'TECNOLOGÍA EN DESARROLLO DE COMPONENTES', 'TECNOLOGÍA EN DESARROLLO DE COMPONENTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3544, 'TECNOLOGÍA EN DESARROLLO DE COMPONENTES MECÁNICOS', 'TECNOLOGÍA EN DESARROLLO DE COMPONENTES MECÁNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3545, 'TECNOLOGÍA EN DESARROLLO DE LA PRODUCCIÓN GRÁFICA Y DIGITAL', 'TECNOLOGÍA EN DESARROLLO DE LA PRODUCCIÓN GRÁFICA Y DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3546, 'TECNOLOGÍA EN DESARROLLO DE MEDIOS GRÁFICOS VISUALES', 'TECNOLOGÍA EN DESARROLLO DE MEDIOS GRÁFICOS VISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3547, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS DE INFORMACIÓN', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3548, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS DE INFORMACIÓN Y DE SOFTWARE', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS DE INFORMACIÓN Y DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3549, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS DE INFORMACIÓN Y REDES', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS DE INFORMACIÓN Y REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3550, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS ELECTRÓNICOS', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS ELECTRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3551, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS ELECTRÓNICOS INDUSTRIALES', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS ELECTRÓNICOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3552, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS ELECTRÓNICOS Y DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS ELECTRÓNICOS Y DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3553, 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS INFORMÁTICOS', 'TECNOLOGÍA EN DESARROLLO DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3554, 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE', 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3555, 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE - MODALIDAD VIRTUAL', 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE - MODALIDAD VIRTUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3556, 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE PARA NEGOCIOS DIGITALES', 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE PARA NEGOCIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3557, 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE Y APLICATIVOS MÓVILES', 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE Y APLICATIVOS MÓVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3558, 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE Y GESTIÓN DE BASES DE DATOS', 'TECNOLOGÍA EN DESARROLLO DE SOFTWARE Y GESTIÓN DE BASES DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3559, 'TECNOLOGÍA EN DESARROLLO DE VIDEOJUEGOS', 'TECNOLOGÍA EN DESARROLLO DE VIDEOJUEGOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3560, 'TECNOLOGÍA EN DESARROLLO DE VIDEOJUEGOS Y ENTORNOS INTERACTIVOS', 'TECNOLOGÍA EN DESARROLLO DE VIDEOJUEGOS Y ENTORNOS INTERACTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3561, 'TECNOLOGÍA EN DESARROLLO DEL SOFTWARE', 'TECNOLOGÍA EN DESARROLLO DEL SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3562, 'TECNOLOGÍA EN DESARROLLO INFORMÁTICO', 'TECNOLOGÍA EN DESARROLLO INFORMÁTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3563, 'TECNOLOGÍA EN DESARROLLO PUBLICITARIO', 'TECNOLOGÍA EN DESARROLLO PUBLICITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3564, 'TECNOLOGÍA EN DESARROLLO Y ADAPTACIÓN DE PROTESIS Y ORTESIS', 'TECNOLOGÍA EN DESARROLLO Y ADAPTACIÓN DE PROTESIS Y ORTESIS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3565, 'TECNOLOGÍA EN DESARROLLO Y ADMINISTRACIÓN DE APLICACIÓNES INFORMÁTICAS', 'TECNOLOGÍA EN DESARROLLO Y ADMINISTRACIÓN DE APLICACIÓNES INFORMÁTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3566, 'TECNOLOGÍA EN DESARROLLO Y GESTIÓN DE SISTEMAS INFORMÁTICOS', 'TECNOLOGÍA EN DESARROLLO Y GESTIÓN DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3567, 'TECNOLOGÍA EN DESARROLLO Y MODELADO DE PRODUCTOS INDUSTRIALES', 'TECNOLOGÍA EN DESARROLLO Y MODELADO DE PRODUCTOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3568, 'TECNOLOGÍA EN DIBUJO ARQUITECTONICO Y DE INGENIERÍA', 'TECNOLOGÍA EN DIBUJO ARQUITECTONICO Y DE INGENIERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3569, 'TECNOLOGÍA EN DIBUJO Y MODELADO ARQUITECTÓNICO Y DE INGENIERÍA', 'TECNOLOGÍA EN DIBUJO Y MODELADO ARQUITECTÓNICO Y DE INGENIERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3570, 'TECNOLOGÍA EN DIGITALIZACIÓN DE MEDIOS', 'TECNOLOGÍA EN DIGITALIZACIÓN DE MEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3571, 'TECNOLOGÍA EN DIRECCIÓN COMERCIAL', 'TECNOLOGÍA EN DIRECCIÓN COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3572, 'TECNOLOGÍA EN DIRECCIÓN DE SERVICIOS TURÍSTICOS', 'TECNOLOGÍA EN DIRECCIÓN DE SERVICIOS TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3573, 'TECNOLOGÍA EN DIRECCIÓN DE VENTAS', 'TECNOLOGÍA EN DIRECCIÓN DE VENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3574, 'TECNOLOGÍA EN DIRECCIÓN TÉCNICA DE FÚTBOL', 'TECNOLOGÍA EN DIRECCIÓN TÉCNICA DE FÚTBOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3575, 'TECNOLOGÍA EN DIRECCIÓN Y GESTIÓN DE LA CADENA TURÍSTICA', 'TECNOLOGÍA EN DIRECCIÓN Y GESTIÓN DE LA CADENA TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3576, 'TECNOLOGÍA EN DISEÑO DE APLICACIÓNES MÓVILES Y WEB', 'TECNOLOGÍA EN DISEÑO DE APLICACIÓNES MÓVILES Y WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3577, 'TECNOLOGÍA EN DISEÑO DE COMPONENTES PARA CALZADO', 'TECNOLOGÍA EN DISEÑO DE COMPONENTES PARA CALZADO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3578, 'TECNOLOGÍA EN DISEÑO DE COMUNICACIÓN VISUAL', 'TECNOLOGÍA EN DISEÑO DE COMUNICACIÓN VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3579, 'TECNOLOGÍA EN DISEÑO DE ELEMENTOS MECÁNICOS PARA SU FABRICACIÓN CON MÁQUINAS CNC', 'TECNOLOGÍA EN DISEÑO DE ELEMENTOS MECÁNICOS PARA SU FABRICACIÓN CON MÁQUINAS CNC', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3580, 'TECNOLOGÍA EN DISEÑO DE MODAS', 'TECNOLOGÍA EN DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3581, 'TECNOLOGÍA EN DISEÑO DE MOLDES PARA TRANSFORMACIÓN DE MATERIALES PLASTICOS', 'TECNOLOGÍA EN DISEÑO DE MOLDES PARA TRANSFORMACIÓN DE MATERIALES PLASTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3582, 'TECNOLOGÍA EN DISEÑO E INTEGRACIÓN DE AUTOMATISMOS MECATRÓNICOS', 'TECNOLOGÍA EN DISEÑO E INTEGRACIÓN DE AUTOMATISMOS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3583, 'TECNOLOGÍA EN DISEÑO GRÁFICO', 'TECNOLOGÍA EN DISEÑO GRÁFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3584, 'TECNOLOGÍA EN DISEÑO GRÁFICO MULTIMEDIAL', 'TECNOLOGÍA EN DISEÑO GRÁFICO MULTIMEDIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3585, 'TECNOLOGÍA EN DISEÑO GRÁFICO PUBLICITARIO', 'TECNOLOGÍA EN DISEÑO GRÁFICO PUBLICITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3586, 'TECNOLOGÍA EN DISEÑO GRAFICO Y MULTIMEDIAL', 'TECNOLOGÍA EN DISEÑO GRAFICO Y MULTIMEDIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3587, 'TECNOLOGÍA EN DISEÑO INDUSTRIAL', 'TECNOLOGÍA EN DISEÑO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3588, 'TECNOLOGÍA EN DISEÑO Y DESAROLLO DE  SOFTWARE', 'TECNOLOGÍA EN DISEÑO Y DESAROLLO DE  SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3589, 'TECNOLOGÍA EN DISEÑO Y DESARROLLO DE SISTEMAS DE INFORMACIÓN', 'TECNOLOGÍA EN DISEÑO Y DESARROLLO DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3590, 'TECNOLOGÍA EN DISEÑO Y DESARROLLO WEB', 'TECNOLOGÍA EN DISEÑO Y DESARROLLO WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3591, 'TECNOLOGÍA EN DISEÑO Y PROGRAMACIÓN DE SOLUCIÓNES DE SOFTWARE COMO SERVICIO', 'TECNOLOGÍA EN DISEÑO Y PROGRAMACIÓN DE SOLUCIÓNES DE SOFTWARE COMO SERVICIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3592, 'TECNOLOGÍA EN DISTRIBUCIÓN FÍSICA INTERNACIÓNAL', 'TECNOLOGÍA EN DISTRIBUCIÓN FÍSICA INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3593, 'TECNOLOGÍA EN ECOLOGÍA Y MANEJO AMBIENTAL', 'TECNOLOGÍA EN ECOLOGÍA Y MANEJO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3594, 'TECNOLOGÍA EN EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTE', 'TECNOLOGÍA EN EDUCACIÓN FÍSICA, RECREACIÓN Y DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3595, 'TECNOLOGÍA EN ELECTRICIDAD DE MEDIA Y BAJA TENSIÓN', 'TECNOLOGÍA EN ELECTRICIDAD DE MEDIA Y BAJA TENSIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3596, 'TECNOLOGÍA EN ELECTRICIDAD INDUSTRIAL', 'TECNOLOGÍA EN ELECTRICIDAD INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3597, 'TECNOLOGÍA EN ELECTROMECÁNICA', 'TECNOLOGÍA EN ELECTROMECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3598, 'TECNOLOGÍA EN ELECTROMEDICINA', 'TECNOLOGÍA EN ELECTROMEDICINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3599, 'TECNOLOGÍA EN ELECTRÓNICA INDUSTRIAL', 'TECNOLOGÍA EN ELECTRÓNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3600, 'TECNOLOGÍA EN EN GESTIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', 'TECNOLOGÍA EN EN GESTIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3601, 'TECNOLOGÍA EN ENTRENAMIENTO DE FUTBOL PROFESIÓNAL', 'TECNOLOGÍA EN ENTRENAMIENTO DE FUTBOL PROFESIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3602, 'TECNOLOGÍA EN ENTRENAMIENTO DEPORTIVO', 'TECNOLOGÍA EN ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3603, 'TECNOLOGÍA EN ENTRENAMIENTO DEPORTIVO EN FÚTBOL', 'TECNOLOGÍA EN ENTRENAMIENTO DEPORTIVO EN FÚTBOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3604, 'TECNOLOGÍA EN ENTRENAMIENTO Y GESTIÓN MILITAR', 'TECNOLOGÍA EN ENTRENAMIENTO Y GESTIÓN MILITAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3605, 'TECNOLOGÍA EN ESTÉTICA Y COSMETOLOGÍA', 'TECNOLOGÍA EN ESTÉTICA Y COSMETOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3606, 'TECNOLOGÍA EN ESTUDIOS GEOTÉCNICOS', 'TECNOLOGÍA EN ESTUDIOS GEOTÉCNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3607, 'TECNOLOGÍA EN EXPRESIÓN GRÁFICA Y PÚBLICACIÓNES', 'TECNOLOGÍA EN EXPRESIÓN GRÁFICA Y PÚBLICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3608, 'TECNOLOGÍA EN FABRICACIÓN DE MOLDES Y TROQUELES', 'TECNOLOGÍA EN FABRICACIÓN DE MOLDES Y TROQUELES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3609, 'TECNOLOGÍA EN FABRICACIÓN DE PRODUCTOS PLASTICOS POR EXTRUSIÓN', 'TECNOLOGÍA EN FABRICACIÓN DE PRODUCTOS PLASTICOS POR EXTRUSIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3610, 'TECNOLOGÍA EN FINANZAS', 'TECNOLOGÍA EN FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3611, 'TECNOLOGÍA EN FINANZAS Y SISTEMAS CONTABLES', 'TECNOLOGÍA EN FINANZAS Y SISTEMAS CONTABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3612, 'TECNOLOGÍA EN FORMULACIÓN Y GESTIÓN DE PROYECTOS SOCIALES', 'TECNOLOGÍA EN FORMULACIÓN Y GESTIÓN DE PROYECTOS SOCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3613, 'TECNOLOGÍA EN FOTOGRAFÍA E IMAGEN DIGITAL', 'TECNOLOGÍA EN FOTOGRAFÍA E IMAGEN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3614, 'TECNOLOGÍA EN FOTOGRAFÍA Y PROCESOS DIGITALES', 'TECNOLOGÍA EN FOTOGRAFÍA Y PROCESOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3615, 'TECNOLOGÍA EN GASTRONOMÍA Y ARTE CULINARIO', 'TECNOLOGÍA EN GASTRONOMÍA Y ARTE CULINARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3616, 'TECNOLOGÍA EN GASTRONOMÍA Y COCINA', 'TECNOLOGÍA EN GASTRONOMÍA Y COCINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3617, 'TECNOLOGÍA EN GESTIÓN DE REDES Y SISTEMAS TELEINFORMÁTICOS', 'TECNOLOGÍA EN GESTIÓN DE REDES Y SISTEMAS TELEINFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3618, 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL', 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3619, 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA', 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3620, 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DE EMPRESAS DE SALUD', 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DE EMPRESAS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3621, 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DE LA SEGURIDAD SOCIAL', 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DE LA SEGURIDAD SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3622, 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DE SERVICIOS DE SALUD', 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DE SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3623, 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DEL SECTOR SALUD', 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA DEL SECTOR SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3624, 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN ADMINISTRATIVA Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3625, 'TECNOLOGÍA EN GESTIÓN AERONÁUTICA', 'TECNOLOGÍA EN GESTIÓN AERONÁUTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3626, 'TECNOLOGÍA EN GESTIÓN AEROPORTUARIA', 'TECNOLOGÍA EN GESTIÓN AEROPORTUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3627, 'TECNOLOGÍA EN GESTIÓN AGROEMPRESARIAL', 'TECNOLOGÍA EN GESTIÓN AGROEMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3628, 'TECNOLOGÍA EN GESTIÓN AGROFORESTAL', 'TECNOLOGÍA EN GESTIÓN AGROFORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3629, 'TECNOLOGÍA EN GESTIÓN AGROFORESTAL, POR CICLOS PROPEDÉUTICOS', 'TECNOLOGÍA EN GESTIÓN AGROFORESTAL, POR CICLOS PROPEDÉUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3630, 'TECNOLOGÍA EN GESTIÓN AGROINDUSTRIAL', 'TECNOLOGÍA EN GESTIÓN AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3631, 'TECNOLOGÍA EN GESTIÓN AGROPECUARIA', 'TECNOLOGÍA EN GESTIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3632, 'TECNOLOGÍA EN GESTIÓN AMBIENTAL', 'TECNOLOGÍA EN GESTIÓN AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3633, 'TECNOLOGÍA EN GESTIÓN AMBIENTAL INDUSTRIAL', 'TECNOLOGÍA EN GESTIÓN AMBIENTAL INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3634, 'TECNOLOGÍA EN GESTIÓN AMBIENTAL Y TURÍSTICA', 'TECNOLOGÍA EN GESTIÓN AMBIENTAL Y TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3635, 'TECNOLOGÍA EN GESTIÓN BANCARIA Y ENTIDADES FINANCIERAS', 'TECNOLOGÍA EN GESTIÓN BANCARIA Y ENTIDADES FINANCIERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3636, 'TECNOLOGÍA EN GESTIÓN BANCARIA Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN BANCARIA Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3637, 'TECNOLOGÍA EN GESTIÓN BIBLIOTECARIA', 'TECNOLOGÍA EN GESTIÓN BIBLIOTECARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3638, 'TECNOLOGÍA EN GESTIÓN CATASTRAL', 'TECNOLOGÍA EN GESTIÓN CATASTRAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3639, 'TECNOLOGÍA EN GESTIÓN COMERCIAL', 'TECNOLOGÍA EN GESTIÓN COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3640, 'TECNOLOGÍA EN GESTIÓN COMERCIAL AGROEMPRESARIAL', 'TECNOLOGÍA EN GESTIÓN COMERCIAL AGROEMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3641, 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3642, 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y PUBLICITARIA', 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4405, 'LOGÍSTICA EMPRESARIAL', 'LOGÍSTICA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3643, 'TECNOLOGÍA EN GESTIÓN COMUNICATIVA PARA LAS ORGANIZACIÓNES', 'TECNOLOGÍA EN GESTIÓN COMUNICATIVA PARA LAS ORGANIZACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3644, 'TECNOLOGÍA EN GESTIÓN COMUNICATIVA Y DE MERCADOS', 'TECNOLOGÍA EN GESTIÓN COMUNICATIVA Y DE MERCADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3645, 'TECNOLOGÍA EN GESTIÓN COMUNITARIA', 'TECNOLOGÍA EN GESTIÓN COMUNITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3646, 'TECNOLOGÍA EN GESTIÓN CONTABLE', 'TECNOLOGÍA EN GESTIÓN CONTABLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3647, 'TECNOLOGÍA EN GESTIÓN CONTABLE E INFORMACIÓN FINANCIERA', 'TECNOLOGÍA EN GESTIÓN CONTABLE E INFORMACIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3648, 'TECNOLOGÍA EN GESTIÓN CONTABLE FINANCIERA', 'TECNOLOGÍA EN GESTIÓN CONTABLE FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3649, 'TECNOLOGÍA EN GESTIÓN CONTABLE Y DE COSTOS', 'TECNOLOGÍA EN GESTIÓN CONTABLE Y DE COSTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3650, 'TECNOLOGÍA EN GESTIÓN CONTABLE Y DE INFORMACIÓN FINANCIERA', 'TECNOLOGÍA EN GESTIÓN CONTABLE Y DE INFORMACIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3651, 'TECNOLOGÍA EN GESTIÓN CONTABLE Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN CONTABLE Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3652, 'TECNOLOGÍA EN GESTIÓN CONTABLE Y TRIBUTARIA', 'TECNOLOGÍA EN GESTIÓN CONTABLE Y TRIBUTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3653, 'TECNOLOGÍA EN GESTIÓN CULTURAL Y ARTISTICA', 'TECNOLOGÍA EN GESTIÓN CULTURAL Y ARTISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3654, 'TECNOLOGÍA EN GESTIÓN DE AEROLÍNEAS Y AGENCIAS DE VIAJES', 'TECNOLOGÍA EN GESTIÓN DE AEROLÍNEAS Y AGENCIAS DE VIAJES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3655, 'TECNOLOGÍA EN GESTIÓN DE AGROINDUSTRIAS ALIMENTICIAS', 'TECNOLOGÍA EN GESTIÓN DE AGROINDUSTRIAS ALIMENTICIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3656, 'TECNOLOGÍA EN GESTIÓN DE BIONEGOCIOS', 'TECNOLOGÍA EN GESTIÓN DE BIONEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3657, 'TECNOLOGÍA EN GESTIÓN DE CALIDAD', 'TECNOLOGÍA EN GESTIÓN DE CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3658, 'TECNOLOGÍA EN GESTIÓN DE CENTROS DE SERVICIO', 'TECNOLOGÍA EN GESTIÓN DE CENTROS DE SERVICIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3659, 'TECNOLOGÍA EN GESTIÓN DE COMERCIO DIGITAL', 'TECNOLOGÍA EN GESTIÓN DE COMERCIO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3660, 'TECNOLOGÍA EN GESTIÓN DE COMERCIO EXTERIOR', 'TECNOLOGÍA EN GESTIÓN DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3661, 'TECNOLOGÍA EN GESTIÓN DE COMERCIO EXTERIOR DE BIENES Y SERVICIOS', 'TECNOLOGÍA EN GESTIÓN DE COMERCIO EXTERIOR DE BIENES Y SERVICIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3662, 'TECNOLOGÍA EN GESTIÓN DE COMERCIO INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN DE COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3663, 'TECNOLOGÍA EN GESTIÓN DE COMERCIO INTERNACIÓNAL Y FINANZAS', 'TECNOLOGÍA EN GESTIÓN DE COMERCIO INTERNACIÓNAL Y FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3664, 'TECNOLOGÍA EN GESTIÓN DE CONTENIDOS GRÁFICOS PUBLICITARIOS', 'TECNOLOGÍA EN GESTIÓN DE CONTENIDOS GRÁFICOS PUBLICITARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3665, 'TECNOLOGÍA EN GESTIÓN DE CONTENIDOS PARA LA INTERACCIÓN DIGITAL', 'TECNOLOGÍA EN GESTIÓN DE CONTENIDOS PARA LA INTERACCIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3666, 'TECNOLOGÍA EN GESTIÓN DE DERECHOS HUMANOS, PAZ Y RESOLUCIÓN DE CONFLICTOS', 'TECNOLOGÍA EN GESTIÓN DE DERECHOS HUMANOS, PAZ Y RESOLUCIÓN DE CONFLICTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3667, 'TECNOLOGÍA EN GESTIÓN DE DESTINOS TURÍSTICOS', 'TECNOLOGÍA EN GESTIÓN DE DESTINOS TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3668, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3669, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS AGROINDUSTRIALES', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3670, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS AGROPECUARIAS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS AGROPECUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3671, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS PECUARIAS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS PECUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3672, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS TURÍSTICAS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS TURÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3673, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS TURÍSTICAS Y HOTELERAS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS TURÍSTICAS Y HOTELERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3674, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS Y DESTINOS TURISTICOS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS Y DESTINOS TURISTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3675, 'TECNOLOGÍA EN GESTIÓN DE FABRICACIÓN MECÁNICA', 'TECNOLOGÍA EN GESTIÓN DE FABRICACIÓN MECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3676, 'TECNOLOGÍA EN GESTIÓN DE FACILIDADES PARA PRODUCCIÓN DE HIDROCARBUROS', 'TECNOLOGÍA EN GESTIÓN DE FACILIDADES PARA PRODUCCIÓN DE HIDROCARBUROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3677, 'TECNOLOGÍA EN GESTIÓN DE FINANZAS Y COMERCIO INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN DE FINANZAS Y COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3678, 'TECNOLOGÍA EN GESTIÓN DE IMPORTACIÓNES Y EXPORTACIÓNES', 'TECNOLOGÍA EN GESTIÓN DE IMPORTACIÓNES Y EXPORTACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3679, 'TECNOLOGÍA EN GESTIÓN DE INDUSTRIAS CREATIVAS', 'TECNOLOGÍA EN GESTIÓN DE INDUSTRIAS CREATIVAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3680, 'TECNOLOGÍA EN GESTIÓN DE INFORMACIÓN EN SALUD', 'TECNOLOGÍA EN GESTIÓN DE INFORMACIÓN EN SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3681, 'TECNOLOGÍA EN GESTIÓN DE INFRAESTRUCTURAS DE TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIÓNES', 'TECNOLOGÍA EN GESTIÓN DE INFRAESTRUCTURAS DE TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3682, 'TECNOLOGÍA EN GESTIÓN DE INSUMOS AGROPECUARIOS', 'TECNOLOGÍA EN GESTIÓN DE INSUMOS AGROPECUARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3683, 'TECNOLOGÍA EN GESTIÓN DE LA CALIDAD', 'TECNOLOGÍA EN GESTIÓN DE LA CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3684, 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN CORPORATIVA', 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN CORPORATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3685, 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN DIGITAL', 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3686, 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN EN MEDIOS', 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN EN MEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3687, 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN GRÁFICA', 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN GRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3688, 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN MULTIMEDIA', 'TECNOLOGÍA EN GESTIÓN DE LA COMUNICACIÓN MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3689, 'TECNOLOGÍA EN GESTIÓN DE LA CONSTRUCCIÓN', 'TECNOLOGÍA EN GESTIÓN DE LA CONSTRUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3690, 'TECNOLOGÍA EN GESTIÓN DE LA CONSTRUCCIÓN DE PROYECTOS ARQUITECTÓNICOS', 'TECNOLOGÍA EN GESTIÓN DE LA CONSTRUCCIÓN DE PROYECTOS ARQUITECTÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3691, 'TECNOLOGÍA EN GESTIÓN DE LA EMPRESA AGRÍCOLA', 'TECNOLOGÍA EN GESTIÓN DE LA EMPRESA AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3692, 'TECNOLOGÍA EN GESTIÓN DE LA EMPRESA CAFETERA', 'TECNOLOGÍA EN GESTIÓN DE LA EMPRESA CAFETERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3693, 'TECNOLOGÍA EN GESTIÓN DE LA MODA', 'TECNOLOGÍA EN GESTIÓN DE LA MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3694, 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN AGRÍCOLA', 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3695, 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN AGROFORESTAL', 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN AGROFORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3696, 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN INDUSTRIAL', 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3697, 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN Y LA CALIDAD', 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN Y LA CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3698, 'TECNOLOGÍA EN GESTIÓN DE LA PROPIEDAD HORIZONTAL', 'TECNOLOGÍA EN GESTIÓN DE LA PROPIEDAD HORIZONTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3699, 'TECNOLOGÍA EN GESTIÓN DE LA RECREACIÓN Y EL DEPORTE', 'TECNOLOGÍA EN GESTIÓN DE LA RECREACIÓN Y EL DEPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3700, 'TECNOLOGÍA EN GESTIÓN DE LA SEGURIDAD E HIGIENE LABORAL', 'TECNOLOGÍA EN GESTIÓN DE LA SEGURIDAD E HIGIENE LABORAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3701, 'TECNOLOGÍA EN GESTIÓN DE LA SEGURIDAD EN EL TRABAJO', 'TECNOLOGÍA EN GESTIÓN DE LA SEGURIDAD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3702, 'TECNOLOGÍA EN GESTIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', 'TECNOLOGÍA EN GESTIÓN DE LA SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3703, 'TECNOLOGÍA EN GESTIÓN DE LOGÍSTICA EMPRESARIAL', 'TECNOLOGÍA EN GESTIÓN DE LOGÍSTICA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3704, 'TECNOLOGÍA EN GESTIÓN DE LOGÍSTICA INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN DE LOGÍSTICA INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3705, 'TECNOLOGÍA EN GESTIÓN DE MANTENIMIENTO ELECTROMECÁNICO', 'TECNOLOGÍA EN GESTIÓN DE MANTENIMIENTO ELECTROMECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3706, 'TECNOLOGÍA EN GESTIÓN DE MARKETING', 'TECNOLOGÍA EN GESTIÓN DE MARKETING', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3707, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3708, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO DIGITAL', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3709, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3710, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y ESTRATEGIAS COMERCIALES', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y ESTRATEGIAS COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3711, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y NEGOCIOS INTERNACIÓNALES', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3712, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y PUBLICIDAD', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3713, 'TECNOLOGÍA EN GESTIÓN DE MERCADOS', 'TECNOLOGÍA EN GESTIÓN DE MERCADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3714, 'TECNOLOGÍA EN GESTIÓN DE MERCADOTECNIA', 'TECNOLOGÍA EN GESTIÓN DE MERCADOTECNIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3715, 'TECNOLOGÍA EN GESTIÓN DE MERCADOTECNIA Y PUBLICIDAD', 'TECNOLOGÍA EN GESTIÓN DE MERCADOTECNIA Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3716, 'TECNOLOGÍA EN GESTIÓN DE MICROFINANZAS', 'TECNOLOGÍA EN GESTIÓN DE MICROFINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3717, 'TECNOLOGÍA EN GESTIÓN DE NEGOCIOS', 'TECNOLOGÍA EN GESTIÓN DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3718, 'TECNOLOGÍA EN GESTIÓN DE NEGOCIOS FIDUCIARIOS', 'TECNOLOGÍA EN GESTIÓN DE NEGOCIOS FIDUCIARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3719, 'TECNOLOGÍA EN GESTIÓN DE NEGOCIOS INTERNACIÓNALES', 'TECNOLOGÍA EN GESTIÓN DE NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3720, 'TECNOLOGÍA EN GESTIÓN DE OPERACIÓNES EN TERMINALES PORTUARIAS', 'TECNOLOGÍA EN GESTIÓN DE OPERACIÓNES EN TERMINALES PORTUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3721, 'TECNOLOGÍA EN GESTIÓN DE OPERACIÓNES INDUSTRIALES', 'TECNOLOGÍA EN GESTIÓN DE OPERACIÓNES INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3722, 'TECNOLOGÍA EN GESTIÓN DE PLANTACIÓNES DE PALMA DE ACEITE', 'TECNOLOGÍA EN GESTIÓN DE PLANTACIÓNES DE PALMA DE ACEITE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3723, 'TECNOLOGÍA EN GESTIÓN DE PLANTACIÓNES FORESTALES', 'TECNOLOGÍA EN GESTIÓN DE PLANTACIÓNES FORESTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3724, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS AGROINDUSTRIALES', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3725, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS AUDIOVISUALES', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3726, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS DE PREPRENSA PARA MEDIOS', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS DE PREPRENSA PARA MEDIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3727, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS DE PRODUCCIÓN INDUSTRIAL', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS DE PRODUCCIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3728, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS INDUSTRIALES', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3729, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS LOGÍSTICOS', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS LOGÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3730, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS MECATRÓNICOS', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3731, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS PRODUCTIVOS Y ADMINISTRATIVOS', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS PRODUCTIVOS Y ADMINISTRATIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3732, 'TECNOLOGÍA EN GESTIÓN DE PROCESOS Y PRODUCCIÓN DE MOBILIARIO', 'TECNOLOGÍA EN GESTIÓN DE PROCESOS Y PRODUCCIÓN DE MOBILIARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3733, 'TECNOLOGÍA EN GESTIÓN DE PRODUCCIÓN Y TRANSFORMACIÓN DEL ACERO', 'TECNOLOGÍA EN GESTIÓN DE PRODUCCIÓN Y TRANSFORMACIÓN DEL ACERO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3734, 'TECNOLOGÍA EN GESTIÓN DE PRODUCTO', 'TECNOLOGÍA EN GESTIÓN DE PRODUCTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3735, 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS AGROECOLÓGICOS', 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS AGROECOLÓGICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3736, 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS DE DESARROLLO ECONÓMICO Y SOCIAL', 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS DE DESARROLLO ECONÓMICO Y SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3737, 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS SOCIALES Y COMUNITARIOS', 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS SOCIALES Y COMUNITARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3738, 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS URBANÍSTICOS', 'TECNOLOGÍA EN GESTIÓN DE PROYECTOS URBANÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3739, 'TECNOLOGÍA EN GESTIÓN DE PUBLICIDAD DIGITAL', 'TECNOLOGÍA EN GESTIÓN DE PUBLICIDAD DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3740, 'TECNOLOGÍA EN GESTIÓN DE PUBLICIDAD Y MEDIOS DIGITALES', 'TECNOLOGÍA EN GESTIÓN DE PUBLICIDAD Y MEDIOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3741, 'TECNOLOGÍA EN GESTIÓN DE RECUPERACIÓN MINERO AURÍFERA', 'TECNOLOGÍA EN GESTIÓN DE RECUPERACIÓN MINERO AURÍFERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3742, 'TECNOLOGÍA EN GESTIÓN DE RECURSOS AÉREOS', 'TECNOLOGÍA EN GESTIÓN DE RECURSOS AÉREOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3743, 'TECNOLOGÍA EN GESTIÓN DE RECURSOS EN PLANTAS DE PRODUCCIÓN', 'TECNOLOGÍA EN GESTIÓN DE RECURSOS EN PLANTAS DE PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3744, 'TECNOLOGÍA EN GESTIÓN DE RECURSOS ENERGÉTICOS', 'TECNOLOGÍA EN GESTIÓN DE RECURSOS ENERGÉTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3745, 'TECNOLOGÍA EN GESTIÓN DE RECURSOS HUMANOS', 'TECNOLOGÍA EN GESTIÓN DE RECURSOS HUMANOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3746, 'TECNOLOGÍA EN GESTIÓN DE RECURSOS MINERO ENERGÉTICOS', 'TECNOLOGÍA EN GESTIÓN DE RECURSOS MINERO ENERGÉTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3747, 'TECNOLOGÍA EN GESTIÓN DE RECURSOS NATURALES', 'TECNOLOGÍA EN GESTIÓN DE RECURSOS NATURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3748, 'TECNOLOGÍA EN GESTIÓN DE REDES', 'TECNOLOGÍA EN GESTIÓN DE REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3749, 'TECNOLOGÍA EN GESTIÓN DE REDES DE DATOS', 'TECNOLOGÍA EN GESTIÓN DE REDES DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3750, 'TECNOLOGÍA EN GESTIÓN DE REDES DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN GESTIÓN DE REDES DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3751, 'TECNOLOGÍA EN GESTIÓN DE REDES INALÁMBRICAS', 'TECNOLOGÍA EN GESTIÓN DE REDES INALÁMBRICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3752, 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD EN REDES DE COMPUTADORES', 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD EN REDES DE COMPUTADORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3753, 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD VIAL', 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD VIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3754, 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD Y SALUD EN EL TRABAJO', 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3755, 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD, SALUD EN EL TRABAJO Y MEDIO AMBIENTE', 'TECNOLOGÍA EN GESTIÓN DE SEGURIDAD, SALUD EN EL TRABAJO Y MEDIO AMBIENTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3756, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS DE BIENESTAR TURÍSTICOS Y HOTELEROS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS DE BIENESTAR TURÍSTICOS Y HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3757, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS FINANCIEROS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3758, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS GASTRONÓMICOS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS GASTRONÓMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3759, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS HOTELEROS Y TURÍSTICOS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS HOTELEROS Y TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3760, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS PARA AEROLÍNEAS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS PARA AEROLÍNEAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3761, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS PÚBLICOS DOMICILIARIOS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS PÚBLICOS DOMICILIARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3762, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS RECREATIVOS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS RECREATIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3763, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS TURÍSTICOS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3764, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS TURÍSTICOS Y HOTELEROS', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS TURÍSTICOS Y HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3765, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3766, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE INFORMACIÓN DOCUMENTALY ARCHIVÍSTICA', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE INFORMACIÓN DOCUMENTALY ARCHIVÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3767, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE INFORMACIÓN Y REDES DE COMPUTO', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE INFORMACIÓN Y REDES DE COMPUTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3768, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS INFORMÁTICOS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3769, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS INTEGRADOS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS INTEGRADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3770, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS LOGÍSTICOS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS LOGÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3771, 'TECNOLOGÍA EN GESTIÓN DE SOFTWARE Y REDES', 'TECNOLOGÍA EN GESTIÓN DE SOFTWARE Y REDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3772, 'TECNOLOGÍA EN GESTIÓN DE TESORERÍA Y RECURSOS FINANCIEROS', 'TECNOLOGÍA EN GESTIÓN DE TESORERÍA Y RECURSOS FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3773, 'TECNOLOGÍA EN GESTIÓN DE TIC', 'TECNOLOGÍA EN GESTIÓN DE TIC', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3774, 'TECNOLOGÍA EN GESTIÓN DE TURISMO Y HOTELES', 'TECNOLOGÍA EN GESTIÓN DE TURISMO Y HOTELES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3775, 'TECNOLOGÍA EN GESTIÓN DE VENTAS Y NEGOCIOS', 'TECNOLOGÍA EN GESTIÓN DE VENTAS Y NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3776, 'TECNOLOGÍA EN GESTIÓN DEL CAPITAL HUMANO', 'TECNOLOGÍA EN GESTIÓN DEL CAPITAL HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3777, 'TECNOLOGÍA EN GESTIÓN DEL COMERCIO EXTERIOR', 'TECNOLOGÍA EN GESTIÓN DEL COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3778, 'TECNOLOGÍA EN GESTIÓN DEL COMERCIO INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN DEL COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3779, 'TECNOLOGÍA EN GESTIÓN DEL DISEÑO GRÁFICO', 'TECNOLOGÍA EN GESTIÓN DEL DISEÑO GRÁFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3780, 'TECNOLOGÍA EN GESTIÓN DEL DISEÑO TEXTIL Y DE MODAS', 'TECNOLOGÍA EN GESTIÓN DEL DISEÑO TEXTIL Y DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3781, 'TECNOLOGÍA EN GESTIÓN DEL ECOTURISMO', 'TECNOLOGÍA EN GESTIÓN DEL ECOTURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3782, 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO DE AUTOMOTORES', 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO DE AUTOMOTORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3783, 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO DE MAQUINARIA PESADA', 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO DE MAQUINARIA PESADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3784, 'TECNOLOGÍA EN GESTIÓN DEL TALENTO HUMANO', 'TECNOLOGÍA EN GESTIÓN DEL TALENTO HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3785, 'TECNOLOGÍA EN GESTIÓN DEL TERRITORIO Y ORGANIZACIÓNES', 'TECNOLOGÍA EN GESTIÓN DEL TERRITORIO Y ORGANIZACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3786, 'TECNOLOGÍA EN GESTIÓN DEL TURISMO CULTURAL Y DE NATURALEZA', 'TECNOLOGÍA EN GESTIÓN DEL TURISMO CULTURAL Y DE NATURALEZA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3787, 'TECNOLOGÍA EN GESTIÓN DEL TURISMO SOSTENIBLE', 'TECNOLOGÍA EN GESTIÓN DEL TURISMO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3788, 'TECNOLOGÍA EN GESTIÓN DEPORTIVA', 'TECNOLOGÍA EN GESTIÓN DEPORTIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3789, 'TECNOLOGÍA EN GESTIÓN DOCUMENTAL', 'TECNOLOGÍA EN GESTIÓN DOCUMENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3790, 'TECNOLOGÍA EN GESTIÓN EFICIENTE DE LA ENERGÍA', 'TECNOLOGÍA EN GESTIÓN EFICIENTE DE LA ENERGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3791, 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL', 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3792, 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL COMUNITARIA', 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL COMUNITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3793, 'TECNOLOGÍA EN GESTIÓN EN DISEÑO DE MODA', 'TECNOLOGÍA EN GESTIÓN EN DISEÑO DE MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3794, 'TECNOLOGÍA EN GESTIÓN EN SALUD OCUPACIÓNAL', 'TECNOLOGÍA EN GESTIÓN EN SALUD OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3795, 'TECNOLOGÍA EN GESTIÓN FINANCIERA', 'TECNOLOGÍA EN GESTIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3796, 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y CONTABLE', 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y CONTABLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3797, 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y DE RECURSOS DE LA SALUD', 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y DE RECURSOS DE LA SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3798, 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y DE TESORERÍA', 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y DE TESORERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3799, 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y TRIBUTARIA', 'TECNOLOGÍA EN GESTIÓN FINANCIERA Y TRIBUTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3800, 'TECNOLOGÍA EN GESTIÓN GASTRONÓMICA', 'TECNOLOGÍA EN GESTIÓN GASTRONÓMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3801, 'TECNOLOGÍA EN GESTIÓN GASTRONÓMICA Y DE BEBIDAS', 'TECNOLOGÍA EN GESTIÓN GASTRONÓMICA Y DE BEBIDAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3802, 'TECNOLOGÍA EN GESTIÓN GASTRONÓMICA Y SOMMELIER', 'TECNOLOGÍA EN GESTIÓN GASTRONÓMICA Y SOMMELIER', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3803, 'TECNOLOGÍA EN GESTIÓN GRÁFICA MULTIMEDIAL', 'TECNOLOGÍA EN GESTIÓN GRÁFICA MULTIMEDIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3804, 'TECNOLOGÍA EN GESTIÓN HOTELERA', 'TECNOLOGÍA EN GESTIÓN HOTELERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3805, 'TECNOLOGÍA EN GESTIÓN HOTELERA Y DE SERVICIOS', 'TECNOLOGÍA EN GESTIÓN HOTELERA Y DE SERVICIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3806, 'TECNOLOGÍA EN GESTIÓN HOTELERA Y TURÍSTICA', 'TECNOLOGÍA EN GESTIÓN HOTELERA Y TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3807, 'TECNOLOGÍA EN GESTIÓN HUMANA', 'TECNOLOGÍA EN GESTIÓN HUMANA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3808, 'TECNOLOGÍA EN GESTIÓN INDUSTRIAL', 'TECNOLOGÍA EN GESTIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3809, 'TECNOLOGÍA EN GESTIÓN INFORMÁTICA', 'TECNOLOGÍA EN GESTIÓN INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3810, 'TECNOLOGÍA EN GESTIÓN INTEGRADA DE LA CALIDAD, MEDIO AMBIENTE, SEGURIDAD Y SALUD OCUPACIÓNAL', 'TECNOLOGÍA EN GESTIÓN INTEGRADA DE LA CALIDAD, MEDIO AMBIENTE, SEGURIDAD Y SALUD OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3811, 'TECNOLOGÍA EN GESTIÓN INTEGRAL DE LA CALIDAD Y SEGURIDAD INDUSTRIAL', 'TECNOLOGÍA EN GESTIÓN INTEGRAL DE LA CALIDAD Y SEGURIDAD INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3812, 'TECNOLOGÍA EN GESTIÓN INTEGRAL DEL TRANSPORTE', 'TECNOLOGÍA EN GESTIÓN INTEGRAL DEL TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3813, 'TECNOLOGÍA EN GESTIÓN INTERNACIÓNAL DEL COMERCIO', 'TECNOLOGÍA EN GESTIÓN INTERNACIÓNAL DEL COMERCIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3814, 'TECNOLOGÍA EN GESTIÓN JUDICIAL Y CRIMINALÍSTICA', 'TECNOLOGÍA EN GESTIÓN JUDICIAL Y CRIMINALÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3815, 'TECNOLOGÍA EN GESTIÓN JURÍDICA DE LA INFORMACIÓN', 'TECNOLOGÍA EN GESTIÓN JURÍDICA DE LA INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3816, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3817, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA EMPRESARIAL', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3818, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA INTEGRAL', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA INTEGRAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3819, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3820, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA NACIÓNAL E INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA NACIÓNAL E INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3821, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA PORTUARIA Y ADUANERA', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA PORTUARIA Y ADUANERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3822, 'TECNOLOGÍA EN GESTIÓN MINERA', 'TECNOLOGÍA EN GESTIÓN MINERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3823, 'TECNOLOGÍA EN GESTIÓN MINERO AMBIENTAL', 'TECNOLOGÍA EN GESTIÓN MINERO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3824, 'TECNOLOGÍA EN GESTIÓN NAVIERA Y PORTUARIA', 'TECNOLOGÍA EN GESTIÓN NAVIERA Y PORTUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3825, 'TECNOLOGÍA EN GESTIÓN PARA ESTABLECIMIENTOS DE ALIMENTOS Y BEBIDAS', 'TECNOLOGÍA EN GESTIÓN PARA ESTABLECIMIENTOS DE ALIMENTOS Y BEBIDAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3826, 'TECNOLOGÍA EN GESTIÓN PARA PROYECTOS WEB', 'TECNOLOGÍA EN GESTIÓN PARA PROYECTOS WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3827, 'TECNOLOGÍA EN GESTIÓN PARA SUMINISTRO DE GAS COMBUSTIBLE', 'TECNOLOGÍA EN GESTIÓN PARA SUMINISTRO DE GAS COMBUSTIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3828, 'TECNOLOGÍA EN GESTIÓN PORTUARIA', 'TECNOLOGÍA EN GESTIÓN PORTUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3829, 'TECNOLOGÍA EN GESTIÓN PÚBLICA', 'TECNOLOGÍA EN GESTIÓN PÚBLICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3830, 'TECNOLOGÍA EN GESTIÓN PÚBLICA TERRITORIAL', 'TECNOLOGÍA EN GESTIÓN PÚBLICA TERRITORIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3831, 'TECNOLOGÍA EN GESTIÓN SOSTENIBLE DE LA PRODUCCIÓN AGROPECUARIA', 'TECNOLOGÍA EN GESTIÓN SOSTENIBLE DE LA PRODUCCIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3832, 'TECNOLOGÍA EN GESTIÓN TRIBUTARIA Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN TRIBUTARIA Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3833, 'TECNOLOGÍA EN GESTIÓN TURÍSTICA', 'TECNOLOGÍA EN GESTIÓN TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3834, 'TECNOLOGÍA EN GESTIÓN TURÍSTICA Y DESARROLLO LOCAL', 'TECNOLOGÍA EN GESTIÓN TURÍSTICA Y DESARROLLO LOCAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3835, 'TECNOLOGÍA EN GESTIÓN TURÍSTICA Y HOTELERA', 'TECNOLOGÍA EN GESTIÓN TURÍSTICA Y HOTELERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3836, 'TECNOLOGÍA EN GESTIÓN Y AUDITORIA ADMINISTRATIVA', 'TECNOLOGÍA EN GESTIÓN Y AUDITORIA ADMINISTRATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3837, 'TECNOLOGÍA EN GESTIÓN Y CONSTRUCCIÓN DE OBRAS CIVILES', 'TECNOLOGÍA EN GESTIÓN Y CONSTRUCCIÓN DE OBRAS CIVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3838, 'TECNOLOGÍA EN GESTIÓN Y EJECUCIÓN INSTRUMENTAL PARA LAS PRÁCTICAS MÚSICALES', 'TECNOLOGÍA EN GESTIÓN Y EJECUCIÓN INSTRUMENTAL PARA LAS PRÁCTICAS MÚSICALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3839, 'TECNOLOGÍA EN GESTIÓN Y PRODUCCIÓN HORTÍCOLA', 'TECNOLOGÍA EN GESTIÓN Y PRODUCCIÓN HORTÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3840, 'TECNOLOGÍA EN GESTIÓN Y REALIZACIÓN DE CONTENIDOS AUDIOVISUALES', 'TECNOLOGÍA EN GESTIÓN Y REALIZACIÓN DE CONTENIDOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3841, 'TECNOLOGÍA EN GUIANZA TURÍSTICA', 'TECNOLOGÍA EN GUIANZA TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3842, 'TECNOLOGÍA EN HIGIENE Y SEGURIDAD EN EL TRABAJO', 'TECNOLOGÍA EN HIGIENE Y SEGURIDAD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3843, 'TECNOLOGÍA EN HIGIENE Y SEGURIDAD INDUSTRIAL', 'TECNOLOGÍA EN HIGIENE Y SEGURIDAD INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3844, 'TECNOLOGÍA EN HISTOCITOTECNOLOGÍA', 'TECNOLOGÍA EN HISTOCITOTECNOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3845, 'TECNOLOGÍA EN ILUSTRACIÓN PARA PRODUCTOS EDITORIALES MULTIMEDIALES', 'TECNOLOGÍA EN ILUSTRACIÓN PARA PRODUCTOS EDITORIALES MULTIMEDIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3846, 'TECNOLOGÍA EN IMÁGENES DIAGNÓSTICAS', 'TECNOLOGÍA EN IMÁGENES DIAGNÓSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3847, 'TECNOLOGÍA EN IMPLEMENTACIÓN DE INFRAESTRUCTURA DE TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIÓNES', 'TECNOLOGÍA EN IMPLEMENTACIÓN DE INFRAESTRUCTURA DE TECNOLOGÍAS DE LA INFORMACIÓN Y LAS COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3848, 'TECNOLOGÍA EN IMPLEMENTACIÓN DE REDES Y SERVICIOS DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN IMPLEMENTACIÓN DE REDES Y SERVICIOS DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3849, 'TECNOLOGÍA EN IMPLEMENTACIÓN DE SISTEMAS ELECTRÓNICOS INDUSTRIALES', 'TECNOLOGÍA EN IMPLEMENTACIÓN DE SISTEMAS ELECTRÓNICOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3850, 'TECNOLOGÍA EN INFORMATICA', 'TECNOLOGÍA EN INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3851, 'TECNOLOGÍA EN INFORMÁTICA FORENSE', 'TECNOLOGÍA EN INFORMÁTICA FORENSE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3852, 'TECNOLOGÍA EN INFORMATICA MÚSICAL', 'TECNOLOGÍA EN INFORMATICA MÚSICAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3853, 'TECNOLOGÍA EN INSPECCIÓN DE PROCESOS DE SOLDADURA', 'TECNOLOGÍA EN INSPECCIÓN DE PROCESOS DE SOLDADURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3854, 'TECNOLOGÍA EN INSTRUMENTACIÓN INDUSTRIAL', 'TECNOLOGÍA EN INSTRUMENTACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3855, 'TECNOLOGÍA EN INSTRUMENTACIÓN Y CONTROL DE PROCESOS INDUSTRIALES', 'TECNOLOGÍA EN INSTRUMENTACIÓN Y CONTROL DE PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3856, 'TECNOLOGÍA EN INTELIGENCIA AEREA', 'TECNOLOGÍA EN INTELIGENCIA AEREA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3857, 'TECNOLOGÍA EN INTERIORISMO SOSTENIBLE', 'TECNOLOGÍA EN INTERIORISMO SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3858, 'TECNOLOGÍA EN INTERIORISMO Y DECORACIÓN DE ESPACIOS', 'TECNOLOGÍA EN INTERIORISMO Y DECORACIÓN DE ESPACIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3859, 'TECNOLOGÍA EN INTERPRETACIÓN Y TRADUCCIÓN EN LENGUA DE SEÑAS COLOMBIANAS (LSC) - ESPAÑOL', 'TECNOLOGÍA EN INTERPRETACIÓN Y TRADUCCIÓN EN LENGUA DE SEÑAS COLOMBIANAS (LSC) - ESPAÑOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3860, 'TECNOLOGÍA EN INTERVENCIÓN DE ESPACIOS Y AMBIENTES', 'TECNOLOGÍA EN INTERVENCIÓN DE ESPACIOS Y AMBIENTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3861, 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL', 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3862, 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL Y CIENCIAS FORENSES', 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL Y CIENCIAS FORENSES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3863, 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL Y CRIMINALÍSTICA', 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL Y CRIMINALÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3864, 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL Y JUDICIAL', 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINAL Y JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3865, 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINALÍSTICA Y JUDICIAL', 'TECNOLOGÍA EN INVESTIGACIÓN CRIMINALÍSTICA Y JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3866, 'TECNOLOGÍA EN INVESTIGACIÓN DE ACCIDENTES DE TRÁNSITO', 'TECNOLOGÍA EN INVESTIGACIÓN DE ACCIDENTES DE TRÁNSITO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3867, 'TECNOLOGÍA EN INVESTIGACIÓN JUDICIAL', 'TECNOLOGÍA EN INVESTIGACIÓN JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3868, 'TECNOLOGÍA EN LABORATORIO DE PROTESIS DENTAL', 'TECNOLOGÍA EN LABORATORIO DE PROTESIS DENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3869, 'TECNOLOGÍA EN LABORATORIO DENTAL', 'TECNOLOGÍA EN LABORATORIO DENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3870, 'TECNOLOGÍA EN LEVANTAMIENTOS TOPOGRÁFICOS', 'TECNOLOGÍA EN LEVANTAMIENTOS TOPOGRÁFICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3871, 'TECNOLOGÍA EN LEVANTAMIENTOS TOPOGRÁFICOS E INFORMACIÓN GEOGRÁFICA', 'TECNOLOGÍA EN LEVANTAMIENTOS TOPOGRÁFICOS E INFORMACIÓN GEOGRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3872, 'TECNOLOGÍA EN LEVANTAMIENTOS TOPOGRÁFICOS Y GEORREFERENCIACIÓN', 'TECNOLOGÍA EN LEVANTAMIENTOS TOPOGRÁFICOS Y GEORREFERENCIACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3873, 'TECNOLOGÍA EN LOCUCIÓN Y PRODUCCIÓN RADIAL', 'TECNOLOGÍA EN LOCUCIÓN Y PRODUCCIÓN RADIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3874, 'TECNOLOGÍA EN LOGÍSTICA', 'TECNOLOGÍA EN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3875, 'TECNOLOGÍA EN LOGÍSTICA DE ALMACENAJE E INVENTARIOS', 'TECNOLOGÍA EN LOGÍSTICA DE ALMACENAJE E INVENTARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3876, 'TECNOLOGÍA EN LOGÍSTICA DEL COMERCIO EXTERIOR', 'TECNOLOGÍA EN LOGÍSTICA DEL COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3877, 'TECNOLOGÍA EN LOGÍSTICA DEL TRANSPORTE MULTIMODAL', 'TECNOLOGÍA EN LOGÍSTICA DEL TRANSPORTE MULTIMODAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3878, 'TECNOLOGÍA EN LOGÍSTICA EMPRESARIAL', 'TECNOLOGÍA EN LOGÍSTICA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3879, 'TECNOLOGÍA EN LOGÍSTICA INDUSTRIAL', 'TECNOLOGÍA EN LOGÍSTICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3880, 'TECNOLOGÍA EN LOGÍSTICA INTERNACIÓNAL', 'TECNOLOGÍA EN LOGÍSTICA INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3881, 'TECNOLOGÍA EN LOGÍSTICA MILITAR', 'TECNOLOGÍA EN LOGÍSTICA MILITAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3882, 'TECNOLOGÍA EN LOGÍSTICA Y MERCADEO INTERNACIÓNAL', 'TECNOLOGÍA EN LOGÍSTICA Y MERCADEO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3883, 'TECNOLOGÍA EN MANEJO DE FUENTES ABIERTAS DE USO DIAGNÓSTICO Y TERAPÉUTICO', 'TECNOLOGÍA EN MANEJO DE FUENTES ABIERTAS DE USO DIAGNÓSTICO Y TERAPÉUTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3884, 'TECNOLOGÍA EN MANEJO DE LA INFORMACIÓN CONTABLE', 'TECNOLOGÍA EN MANEJO DE LA INFORMACIÓN CONTABLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3885, 'TECNOLOGÍA EN MANEJO DE RECURSOS AMBIENTALES', 'TECNOLOGÍA EN MANEJO DE RECURSOS AMBIENTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3886, 'TECNOLOGÍA EN MANEJO DE SISTEMAS DE AGROBOSQUES POR CICLO PROPEDEUTICO', 'TECNOLOGÍA EN MANEJO DE SISTEMAS DE AGROBOSQUES POR CICLO PROPEDEUTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3887, 'TECNOLOGÍA EN MANEJO Y APROVECHAMIENTO FORESTAL', 'TECNOLOGÍA EN MANEJO Y APROVECHAMIENTO FORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3888, 'TECNOLOGÍA EN MANEJO Y COMERCIALIZACIÓN AGROFORESTAL', 'TECNOLOGÍA EN MANEJO Y COMERCIALIZACIÓN AGROFORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3889, 'TECNOLOGÍA EN MANEJO Y CONSERVACIÓN DE SUELOS Y AGUAS', 'TECNOLOGÍA EN MANEJO Y CONSERVACIÓN DE SUELOS Y AGUAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3890, 'TECNOLOGÍA EN MANTENIMIENTO AERONÁUTICO', 'TECNOLOGÍA EN MANTENIMIENTO AERONÁUTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3891, 'TECNOLOGÍA EN MANTENIMIENTO DE AVIONES', 'TECNOLOGÍA EN MANTENIMIENTO DE AVIONES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3892, 'TECNOLOGÍA EN MANTENIMIENTO DE EQUIPO BIOMÉDICO', 'TECNOLOGÍA EN MANTENIMIENTO DE EQUIPO BIOMÉDICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3893, 'TECNOLOGÍA EN MANTENIMIENTO DE EQUIPO PORTUARIO Y DEL TRANSPORTE', 'TECNOLOGÍA EN MANTENIMIENTO DE EQUIPO PORTUARIO Y DEL TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3894, 'TECNOLOGÍA EN MANTENIMIENTO DE EQUIPOS BIOMÉDICOS', 'TECNOLOGÍA EN MANTENIMIENTO DE EQUIPOS BIOMÉDICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3895, 'TECNOLOGÍA EN MANTENIMIENTO DE MAQUINAS Y HERRAMIENTAS ASOCIADAS A MINERÍA', 'TECNOLOGÍA EN MANTENIMIENTO DE MAQUINAS Y HERRAMIENTAS ASOCIADAS A MINERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3896, 'TECNOLOGÍA EN MANTENIMIENTO ELÉCTRICO', 'TECNOLOGÍA EN MANTENIMIENTO ELÉCTRICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3897, 'TECNOLOGÍA EN MANTENIMIENTO ELECTROMECÁNICO DE EQUIPOS INDUSTRIALES', 'TECNOLOGÍA EN MANTENIMIENTO ELECTROMECÁNICO DE EQUIPOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3898, 'TECNOLOGÍA EN MANTENIMIENTO ELECTROMECÁNICO INDUSTRIAL', 'TECNOLOGÍA EN MANTENIMIENTO ELECTROMECÁNICO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3899, 'TECNOLOGÍA EN MANTENIMIENTO ELECTRÓNICO', 'TECNOLOGÍA EN MANTENIMIENTO ELECTRÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3900, 'TECNOLOGÍA EN MANTENIMIENTO ELECTRÓNICO E INSTRUMENTAL INDUSTRIAL', 'TECNOLOGÍA EN MANTENIMIENTO ELECTRÓNICO E INSTRUMENTAL INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3901, 'TECNOLOGÍA EN MANTENIMIENTO EN LINEA DE AVIONES', 'TECNOLOGÍA EN MANTENIMIENTO EN LINEA DE AVIONES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3902, 'TECNOLOGÍA EN MANTENIMIENTO EN LINEA DE HELICOPTEROS', 'TECNOLOGÍA EN MANTENIMIENTO EN LINEA DE HELICOPTEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3903, 'TECNOLOGÍA EN MANTENIMIENTO EN SISTEMAS ELÉCTRICOS ELECTRÓNICOS E INSTRUMENTOS DE AERONAVES', 'TECNOLOGÍA EN MANTENIMIENTO EN SISTEMAS ELÉCTRICOS ELECTRÓNICOS E INSTRUMENTOS DE AERONAVES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3904, 'TECNOLOGÍA EN MANTENIMIENTO MECÁNICO', 'TECNOLOGÍA EN MANTENIMIENTO MECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3905, 'TECNOLOGÍA EN MANTENIMIENTO MECÁNICO INDUSTRIAL', 'TECNOLOGÍA EN MANTENIMIENTO MECÁNICO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3906, 'TECNOLOGÍA EN MANTENIMIENTO MECATRÓNICO DE AUTOMOTORES', 'TECNOLOGÍA EN MANTENIMIENTO MECATRÓNICO DE AUTOMOTORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3907, 'TECNOLOGÍA EN MAQUINAS Y HERRAMIENTAS', 'TECNOLOGÍA EN MAQUINAS Y HERRAMIENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3908, 'TECNOLOGÍA EN MARKETING DIGITAL', 'TECNOLOGÍA EN MARKETING DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3909, 'TECNOLOGÍA EN MARKETINKG DE SERVICIOS TURISTICOS', 'TECNOLOGÍA EN MARKETINKG DE SERVICIOS TURISTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3910, 'TECNOLOGÍA EN MECÁNICA AUTOMOTRIZ', 'TECNOLOGÍA EN MECÁNICA AUTOMOTRIZ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3911, 'TECNOLOGÍA EN MECÁNICA DENTAL', 'TECNOLOGÍA EN MECÁNICA DENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3912, 'TECNOLOGÍA EN MECÁNICA INDUSTRIAL', 'TECNOLOGÍA EN MECÁNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3913, 'TECNOLOGÍA EN MECANIZACIÓN AGRÍCOLA', 'TECNOLOGÍA EN MECANIZACIÓN AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3914, 'TECNOLOGÍA EN MECATRÓNICA', 'TECNOLOGÍA EN MECATRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3915, 'TECNOLOGÍA EN MERCADEO', 'TECNOLOGÍA EN MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3916, 'TECNOLOGÍA EN MERCADEO DE PRODUCTOS ECOTURÍSTICOS', 'TECNOLOGÍA EN MERCADEO DE PRODUCTOS ECOTURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3917, 'TECNOLOGÍA EN MERCADEO INTERNACIÓNAL', 'TECNOLOGÍA EN MERCADEO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3918, 'TECNOLOGÍA EN MERCADEO Y DISEÑO PUBLICITARIO', 'TECNOLOGÍA EN MERCADEO Y DISEÑO PUBLICITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3919, 'TECNOLOGÍA EN MERCADEO Y ESTRATEGIAS COMERCIALES', 'TECNOLOGÍA EN MERCADEO Y ESTRATEGIAS COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3920, 'TECNOLOGÍA EN MERCADEO Y GESTIÓN COMERCIAL', 'TECNOLOGÍA EN MERCADEO Y GESTIÓN COMERCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3921, 'TECNOLOGÍA EN MERCADEO Y NEGOCIOS INTERNACIÓNALES', 'TECNOLOGÍA EN MERCADEO Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3922, 'TECNOLOGÍA EN MERCADEO Y PUBLICIDAD', 'TECNOLOGÍA EN MERCADEO Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3923, 'TECNOLOGÍA EN MERCADEO Y VENTAS', 'TECNOLOGÍA EN MERCADEO Y VENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3924, 'TECNOLOGÍA EN MERCADOTECNIA', 'TECNOLOGÍA EN MERCADOTECNIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3925, 'TECNOLOGÍA EN MERCADOTECNIA Y PUBLICIDAD', 'TECNOLOGÍA EN MERCADOTECNIA Y PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3926, 'TECNOLOGÍA EN METROLOGÍA INDUSTRIAL', 'TECNOLOGÍA EN METROLOGÍA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3927, 'TECNOLOGÍA EN MODA E INDUMENTARIA', 'TECNOLOGÍA EN MODA E INDUMENTARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3928, 'TECNOLOGÍA EN MODELADO DIGITAL ARQUITECTÓNICO', 'TECNOLOGÍA EN MODELADO DIGITAL ARQUITECTÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3929, 'TECNOLOGÍA EN MONTAJES INDUSTRIALES', 'TECNOLOGÍA EN MONTAJES INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3930, 'TECNOLOGÍA EN MULTIMEDIA', 'TECNOLOGÍA EN MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3931, 'TECNOLOGÍA EN MULTIMEDIA Y SOLUCIÓNES WEB', 'TECNOLOGÍA EN MULTIMEDIA Y SOLUCIÓNES WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3932, 'TECNOLOGÍA EN NEGOCIACIÓN INTERNACIÓNAL', 'TECNOLOGÍA EN NEGOCIACIÓN INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3933, 'TECNOLOGÍA EN NEGOCIOS VERDES', 'TECNOLOGÍA EN NEGOCIOS VERDES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3934, 'TECNOLOGÍA EN NEGOCIOS Y MERCADEO', 'TECNOLOGÍA EN NEGOCIOS Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3935, 'TECNOLOGÍA EN OBRAS CIVILES', 'TECNOLOGÍA EN OBRAS CIVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3936, 'TECNOLOGÍA EN OFICIAL ENCARGADO DE LA GUARDIA DE NAVEGACIÓN REGLA II/33 STCW/78 ENMENDADO NIVEL OPERACIÓNAL', 'TECNOLOGÍA EN OFICIAL ENCARGADO DE LA GUARDIA DE NAVEGACIÓN REGLA II/33 STCW/78 ENMENDADO NIVEL OPERACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3937, 'TECNOLOGÍA EN OFICIAL ENCARGADO DE LA GUARDIA EN CÁMARA DE MÁQUINAS REGLA III/1 - STCW/78 ENMENDADO, NIVEL OPERACIÓNAL', 'TECNOLOGÍA EN OFICIAL ENCARGADO DE LA GUARDIA EN CÁMARA DE MÁQUINAS REGLA III/1 - STCW/78 ENMENDADO, NIVEL OPERACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3938, 'TECNOLOGÍA EN OPERACIÓN DE PLANTAS PETROQUÍMICAS', 'TECNOLOGÍA EN OPERACIÓN DE PLANTAS PETROQUÍMICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3939, 'TECNOLOGÍA EN OPERACIÓN DE PLANTAS Y PROCESOS INDUSTRIALES', 'TECNOLOGÍA EN OPERACIÓN DE PLANTAS Y PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3940, 'TECNOLOGÍA EN OPERACIÓN DE SISTEMAS ELECTROMECÁNICOS', 'TECNOLOGÍA EN OPERACIÓN DE SISTEMAS ELECTROMECÁNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3941, 'TECNOLOGÍA EN OPERACIÓN INTEGRAL DEL TRANSPORTE', 'TECNOLOGÍA EN OPERACIÓN INTEGRAL DEL TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3942, 'TECNOLOGÍA EN OPERACIÓN Y MANTENIMIENTO ELECTROMECÁNICO', 'TECNOLOGÍA EN OPERACIÓN Y MANTENIMIENTO ELECTROMECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3943, 'TECNOLOGÍA EN OPERACIÓNES DE MANUFACTURA Y SERVICIOS', 'TECNOLOGÍA EN OPERACIÓNES DE MANUFACTURA Y SERVICIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3944, 'TECNOLOGÍA EN OPERACIÓNES FINANCIERAS', 'TECNOLOGÍA EN OPERACIÓNES FINANCIERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3945, 'TECNOLOGÍA EN OPERACIÓNES TURÍSTICAS', 'TECNOLOGÍA EN OPERACIÓNES TURÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3946, 'TECNOLOGÍA EN ORGANIZACIÓN DE EVENTOS', 'TECNOLOGÍA EN ORGANIZACIÓN DE EVENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3947, 'TECNOLOGÍA EN ORGANIZACIÓN DEL ESPACIO ESCÉNICO', 'TECNOLOGÍA EN ORGANIZACIÓN DEL ESPACIO ESCÉNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3948, 'TECNOLOGÍA EN PEDAGOGÍA Y LINGÜÍSTICA APLICADA PARA LA REVITALIZACIÓN DE LA LENGUA NASA', 'TECNOLOGÍA EN PEDAGOGÍA Y LINGÜÍSTICA APLICADA PARA LA REVITALIZACIÓN DE LA LENGUA NASA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3949, 'TECNOLOGÍA EN PLANEACIÓN MINERO ENERGETICA', 'TECNOLOGÍA EN PLANEACIÓN MINERO ENERGETICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3950, 'TECNOLOGÍA EN PLANEACIÓN PARA EL CONTROL AMBIENTAL', 'TECNOLOGÍA EN PLANEACIÓN PARA EL CONTROL AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3951, 'TECNOLOGÍA EN PREVENCIÓN Y CONTROL AMBIENTAL', 'TECNOLOGÍA EN PREVENCIÓN Y CONTROL AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3952, 'TECNOLOGÍA EN PREVENCIÓN Y MITIGACIÓN AMBIENTAL', 'TECNOLOGÍA EN PREVENCIÓN Y MITIGACIÓN AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3953, 'TECNOLOGÍA EN PROCEDIMIENTOS JUDICIALES', 'TECNOLOGÍA EN PROCEDIMIENTOS JUDICIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3954, 'TECNOLOGÍA EN PROCESAMIENTO DE ALIMENTOS', 'TECNOLOGÍA EN PROCESAMIENTO DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3955, 'TECNOLOGÍA EN PROCESAMIENTO DE PLASTICOS', 'TECNOLOGÍA EN PROCESAMIENTO DE PLASTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3956, 'TECNOLOGÍA EN PROCESOS AGROINDUSTRIALES', 'TECNOLOGÍA EN PROCESOS AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3957, 'TECNOLOGÍA EN PROCESOS BIOTECNOLÓGICOS APLICADOS A LA INDUSTRIA', 'TECNOLOGÍA EN PROCESOS BIOTECNOLÓGICOS APLICADOS A LA INDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3958, 'TECNOLOGÍA EN PROCESOS COMERCIALES', 'TECNOLOGÍA EN PROCESOS COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3959, 'TECNOLOGÍA EN PROCESOS DE LA INDUSTRIA QUÍMICA', 'TECNOLOGÍA EN PROCESOS DE LA INDUSTRIA QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3960, 'TECNOLOGÍA EN PROCESOS DE PRODUCCIÓN INDUSTRIAL', 'TECNOLOGÍA EN PROCESOS DE PRODUCCIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3961, 'TECNOLOGÍA EN PROCESOS DE SEGURIDAD Y SALUD EN EL TRABAJO', 'TECNOLOGÍA EN PROCESOS DE SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3962, 'TECNOLOGÍA EN PROCESOS DE TRANSFORMACIÓN DE BIOMASA', 'TECNOLOGÍA EN PROCESOS DE TRANSFORMACIÓN DE BIOMASA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3963, 'TECNOLOGÍA EN PROCESOS INDUSTRIALES', 'TECNOLOGÍA EN PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3964, 'TECNOLOGÍA EN PROCESOS LOGÍSTICOS', 'TECNOLOGÍA EN PROCESOS LOGÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3965, 'TECNOLOGÍA EN PROCESOS PRODUCTIVOS DE LA MADERA', 'TECNOLOGÍA EN PROCESOS PRODUCTIVOS DE LA MADERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3966, 'TECNOLOGÍA EN PROCESOS PUBLICITARIOS', 'TECNOLOGÍA EN PROCESOS PUBLICITARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3967, 'TECNOLOGÍA EN PROCESOS QUÍMICOS INDUSTRIALES', 'TECNOLOGÍA EN PROCESOS QUÍMICOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3968, 'TECNOLOGÍA EN PRODUCCIÓN AGRÍCOLA', 'TECNOLOGÍA EN PRODUCCIÓN AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3969, 'TECNOLOGÍA EN PRODUCCIÓN AGROECOLÓGICA', 'TECNOLOGÍA EN PRODUCCIÓN AGROECOLÓGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3970, 'TECNOLOGÍA EN PRODUCCIÓN AGROINDUSTRIAL', 'TECNOLOGÍA EN PRODUCCIÓN AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3971, 'TECNOLOGÍA EN PRODUCCIÓN AGROPECUARIA', 'TECNOLOGÍA EN PRODUCCIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3972, 'TECNOLOGÍA EN PRODUCCIÓN AGROPECUARIA ECOLÓGICA', 'TECNOLOGÍA EN PRODUCCIÓN AGROPECUARIA ECOLÓGICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3973, 'TECNOLOGÍA EN PRODUCCIÓN ANIMAL', 'TECNOLOGÍA EN PRODUCCIÓN ANIMAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3974, 'TECNOLOGÍA EN PRODUCCIÓN AUDIOVISUAL', 'TECNOLOGÍA EN PRODUCCIÓN AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3975, 'TECNOLOGÍA EN PRODUCCIÓN DANCÍSTICA', 'TECNOLOGÍA EN PRODUCCIÓN DANCÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3976, 'TECNOLOGÍA EN PRODUCCIÓN DE AGROCULTIVOS', 'TECNOLOGÍA EN PRODUCCIÓN DE AGROCULTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3977, 'TECNOLOGÍA EN PRODUCCIÓN DE ALIMENTOS', 'TECNOLOGÍA EN PRODUCCIÓN DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3978, 'TECNOLOGÍA EN PRODUCCIÓN DE ANIMACIÓN DIGITAL', 'TECNOLOGÍA EN PRODUCCIÓN DE ANIMACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3979, 'TECNOLOGÍA EN PRODUCCIÓN DE AUDIO', 'TECNOLOGÍA EN PRODUCCIÓN DE AUDIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3980, 'TECNOLOGÍA EN PRODUCCIÓN DE CALZADO Y MARROQUINERÍA', 'TECNOLOGÍA EN PRODUCCIÓN DE CALZADO Y MARROQUINERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3981, 'TECNOLOGÍA EN PRODUCCIÓN DE COLECCIÓNES INDUSTRIALES', 'TECNOLOGÍA EN PRODUCCIÓN DE COLECCIÓNES INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3982, 'TECNOLOGÍA EN PRODUCCIÓN DE COMPONENTES MECÁNICOS CON MÁQUINAS DE CONTROL NUMÉRICO COMPUTARIZADO', 'TECNOLOGÍA EN PRODUCCIÓN DE COMPONENTES MECÁNICOS CON MÁQUINAS DE CONTROL NUMÉRICO COMPUTARIZADO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3983, 'TECNOLOGÍA EN PRODUCCIÓN DE CONTENIDOS GRÁFICOS DIGITALES', 'TECNOLOGÍA EN PRODUCCIÓN DE CONTENIDOS GRÁFICOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3984, 'TECNOLOGÍA EN PRODUCCIÓN DE ESPACIOS Y AMBIENTES', 'TECNOLOGÍA EN PRODUCCIÓN DE ESPACIOS Y AMBIENTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3985, 'TECNOLOGÍA EN PRODUCCIÓN DE ESPECIES MENORES', 'TECNOLOGÍA EN PRODUCCIÓN DE ESPECIES MENORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3986, 'TECNOLOGÍA EN PRODUCCIÓN DE EVENTOS', 'TECNOLOGÍA EN PRODUCCIÓN DE EVENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3987, 'TECNOLOGÍA EN PRODUCCIÓN DE GANADERÍA SOSTENIBLE', 'TECNOLOGÍA EN PRODUCCIÓN DE GANADERÍA SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3988, 'TECNOLOGÍA EN PRODUCCIÓN DE IMAGEN FOTOGRÁFICA', 'TECNOLOGÍA EN PRODUCCIÓN DE IMAGEN FOTOGRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3989, 'TECNOLOGÍA EN PRODUCCIÓN DE IMAGEN Y SONIDO', 'TECNOLOGÍA EN PRODUCCIÓN DE IMAGEN Y SONIDO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3990, 'TECNOLOGÍA EN PRODUCCIÓN DE IMÁGENES CON CÁMARAS DE CINE Y TELEVISIÓN DIGITAL', 'TECNOLOGÍA EN PRODUCCIÓN DE IMÁGENES CON CÁMARAS DE CINE Y TELEVISIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3991, 'TECNOLOGÍA EN PRODUCCIÓN DE JOYERÍA', 'TECNOLOGÍA EN PRODUCCIÓN DE JOYERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3992, 'TECNOLOGÍA EN PRODUCCIÓN DE LA MODA', 'TECNOLOGÍA EN PRODUCCIÓN DE LA MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3993, 'TECNOLOGÍA EN PRODUCCIÓN DE MEDIOS AUDIOVISUALES', 'TECNOLOGÍA EN PRODUCCIÓN DE MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3994, 'TECNOLOGÍA EN PRODUCCIÓN DE MEDIOS AUDIOVISUALES DIGITALES', 'TECNOLOGÍA EN PRODUCCIÓN DE MEDIOS AUDIOVISUALES DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3995, 'TECNOLOGÍA EN PRODUCCIÓN DE MEDIOS PUBLICITARIOS', 'TECNOLOGÍA EN PRODUCCIÓN DE MEDIOS PUBLICITARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3996, 'TECNOLOGÍA EN PRODUCCIÓN DE MODAS', 'TECNOLOGÍA EN PRODUCCIÓN DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3997, 'TECNOLOGÍA EN PRODUCCIÓN DE MULTIMEDIA', 'TECNOLOGÍA EN PRODUCCIÓN DE MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3998, 'TECNOLOGÍA EN PRODUCCIÓN DE MÚSICA Y AUDIO', 'TECNOLOGÍA EN PRODUCCIÓN DE MÚSICA Y AUDIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (3999, 'TECNOLOGÍA EN PRODUCCIÓN DE PETRÓLEO', 'TECNOLOGÍA EN PRODUCCIÓN DE PETRÓLEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4000, 'TECNOLOGÍA EN PRODUCCIÓN DE RADIO Y MEDIOS AUDIOVISUALES', 'TECNOLOGÍA EN PRODUCCIÓN DE RADIO Y MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4001, 'TECNOLOGÍA EN PRODUCCIÓN DE RADIO Y TELEVISIÓN', 'TECNOLOGÍA EN PRODUCCIÓN DE RADIO Y TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4002, 'TECNOLOGÍA EN PRODUCCIÓN DE SONIDO', 'TECNOLOGÍA EN PRODUCCIÓN DE SONIDO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4003, 'TECNOLOGÍA EN PRODUCCIÓN DE SONIDO PARA MEDIOS AUDIOVISUALES', 'TECNOLOGÍA EN PRODUCCIÓN DE SONIDO PARA MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4004, 'TECNOLOGÍA EN PRODUCCIÓN DIGITAL EN MEDIOS AUDIOVISUALES', 'TECNOLOGÍA EN PRODUCCIÓN DIGITAL EN MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4005, 'TECNOLOGÍA EN PRODUCCIÓN EN JOYERÍA', 'TECNOLOGÍA EN PRODUCCIÓN EN JOYERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4006, 'TECNOLOGÍA EN PRODUCCIÓN ESCÉNICA Y VISUAL', 'TECNOLOGÍA EN PRODUCCIÓN ESCÉNICA Y VISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4007, 'TECNOLOGÍA EN PRODUCCIÓN FORESTAL', 'TECNOLOGÍA EN PRODUCCIÓN FORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4008, 'TECNOLOGÍA EN PRODUCCIÓN GANADERA', 'TECNOLOGÍA EN PRODUCCIÓN GANADERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4009, 'TECNOLOGÍA EN PRODUCCIÓN GASTRONÓMICA', 'TECNOLOGÍA EN PRODUCCIÓN GASTRONÓMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4010, 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA', 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4011, 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA DIGITAL', 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4012, 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA PARA MEDIOS PUBLICITARIOS', 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA PARA MEDIOS PUBLICITARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4013, 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA PUBLICITARIA', 'TECNOLOGÍA EN PRODUCCIÓN GRÁFICA PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4014, 'TECNOLOGÍA EN PRODUCCIÓN HORTÍCOLA', 'TECNOLOGÍA EN PRODUCCIÓN HORTÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4015, 'TECNOLOGÍA EN PRODUCCIÓN INDUSTRIAL', 'TECNOLOGÍA EN PRODUCCIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4016, 'TECNOLOGÍA EN PRODUCCIÓN INDUSTRIAL DE VESTUARIO', 'TECNOLOGÍA EN PRODUCCIÓN INDUSTRIAL DE VESTUARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4017, 'TECNOLOGÍA EN PRODUCCIÓN MULTIMEDIA', 'TECNOLOGÍA EN PRODUCCIÓN MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4018, 'TECNOLOGÍA EN PRODUCCIÓN TRANSMEDIA', 'TECNOLOGÍA EN PRODUCCIÓN TRANSMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4019, 'TECNOLOGÍA EN PRODUCCIÓN Y CREACIÓN DE MODA', 'TECNOLOGÍA EN PRODUCCIÓN Y CREACIÓN DE MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4020, 'TECNOLOGÍA EN PRODUCTIVIDAD Y MEJORAMIENTO CONTINUO', 'TECNOLOGÍA EN PRODUCTIVIDAD Y MEJORAMIENTO CONTINUO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4021, 'TECNOLOGÍA EN PROMOCIÓN DE LA SALUD', 'TECNOLOGÍA EN PROMOCIÓN DE LA SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4022, 'TECNOLOGÍA EN PROMOCIÓN SOCIAL', 'TECNOLOGÍA EN PROMOCIÓN SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4023, 'TECNOLOGÍA EN PROMOCIÓN Y APLICACIÓN DEL DERECHO INTERNACIÓNAL HUMANITARIO Y DE LOS DERECHOS HUMANOS EN EL CONTEXTO MILITAR', 'TECNOLOGÍA EN PROMOCIÓN Y APLICACIÓN DEL DERECHO INTERNACIÓNAL HUMANITARIO Y DE LOS DERECHOS HUMANOS EN EL CONTEXTO MILITAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4024, 'TECNOLOGÍA EN PROTECCIÓN Y RECUPERACIÓN DE ECOSISTEMAS FORESTALES', 'TECNOLOGÍA EN PROTECCIÓN Y RECUPERACIÓN DE ECOSISTEMAS FORESTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4025, 'TECNOLOGÍA EN PUBLICIDAD DIGITAL', 'TECNOLOGÍA EN PUBLICIDAD DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4026, 'TECNOLOGÍA EN QUÍMICA APLICADA A LA INDUSTRIA', 'TECNOLOGÍA EN QUÍMICA APLICADA A LA INDUSTRIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4027, 'TECNOLOGÍA EN QUÍMICA INDUSTRIAL', 'TECNOLOGÍA EN QUÍMICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4028, 'TECNOLOGÍA EN QUÍMICA INDUSTRIAL Y DE LABORATORIO', 'TECNOLOGÍA EN QUÍMICA INDUSTRIAL Y DE LABORATORIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4029, 'TECNOLOGÍA EN QUÍMICA TEXTIL', 'TECNOLOGÍA EN QUÍMICA TEXTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4030, 'TECNOLOGÍA EN RADIODIAGNOSTICO Y RADIOTERAPIA', 'TECNOLOGÍA EN RADIODIAGNOSTICO Y RADIOTERAPIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4031, 'TECNOLOGÍA EN RADIOLOGÍA E IMÁGENES DIAGNÓSTICAS', 'TECNOLOGÍA EN RADIOLOGÍA E IMÁGENES DIAGNÓSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4032, 'TECNOLOGÍA EN RADIOTERAPIA', 'TECNOLOGÍA EN RADIOTERAPIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4033, 'TECNOLOGÍA EN REALIZACIÓN AUDIOVISUAL', 'TECNOLOGÍA EN REALIZACIÓN AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4034, 'TECNOLOGÍA EN REALIZACIÓN DE AUDIOVISUALES Y MULTIMEDIA', 'TECNOLOGÍA EN REALIZACIÓN DE AUDIOVISUALES Y MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4035, 'TECNOLOGÍA EN REALIZACIÓN DE PROYECTOS SONOROS PARA CONTENIDOS DIGITALES', 'TECNOLOGÍA EN REALIZACIÓN DE PROYECTOS SONOROS PARA CONTENIDOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4036, 'TECNOLOGÍA EN REALIZACIÓN VISUAL Y AUDIOVISUAL', 'TECNOLOGÍA EN REALIZACIÓN VISUAL Y AUDIOVISUAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4037, 'TECNOLOGÍA EN RECREACIÓN', 'TECNOLOGÍA EN RECREACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4038, 'TECNOLOGÍA EN RECURSOS FORESTALES', 'TECNOLOGÍA EN RECURSOS FORESTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4039, 'TECNOLOGÍA EN REDES DE COMUNICACIÓNES Y SERVICIOS CONVERGENTES', 'TECNOLOGÍA EN REDES DE COMUNICACIÓNES Y SERVICIOS CONVERGENTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4040, 'TECNOLOGÍA EN REDES DE DATOS EN TELECOMUNICACIÓNES', 'TECNOLOGÍA EN REDES DE DATOS EN TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4041, 'TECNOLOGÍA EN REDES Y SEGURIDAD INFORMATICA', 'TECNOLOGÍA EN REDES Y SEGURIDAD INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4042, 'TECNOLOGÍA EN REGENCIA DE FARMACIA', 'TECNOLOGÍA EN REGENCIA DE FARMACIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4043, 'TECNOLOGÍA EN ROBOTICA Y AUTOMATIZACIÓN INDUSTRIAL', 'TECNOLOGÍA EN ROBOTICA Y AUTOMATIZACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4044, 'TECNOLOGÍA EN SALUD AMBIENTAL Y SEGURIDAD SANITARIA', 'TECNOLOGÍA EN SALUD AMBIENTAL Y SEGURIDAD SANITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4045, 'TECNOLOGÍA EN SANEAMIENTO AMBIENTAL', 'TECNOLOGÍA EN SANEAMIENTO AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4046, 'TECNOLOGÍA EN SANIDAD NAVAL', 'TECNOLOGÍA EN SANIDAD NAVAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4047, 'TECNOLOGÍA EN SEGURIDAD AEROPORTUARIA', 'TECNOLOGÍA EN SEGURIDAD AEROPORTUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4048, 'TECNOLOGÍA EN SEGURIDAD ALIMENTARIA Y NUTRICIÓNAL', 'TECNOLOGÍA EN SEGURIDAD ALIMENTARIA Y NUTRICIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4049, 'TECNOLOGÍA EN SEGURIDAD E HIGIENE OCUPACIÓNAL', 'TECNOLOGÍA EN SEGURIDAD E HIGIENE OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4050, 'TECNOLOGÍA EN SEGURIDAD INFORMATICA', 'TECNOLOGÍA EN SEGURIDAD INFORMATICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4051, 'TECNOLOGÍA EN SEGURIDAD Y SALUD EN EL TRABAJO', 'TECNOLOGÍA EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4052, 'TECNOLOGÍA EN SERVICIOS DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN SERVICIOS DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4053, 'TECNOLOGÍA EN SERVICIOS INFORMÁTICOS', 'TECNOLOGÍA EN SERVICIOS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4054, 'TECNOLOGÍA EN SILVICULTURA Y APROVECHAMIENTO DE PLANTACIÓNES FORESTALES', 'TECNOLOGÍA EN SILVICULTURA Y APROVECHAMIENTO DE PLANTACIÓNES FORESTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4055, 'TECNOLOGÍA EN SISTEMAS', 'TECNOLOGÍA EN SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4056, 'TECNOLOGÍA EN SISTEMAS DE INFORMACIÓN', 'TECNOLOGÍA EN SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4057, 'TECNOLOGÍA EN SISTEMAS DE PRODUCCIÓN', 'TECNOLOGÍA EN SISTEMAS DE PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4058, 'TECNOLOGÍA EN SISTEMAS ELECTROMECÁNICOS', 'TECNOLOGÍA EN SISTEMAS ELECTROMECÁNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4059, 'TECNOLOGÍA EN SISTEMAS ELECTRÓNICOS Y DE AUTOMATIZACIÓN', 'TECNOLOGÍA EN SISTEMAS ELECTRÓNICOS Y DE AUTOMATIZACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4060, 'TECNOLOGÍA EN SISTEMAS INFORMÁTICOS', 'TECNOLOGÍA EN SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4061, 'TECNOLOGÍA EN SISTEMAS INTEGRADOS DE GESTIÓN', 'TECNOLOGÍA EN SISTEMAS INTEGRADOS DE GESTIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4062, 'TECNOLOGÍA EN SISTEMAS MECATRÓNICOS', 'TECNOLOGÍA EN SISTEMAS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4063, 'TECNOLOGÍA EN SISTEMATIZACIÓN DE DATOS', 'TECNOLOGÍA EN SISTEMATIZACIÓN DE DATOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4064, 'TECNOLOGÍA EN SOPORTE DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN SOPORTE DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4065, 'TECNOLOGÍA EN SUMINISTRO DE BIENES Y SERVICIOS MINERO ENERGÉTICOS', 'TECNOLOGÍA EN SUMINISTRO DE BIENES Y SERVICIOS MINERO ENERGÉTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4066, 'TECNOLOGÍA EN SUPERVISIÓN DE LA FABRICACIÓN DE PRODUCTOS METÁLICOS SOLDADOS', 'TECNOLOGÍA EN SUPERVISIÓN DE LA FABRICACIÓN DE PRODUCTOS METÁLICOS SOLDADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4067, 'TECNOLOGÍA EN SUPERVISIÓN DE LABORES MINERAS', 'TECNOLOGÍA EN SUPERVISIÓN DE LABORES MINERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4068, 'TECNOLOGÍA EN SUPERVISIÓN DE OBRAS CIVILES', 'TECNOLOGÍA EN SUPERVISIÓN DE OBRAS CIVILES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4069, 'TECNOLOGÍA EN SUPERVISIÓN DE PROCESOS GRÁFICOS', 'TECNOLOGÍA EN SUPERVISIÓN DE PROCESOS GRÁFICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4070, 'TECNOLOGÍA EN SUPERVISIÓN DE PROCESOS MINEROS', 'TECNOLOGÍA EN SUPERVISIÓN DE PROCESOS MINEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4071, 'TECNOLOGÍA EN SUPERVISIÓN DE REDES DE DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA', 'TECNOLOGÍA EN SUPERVISIÓN DE REDES DE DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4072, 'TECNOLOGÍA EN SUPERVISIÓN DE SISTEMAS DE GENERACIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA', 'TECNOLOGÍA EN SUPERVISIÓN DE SISTEMAS DE GENERACIÓN Y DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4073, 'TECNOLOGÍA EN SUPERVISIÓN DE SISTEMAS ELÉCTRICOS DE POTENCIA', 'TECNOLOGÍA EN SUPERVISIÓN DE SISTEMAS ELÉCTRICOS DE POTENCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4074, 'TECNOLOGÍA EN SUPERVISIÓN EN PROCESOS DE CONFECCIÓN', 'TECNOLOGÍA EN SUPERVISIÓN EN PROCESOS DE CONFECCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4075, 'TECNOLOGÍA EN SUPERVISIÓN EN SEGURIDAD MINERA', 'TECNOLOGÍA EN SUPERVISIÓN EN SEGURIDAD MINERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4076, 'TECNOLOGÍA EN SUPERVISIÓN EN SISTEMAS DE AGUA Y SANEAMIENTO', 'TECNOLOGÍA EN SUPERVISIÓN EN SISTEMAS DE AGUA Y SANEAMIENTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4077, 'TECNOLOGÍA EN SUPERVISIÓN Y MANTENIMIENTO DE SISTEMAS DE COMUNICACIÓN E INFORMÁTICA', 'TECNOLOGÍA EN SUPERVISIÓN Y MANTENIMIENTO DE SISTEMAS DE COMUNICACIÓN E INFORMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4078, 'TECNOLOGÍA EN TALENTO HUMANO', 'TECNOLOGÍA EN TALENTO HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4079, 'TECNOLOGÍA EN TELECOMUNICACIÓNES', 'TECNOLOGÍA EN TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4080, 'TECNOLOGÍA EN TELEMÁTICA', 'TECNOLOGÍA EN TELEMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4081, 'TECNOLOGÍA EN TELEVISIÓN', 'TECNOLOGÍA EN TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4082, 'TECNOLOGÍA EN TRANSFORMACIÓN DE CACAO Y ELABORACIÓN DE PRODUCTOS DE CHOCOLATERIA', 'TECNOLOGÍA EN TRANSFORMACIÓN DE CACAO Y ELABORACIÓN DE PRODUCTOS DE CHOCOLATERIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4083, 'TECNOLOGÍA EN TRANSFORMACIÓN DEL CACAO Y ELABORACIÓN DE PRODUCTOS DE CHOCOLATERÍA INDUSTRIAL', 'TECNOLOGÍA EN TRANSFORMACIÓN DEL CACAO Y ELABORACIÓN DE PRODUCTOS DE CHOCOLATERÍA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4084, 'TECNOLOGÍA EN TRÁNSITO, TRANSPORTE TERRESTRE Y SEGURIDAD VIAL', 'TECNOLOGÍA EN TRÁNSITO, TRANSPORTE TERRESTRE Y SEGURIDAD VIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4085, 'TECNOLOGÍA EN TRANSPORTE DE CEMENTO Y MATERIALES PARA LA CONSTRUCCIÓN', 'TECNOLOGÍA EN TRANSPORTE DE CEMENTO Y MATERIALES PARA LA CONSTRUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4086, 'TECNOLOGÍA EN TURISMO E IDIOMAS', 'TECNOLOGÍA EN TURISMO E IDIOMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4087, 'TECNOLOGÍA EN TURISMO Y HOTELERÍA', 'TECNOLOGÍA EN TURISMO Y HOTELERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4088, 'TECNOLOGÍA FINANCIERA Y CONTABLE', 'TECNOLOGÍA FINANCIERA Y CONTABLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4089, 'TECNOLOGÍA FORESTAL', 'TECNOLOGÍA FORESTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4090, 'TECNOLOGÍA GESTIÓN CONTABLE', 'TECNOLOGÍA GESTIÓN CONTABLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4091, 'TECNOLOGÍA GESTIÓN CONTABLE Y DE INFORMACIÓN FINANCIERA', 'TECNOLOGÍA GESTIÓN CONTABLE Y DE INFORMACIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4092, 'TECNOLOGÍA GESTIÓN DE MODAS', 'TECNOLOGÍA GESTIÓN DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4093, 'TECNOLOGÍA GESTIÓN LOGÍSTICA', 'TECNOLOGÍA GESTIÓN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4094, 'TECNOLOGÍA INDUSTRIAL', 'TECNOLOGÍA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4095, 'TECNOLOGÍA MECÁNICA', 'TECNOLOGÍA MECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4096, 'TECNOLOGÍA MECÁNICA INDUSTRIAL', 'TECNOLOGÍA MECÁNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4097, 'TECNOLOGÍA NAVAL EN ELECTROMECÁNICA', 'TECNOLOGÍA NAVAL EN ELECTROMECÁNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4098, 'TECNOLOGÍA NAVAL EN HIDROGRAFIA', 'TECNOLOGÍA NAVAL EN HIDROGRAFIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4099, 'TECNOLOGÍA NAVAL EN MANTENIMIENTO AERONAVAL', 'TECNOLOGÍA NAVAL EN MANTENIMIENTO AERONAVAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4100, 'TECNOLOGÍA NAVAL EN OCEANOFRAFIA FÍSICA', 'TECNOLOGÍA NAVAL EN OCEANOFRAFIA FÍSICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4101, 'TECNOLOGÍA NAVAL EN OPERACIÓN DE SUBMARINOS', 'TECNOLOGÍA NAVAL EN OPERACIÓN DE SUBMARINOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4102, 'TECNOLOGÍA NAVIERA', 'TECNOLOGÍA NAVIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4103, 'TECNOLOGÍA NEGOCIACIÓN INTERNACIÓNAL', 'TECNOLOGÍA NEGOCIACIÓN INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4104, 'TECNOLOGÍA PROCESOS DE LA INDUSTRIA QUÍMICA', 'TECNOLOGÍA PROCESOS DE LA INDUSTRIA QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4105, 'TECNOLOGÍA PROCESOS PARA LA COMERCIALIZACIÓN INTERNACIÓNAL', 'TECNOLOGÍA PROCESOS PARA LA COMERCIALIZACIÓN INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4106, 'TECNOLOGÍA PRODUCCIÓN DE MULTIMEDIA', 'TECNOLOGÍA PRODUCCIÓN DE MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4107, 'TECNOLOGÍA QUÍMICA', 'TECNOLOGÍA QUÍMICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4108, 'TECNOLOGÍA TEXTIL', 'TECNOLOGÍA TEXTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4109, 'TECNOLÓGO EN ANÁLISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN', 'TECNOLÓGO EN ANÁLISIS Y DESARROLLO DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4110, 'TECNOLOGO EN CONSTRUCCIÓN EN EDIFICACIÓNES', 'TECNOLOGO EN CONSTRUCCIÓN EN EDIFICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4111, 'TECNÓLOGO EN GESTIÓN DE PROYECTOS DE DESARROLLO ECONÓMICO Y SOCIAL', 'TECNÓLOGO EN GESTIÓN DE PROYECTOS DE DESARROLLO ECONÓMICO Y SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4112, 'TECNOLOGO EN PRODUCCIÓN DE MULTIMEDIA', 'TECNOLOGO EN PRODUCCIÓN DE MULTIMEDIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4113, 'TECNONOLOGÍA EN GESTIÓN INTEGRADA DE LA CALIDAD MEDIO AMBIENTE SEGURIDAD Y SALUD OCUPACIÓNAL', 'TECNONOLOGÍA EN GESTIÓN INTEGRADA DE LA CALIDAD MEDIO AMBIENTE SEGURIDAD Y SALUD OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4114, 'TEGNOLOGÍA QUÍMICA TEXTIL', 'TEGNOLOGÍA QUÍMICA TEXTIL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4115, 'TEOLOGÍA', 'TEOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4116, 'TERAPIA CARDIORRESPIRATORIA', 'TERAPIA CARDIORRESPIRATORIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4117, 'TERAPIA OCUPACIÓNAL', 'TERAPIA OCUPACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4118, 'TERAPIA RESPIRATORIA', 'TERAPIA RESPIRATORIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4119, 'TRABAJO SOCIAL', 'TRABAJO SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4120, 'TRADUCCIÓN INGLES-FRANCES-ESPAÑOL', 'TRADUCCIÓN INGLES-FRANCES-ESPAÑOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4121, 'TURISMO', 'TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4122, 'URBANISMO', 'URBANISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4123, 'ZOOTECNIA', 'ZOOTECNIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4124, 'ADMINISTRACIÓN MARÍTIMA', 'ADMINISTRACIÓN MARÍTIMA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4125, 'ADMINISTRACIÓN MARÍTIMA Y FLUVIAL', 'ADMINISTRACIÓN MARÍTIMA Y FLUVIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4126, 'DISEÑO DE ESPACIOS - ESCÉNARIO', 'DISEÑO DE ESPACIOS - ESCÉNARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4127, 'LICENCIATURA EN ARTE DRAMÁTICO', 'LICENCIATURA EN ARTE DRAMÁTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4128, 'TECNOLOGÍA NAVAL EN ADMINISTRACIÓN MARÍTIMA', 'TECNOLOGÍA NAVAL EN ADMINISTRACIÓN MARÍTIMA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4129, 'ADMINISTRACIÓN DE EMPRESAS Y GESTIÓN AMBIENTAL', 'ADMINISTRACIÓN DE EMPRESAS Y GESTIÓN AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4130, 'ARCHIVISTICA Y GESTIÓN DE LA INFORMACIÓN DIGITAL', 'ARCHIVISTICA Y GESTIÓN DE LA INFORMACIÓN DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4131, 'ESTUDIOS Y GESTIÓN CULTURAL', 'ESTUDIOS Y GESTIÓN CULTURAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4132, 'GESTIÓN EMPRESARIAL', 'GESTIÓN EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4133, 'GESTIÓN Y DESARROLLO URBANOS', 'GESTIÓN Y DESARROLLO URBANOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4134, 'PROFESIÓNAL EN GESTIÓN DEL DISEÑO', 'PROFESIÓNAL EN GESTIÓN DEL DISEÑO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4135, 'TECNOLOGÍA DE GESTIÓN ADMINISTRATIVA', 'TECNOLOGÍA DE GESTIÓN ADMINISTRATIVA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4136, 'TECNOLOGÍA EN CRIMINALISTICA Y GESTIÓN JUDICIAL', 'TECNOLOGÍA EN CRIMINALISTICA Y GESTIÓN JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4137, 'TECNOLOGÍA EN GESTIÓN AGROAMBIENTAL', 'TECNOLOGÍA EN GESTIÓN AGROAMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4138, 'TECNOLOGÍA EN GESTIÓN AMBIENTAL TERRITORIAL', 'TECNOLOGÍA EN GESTIÓN AMBIENTAL TERRITORIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4139, 'TECNOLOGÍA EN GESTIÓN AMBIENTAL TERRITORIAL A DISTANCIA', 'TECNOLOGÍA EN GESTIÓN AMBIENTAL TERRITORIAL A DISTANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4140, 'TECNOLOGÍA EN GESTIÓN AMBIENTAL Y SERVICIOS PUBLICOS', 'TECNOLOGÍA EN GESTIÓN AMBIENTAL Y SERVICIOS PUBLICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4141, 'TECNOLOGÍA EN GESTIÓN BANCARIA Y DE ENTIDADES FINANCIERAS', 'TECNOLOGÍA EN GESTIÓN BANCARIA Y DE ENTIDADES FINANCIERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4142, 'TECNOLOGÍA EN GESTIÓN CATASTRAL Y AGRIMENSURA', 'TECNOLOGÍA EN GESTIÓN CATASTRAL Y AGRIMENSURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4143, 'TECNOLOGÍA EN GESTIÓN COMERCIAL INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN COMERCIAL INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4144, 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y DE MERCADOS', 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y DE MERCADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4145, 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y DE NEGOCIOS', 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y DE NEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4146, 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y MERCADEO', 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4147, 'TECNOLOGÍA EN GESTIÓN DE CALIDAD, SEGURIDAD, SALUD EN EL TRABAJO Y AMBIENTE', 'TECNOLOGÍA EN GESTIÓN DE CALIDAD, SEGURIDAD, SALUD EN EL TRABAJO Y AMBIENTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4148, 'TECNOLOGÍA EN GESTIÓN DE DISEÑO DE MODAS', 'TECNOLOGÍA EN GESTIÓN DE DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4149, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS AGROFORESTALES', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS AGROFORESTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4150, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS DE ECONOMÍA SOLIDARIA', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS DE ECONOMÍA SOLIDARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4151, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS DE LA SALUD', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS DE LA SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4152, 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS Y ORGANIZACIÓNES SOLIDARIAS', 'TECNOLOGÍA EN GESTIÓN DE EMPRESAS Y ORGANIZACIÓNES SOLIDARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4153, 'TECNOLOGÍA EN GESTIÓN DE FINANZAS Y NEGOCIOS INTERNACIÓNALES', 'TECNOLOGÍA EN GESTIÓN DE FINANZAS Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4154, 'TECNOLOGÍA EN GESTIÓN DE INFRAESTRUCTURA DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN GESTIÓN DE INFRAESTRUCTURA DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4155, 'TECNOLOGÍA EN GESTIÓN DE INFRAESTRUCTURAS DE TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓNES', 'TECNOLOGÍA EN GESTIÓN DE INFRAESTRUCTURAS DE TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4156, 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN', 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4157, 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN Y CALIDAD', 'TECNOLOGÍA EN GESTIÓN DE LA PRODUCCIÓN Y CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4158, 'TECNOLOGÍA EN GESTIÓN DE LOS NEGOCIOS INTERNACIÓNALES EN ENTORNOS DIGITALES', 'TECNOLOGÍA EN GESTIÓN DE LOS NEGOCIOS INTERNACIÓNALES EN ENTORNOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4159, 'TECNOLOGÍA EN GESTIÓN DE MARKETING INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN DE MARKETING INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4160, 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y VENTAS', 'TECNOLOGÍA EN GESTIÓN DE MERCADEO Y VENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4161, 'TECNOLOGÍA EN GESTIÓN DE OBRAS CIVILES Y CONSTRUCCIÓNES', 'TECNOLOGÍA EN GESTIÓN DE OBRAS CIVILES Y CONSTRUCCIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4162, 'TECNOLOGÍA EN GESTIÓN DE ORGANIZACIÓNES TURÍSTICAS', 'TECNOLOGÍA EN GESTIÓN DE ORGANIZACIÓNES TURÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4163, 'TECNOLOGÍA EN GESTIÓN DE PRODUCCIÓN SOSTENIBLE', 'TECNOLOGÍA EN GESTIÓN DE PRODUCCIÓN SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4164, 'TECNOLOGÍA EN GESTIÓN DE PRODUCCIÓN Y CALIDAD', 'TECNOLOGÍA EN GESTIÓN DE PRODUCCIÓN Y CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4165, 'TECNOLOGÍA EN GESTIÓN DE REDES INFORMÁTICAS', 'TECNOLOGÍA EN GESTIÓN DE REDES INFORMÁTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4166, 'TECNOLOGÍA EN GESTIÓN DE RIESGOS Y SEGUROS', 'TECNOLOGÍA EN GESTIÓN DE RIESGOS Y SEGUROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4167, 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS DE SALUD', 'TECNOLOGÍA EN GESTIÓN DE SERVICIOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4168, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE INFORMACIÓN', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4169, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE TELECOMUNICACIÓNES', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4170, 'TECNOLOGÍA EN GESTIÓN DE TRANSITO AEREO', 'TECNOLOGÍA EN GESTIÓN DE TRANSITO AEREO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4171, 'TECNOLOGÍA EN GESTIÓN DE TRANSPORTES', 'TECNOLOGÍA EN GESTIÓN DE TRANSPORTES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4172, 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO ELECTROMECÁNICO', 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO ELECTROMECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4173, 'TECNOLOGÍA EN GESTIÓN DEL SERVICIO DE POLICIA', 'TECNOLOGÍA EN GESTIÓN DEL SERVICIO DE POLICIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4174, 'TECNOLOGÍA EN GESTIÓN DEL TURISMO DE NATURALEZA', 'TECNOLOGÍA EN GESTIÓN DEL TURISMO DE NATURALEZA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4175, 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL Y DE LA INNOVACIÓN', 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL Y DE LA INNOVACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4176, 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN EMPRESARIAL Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4177, 'TECNOLOGÍA EN GESTIÓN EN FINANZAS', 'TECNOLOGÍA EN GESTIÓN EN FINANZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4178, 'TECNOLOGÍA EN GESTIÓN EN LOGÍSTICA MILITAR', 'TECNOLOGÍA EN GESTIÓN EN LOGÍSTICA MILITAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4179, 'TECNOLOGÍA EN GESTIÓN FINANCIERA DEL COMERCIO INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN FINANCIERA DEL COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4180, 'TECNOLOGÍA EN GESTIÓN HOTELERA Y SERVICIOS TURISTICOS', 'TECNOLOGÍA EN GESTIÓN HOTELERA Y SERVICIOS TURISTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4181, 'TECNOLOGÍA EN GESTIÓN INTEGRAL DEL RIESGO EN SEGUROS', 'TECNOLOGÍA EN GESTIÓN INTEGRAL DEL RIESGO EN SEGUROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4182, 'TECNOLOGÍA EN GESTIÓN INTEGRAL EN FONDOS DE PENSIÓNES Y CESANTIAS', 'TECNOLOGÍA EN GESTIÓN INTEGRAL EN FONDOS DE PENSIÓNES Y CESANTIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4183, 'TECNOLOGÍA EN GESTIÓN PUBLICITARIA', 'TECNOLOGÍA EN GESTIÓN PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4184, 'TECNOLOGÍA EN GESTIÓN SOSTENIBLE DEL CAFÉ', 'TECNOLOGÍA EN GESTIÓN SOSTENIBLE DEL CAFÉ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4185, 'TECNOLOGÍA EN GESTIÓN TRIBUTARIA, CONTABLE Y FINANCIERA', 'TECNOLOGÍA EN GESTIÓN TRIBUTARIA, CONTABLE Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4186, 'TECNOLOGÍA EN PRODUCCIÓN Y GESTIÓN AGROPECUARIA', 'TECNOLOGÍA EN PRODUCCIÓN Y GESTIÓN AGROPECUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4187, 'TECNOLOGÍA EN SISTEMAS DE GESTIÓN DE CALIDAD', 'TECNOLOGÍA EN SISTEMAS DE GESTIÓN DE CALIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4188, 'TECNOLOGÍA EN SISTEMAS INTEGRADOS DE GESTIÓN HSEQ', 'TECNOLOGÍA EN SISTEMAS INTEGRADOS DE GESTIÓN HSEQ', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4189, 'TECNOLOLOGÍA EN GESTIÓN EMPRESARIAL', 'TECNOLOLOGÍA EN GESTIÓN EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4190, 'TEGNOLOGÍA EN GESTIÓN CONTABLE Y FINANCIERA', 'TEGNOLOGÍA EN GESTIÓN CONTABLE Y FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4191, 'INGENIERÍA AERONAÚTICA', 'INGENIERÍA AERONAÚTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4192, 'TECNOLOGÍA EN COMUNICACIÓNES AERONAÚTICAS', 'TECNOLOGÍA EN COMUNICACIÓNES AERONAÚTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4193, 'INGENIERÍA ELÉCTRICA (POR CICLOS PROPEDEUTICOS)', 'INGENIERÍA ELÉCTRICA (POR CICLOS PROPEDEUTICOS)', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4194, 'TECNOLOGÍA EN GESTIÓN EFICIENTE DE LA ENERGÍA ELECTRICA', 'TECNOLOGÍA EN GESTIÓN EFICIENTE DE LA ENERGÍA ELECTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4195, 'TECNOLOGÍA EN SUPERVISIÓN DE REDES DE DISTRIBUCIÓN DE ENERGÍA ELECTRICA', 'TECNOLOGÍA EN SUPERVISIÓN DE REDES DE DISTRIBUCIÓN DE ENERGÍA ELECTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4196, 'DIRECCIÓN TÉCNICA DE FÚTBOL', 'DIRECCIÓN TÉCNICA DE FÚTBOL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4197, 'TÉCNICA PROFESIÓNAL ASISTENTE ADMINISTRATIVO BILINGUE', 'TÉCNICA PROFESIÓNAL ASISTENTE ADMINISTRATIVO BILINGUE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4198, 'TÉCNICA PROFESIÓNAL DE OPERACIÓNES EN COMERCIO EXTERIOR', 'TÉCNICA PROFESIÓNAL DE OPERACIÓNES EN COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4199, 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS', 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4200, 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS PORTUARIOS', 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS PORTUARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4201, 'TÉCNICA PROFESIÓNAL EN ADMINISTRACIÓN DE EMPRESAS', 'TÉCNICA PROFESIÓNAL EN ADMINISTRACIÓN DE EMPRESAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4202, 'TÉCNICA PROFESIÓNAL EN ADMINISTRACIÓN DE PROCESOS MUNICIPALES', 'TÉCNICA PROFESIÓNAL EN ADMINISTRACIÓN DE PROCESOS MUNICIPALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4203, 'TÉCNICA PROFESIÓNAL EN ADMINISTRACIÓN Y PRODUCCIÓN AGROINDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN ADMINISTRACIÓN Y PRODUCCIÓN AGROINDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4204, 'TÉCNICA PROFESIÓNAL EN ARTE GRAFICO Y PUBLICITARIO', 'TÉCNICA PROFESIÓNAL EN ARTE GRAFICO Y PUBLICITARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4205, 'TÉCNICA PROFESIÓNAL EN BALISTICA', 'TÉCNICA PROFESIÓNAL EN BALISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4206, 'TÉCNICA PROFESIÓNAL EN COCINA', 'TÉCNICA PROFESIÓNAL EN COCINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4207, 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE OBRA', 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE OBRA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4208, 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE SOFWARE', 'TÉCNICA PROFESIÓNAL EN CONSTRUCCIÓN DE SOFWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4209, 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD SISTEMATIZADA', 'TÉCNICA PROFESIÓNAL EN CONTABILIDAD SISTEMATIZADA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4210, 'TÉCNICA PROFESIÓNAL EN CONTROL DE LA CALIDAD DE ALIMENTOS', 'TÉCNICA PROFESIÓNAL EN CONTROL DE LA CALIDAD DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4211, 'TÉCNICA PROFESIÓNAL EN COSMETOLOGÍA Y ESTETICA CORPORAL', 'TÉCNICA PROFESIÓNAL EN COSMETOLOGÍA Y ESTETICA CORPORAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4212, 'TÉCNICA PROFESIÓNAL EN COSTOS Y CONTABILIDAD', 'TÉCNICA PROFESIÓNAL EN COSTOS Y CONTABILIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4213, 'TÉCNICA PROFESIÓNAL EN DACTILOSCOPIA', 'TÉCNICA PROFESIÓNAL EN DACTILOSCOPIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4214, 'TÉCNICA PROFESIÓNAL EN DANZA CONTEMPORANEA CUERPO CREADOR', 'TÉCNICA PROFESIÓNAL EN DANZA CONTEMPORANEA CUERPO CREADOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4215, 'TÉCNICA PROFESIÓNAL EN DIBUJO ARQUITECTONICO Y DECORACIÓN', 'TÉCNICA PROFESIÓNAL EN DIBUJO ARQUITECTONICO Y DECORACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4216, 'TÉCNICA PROFESIÓNAL EN DIBUJO MECÁNICO Y DE HERRAMIENTAS INDUSTRIALES', 'TÉCNICA PROFESIÓNAL EN DIBUJO MECÁNICO Y DE HERRAMIENTAS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4217, 'TÉCNICA PROFESIÓNAL EN DISEÑO DE MODAS', 'TÉCNICA PROFESIÓNAL EN DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4218, 'TÉCNICA PROFESIÓNAL EN DISEÑO DE VESTUARIO Y PATRONAJE', 'TÉCNICA PROFESIÓNAL EN DISEÑO DE VESTUARIO Y PATRONAJE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4219, 'TÉCNICA PROFESIÓNAL EN DISEÑO DIGITAL', 'TÉCNICA PROFESIÓNAL EN DISEÑO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4220, 'TÉCNICA PROFESIÓNAL EN DISEÑO Y MANUFACTURA ASISTIDA POR COMPUTADOR', 'TÉCNICA PROFESIÓNAL EN DISEÑO Y MANUFACTURA ASISTIDA POR COMPUTADOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4221, 'TÉCNICA PROFESIÓNAL EN DOCUMENTOLOGÍA', 'TÉCNICA PROFESIÓNAL EN DOCUMENTOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4222, 'TÉCNICA PROFESIÓNAL EN ELECTROMEDICINA', 'TÉCNICA PROFESIÓNAL EN ELECTROMEDICINA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4223, 'TÉCNICA PROFESIÓNAL EN ELECTRÓNICA INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN ELECTRÓNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4224, 'TÉCNICA PROFESIÓNAL EN ENTRENAMIENTO DEPORTIVO', 'TÉCNICA PROFESIÓNAL EN ENTRENAMIENTO DEPORTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4225, 'TÉCNICA PROFESIÓNAL EN ESTETICA Y COSMETOLOGÍA', 'TÉCNICA PROFESIÓNAL EN ESTETICA Y COSMETOLOGÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4226, 'TÉCNICA PROFESIÓNAL EN EXPLOSIVOS', 'TÉCNICA PROFESIÓNAL EN EXPLOSIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4227, 'TÉCNICA PROFESIÓNAL EN EXPRESIÓN DIGITAL Y ADAPTACIÓN DE ESPACIOS', 'TÉCNICA PROFESIÓNAL EN EXPRESIÓN DIGITAL Y ADAPTACIÓN DE ESPACIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4228, 'TÉCNICA PROFESIÓNAL EN EXPRESIÓN PUBLICITARIA', 'TÉCNICA PROFESIÓNAL EN EXPRESIÓN PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4229, 'TÉCNICA PROFESIÓNAL EN FOTOGRAFIA', 'TÉCNICA PROFESIÓNAL EN FOTOGRAFIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4230, 'TÉCNICA PROFESIÓNAL EN FOTOGRAFIA E IMAGEN FORENSE', 'TÉCNICA PROFESIÓNAL EN FOTOGRAFIA E IMAGEN FORENSE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4231, 'TÉCNICA PROFESIÓNAL EN FOTOGRAFIA Y CAMAROGRAFIA', 'TÉCNICA PROFESIÓNAL EN FOTOGRAFIA Y CAMAROGRAFIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4232, 'TÉCNICA PROFESIÓNAL EN GESTIÓN ADUANERA Y ZONAS FRANCAS', 'TÉCNICA PROFESIÓNAL EN GESTIÓN ADUANERA Y ZONAS FRANCAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4233, 'TÉCNICA PROFESIÓNAL EN GESTIÓN AMBIENTAL', 'TÉCNICA PROFESIÓNAL EN GESTIÓN AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4234, 'TÉCNICA PROFESIÓNAL EN GESTIÓN COMERCIAL Y LOGÍSTICA', 'TÉCNICA PROFESIÓNAL EN GESTIÓN COMERCIAL Y LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4235, 'TÉCNICA PROFESIÓNAL EN GESTIÓN FINANCIERA', 'TÉCNICA PROFESIÓNAL EN GESTIÓN FINANCIERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4236, 'TÉCNICA PROFESIÓNAL EN HIGIENE Y SEGURIDAD EN EL TRABAJO', 'TÉCNICA PROFESIÓNAL EN HIGIENE Y SEGURIDAD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4237, 'TÉCNICA PROFESIÓNAL EN IDENTIFICACIÓN DE AUTOMOTORES', 'TÉCNICA PROFESIÓNAL EN IDENTIFICACIÓN DE AUTOMOTORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4238, 'TÉCNICA PROFESIÓNAL EN IMPLEMENTACIÓN DE SISTEMAS DE TELECOMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN IMPLEMENTACIÓN DE SISTEMAS DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4239, 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO DE REDES DE ENERGÍA ELECTRICA', 'TÉCNICA PROFESIÓNAL EN INSTALACIÓN Y MANTENIMIENTO DE REDES DE ENERGÍA ELECTRICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4240, 'TÉCNICA PROFESIÓNAL EN INSTRUMENTACIÓN INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN INSTRUMENTACIÓN INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4241, 'TÉCNICA PROFESIÓNAL EN INVESTIGACIÓN JUDICIAL', 'TÉCNICA PROFESIÓNAL EN INVESTIGACIÓN JUDICIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4242, 'TÉCNICA PROFESIÓNAL EN INVESTIGACIÓN Y SEGURIDAD', 'TÉCNICA PROFESIÓNAL EN INVESTIGACIÓN Y SEGURIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4243, 'TÉCNICA PROFESIÓNAL EN MANEJO DE LA PREVENCIÓN DE RIESGOS LABORALES', 'TÉCNICA PROFESIÓNAL EN MANEJO DE LA PREVENCIÓN DE RIESGOS LABORALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4244, 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURA', 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4245, 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDEUTICOS', 'TÉCNICA PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDEUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4246, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE INSTALACIÓNES ELECTRICAS INDUSTRIALES Y COMERCIALES', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO DE INSTALACIÓNES ELECTRICAS INDUSTRIALES Y COMERCIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4247, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4248, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO Y COMERCIALIZACIÓN DE EQUIPOS BIOMÉDICOS', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO Y COMERCIALIZACIÓN DE EQUIPOS BIOMÉDICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4249, 'TÉCNICA PROFESIÓNAL EN MEDIOS AUDIOVISUALES', 'TÉCNICA PROFESIÓNAL EN MEDIOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4250, 'TÉCNICA PROFESIÓNAL EN MERCADEO Y VENTAS', 'TÉCNICA PROFESIÓNAL EN MERCADEO Y VENTAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4251, 'TÉCNICA PROFESIÓNAL EN MESA Y BAR', 'TÉCNICA PROFESIÓNAL EN MESA Y BAR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4252, 'TÉCNICA PROFESIÓNAL EN MICROFUNDICIÓN DE METALES', 'TÉCNICA PROFESIÓNAL EN MICROFUNDICIÓN DE METALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4253, 'TÉCNICA PROFESIÓNAL EN MONITOREO AGRÍCOLA', 'TÉCNICA PROFESIÓNAL EN MONITOREO AGRÍCOLA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4254, 'TÉCNICA PROFESIÓNAL EN MONTAJE ESCÉNICO', 'TÉCNICA PROFESIÓNAL EN MONTAJE ESCÉNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4255, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PLATAFORMAS VIRTUALES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PLATAFORMAS VIRTUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4256, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS CONTABLES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS CONTABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4257, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS DE PRODUCCIÓN', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS DE PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4258, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS EMPRESARIALES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS EMPRESARIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4259, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS GASTRONOMICOS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS GASTRONOMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4260, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS INDUSTRIALES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4261, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SEGURIDAD MINERA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SEGURIDAD MINERA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4262, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS GASTRONOMICOS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE SERVICIOS GASTRONOMICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4263, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN TURÍSTICA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN TURÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4264, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES ADUANERAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES ADUANERAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4265, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES AGROINDUSTRIALES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES AGROINDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4266, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES CONTABLES', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES CONTABLES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4267, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES DE COMERCIO DIGITAL', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES DE COMERCIO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4268, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES DE COMERCIO EXTERIOR', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4269, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE LA SEGURIDAD SOCIAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE LA SEGURIDAD SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4270, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE TALENTO HUMANO', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE TALENTO HUMANO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4271, 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS PUBLICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS PUBLICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4272, 'TÉCNICA PROFESIÓNAL EN PROCESOS AMBIENTALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS AMBIENTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4273, 'TÉCNICA PROFESIÓNAL EN PROCESOS AUDIOVISUALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS AUDIOVISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4274, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE DESARROLLO DE PRODUCTO', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE DESARROLLO DE PRODUCTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4275, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE DISEÑO GRÁFICO', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE DISEÑO GRÁFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4276, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MANUFACTURA', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MANUFACTURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4277, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MERCADEO', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4278, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MERCADEO DIGITAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE MERCADEO DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4279, 'TÉCNICA PROFESIÓNAL EN PROCESOS EMPRESARIALES PARA MIPYMES', 'TÉCNICA PROFESIÓNAL EN PROCESOS EMPRESARIALES PARA MIPYMES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4280, 'TÉCNICA PROFESIÓNAL EN PROCESOS EMPRESARIALES RURALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS EMPRESARIALES RURALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4281, 'TÉCNICA PROFESIÓNAL EN PROCESOS EN MARKETING INTERNACIÓNAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS EN MARKETING INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4282, 'TÉCNICA PROFESIÓNAL EN PROCESOS FINANCIEROS', 'TÉCNICA PROFESIÓNAL EN PROCESOS FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4283, 'TÉCNICA PROFESIÓNAL EN PROCESOS GASTRONOMICOS Y DE BEBIDAS', 'TÉCNICA PROFESIÓNAL EN PROCESOS GASTRONOMICOS Y DE BEBIDAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4284, 'TÉCNICA PROFESIÓNAL EN PROCESOS GRÁFICOS DIGITALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS GRÁFICOS DIGITALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4285, 'TÉCNICA PROFESIÓNAL EN PROCESOS HOTELEROS Y TURÍSTICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS HOTELEROS Y TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4286, 'TÉCNICA PROFESIÓNAL EN PROCESOS INFORMÁTICOS', 'TÉCNICA PROFESIÓNAL EN PROCESOS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4287, 'TÉCNICA PROFESIÓNAL EN PROCESOS ORGANIZACIÓNALES', 'TÉCNICA PROFESIÓNAL EN PROCESOS ORGANIZACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4288, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE AUDIO Y VIDEO', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE AUDIO Y VIDEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4289, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE FRUTAS Y HORTALIZAS', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE FRUTAS Y HORTALIZAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4290, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE TELEVISIÓN', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4291, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE VESTUARIO', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN DE VESTUARIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4292, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN FORESTAL POR CICLOS PROPEDEUTICOS', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN FORESTAL POR CICLOS PROPEDEUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4293, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN PUBLICITARIA', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4294, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN PUBLICITARIA DIGITAL', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN PUBLICITARIA DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4295, 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN Y COMERCIALIZACIÓN DE LA MODA', 'TÉCNICA PROFESIÓNAL EN PRODUCCIÓN Y COMERCIALIZACIÓN DE LA MODA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4296, 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE COMPUTADORES', 'TÉCNICA PROFESIÓNAL EN PROGRAMACIÓN DE COMPUTADORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4297, 'TÉCNICA PROFESIÓNAL EN PROMOTORIA AMBIENTAL', 'TÉCNICA PROFESIÓNAL EN PROMOTORIA AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4298, 'TÉCNICA PROFESIÓNAL EN REALIZACIÓN Y PRODUCCIÓN EN TELEVISIÓN', 'TÉCNICA PROFESIÓNAL EN REALIZACIÓN Y PRODUCCIÓN EN TELEVISIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4299, 'TÉCNICA PROFESIÓNAL EN SECRETARIADO EJECUTIVO', 'TÉCNICA PROFESIÓNAL EN SECRETARIADO EJECUTIVO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4300, 'TÉCNICA PROFESIÓNAL EN SECRETARIADO EJECUTIVO SISTEMATIZADO', 'TÉCNICA PROFESIÓNAL EN SECRETARIADO EJECUTIVO SISTEMATIZADO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4301, 'TÉCNICA PROFESIÓNAL EN SEGURIDAD E HIGIENE INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN SEGURIDAD E HIGIENE INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4302, 'TÉCNICA PROFESIÓNAL EN SEGURIDAD Y SALUD EN EL TRABAJO', 'TÉCNICA PROFESIÓNAL EN SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4303, 'TÉCNICA PROFESIÓNAL EN SERVICIOS ADMINISTRATIVOS DE SALUD', 'TÉCNICA PROFESIÓNAL EN SERVICIOS ADMINISTRATIVOS DE SALUD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4304, 'TÉCNICA PROFESIÓNAL EN SERVICIOS FINANCIEROS', 'TÉCNICA PROFESIÓNAL EN SERVICIOS FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4305, 'TÉCNICA PROFESIÓNAL EN SERVICIOS TURÍSTICOS Y HOTELEROS', 'TÉCNICA PROFESIÓNAL EN SERVICIOS TURÍSTICOS Y HOTELEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4306, 'TÉCNICA PROFESIÓNAL EN SISTEMAS', 'TÉCNICA PROFESIÓNAL EN SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4307, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE HARDWARE Y SOFTWARE', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE HARDWARE Y SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4308, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS INFORMÁTICOS', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4309, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS INFORMÁTICOS Y DE COMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE SISTEMAS INFORMÁTICOS Y DE COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4310, 'TÉCNICA PROFESIÓNAL EN SOPORTE DE TELECOMUNICACIÓNES', 'TÉCNICA PROFESIÓNAL EN SOPORTE DE TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4311, 'TÉCNICA PROFESIÓNAL EN TANATOPRAXIA', 'TÉCNICA PROFESIÓNAL EN TANATOPRAXIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4312, 'TÉCNICA PROFESIÓNAL EN TÉCNICAS ARTISTICAS', 'TÉCNICA PROFESIÓNAL EN TÉCNICAS ARTISTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4313, 'TÉCNICA PROFESIÓNAL EN TECNOLOGÍA DE PLASTICOS', 'TÉCNICA PROFESIÓNAL EN TECNOLOGÍA DE PLASTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4314, 'TÉCNICA PROFESIÓNAL EN TOPOGRAFIA FORENSE', 'TÉCNICA PROFESIÓNAL EN TOPOGRAFIA FORENSE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4315, 'TÉCNICA PROFESIÓNAL EN TURISMO', 'TÉCNICA PROFESIÓNAL EN TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4316, 'TECNOLOGÍA EN GASTRONOMÍA', 'TECNOLOGÍA EN GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4317, 'TÉCNICO PROFESIÓNAL EN  PASTELERÍA Y  PANADERÍA', 'TÉCNICO PROFESIÓNAL EN  PASTELERÍA Y  PANADERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4318, 'TÉCNICO PROFESIÓNAL EN ACTUACIÓN PARA LAS PRACTICAS ESCÉNICAS TEATRALES', 'TÉCNICO PROFESIÓNAL EN ACTUACIÓN PARA LAS PRACTICAS ESCÉNICAS TEATRALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4319, 'TÉCNICO PROFESIÓNAL EN ATENCIÓN Y CUIDADO A LA PRIMERA INFANCIA', 'TÉCNICO PROFESIÓNAL EN ATENCIÓN Y CUIDADO A LA PRIMERA INFANCIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4320, 'TÉCNICO PROFESIÓNAL EN COMERCIO EXTERIOR Y NEGOCIOS INTERNACIÓNALES', 'TÉCNICO PROFESIÓNAL EN COMERCIO EXTERIOR Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4321, 'TÉCNICO PROFESIÓNAL EN COMERCIO Y NEGOCIOS INTERNACIÓNALES', 'TÉCNICO PROFESIÓNAL EN COMERCIO Y NEGOCIOS INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4322, 'TÉCNICO PROFESIÓNAL EN CONTABILIDAD Y COSTOS', 'TÉCNICO PROFESIÓNAL EN CONTABILIDAD Y COSTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4323, 'TÉCNICO PROFESIÓNAL EN CONTROL AMBIENTAL', 'TÉCNICO PROFESIÓNAL EN CONTROL AMBIENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4324, 'TÉCNICO PROFESIÓNAL EN CONTROL INDUSTRIAL', 'TÉCNICO PROFESIÓNAL EN CONTROL INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4325, 'TÉCNICO PROFESIÓNAL EN COSTOS Y CONTABILIDAD', 'TÉCNICO PROFESIÓNAL EN COSTOS Y CONTABILIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4326, 'TÉCNICO PROFESIÓNAL EN CRIMINALISTICA', 'TÉCNICO PROFESIÓNAL EN CRIMINALISTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4327, 'TÉCNICO PROFESIÓNAL EN DISEÑO DE MODAS', 'TÉCNICO PROFESIÓNAL EN DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4328, 'TÉCNICO PROFESIÓNAL EN DISEÑO GRAFICO', 'TÉCNICO PROFESIÓNAL EN DISEÑO GRAFICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4329, 'TÉCNICO PROFESIÓNAL EN EL MANTENIMIENTO Y OPERACIÓN DE ARMAS BASICAS DE INFANTERIA', 'TÉCNICO PROFESIÓNAL EN EL MANTENIMIENTO Y OPERACIÓN DE ARMAS BASICAS DE INFANTERIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4330, 'TÉCNICO PROFESIÓNAL EN FORMULACIÓN E IMPLEMENTACIÓN DE PROYECTOS AGROPECUARIOS', 'TÉCNICO PROFESIÓNAL EN FORMULACIÓN E IMPLEMENTACIÓN DE PROYECTOS AGROPECUARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4331, 'TÉCNICO PROFESIÓNAL EN GASTRONOMÍA', 'TÉCNICO PROFESIÓNAL EN GASTRONOMÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4332, 'TÉCNICO PROFESIÓNAL EN GESTIÓN DOCUMENTAL', 'TÉCNICO PROFESIÓNAL EN GESTIÓN DOCUMENTAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4333, 'TÉCNICO PROFESIÓNAL EN LABORATORIO', 'TÉCNICO PROFESIÓNAL EN LABORATORIO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4334, 'TÉCNICO PROFESIÓNAL EN LOGÍSTICA', 'TÉCNICO PROFESIÓNAL EN LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4335, 'TÉCNICO PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDEUTICOS', 'TÉCNICO PROFESIÓNAL EN MANEJO SILVICULTURAL POR CICLOS PROPEDEUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4336, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS INFORMÁTICOS', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS INFORMÁTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4337, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS MECATRÓNICOS', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO DE SISTEMAS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4338, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO Y CONFIGURACIÓN DE REDES DE COMUNICACIÓN', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO Y CONFIGURACIÓN DE REDES DE COMUNICACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4339, 'TÉCNICO PROFESIÓNAL EN MECÁNICA DIESEL', 'TÉCNICO PROFESIÓNAL EN MECÁNICA DIESEL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4340, 'TÉCNICO PROFESIÓNAL EN MERCADEO', 'TÉCNICO PROFESIÓNAL EN MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4341, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE COCINA Y RESTAURACIÓN', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE COCINA Y RESTAURACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4342, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE MAQUINAS Y HERRAMIENTAS ASOCIADAS A   MINERÍA', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE MAQUINAS Y HERRAMIENTAS ASOCIADAS A   MINERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4343, 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SERVICIOS TURÍSTICOS', 'TÉCNICO PROFESIÓNAL EN OPERACIÓN DE SERVICIOS TURÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4344, 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES PORTUARIAS', 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES PORTUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4345, 'TÉCNICO PROFESIÓNAL EN PREVENCIÓN Y REHABILITACIÓN', 'TÉCNICO PROFESIÓNAL EN PREVENCIÓN Y REHABILITACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4346, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE DISEÑO DE MODAS', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE DISEÑO DE MODAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4347, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE OBRAS DE CONSTRUCCIÓN', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE OBRAS DE CONSTRUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4348, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE SEGURIDAD Y SALUD EN EL TRABAJO', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS DE SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4349, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS TURISTICOS', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS TURISTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4350, 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS Y FINANCIEROS', 'TÉCNICO PROFESIÓNAL EN PROCESOS ADMINISTRATIVOS Y FINANCIEROS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4351, 'TÉCNICO PROFESIÓNAL EN PROCESOS AGROFORESTALES', 'TÉCNICO PROFESIÓNAL EN PROCESOS AGROFORESTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4352, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE IMPORTACIÓNES Y EXPORTACIÓNES', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE IMPORTACIÓNES Y EXPORTACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4353, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE LA SEGURIDAD Y SALUD EN EL TRABAJO', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE LA SEGURIDAD Y SALUD EN EL TRABAJO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4354, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE MERCADEO', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4355, 'TÉCNICO PROFESIÓNAL EN PROCESOS DE SOLDADURA', 'TÉCNICO PROFESIÓNAL EN PROCESOS DE SOLDADURA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4356, 'TÉCNICO PROFESIÓNAL EN PROCESOS VIALES Y DE TRANSPORTE', 'TÉCNICO PROFESIÓNAL EN PROCESOS VIALES Y DE TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4404, 'INGENIERÍA EN LOGÍSTICA Y OPERACIÓNES', 'INGENIERÍA EN LOGÍSTICA Y OPERACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4357, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGROINDUSTRIAL DE ALIMENTOS', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN AGROINDUSTRIAL DE ALIMENTOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4358, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN EN DISEÑO DE INTERIORES', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN EN DISEÑO DE INTERIORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4359, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN EN DISEÑO INDUSTRIAL', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN EN DISEÑO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4360, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN EN PUBLICIDAD', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN EN PUBLICIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4361, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN MULTIMEDIAL', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN MULTIMEDIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4362, 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE COMPUTADORES', 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN DE COMPUTADORES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4363, 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN WEB', 'TÉCNICO PROFESIÓNAL EN PROGRAMACIÓN WEB', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4364, 'TÉCNICO PROFESIÓNAL EN REGISTRO Y CONTROL DE PROCESOS PRODUCTIVOS', 'TÉCNICO PROFESIÓNAL EN REGISTRO Y CONTROL DE PROCESOS PRODUCTIVOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4365, 'TÉCNICO PROFESIÓNAL EN SALUD ORAL', 'TÉCNICO PROFESIÓNAL EN SALUD ORAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4366, 'TÉCNICO PROFESIÓNAL EN SEGURIDAD INDUSTRIAL', 'TÉCNICO PROFESIÓNAL EN SEGURIDAD INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4367, 'TÉCNICO PROFESIÓNAL EN SERVICIO DE POLICIA', 'TÉCNICO PROFESIÓNAL EN SERVICIO DE POLICIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4368, 'TÉCNICO PROFESIÓNAL EN SISTEMAS', 'TÉCNICO PROFESIÓNAL EN SISTEMAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4369, 'TÉCNICO PROFESIÓNAL EN SISTEMAS DE COMPUTO', 'TÉCNICO PROFESIÓNAL EN SISTEMAS DE COMPUTO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4370, 'GERENCIA DE LA SEGURIDAD Y ANÁLISIS SOCIO POLITICO', 'GERENCIA DE LA SEGURIDAD Y ANÁLISIS SOCIO POLITICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4371, 'TECNOLOGÍA EN ADMINISTRACIÓN Y ANÁLISIS DE LA SEGURIDAD', 'TECNOLOGÍA EN ADMINISTRACIÓN Y ANÁLISIS DE LA SEGURIDAD', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4372, 'TECNOLOGÍA EN ANÁLISIS AMBIENTALES', 'TECNOLOGÍA EN ANÁLISIS AMBIENTALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4373, 'TECNOLOGÍA EN ANÁLISIS Y LABORATORIO QUIMICO', 'TECNOLOGÍA EN ANÁLISIS Y LABORATORIO QUIMICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4374, 'TECNOLOGÍA EN ANÁLISIS Y PROGRAMACIÓN DE SISTEMAS DE INFORMACIÓN', 'TECNOLOGÍA EN ANÁLISIS Y PROGRAMACIÓN DE SISTEMAS DE INFORMACIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4375, 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y ANÁLISIS DE MERCADOS', 'TECNOLOGÍA EN GESTIÓN COMERCIAL Y ANÁLISIS DE MERCADOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4376, 'TECNOLOGÍA EN GESTIÓN DE AGRONEGOCIOS', 'TECNOLOGÍA EN GESTIÓN DE AGRONEGOCIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4377, 'TECNOLOGÍA AGROINDUSTRIAL (POR CICLOS PROPEDEUTICOS)', 'TECNOLOGÍA AGROINDUSTRIAL (POR CICLOS PROPEDEUTICOS)', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4378, 'LICENCIATURA EN ELECTRÓNICA', 'LICENCIATURA EN ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4379, 'TÉCNICA PROFESIÓNAL EN ELECTRÓNICA', 'TÉCNICA PROFESIÓNAL EN ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4380, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE ELECTRÓNICA INDUSTRIAL', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE ELECTRÓNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4381, 'TECNOLOGÍA ELECTRÓNICA', 'TECNOLOGÍA ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4382, 'TECNOLOGÍA EN BIOELECTRÓNICA', 'TECNOLOGÍA EN BIOELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4383, 'TECNOLOGÍA EN ELECTRÓNICA', 'TECNOLOGÍA EN ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4384, 'TECNOLOGÍA EN ELECTRÓNICA AERONAÚTICA', 'TECNOLOGÍA EN ELECTRÓNICA AERONAÚTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4385, 'TECNOLOGÍA EN ELECTRÓNICA Y COMUNICACIÓNES', 'TECNOLOGÍA EN ELECTRÓNICA Y COMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4386, 'TECNOLOGÍA EN ELECTRÓNICA Y CONTROLES INDUSTRIALES', 'TECNOLOGÍA EN ELECTRÓNICA Y CONTROLES INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4387, 'TECNOLOGÍA EN ELECTRÓNICA Y TELECOMUNICACIÓNES', 'TECNOLOGÍA EN ELECTRÓNICA Y TELECOMUNICACIÓNES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4388, 'TECNOLOGÍA EN INSTRUMENTACIÓN ELECTRÓNICA', 'TECNOLOGÍA EN INSTRUMENTACIÓN ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4389, 'TECNOLOGÍA NAVAL EN ELECTRÓNICA', 'TECNOLOGÍA NAVAL EN ELECTRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4390, 'TECNOLOGÍA EN DESARROLLLO DE SISTEMAS DE INFORMACIÓN Y DE SOFTWARE', 'TECNOLOGÍA EN DESARROLLLO DE SISTEMAS DE INFORMACIÓN Y DE SOFTWARE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4391, 'TECNOLOGÍA EN FABRICACIÓN DE PRODUCTOS PLASTICOS POR INYECCIÓN Y SOPLADO', 'TECNOLOGÍA EN FABRICACIÓN DE PRODUCTOS PLASTICOS POR INYECCIÓN Y SOPLADO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4392, 'TECNOLOGÍA EN GESTIÓN Y PRODUCCIÓN CREATIVA PARA LAS PRÁCTICAS VISUALES', 'TECNOLOGÍA EN GESTIÓN Y PRODUCCIÓN CREATIVA PARA LAS PRÁCTICAS VISUALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4393, 'TECNOLOGÍA EN LOGÍSTICA DEL TRANSPORTE INTERNACIÓNAL DE MERCANCÍAS', 'TECNOLOGÍA EN LOGÍSTICA DEL TRANSPORTE INTERNACIÓNAL DE MERCANCÍAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4394, 'TÉCNICA PROFESIÓNAL EN PROCESOS LOGÍSTICOS Y DE COMERCIO EXTERIOR', 'TÉCNICA PROFESIÓNAL EN PROCESOS LOGÍSTICOS Y DE COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4395, 'TÉCNICO PROFESIÓNAL EN PROCESOS LOGÍSTICOS', 'TÉCNICO PROFESIÓNAL EN PROCESOS LOGÍSTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4396, 'TECNOLOGÍA EN RIEGO DRENAJE Y MANEJO DE SUELOS AGRÍCOLAS', 'TECNOLOGÍA EN RIEGO DRENAJE Y MANEJO DE SUELOS AGRÍCOLAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4397, 'TECNOLOGÍA EN GESTIÓN DÉ PROYECTOS DE DESARROLLO ECONÓMICO Y SOCIAL', 'TECNOLOGÍA EN GESTIÓN DÉ PROYECTOS DE DESARROLLO ECONÓMICO Y SOCIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4398, 'TECNOLOGÍA EN CREACIÓN DE CONTENIDOS VISUALES Y MULTIMEDIALES', 'TECNOLOGÍA EN CREACIÓN DE CONTENIDOS VISUALES Y MULTIMEDIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4399, 'TECNOLOGÍA EN INSTRUMENTACIÒN ELECTRÒNICA', 'TECNOLOGÍA EN INSTRUMENTACIÒN ELECTRÒNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4400, 'TECNOLOGÍA EN TRÀNSITO, TRANSPORTE TERRESTRE Y SEGURIDAD VIAL', 'TECNOLOGÍA EN TRÀNSITO, TRANSPORTE TERRESTRE Y SEGURIDAD VIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4401, 'ADMINISTRACIÓN DE LA CADENA DE SUMINISTRO Y LOGÍSTICA', 'ADMINISTRACIÓN DE LA CADENA DE SUMINISTRO Y LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4402, 'ADMINISTRACIÓN DE MERCADEO Y LOGÍSTICA INTERNACIÓNALES', 'ADMINISTRACIÓN DE MERCADEO Y LOGÍSTICA INTERNACIÓNALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4403, 'ADMINISTRACIÓN EN LOGÍSTICA Y PRODUCCIÓN', 'ADMINISTRACIÓN EN LOGÍSTICA Y PRODUCCIÓN', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4406, 'MARKETING Y LOGÍSTICA', 'MARKETING Y LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4407, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES DE LA CADENA LOGÍSTICA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES DE LA CADENA LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4408, 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES LOGÍSTICAS Y PORTUARIAS', 'TÉCNICA PROFESIÓNAL EN OPERACIÓNES LOGÍSTICAS Y PORTUARIAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4409, 'TÉCNICA PROFESIÓNAL EN PROCESOS DE COMERCIO EXTERIOR Y LOGÍSTICA', 'TÉCNICA PROFESIÓNAL EN PROCESOS DE COMERCIO EXTERIOR Y LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4410, 'TÉCNICO PROFESIÓNAL EN LOGÍSTICA EMPRESARIAL', 'TÉCNICO PROFESIÓNAL EN LOGÍSTICA EMPRESARIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4411, 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES LOGÍSTICAS', 'TÉCNICO PROFESIÓNAL EN OPERACIÓNES LOGÍSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4412, 'TECNOLOGÍA EN GESTIÓN DE COMERCIO EXTERIOR Y LOGÍSTICA', 'TECNOLOGÍA EN GESTIÓN DE COMERCIO EXTERIOR Y LOGÍSTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4413, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA DEL COMERCIO EXTERIOR', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA DEL COMERCIO EXTERIOR', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4414, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA EN COMPRAS E INVENTARIOS', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA EN COMPRAS E INVENTARIOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4415, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA Y DE COMERCIO INTERNACIÓNAL', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA Y DE COMERCIO INTERNACIÓNAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4416, 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA Y PORTUARIA', 'TECNOLOGÍA EN GESTIÓN LOGÍSTICA Y PORTUARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4417, 'TECNOLOGÍA EN LOGÍSTICA INTEGRAL', 'TECNOLOGÍA EN LOGÍSTICA INTEGRAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4418, 'TECNOLOGÍA EN LOGÍSTICA PORTUARIA Y DEL TRANSPORTE', 'TECNOLOGÍA EN LOGÍSTICA PORTUARIA Y DEL TRANSPORTE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4419, 'TECNOLOGÍA EN LOGÍSTICA Y MERCADEO', 'TECNOLOGÍA EN LOGÍSTICA Y MERCADEO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4420, 'TECNOLOGÍA EN IMPLEMENTACIÓN Y MANTENIMIENTO DE SISTEMAS DE INSTRUMENTACIÓN Y CONTROL DE PROCESOS INDUSTRIALES', 'TECNOLOGÍA EN IMPLEMENTACIÓN Y MANTENIMIENTO DE SISTEMAS DE INSTRUMENTACIÓN Y CONTROL DE PROCESOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4421, 'TECNOLOGÍA EN ABASTECIMIENTOS AERONÁUTICOS', 'TECNOLOGÍA EN ABASTECIMIENTOS AERONÁUTICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4422, 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO AERONÁUTICO', 'TECNOLOGÍA EN GESTIÓN DEL MANTENIMIENTO AERONÁUTICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4423, 'TÉCNICA PROFESIÓNAL EN MINERÍA SOSTENIBLE', 'TÉCNICA PROFESIÓNAL EN MINERÍA SOSTENIBLE', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4424, 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE MAQUINAS Y HERRAMIENTAS ASOCIADAS A MINERÍA', 'TÉCNICA PROFESIÓNAL EN OPERACIÓN DE MAQUINAS Y HERRAMIENTAS ASOCIADAS A MINERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4425, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO ELECTROMECÁNICO', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO ELECTROMECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4426, 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO MECÁNICO APLICADO A LA OPERACIÓN DE ARMAS DE ARTILLERÍA', 'TÉCNICA PROFESIÓNAL EN MANTENIMIENTO MECÁNICO APLICADO A LA OPERACIÓN DE ARMAS DE ARTILLERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4427, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO MECÁNICO', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO MECÁNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4428, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS ELECTROMECÁNICOS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS ELECTROMECÁNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4429, 'TECNOLOGÍA EN MANTENIMIENTO DE SISTEMAS ELECTROMECÁNICOS', 'TECNOLOGÍA EN MANTENIMIENTO DE SISTEMAS ELECTROMECÁNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4430, 'TECNOLOGÍA EN MANTENIMIENTO ELECTROMECÁNICO DE EQUIPO PESADO', 'TECNOLOGÍA EN MANTENIMIENTO ELECTROMECÁNICO DE EQUIPO PESADO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4431, 'TECNOLOGÍA EN MANTENIMIENTO MECÁNICO INSUSTRIAL', 'TECNOLOGÍA EN MANTENIMIENTO MECÁNICO INSUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4432, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4433, 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO INDUSTRIAL', 'TÉCNICO PROFESIÓNAL EN MANTENIMIENTO ELECTRÓNICO INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4434, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS ELECTRÓNICOS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS ELECTRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4435, 'COMUNICACIÓN GRAFÍCA PUBLICITARIA', 'COMUNICACIÓN GRAFÍCA PUBLICITARIA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4436, 'DANZA Y DIRECCIÓN COREOGRAFÍCA', 'DANZA Y DIRECCIÓN COREOGRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4437, 'DISEÑO DE COMUNICACIÓN GRAFÍCA', 'DISEÑO DE COMUNICACIÓN GRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4438, 'INGENIERÍA TOPOGRAFÍCA', 'INGENIERÍA TOPOGRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4439, 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN GRAFÍCA', 'TÉCNICO PROFESIÓNAL EN PRODUCCIÓN GRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4440, 'TECNOLOGÍA EN COMUNICACIÓN GRAFÍCA', 'TECNOLOGÍA EN COMUNICACIÓN GRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4441, 'TECNOLOGÍA EN GEORREFERENCIACIÓN TOPOGRAFÍCA', 'TECNOLOGÍA EN GEORREFERENCIACIÓN TOPOGRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4442, 'TECNOLOGÍA EN MODELADO Y ANIMACIÓN GRAFÍCA', 'TECNOLOGÍA EN MODELADO Y ANIMACIÓN GRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4443, 'TECNOLOGÍA EN PRODUCCIÓN DE VIDEO Y ANIMACIÓN GRAFÍCA', 'TECNOLOGÍA EN PRODUCCIÓN DE VIDEO Y ANIMACIÓN GRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4444, 'TECNOLOGÍA EN PRODUCCIÓN FOTOGRAFÍCA', 'TECNOLOGÍA EN PRODUCCIÓN FOTOGRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4445, 'TECNOLOGÍA EN PRODUCCIÓN GRAFÍCA', 'TECNOLOGÍA EN PRODUCCIÓN GRAFÍCA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4446, 'TECNOLOGÍA EN PRODUCCIÓN GRAFÍCA DIGITAL', 'TECNOLOGÍA EN PRODUCCIÓN GRAFÍCA DIGITAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4447, 'TECNOLOGÍA EN RADIOLOGÍA E IMÁGENES DIAGNOSTICAS', 'TECNOLOGÍA EN RADIOLOGÍA E IMÁGENES DIAGNOSTICAS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4448, 'TECNOLOGÍA EN GESTIÓN DE AUTOMATISMOS MECATRÓNICOS', 'TECNOLOGÍA EN GESTIÓN DE AUTOMATISMOS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4449, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS MECATRÓNICOS', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS MECATRÓNICOS', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4450, 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS MECATRÓNICOS INDUSTRIALES', 'TECNOLOGÍA EN GESTIÓN DE SISTEMAS MECATRÓNICOS INDUSTRIALES', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4451, 'TÉCNICO PROFESIÓNAL EN TELEMÁTICA', 'TÉCNICO PROFESIÓNAL EN TELEMÁTICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4452, 'ADMINISTRACIÓN DE HOTELERÍA Y TURÍSMO', 'ADMINISTRACIÓN DE HOTELERÍA Y TURÍSMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4453, 'HOTELERÍA Y TURISMO ECOLOGICO', 'HOTELERÍA Y TURISMO ECOLOGICO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4454, 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS EN HOTELERÍA Y TURISMO', 'TÉCNICA PROFESIÓNAL DE PROCESOS ADMINISTRATIVOS EN HOTELERÍA Y TURISMO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4455, 'TÉCNICA PROFESIÓNAL EN HOTELERÍA', 'TÉCNICA PROFESIÓNAL EN HOTELERÍA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4456, 'TECNOLOGÍA EN CRIMINALÍSTICA DE CAMPO', 'TECNOLOGÍA EN CRIMINALÍSTICA DE CAMPO', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4457, 'INGENIERÍA EN MECATRÓNICA', 'INGENIERÍA EN MECATRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4458, 'TECNOLOGÍA EN MECATRÓNICA INDUSTRIAL', 'TECNOLOGÍA EN MECATRÓNICA INDUSTRIAL', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4459, 'TECNOLOGÍA EN PROCESOS INDUSTRIALES DE MECATRÓNICA', 'TECNOLOGÍA EN PROCESOS INDUSTRIALES DE MECATRÓNICA', NULL, true, NULL, '2022-10-14 12:58:30.630317', '2022-10-14 12:58:30.630317', 60, NULL);
INSERT INTO parametros.parametro VALUES (4462, 'PRUEBA PROGRAMA NUEVO 1', 'PRUEBA PROGRAMA NUEVO 1', '', true, 0.00, '2022-10-25 06:23:44.029999', '2022-10-25 06:23:44.030134', 60, NULL);
INSERT INTO parametros.parametro VALUES (4463, 'PRUEBA PROGRAMA 2', 'PRUEBA PROGRAMA 2', '', true, 0.00, '2022-10-25 06:51:16.09015', '2022-10-25 06:51:16.090249', 60, NULL);
INSERT INTO parametros.parametro VALUES (4464, 'PRUEBA PROGRAMA 2', 'PRUEBA PROGRAMA 2', '', true, 0.00, '2022-10-25 06:51:33.030888', '2022-10-25 06:51:33.030995', 60, NULL);
INSERT INTO parametros.parametro VALUES (4465, 'PRUEBA PROGRAMA 4', 'PRUEBA PROGRAMA 4', '', true, 0.00, '2022-10-25 06:53:25.035518', '2022-10-25 06:53:25.035652', 60, NULL);
INSERT INTO parametros.parametro VALUES (4466, 'PROGRAMA PRUBA 6', 'PROGRAMA PRUBA 6', '', true, 0.00, '2022-10-25 06:57:11.298396', '2022-10-25 06:57:11.298489', 60, NULL);
INSERT INTO parametros.parametro VALUES (4467, 'TEST 10', 'TEST 10', '', true, 0.00, '2022-10-25 06:59:17.324095', '2022-10-25 06:59:17.324191', 60, NULL);
INSERT INTO parametros.parametro VALUES (4468, 'PROGRAMA 10', 'PROGRAMA 10', '', true, 0.00, '2022-10-25 07:11:38.507545', '2022-10-25 07:11:38.507642', 60, NULL);
INSERT INTO parametros.parametro VALUES (4469, 'TESTING 14', 'TESTING 14', '', true, 0.00, '2022-10-25 07:14:45.244375', '2022-10-25 07:14:45.244474', 60, NULL);
INSERT INTO parametros.parametro VALUES (4461, 'IDEXUD', 'IDEXUD', 'IDEXUD', true, 0.00, '2022-10-23 22:27:29.552138', '2022-10-23 22:27:29.552244', 61, NULL);
INSERT INTO parametros.parametro VALUES (4460, 'Universidad Distrital Francisco José de Caldas', 'Universidad Distrital Francisco José de Caldas', 'UD', true, 0.00, '2022-10-23 22:27:14.679766', '2022-10-23 22:27:14.679864', 61, NULL);
INSERT INTO parametros.parametro VALUES (4470, 'Rectoría', 'Rectoría', 'RECTORIA', true, 0.00, '2022-11-01 18:12:04.150248', '2022-11-01 18:12:04.150368', 63, NULL);
INSERT INTO parametros.parametro VALUES (4471, 'Consejo superior universitario', 'Consejo superior universitario', 'CSU', true, 0.00, '2022-11-01 18:13:54.525553', '2022-11-01 18:13:54.525656', 63, NULL);
INSERT INTO parametros.parametro VALUES (4472, 'Consejo académico', 'Consejo académico', 'CAC', true, 0.00, '2022-11-01 18:15:08.7593', '2022-11-01 18:15:08.759397', 63, NULL);
INSERT INTO parametros.parametro VALUES (4473, 'Consejo electoral', 'Consejo electoral', 'CAC', true, 0.00, '2022-11-01 18:15:41.924428', '2022-11-01 18:15:41.924527', 63, NULL);
INSERT INTO parametros.parametro VALUES (4474, 'Consejo de participación universitaria', 'Consejo de participación universitaria', 'CPU', true, 0.00, '2022-11-01 18:18:11.257454', '2022-11-01 18:18:11.257551', 63, NULL);
INSERT INTO parametros.parametro VALUES (4476, 'Secretaría general', 'Secretaría general', 'SGR', true, 0.00, '2022-11-01 18:18:59.772518', '2022-11-01 18:18:59.772617', 63, NULL);
INSERT INTO parametros.parametro VALUES (4477, 'Consejo de gestión', 'Consejo de gestión', 'CSG', true, 0.00, '2022-11-01 18:19:19.106936', '2022-11-01 18:19:19.107061', 63, NULL);
INSERT INTO parametros.parametro VALUES (4478, 'Comité de inventarios', 'Comité de Inventarios', 'CDI', true, 0.00, '2022-11-01 18:20:51.589894', '2022-11-01 18:20:51.589993', 63, NULL);
INSERT INTO parametros.parametro VALUES (4479, 'POSGRADO HCP 14', 'POSGRADO HCP 14', 'RTP', true, 0.00, '2022-11-02 18:37:31.520186', '2022-11-02 18:37:31.520272', 39, 583);
INSERT INTO parametros.parametro VALUES (4480, 'POSGRADO HCP 14', 'POSGRADO HCP 14', 'RTP', true, 0.00, '2022-11-10 15:17:40.930727', '2022-11-10 15:17:40.930861', 39, 585);
INSERT INTO parametros.parametro VALUES (4481, 'POSGRADO HCP 14', 'POSGRADO HCP 14', 'RTP', true, 0.00, '2022-11-21 16:40:39.136542', '2022-11-21 16:40:39.13662', 39, 584);
INSERT INTO parametros.parametro VALUES (4482, 'POSGRADO HCP 14', 'POSGRADO HCP 14', 'RTP', true, 0.00, '2022-11-21 16:51:21.492572', '2022-11-21 16:51:21.492667', 39, 586);
INSERT INTO parametros.parametro VALUES (4483, 'HORAS LECTIVAS', 'Item que describe las horas lectivas del docente', 'HL', true, 0.00, '2022-11-23 14:43:16.038841', '2022-11-23 14:43:16.038841', 64, NULL);
INSERT INTO parametros.parametro VALUES (4484, 'INVESTIGACIÓN', 'Item que describe la investigación del docente', 'IN', true, 0.00, '2022-11-23 14:59:28.697234', '2022-11-23 14:59:28.697234', 64, NULL);
INSERT INTO parametros.parametro VALUES (4485, 'EXTENSIÓN', 'Item que describe las actividades de extensión que realiza el docente', 'EX', true, 0.00, '2022-11-23 15:00:32.425764', '2022-11-23 15:00:32.425764', 64, NULL);
INSERT INTO parametros.parametro VALUES (4486, 'PUBLICACIONES', 'Item que describe las publicaciones realizadas por el docente', 'PUB', true, 0.00, '2022-11-23 15:01:46.350075', '2022-11-23 15:01:46.350075', 64, NULL);
INSERT INTO parametros.parametro VALUES (4487, 'OTRAS ACTIVIDADES ASIGNADAS POR EL COORDINADOR', 'Item que describe actividades asignadas al docente por el coordinador', 'OTAC', true, 0.00, '2022-11-23 15:02:52.472123', '2022-11-23 15:02:52.472123', 64, NULL);
INSERT INTO parametros.parametro VALUES (4488, 'OTRAS', 'Item que describe incapacidades u otro documento que considere pertinente el docente', 'OTRAS', true, 0.00, '2022-11-23 15:03:31.889002', '2022-11-23 15:03:31.889002', 64, NULL);
INSERT INTO parametros.parametro VALUES (4489, 'INFORME DE GESTIÓN', 'Item que describe el soporte de informe de gestión del contratista', 'INF', true, 0.00, '2022-11-23 15:04:15.681041', '2022-11-23 15:04:15.681041', 64, NULL);
INSERT INTO parametros.parametro VALUES (4490, 'SALUD Y PENSIÓN', 'Item que describe el soporte de pago de salud y pensión del contratista', 'SYP', true, 0.00, '2022-11-23 15:05:12.244108', '2022-11-23 15:05:12.244108', 64, NULL);
INSERT INTO parametros.parametro VALUES (4491, 'CERTIFICACIÓN DE CUMPLIMIENTO', 'Item que describe el soporte de cumplido del contratista', 'CUM', true, 0.00, '2022-11-23 15:05:49.785555', '2022-11-23 15:05:49.785555', 64, NULL);
INSERT INTO parametros.parametro VALUES (4492, 'INFORME DE GESTIÓN Y CERTIFICADO DE CUMPLIMIENTO', 'Item que describe el soporte de informe de gestión y certificado de cumplimiento del contratista', 'IGYCC', true, 0.00, '2022-11-23 15:06:55.004672', '2022-11-23 15:06:55.004672', 64, NULL);
INSERT INTO parametros.parametro VALUES (4505, 'POSGRADO HCH 14', 'POSGRADO HCH 14', 'RTP', true, 0.00, '2022-11-24 09:32:25.618225', '2022-11-24 09:32:25.618304', 39, 586);
INSERT INTO parametros.parametro VALUES (4506, 'PREGRADO HCH 17', 'PREGRADO HCH 17', 'RTP', true, 0.00, '2022-11-25 11:11:34.769005', '2022-11-25 11:11:34.769104', 39, 586);
INSERT INTO parametros.parametro VALUES (4507, 'PREGRADO HCP 35', 'PREGRADO HCP 35', 'RTP', true, 0.00, '2022-12-15 12:15:19.552087', '2022-12-15 12:15:19.552683', 39, 585);
INSERT INTO parametros.parametro VALUES (4508, 'PREGRADO HCP 17', 'PREGRADO HCP 17', 'RTP', true, 0.00, '2022-12-29 16:25:38.070705', '2022-12-29 16:25:38.07324', 39, 583);
INSERT INTO parametros.parametro VALUES (4509, 'PREGRADO HCP 232', 'PREGRADO HCP 232', 'RTP', true, 0.00, '2023-01-12 20:29:06.283278', '2023-01-12 20:29:06.283567', 39, 584);
INSERT INTO parametros.parametro VALUES (4510, 'PREGRADO HCP 17', 'PREGRADO HCP 17', 'RTP', true, 0.00, '2023-01-19 18:10:56.242936', '2023-01-19 18:10:56.243126', 39, 584);
INSERT INTO parametros.parametro VALUES (4511, 'PREGRADO HCP 17', 'PREGRADO HCP 17', 'RTP', true, 0.00, '2023-01-19 18:13:28.863286', '2023-01-19 18:13:28.86338', 39, 585);
INSERT INTO parametros.parametro VALUES (4512, 'PREGRADO HCP 17', 'PREGRADO HCP 17', 'RTP', true, 0.00, '2023-01-19 18:14:56.301723', '2023-01-19 18:14:56.302004', 39, 586);
INSERT INTO parametros.parametro VALUES (4513, 'PREGRADO HCH 14', 'PREGRADO HCH 14', 'RTP', true, 0.00, '2023-01-30 17:33:03.041549', '2023-01-30 17:33:03.041641', 39, 586);
INSERT INTO parametros.parametro VALUES (4514, 'PREGRADO HCP 65', 'PREGRADO HCP 65', 'RTP', true, 0.00, '2023-02-07 12:19:45.772337', '2023-02-07 12:19:45.772417', 39, 583);
INSERT INTO parametros.parametro VALUES (4515, 'PREGRADO HCP 65', 'PREGRADO HCP 65', 'RTP', true, 0.00, '2023-02-07 12:21:42.310066', '2023-02-07 12:21:42.310134', 39, 584);
INSERT INTO parametros.parametro VALUES (4516, 'PREGRADO HCP 65', 'PREGRADO HCP 65', 'RTP', true, 0.00, '2023-02-07 12:24:26.273302', '2023-02-07 12:24:26.273401', 39, 585);
INSERT INTO parametros.parametro VALUES (4493, 'POR REVISAR SUPERVISOR', 'EL SUPERVISOR DEBE REVISAR LOS SOPORTES CARGADOS POR EL CONTRATISTA', 'PRS_DVE', true, 0.00, '2022-11-23 15:14:29.043506', '2022-11-23 15:14:29.043506', 65, NULL);
INSERT INTO parametros.parametro VALUES (4494, 'RECHAZO SUPERVISOR', 'EL SUPERVISOR RECHAZA LOS DOCUMENTOS DEL CONTRATISTA', 'RS_DVE', true, 0.00, '2022-11-23 15:15:16.219515', '2022-11-23 15:15:16.219515', 65, NULL);
INSERT INTO parametros.parametro VALUES (4495, 'APROBADO SUPERVISOR', 'EL SUPERVISOR APRUEBA LOS DOCUMENTOS DEL CONTRATISTA Y LA SOLICITUD ESTA A LA ESPERA DE LA APROBACION O RECHAZO DEL ORDENADOR', 'AS_DVE', true, 0.00, '2022-11-23 15:16:05.189651', '2022-11-23 15:16:05.189651', 65, NULL);
INSERT INTO parametros.parametro VALUES (4496, 'RECHAZADO ORDENADOR', 'EL ORDENADOR RECHAZA LOS DOCUMENTOS DEL CONTRATISTA', 'RO_DVE', true, 0.00, '2022-11-23 15:17:00.433673', '2022-11-23 15:17:00.433673', 65, NULL);
INSERT INTO parametros.parametro VALUES (4497, 'APROBACIÓN PAGO', 'EL ORDENADOR DEL GASTO (DECANO) APRUEBA EL PAGO DEL DOCENTE', 'AP_DVE', true, 0.00, '2022-11-23 15:20:43.470226', '2022-11-23 15:20:43.470226', 65, NULL);
INSERT INTO parametros.parametro VALUES (4498, 'RECHAZO PAGO', 'EL ORDENADOR DEL GASTO (DECANO) RECHAZA EL PAGO PARA EL DOCENTE', 'RP_DVE', true, 0.00, '2022-11-23 15:21:25.865253', '2022-11-23 15:21:25.865253', 65, NULL);
INSERT INTO parametros.parametro VALUES (4499, 'CARGANDO DOCUMENTOS', 'EL DOCENTE O CONTRATISTA SE ENCUENTRA CARGANDO SOPORTES DEL CUMPLIDO', 'CD_DVE', true, 0.00, '2022-11-23 15:22:11.311907', '2022-11-23 15:22:11.311907', 65, NULL);
INSERT INTO parametros.parametro VALUES (4500, 'POR REVISAR COORDINADOR(A)', 'EL COORDINADOR DEBE REVISAR LOS SOPORTES CARGADOS POR LOS DOCENTES', 'PRC_DVE', true, 0.00, '2022-11-23 15:23:09.003595', '2022-11-23 15:23:09.003595', 65, NULL);
INSERT INTO parametros.parametro VALUES (4501, 'POR APROBAR DECANO(A)', 'ESTA POR APROBAR LOS DOCUMENTOS POR PARTE DEL SUPERVISOR DEL CONTRATO', 'PAD_DVE', true, 0.00, '2022-11-23 15:23:48.682729', '2022-11-23 15:23:48.682729', 65, NULL);
INSERT INTO parametros.parametro VALUES (4502, 'RECHAZO COORDINADOR(A)', 'EL COORDINADOR RECHAZA LOS SOPORTES DEL CUMPLIDO', 'RC_DVE', true, 0.00, '2022-11-23 15:24:35.49214', '2022-11-23 15:24:35.49214', 65, NULL);
INSERT INTO parametros.parametro VALUES (4503, 'APROBADO DECANO(A)', 'EL SUPERVISOR DEL CONTRATO (DECANO) APRUEBA LOS SOPORTES DEL DOCENTE', 'AD_DVE', true, 0.00, '2022-11-23 15:25:14.982747', '2022-11-23 15:25:14.982747', 65, NULL);
INSERT INTO parametros.parametro VALUES (4504, 'RECHAZO DECANO(A)', 'EL SUPERVISOR (DECANO) RECHAZA LOS SOPORTES DEL DOCENTE POR ALGUNA INCONFORMIDAD CON LOS MISMOS', 'RD_DVE', true, 0.00, '2022-11-23 15:25:52.598392', '2022-11-23 15:25:52.598392', 65, NULL);
INSERT INTO parametros.parametro VALUES (4517, 'PREGRADO HCP 14', 'PREGRADO HCP 14', 'RTP', true, 0.00, '2023-03-09 12:38:27.94814', '2023-03-09 12:38:27.951162', 39, 585);
INSERT INTO parametros.parametro VALUES (4520, 'PREGRADO HCH 14', 'PREGRADO HCH 14', 'RTP', true, 0.00, '2023-05-04 10:57:23.436715', '2023-05-04 10:57:23.437146', 39, 585);
INSERT INTO parametros.parametro VALUES (4521, 'POSGRADO HCP 35', 'POSGRADO HCP 35', 'RTP', true, 0.00, '2023-05-12 16:13:44.388017', '2023-05-12 16:13:44.388142', 39, 583);
INSERT INTO parametros.parametro VALUES (4522, 'POSGRADO HCP 17', 'POSGRADO HCP 17', 'RTP', true, 0.00, '2023-05-15 15:19:43.048825', '2023-05-15 15:19:43.048906', 39, 585);
INSERT INTO parametros.parametro VALUES (4523, 'POSGRADO HCP 17', 'POSGRADO HCP 17', 'RTP', true, 0.00, '2023-05-15 15:27:09.607091', '2023-05-15 15:27:09.607188', 39, 584);
INSERT INTO parametros.parametro VALUES (4524, 'PREGRADO HCH 17', 'PREGRADO HCH 17', 'RTP', true, 0.00, '2023-05-19 22:35:12.339676', '2023-05-19 22:35:12.339754', 39, 585);
INSERT INTO parametros.parametro VALUES (4525, 'Asignatura', 'Tipo Asignatura', 'ASGNTR', true, 1.00, '2023-05-29 14:39:59.79602', '2023-05-29 14:39:59.796097', 67, NULL);
INSERT INTO parametros.parametro VALUES (4526, 'Cátedra', 'Tipo Cátedra', 'CTDR', true, 2.00, '2023-05-29 14:40:29.515527', '2023-05-29 14:40:29.515619', 67, NULL);
INSERT INTO parametros.parametro VALUES (4527, 'Grupos de trabajo', 'Tipo Grupos de trabajo', 'GRP-TRBJ', true, 3.00, '2023-05-29 14:40:51.842751', '2023-05-29 14:40:51.84285', 67, NULL);
INSERT INTO parametros.parametro VALUES (4529, 'Teórico', 'Enfoque teórico', 'ENFQ-TEO', true, 1.00, '2023-05-31 17:02:48.506929', '2023-05-31 17:02:48.507048', 68, NULL);
INSERT INTO parametros.parametro VALUES (4530, 'Práctico', 'Enfoque práctico', 'ENFQ-PRAC', true, 2.00, '2023-05-31 17:06:00.730981', '2023-05-31 17:06:00.731079', 68, NULL);
INSERT INTO parametros.parametro VALUES (4531, 'Teórico/Práctico', 'Enfoque teórico y práctico', 'ENFQ-TEOPRAC', true, 3.00, '2023-05-31 17:06:53.201531', '2023-05-31 17:06:53.20167', 68, NULL);
INSERT INTO parametros.parametro VALUES (4532, 'PREGRADO HCP 232', 'PREGRADO HCP 232', 'RTP', true, 0.00, '2023-06-08 14:41:34.280055', '2023-06-08 14:41:34.280139', 39, 583);
INSERT INTO parametros.parametro VALUES (4533, 'PREGRADO HCH 232', 'PREGRADO HCH 232', 'RTP', true, 0.00, '2023-06-09 10:53:32.231289', '2023-06-09 10:53:32.231365', 39, 583);
INSERT INTO parametros.parametro VALUES (4534, 'POSGRADO HCP 65', 'POSGRADO HCP 65', 'RTP', true, 0.00, '2023-06-21 18:36:54.335403', '2023-06-21 18:36:54.335582', 39, 583);
INSERT INTO parametros.parametro VALUES (4535, 'POSGRADO HCP 65', 'POSGRADO HCP 65', 'RTP', true, 0.00, '2023-06-21 18:40:00.409628', '2023-06-21 18:40:00.409718', 39, 585);
INSERT INTO parametros.parametro VALUES (4537, 'APROBACION_SUPERVISOR', 'Novedad en proceso de aprobación por el supervisor', 'APSU', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4538, 'FIRMA_SUPERVISOR', 'Novedad en proceso de firma por el supervisor', 'FISU', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4539, 'APROBACION_ORDENADOR', 'Novedad en proceso de aprobación por el ordenador', 'APOR', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4540, 'FIRMA_ORDENADOR', 'Novedad en proceso de firma por el supervisor', 'FIOR', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4541, 'APROBACION_JURIDICA', 'Novedad en proceso de aprobación por el asistente de jurídica', 'APJU', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4542, 'FIRMA_JURIDICA', 'Novedad en proceso de firma por el asistente de jurídica', 'FIJU', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4543, 'RECHAZADA', 'Solicitud de novedad rechazada', 'RECH', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4555, 'POSGRADO HCH 17', 'POSGRADO HCH 17', 'RTP', true, 0.00, '2023-08-29 17:10:59.660703', '2023-08-29 17:10:59.660781', 39, 585);
INSERT INTO parametros.parametro VALUES (4556, 'POSGRADO HCH 14', 'POSGRADO HCH 14', 'RTP', true, 0.00, '2023-09-12 18:11:45.702006', '2023-09-12 18:11:45.702542', 39, 585);
INSERT INTO parametros.parametro VALUES (4536, 'FIRMA_CONTRATISTA', 'Novedad en proceso de firma por el contratista', 'FCON', true, 0.00, '2023-07-04 19:20:01.55027', '2023-07-04 19:20:01.55027', 66, NULL);
INSERT INTO parametros.parametro VALUES (4544, 'PREGRADO HCP 8', 'PREGRADO HCP 8', 'RTP', true, 0.00, '2023-07-15 14:37:08.649725', '2023-07-15 14:37:08.652509', 39, 583);
INSERT INTO parametros.parametro VALUES (4545, 'A1', 'Clasificación A1 de la revista a la cual se envió el articulo academico', 'A1_PLX', true, 0.00, '2023-07-16 14:30:53.266225', '2023-07-16 14:30:53.266225', 69, NULL);
INSERT INTO parametros.parametro VALUES (4546, 'A2', 'Clasificación A2 de la revista a la cual se envió el articulo academico', 'A2_PLX', true, 0.00, '2023-07-16 14:30:53.266225', '2023-07-16 14:30:53.266225', 69, NULL);
INSERT INTO parametros.parametro VALUES (4547, 'B', 'Clasificación B de la revista a la cual se envió el articulo academico', 'B_PLX', true, 0.00, '2023-07-16 14:30:53.266225', '2023-07-16 14:30:53.266225', 69, NULL);
INSERT INTO parametros.parametro VALUES (4548, 'C', 'Clasificación C de la revista a la cual se envió el articulo academico', 'C_PLX', true, 0.00, '2023-07-16 14:30:53.266225', '2023-07-16 14:30:53.266225', 69, NULL);
INSERT INTO parametros.parametro VALUES (4549, 'Nombre Revista', 'Nombre de la revista a la cual se envía el articulo academico', 'NRVS_PLX', true, 0.00, '2023-07-18 19:15:12.623446', '2023-07-18 19:15:12.623446', 70, NULL);
INSERT INTO parametros.parametro VALUES (4550, 'Link Revista', 'Link de la revista a la cual se envía el articulo academico', 'LRVS_PLX', true, 0.00, '2023-07-18 19:15:12.623446', '2023-07-18 19:15:12.623446', 70, NULL);
INSERT INTO parametros.parametro VALUES (4551, 'Clasificación Revista', 'Clasificación de la revista a la cual se envía el articulo academico', 'CRVS_PLX', true, 0.00, '2023-07-18 19:15:12.623446', '2023-07-18 19:15:12.623446', 70, NULL);
INSERT INTO parametros.parametro VALUES (4552, 'Punto Salarial vigencia 2023', 'Decreto 885 del 2 de junio de 2023', 'PSAL', true, 18.00, '2023-07-17 09:20:56.650409', '2023-07-17 09:20:56.650409', 41, 594);
INSERT INTO parametros.parametro VALUES (4553, 'PREGRADO TCO 66', 'PREGRADO TCO 66', 'RTP', true, 0.00, '2023-07-24 17:29:46.956979', '2023-07-24 17:29:46.957067', 39, 586);
INSERT INTO parametros.parametro VALUES (346, 'ESTUDIANTE', 'ESTUDIANTE', 'EST', true, 1.00, '2021-03-12 19:06:40.595173', '2023-07-27 11:28:01.991275', 14, NULL);
INSERT INTO parametros.parametro VALUES (4519, 'TERMINADA', 'TERMINADA', 'TERM', true, 0.00, '2023-05-02 00:00:00', '2023-05-02 00:00:00', 66, NULL);
INSERT INTO parametros.parametro VALUES (4554, 'POSGRADO HCH 17', 'POSGRADO HCH 17', 'RTP', true, 0.00, '2023-08-29 17:07:14.801568', '2023-08-29 17:07:14.80208', 39, 583);
INSERT INTO parametros.parametro VALUES (4557, 'Justificación Prorroga', 'Causa por la cual se solicitó la prorroga para el trabajo de grado', 'JPR_PLX', true, 0.00, '2023-09-12 18:36:29.396175', '2023-09-12 18:36:29.396175', 71, NULL);
INSERT INTO parametros.parametro VALUES (4558, 'Empresa o razón social', 'Empresa o razón social en la cual se realizará la pasantía externa', 'EMPRZ_PLX', true, 0.00, '2023-09-14 13:49:43.695509', '2023-09-14 13:49:43.695509', 72, NULL);
INSERT INTO parametros.parametro VALUES (4559, 'Código CIIU', 'Código CIIU de la empresa en la cual se realizará la pasantía externa', 'CIIU_PLX', true, 0.00, '2023-09-14 13:54:26.01984', '2023-09-14 13:54:26.01984', 72, NULL);
INSERT INTO parametros.parametro VALUES (4560, 'NIT', 'NIT de la empresa en la cual se realizará la pasantía externa', 'NIT_PLX', true, 0.00, '2023-09-14 13:55:37.819284', '2023-09-14 13:55:37.819284', 72, NULL);
INSERT INTO parametros.parametro VALUES (4518, 'EN_TRAMITE', 'EN_TRAMITE', 'ENTR', true, 0.00, '2023-05-02 00:00:00', '2023-05-02 00:00:00', 66, NULL);
INSERT INTO parametros.parametro VALUES (4561, 'CONSTANCIA DE ESTUDIO', '', '41', true, 0.00, '2023-10-17 22:36:37.137217', '2023-10-17 22:36:37.137332', 2, NULL);
INSERT INTO parametros.parametro VALUES (4562, 'COPIAS DE ACTAS DE GRADO', '', '49', true, 0.00, '2023-10-17 22:37:01.635298', '2023-10-17 22:37:01.635391', 2, NULL);
INSERT INTO parametros.parametro VALUES (4563, 'DERECHOS DE GRADO', '', '50', true, 0.00, '2023-10-17 22:37:23.74481', '2023-10-17 22:37:23.7449', 2, NULL);
INSERT INTO parametros.parametro VALUES (4564, 'DUPLICADO DE DIPLOMAS', '', '51', true, 0.00, '2023-10-17 22:37:44.650944', '2023-10-17 22:37:44.651036', 2, NULL);
INSERT INTO parametros.parametro VALUES (4565, 'INSCRIPCIONES DE PREGRADO', '', '8672', true, 0.00, '2023-10-17 22:38:07.134249', '2023-10-17 22:38:07.134332', 2, NULL);
INSERT INTO parametros.parametro VALUES (4566, 'INSCRIPCIONES DE POSTGRADO', '', '12', true, 0.00, '2023-10-17 22:38:27.158616', '2023-10-17 22:38:27.158696', 2, NULL);
INSERT INTO parametros.parametro VALUES (4569, 'EN_EJECUCION', 'Estado de una novedad en ejecución', 'ENEJ', true, 0.00, '2023-10-18 17:07:58.715193', '2023-10-18 17:07:58.715279', 66, NULL);
INSERT INTO parametros.parametro VALUES (4570, 'Aprobado', 'El trabajo de grado ha obtenido calificación aprobatoria', 'APR_PLX', true, 0.00, '2023-10-30 17:49:27.518637', '2023-10-30 17:49:27.518637', 73, NULL);
INSERT INTO parametros.parametro VALUES (4571, 'Cancelado', 'El trabajo de grado ha sido cancelado', 'CNC_PLX', true, 0.00, '2023-10-30 17:51:24.941332', '2023-10-30 17:51:24.941332', 73, NULL);
INSERT INTO parametros.parametro VALUES (4572, 'Reprobado', 'El trabajo de grado ha obtenido calificación reprobatoria', 'RPR_PLX', true, 0.00, '2023-10-30 17:53:37.08942', '2023-10-30 17:53:37.08942', 73, NULL);
INSERT INTO parametros.parametro VALUES (4573, 'En evaluación por revisor', 'El anteproyecto está siendo evaluado por el revisor', 'RVS_PLX', true, 0.00, '2023-10-30 17:55:00.137303', '2023-10-30 17:55:00.137303', 73, NULL);
INSERT INTO parametros.parametro VALUES (4574, 'Anteproyecto viable', 'El revisor asignado al anteproyecto considera viable el proyecto', 'AVI_PLX', true, 0.00, '2023-10-30 17:57:00.889419', '2023-10-30 17:57:00.889419', 73, NULL);
INSERT INTO parametros.parametro VALUES (4575, 'Anteproyecto modificable', 'El revisor asignado al anteproyecto considera que el proyecto tiene modificaciones por hacer', 'AMO_PLX', true, 0.00, '2023-10-30 17:59:00.068606', '2023-10-30 17:59:00.068606', 73, NULL);
INSERT INTO parametros.parametro VALUES (4576, 'Anteproyecto no viable', 'El revisor asignado al anteproyecto considera no viable el proyecto', 'ANV_PLX', true, 0.00, '2023-10-30 18:01:30.36036', '2023-10-30 18:01:30.36036', 73, NULL);
INSERT INTO parametros.parametro VALUES (4577, 'En solicitud de segundo revisor', 'El estudiante solicita cambio de revisor al consejo de carrera', 'SRV_PLX', true, 0.00, '2023-10-30 18:04:29.258032', '2023-10-30 18:04:29.258032', 73, NULL);
INSERT INTO parametros.parametro VALUES (4578, 'En evaluación por segundo revisor', 'El anteproyecto está siendo evaluado por el segundo revisor', 'SRVS_PLX', true, 0.00, '2023-10-30 18:06:58.64831', '2023-10-30 18:06:58.64831', 73, NULL);
INSERT INTO parametros.parametro VALUES (4579, 'Anteproyecto viable para segundo revisor', 'El segundo revisor asignado al anteproyecto considera viable el proyecto', 'ASVI_PLX', true, 0.00, '2023-10-30 18:09:17.976064', '2023-10-30 18:09:17.976064', 73, NULL);
INSERT INTO parametros.parametro VALUES (4580, 'Anteproyecto modificable para segundo revisor', 'El segundo revisor asignado al anteproyecto considera que el proyecto tiene modificaciones por hacer', 'ASMO_PLX', true, 0.00, '2023-10-30 18:10:33.923841', '2023-10-30 18:10:33.923841', 73, NULL);
INSERT INTO parametros.parametro VALUES (4581, 'Anteproyecto no viable para segundo revisor', 'El segundo revisor asignado al anteproyecto considera no viable el proyecto', 'ASNV_PLX', true, 0.00, '2023-10-30 18:12:54.740416', '2023-10-30 18:12:54.740416', 73, NULL);
INSERT INTO parametros.parametro VALUES (4582, 'En curso', 'El estudiante recibe la aprobación del anteproyecto y el trabajo de grado entra en desarrollo', 'EC_PLX', true, 0.00, '2023-10-30 18:14:20.821201', '2023-10-30 18:14:20.821201', 73, NULL);
INSERT INTO parametros.parametro VALUES (4583, 'Proyecto radicado', 'El estudiante radica el proyecto de grado', 'PR_PLX', true, 0.00, '2023-10-30 18:16:58.02323', '2023-10-30 18:16:58.02323', 73, NULL);
INSERT INTO parametros.parametro VALUES (4584, 'En revisión', 'El consejo de carrera asigna el jurado del proyecto y el jurado empieza a revisar el proyecto', 'ER_PLX', true, 0.00, '2023-10-30 18:19:39.139218', '2023-10-30 18:19:39.139218', 73, NULL);
INSERT INTO parametros.parametro VALUES (4585, 'Modificable', 'El jurado halla aspectos modificables en el proyecto', 'MOD_PLX', true, 0.00, '2023-10-30 18:21:40.08823', '2023-10-30 18:21:40.08823', 73, NULL);
INSERT INTO parametros.parametro VALUES (4586, 'Listo para sustentar', 'El jurado aprueba el proyecto radicado y se establece la fecha de sustentación', 'LPS_PLX', true, 0.00, '2023-10-30 18:23:05.483742', '2023-10-30 18:23:05.483742', 73, NULL);
INSERT INTO parametros.parametro VALUES (4587, 'Sustentado', 'El proyecto ha sido sustentado por el estudiante', 'STN_PLX', true, 0.00, '2023-10-30 18:24:04.87416', '2023-10-30 18:24:04.87416', 73, NULL);
INSERT INTO parametros.parametro VALUES (4588, 'Notificado a coordinación con calificación', 'Las calificaciones del jurado y director se notifican a la coordinación del pregrado', 'NTF_PLX', true, 0.00, '2023-10-30 18:25:07.664317', '2023-10-30 18:25:07.664317', 73, NULL);
INSERT INTO parametros.parametro VALUES (4589, 'Pasantía aprobada, en espera de ARL', 'El anteproyecto de pasantía fue aprobadoy es necesario que el estudiante cargue el certificado de afiliación a la ARL para empezar la modalidad', 'PAEA_PLX', true, 0.00, '2023-10-30 18:27:03.890825', '2023-10-30 18:27:03.890825', 73, NULL);
INSERT INTO parametros.parametro VALUES (4590, 'Pasantía en curso, en espera de primera versión', 'El estudiante cargó el certificado de afiliación a ARL y la pasantía se encuentra en curso, pero no se ha cargado un documento inicial', 'PECSPR_PLX', true, 0.00, '2023-10-30 18:28:52.059922', '2023-10-30 18:28:52.059922', 73, NULL);
INSERT INTO parametros.parametro VALUES (4591, 'Cursando espacios académicos', 'El estudiante se encuentra cursando los espacios académicos solicitados', 'CEAP_PLX', true, 0.00, '2023-10-30 18:30:08.996737', '2023-10-30 18:30:08.996737', 73, NULL);
INSERT INTO parametros.parametro VALUES (4592, 'Revisión docente evaluador', 'En espera de registro de evaluación por parte del docente evaluador', 'RDE_PLX', true, 0.00, '2023-10-30 18:31:06.523918', '2023-10-30 18:31:06.523918', 73, NULL);
INSERT INTO parametros.parametro VALUES (4593, 'Director Interno', 'Rol de director interno', 'DIRECTOR_PLX', true, 0.00, '2023-10-30 23:17:04.516471', '2023-10-30 23:17:04.516471', 74, NULL);
INSERT INTO parametros.parametro VALUES (4594, 'Director Externo', 'Rol de director externo', 'DIR_EXTERNO_PLX', true, 0.00, '2023-10-30 23:18:00.187383', '2023-10-30 23:18:00.187383', 74, NULL);
INSERT INTO parametros.parametro VALUES (4595, 'Evaluador', 'Rol de evaluador', 'EVALUADOR_PLX', true, 0.00, '2023-10-30 23:18:41.238809', '2023-10-30 23:18:41.238809', 74, NULL);
INSERT INTO parametros.parametro VALUES (4596, 'Co-Director', 'Rol de co-director', 'CODIRECTOR_PLX', true, 0.00, '2023-10-30 23:19:29.998834', '2023-10-30 23:19:29.998834', 74, NULL);
INSERT INTO parametros.parametro VALUES (4597, 'Coordinador Posgrado', 'Rol de coordinador posgrado', 'COR_POSGRADO_PLX', true, 0.00, '2023-10-30 23:20:30.689016', '2023-10-30 23:20:30.689016', 74, NULL);
INSERT INTO parametros.parametro VALUES (4598, 'Pendiente', 'Revisión en estado pendiente', 'PENDIENTE_PLX', true, 0.00, '2023-10-31 13:10:54.042918', '2023-10-31 13:10:54.042918', 75, NULL);
INSERT INTO parametros.parametro VALUES (4599, 'Borrador', 'Revisión en estado borrador', 'BORRADOR_PLX', true, 0.00, '2023-10-31 13:12:25.456241', '2023-10-31 13:12:25.456241', 75, NULL);
INSERT INTO parametros.parametro VALUES (4600, 'Finalizada', 'Revisión finalizada', 'FINALIZADA_PLX', true, 0.00, '2023-10-31 13:13:08.133972', '2023-10-31 13:13:08.133972', 75, NULL);
INSERT INTO parametros.parametro VALUES (4601, 'Pasantia Externa', 'Modalidad que realiza el estudiante en una entidad nacional o internacional, asumiento el cáracter de práctica', 'PASEX_PLX', true, 0.00, '2023-10-31 19:23:33.914109', '2023-10-31 19:23:33.914109', 76, NULL);
INSERT INTO parametros.parametro VALUES (4602, 'Espacios Académicos de Posgrado', 'Modalidad que realiza un estudiante en los programas de posgrado que ofrece la universidad', 'EAPOS_PLX', true, 0.00, '2023-10-31 19:25:03.390518', '2023-10-31 19:25:03.390518', 76, NULL);
INSERT INTO parametros.parametro VALUES (4603, 'Espacios Académicos de Profundización', 'Modalidad que realiza un estudiante de nivel Tecnológico en los programas de pregrado que ofrece la universidad', 'EAPRO_PLX', true, 0.00, '2023-10-31 19:26:22.664784', '2023-10-31 19:26:22.664784', 76, NULL);
INSERT INTO parametros.parametro VALUES (4604, 'Monografía', 'Modalidad en la cual se realiza un ejercicio de aproximación y solución a un problema de investigación o de innovación en un campo de conocimiento', 'MONO_PLX', true, 0.00, '2023-10-31 19:27:48.299242', '2023-10-31 19:27:48.299242', 76, NULL);
INSERT INTO parametros.parametro VALUES (4605, 'Investigación, Investigación-Creación, Innovación', 'Modalidad que implica la vinculación de un estudiante con una estructura de investigación reconocida por Colciencias', 'INV_PLX', true, 0.00, '2023-10-31 19:29:38.777261', '2023-10-31 19:29:38.777261', 76, NULL);
INSERT INTO parametros.parametro VALUES (4606, 'Creación, dirección o interpretación', 'Modalidad que recoge elementos inherentes al campo del arte y afines que permiten la producción de uan obra artistica', 'CRE_PLX', true, 0.00, '2023-10-31 19:30:29.75013', '2023-10-31 19:30:29.75013', 76, NULL);
INSERT INTO parametros.parametro VALUES (4607, 'Producción de artículo académico', 'El estudiante presenta publicación de un artículo cientifico en revista homologada por el sistema de indexación nacional publindex de Colciencias ', 'PACAD_PLX', true, 0.00, '2023-10-31 19:34:11.77909', '2023-10-31 19:34:11.77909', 76, NULL);
INSERT INTO parametros.parametro VALUES (4608, 'Pasantia Interna', 'Modalidad que realiza el estudiante en una entidad nacional o internacional, asumiento el cáracter de práctica', 'PASIN_PLX', true, 0.00, '2023-10-31 19:35:51.628713', '2023-10-31 19:35:51.628713', 76, NULL);
INSERT INTO parametros.parametro VALUES (4609, 'Proyecto de Emprendimiento', 'Modalidad que proyecta la  constitución formal de una empresa u organización a través de la construcción de un modelo de negocios', 'PEMP_PLX', true, 0.00, '2023-10-31 19:38:43.848433', '2023-10-31 19:38:43.848433', 76, NULL);
INSERT INTO parametros.parametro VALUES (4610, 'Radicada', 'El estudiante radica la solicitud al consejo de carrera de pregrado', 'RDC_PLX', true, 0.00, '2023-10-31 21:32:14.077128', '2023-10-31 21:32:14.077128', 77, NULL);
INSERT INTO parametros.parametro VALUES (4611, 'Rechazada por consejo de carrera', 'La solicitud no cumple los requisitos para optar como modalidad de grado', 'RCC_PLX', true, 0.00, '2023-10-31 21:33:08.798322', '2023-10-31 21:33:08.798322', 77, NULL);
INSERT INTO parametros.parametro VALUES (4612, 'Aprobada por consejo de carrera', 'La solicitud cumple los requisitos para optar como modalidad de grado', 'ACC_PLX', true, 0.00, '2023-10-31 21:33:53.074599', '2023-10-31 21:33:53.074599', 77, NULL);
INSERT INTO parametros.parametro VALUES (4613, 'Recibida por posgrado', 'La solicitud asociada a espacios académicos de posgrado se recibe en consejo de carrera de posgrado', 'RPP_PLX', true, 0.00, '2023-10-31 21:34:48.333483', '2023-10-31 21:34:48.333483', 77, NULL);
INSERT INTO parametros.parametro VALUES (4614, 'Opcionada para segunda convocatoria', 'La solicitud de espacios académicos de posgrado no clasifica según los requerimientos del posgrado en la primera convocatoria', 'OPC_PLX', true, 0.00, '2023-10-31 21:35:43.252039', '2023-10-31 21:35:43.252039', 77, NULL);
INSERT INTO parametros.parametro VALUES (4615, 'Rechazada por cupos insuficientes', 'La solicitud de espacios académicos de posgrado resultó sin clasificar luego de la segunda convocatoria del posgrado', 'RCI_PLX', true, 0.00, '2023-10-31 21:36:52.021739', '2023-10-31 21:36:52.021739', 77, NULL);
INSERT INTO parametros.parametro VALUES (4616, 'Aprobada no exenta de pago', 'La solicitud de espacios académicos de posgrado clasifica en los cupos de condiciones económicas', 'ANE_PLX', true, 0.00, '2023-10-31 21:38:58.370823', '2023-10-31 21:38:58.370823', 77, NULL);
INSERT INTO parametros.parametro VALUES (4617, 'Formalizada exenta de pago', 'La solicitud de espacios académicos de posgrado se resuelve por decisión que manifiesta el estudiante', 'FEP_PLX', true, 0.00, '2023-10-31 21:39:57.279859', '2023-10-31 21:39:57.279859', 77, NULL);
INSERT INTO parametros.parametro VALUES (4618, 'Formalizada no exenta de pago', 'La solicitud de espacios académicos de posgrado se resuelve por decisión que manifiesta el estudiante, dispuesto a realizar el pago generado', 'FNE_PLX', true, 0.00, '2023-10-31 21:40:52.425684', '2023-10-31 21:40:52.425684', 77, NULL);
INSERT INTO parametros.parametro VALUES (4619, 'No formalizada', 'La solicitud de espacios académicos de posgrado es desatendida, ignorada o cancelada por el estudiante', 'NFM_PLX', true, 0.00, '2023-10-31 21:41:49.656634', '2023-10-31 21:41:49.656634', 77, NULL);
INSERT INTO parametros.parametro VALUES (4620, 'Oficializada', 'El estudiante ha realizado el pago asignado desde el posgrado', 'OFC_PLX', true, 0.00, '2023-10-31 21:43:06.499402', '2023-10-31 21:43:06.499402', 77, NULL);
INSERT INTO parametros.parametro VALUES (4621, 'No oficializada', 'El estudiante no realiza el pago asignado desde el posgrado', 'NOF_PLX', true, 0.00, '2023-10-31 21:43:55.956615', '2023-10-31 21:43:55.956615', 77, NULL);
INSERT INTO parametros.parametro VALUES (4622, 'Aprobada por oficina de pasantías', 'La solicitud fue aprobada por la oficina de pasantías', 'AOP_PLX', true, 0.00, '2023-10-31 21:44:43.695348', '2023-10-31 21:44:43.695348', 77, NULL);
INSERT INTO parametros.parametro VALUES (4623, 'Rechazada por oficina de pasantías', 'La solicitud fue rechazada por la oficina de pasantías', 'ROP_PLX', true, 0.00, '2023-10-31 21:45:49.323046', '2023-10-31 21:45:49.323046', 77, NULL);
INSERT INTO parametros.parametro VALUES (4624, 'Aprobada exenta de pago', 'La solicitud de espacios académicos de posgrado clasifica en los cupos de excelencia académica', 'AEP_PLX', true, 0.00, '2023-10-31 21:47:38.25409', '2023-10-31 21:47:38.25409', 77, NULL);
INSERT INTO parametros.parametro VALUES (4625, 'Cumplida para cursar espacios academicos', 'La solicitud de espacios académicos  se cumple satisfactoriamente y el proyecto registra al estudiante', 'CMP_PLX', true, 0.00, '2023-10-31 21:50:08.467477', '2023-10-31 21:50:08.467477', 77, NULL);
INSERT INTO parametros.parametro VALUES (4626, 'Aprobada por docente director', 'La solicitud fue aprobada por el docente director', 'ADD_PLX', true, 0.00, '2023-10-31 21:51:28.984128', '2023-10-31 21:51:28.984128', 77, NULL);
INSERT INTO parametros.parametro VALUES (4627, 'Rechazada por docente director', 'La solicitud fue rechazada por el docente director', 'RDD_PLX', true, 0.00, '2023-10-31 22:06:27.372215', '2023-10-31 22:06:27.372215', 77, NULL);
INSERT INTO parametros.parametro VALUES (4628, 'Pendiente por revisar por director interno', 'Solicitud a la espera de revision del director interno', 'PRDI_PLX', true, 0.00, '2023-10-31 22:11:43.722409', '2023-10-31 22:11:43.722409', 77, NULL);
INSERT INTO parametros.parametro VALUES (4629, 'Pendiente revisión por extension pasantia', 'Pendiente por la revisión por parte de la oficina de extension de pasantias', 'PREP_PLX', true, 0.00, '2023-10-31 22:12:52.290363', '2023-10-31 22:12:52.290363', 77, NULL);
INSERT INTO parametros.parametro VALUES (4630, 'Rechazada por extension pasantia', 'Rechazada por la oficina de extennsion de pasantias', 'RPEP_PLX', true, 0.00, '2023-10-31 22:15:17.68323', '2023-10-31 22:15:17.68323', 77, NULL);
INSERT INTO parametros.parametro VALUES (4631, 'Aprobada por coordinador de carrera pregrado', 'La solicitud fue aprobada por el coordinador de la carrera de pregrado y ahora debe ser aprobada por el coordinador de posgrado', 'ACPR_PLX', true, 0.00, '2023-10-31 22:16:06.838536', '2023-10-31 22:16:06.838536', 77, NULL);
INSERT INTO parametros.parametro VALUES (4632, 'Aprobada por extension pasantia', 'Aprobada por la oficina de extension de pasantias', 'APEP_PLX', true, 0.00, '2023-10-31 22:20:54.21066', '2023-10-31 22:20:54.21066', 77, NULL);
INSERT INTO parametros.parametro VALUES (4634, 'Solicitud inicial', 'Primera solicitud que realiza un estudiante para escoger una modalidad', 'SI_PLX', true, 0.00, '2023-11-01 17:50:55.823402', '2023-11-01 17:50:55.823402', 78, NULL);
INSERT INTO parametros.parametro VALUES (4635, 'Solicitud de cancelación de Modalidad', 'Solicitud por la cual el estudiante cancela la modalidad de grado y el trabajo de grado', 'SCM_PLX', true, 0.00, '2023-11-01 17:52:30.867862', '2023-11-01 17:52:30.867862', 78, NULL);
INSERT INTO parametros.parametro VALUES (4636, 'Solicitud de cambio de director interno', 'Solicitud por medio de la cual se gestiona el cambio del director interno del trabajo de grado', 'SCDI_PLX', true, 0.00, '2023-11-01 17:53:20.736844', '2023-11-01 17:53:20.736844', 78, NULL);
INSERT INTO parametros.parametro VALUES (4637, 'Solicitud de cambio de director externo', 'Solicitud por medio de la cual se realiza la  gestión para cambiar el director externo de un trabajo de grado.', 'SCDE_PLX', true, 0.00, '2023-11-01 17:54:07.684604', '2023-11-01 17:54:07.684604', 78, NULL);
INSERT INTO parametros.parametro VALUES (4638, 'Solicitud de socialización', 'Solicitud por medio de la cual el estudiante solicita espacio para realizar la socialización de su trabajo de grado', 'SSO_PLX', true, 0.00, '2023-11-01 17:54:56.817649', '2023-11-01 17:54:56.817649', 78, NULL);
INSERT INTO parametros.parametro VALUES (4639, 'Solicitud de prórroga', 'Solicitud por la cual el estudiante pide una prórroga para socializar o terminaro su proyecto de grado', 'SPR_PLX', true, 0.00, '2023-11-01 17:55:38.593104', '2023-11-01 17:55:38.593104', 78, NULL);
INSERT INTO parametros.parametro VALUES (4640, 'Solicitud de cambio de título de trabajo de grado', 'Solicitud por medio del cual el estudiante pide que sean modificados datos de su trabajo de grado.', 'SMDTG_PLX', true, 0.00, '2023-11-01 17:56:55.885452', '2023-11-01 17:56:55.885452', 78, NULL);
INSERT INTO parametros.parametro VALUES (4641, 'Solicitud de cambio de materia', 'Solicitud por medio de la cual un estudiante con modalidad de materias de posgrado solicita que se cambie alguna de las materias.', 'SCMA_PLX', true, 0.00, '2023-11-01 17:58:29.046933', '2023-11-01 17:58:29.046933', 78, NULL);
INSERT INTO parametros.parametro VALUES (4642, 'Solicitud de cambio de evaluador(es)', 'Solicitud por medio de la cual el estudiatne pide que el evaluador del trabajo de grado sea cambiado', 'SCE_PLX', true, 0.00, '2023-11-01 17:59:16.833334', '2023-11-01 17:59:16.833334', 78, NULL);
INSERT INTO parametros.parametro VALUES (4643, 'Solicitud de distinción (meritorio, laureado)', 'Solicitud por medio de la cual el estudiante pide que su trabajo de grado sea distinguido', 'SDTG_PLX', true, 0.00, '2023-11-01 18:00:04.857424', '2023-11-01 18:00:04.857424', 78, NULL);
INSERT INTO parametros.parametro VALUES (4644, 'Solicitud de cambio de codirector', 'Solicitud por medio de la cual se gestiona el cambio del codirector del trabajo de grado', 'SCCI_PLX', true, 0.00, '2023-11-01 18:01:13.045739', '2023-11-01 18:01:13.045739', 78, NULL);
INSERT INTO parametros.parametro VALUES (4645, 'Solicitud de revisión de trabajo de grado', 'Solicitud por medio de la cual es estudiante solicita que su trabajo reciba el visto bueno para poder continuar con la sustentación', 'SRTG_PLX', true, 0.00, '2023-11-01 18:01:59.84671', '2023-11-01 18:01:59.84671', 78, NULL);
INSERT INTO parametros.parametro VALUES (4647, 'Solicitud de cambio de objetivos', 'Solicitud por medio de la cual se gestiona el cambio de los objetivos del trabajo de grado', 'SCO_PLX', true, 0.00, '2023-11-01 18:04:06.489386', '2023-11-01 18:04:06.489386', 78, NULL);
INSERT INTO parametros.parametro VALUES (4633, 'Solicitud de carta de presentación ante empresa', 'Solicitud de carta de presentación ante la empresa que realiza el estudiante el proyecto', 'SCPAE_PLX', false, 0.00, '2023-11-01 17:50:00.426229', '2023-11-01 17:50:00.426229', 78, NULL);
INSERT INTO parametros.parametro VALUES (4646, 'Solicitud Director Trabajo de Grado', 'Solicitud para la aprobación del director nombrado en la solicitud', 'SAD_PLX', false, 0.00, '2023-11-01 18:03:10.981181', '2023-11-01 18:03:10.981181', 78, NULL);
INSERT INTO parametros.parametro VALUES (4648, 'Activo', 'El estudiante se encuentra desarrollando el trabajo de grado', 'EST_ACT_PLX', true, 0.00, '2023-11-02 14:10:49.402384', '2023-11-02 14:10:49.402384', 79, NULL);
INSERT INTO parametros.parametro VALUES (4649, 'Cancelado', 'El estudiante cancelo la modalidad o el trabajo de grado', 'EST_CAN_PLX', true, 0.00, '2023-11-02 14:11:32.328438', '2023-11-02 14:11:32.328438', 79, NULL);
INSERT INTO parametros.parametro VALUES (4650, 'Finalizado', 'El estudiante ha finalizado el trabajo de grado', 'EST_FIN_PLX', true, 0.00, '2023-11-02 14:12:08.140506', '2023-11-02 14:12:08.140506', 79, NULL);
INSERT INTO parametros.parametro VALUES (4651, 'Activo', 'El espacio academico se encuentra activo', 'ESP_ACT_PLX', true, 0.00, '2023-11-02 14:17:38.907248', '2023-11-02 14:17:38.907248', 80, NULL);
INSERT INTO parametros.parametro VALUES (4652, 'Cursado', 'El estudiante ha cursado el espacio académico bajo la modalidad de espacios académicos de posgrado.', 'ESP_CRS_PLX', true, 0.00, '2023-11-02 14:19:21.644397', '2023-11-02 14:19:21.644397', 80, NULL);
INSERT INTO parametros.parametro VALUES (4653, 'Cancelado', 'El espacio academico se encuentra cancelado', 'ESP_CAN_PLX', true, 0.00, '2023-11-02 14:22:36.968279', '2023-11-02 14:22:36.968279', 80, NULL);
INSERT INTO parametros.parametro VALUES (4654, 'Aprobada coordinador posgrado opción 1', 'La solicitud de materias de posgrado de la opción 1 fue aprobada por el coordinador de posgrado', 'ACPO1_PLX', true, 0.00, '2023-11-08 13:25:46.035139', '2023-11-08 13:25:46.035139', 77, NULL);
INSERT INTO parametros.parametro VALUES (4655, 'Rechazada coordinador posgrado opción 1', 'La solicitud de materias de posgrado de la opción 1 fue rechazada por el coordinador de posgrado', 'RCPO1_PLX', true, 0.00, '2023-11-08 13:27:06.886993', '2023-11-08 13:27:06.886993', 77, NULL);
INSERT INTO parametros.parametro VALUES (4656, 'Aprobada coordinador posgrado opción 2', 'La solicitud de materias de posgrado de la opción 2 fue aprobada por el coordinador de posgrado', 'ACPO2_PLX', true, 0.00, '2023-11-08 13:28:31.336701', '2023-11-08 13:28:31.336701', 77, NULL);
INSERT INTO parametros.parametro VALUES (4657, 'Rechazada coordinador posgrado opción 2', 'La solicitud de materias de posgrado de la opción 2 fue rechazada por el coordinador de posgrado', 'RCPO2_PLX', true, 0.00, '2023-11-08 13:29:38.534123', '2023-11-08 13:29:38.534123', 77, NULL);
INSERT INTO parametros.parametro VALUES (4659, 'Cursado', 'El estudiante ha cursado la asignatura para el trabajo de grado', 'CDO_PLX', true, 0.00, '2023-11-14 00:19:48.110673', '2023-11-14 00:19:48.110673', 81, NULL);
INSERT INTO parametros.parametro VALUES (4660, 'Cancelado', 'El estudiante ha cancelado la asignatura para el trabajo de grado', 'CNC_PLX', true, 0.00, '2023-11-14 00:21:00.661006', '2023-11-14 00:21:00.661006', 81, NULL);
INSERT INTO parametros.parametro VALUES (4658, 'Cursando', 'El estudiante se encuentra cursando la asignatura para el trabajo de grado', 'CND_PLX', true, 0.00, '2023-11-14 00:18:40.180406', '2023-11-14 00:18:40.180406', 81, NULL);
INSERT INTO parametros.parametro VALUES (4661, 'Meritorio', 'Trabajo de grado meritorio', 'MERITORIO_PLX', true, 0.00, '2023-11-15 16:57:05.016114', '2023-11-15 16:57:05.016114', 82, NULL);
INSERT INTO parametros.parametro VALUES (4662, 'Laureado', 'Trabajo de grado laureado', 'LAUREADO_PLX', true, 0.00, '2023-11-15 16:57:46.631233', '2023-11-15 16:57:46.631233', 82, NULL);
INSERT INTO parametros.parametro VALUES (4663, 'Texto', 'Detalle de tipo texto', 'TXT_PLX', true, 0.00, '2023-11-15 17:04:45.56268', '2023-11-15 17:04:45.56268', 83, NULL);
INSERT INTO parametros.parametro VALUES (4664, 'Numerico', 'Detalle de tipo numerico', 'NUM_PLX', true, 0.00, '2023-11-15 17:05:39.24831', '2023-11-15 17:05:39.24831', 83, NULL);
INSERT INTO parametros.parametro VALUES (4665, 'Documento', 'Detalle de tipo documento', 'DOC_PLX', true, 0.00, '2023-11-15 17:06:21.091159', '2023-11-15 17:06:21.091159', 83, NULL);
INSERT INTO parametros.parametro VALUES (4666, 'Checkbox', 'Detalle de tipo checkbox', 'CHECK_PLX', true, 0.00, '2023-11-15 17:07:10.569294', '2023-11-15 17:07:10.569294', 83, NULL);
INSERT INTO parametros.parametro VALUES (4667, 'Lista', 'Detalle de tipo lista', 'LIST_PLX', true, 0.00, '2023-11-15 17:07:50.793794', '2023-11-15 17:07:50.793794', 83, NULL);
INSERT INTO parametros.parametro VALUES (4668, 'Radio', 'Detalle de tipo radio', 'RBTN_PLX', true, 0.00, '2023-11-15 17:08:35.282966', '2023-11-15 17:08:35.282966', 83, NULL);
INSERT INTO parametros.parametro VALUES (4669, 'Directiva', 'Detalle de tipo directiva', 'DRT_PLX', true, 0.00, '2023-11-15 17:10:08.314547', '2023-11-15 17:10:08.314547', 83, NULL);
INSERT INTO parametros.parametro VALUES (4670, 'Selector', 'Detalle de tipo selector', 'SLCT_PLX', true, 0.00, '2023-11-15 17:10:55.170852', '2023-11-15 17:10:55.170852', 83, NULL);
INSERT INTO parametros.parametro VALUES (4671, 'Label', 'Detalle de tipo label', 'LBL_PLX', true, 0.00, '2023-11-15 17:11:35.441672', '2023-11-15 17:11:35.441672', 83, NULL);
INSERT INTO parametros.parametro VALUES (4672, 'LinkNuxeo', 'Detalle de tipo linknuxeo', 'LNUX_PLX', true, 0.00, '2023-11-15 17:12:35.293766', '2023-11-15 17:12:35.293766', 83, NULL);
INSERT INTO parametros.parametro VALUES (4674, 'Textarea', 'Detalle de tipo textarea', 'TXTA_PLX', true, 0.00, '2023-11-15 17:15:53.283963', '2023-11-15 17:15:53.283963', 83, NULL);


--
-- TOC entry 6853 (class 0 OID 524353)
-- Dependencies: 538
-- Data for Name: parametro_periodo; Type: TABLE DATA; Schema: parametros; Owner: -
--

INSERT INTO parametros.parametro_periodo VALUES (4, 4, 2, '{ "NumFactor": 1 }', '2020-12-11 12:46:15.574584', '2020-12-21 14:12:58.856935', false);
INSERT INTO parametros.parametro_periodo VALUES (5, 5, 2, '{ "NumFactor": 0 }', '2020-12-11 12:50:41.924171', '2020-12-21 14:14:03.791926', false);
INSERT INTO parametros.parametro_periodo VALUES (54, 54, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:22:01.720412', '2021-09-21 06:38:09.186093', false);
INSERT INTO parametros.parametro_periodo VALUES (111, 4, 2, '{ "NumFactor": 1 }', '2021-03-15 18:14:32.096208', '2021-11-03 11:11:51.978146', false);
INSERT INTO parametros.parametro_periodo VALUES (35, 35, 3, '{
    "NumFactor": 1, 
 "Costo": 29260
}', '2020-12-21 14:06:52.002895', '2020-12-21 14:19:45.246944', false);
INSERT INTO parametros.parametro_periodo VALUES (34, 34, 3, '{
    "NumFactor": 0, 
 "Costo": 14630
}', '2020-12-21 14:06:51.994484', '2020-12-21 14:19:45.256011', false);
INSERT INTO parametros.parametro_periodo VALUES (59, 59, 3, '{
    "NumFactor": 4, 
 "Costo": 117040
}', '2020-12-21 14:22:01.767786', '2020-12-30 10:01:17.530998', false);
INSERT INTO parametros.parametro_periodo VALUES (44, 44, 3, '{
    "NumFactor": 0, 
 "Costo": 0
}', '2020-12-21 14:22:01.625851', '2020-12-21 14:22:01.625909', false);
INSERT INTO parametros.parametro_periodo VALUES (45, 45, 3, '{
    "NumFactor": 0, 
 "Costo": 0
}', '2020-12-21 14:22:01.63448', '2020-12-21 14:22:01.634539', false);
INSERT INTO parametros.parametro_periodo VALUES (46, 46, 3, '{
    "NumFactor": 4, 
 "Costo": 117040
}', '2020-12-21 14:22:01.64332', '2020-12-21 14:22:01.643366', false);
INSERT INTO parametros.parametro_periodo VALUES (48, 48, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.66381', '2020-12-21 14:22:01.663868', false);
INSERT INTO parametros.parametro_periodo VALUES (49, 49, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.672713', '2020-12-21 14:22:01.672783', false);
INSERT INTO parametros.parametro_periodo VALUES (50, 50, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.684425', '2020-12-21 14:22:01.684502', false);
INSERT INTO parametros.parametro_periodo VALUES (1, 1, 1, '{ "Valor": 828116 }', '2020-12-11 11:52:56.269107', '2020-12-11 11:52:56.269211', true);
INSERT INTO parametros.parametro_periodo VALUES (3, 1, 3, '{ "Valor": 908526 }', '2020-12-11 11:53:31.737217', '2020-12-30 10:06:32.79944', true);
INSERT INTO parametros.parametro_periodo VALUES (18, 18, 3, '{
    "NumFactor": 5, 
 "Costo": 146301
}', '2020-12-17 20:38:13.451024', '2020-12-30 10:01:09.510724', false);
INSERT INTO parametros.parametro_periodo VALUES (55, 55, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.73079', '2020-12-21 14:22:01.730848', false);
INSERT INTO parametros.parametro_periodo VALUES (56, 56, 3, '{
    "NumFactor": 1, 
 "Costo": 29260
}', '2020-12-21 14:22:01.739976', '2020-12-21 14:22:01.740123', false);
INSERT INTO parametros.parametro_periodo VALUES (57, 57, 3, '{
    "NumFactor": 0, 
 "Costo": 14630
}', '2020-12-21 14:22:01.74858', '2020-12-21 14:22:01.74864', false);
INSERT INTO parametros.parametro_periodo VALUES (58, 58, 3, '{
    "NumFactor": 4, 
 "Costo": 117040
}', '2020-12-21 14:22:01.757352', '2020-12-21 14:22:01.757408', false);
INSERT INTO parametros.parametro_periodo VALUES (60, 60, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.777398', '2020-12-21 14:22:01.777453', false);
INSERT INTO parametros.parametro_periodo VALUES (61, 61, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.786196', '2020-12-21 14:22:01.786252', false);
INSERT INTO parametros.parametro_periodo VALUES (62, 62, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.796219', '2020-12-21 14:22:01.796306', false);
INSERT INTO parametros.parametro_periodo VALUES (8, 8, 3, '{ "NumFactor": 0 }', '2020-12-15 14:52:59.630445', '2020-12-15 14:52:59.63066', false);
INSERT INTO parametros.parametro_periodo VALUES (9, 9, 3, '{ "NumFactor": 0 }', '2020-12-15 14:52:59.885465', '2020-12-15 14:52:59.885742', false);
INSERT INTO parametros.parametro_periodo VALUES (63, 63, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.804751', '2020-12-21 14:22:01.804913', false);
INSERT INTO parametros.parametro_periodo VALUES (69, 69, 3, '{
    "NumFactor": 3, 
 "Costo": 87780
}', '2020-12-21 14:22:01.860636', '2020-12-30 10:01:02.447088', false);
INSERT INTO parametros.parametro_periodo VALUES (11, 11, 3, '{ "NumFactor": 0 }', '2020-12-16 15:46:56.856754', '2020-12-16 15:46:56.856839', false);
INSERT INTO parametros.parametro_periodo VALUES (12, 12, 3, '{ "NumFactor": 0 }', '2020-12-16 15:46:57.112551', '2020-12-16 15:46:57.112657', false);
INSERT INTO parametros.parametro_periodo VALUES (7, 7, 3, '{
    "NumFactor": 4, 
 "Costo": 117040
}', '2020-12-15 14:52:59.367895', '2020-12-16 15:49:27.975694', false);
INSERT INTO parametros.parametro_periodo VALUES (10, 10, 2, '{
    "NumFactor": 3, 
 "Costo": 87780
}', '2020-12-16 12:37:59.145548', '2020-12-30 10:00:47.722334', false);
INSERT INTO parametros.parametro_periodo VALUES (15, 15, 3, '{
    "NumFactor": 0, 
 "Costo": 0
}', '2020-12-17 20:38:13.421608', '2020-12-21 08:02:25.691347', false);
INSERT INTO parametros.parametro_periodo VALUES (16, 16, 3, '{
    "NumFactor": 0, 
 "Costo": 0
}', '2020-12-17 20:38:13.433515', '2020-12-21 08:02:25.703685', false);
INSERT INTO parametros.parametro_periodo VALUES (66, 66, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.833608', '2020-12-21 14:22:01.833685', false);
INSERT INTO parametros.parametro_periodo VALUES (14, 14, 3, '{
    "NumFactor": 4, 
 "Costo": 117040
}', '2020-12-16 15:46:57.621755', '2020-12-30 10:01:14.084963', false);
INSERT INTO parametros.parametro_periodo VALUES (17, 17, 3, '{
    "NumFactor": 3, 
 "Costo": 87780
}', '2020-12-17 20:38:13.442175', '2020-12-30 10:01:11.69263', false);
INSERT INTO parametros.parametro_periodo VALUES (67, 67, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.842528', '2020-12-21 14:22:01.842586', false);
INSERT INTO parametros.parametro_periodo VALUES (20, 20, 3, '{ "NumFactor": 0 }', '2020-12-21 14:03:14.268178', '2020-12-21 14:03:14.268227', false);
INSERT INTO parametros.parametro_periodo VALUES (21, 21, 3, '{ "NumFactor": 0 }', '2020-12-21 14:03:14.274747', '2020-12-21 14:03:14.274916', false);
INSERT INTO parametros.parametro_periodo VALUES (24, 24, 3, '{ "NumFactor": 0 }', '2020-12-21 14:06:51.867415', '2020-12-21 14:06:51.867478', false);
INSERT INTO parametros.parametro_periodo VALUES (25, 25, 3, '{ "NumFactor": 0 }', '2020-12-21 14:06:51.876238', '2020-12-21 14:06:51.876304', false);
INSERT INTO parametros.parametro_periodo VALUES (2, 1, 2, '{ "Valor": 877803 }', '2020-12-11 11:53:31.737217', '2020-12-11 11:56:18.868616', true);
INSERT INTO parametros.parametro_periodo VALUES (28, 28, 3, '{ "NumFactor": 0 }', '2020-12-21 14:06:51.930959', '2020-12-21 14:06:51.931026', false);
INSERT INTO parametros.parametro_periodo VALUES (29, 29, 3, '{ "NumFactor": 0 }', '2020-12-21 14:06:51.939528', '2020-12-21 14:06:51.939596', false);
INSERT INTO parametros.parametro_periodo VALUES (30, 30, 3, '{ "NumFactor": 0 }', '2020-12-21 14:06:51.947962', '2020-12-21 14:06:51.948021', false);
INSERT INTO parametros.parametro_periodo VALUES (31, 31, 3, '{ "NumFactor": 0 }', '2020-12-21 14:06:51.95902', '2020-12-21 14:06:51.959084', false);
INSERT INTO parametros.parametro_periodo VALUES (33, 33, 3, '{
    "NumFactor": 4, 
 "Costo": 117040
}', '2020-12-21 14:06:51.986191', '2020-12-21 14:06:51.986249', false);
INSERT INTO parametros.parametro_periodo VALUES (70, 70, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.871982', '2020-12-21 14:22:01.87213', false);
INSERT INTO parametros.parametro_periodo VALUES (71, 71, 3, '{ "NumFactor": 0 }', '2020-12-21 14:22:01.881816', '2020-12-21 14:22:01.881927', false);
INSERT INTO parametros.parametro_periodo VALUES (189, 358, 3, '{ "NumFactor": 1 }', '2021-06-27 22:51:12.374044', '2021-09-17 06:40:54.635428', false);
INSERT INTO parametros.parametro_periodo VALUES (74, 74, 3, '{
    "NumFactor": 0, 
 "Costo": 0
}', '2020-12-21 14:27:52.956066', '2020-12-23 21:58:51.440423', false);
INSERT INTO parametros.parametro_periodo VALUES (75, 75, 3, '{
    "NumFactor": 1, 
 "Costo": 29260
}', '2020-12-21 14:27:52.964341', '2020-12-23 21:58:51.451731', false);
INSERT INTO parametros.parametro_periodo VALUES (65, 65, 3, '{
    "NumFactor": 3, 
 "Costo": 87780
}', '2020-12-21 14:22:01.823541', '2020-12-29 15:40:17.321565', false);
INSERT INTO parametros.parametro_periodo VALUES (64, 64, 3, '{ "NumFactor": 5 }', '2020-12-21 14:22:01.814034', '2020-12-29 16:33:57.47834', false);
INSERT INTO parametros.parametro_periodo VALUES (23, 23, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2020-12-21 14:03:14.287135', '2021-09-17 06:53:14.194723', false);
INSERT INTO parametros.parametro_periodo VALUES (76, 76, 2, '{
    "NumFactor": 0.08 
}', '2020-12-30 07:35:18.840431', '2020-12-30 10:00:39.909412', false);
INSERT INTO parametros.parametro_periodo VALUES (6, 6, 2, '{ "NumFactor": 5 }', '2020-12-11 14:13:29.899325', '2020-12-30 10:00:43.89922', false);
INSERT INTO parametros.parametro_periodo VALUES (68, 68, 3, '{ "NumFactor": 5 }', '2020-12-21 14:22:01.851012', '2020-12-30 10:01:04.8826', false);
INSERT INTO parametros.parametro_periodo VALUES (13, 13, 3, '{ "NumFactor": 3 }', '2020-12-16 15:46:57.36772', '2020-12-30 10:01:07.206719', false);
INSERT INTO parametros.parametro_periodo VALUES (77, 77, 1, '{
    "NumFactor": 0.500,
 "Costo": 13800
}', '2020-12-30 10:08:01.286865', '2022-01-07 11:29:22.828866', true);
INSERT INTO parametros.parametro_periodo VALUES (82, 82, 1, '{ "NumFactor": 0.500 }', '2020-12-30 10:09:44.257894', '2022-01-07 11:57:53.94056', true);
INSERT INTO parametros.parametro_periodo VALUES (78, 78, 1, '{
    "NumFactor": 0.500,
 "Costo": 13800
}', '2020-12-30 10:08:36.627849', '2022-01-07 11:29:22.853973', true);
INSERT INTO parametros.parametro_periodo VALUES (79, 79, 1, '{
    "NumFactor": 2.000,
 "Costo": 55200
}', '2020-12-30 10:08:57.845326', '2022-01-07 11:29:22.835332', true);
INSERT INTO parametros.parametro_periodo VALUES (81, 81, 1, '{
    "NumFactor": 4.000,
 "Costo": 110400
}', '2020-12-30 10:09:30.127749', '2022-01-07 11:29:22.847787', true);
INSERT INTO parametros.parametro_periodo VALUES (190, 359, 3, '{ "NumFactor": 1 }', '2021-06-27 22:51:48.781868', '2021-06-27 23:03:12.476215', false);
INSERT INTO parametros.parametro_periodo VALUES (38, 38, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:06:52.028125', '2021-09-21 06:37:54.636812', false);
INSERT INTO parametros.parametro_periodo VALUES (43, 43, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:22:01.616573', '2021-09-17 06:42:41.545217', false);
INSERT INTO parametros.parametro_periodo VALUES (73, 73, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:27:52.947617', '2021-11-03 11:22:00.980152', false);
INSERT INTO parametros.parametro_periodo VALUES (41, 41, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:22:01.599633', '2021-09-17 06:38:33.211844', false);
INSERT INTO parametros.parametro_periodo VALUES (83, 83, 1, '{
    "NumFactor": 1.000,
 "Costo": 27600
}', '2020-12-30 10:10:07.283172', '2022-01-07 11:29:22.866206', true);
INSERT INTO parametros.parametro_periodo VALUES (36, 36, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:06:52.011428', '2021-09-17 06:52:08.512129', false);
INSERT INTO parametros.parametro_periodo VALUES (32, 32, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2020-12-21 14:06:51.976843', '2021-09-21 06:38:43.6511', false);
INSERT INTO parametros.parametro_periodo VALUES (47, 47, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2020-12-21 14:22:01.655424', '2021-09-21 06:38:33.712024', false);
INSERT INTO parametros.parametro_periodo VALUES (52, 52, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:22:01.702211', '2021-09-21 06:38:21.110008', false);
INSERT INTO parametros.parametro_periodo VALUES (53, 53, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2020-12-21 14:22:01.711936', '2021-09-21 06:38:14.53416', false);
INSERT INTO parametros.parametro_periodo VALUES (72, 72, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2020-12-21 14:27:52.9392', '2021-09-17 06:37:53.448468', false);
INSERT INTO parametros.parametro_periodo VALUES (27, 27, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2020-12-21 14:06:51.915563', '2021-09-17 06:42:34.270214', false);
INSERT INTO parametros.parametro_periodo VALUES (37, 37, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2020-12-21 14:06:52.019826', '2021-11-03 11:21:58.021496', false);
INSERT INTO parametros.parametro_periodo VALUES (105, 212, 1, '{ "Tarifa": 19,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2021-01-19 12:44:00', '2021-01-19 12:44:00', true);
INSERT INTO parametros.parametro_periodo VALUES (237, 523, 3, '{
    "NumFactor": 0.600,
 "Costo": 18200
}', '2021-11-03 11:15:42.885589', '2021-11-03 11:17:07.278881', false);
INSERT INTO parametros.parametro_periodo VALUES (80, 80, 1, '{
    "NumFactor": 5.000,
 "Costo": 138000
}', '2020-12-30 10:09:14.399521', '2022-01-07 11:29:22.841567', true);
INSERT INTO parametros.parametro_periodo VALUES (85, 85, 1, '{
    "NumFactor": 0.080,
 "Costo": 66200
}', '2020-12-30 10:10:46.753876', '2022-01-07 11:46:22.480111', false);
INSERT INTO parametros.parametro_periodo VALUES (89, 89, 1, '{
    "NumFactor": 4.000,
 "Costo": 110400
}', '2020-12-30 10:12:33.175082', '2022-01-07 11:29:22.900125', true);
INSERT INTO parametros.parametro_periodo VALUES (88, 88, 1, '{
    "NumFactor": 3.000,
 "Costo": 82800
}', '2020-12-30 10:12:05.583646', '2022-01-07 11:29:22.893941', true);
INSERT INTO parametros.parametro_periodo VALUES (107, 212, 2, '{ "Tarifa": 19,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2021-01-19 12:44:00', '2021-01-19 12:44:00', true);
INSERT INTO parametros.parametro_periodo VALUES (87, 87, 1, '{ "NumFactor": 0.005 }', '2020-12-30 10:11:36.788534', '2021-01-06 11:42:02.96339', false);
INSERT INTO parametros.parametro_periodo VALUES (205, 491, 2, '{
    "NumFactor": 3.000,
 "Costo": 87800
}', '2021-11-03 11:12:44.870012', '2021-11-03 11:14:51.229009', false);
INSERT INTO parametros.parametro_periodo VALUES (204, 490, 2, '{
    "NumFactor": 5.000,
 "Costo": 146300
}', '2021-11-03 11:12:28.970112', '2021-11-03 11:14:54.207669', false);
INSERT INTO parametros.parametro_periodo VALUES (109, 212, 3, '{ "Tarifa": 19,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2021-01-19 12:44:00', '2021-01-19 12:44:00', true);
INSERT INTO parametros.parametro_periodo VALUES (108, 211, 3, '{ "Tarifa": 0,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2021-01-19 12:44:00', '2021-01-19 12:44:00', true);
INSERT INTO parametros.parametro_periodo VALUES (106, 211, 2, '{ "Tarifa": 0,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2021-01-19 12:44:00', '2021-01-19 12:44:00', true);
INSERT INTO parametros.parametro_periodo VALUES (104, 211, 1, '{ "Tarifa": 0,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2021-01-19 12:12:00', '2021-01-19 12:12:00', true);
INSERT INTO parametros.parametro_periodo VALUES (191, 360, 3, '{
    "NumFactor": 2.000 
}', '2021-06-27 23:05:07.750921', '2021-09-17 06:40:43.083981', false);
INSERT INTO parametros.parametro_periodo VALUES (92, 92, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-01-06 11:48:48.127415', '2021-09-17 06:41:46.758803', false);
INSERT INTO parametros.parametro_periodo VALUES (26, 26, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2020-12-21 14:06:51.884684', '2021-09-17 06:52:22.258782', false);
INSERT INTO parametros.parametro_periodo VALUES (197, 347, 9, NULL, '2021-09-18 12:32:40.868358', '2022-03-07 10:54:32.840682', false);
INSERT INTO parametros.parametro_periodo VALUES (196, 356, 9, NULL, '2021-08-28 11:40:25.728479', '2022-03-07 10:54:55.410998', true);
INSERT INTO parametros.parametro_periodo VALUES (91, 91, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-01-06 11:48:48.114975', '2021-09-21 06:38:01.115231', false);
INSERT INTO parametros.parametro_periodo VALUES (22, 22, 3, '{ "NumFactor": 3.000 }', '2020-12-21 14:03:14.280893', '2021-06-28 09:05:40.293395', false);
INSERT INTO parametros.parametro_periodo VALUES (42, 42, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2020-12-21 14:22:01.608229', '2021-09-21 06:38:50.482788', false);
INSERT INTO parametros.parametro_periodo VALUES (94, 94, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2021-01-06 11:48:48.139622', '2021-11-03 11:22:07.102031', false);
INSERT INTO parametros.parametro_periodo VALUES (95, 95, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-01-06 11:48:48.145674', '2021-11-03 11:22:09.904729', false);
INSERT INTO parametros.parametro_periodo VALUES (96, 96, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2021-01-06 11:48:48.151704', '2021-11-03 11:22:12.509353', false);
INSERT INTO parametros.parametro_periodo VALUES (97, 97, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-01-06 11:48:48.15762', '2021-11-03 11:22:15.62107', false);
INSERT INTO parametros.parametro_periodo VALUES (99, 99, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-01-06 11:48:48.169502', '2021-11-03 11:22:29.934261', false);
INSERT INTO parametros.parametro_periodo VALUES (98, 98, 3, '{ "NumFactor": 4.000 }', '2021-01-06 11:48:48.163492', '2021-11-03 11:22:26.588949', false);
INSERT INTO parametros.parametro_periodo VALUES (100, 100, 3, '{
    "NumFactor": 2.000,
 "Costo": 60600
}', '2021-01-06 11:48:48.175466', '2021-11-03 11:22:33.64454', false);
INSERT INTO parametros.parametro_periodo VALUES (84, 84, 1, '{
    "NumFactor": 3.000,
 "Costo": 82800
}', '2020-12-30 10:10:23.596958', '2022-01-07 11:29:22.872556', true);
INSERT INTO parametros.parametro_periodo VALUES (102, 102, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-01-06 11:48:48.187603', '2021-11-03 11:21:51.292047', false);
INSERT INTO parametros.parametro_periodo VALUES (93, 93, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2021-01-06 11:48:48.133679', '2021-11-03 11:22:03.936464', false);
INSERT INTO parametros.parametro_periodo VALUES (223, 509, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2021-11-03 11:15:42.799637', '2021-11-03 11:20:06.919635', false);
INSERT INTO parametros.parametro_periodo VALUES (200, 480, 3, '{ "NumFactor": 0 }', '2021-10-14 12:11:04.861193', '2021-10-14 12:11:04.861319', true);
INSERT INTO parametros.parametro_periodo VALUES (201, 481, 3, '{ "NumFactor": 0 }', '2021-10-14 12:11:21.400995', '2021-10-14 12:11:21.401087', true);
INSERT INTO parametros.parametro_periodo VALUES (202, 482, 3, '{ "NumFactor": 0 }', '2021-10-14 12:11:30.669065', '2021-10-14 12:11:30.669133', true);
INSERT INTO parametros.parametro_periodo VALUES (236, 522, 3, '{
    "NumFactor": 0.500 
}', '2021-11-03 11:15:42.879549', '2021-11-03 11:17:10.397861', false);
INSERT INTO parametros.parametro_periodo VALUES (235, 521, 3, '{
    "NumFactor": 0.600,
 "Costo": 18200
}', '2021-11-03 11:15:42.873552', '2021-11-03 11:17:13.757892', false);
INSERT INTO parametros.parametro_periodo VALUES (234, 520, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:15:42.867439', '2021-11-03 11:17:16.430161', false);
INSERT INTO parametros.parametro_periodo VALUES (233, 519, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2021-11-03 11:15:42.861239', '2021-11-03 11:17:19.765244', false);
INSERT INTO parametros.parametro_periodo VALUES (232, 518, 3, '{
    "NumFactor": 2.000,
 "Costo": 60600
}', '2021-11-03 11:15:42.855116', '2021-11-03 11:17:22.937967', false);
INSERT INTO parametros.parametro_periodo VALUES (231, 517, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:15:42.849212', '2021-11-03 11:17:25.712925', false);
INSERT INTO parametros.parametro_periodo VALUES (230, 516, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2021-11-03 11:15:42.842922', '2021-11-03 11:17:48.516154', false);
INSERT INTO parametros.parametro_periodo VALUES (229, 515, 3, '{
    "NumFactor": 2.000,
 "Costo": 60600
}', '2021-11-03 11:15:42.836888', '2021-11-03 11:18:49.0331', false);
INSERT INTO parametros.parametro_periodo VALUES (228, 514, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:15:42.83042', '2021-11-03 11:18:52.085144', false);
INSERT INTO parametros.parametro_periodo VALUES (214, 500, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:15:08.620548', '2021-11-03 11:18:55.918146', false);
INSERT INTO parametros.parametro_periodo VALUES (213, 499, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:15:08.608574', '2021-11-03 11:18:58.833039', false);
INSERT INTO parametros.parametro_periodo VALUES (212, 498, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:15:08.602474', '2021-11-03 11:19:01.510764', false);
INSERT INTO parametros.parametro_periodo VALUES (227, 513, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:15:42.824094', '2021-11-03 11:19:04.053418', false);
INSERT INTO parametros.parametro_periodo VALUES (226, 512, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:15:42.817989', '2021-11-03 11:19:06.762831', false);
INSERT INTO parametros.parametro_periodo VALUES (211, 497, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2021-11-03 11:15:08.596274', '2021-11-03 11:19:10.789614', false);
INSERT INTO parametros.parametro_periodo VALUES (210, 496, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:15:08.588994', '2021-11-03 11:19:13.802268', false);
INSERT INTO parametros.parametro_periodo VALUES (209, 495, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2021-11-03 11:15:08.582886', '2021-11-03 11:19:24.164736', false);
INSERT INTO parametros.parametro_periodo VALUES (208, 494, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2021-11-03 11:15:08.5749', '2021-11-03 11:19:27.005341', false);
INSERT INTO parametros.parametro_periodo VALUES (207, 493, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:15:08.568514', '2021-11-03 11:19:30.74776', false);
INSERT INTO parametros.parametro_periodo VALUES (225, 511, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2021-11-03 11:15:42.811898', '2021-11-03 11:19:33.712084', false);
INSERT INTO parametros.parametro_periodo VALUES (206, 492, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:15:08.561689', '2021-11-03 11:19:44.152737', false);
INSERT INTO parametros.parametro_periodo VALUES (224, 510, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:15:42.805838', '2021-11-03 11:19:55.327807', false);
INSERT INTO parametros.parametro_periodo VALUES (203, 483, 3, '{
    "NumFactor": 0.500 
}', '2021-10-15 14:57:55.336447', '2021-11-03 11:19:58.010645', false);
INSERT INTO parametros.parametro_periodo VALUES (199, 479, 3, '{
    "NumFactor": 0.600,
 "Costo": 18200
}', '2021-10-06 10:25:30.634652', '2021-11-03 11:20:01.901895', false);
INSERT INTO parametros.parametro_periodo VALUES (222, 508, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2021-11-03 11:15:42.793551', '2021-11-03 11:20:09.857899', false);
INSERT INTO parametros.parametro_periodo VALUES (221, 507, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:15:42.787482', '2021-11-03 11:20:21.425049', false);
INSERT INTO parametros.parametro_periodo VALUES (220, 506, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:15:42.781103', '2021-11-03 11:20:24.356755', false);
INSERT INTO parametros.parametro_periodo VALUES (219, 505, 3, '{
    "NumFactor": 0.500 
}', '2021-11-03 11:15:08.660096', '2021-11-03 11:20:27.030244', false);
INSERT INTO parametros.parametro_periodo VALUES (218, 504, 3, '{
    "NumFactor": 0.600,
 "Costo": 18200
}', '2021-11-03 11:15:08.65191', '2021-11-03 11:20:30.36608', false);
INSERT INTO parametros.parametro_periodo VALUES (217, 503, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:15:08.645615', '2021-11-03 11:21:39.776076', false);
INSERT INTO parametros.parametro_periodo VALUES (216, 502, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2021-11-03 11:15:08.639486', '2021-11-03 11:21:42.472604', false);
INSERT INTO parametros.parametro_periodo VALUES (215, 501, 3, '{
    "NumFactor": 2.000,
 "Costo": 60600
}', '2021-11-03 11:15:08.63319', '2021-11-03 11:21:45.344433', false);
INSERT INTO parametros.parametro_periodo VALUES (101, 101, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2021-01-06 11:48:48.181688', '2021-11-03 11:21:48.383928', false);
INSERT INTO parametros.parametro_periodo VALUES (198, 348, 9, NULL, '2021-09-18 12:32:49.012106', '2022-03-07 10:54:11.119362', false);
INSERT INTO parametros.parametro_periodo VALUES (86, 86, 1, '{
    "NumFactor": 0.100,
 "Costo": 2800
}', '2020-12-30 10:11:20.993004', '2022-01-07 11:39:35.461979', false);
INSERT INTO parametros.parametro_periodo VALUES (246, 532, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:15:42.943368', '2021-11-03 11:16:10.362727', false);
INSERT INTO parametros.parametro_periodo VALUES (245, 531, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:15:42.936759', '2021-11-03 11:16:15.54226', false);
INSERT INTO parametros.parametro_periodo VALUES (244, 530, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2021-11-03 11:15:42.92983', '2021-11-03 11:16:19.485673', false);
INSERT INTO parametros.parametro_periodo VALUES (243, 529, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:15:42.923088', '2021-11-03 11:16:23.649276', false);
INSERT INTO parametros.parametro_periodo VALUES (242, 528, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2021-11-03 11:15:42.917055', '2021-11-03 11:16:26.848388', false);
INSERT INTO parametros.parametro_periodo VALUES (241, 527, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2021-11-03 11:15:42.911233', '2021-11-03 11:16:30.622401', false);
INSERT INTO parametros.parametro_periodo VALUES (240, 526, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:15:42.905267', '2021-11-03 11:16:57.979939', false);
INSERT INTO parametros.parametro_periodo VALUES (239, 525, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:15:42.899259', '2021-11-03 11:17:01.042372', false);
INSERT INTO parametros.parametro_periodo VALUES (238, 524, 3, '{
    "NumFactor": 0.500 
}', '2021-11-03 11:15:42.892576', '2021-11-03 11:17:04.251996', false);
INSERT INTO parametros.parametro_periodo VALUES (247, 533, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:15:42.950607', '2021-11-03 11:21:54.026984', false);
INSERT INTO parametros.parametro_periodo VALUES (276, 488, 3, '{ "ValorMensual": 7522595}', '2021-11-04 22:32:26.239162', '2021-11-04 22:32:26.23929', true);
INSERT INTO parametros.parametro_periodo VALUES (277, 487, 3, '{ "ValorMensual": 5641946}', '2021-11-04 22:34:40.196219', '2021-11-04 22:34:40.196309', true);
INSERT INTO parametros.parametro_periodo VALUES (278, 486, 3, '{ "ValorMensual": 4325492}', '2021-11-04 22:36:40.659579', '2021-11-04 22:36:40.659681', true);
INSERT INTO parametros.parametro_periodo VALUES (279, 485, 3, '{ "ValorMensual": 2820973}', '2021-11-04 22:38:35.21458', '2021-11-04 22:38:35.214669', true);
INSERT INTO parametros.parametro_periodo VALUES (280, 484, 3, '{ "ValorMensual": 2350811}', '2021-11-04 22:39:52.804032', '2021-11-04 22:39:52.804162', true);
INSERT INTO parametros.parametro_periodo VALUES (274, 560, 2, '{
    "NumFactor": 0.250,
 "Costo": 7300
}', '2021-11-03 11:40:27.790404', '2021-11-08 11:22:57.215932', false);
INSERT INTO parametros.parametro_periodo VALUES (273, 559, 2, '{
    "NumFactor": 0.500,
 "Costo": 14600
}', '2021-11-03 11:39:37.66275', '2021-11-08 11:23:00.567486', false);
INSERT INTO parametros.parametro_periodo VALUES (288, 580, 3, '{
    "NumFactor": 0.300,
 "Costo": 9100
}', '2021-11-22 12:30:19.372869', '2022-01-11 22:44:06.852763', false);
INSERT INTO parametros.parametro_periodo VALUES (248, 534, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:22:54.552383', '2021-11-03 11:23:58.594433', false);
INSERT INTO parametros.parametro_periodo VALUES (249, 535, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2021-11-03 11:22:54.565494', '2021-11-03 11:24:01.299599', false);
INSERT INTO parametros.parametro_periodo VALUES (250, 536, 3, '{
    "NumFactor": 2.000,
 "Costo": 60600
}', '2021-11-03 11:22:54.571775', '2021-11-03 11:24:04.451436', false);
INSERT INTO parametros.parametro_periodo VALUES (259, 545, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:22:54.630364', '2021-11-03 11:31:20.421008', false);
INSERT INTO parametros.parametro_periodo VALUES (251, 537, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:22:54.58109', '2021-11-03 11:31:43.352234', false);
INSERT INTO parametros.parametro_periodo VALUES (252, 538, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:22:54.587312', '2021-11-03 11:31:46.150805', false);
INSERT INTO parametros.parametro_periodo VALUES (253, 539, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:22:54.593771', '2021-11-03 11:31:48.966669', false);
INSERT INTO parametros.parametro_periodo VALUES (254, 540, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2021-11-03 11:22:54.6', '2021-11-03 11:31:52.936379', false);
INSERT INTO parametros.parametro_periodo VALUES (255, 541, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:22:54.606095', '2021-11-03 11:31:55.759306', false);
INSERT INTO parametros.parametro_periodo VALUES (256, 542, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2021-11-03 11:22:54.61226', '2021-11-03 11:31:58.684909', false);
INSERT INTO parametros.parametro_periodo VALUES (257, 543, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2021-11-03 11:22:54.618396', '2021-11-03 11:32:01.589081', false);
INSERT INTO parametros.parametro_periodo VALUES (258, 544, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:22:54.62441', '2021-11-03 11:32:05.98145', false);
INSERT INTO parametros.parametro_periodo VALUES (287, 579, 3, '{ "NumFactor": 0.200 }', '2021-11-22 10:56:19.134185', '2021-11-22 11:25:24.37449', false);
INSERT INTO parametros.parametro_periodo VALUES (286, 566, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-08 11:28:06.47044', '2022-01-11 22:46:12.678884', false);
INSERT INTO parametros.parametro_periodo VALUES (289, 581, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-22 12:30:19.424655', '2022-01-11 22:46:16.478154', false);
INSERT INTO parametros.parametro_periodo VALUES (295, 605, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2022-01-07 11:01:21.763478', '2022-01-11 22:44:10.206557', false);
INSERT INTO parametros.parametro_periodo VALUES (290, 582, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-22 12:30:19.43064', '2022-01-11 22:46:20.867978', false);
INSERT INTO parametros.parametro_periodo VALUES (283, 563, 2, '{
    "NumFactor": 4.000,
 "Costo": 117000
}', '2021-11-08 11:26:17.492438', '2022-04-01 01:26:48.274356', false);
INSERT INTO parametros.parametro_periodo VALUES (291, 595, 1, '{ "Valor": 14210 }', '2021-12-14 10:18:01.645218', '2021-12-14 10:18:01.645308', true);
INSERT INTO parametros.parametro_periodo VALUES (292, 596, 2, '{ "Valor": 14938 }', '2021-12-14 10:18:53.570273', '2021-12-14 10:18:53.570355', true);
INSERT INTO parametros.parametro_periodo VALUES (293, 597, 3, '{ "Valor": 15328 }', '2021-12-14 10:19:19.768119', '2021-12-14 10:19:19.768241', true);
INSERT INTO parametros.parametro_periodo VALUES (281, 561, 2, '{
    "NumFactor": 0.300,
 "Costo": 8800
}', '2021-11-08 11:24:05.392354', '2021-11-08 11:26:31.390332', true);
INSERT INTO parametros.parametro_periodo VALUES (272, 558, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:38:03.789229', '2021-11-03 11:38:44.001041', false);
INSERT INTO parametros.parametro_periodo VALUES (282, 562, 2, '{
    "NumFactor": 0.500,
 "Costo": 14600
}', '2021-11-08 11:24:20.659168', '2021-11-08 11:26:31.396229', true);
INSERT INTO parametros.parametro_periodo VALUES (294, 604, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2022-01-07 11:01:21.711555', '2022-01-11 22:42:20.834137', false);
INSERT INTO parametros.parametro_periodo VALUES (275, 489, 3, '{ "ValorMensual": 9215179}', '2021-11-04 22:30:19.576399', '2021-11-04 22:30:19.576494', true);
INSERT INTO parametros.parametro_periodo VALUES (260, 546, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:36:28.026712', '2022-03-24 10:03:18.129402', true);
INSERT INTO parametros.parametro_periodo VALUES (305, 615, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2022-01-07 11:01:21.86053', '2022-01-11 22:43:34.62535', false);
INSERT INTO parametros.parametro_periodo VALUES (304, 614, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2022-01-07 11:01:21.851794', '2022-01-11 22:43:41.610786', false);
INSERT INTO parametros.parametro_periodo VALUES (284, 564, 3, '{
    "NumFactor": 0.300,
 "Costo": 9100
}', '2021-11-08 11:28:06.449331', '2022-01-11 22:44:03.858004', false);
INSERT INTO parametros.parametro_periodo VALUES (296, 606, 3, '{
    "NumFactor": 2.000,
 "Costo": 60600
}', '2022-01-07 11:01:21.773531', '2022-01-11 22:44:24.98356', false);
INSERT INTO parametros.parametro_periodo VALUES (297, 607, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2022-01-07 11:01:21.788116', '2022-01-11 22:44:36.337047', false);
INSERT INTO parametros.parametro_periodo VALUES (298, 608, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2022-01-07 11:01:21.796787', '2022-01-11 22:44:47.355649', false);
INSERT INTO parametros.parametro_periodo VALUES (299, 609, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2022-01-07 11:01:21.805754', '2022-01-11 22:45:04.674828', false);
INSERT INTO parametros.parametro_periodo VALUES (300, 610, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2022-01-07 11:01:21.814846', '2022-01-11 22:45:19.044842', false);
INSERT INTO parametros.parametro_periodo VALUES (301, 611, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2022-01-07 11:01:21.824636', '2022-01-11 22:45:30.044532', false);
INSERT INTO parametros.parametro_periodo VALUES (302, 612, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2022-01-07 11:01:21.83303', '2022-01-11 22:45:39.018707', false);
INSERT INTO parametros.parametro_periodo VALUES (303, 613, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2022-01-07 11:01:21.841938', '2022-01-11 22:45:46.499798', false);
INSERT INTO parametros.parametro_periodo VALUES (285, 565, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-08 11:28:06.463486', '2022-01-11 22:46:08.431584', false);
INSERT INTO parametros.parametro_periodo VALUES (261, 547, 3, '{
    "NumFactor": 0.250,
 "Costo": 7600
}', '2021-11-03 11:36:28.035693', '2022-03-24 10:03:18.13754', true);
INSERT INTO parametros.parametro_periodo VALUES (263, 549, 3, '{
    "NumFactor": 5.000,
 "Costo": 151400
}', '2021-11-03 11:36:28.047394', '2022-03-24 10:03:18.141999', true);
INSERT INTO parametros.parametro_periodo VALUES (264, 550, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:36:28.053113', '2022-03-24 10:03:18.14617', true);
INSERT INTO parametros.parametro_periodo VALUES (266, 552, 3, '{
    "NumFactor": 1.000,
 "Costo": 30300
}', '2021-11-03 11:36:28.065', '2022-03-24 10:03:18.150762', true);
INSERT INTO parametros.parametro_periodo VALUES (267, 553, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:36:28.070851', '2022-03-24 10:03:18.155012', true);
INSERT INTO parametros.parametro_periodo VALUES (306, 616, 3, '{
    "NumFactor": 0.300,
 "Costo": 9100
}', '2022-01-07 11:01:21.869327', '2022-01-11 22:44:13.006969', false);
INSERT INTO parametros.parametro_periodo VALUES (309, 619, 3, '{
    "NumFactor": 0.300,
 "Costo": 9100
}', '2022-01-07 11:01:21.898519', '2022-01-11 22:44:16.197006', false);
INSERT INTO parametros.parametro_periodo VALUES (307, 617, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2022-01-07 11:01:21.881', '2022-01-11 22:46:23.814948', false);
INSERT INTO parametros.parametro_periodo VALUES (308, 618, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2022-01-07 11:01:21.889757', '2022-01-11 22:46:27.111605', false);
INSERT INTO parametros.parametro_periodo VALUES (328, 1005, 25, '{
    "NumFactor": 5.000,
 "Costo": 166700
}', '2022-05-02 19:12:29.33239', '2022-05-24 18:27:16.585419', true);
INSERT INTO parametros.parametro_periodo VALUES (329, 1006, 25, '{
    "NumFactor": 4.000,
 "Costo": 133300
}', '2022-05-02 19:12:29.339071', '2022-05-24 18:27:16.589919', true);
INSERT INTO parametros.parametro_periodo VALUES (312, 641, 25, NULL, '2022-01-19 18:29:55.392308', '2022-01-19 18:29:55.392407', true);
INSERT INTO parametros.parametro_periodo VALUES (313, 642, 25, NULL, '2022-01-19 18:30:14.49649', '2022-01-19 18:30:14.496564', true);
INSERT INTO parametros.parametro_periodo VALUES (314, 643, 25, NULL, '2022-01-19 18:30:43.470961', '2022-01-19 18:30:43.471049', true);
INSERT INTO parametros.parametro_periodo VALUES (315, 644, 25, NULL, '2022-01-19 18:30:48.658364', '2022-01-19 18:30:48.65846', true);
INSERT INTO parametros.parametro_periodo VALUES (316, 1, 25, '{ "Valor": 1000000 }', '2022-02-08 13:28:04.402724', '2022-02-08 13:28:04.402837', true);
INSERT INTO parametros.parametro_periodo VALUES (330, 1007, 25, '{
    "NumFactor": 1.000,
 "Costo": 33300
}', '2022-05-02 19:12:29.344531', '2022-05-24 18:27:16.594695', true);
INSERT INTO parametros.parametro_periodo VALUES (331, 1008, 25, '{
    "NumFactor": 3.000,
 "Costo": 100000
}', '2022-05-02 19:12:29.35159', '2022-05-24 18:27:16.599319', true);
INSERT INTO parametros.parametro_periodo VALUES (332, 1009, 25, '{
    "NumFactor": 0.080,
 "Costo": 80000
}', '2022-05-02 19:12:29.357575', '2022-05-24 18:27:16.60377', true);
INSERT INTO parametros.parametro_periodo VALUES (319, 356, 12, NULL, '2022-03-07 11:06:33.727487', '2022-03-07 11:07:50.678073', false);
INSERT INTO parametros.parametro_periodo VALUES (333, 1010, 25, '{
    "NumFactor": 0.100,
 "Costo": 3300
}', '2022-05-02 19:12:29.363317', '2022-05-24 18:27:16.608965', true);
INSERT INTO parametros.parametro_periodo VALUES (334, 1011, 25, '{
    "NumFactor": 3.000,
 "Costo": 100000
}', '2022-05-02 19:12:29.368873', '2022-05-24 18:27:16.616791', true);
INSERT INTO parametros.parametro_periodo VALUES (335, 1012, 25, '{
    "NumFactor": 4.000,
 "Costo": 133300
}', '2022-05-02 19:12:29.374384', '2022-05-24 18:27:16.621642', true);
INSERT INTO parametros.parametro_periodo VALUES (336, 1013, 25, '{
    "NumFactor": 2.900,
 "Costo": 96700
}', '2022-05-02 19:12:29.379944', '2022-05-24 18:27:16.626436', true);
INSERT INTO parametros.parametro_periodo VALUES (337, 1014, 25, '{
    "NumFactor": 0.500,
 "Costo": 16700
}', '2022-05-02 19:12:29.385155', '2022-05-24 18:27:16.6316', true);
INSERT INTO parametros.parametro_periodo VALUES (338, 1015, 25, '{
    "NumFactor": 4.000,
 "Costo": 133300
}', '2022-05-02 19:12:29.390573', '2022-05-24 18:27:16.63598', true);
INSERT INTO parametros.parametro_periodo VALUES (339, 1016, 25, '{
    "NumFactor": 0.500,
 "Costo": 16700
}', '2022-05-02 19:12:29.400195', '2022-05-24 18:27:16.640499', true);
INSERT INTO parametros.parametro_periodo VALUES (340, 1018, 25, '{
    "NumFactor": 1.000,
 "Costo": 33300
}', '2022-05-02 19:15:22.701581', '2022-05-24 18:27:16.645058', true);
INSERT INTO parametros.parametro_periodo VALUES (320, 789, 3, '{ "NumFactor": 123.000 }', '2022-03-24 09:59:34.763343', '2022-03-24 10:00:47.634915', false);
INSERT INTO parametros.parametro_periodo VALUES (268, 554, 3, '{
    "NumFactor": 0.080,
 "Costo": 72700
}', '2021-11-03 11:36:28.076185', '2022-03-24 10:03:18.159023', true);
INSERT INTO parametros.parametro_periodo VALUES (269, 555, 3, '{
    "NumFactor": 0.100,
 "Costo": 3000
}', '2021-11-03 11:36:28.082081', '2022-03-24 10:03:18.163654', true);
INSERT INTO parametros.parametro_periodo VALUES (270, 556, 3, '{
    "NumFactor": 3.000,
 "Costo": 90900
}', '2021-11-03 11:36:28.087713', '2022-03-24 10:03:18.168466', true);
INSERT INTO parametros.parametro_periodo VALUES (271, 557, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2021-11-03 11:36:28.093474', '2022-03-24 10:03:18.174092', true);
INSERT INTO parametros.parametro_periodo VALUES (262, 548, 3, '{
    "NumFactor": 2.900,
 "Costo": 87800
}', '2021-11-03 11:36:28.041422', '2022-03-24 10:03:18.178823', true);
INSERT INTO parametros.parametro_periodo VALUES (310, 620, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2022-01-07 11:01:21.907434', '2022-03-24 10:03:18.183431', true);
INSERT INTO parametros.parametro_periodo VALUES (311, 621, 3, '{
    "NumFactor": 4.000,
 "Costo": 121100
}', '2022-01-07 11:01:21.916034', '2022-03-24 10:03:18.187607', true);
INSERT INTO parametros.parametro_periodo VALUES (265, 551, 3, '{
    "NumFactor": 0.500,
 "Costo": 15100
}', '2021-11-03 11:36:28.058871', '2022-03-24 10:03:18.192261', true);
INSERT INTO parametros.parametro_periodo VALUES (321, 790, 3, '{
    "NumFactor": 123.000,
 "Costo": 3725000
}', '2022-03-24 10:01:02.535212', '2022-04-01 01:21:23.411927', false);
INSERT INTO parametros.parametro_periodo VALUES (317, 348, 12, NULL, '2022-03-07 10:55:18.614', '2022-04-21 10:14:37.755647', true);
INSERT INTO parametros.parametro_periodo VALUES (318, 347, 12, NULL, '2022-03-07 11:05:48.443629', '2022-04-21 10:14:40.80219', true);
INSERT INTO parametros.parametro_periodo VALUES (325, 995, 25, '{ "Valor": 16441 }', '2022-04-21 21:31:26.112238', '2022-04-21 21:31:26.11235', true);
INSERT INTO parametros.parametro_periodo VALUES (322, 803, 25, '{
    "NumFactor": 0.500,
 "Costo": 16700
}', '2022-03-30 15:10:36.285845', '2022-05-24 18:27:16.552756', true);
INSERT INTO parametros.parametro_periodo VALUES (326, 1003, 25, '{
    "NumFactor": 0.500,
 "Costo": 16700
}', '2022-05-02 19:12:29.28995', '2022-05-24 18:27:16.57166', true);
INSERT INTO parametros.parametro_periodo VALUES (327, 1004, 25, '{
    "NumFactor": 0.250,
 "Costo": 8300
}', '2022-05-02 19:12:29.323797', '2022-05-24 18:27:16.580202', true);
INSERT INTO parametros.parametro_periodo VALUES (343, 1061, 25, '{ "Valor": 38004}', '2022-10-14 00:06:49.358574', '2022-10-14 00:06:49.358666', true);
INSERT INTO parametros.parametro_periodo VALUES (344, 641, 35, NULL, '2022-10-20 09:41:26.005576', '2022-10-20 09:41:26.005679', true);
INSERT INTO parametros.parametro_periodo VALUES (345, 642, 35, NULL, '2022-10-20 09:42:05.231033', '2022-10-20 09:42:05.231127', true);
INSERT INTO parametros.parametro_periodo VALUES (346, 643, 35, NULL, '2022-10-20 09:42:26.362175', '2022-10-20 09:42:26.362251', true);
INSERT INTO parametros.parametro_periodo VALUES (347, 644, 35, NULL, '2022-10-20 09:43:02.404885', '2022-10-20 09:43:02.404974', true);
INSERT INTO parametros.parametro_periodo VALUES (348, 212, 3, '{ "Tarifa": 16,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0} ', '2022-11-05 21:16:05.319252', '2022-11-05 21:16:05.319352', true);
INSERT INTO parametros.parametro_periodo VALUES (355, 1061, 35, '{ "Valor": 42412 }', '2023-01-02 23:19:15.350032', '2023-01-02 23:19:15.350114', true);
INSERT INTO parametros.parametro_periodo VALUES (356, 212, 35, '{ "Tarifa": 16,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0}', '2023-01-03 00:08:29.766368', '2023-01-03 00:08:29.76647', true);
INSERT INTO parametros.parametro_periodo VALUES (357, 212, 35, '{ "Tarifa": 19,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0}', '2023-01-03 00:08:39.890703', '2023-01-03 00:08:39.890778', true);
INSERT INTO parametros.parametro_periodo VALUES (358, 212, 35, '{ "Tarifa": 0,"PorcentajeAplicacion": 100,"BaseUvt": 0,"BasePesos": 0}', '2023-01-03 00:08:47.116104', '2023-01-03 00:08:47.116206', true);
INSERT INTO parametros.parametro_periodo VALUES (359, 1, 35, '{ "Valor": 1160000 }', '2023-01-03 10:01:53.359731', '2023-01-03 10:01:53.359846', true);
INSERT INTO parametros.parametro_periodo VALUES (341, 347, 31, NULL, '2022-06-13 08:31:45.195526', '2023-01-26 17:21:46.189848', true);
INSERT INTO parametros.parametro_periodo VALUES (360, 348, 31, NULL, '2023-01-26 17:34:01.800828', '2023-01-26 17:34:01.800973', true);
INSERT INTO parametros.parametro_periodo VALUES (324, 348, 20, NULL, '2022-04-06 10:42:43.08869', '2023-06-06 00:34:33.799477', true);
INSERT INTO parametros.parametro_periodo VALUES (323, 347, 20, NULL, '2022-04-06 10:40:17.02931', '2023-07-19 09:45:29.305059', true);
INSERT INTO parametros.parametro_periodo VALUES (364, 4552, 35, '{"Valor": 18845}', '2023-07-17 09:20:56.650409', '2023-07-17 09:20:56.650409', true);
INSERT INTO parametros.parametro_periodo VALUES (365, 484, 25, '{ "ValorMensual": 2350811}', '2023-08-17 10:47:00.362941', '2023-08-17 10:47:00.365756', true);
INSERT INTO parametros.parametro_periodo VALUES (366, 484, 35, '{ "ValorMensual": 2659237}', '2023-08-17 15:51:04.296727', '2023-08-17 15:55:49.357423', true);
INSERT INTO parametros.parametro_periodo VALUES (367, 485, 35, '{ "ValorMensual": 3191085}', '2023-08-17 15:59:59.841128', '2023-08-17 15:59:59.841244', true);
INSERT INTO parametros.parametro_periodo VALUES (368, 486, 35, '{ "ValorMensual": 4892998}', '2023-08-17 16:00:59.362843', '2023-08-17 16:00:59.362963', true);
INSERT INTO parametros.parametro_periodo VALUES (369, 487, 35, '{ "ValorMensual": 6382169}', '2023-08-17 16:02:00.889799', '2023-08-17 16:02:00.889881', true);
INSERT INTO parametros.parametro_periodo VALUES (370, 488, 35, '{ "ValorMensual": 8509559}', '2023-08-17 16:02:57.363559', '2023-08-17 16:02:57.363673', true);
INSERT INTO parametros.parametro_periodo VALUES (371, 489, 35, '{ "ValorMensual": 10424210}', '2023-08-17 16:03:33.217604', '2023-08-17 16:03:33.217699', true);
INSERT INTO parametros.parametro_periodo VALUES (373, 1, 39, '{ "Valor": 1160000 }', '2023-10-17 22:34:38.479099', '2023-10-17 22:34:38.479219', true);
INSERT INTO parametros.parametro_periodo VALUES (372, 1, 39, '{ "Valor": 1160000 }', '2023-10-17 22:34:32.021995', '2023-10-17 22:35:35.64093', false);
INSERT INTO parametros.parametro_periodo VALUES (374, 4561, 39, '{
    "NumFactor": 0.250,
 "Costo": 9700
}', '2023-10-17 22:36:37.180029', '2023-10-17 22:38:40.591659', true);
INSERT INTO parametros.parametro_periodo VALUES (375, 4562, 39, '{
    "NumFactor": 2.000,
 "Costo": 77300
}', '2023-10-17 22:37:01.644416', '2023-10-17 22:38:40.599267', true);
INSERT INTO parametros.parametro_periodo VALUES (376, 4563, 39, '{
    "NumFactor": 5.000,
 "Costo": 193300
}', '2023-10-17 22:37:23.748577', '2023-10-17 22:38:40.607343', true);
INSERT INTO parametros.parametro_periodo VALUES (377, 4564, 39, '{
    "NumFactor": 4.000,
 "Costo": 154700
}', '2023-10-17 22:37:44.695049', '2023-10-17 22:38:40.614364', true);
INSERT INTO parametros.parametro_periodo VALUES (378, 4565, 39, '{
    "NumFactor": 3.000,
 "Costo": 116000
}', '2023-10-17 22:38:07.141081', '2023-10-17 22:38:40.621321', true);
INSERT INTO parametros.parametro_periodo VALUES (379, 4566, 39, '{
    "NumFactor": 4.000,
 "Costo": 154700
}', '2023-10-17 22:38:27.164226', '2023-10-17 22:38:40.627723', true);
INSERT INTO parametros.parametro_periodo VALUES (361, 347, 36, NULL, '2023-07-17 14:08:27.90553', '2023-10-18 22:22:28.064802', false);


--
-- TOC entry 6851 (class 0 OID 524034)
-- Dependencies: 514
-- Data for Name: periodo; Type: TABLE DATA; Schema: parametros; Owner: -
--

INSERT INTO parametros.periodo VALUES (12, '2021-2', 'Periodo académico 2021-2', 2021, '2', 'PA', false, 41, '2021-06-30 00:00:00', '2021-12-23 00:00:00', '2021-06-25 08:23:13.514887', '2022-04-04 08:24:20.964095');
INSERT INTO parametros.periodo VALUES (3, '2021', 'Vigencia 2021', 2021, '', 'VG', true, 0, '2021-01-01 00:00:00', '2021-12-31 23:59:59', '2020-12-11 11:45:38.176033', '2020-12-22 19:28:33.499947');
INSERT INTO parametros.periodo VALUES (9, '2020-3', 'Periodo académico 2020-3', 2020, '3', 'PA', false, 41, '2020-08-15 00:00:00', '2020-12-30 00:00:00', '2020-12-22 20:47:05.436346', '2022-04-04 12:48:57.898335');
INSERT INTO parametros.periodo VALUES (1, '2019', 'Vigencia 2019', 2019, '', 'VG', false, 0, '2019-01-01 00:00:00', '2019-12-31 23:59:59', '2020-12-11 11:44:32.104418', '2020-12-23 14:39:58.00404');
INSERT INTO parametros.periodo VALUES (8, '2020-2', 'Periodo académico 2020-2', 2020, '2', 'PA', false, 41, '2020-06-14 00:00:00', '2020-08-15 00:00:00', '2020-12-22 20:15:24.884019', '2020-12-23 14:47:56.775482');
INSERT INTO parametros.periodo VALUES (2, '2020', 'Vigencia 2020', 2020, '', 'VG', false, 0, '2020-01-01 00:00:00', '2020-12-31 23:59:59', '2020-12-11 11:45:01.732628', '2020-12-22 18:05:51.420325');
INSERT INTO parametros.periodo VALUES (6, '2019-3', 'Periodo académico 2019-3', 2019, '3', 'PA', false, 41, '2019-08-11 00:00:00', '2019-12-21 00:00:00', '2020-12-22 20:01:27.151562', '2021-08-18 06:39:17.809734');
INSERT INTO parametros.periodo VALUES (25, '2022', 'Vigencia 2022', 2022, '', 'VG', true, 0, '2022-01-01 00:00:00', '2022-12-31 23:59:59', '2022-01-19 18:23:50.258473', '2022-01-19 18:23:50.258599');
INSERT INTO parametros.periodo VALUES (35, '2023', 'Vigencia 2023', 2023, '', 'VG', true, 0, '2023-01-01 00:00:00', '2023-12-31 23:59:59', '2022-07-04 19:00:29.399092', '2022-07-04 19:00:29.399199');
INSERT INTO parametros.periodo VALUES (11, 'Fecha vigencia formulario reliquidación', 'Determina en que fecha va a estar habilitado el formulario', 2021, '', 'PRFRLQ', true, 0, '2021-01-01 05:00:00', '2021-12-31 05:00:00', '2021-03-29 20:51:16.733739', '2021-06-29 19:59:16.37115');
INSERT INTO parametros.periodo VALUES (7, '2020-1', 'Periodo académico 2020-1', 2020, '1', 'PA', false, 41, '2020-01-01 00:00:00', '2020-06-13 00:00:00', '2020-12-22 20:07:38.766666', '2022-03-30 16:24:05.113523');
INSERT INTO parametros.periodo VALUES (33, '2023-1', 'Periodo académico 2023-1', 2023, '1', 'PA', false, 41, '2023-03-12 00:00:00', '2023-06-30 00:00:00', '2022-03-18 13:56:40.112307', '2023-06-27 10:17:43.089284');
INSERT INTO parametros.periodo VALUES (10, '2021-1', 'Periodo académico 2021-1', 2021, '1', 'PA', false, 41, '2021-01-01 00:00:00', '2021-06-30 00:00:00', '2021-02-25 08:20:36.420531', '2023-06-27 10:43:17.100793');
INSERT INTO parametros.periodo VALUES (20, '2021-3', 'Periodo académico 2021-3', 2021, '3', 'PA', false, 41, '2021-07-31 00:00:00', '2021-12-30 00:00:00', '2021-08-18 06:43:16.709228', '2023-06-27 10:44:08.640842');
INSERT INTO parametros.periodo VALUES (31, '2022-1', 'Periodo académico 2022-1', 2022, '1', 'PA', false, 41, '2022-03-08 00:00:00', '2022-06-30 00:00:00', '2022-03-11 11:18:15.094268', '2023-06-27 11:15:10.937294');
INSERT INTO parametros.periodo VALUES (39, '2024', 'Vigencia 2024', 2024, '', 'VG', true, 0, '2024-01-01 00:00:00', '2024-12-31 23:59:59', '2023-08-17 10:52:07.769063', '2023-08-17 10:52:07.769147');
INSERT INTO parametros.periodo VALUES (40, '2024-1', 'Periodo académico 2024-1', 2024, '1', 'PA', true, 41, '2023-09-01 00:00:00', '2024-07-17 00:00:00', '2023-10-17 16:48:09.892758', '2023-10-17 16:48:09.893668');
INSERT INTO parametros.periodo VALUES (36, '2023-3', 'Periodo académico 2023-3', 2023, '3', 'PA', false, 41, '2023-05-01 00:00:00', '2023-12-27 00:00:00', '2022-07-14 10:25:00.119575', '2023-10-17 16:48:59.458847');


--
-- TOC entry 6847 (class 0 OID 524018)
-- Dependencies: 510
-- Data for Name: tipo_parametro; Type: TABLE DATA; Schema: parametros; Owner: -
--

INSERT INTO parametros.tipo_parametro VALUES (1, 'Salario minimo', 'Historico de salario minimo en cada vigencia', 'SMMLV', true, 1.00, '2020-12-11 11:41:02.297358', '2020-12-11 11:41:02.297464', 1);
INSERT INTO parametros.tipo_parametro VALUES (2, 'Derechos Pecuniarios', 'Conceptos de derechos pecuniarios', 'DP', true, 2.00, '2020-12-11 11:41:40.517732', '2020-12-11 11:41:40.517837', 1);
INSERT INTO parametros.tipo_parametro VALUES (3, 'Áreas de Conocimiento (COLCIENCIAS)', 'Áreas de Conocimiento (COLCIENCIAS)', 'ACC', true, 3.00, '2021-01-07 16:52:00', '2021-01-07 16:52:00', 3);
INSERT INTO parametros.tipo_parametro VALUES (43, 'Clase de transacción', 'Clase de transacción para conceptos', 'CT', false, 0.00, '2022-01-10 14:21:41.013044', '2022-01-10 14:21:41.013133', 8);
INSERT INTO parametros.tipo_parametro VALUES (44, 'Tipo de transacción', 'Tipo de transacción para conceptos', 'TT', true, 0.00, '2022-01-10 14:23:42.067287', '2022-01-10 14:23:42.067385', 8);
INSERT INTO parametros.tipo_parametro VALUES (4, 'Áreas de Conocimiento', 'Áreas de Conocimiento', 'AC', true, 4.00, '2021-01-08 19:33:00', '2021-01-08 19:33:00', 3);
INSERT INTO parametros.tipo_parametro VALUES (5, 'Longitud', 'Longitud', 'L', true, 5.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4);
INSERT INTO parametros.tipo_parametro VALUES (6, 'Masa', 'Masa', 'M', true, 6.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4);
INSERT INTO parametros.tipo_parametro VALUES (7, 'Tiempo', 'Tiempo', 'T', true, 7.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4);
INSERT INTO parametros.tipo_parametro VALUES (8, 'Capacidad', 'Capacidad', 'C', true, 8.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4);
INSERT INTO parametros.tipo_parametro VALUES (9, 'Volumen', 'Volumen', 'V', true, 9.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4);
INSERT INTO parametros.tipo_parametro VALUES (10, 'Superficie', 'Superficie', 'S', true, 10.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 4);
INSERT INTO parametros.tipo_parametro VALUES (11, 'Modalidad Selección', 'Modalidad Selección', 'MS', true, 11.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 5);
INSERT INTO parametros.tipo_parametro VALUES (12, 'Impuestos', 'Impuestos', 'I', true, 12.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 6);
INSERT INTO parametros.tipo_parametro VALUES (13, 'Modalidad Investigación', 'Modalidad Investigación', 'MI', true, 13.00, '2021-01-08 19:42:00', '2021-01-08 19:42:00', 7);
INSERT INTO parametros.tipo_parametro VALUES (14, 'Tipo Vinculación', 'Tipo Vinculación', 'TV', true, 14.00, '2021-01-28 15:23:00', '2021-01-28 15:23:00', 5);
INSERT INTO parametros.tipo_parametro VALUES (15, 'Cargos', 'Cargos', 'C', true, 15.00, '2021-01-28 15:23:00', '2021-01-28 15:23:00', 5);
INSERT INTO parametros.tipo_parametro VALUES (16, 'Tipo Compromiso Presupuesto', 'Tipos de compromiso para el sistema de presupuesto', 'TCP', true, 16.00, '2021-02-12 00:43:19.865828', '2021-02-12 00:43:19.866009', 8);
INSERT INTO parametros.tipo_parametro VALUES (17, 'Estados Orden de pago', 'Estados de la ordenes de pago', 'EOP', true, 0.00, '2021-02-12 22:08:42.306932', '2021-02-12 22:08:42.307034', 9);
INSERT INTO parametros.tipo_parametro VALUES (18, 'Avances', 'Parametros para avances', 'AVC', true, 0.00, '2021-02-23 17:08:42.306932', '2021-02-23 17:09:42.306932', 8);
INSERT INTO parametros.tipo_parametro VALUES (19, 'Estado transaccion contable', 'Estado de una transaccion contable usado en la tabla transaccion del api movimientos_contables_crud', 'ETC', true, 0.00, '2021-03-05 16:07:25.602787', '2021-03-05 16:07:25.602891', 8);
INSERT INTO parametros.tipo_parametro VALUES (20, 'Tipo movimiento contable', 'Tipo de movimiento contable usado en la tabla movimiento del api movimientos_contables_crud', 'TMC', true, 0.00, '2021-03-05 16:14:21.679469', '2021-03-05 16:14:21.679575', 8);
INSERT INTO parametros.tipo_parametro VALUES (21, 'Apoyo alimentario', 'historico servicio apoyo alimentario Bienestar UD', 'APAL', true, 0.00, '2021-03-15 12:51:16.997451', '2021-03-15 12:51:16.997544', 10);
INSERT INTO parametros.tipo_parametro VALUES (24, 'Descripción Espacio Físico', 'Características físicas de un espacio', 'DEF', true, 0.00, '2021-03-19 12:55:34.361072', '2021-03-19 12:55:34.361164', 11);
INSERT INTO parametros.tipo_parametro VALUES (26, 'Tipo Preliquidacion', 'Corresponde al periodo a liquidar, primera quincena, segunda quincena, etc.', NULL, true, NULL, '2021-09-12 20:43:17.188255', '2021-09-12 20:43:17.188255', 13);
INSERT INTO parametros.tipo_parametro VALUES (27, 'Estado Preliquidacion', 'Tabla que parametriza los diferentes estados que tiene una preliquidacion', NULL, true, NULL, '2021-09-12 21:06:38.882779', '2021-09-12 21:06:38.882779', 13);
INSERT INTO parametros.tipo_parametro VALUES (28, 'Tipo Nomina', 'Tabla parametrica que lista los tipos de nomina dentro de la Universidad Distrital', NULL, true, NULL, '2021-09-12 21:23:36.354347', '2021-09-12 21:23:36.354347', 13);
INSERT INTO parametros.tipo_parametro VALUES (29, 'Nomina', 'Tabla que contiene las diferentes nominas presentes de la Universidad Distrital', NULL, true, NULL, '2021-09-12 21:43:28.597373', '2021-09-12 21:43:28.597373', 13);
INSERT INTO parametros.tipo_parametro VALUES (30, 'Estado concepto nomina', 'Describe si el concepto está activo o inactivo.', NULL, true, NULL, '2021-09-13 09:47:15.951886', '2021-09-13 09:47:15.951886', 13);
INSERT INTO parametros.tipo_parametro VALUES (31, 'Tipo concepto nomina', 'Describe si el concepto a la hora de ser calculado corresponde a un valor fijo o porcentual.', NULL, true, NULL, '2021-09-13 09:53:27.066448', '2021-09-13 09:53:27.066448', 13);
INSERT INTO parametros.tipo_parametro VALUES (32, 'Naturaleza concepto de nomina', 'Describe si el concepto es un devengo o un descuento, o si hace parte de seguridad social.', NULL, true, NULL, '2021-09-13 10:04:43.962768', '2021-09-13 10:04:43.962768', 13);
INSERT INTO parametros.tipo_parametro VALUES (33, 'Estado disponibilidad', 'Indica si el dinero para pagar dicho concepto se encuentra disponible', NULL, true, NULL, '2021-09-13 10:30:56.58809', '2021-09-13 10:30:56.58809', 13);
INSERT INTO parametros.tipo_parametro VALUES (34, 'Entidad Promotora de Salud', 'Registro EPS a la que puede estar afiliado un tercero', 'EPS', true, NULL, '2021-09-15 21:18:01.768956', '2021-09-15 21:18:01.768956', 14);
INSERT INTO parametros.tipo_parametro VALUES (35, 'Divisas', 'Tabla parametrica de las divisas para pagos en el extranjero', 'D', true, 0.00, '2021-10-14 11:50:09.987059', '2021-10-14 11:50:09.987142', 9);
INSERT INTO parametros.tipo_parametro VALUES (36, 'Perfiles de Contratación', 'Perfiles de contratación para contratistas', 'PC', true, 0.00, '2021-10-26 14:48:58.740789', '2021-10-26 14:48:58.740906', 5);
INSERT INTO parametros.tipo_parametro VALUES (37, 'Cuentas Bancarias', 'Tipos de cuentas bancarias usadas en Colombia ', 'CB', true, 0.00, '2021-11-17 19:36:22.046482', '2021-11-17 19:36:22.046574', 8);
INSERT INTO parametros.tipo_parametro VALUES (38, 'Tipo vehículo', 'Tipo de vehículo usado en práctica académica', 'TV', true, 0.00, '2021-11-19 00:31:43.893297', '2021-11-19 00:31:43.893297', 15);
INSERT INTO parametros.tipo_parametro VALUES (39, 'Tipos de resoluciones', 'Tipos de resoluciones', 'TR', true, 17.00, '2021-11-22 14:46:00.0838', '2021-11-22 14:46:00.083919', 5);
INSERT INTO parametros.tipo_parametro VALUES (41, 'Puntos Salariales', 'Puntos Salariales', 'PSAL', true, 18.00, '2021-12-14 09:54:37.031262', '2021-12-14 09:54:37.031369', 5);
INSERT INTO parametros.tipo_parametro VALUES (42, 'Estados de una resolución', 'Diferentes estados que puede tener uan resolución', 'ERES', true, 19.00, '2022-01-03 10:34:01.251735', '2022-01-03 10:34:01.251863', 5);
INSERT INTO parametros.tipo_parametro VALUES (47, 'Tipos de Documento', 'Tipo de documento para conceptos de tesoreria', 'TD', true, 0.00, '2022-02-15 10:26:07.828496', '2022-02-15 10:26:07.828638', 8);
INSERT INTO parametros.tipo_parametro VALUES (48, 'Conceptos', 'Conceptos de tesoreria y central cuentas', 'CON', true, 0.00, '2022-02-18 13:37:08.470648', '2022-02-18 13:37:08.470749', 8);
INSERT INTO parametros.tipo_parametro VALUES (49, 'Documentos solicitudes autorización giro', 'Documentos soporte para las solicitudes de autorización de giro', 'DOC_SOAG', false, 0.00, '2022-03-01 18:14:57.243334', '2022-03-01 18:14:57.243462', 8);
INSERT INTO parametros.tipo_parametro VALUES (50, 'Horarios de atención médica', 'Horarios de atención en el módulo de salud de Bienestar Institucional', 'HOR_ATE', true, 0.00, '2022-03-13 20:53:20.031183', '2022-03-13 20:53:20.031308', 10);
INSERT INTO parametros.tipo_parametro VALUES (53, 'Tipo Orden de Pago', 'Tipos de ordenes de pago', 'TOP', false, 0.00, '2022-04-05 00:48:26.496717', '2022-04-05 00:48:26.496788', 8);
INSERT INTO parametros.tipo_parametro VALUES (54, 'Retencion en la fuente', 'Retención en la fuente', 'RETE_FUENTE', false, 0.00, '2022-04-13 15:56:30.14135', '2022-04-13 15:56:30.141478', 8);
INSERT INTO parametros.tipo_parametro VALUES (57, 'Razones de devolucion', 'Razones de devolucion', 'R_DEV', false, 0.00, '2022-06-02 16:41:15.2069', '2022-06-02 16:41:15.207005', 8);
INSERT INTO parametros.tipo_parametro VALUES (58, 'Formas de pago', 'Formas de pago', 'F_PAGO', false, 0.00, '2022-06-02 16:56:33.762483', '2022-06-02 16:56:33.762575', 8);
INSERT INTO parametros.tipo_parametro VALUES (59, 'Tipos de Nomina', 'Tipos de Nomina', 'TN', false, 0.00, '2022-07-01 15:01:25.28148', '2022-07-01 15:01:25.281582', 8);
INSERT INTO parametros.tipo_parametro VALUES (60, 'Programas Académicos Colombia', 'Programas Académicos en Colombia', 'PROACACO', true, 0.00, '2022-10-10 10:33:41.025115', '2022-10-10 10:33:41.025226', 17);
INSERT INTO parametros.tipo_parametro VALUES (61, 'Unidad Ejecutora', 'Unidad Ejecutora', 'UE', false, 0.00, '2022-10-23 22:24:44.991501', '2022-10-23 22:24:44.99158', 18);
INSERT INTO parametros.tipo_parametro VALUES (63, 'Ente Rector', 'Ente emisor de resoluciones.', 'ER', true, 0.00, '2022-11-01 18:08:53.259914', '2022-11-01 18:08:53.260026', 18);
INSERT INTO parametros.tipo_parametro VALUES (64, 'Item informe', 'Item que se relaciona con el tipo de contrato del docente', 'ITEM_INF', true, 0.00, '2022-11-23 14:24:54.670886', '2022-11-23 14:24:54.670886', 19);
INSERT INTO parametros.tipo_parametro VALUES (65, 'Estado pago mensual', 'Describe el estado en el cual se encuenta el pago mensual de docentes', 'EPM', true, 0.00, '2022-11-23 14:27:12.180911', '2022-11-23 14:27:12.180911', 19);
INSERT INTO parametros.tipo_parametro VALUES (51, 'Clase Espacios Académicos', 'Parametros para Clases en Espacios Académicos', 'CLS-ESPACA', true, 51.00, '2022-03-30 09:01:48.593458', '2023-05-29 14:37:11.360926', 17);
INSERT INTO parametros.tipo_parametro VALUES (52, 'Calificaciones SGA', 'Parametros para las Calificaciones en el sistema SGA', 'ESPACA', true, 52.00, '2022-03-30 09:03:21.769128', '2023-05-29 14:34:08.921001', 17);
INSERT INTO parametros.tipo_parametro VALUES (55, 'Observaciones Calificaciones SGA', 'Parametros para Calificaciones', 'OBSCAL', true, 0.00, '2022-04-27 01:14:35.2801', '2023-05-29 14:34:49.183483', 17);
INSERT INTO parametros.tipo_parametro VALUES (68, 'Enfoque Espacios Académicos', 'Parametros para Enfoques en Espacios Académicos', 'ENFQ-ESPACA', true, 0.00, '2023-05-31 16:57:09.794375', '2023-05-31 16:57:09.794465', 17);
INSERT INTO parametros.tipo_parametro VALUES (67, 'Tipo Espacios Académicos', 'Parametros para Tipos en Espacios Académicos', 'TP-ESPACA', true, 0.00, '2023-05-29 14:37:56.259097', '2023-05-29 14:37:56.259174', 17);
INSERT INTO parametros.tipo_parametro VALUES (66, 'Estado Novedad', 'Estados en los que puede encontrarse la novedad de un contrato', 'ENOV', true, 0.00, '2023-05-02 00:00:00', '2023-07-04 16:25:49.693995', 20);
INSERT INTO parametros.tipo_parametro VALUES (69, 'Clasificación Revista', 'Clasifica la revista a la cual se envía el articulo academico', 'CLF_RVS', true, 0.00, '2023-07-16 13:44:52.121847', '2023-07-16 13:44:52.121847', 21);
INSERT INTO parametros.tipo_parametro VALUES (71, 'Detalle Prorroga', 'Detalles acerca de la prorroga asociada al trabajo de grado', 'DET_PRR', true, 0.00, '2023-09-12 18:19:55.916281', '2023-09-12 18:19:55.916281', 21);
INSERT INTO parametros.tipo_parametro VALUES (70, 'Detalle Articulo Academico', 'Detalles acerca del trabajo de grado en modalidad articulo academico', 'DET_ART', true, 0.00, '2023-07-18 19:13:30.729287', '2023-07-18 19:13:30.729287', 21);
INSERT INTO parametros.tipo_parametro VALUES (72, 'Detalle Pasantía Externa', 'Detalles acerca del trabajo de grado en modalidad pasantía externa', 'DET_PASEXT', true, 0.00, '2023-09-14 13:30:25.221508', '2023-09-14 13:30:25.221508', 21);
INSERT INTO parametros.tipo_parametro VALUES (73, 'Estado del trabajo de grado', 'Asigna el estado en el cual se encuentra el trabajo de grado', 'EST_TRG', true, 0.00, '2023-10-30 17:26:30.32236', '2023-10-30 17:26:30.32236', 21);
INSERT INTO parametros.tipo_parametro VALUES (74, 'Rol del trabajo de grado', 'Asigna el rol de cada participante del trabajo de grado', 'ROL_TRG', true, 0.00, '2023-10-30 23:13:59.226978', '2023-10-30 23:13:59.226978', 21);
INSERT INTO parametros.tipo_parametro VALUES (75, 'Estado Revisión Trabajo Grado', 'Determina el estado en el cual se encuentra la revisión del trabajo de grado', 'ESTREV_TRG', true, 0.00, '2023-10-31 13:05:59.438874', '2023-10-31 13:05:59.438874', 21);
INSERT INTO parametros.tipo_parametro VALUES (76, 'Modalidad', 'Asigna la modalidad en la cual se realiza el trabajo de grado', 'MOD_TRG', true, 0.00, '2023-10-31 19:20:18.009842', '2023-10-31 19:20:18.009842', 21);
INSERT INTO parametros.tipo_parametro VALUES (77, 'Estado solicitud', 'Asigna el estado en el cual se encuentra la solicitud', 'EST_SOL', true, 0.00, '2023-10-31 21:28:17.501532', '2023-10-31 21:28:17.501532', 21);
INSERT INTO parametros.tipo_parametro VALUES (78, 'Tipo solicitud', 'Asigna el tipo de la solicitud', 'TIP_SOL', true, 0.00, '2023-11-01 17:49:01.034523', '2023-11-01 17:49:01.034523', 21);
INSERT INTO parametros.tipo_parametro VALUES (79, 'Estado Estudiante Trabajo Grado', 'Asigna el estado en el cual se encuentra el estudiante para el trabajo de grado', 'EST_ESTU_TRG', true, 0.00, '2023-11-02 13:43:10.419957', '2023-11-02 13:43:10.419957', 21);
INSERT INTO parametros.tipo_parametro VALUES (80, 'Estado Espacio Academico Inscrito', 'Asigna el estado en el cual se encuentra el espacio academico', 'EST_ESP', true, 0.00, '2023-11-02 14:14:12.055845', '2023-11-02 14:14:12.055845', 21);
INSERT INTO parametros.tipo_parametro VALUES (81, 'Estado Asignatura Trabajo Grado', 'Asigna el estado en el cual se encuentra la asignatura de trabajo grado', 'EST_ASIG_TRG', true, 0.00, '2023-11-14 00:15:25.384896', '2023-11-14 00:15:25.384896', 21);
INSERT INTO parametros.tipo_parametro VALUES (82, 'Distinción Trabajo Grado', 'Determina si el trabajo de grado ha tenido alguna distinción', 'DIST_TRG', true, 0.00, '2023-11-15 16:54:16.984779', '2023-11-15 16:54:16.984779', 21);
INSERT INTO parametros.tipo_parametro VALUES (83, 'Tipo Detalle', 'Asigna el tipo del detalle', 'TIP_DET', true, 0.00, '2023-11-15 17:02:37.814455', '2023-11-15 17:02:37.814455', 21);


--
-- TOC entry 6915 (class 0 OID 0)
-- Dependencies: 507
-- Name: area_tipo_id_seq; Type: SEQUENCE SET; Schema: parametros; Owner: -
--

SELECT pg_catalog.setval('parametros.area_tipo_id_seq', 21, true);


--
-- TOC entry 6916 (class 0 OID 0)
-- Dependencies: 511
-- Name: parametro_id_seq; Type: SEQUENCE SET; Schema: parametros; Owner: -
--

SELECT pg_catalog.setval('parametros.parametro_id_seq', 4674, true);


--
-- TOC entry 6917 (class 0 OID 0)
-- Dependencies: 537
-- Name: parametro_periodo_id_seq; Type: SEQUENCE SET; Schema: parametros; Owner: -
--

SELECT pg_catalog.setval('parametros.parametro_periodo_id_seq', 379, true);


--
-- TOC entry 6918 (class 0 OID 0)
-- Dependencies: 513
-- Name: periodo_id_seq; Type: SEQUENCE SET; Schema: parametros; Owner: -
--

SELECT pg_catalog.setval('parametros.periodo_id_seq', 40, true);


--
-- TOC entry 6919 (class 0 OID 0)
-- Dependencies: 509
-- Name: tipo_parametro_id_seq; Type: SEQUENCE SET; Schema: parametros; Owner: -
--

SELECT pg_catalog.setval('parametros.tipo_parametro_id_seq', 83, true);


--
-- TOC entry 6557 (class 2606 OID 49943)
-- Name: area_tipo pk_area_tipo; Type: CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.area_tipo
    ADD CONSTRAINT pk_area_tipo PRIMARY KEY (id);


--
-- TOC entry 6561 (class 2606 OID 49944)
-- Name: parametro pk_parametro; Type: CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro
    ADD CONSTRAINT pk_parametro PRIMARY KEY (id);


--
-- TOC entry 6565 (class 2606 OID 49945)
-- Name: parametro_periodo pk_parametro_periodo; Type: CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro_periodo
    ADD CONSTRAINT pk_parametro_periodo PRIMARY KEY (id);


--
-- TOC entry 6563 (class 2606 OID 49946)
-- Name: periodo pk_periodo; Type: CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.periodo
    ADD CONSTRAINT pk_periodo PRIMARY KEY (id);


--
-- TOC entry 6559 (class 2606 OID 49947)
-- Name: tipo_parametro pk_tipo_parametro; Type: CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.tipo_parametro
    ADD CONSTRAINT pk_tipo_parametro PRIMARY KEY (id);


--
-- TOC entry 6566 (class 2606 OID 51478)
-- Name: tipo_parametro fk_area_tipo; Type: FK CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.tipo_parametro
    ADD CONSTRAINT fk_area_tipo FOREIGN KEY (area_tipo_id) REFERENCES parametros.area_tipo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 6569 (class 2606 OID 51499)
-- Name: parametro_periodo fk_parametro; Type: FK CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro_periodo
    ADD CONSTRAINT fk_parametro FOREIGN KEY (parametro_id) REFERENCES parametros.parametro(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 6567 (class 2606 OID 51512)
-- Name: parametro fk_parametro_padre; Type: FK CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro
    ADD CONSTRAINT fk_parametro_padre FOREIGN KEY (parametro_padre_id) REFERENCES parametros.parametro(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 6570 (class 2606 OID 51520)
-- Name: parametro_periodo fk_periodo; Type: FK CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro_periodo
    ADD CONSTRAINT fk_periodo FOREIGN KEY (periodo_id) REFERENCES parametros.periodo(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 6568 (class 2606 OID 51529)
-- Name: parametro fk_tipo_parametro; Type: FK CONSTRAINT; Schema: parametros; Owner: -
--

ALTER TABLE ONLY parametros.parametro
    ADD CONSTRAINT fk_tipo_parametro FOREIGN KEY (tipo_parametro_id) REFERENCES parametros.tipo_parametro(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2023-12-21 15:43:32

--
-- PostgreSQL database dump complete
--

