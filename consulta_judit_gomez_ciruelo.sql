SELECT m.modelo, 
	   b.marca, 
	   g.grupo, 
	   v.fecha_de_compra, 
	   v.matricula, 
	   c.color, 
	   v.km_total, 
	   s.aseguradora, 
	   p.num_poliza 
   FROM judit_gomez_ciruelo.grupo as g
   JOIN judit_gomez_ciruelo.marca as b on g.id_grupo = b.id_grupo  
   JOIN judit_gomez_ciruelo.modelo as m on b.id_marca = m.id_marca 
   JOIN judit_gomez_ciruelo.vehiculos as v on m.id_modelo = v.id_modelo
   JOIN judit_gomez_ciruelo.color as c on v.id_color = c.id_color
   JOIN judit_gomez_ciruelo.poliza as p on p.id_vehiculo = v.id_vehiculo 
   JOIN judit_gomez_ciruelo.seguro as s on p.id_aseguradora = s.id_aseguradora