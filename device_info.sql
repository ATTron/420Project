set serveroutput on;
create or replace procedure SmartPlugInformation(plug_in in varchar2) is
  cursor plug_c is
  select device_id, type, description, wattage 
  from device 
  where device.plug_id = plug_in;
  plug_row plug_c%rowtype;
begin
  dbms_output.put_line('Device ID || Description ||  Type ||  Wattage');
  open plug_c;
  loop
  fetch plug_c into plug_row;
  exit when plug_c%notfound;
  dbms_output.put_line(plug_row.device_id||'  ||  '||plug_row.description||'  ||  '||plug_row.type|| '  ||  ' ||plug_row.wattage);
  end loop;
  close plug_c;
end;

Execute SMARTPLUGINFORMATION('08:AF:0C:6F');