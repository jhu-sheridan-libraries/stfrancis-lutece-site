--
-- Data for table core_user_right
--
DELETE FROM core_user_right WHERE id_right = 'REGULAR_EXPRESSION_MANAGEMENT';
INSERT INTO core_user_right (id_right,id_user) VALUES ('REGULAR_EXPRESSION_MANAGEMENT',1);
