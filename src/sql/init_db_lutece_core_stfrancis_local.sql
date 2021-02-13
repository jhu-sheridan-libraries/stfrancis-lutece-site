--
-- Local updates to set locale for admin users, default language for users, and portal locale
--
UPDATE core_admin_user SET locale = 'en' WHERE id_user = 1;
UPDATE core_admin_user SET locale = 'en' WHERE id_user = 2;
UPDATE core_admin_user SET locale = 'en' WHERE id_user = 3;
UPDATE core_admin_user SET locale = 'en' WHERE id_user = 4;
UPDATE core_datastore SET entity_value = 'en' WHERE entity_key = 'core.advanced_parameters.default_user_language';
UPDATE core_datastore SET entity_value = 'en' WHERE entity_key = 'portal.site.site_property.locale.default';
