UPDATE registros_asistencia
SET 
  hora_salida = TIME(TIMESTAMPADD(HOUR, 8, CONCAT(fecha, ' ', hora_entrada))),
  info = IF(info IS NULL OR info = '', 'salida tardía automática', CONCAT(info, ', salida tardía automática'))
WHERE hora_salida IS NULL;
