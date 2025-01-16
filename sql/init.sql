BEGIN
 ords_admin.enable_schema(
  p_enabled => TRUE,
  p_schema => 'hr',
  p_url_mapping_type => 'BASE_PATH',
  p_url_mapping_pattern => 'hr',
  p_auto_rest_auth => NULL
 );
 commit;
END;
/

BEGIN
 ords_admin.enable_schema(
  p_enabled => TRUE,
  p_schema => 'sh',
  p_url_mapping_type => 'BASE_PATH',
  p_url_mapping_pattern => 'sh',
  p_auto_rest_auth => NULL
 );
 commit;
END;
/

BEGIN
 ords_admin.enable_schema(
  p_enabled => TRUE,
  p_schema => 'co',
  p_url_mapping_type => 'BASE_PATH',
  p_url_mapping_pattern => 'co',
  p_auto_rest_auth => NULL
 );
 commit;
END;
/

GRANT SODA_APP TO hr;

GRANT SODA_APP TO co;

GRANT SODA_APP TO sh;


CREATE USER admin IDENTIFIED BY "Welcome23ai";

GRANT DBA TO admin;

grant APEX_ADMINISTRATOR_ROLE to admin;

grant PDB_DBA to admin;

grant CDB_DBA to admin;

BEGIN
 ords_admin.enable_schema(
  p_enabled => TRUE,
  p_schema => 'admin',
  p_url_mapping_type => 'BASE_PATH',
  p_url_mapping_pattern => 'admin',
  p_auto_rest_auth => NULL
 );
 commit;
END;
/



create user ora23ai identified by ora23ai;

alter user ora23ai
   default tablespace users
   quota unlimited on users;

alter user ora23ai
   temporary tablespace temp;

grant connect,resource,db_developer_role,
   create mle
to ora23ai;

grant execute on javascript to ora23ai;

begin
   ords_admin.enable_schema(
      p_enabled             => true,
      p_schema              => 'ora23ai',
      p_url_mapping_type    => 'BASE_PATH',
      p_url_mapping_pattern => 'ora23ai',
      p_auto_rest_auth      => null
   );
   commit;
end;
/


ONNX config

-- grant
--    create any directory
-- to ora23ai;

-- grant
--    create mining model
-- to ora23ai;


-- create or replace directory demo_py_dir as '/tmp';

-- grant read,write on directory demo_py_dir to ora23ai;


-- --load model - make sure you have downloaded the model using the load_model_2_db script on ./model
-- begin
--    dbms_vector.drop_onnx_model(
--       model_name => 'all_MiniLM_L12_v2',
--       force      => true
--    );
--    dbms_vector.load_onnx_model(
--       directory  => 'DEMO_PY_DIR',
--       file_name  => 'all_MiniLM_L12_v2.onnx',
--       model_name => 'demo_model'
--    );
-- end;



commit;

exit;
