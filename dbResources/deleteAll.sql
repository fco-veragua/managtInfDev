--------------------------------------------------------------------------------
--
-- BORRA TODOS LOS OBJETOS DE USUARIO ACTUAL
--
--------------------------------------------------------------------------------
SET TERMOUT ON;
SET SERVEROUTPUT ON;
PROMPT;
PROMPT;


DECLARE
	CURSOR uTables IS
		SELECT TABLE_NAME Tabla
		FROM USER_TABLES;

	CURSOR uViews IS
		SELECT VIEW_NAME Vista
		FROM USER_VIEWS;
		
	CURSOR uProcs IS
		SELECT OBJECT_NAME Proc
		FROM USER_PROCEDURES
        WHERE OBJECT_TYPE='PROCEDURE';
		
	CURSOR uFuncs IS
		SELECT OBJECT_NAME Func
		FROM USER_OBJECTS
        WHERE OBJECT_TYPE='FUNCTION';
		
	CURSOR uPacks IS
		SELECT OBJECT_NAME Pack
		FROM USER_OBJECTS
        WHERE OBJECT_TYPE='PACKAGE';

	CURSOR uSeqs IS
		SELECT OBJECT_NAME Seq
		FROM USER_OBJECTS
        WHERE OBJECT_TYPE='SEQUENCE';

	s	VARCHAR2(2000);

BEGIN
	DBMS_OUTPUT.PUT_LINE('Borrando todas las tablas, vistas, procedimientos, funciones, paquetes y secuencias');
	DBMS_OUTPUT.PUT_LINE('----------');
	
	FOR t IN uTables LOOP
		s := 'DROP TABLE ' || t.Tabla || ' CASCADE CONSTRAINTS';

		DBMS_OUTPUT.PUT_LINE(s);
		EXECUTE IMMEDIATE s;
	END LOOP;

	FOR t IN uViews LOOP
		s := 'DROP VIEW ' || t.Vista;

		DBMS_OUTPUT.PUT_LINE(s);
		EXECUTE IMMEDIATE s;
	END LOOP;

	FOR t IN uProcs LOOP
		s := 'DROP PROCEDURE ' || t.Proc;

		DBMS_OUTPUT.PUT_LINE(s);
		EXECUTE IMMEDIATE s;
	END LOOP;

	FOR t IN uFuncs LOOP
		s := 'DROP FUNCTION ' || t.Func;

		DBMS_OUTPUT.PUT_LINE(s);
		EXECUTE IMMEDIATE s;
	END LOOP;

	FOR t IN uPacks LOOP
		s := 'DROP PACKAGE ' || t.Pack;

		DBMS_OUTPUT.PUT_LINE(s);
		EXECUTE IMMEDIATE s;
	END LOOP;

	FOR t IN uSeqs LOOP
		s := 'DROP SEQUENCE ' || t.Seq;

		DBMS_OUTPUT.PUT_LINE(s);
		EXECUTE IMMEDIATE s;
	END LOOP;
END;
/

COMMIT;
