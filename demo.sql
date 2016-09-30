create table stream(value string, t timestamp) row format delimited fields terminated by '\t' stored as textfile;
ALTER TABLE stream SET TBLPROPERTIES ('streaming.type'='socket', 'streaming.socket.host'='localhost', 'streaming.socket.port'='9999', 'streaming.socket.includeTimestamp'='true');
streaming select window(t, '3 seconds', '1 seconds'), count(*) from stream group by window(t, '3 seconds', '1 seconds');
