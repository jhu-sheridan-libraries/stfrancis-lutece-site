--
-- add appointment manager role and assign it to the admin user
--
INSERT INTO core_admin_role (role_key,role_description) VALUES ('appointment_manager','Appointment Manager');
INSERT INTO core_admin_role_resource (rbac_id,role_key,resource_type,resource_id,permission) VALUES (1027,'appointment_manager','APPOINTMENT_FORM','*','*');
INSERT INTO core_admin_role_resource (rbac_id,role_key,resource_type,resource_id,permission) VALUES (1028,'appointment_manager','APPOINTMENT_FORM_CREATE','*','*');
INSERT INTO core_user_role (role_key,id_user) VALUES ('appointment_manager',1);
