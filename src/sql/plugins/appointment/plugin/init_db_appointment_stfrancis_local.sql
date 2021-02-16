--
-- translate calendar titles and descriptions to english
--
UPDATE appointment_calendar_template SET title = 'Calendar' WHERE id_calendar_template = 1;
UPDATE appointment_calendar_template SET description = 'Calendar of available and unavailable slots' WHERE id_calendar_template = 1;
UPDATE appointment_calendar_template SET title = 'Calendar of open days' WHERE id_calendar_template = 2;
UPDATE appointment_calendar_template SET description = 'Calendar of available and unavailable slots (open days)' WHERE id_calendar_template = 2;
UPDATE appointment_calendar_template SET title = 'List of available slots' WHERE id_calendar_template = 3;
UPDATE appointment_calendar_template SET description = 'List of available slots' WHERE id_calendar_template = 3;
UPDATE appointment_calendar_template SET title = 'List of available slots (open days)' WHERE id_calendar_template = 4;
UPDATE appointment_calendar_template SET description = 'List of available slots on open days' WHERE id_calendar_template = 4;
